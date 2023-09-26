$(document).ready(function(){
    function obtenerIdJugador() {
        return new Promise(function(resolve, reject) {
            // Obtener la ID del jugador desde la URL actual
            var url = window.location.href;
            var urlSegments = url.split('/');
            var idJugador = urlSegments[urlSegments.length - 1]; // El último segmento es el idJugador
            
            if (idJugador) {
                // Resuelve la promesa con el ID del jugador
                resolve(idJugador);
            } else {
                // Rechaza la promesa con un error
                reject(new Error("ID de jugador no encontrado en la URL"));
            }
        });
    }
    
    // Set default degree (360*4)
    var degree = 1440;
    var clicks = 0;
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

            // Obtén el ID del jugador y luego envía la categoría al servidor Flask
            obtenerIdJugador()
                .then(function(idJugador) {
                    // Ejecuta la redirección directamente aquí
                    window.location.href = '/pregunta?categoria=' + seccionDespuesDeAnimacion + '&idJugador=' + idJugador;
                })
                .catch(function(error) {
                    console.error('Error al obtener el ID del jugador:', error);
                });
        }, 4000); // 4000 milisegundos (4 segundos) es la duración de la animación
    });

    // Otras partes de tu código...
});