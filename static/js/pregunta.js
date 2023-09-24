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
      // Aquí puedes agregar el código para redireccionar a la página anterior
      window.history.back();
    }
  }

  // Iniciar la barra de progreso al cargar la página
  progressBar.style.width = "100%"; // Comienza llena (naranja)
  progressBar.style.backgroundColor = "orange"; // Color naranja
  interval = setInterval(actualizarBarra, 1000); // Actualizar cada segundo

  // Obtener todos los botones con la clase "button"
  var botones = document.querySelectorAll(".button");

  // Agregar un controlador de eventos clic a cada botón
  botones.forEach(function (boton) {
    boton.addEventListener("click", function () {
      // Verificar si el botón tiene la clase "correcta" o "incorrecta" y cambiar el color
      if (boton.classList.contains("correcta")) {
        boton.style.backgroundColor = "green";
      } else if (boton.classList.contains("incorrecta")) {
        boton.style.backgroundColor = "red";
      }
      boton.style.fontWeight = "bold";
      // Deshabilitar todos los botones después de hacer clic
      botones.forEach(function (b) {
        b.disabled = true;
      });
    });
  });
});
