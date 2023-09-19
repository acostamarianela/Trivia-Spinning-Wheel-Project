#rom models.preguntasModel import PreguntasModel
from flask import flash, redirect, url_for
import random
from config import app, mysql

class PreguntasController:
    def __init__(self):
        #self.preguntas_model = PreguntasModel()
        self.error = None

    def getPreguntas(self):
        preguntas_db = {
    0: ["Pregunta 1 de Categoría 0", "Pregunta 2 de Categoría 0"],
    1: ["Pregunta 1 de Categoría 1", "Pregunta 2 de Categoría 1"],
    2: ["Pregunta 1 de Categoría 2", "Pregunta 2 de Categoría 2"],
    3: ["Pregunta 1 de Categoría 3", "Pregunta 2 de Categoría 3"],
}
        return preguntas_db
    
    def consultaCategoria(self):
        try:
            # Utiliza la conexión MySQL en lugar de SQLite
            cursor = mysql.connection.cursor()
            # La sentencia SELECT se almacena en el cursor
            cursor.execute("SELECT * FROM clientes")
            # Devuelve todos los registros de la tabla clientes
            result = cursor.fetchall()
            print(result)
            cursor.close()  # Cierra el cursor
        except Exception as e:
            print("Error executing SQL query:", e)

    def getPreguntasPorCategoria(self, categoria):
        # Esta función podría consultar una base de datos u otro origen de datos
        # para obtener preguntas según la categoría y devolverlas en una lista.
        # Aquí simulamos preguntas de ejemplo.
        preguntas = self.getPreguntas()
        categoria = int(categoria)
        if categoria == 0:
            preguntaAleatoria = random.choice(preguntas[0])
            return preguntaAleatoria
        elif categoria == 1:
            preguntaAleatoria = random.choice(preguntas[1])
            return preguntaAleatoria
        elif categoria == 2:
            preguntaAleatoria = random.choice(preguntas[2])
            return preguntaAleatoria
        elif categoria == 3:
            preguntaAleatoria = random.choice(preguntas[3])
            return preguntaAleatoria
        else:
            return []