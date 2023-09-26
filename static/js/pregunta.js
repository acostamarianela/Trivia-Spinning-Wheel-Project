async function obtenerIdJugador() {
  try {
    // Obtener la ID del jugador desde la URL actual
    var url = window.location.href;
    var urlSearchParams = new URLSearchParams(url);
    var idJugador = urlSearchParams.get('idJugador');

    return idJugador;
  } catch (error) {
    console.error("Error de red:", error);
    return null;
  }
}
document.addEventListener("DOMContentLoaded", async function () {
  var progressBar = document.getElementById("progress-bar");
  var progressText = document.getElementById("progress-text");
  var tiempoTotal = 20000; // 20 segundos
  var tiempoRestante = tiempoTotal;
  var interval;
  var puntajeJugador = 0; // Inicializa el puntaje en 0

  // Obtener el ID del jugador con async/await
  var idJugador = await obtenerIdJugador();

  // Función para actualizar la barra de progreso
  function actualizarBarra() {
    tiempoRestante -= 1000;
    var porcentaje = (tiempoRestante / tiempoTotal) * 100;
    progressBar.style.width = porcentaje + "%";

    var segundosRestantes = Math.ceil(tiempoRestante / 1000);
    progressText.textContent = segundosRestantes + " SEGUNDOS";

    if (tiempoRestante <= 10000) {
      progressBar.style.backgroundColor = "red";
    }

    if (tiempoRestante <= 0) {
      clearInterval(interval);
      // Regresar automáticamente a la página anterior en el historial de navegación
      window.history.back();
    }
  }

  // Iniciar la barra de progreso al cargar la página
  progressBar.style.width = "100%";
  progressBar.style.backgroundColor = "orange";
  interval = setInterval(actualizarBarra, 1000);


  // Obtener todos los botones con la clase "button"
  var botones = document.querySelectorAll(".button");

  // Agregar un controlador de eventos clic a cada botón
  botones.forEach(function (boton) {
    
    boton.addEventListener("click", function () {
      // Verificar si el botón tiene la clase "correcta" o "incorrecta" y cambiar el color
      if (boton.classList.contains("correcta")) {
        boton.style.backgroundColor = "green";
        puntajeJugador++; // Aumentar el puntaje en 1
        // Agregar una declaración de impresión para verificar el puntaje actual
        console.log("Puntaje actual: " + puntajeJugador);
        // Llamar a la función para actualizar el puntaje
        actualizarPuntaje(puntajeJugador, idJugador);
      } else if (boton.classList.contains("incorrecta")) {
        boton.style.backgroundColor = "red";
        window.location.href = '/listarJugadores';
      }
      boton.style.fontWeight = "bold";
    
      // Deshabilitar el botón que se hizo clic
      boton.disabled = true;
    });
    
  });

  // Función para realizar la solicitud fetch y actualizar el puntaje del jugador en el servidor
// Función para realizar la solicitud fetch y actualizar el puntaje del jugador en el servidor
async function actualizarPuntaje(puntaje, idJugador) {
  try {
    // Realizar una solicitud fetch para obtener el puntaje actual del jugador desde el servidor
    const response = await fetch("/obtenerPuntaje?idJugador=" + idJugador);

    if (response.ok) {
      const data = await response.json();
      if (data.hasOwnProperty('puntaje')) {
        // Sumar el puntaje actual al puntaje obtenido del servidor
        const puntajeTotal = data.puntaje + puntaje;

        // Realizar una solicitud fetch para actualizar el puntaje del jugador en el servidor
        const actualizarResponse = await fetch("/actualizarPuntaje", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: "idJugador=" + idJugador + "&cantidadRespuestasCorrectas=" + puntajeTotal,
        });

        if (actualizarResponse.ok) {
          console.log("Puntaje actualizado correctamente");
        } else {
          console.error("Error al actualizar el puntaje");
        }

        // Esperar unos segundos antes de volver automáticamente a la página anterior
        setTimeout(function () {
          window.history.back();
        }, 1000);
      } else {
        console.error("Puntaje del jugador no encontrado en la respuesta del servidor");
      }
    } else {
      console.error("Error al obtener el puntaje del jugador");
    }
  } catch (error) {
    console.error("Error de red:", error);
  }
}
});






