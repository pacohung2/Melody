'''
Melody

Last edited: 18/4/2020

@author: Paco Hung
'''

from flask import Flask, render_template, request, session, redirect, url_for, flash
import pymysql
from forms import RegisterForm, AlbumForm, SongForm
import os

app = Flask(__name__)
app.secret_key = 'music'

#Declares the path for image uploads
app.config["IMAGE_UPLOADS"] = "static/images/albums"

#phypmyadmin database connection
db = pymysql.connect("localhost", "root", "admin", "MelodyDB")

#Function to render the home page
@app.route('/')
@app.route('/home')
def home():
    return render_template('home.html')

#Function to render the about page
@app.route('/about')
def about():
    return render_template('about.html')

#Function to log users in
@app.route('/login', methods = ['POST', 'GET'])
def login():
	if request.method == 'POST':
		#Takes data from the form in login.html
		username = request.form['username']
		passwordtest = request.form['password']

		cursor = db.cursor()

		#Attempts to find the username entered by the user in the database
		valid = cursor.execute("SELECT username, password FROM user_data WHERE username = %s", [username])

		#If the username is in the database
		if valid:
			user = cursor.fetchone()
			username = user[0]
			password = user[1]

			#Checks if the password entered matches the data in the database
			if passwordtest == user[1]:
				#Declares flask session as user
				session['username'] = username
				flash('Login successful. You may now access the library!', 'success')
				return redirect(url_for('home'))
			else:
				flash('Password and username do not match', 'danger')
				return redirect(url_for('login'))
		else:			
			flash('Username not found', 'danger')
			return redirect(url_for('login'))

	return render_template('login.html')

#Function to log out users
@app.route('/logout')
def logout():
	try:
		#Removes the session
		session.pop('username')
		flash('Logout successful. Come back soon!', 'warning')
		return render_template('home.html')

	#Can't logout without being logged in
	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('login'))

#Function to register a new account
@app.route('/register', methods = ['POST', 'GET'])
def register():
	form = RegisterForm(request.form)

	if request.method == 'POST' and form.validate():
		#Assigns the data from the form
		username = form.username.data
		password = form.password.data
		email = form.email.data
		firstname = form.firstname.data
		lastname = form.lastname.data

		cursor = db.cursor()

		try:
			#Inserts a new row into the user_data table
			cursor.execute("INSERT INTO user_data (username, password, email, first_name, last_name)\
			VALUES(%s, %s, %s, %s, %s)", (username, password, email, firstname, lastname))

			db.commit()
			flash('Registration successful! Login in access the library.', 'success')
			return redirect(url_for('home'))

		except Exception as e:
			flash('Username has already been taken', 'danger')
			db.rollback()
			return redirect(url_for('register'))

	return render_template('register.html', form = form)

#Function to render the library page
@app.route('/library/<order>')
def library(order):
	cursor = db.cursor()

	cursor.execute("SELECT name FROM genres")
	genres = cursor.fetchall()

	cursor.execute("SELECT YEAR(release_date) FROM albums GROUP BY YEAR(release_date) ORDER BY YEAR(release_date)")
	years = cursor.fetchall()


	cursor.execute("SELECT name FROM artists")
	artists = cursor.fetchall()

	#"Order" is how the albums are grouped
	if order == 'genre':
		cursor.execute("SELECT genres.name, albums.id, albums.image, albums.title, YEAR(albums.release_date), artists.name\
					FROM albums\
					LEFT JOIN artists\
					ON albums.artist_id = artists.id\
					LEFT JOIN genres\
					ON albums.genre_id = genres.id\
					ORDER BY genres.name, albums.title")

		content = cursor.fetchall()

	elif order == 'year':
		cursor.execute("SELECT genres.name, albums.id, albums.image, albums.title, YEAR(albums.release_date), artists.name\
					FROM albums\
					LEFT JOIN artists\
					ON albums.artist_id = artists.id\
					LEFT JOIN genres\
					ON albums.genre_id = genres.id\
					ORDER BY YEAR(albums.release_date), albums.title")

		content = cursor.fetchall()

	else:
		cursor.execute("SELECT genres.name, albums.id, albums.image, albums.title, YEAR(albums.release_date), artists.name\
					FROM albums\
					LEFT JOIN artists\
					ON albums.artist_id = artists.id\
					LEFT JOIN genres\
					ON albums.genre_id = genres.id\
					ORDER BY artists.name, albums.title")

		content = cursor.fetchall()

	return render_template('library.html', order = order, genres = genres, years = years, artists = artists, content = content)

