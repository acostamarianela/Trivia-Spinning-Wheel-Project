from functools import wraps
from flask import render_template, jsonify, request
from config import app
from controllers.preguntasController import *

@app.route('/pregunta', methods=['GET'])
def obtenerPreguntas():
    categoria = request.args.get('categoria')
    preguntas = PreguntasController()
    preguntaAleatoria = preguntas.getPreguntasPorCategoria(categoria)
    return jsonify({"pregunta": preguntaAleatoria})


@app.route('/')
def ruleta():
    return render_template('ruleta.html')

