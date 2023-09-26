from flask import render_template, request, redirect, url_for
from config import app
from controllers.preguntasController import *
from controllers.jugadoresController import jugadoresController 
from flask import jsonify

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/pregunta', methods=['GET'])
def obtenerPreguntas():
    categoria = request.args.get('categoria')
    idJugador = request.args.get('idJugador')
    print(idJugador)
    preguntas = PreguntasController()
    pregunta, respuestas = preguntas.getPreguntasPorCategoria(categoria, idJugador)
    return render_template('pregunta.html', pregunta=pregunta, respuestas=respuestas, idJugador=idJugador)


@app.route('/ruleta/<int:idJugador>')
def ruleta(idJugador):
    print(f'HOLA {idJugador}')
    print(type(idJugador))
    return render_template('ruleta.html', idJugador=idJugador)

@app.route("/insertarJugador", methods=["POST"])
def insertarJugador():
    nombre = request.form.get('nombre')
    apellido = request.form.get('apellido')

    if nombre and apellido:
        controlador = jugadoresController()
        idJugador = controlador.insertarJugador(nombre, apellido)
        #print(idJugador)
        if idJugador is not None and isinstance(idJugador, int):
            # Redirige al usuario a la página de la ruleta y pasa el ID del jugador como parámetro
            return redirect(url_for('ruleta', idJugador=idJugador))
        else:
            # Manejar el caso en que el ID del jugador no sea válido
            return jsonify({"error": "ID de jugador no válido"})

@app.route("/actualizarPuntaje", methods=["POST"])
def actualizarPuntaje():
    try:
        idJugador = request.form.get("idJugador")

        cantidadRespuestasCorrectas = request.form.get("cantidadRespuestasCorrectas")
        print(idJugador)
        if idJugador is not None and cantidadRespuestasCorrectas is not None:
            # Convierte la ID del jugador a un entero (si es necesario)
            idJugador = int(idJugador)

            # Crea una instancia del controlador de jugadores
            controlador = jugadoresController()

            # Llama al controlador para actualizar el puntaje del jugador
            resultado = controlador.actualizarPuntaje(idJugador, cantidadRespuestasCorrectas)

            return jsonify({"message": resultado})
        else:
            return jsonify({"error": "Datos incompletos"})
    except Exception as e:
        return jsonify({"error": str(e)})