#Function to render the album page
@app.route('/album/<id>')
def album(id):
	try:
		cursor = db.cursor()

		cursor.execute("SELECT albums.id, albums.image, albums.title, artists.name, artists.members, albums.release_date, genres.name\
						FROM albums\
						LEFT JOIN artists\
						ON albums.artist_id = artists.id\
						LEFT JOIN genres\
						ON albums.genre_id = genres.id\
						WHERE albums.id = %s", (id))

		album = cursor.fetchone()

		image = album[1]
		title = album[2]
		artist = album[3]
		members = album[4]
		release_date = album[5]
		genre = album[6]

		#Fetches the list of songs in the album
		cursor.execute("SELECT id, title, length FROM songs WHERE album_id = %s", (id))

		songs = cursor.fetchall()

		return render_template('album.html', image = image, id = id, title = title, artist = artist, members = members, release_date = release_date, genre = genre, songs = songs)

	#If an album with the supplied id is not found
	except TypeError:
		flash('Album does not exist!', 'danger')
		return redirect(url_for('home'))

#Function to add a new album to the database
@app.route('/addalbum/', methods = ['POST', 'GET'])
def addalbum():
	form = AlbumForm(request.form)

	cursor = db.cursor()

	#Fetches the lists of artists and genres to select from in the form, because they are foreign keys

	cursor.execute("SELECT id, name from artists")

	artists = cursor.fetchall()

	form.artist_id.choices = [(a[0], a[1]) for a in artists]

	cursor.execute("SELECT id, name from genres")

	genres = cursor.fetchall()

	form.genre_id.choices = [(g[0], g[1]) for g in genres]

	if request.method == "POST" and form.validate():
		image = request.files['image']
		title = request.form['title']
		artist_id = request.form['artist_id']
		release_date = request.form['release_date']
		genre_id = request.form['genre_id']

		try:
			cursor.execute("INSERT INTO albums (image, title, artist_id, release_date, genre_id) VALUES (%s, %s, %s, %s, %s)",\
						    (image.filename, title, artist_id, release_date, genre_id))

			#Saves the image uploaded by the user to the "albums" folder
			image.save(os.path.join(app.config["IMAGE_UPLOADS"], image.filename))

			db.commit()

			flash('Album added!', 'success')
			return redirect(url_for('library', order = 'genre'))

		except Exception as e:
			app.logger.info(e)
			db.rollback()
			return redirect(url_for('home'))

	return render_template('addalbum.html', form = form, artists = artists, genres = genres)

#Function to edit album details, similar to addalbum(), but uses UPDATE instead of INSERT
@app.route('/editalbum/<id>', methods = ['POST', 'GET'])
def editalbum(id):
	try:
		form = AlbumForm(request.form)

		cursor = db.cursor()

		cursor.execute("SELECT id, name from artists")

		artists = cursor.fetchall()

		form.artist_id.choices = [(a[0], a[1]) for a in artists]

		cursor.execute("SELECT id, name from genres")

		genres = cursor.fetchall()

		form.genre_id.choices = [(g[0], g[1]) for g in genres]

		cursor.execute("SELECT title, artist_id, release_date, genre_id\
							   FROM albums WHERE id = %s", (id))

		album = cursor.fetchone()

		#To show the existing album details
		form.title.data = album[0]
		form.artist_id.data = album[1]
		form.release_date.data = album[2]
		form.genre_id.data = album[3]

		if request.method == "POST" and form.validate():
			image = request.files['image']
			title = request.form['title']
			artist_id = request.form['artist_id']
			release_date = request.form['release_date']
			genre_id = request.form['genre_id']

			app.logger.info(type(artist_id))

			try:
				cursor.execute("UPDATE albums SET image = %s, title = %s, artist_id = %s, release_date = %s, genre_id = %s WHERE id = %s",\
							    (image.filename, title, artist_id, release_date, genre_id, id))

				db.commit()

				image.save(os.path.join(app.config["IMAGE_UPLOADS"], image.filename))
				flash('Album details edited!', 'success')
				return redirect(url_for('album', id = id))

			except:
				flash('Error', 'danger')
				db.rollback()
				return redirect(url_for('album', id = id))

		return render_template('editalbum.html', id = id, form = form, artists = artists, genres = genres)

	except TypeError:
		flash('Album does not exist!', 'danger')
		return redirect(url_for('home'))

