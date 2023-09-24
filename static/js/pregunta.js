document.addEventListener("DOMContentLoaded", function () {
  var progressBar = document.getElementById("progress-bar");
  var progressText = document.getElementById("progress-text");
  var tiempoTotal = 20000; // 20 segundos
  var tiempoRestante = tiempoTotal;
  var interval;
  var puntajeJugador = 0;
  var idJugador; // Variable para almacenar el ID del jugador

  // Llamar a esta función para obtener el ID del jugador
  obtenerIdJugador();

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

  // Obtener el botón con la clase "correcta"
  var botonRespuestaCorrecta = document.querySelector(".correcta");

  // Agregar un controlador de eventos clic al botón de respuesta correcta
  botonRespuestaCorrecta.addEventListener("click", function () {
    // Cambiar el color del botón de respuesta correcta a verde
    botonRespuestaCorrecta.style.backgroundColor = "green";
    botonRespuestaCorrecta.style.fontWeight = "bold";

    // Incrementar el puntaje del jugador
    puntajeJugador++; // Aumentar el puntaje en 1

    // Deshabilitar todos los botones después de hacer clic
    var botones = document.querySelectorAll(".button");
    botones.forEach(function (boton) {
      boton.disabled = true;
    });

    // Realizar la solicitud fetch para actualizar el puntaje del jugador
    actualizarPuntaje(puntajeJugador, idJugador);
  });

  // Obtener el botón con la clase "incorrecta"
  var botonRespuestaIncorrecta = document.querySelector(".incorrecta");

  // Agregar un controlador de eventos clic al botón de respuesta incorrecta
  botonRespuestaIncorrecta.addEventListener("click", function () {
    // Cambiar el color del botón de respuesta incorrecta a rojo
    botonRespuestaIncorrecta.style.backgroundColor = "red";
    botonRespuestaIncorrecta.style.fontWeight = "bold";

    // Deshabilitar todos los botones después de hacer clic
    var botones = document.querySelectorAll(".button");
    botones.forEach(function (boton) {
      boton.disabled = true;
    });

    // Realizar la solicitud fetch para actualizar el puntaje del jugador
    actualizarPuntaje(puntajeJugador, idJugador);
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

  // Función para obtener el ID del jugador desde el servidor
  function obtenerIdJugador() {
    fetch("/obtenerIdJugador")
      .then(function (response) {
        if (response.ok) {
          return response.json();
        } else {
          console.error("Error al obtener el ID del jugador");
        }
      })
      .then(function (data) {
        if (data && data.idJugador) {
          idJugador = data.idJugador; // Almacena el ID del jugador
        } else {
          console.error("ID de jugador no encontrado en la respuesta del servidor");
        }
      })
      .catch(function (error) {
        console.error("Error de red:", error);
      });
  }
});
