'''
For classes used in WTForms
'''
from wtforms import Form, StringField, PasswordField, RadioField, BooleanField, TextAreaField, FileField, SelectField, DateField, SubmitField, validators

class RegisterForm(Form):
	username = StringField("Username*",[validators.Required()])
	password = PasswordField("Password*",[validators.Required(), validators.Length(min=6, max=12), validators.EqualTo('confirmpass', message="Passwords must match.")])
	confirmpass = PasswordField("Confirm password*", [validators.Required()])
	email = StringField("Email address",[validators.Required(), validators.Email(message="Please enter a valid email address.")])
	firstname = StringField("First name")
	lastname = StringField("Last name")
	submit = SubmitField("Register")

class AlbumForm(Form):
	title = StringField("Title*", [validators.Required()])
	artist_id = SelectField("Artist*", coerce = int)
	release_date = DateField("Release Date*", format = '%Y-%m-%d')
	genre_id = SelectField("Genre*", coerce = int)
	submit = SubmitField("Submit")

class SongForm(Form):
	title = StringField("Title*", [validators.Required()])
	lyrics = TextAreaField("Lyrics")
	length = StringField("Length")
	video = StringField("Video (YouTube embed link)")
	submit = SubmitField("Submit")