#Function to remove an album from the database
@app.route('/removealbum/<id>')
def removealbum(id):
	try:
		x = session['username']

		cursor = db.cursor()

		#Deletes associated songs
		cursor.execute("DELETE FROM songs WHERE album_id = %s", (id))

		cursor.execute("SELECT image FROM albums WHERE id = %s", (id))

		filename = cursor.fetchone()

		cursor.execute("DELETE FROM albums WHERE id = %s", (id))

		#Removes the album image from the "albums" folder
		os.remove(os.path.join(app.config["IMAGE_UPLOADS"], filename[0]))

		db.commit()

		flash('Removed album', 'warning')

		return redirect(url_for('library', order = 'genre'))

	except TypeError:
		flash('Album does not exist!', 'danger')
		return redirect(url_for('home'))

	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('login'))

	except:
		return redirect(url_for('home'))

#Function to render the song page
@app.route('/song/<id>')
def song(id):
	try:
		cursor = db.cursor()

		cursor.execute("SELECT albums.title, songs.title, songs.lyrics, songs.length, songs.video FROM songs\
						LEFT JOIN albums ON songs.album_id = albums.id\
						WHERE songs.id =%s", (id))

		song = cursor.fetchone()

		album = song[0]
		title = song[1]
		lyrics = song[2]
		length = song[3]
		video = song[4]

		fav = False

		try:
			cursor.execute("SELECT song_id FROM favorites WHERE username = %s", (session['username']))

		except KeyError:
			flask ('You must be logged in first!', 'danger')
			return redirect(url_for('login'))

		favorites = cursor.fetchall()

		#Checks if the song is one of the user's favorites
		for f in favorites:
			if int(id) == f[0]:
				fav = True

		return render_template('song.html', id = id, album = album, title = title, lyrics = lyrics, length = length, video = video,fav = fav)

	except TypeError:
		flash('Song does not exist!', 'danger')
		return redirect(url_for('home'))

#Function to add a new song to the album that has "id"
@app.route('/addsong/<id>', methods = ['POST', 'GET'])
def addsong(id):
	form = SongForm(request.form)

	cursor = db.cursor()

	if request.method == "POST" and form.validate():
		album_id = id
		title = form.title.data
		lyrics = form.lyrics.data
		length = form.length.data
		video = form.video.data

		try:
			cursor.execute("INSERT INTO songs (album_id, title, lyrics, length, video)\
			VALUES(%s, %s, %s, %s, %s)", (album_id, title, lyrics, length, video))

			db.commit()
			flash('New song added!', 'success')
			return redirect(url_for('album', id = id))

		except Exception as e:
			flash(e, 'danger')
			db.rollback()
			return redirect(url_for('album', id = id))

	return render_template('addsong.html', id = id, form = form)

#Function to edit a song details
@app.route('/editsong/<id>', methods = ['POST', 'GET'])
def editsong(id):
	try:
		form = SongForm(request.form)

		cursor = db.cursor()

		cursor.execute("SELECT title, lyrics, length, video\
							   FROM songs WHERE id = %s", (id))

		song = cursor.fetchone()

		#To show the existing song details
		form.title.data = song[0]
		form.lyrics.data = song[1]
		form.length.data = song[2]
		form.video.data = song[3]

		if request.method == "POST" and form.validate():
			title = request.form['title']
			lyrics = request.form['lyrics']
			length = request.form['length']
			video = request.form['video']

			try:
				cursor.execute("UPDATE songs SET title = %s, lyrics = %s, length = %s, video = %s WHERE id = %s",\
							    (title, lyrics, length, video, id))

				db.commit()
				flash('Song details edited!', 'success')
				return redirect(url_for('song', id = id))

			except:
				flash('Error', 'danger')
				db.rollback()
				return redirect(url_for('album', id = id))

		return render_template('editsong.html', id = id, form = form)

	#If a song with the supplied id does not exist
	except TypeError:
		flash('Song does not exist!', 'danger')
		return redirect(url_for('home'))

