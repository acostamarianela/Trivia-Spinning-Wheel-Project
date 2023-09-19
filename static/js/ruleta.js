$(document).ready(function(){
    // Set default degree (360*4)
    var degree = 1440;
    // Number of clicks = 0
    var clicks = 0;

    // Variable para almacenar los grados actuales
    var gradosActuales = 0;

    /*WHEEL SPIN FUNCTION*/
    $('#spin').click(function(){
        // Incrementa en 1 con cada clic
        clicks++;

        // Multiplica el grado por el número de clics
        var newDegree = degree * clicks;
        var extraDegree = Math.floor(Math.random() * (360 - 1 + 1)) + 1;
        totalDegree = newDegree + extraDegree;

        // Realiza la animación de giro
        $('#inner-wheel').css({
            'transition': 'transform 4s ease-out',
            'transform': 'rotate(' + totalDegree + 'deg)'            
        });

        // Inicia un temporizador para determinar la sección después de la animación
        setTimeout(function () {
            // Detén la animación de giro
            $('#inner-wheel').css('transition', 'none');

            // Calcula los grados actuales después de la animación
            gradosActuales = totalDegree % 360;

            // Calcula la sección actual después de la animación (considerando 4 secciones)
            var seccionDespuesDeAnimacion = Math.floor((gradosActuales + 45) / 90) % 4;

            console.log('La flecha está apuntando a la sección:', seccionDespuesDeAnimacion);
            console.log(typeof seccionDespuesDeAnimacion);
            // Envía la categoría al servidor Flask y obtén una pregunta aleatoria
            enviarCategoria(seccionDespuesDeAnimacion);
        }, 4000); // 4000 milisegundos (4 segundos) es la duración de la animación
    });
});

function enviarCategoria(categoria) {
    $.ajax({
        type: 'GET',
        url: '/pregunta',
        data: { categoria: categoria },
        success: function(response) {
            console.log('Pregunta aleatoria:', response);

        },
        error: function(error) {
            console.error('Error al enviar la categoría:', error);
        }
    });
}

	