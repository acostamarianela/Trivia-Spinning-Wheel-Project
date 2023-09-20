from functools import wraps
from flask import render_template, jsonify, request
from config import app
from controllers.preguntasController import *

@app.route('/pregunta', methods=['GET'])
def obtenerPreguntas():
    categoria = request.args.get('categoria')
    preguntas = PreguntasController()
    pregunta, respuestas = preguntas.getPreguntasPorCategoria(categoria)
    #print(preguntaAleatoria)
    return render_template('pregunta.html', pregunta=pregunta, respuestas=respuestas)


@app.route('/')
def ruleta():
    return render_template('ruleta.html')

