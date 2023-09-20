from datetime import datetime
from config import mysql

class PreguntasModel:
    # Constructor de la clase Clientes.
    def __init__(self):
        self.database = mysql.connection

    def listPreguntas(self):
        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:

            sqlListarPreguntas = "SELECT p.*, c.descripcionCategoria FROM preguntas p JOIN categoria c ON p.idCategoria = c.idCategoria;"
            cursor.execute(sqlListarPreguntas)

            # Guardar en la variable resultados todos los resultados devueltos por la consulta.
            resultados = cursor.fetchall()
            print(resultados)

        return resultados
    
    def listPreguntasPorCategoria(self, categoria):
        with self.database.cursor() as cursor:
            consulta = """
            SELECT p.descripcionPregunta
            FROM preguntas p
            JOIN categoria c ON p.idCategoria = c.idCategoria
            WHERE c.descripcionCategoria = %s
            ORDER BY RAND()
            LIMIT 1
            """
            cursor.execute(consulta, (categoria,))
            fila = cursor.fetchone()
            if fila:
                pregunta_aleatoria = fila[0]
            else:
                pregunta_aleatoria = None

        if pregunta_aleatoria:
            # Una vez que tengas la pregunta aleatoria, busca todas sus respuestas
            with self.database.cursor() as cursor:
                consulta_respuestas = """
                SELECT r.descripcionRespuesta, r.correcta
                FROM respuestas r
                JOIN preguntas p ON r.idPregunta = p.idPregunta
                WHERE p.descripcionPregunta = %s
                """
                cursor.execute(consulta_respuestas, (pregunta_aleatoria,))
                respuestas = []
                for fila in cursor.fetchall():
                    respuesta, correcta = fila
                    respuestas.append({
                        'descripcionRespuesta': respuesta,
                        'correcta': bool(correcta)
                    })
        else:
            respuestas = []

        return pregunta_aleatoria, respuestas