document.addEventListener("DOMContentLoaded", function () {
  var progressBar = document.getElementById("progress-bar");
  var progressText = document.getElementById("progress-text");
  var tiempoTotal = 20000; // 20 segundos
  var tiempoRestante = tiempoTotal;
  var interval;
  var puntajeJugador = 0;
  var idJugador = obtenerIdJugador();

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
        // Realizar la solicitud fetch para actualizar el puntaje del jugador
        actualizarPuntaje(puntajeJugador, idJugador);
      } else if (boton.classList.contains("incorrecta")) {
        boton.style.backgroundColor = "red";
        actualizarPuntaje(puntajeJugador, idJugador);
      }
      boton.style.fontWeight = "bold";
      // Deshabilitar todos los botones después de hacer clic
      botones.forEach(function (b) {
        b.disabled = true;
      });
    });
  });

  // Función para realizar la solicitud fetch y actualizar el puntaje del jugador en el servidor
  function actualizarPuntaje(puntaje, idJugador) {
    // Realizar una solicitud fetch para actualizar el puntaje del jugador
    fetch("/actualizarPuntaje", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: "idJugador=" + idJugador + "&cantidadRespuestasCorrectas=" + puntaje,
    })
      .then(function (response) {
        if (response.ok) {
          console.log("Puntaje actualizado correctamente");
        } else {
          console.error("Error al actualizar el puntaje");
        }

        // Esperar unos segundos antes de volver automáticamente a la página anterior
        setTimeout(function () {
          window.history.back();
        }, 1000);
      })
      .catch(function (error) {
        console.error("Error de red:", error);
      });
  }

  function obtenerIdJugador() {
    // Obtener la ID del jugador desde la URL actual
    var url = window.location.href;
    var urlSearchParams = new URLSearchParams(url);
    var idJugador = urlSearchParams.get('idJugador');

    if (idJugador) {
        // Almacena el ID del jugador y devuelve el valor
        console.log("ID del jugador desde la URL:", idJugador);
        return idJugador;
    } else {
        console.error("ID de jugador no encontrado en la URL");
        return null;
    }}
});
