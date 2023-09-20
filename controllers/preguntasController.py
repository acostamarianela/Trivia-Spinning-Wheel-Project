from models.preguntasModel import PreguntasModel
from flask import flash, redirect, url_for
import random
from config import app, mysql

class PreguntasController:
    def __init__(self):
        self.preguntasModel = PreguntasModel()
        self.error = None


    def getPreguntasPorCategoria(self, categoria):
        # Esta función podría consultar una base de datos u otro origen de datos
        # para obtener preguntas según la categoría y devolverlas en una lista.
        # Aquí simulamos preguntas de ejemplo.
        
        categoria = int(categoria)
        if categoria == 0:
            categoria = 'MUSICA INTERNACIONAL'
        elif categoria == 1:
            categoria = 'MUSICA NACIONAL'
        elif categoria == 2:
            categoria = 'GENERO'
        elif categoria == 3:
            categoria = 'LANZAMIENTOS'
        else:
            return []

        preguntas = self.preguntasModel.listPreguntasPorCategoria(categoria)

        print(preguntas)
        return preguntas
