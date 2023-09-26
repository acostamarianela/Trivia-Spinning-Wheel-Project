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
    
    def listPreguntasPorCategoria(self, categoria, idJugador):
        with self.database.cursor() as cursor:
            # Consulta para obtener una pregunta aleatoria que aún no ha sido respondida por el usuario
            consulta = """
            SELECT p.descripcionPregunta
            FROM preguntas p
            JOIN categoria c ON p.idCategoria = c.idCategoria
            LEFT JOIN preguntasrespondidas pr ON p.idPregunta = pr.idPregunta AND pr.idJugador = %s
            WHERE c.descripcionCategoria = %s
            AND pr.idPregunta IS NULL  -- Verifica que el usuario no haya respondido esta pregunta
            ORDER BY RAND()
            LIMIT 1
            """

            cursor.execute(consulta, (idJugador, categoria,))
            fila = cursor.fetchone()
            if fila:
                preguntaAleatoria = fila[0]
            else:
                preguntaAleatoria = None
        print(preguntaAleatoria)
        if preguntaAleatoria:
            # Una vez que tengas la pregunta aleatoria, registra que el usuario la ha respondido
            with self.database.cursor() as cursor:
                # Inserta un registro en la tabla respuestas_usuario para marcar que el usuario ha respondido esta pregunta
                insertarRespuestaJugador = """
                INSERT INTO preguntasrespondidas (idJugador, idPregunta)
                SELECT %s, p.idPregunta
                FROM preguntas p
                WHERE p.descripcionPregunta = %s
                """
                cursor.execute(insertarRespuestaJugador, (idJugador, preguntaAleatoria))
                self.database.commit()
                
            # Luego, busca todas las respuestas asociadas a la pregunta
            with self.database.cursor() as cursor:
                consultaRespuestas = """
                SELECT r.descripcionRespuesta, r.correcta
                FROM respuestas r
                JOIN preguntas p ON r.idPregunta = p.idPregunta
                WHERE p.descripcionPregunta = %s
                """
                cursor.execute(consultaRespuestas, (preguntaAleatoria,))
                respuestas = []
                for fila in cursor.fetchall():
                    respuesta, correcta = fila
                    respuestas.append({
                        'descripcionRespuesta': respuesta,
                        'correcta': bool(correcta)
                    })
        else:
            respuestas = []

        return preguntaAleatoria, respuestas
