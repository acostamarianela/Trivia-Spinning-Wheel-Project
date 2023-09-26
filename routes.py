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
        
        if idJugador is not None and cantidadRespuestasCorrectas is not None:
            # Convierte la ID del jugador y la cantidad de respuestas correctas a entero
            idJugador = int(idJugador)
            cantidadRespuestasCorrectas = int(cantidadRespuestasCorrectas)
            controlador = jugadoresController()
            # Obtén el puntaje actual del jugador desde la base de datos
            puntaje_actual = controlador.obtenerPuntaje(idJugador)
            print(f"Puntaje actual: {puntaje_actual}")

            # Suma la cantidad de respuestas correctas al puntaje actual
            puntaje_actual += 1

            # Actualiza el puntaje en la base de datos
            resultado = controlador.actualizarPuntaje(idJugador, puntaje_actual)
            print(f"Puntaje después de la actualización: {puntaje_actual}")

            if resultado:
                return jsonify({"message": "Puntaje actualizado correctamente"})
            else:
                return jsonify({"error": "Error al actualizar el puntaje"})
        else:
            return jsonify({"error": "Datos incompletos"})
    except Exception as e:
        return jsonify({"error": str(e)})



@app.route('/obtenerPuntaje', methods=['GET'])
def obtenerPuntaje():
    idJugador = request.args.get('idJugador')
    print(f'idJugadorOBTENER {idJugador}')
    try:
        controlador = jugadoresController()
        puntaje = controlador.obtenerPuntaje(idJugador)
        if puntaje is not None:
            print(f'holaROUTES {puntaje}') 
            return jsonify({"idJugador": idJugador, "puntaje": puntaje})
        else:
            return jsonify({"error": "Puntaje no encontrado"})  # Devuelve un mensaje de error en formato JSON
    except Exception as e:
        # Manejar cualquier excepción que pueda ocurrir
        return jsonify({"error": str(e)})

@app.route('/listarJugadores')
def listarJugadores():
    # Crea una instancia del controlador de jugadores
    controlador = jugadoresController()

    # Llama al método para obtener la lista de jugadores desde el controlador
    jugadores = controlador.listarJugadores()

    # Renderiza la plantilla HTML y pasa los datos de los jugadores como argumento
    return render_template('jugadores.html', jugadores=jugadores)

