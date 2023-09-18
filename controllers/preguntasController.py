from models.clientes.model_clients import ClientModel
from flask import flash, redirect, url_for

class PreguntasController:
    def __init__(self):
        self.preguntas_model = PreguntasModel()
        self.error = None
        self.error_messages = []

    def GetPreguntas(self):
        list_clients = self.client_model.ListClients()
        return list_clients
    
    def AddClient(self, nombre, apellido, telefono, preferencias, condicionesEspeciales):
        if not re.match(r'^[A-Za-z\sáéíóúÁÉÍÓÚñÑ]+$', nombre):
            self.error_messages.append("El nombre solo debe contener letras y espacios")

        if not re.match(r'^[A-Za-z\sáéíóúÁÉÍÓÚñÑ]+$', apellido):
            self.error_messages.append("El apellido solo debe contener letras y espacios")

        if telefono != "0" and telefono != "" and not re.match(r'^\d{10}$', telefono):
            self.error_messages.append("El número de teléfono debe tener 10 dígitos")

        if not re.match(r'^[A-Za-z\sáéíóúÁÉÍÓÚñÑ]+$', preferencias):
            self.error_messages.append("Las preferencias solo deben contener letras y espacios")

        if not re.match(r'^[A-Za-z\sáéíóúÁÉÍÓÚñÑ]+$', condicionesEspeciales):
            self.error_messages.append("Las condiciones especiales solo deben contener letras y espacios")

        if self.error_messages:
            self.error = self.error_messages
            return redirect(url_for('AddClient'))

        try:
            self.client_model.AddClient(nombre, apellido, telefono, preferencias, condicionesEspeciales)
        except Exception as e:
            self.error = str(e)

    def DeleteClient(self, idClient):
        try:
            self.client_model.DeleteClient(idClient)
        except Exception as e:
            self.error = str(e)
        
    def get_client_by_id(self, idClient):
        client = self.client_model.get_client_by_id(idClient)
        return client

    def UpdateClient(self, id, nombre, apellido, telefono, fecha, preferencias, condicionesEspeciales):
        if telefono != "0" and telefono != "" and not re.match(r'^\d{10}$', str(telefono)):
            self.error = "El número de teléfono debe tener 10 dígitos"
            return redirect(url_for('UpdateClient', id = id)) 
        try:
            self.client_model.UpdateClient(id, nombre, apellido, telefono, fecha, preferencias, condicionesEspeciales)
        except Exception as e:
            self.error = str(e)