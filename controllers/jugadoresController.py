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
        # Llama al método del modelo para insertar un nuevo jugador
        self.jugadoresModel.insertarJugador(nombre, apellido)

    def actualizarPuntajeJugador(self, idJugador, cantidadRespuestasCorrectas):
        # Llamar al método del modelo para actualizar el puntaje de un jugador.
        self.jugadoresModel.actualizarPuntajeJugador(idJugador, cantidadRespuestasCorrectas)
