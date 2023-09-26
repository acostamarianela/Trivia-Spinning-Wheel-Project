from config import mysql

class jugadoresModel():
    #Constructor de la clase Jugadores.
    def __init__(self):
        self.database = mysql.connection

    def listarJugadores(self):
        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:
            sqlListarJugadores = "SELECT * FROM jugadores;"
            cursor.execute(sqlListarJugadores)
            # Guardar en la variable resultados todos los resultados devueltos por la consulta.
            resultados = cursor.fetchall()
        return resultados
    
    def insertarJugador(self, nombre, apellido):
        try:
            with self.database.cursor() as cursor:
                sqlInsertarJugador = "INSERT INTO jugadores (nombreJugador, apellidoJugador, cantidadRespuestasCorrectas) VALUES (%s, %s, 0);"
                cursor.execute(sqlInsertarJugador, (nombre, apellido))
                self.database.commit()
    
                # Obtén el ID del jugador insertado
                idJugador = cursor.lastrowid  # Esto obtiene el ID generado automáticamente
                print(idJugador)
                # Devuelve el ID al cliente (puedes enviarlo como JSON o en otro formato)
                return idJugador

        except Exception as e:
            print("Error al insertar jugador:", str(e))
            return None

    def actualizarPuntaje(self, idJugador, cantidadRespuestasCorrectas):  # Agrega 'self' como primer parámetro
        try:
            with self.database.cursor() as cursor:
                sqlActualizarPuntaje = "UPDATE jugadores SET cantidadRespuestasCorrectas = %s WHERE idJugador = %s;"
                cursor.execute(sqlActualizarPuntaje, (cantidadRespuestasCorrectas, idJugador))
                self.database.commit()  # Asegúrate de realizar el commit
            return "Puntaje actualizado correctamente"
        except Exception as e:
            # Manejar cualquier excepción que pueda ocurrir, como errores de base de datos
            return str(e)
        
    def obtenerPuntaje(self, idJugador):
        try:
            with self.database.cursor() as cursor:
                sqlObtenerPuntaje = "SELECT cantidadRespuestasCorrectas FROM jugadores WHERE idJugador = %s;"
                cursor.execute(sqlObtenerPuntaje, (idJugador,))
                resultado = cursor.fetchone()
                if resultado:
                    puntaje = resultado[0]
                    print(f'Puntaje obtenido desde la base de datos: {puntaje}')
                    return puntaje
                else:
                    return None
        except Exception as e:
            print(f'Error en la consulta de obtenerPuntaje: {str(e)}')
            return None
