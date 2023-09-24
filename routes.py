from flask import render_template, request, redirect, url_for
from config import app
from controllers.preguntasController import *
from controllers.jugadoresController import jugadoresController 
from flask import jsonify
from flask_login import current_user  # Importa current_user desde Flask-Login

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

@app.route("/insertarJugador", methods=["POST"])
def insertarJugador():
    nombre = request.form.get('nombre')
    apellido = request.form.get('apellido')

    if nombre and apellido:
        controlador = jugadoresController()
        idJugador = controlador.insertarJugador(nombre, apellido)

        if idJugador is not None:
            # Redirige al usuario a la página de la ruleta y pasa el ID del jugador como parámetro
            return redirect(url_for('ruleta', idJugador = idJugador))
        
    # Manejar el caso en que la inserción falló o los datos no estaban completos
    return jsonify({"error": "Error al insertar jugador o datos incompletos"})


@app.route("/actualizarPuntaje", methods=["POST"])
def actualizarPuntaje():
    try:
        # Obtén el ID del jugador desde donde lo hayas almacenado (por ejemplo, en una cookie o variable de sesión)
        # Reemplaza 'obtenerIdJugador()' con la lógica real para obtener el ID del jugador
        idJugador = obtenerIdJugador()  # Reemplaza esto con tu lógica real

        if idJugador is not None:
            cantidadRespuestasCorrectas = request.form.get("cantidadRespuestasCorrectas")

            # Crea una instancia del controlador de jugadores
            controlador = jugadoresController()

            # Llama al controlador para actualizar el puntaje del jugador
            resultado = controlador.actualizarPuntaje(idJugador, cantidadRespuestasCorrectas)

            return jsonify({"message": resultado})
        else:
            return jsonify({"error": "ID del jugador no válido"})
    except Exception as e:
        return jsonify({"error": str(e)})