from functools import wraps
from flask import render_template, session, redirect, url_for, request
from config import app

@app.route('/preguntas')
def pregunta():
    return render_template('pregunta.html')

@app.route('/')
def ruleta():
    return render_template('ruleta.html')

