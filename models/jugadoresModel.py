from config import mysql

class jugadoresModel():
    #Constructor de la clase Jugadores.
    def __init__(self):
        self.database = mysql.connection


    def listJugadores(self):
        #Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:
            
            sqlListarJugadores = "SELECT * FROM jugadores;"
            cursor.execute(sqlListarJugadores)
            
            # Guardar en la variable resultados todos los resultados devueltos por la consulta.
            resultados = cursor.fetchall()
        return resultados
    
    def insertarJugador(self, nombre, apellido):
        try:
            with self.database.cursor() as cursor:
                sqlInsertarJugador = "INSERT INTO jugadores (nombreJugador, apellidoJugador, CantidadRespuestasCorrectas) VALUES (%s, %s, 0);"
                cursor.execute(sqlInsertarJugador, (nombre, apellido))
                self.database.commit()
        except Exception as e:
            # Manejar el error, por ejemplo, imprimir un mensaje de error o realizar un rollback si es necesario.
            print("Error al insertar jugador:", str(e))

    def actualizarPuntajeJugador(self, idJugador, cantidadRespuestasCorrectas):
        try:
            with self.database.cursor() as cursor:
                sqlActualizarPuntaje = "UPDATE jugadores SET CantidadRespuestasCorrectas = %s WHERE idJugador = %s;"
                cursor.execute(sqlActualizarPuntaje, (cantidadRespuestasCorrectas, idJugador))
                self.database.commit()
        except Exception as e:
            # Manejar el error, por ejemplo, imprimir un mensaje de error o realizar un rollback si es necesario.
            print("Error al actualizar puntaje del jugador:", str(e))


