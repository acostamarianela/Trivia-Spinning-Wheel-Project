from functools import wraps
from flask import render_template, session, redirect, url_for, request
from config import app

@app.route('/')
def ruleta():
    return render_template('/views/ruleta.html')

