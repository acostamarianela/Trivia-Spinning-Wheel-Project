from models.preguntasModel import PreguntasModel
from flask import flash, redirect, url_for

class PreguntasController:
    def __init__(self):
        self.preguntas_model = PreguntasModel()
        self.error = None
        self.error_messages = []

    def GetPreguntas(self):
        listPreguntas = self.preguntas_model.listPreguntas()
        return listPreguntas
