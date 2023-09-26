from models.preguntasModel import PreguntasModel

class PreguntasController:
    def __init__(self):
        self.preguntasModel = PreguntasModel()

    def getPreguntasPorCategoria(self, categoria, idJugador):
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

        preguntas = self.preguntasModel.listPreguntasPorCategoria(categoria, idJugador)

        print(preguntas)
        return preguntas
