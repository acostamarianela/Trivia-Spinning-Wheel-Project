from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__, template_folder='templates')
app.secret_key = 'mysecretkey'

# MySQL Connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'triviamusical'
mysql = MySQL(app)
