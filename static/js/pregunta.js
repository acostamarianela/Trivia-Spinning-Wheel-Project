document.addEventListener("DOMContentLoaded", function () {
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
  