#Function to remove a song from an album
@app.route('/removesong/<id>')
def removesong(id):
	try:
		x = session['username']

		cursor = db.cursor()

		cursor.execute("SELECT album_id FROM songs WHERE id = %s", (id))

		album_id = cursor.fetchone()

		cursor.execute("DELETE FROM songs WHERE id = %s", (id))

		db.commit()

		flash('Removed song', 'warning')
		return redirect(url_for('album', id = album_id[0]))

	except TypeError:
		flash('Song does not exist!', 'danger')
		return redirect(url_for('home'))

	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('login'))

#Function to add a song to the user's list of favorites
@app.route('/addfavorite/<id>')
def addfavorite(id):
	try:
		cursor = db.cursor()

		cursor.execute("INSERT INTO favorites (username, song_id) VALUES (%s, %s)", (session['username'], id))

		db.commit()

		flash('Added to your favorites!', 'success')
		return redirect(url_for('song', id = id))

	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('login'))

#Function to remove a song from the user's list of favorites
@app.route('/removefavorite/<id>')
def removefavorite(id):
	try:
		cursor = db.cursor()

		cursor.execute("DELETE FROM favorites WHERE username = %s AND song_id = %s", (session['username'], id))

		db.commit()

		flash('Removed from your favorites', 'warning')
		return redirect(url_for('song', id = id))

	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('long'))

#Function to render the user's profile page
@app.route('/profile')
def profile():
	try:
		cursor = db.cursor()

		cursor.execute("SELECT * FROM user_data WHERE username = %s", (session['username']))

		profile = cursor.fetchone()

		username = profile[0]
		password = profile[1]
		email = profile[2]
		firstname = profile[3]
		lastname = profile[4]

		#Fetches a list of the user's favorites
		cursor.execute("SELECT songs.id, songs.title, songs.length FROM songs\
						LEFT JOIN favorites ON favorites.song_id = songs.id\
						WHERE favorites.username = %s", (session['username']))

		favorites = cursor.fetchall()

		return render_template('profile.html', username = username, password = password, email = email, firstname = firstname, lastname = lastname, favorites = favorites)

	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('login'))

#Function to render the page for changing passwords
@app.route('/changepassword', methods = ['POST', 'GET'])
def changepassword():
	try:
		if request.method == 'POST':
			oldpass = request.form['oldpass']
			newpass = request.form['newpass']

			cursor = db.cursor()

			#Checks if the user's current password is valid
			cursor.execute("SELECT password FROM user_data WHERE username = %s", session['username'])

			valid = cursor.fetchone()

			if valid[0] == oldpass:
				cursor.execute("UPDATE user_data SET password = %s WHERE username = %s", (newpass, session['username']))
				db.commit()
				flash ('Password succesfully changed!', 'success')
				return redirect(url_for('profile'))
			else:			
				flash('Old password is incorrect.', 'danger')
				return redirect(url_for('changepassword'))

		return render_template('changepassword.html')

	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('login'))

#Function to remove the user's account
@app.route('/deleteaccount')
def deleteaccount():
	try:
		cursor = db.cursor()

		cursor.execute("DELETE FROM user_data WHERE username = %s", (session['username']))

		db.commit()

		#Removes the user's favorite songs from the "favorites" database
		cursor.execute("DELETE FROM favorites WHERE username = %s", (session['username']))

		db.commit()

		#Logs the user out
		session.pop('username')

		flash('Account successfully deleted...', 'danger')
		return render_template('home.html')

	except KeyError:
		flash('You must be logged in first!', 'danger')
		return redirect(url_for('login'))

#For any remaining invalid URLs
@app.errorhandler(404)
def pagenoutfound():
	flash ('Page not found...', 'danger')
	return redirect(url_for('home'))

if __name__ == '__main__':
    app.run()