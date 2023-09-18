from datetime import datetime
from config import mysql

class PreguntasModel:
    # Constructor de la clase Clientes.
    def __init__(self):
        self.database = mysql.connection

    def ListClients(self):

        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:

            # Construir la sentencia SQL para listar los clientes.
            sql_listar = "SELECT p.nombre, p.apellido, p.telefono, c.fechaRegistro, c.preferencias, c.condicionesEspeciales, c.idCliente FROM clientes c LEFT JOIN personas p ON p.idPersona = c.idPersona"
            cursor.execute(sql_listar)

            # Guardar en la variable resultados todos los resultados devueltos por la consulta.
            resultados = cursor.fetchall()
            print(resultados)

        return resultados

    def get_client_by_id(self, idClient):

        self.id_client = idClient

        # Aquí va la lógica para obtener los datos del cliente por su ID
        with self.database.cursor() as cursor:
            query = "SELECT p.nombre, p.apellido, p.telefono, c.fechaRegistro, c.preferencias, c.condicionesEspeciales, c.idCliente, p.idPersona FROM clientes c, personas p WHERE c.idCliente = %s and c.idPersona = p.idPersona"
            cursor.execute(query, (self.id_client,))
            client = cursor.fetchone()

        # Confirmar los cambios en la base de datos.
        self.database.commit()

        # Si el cliente no existe, devolver None
        if client is None:
            return None

        # Devolver los datos del cliente
        return client