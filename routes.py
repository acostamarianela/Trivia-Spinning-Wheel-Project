from flask import render_template, request, redirect, url_for
from config import app
from controllers.preguntasController import *
from controllers.jugadoresController import jugadoresController 

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/pregunta', methods=['GET'])
def obtenerPreguntas():
    categoria = request.args.get('categoria')
    preguntas = PreguntasController()
    pregunta, respuestas = preguntas.getPreguntasPorCategoria(categoria)
    return render_template('pregunta.html', pregunta=pregunta, respuestas=respuestas)

@app.route('/ruleta')
def ruleta():
    return render_template('ruleta.html')

@app.route('/insertarJugador', methods=['POST'])
def insertarJugador():
    nombre = request.form.get('nombre')
    apellido = request.form.get('apellido')

    if nombre and apellido:
        controlador = jugadoresController()
        controlador.insertarJugador(nombre, apellido)
    
    return redirect(url_for('ruleta'))

