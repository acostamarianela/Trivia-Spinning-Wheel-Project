document.addEventListener("DOMContentLoaded", function () {
  var progressBar = document.getElementById("progress-bar");
  var progressText = document.getElementById("progress-text");
  var tiempoTotal = 20000; // 30 segundos
  var tiempoRestante = tiempoTotal;
  var interval;

  // Función para actualizar la barra de progreso
  function actualizarBarra() {
    tiempoRestante -= 1000;
    var porcentaje = (tiempoRestante / tiempoTotal) * 100;
    progressBar.style.width = porcentaje + "%";

    var segundosRestantes = Math.ceil(tiempoRestante / 1000);
    progressText.textContent = segundosRestantes + " SEGUNDOS";

    if (tiempoRestante <= 10000) {
      progressBar.style.backgroundColor = "red"; // Cambia el color de fondo a rojo cuando quedan 10 segundos o menos
    }

    if (tiempoRestante <= 0) {
      clearInterval(interval);
      // Aquí regresa automáticamente a la página anterior en el historial de navegación
      window.history.back();
    }
  }

  // Iniciar la barra de progreso al cargar la página
  progressBar.style.width = "100%"; // Comienza llena (naranja)
  progressBar.style.backgroundColor = "orange"; // Color naranja
  interval = setInterval(actualizarBarra, 1000); // Actualizar cada segundo

  // Obtener el botón con la clase "correcta"
  var botonRespuestaCorrecta = document.querySelector(".correcta");

  // Agregar un controlador de eventos clic al botón de respuesta correcta
  botonRespuestaCorrecta.addEventListener("click", function () {
    // Cambiar el color del botón de respuesta correcta a verde
    botonRespuestaCorrecta.style.backgroundColor = "green";
    botonRespuestaCorrecta.style.fontWeight = "bold";

    // Deshabilitar todos los botones después de hacer clic
    var botones = document.querySelectorAll(".button");
    botones.forEach(function (boton) {
      boton.disabled = true;
    });

    // Esperar unos segundos antes de volver automáticamente a la página anterior
    setTimeout(function () {
      window.history.back();
    }, 1000); // Cambia el valor 1000 a la cantidad de milisegundos que desees esperar antes de volver atrás
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
  });
});
