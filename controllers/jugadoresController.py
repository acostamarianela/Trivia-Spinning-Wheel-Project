from models.jugadoresModel import jugadoresModel
from flask import flash, redirect, url_for
from config import app, mysql

class jugadoresController:
    def __init__(self):
        self.jugadoresModel = jugadoresModel()
        self.error = None

    def listarJugadores(self):
        # Llamar al método del modelo para listar jugadores.
        jugadores = self.jugadoresModel.listJugadores()
        
    def insertarJugador(self, nombre, apellido):
        try:
            # Llama al método del modelo para insertar un nuevo jugador y obtén el ID insertado
            idJugador = self.jugadoresModel.insertarJugador(nombre, apellido)
            if idJugador is not None:
                return idJugador  # Devuelve el ID del jugador como valor entero
            else:
                # Manejar el caso en que la inserción falló
                return None
        except Exception as e:
            # Manejar cualquier excepción que pueda ocurrir
            return None



    def actualizarPuntaje(self, idJugador, cantidadRespuestasCorrectas):  # Agrega 'self' como primer parámetro
        try:
            # Llama al modelo para actualizar el puntaje
            self.jugadoresModel.actualizarPuntaje(idJugador, cantidadRespuestasCorrectas)  # Usa 'self' para acceder al modelo
            return "Puntaje actualizado correctamente"
        except Exception as e:
            # Manejar cualquier excepción que pueda ocurrir
            return str(e)
