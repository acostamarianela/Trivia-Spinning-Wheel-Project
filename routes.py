from functools import wraps
from flask import render_template, session, redirect, url_for, request
from config import app

@app.route('/')
def pregunta():
    return render_template('pregunta.html')

@app.route('/ruleta')
def ruleta():
    return render_template('ruleta.html')

