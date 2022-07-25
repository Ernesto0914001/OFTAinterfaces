function Confirm() {
    //Ingresamos un mensaje a mostrar
    // alert("Taller Liberado  Exitosamente");
    //Ingresamos un mensaje a mostrar
    var mensaje = confirm("¿Estas Seguro de hacer este cambio?");
    //Detectamos si el usuario acepto el mensaje
    if (mensaje) {
    alert("Taller Liberado  Exitosamente");
    }
    //Detectamos si el usuario denegó el mensaje
    else {
    alert("Liberacion Fallida");
    }
    
}
function No_liberado() {
    // Ingresamos un mensaje a mostrar
    // alert("Taller No Liberado");
    //Ingresamos un mensaje a mostrar
    var mensaje = confirm("¿Estas Seguro de hacer este cambio?");
    //Detectamos si el usuario acepto el mensaje
    if (mensaje) {
    alert("Taller No Liberado Exitoso");
    }
    //Detectamos si el usuario denegó el mensaje
    else {
    alert("No Liberacion Fallida");
    }
}
function Baja() {
    //Ingresamos un mensaje a mostrar
    var mensaje = confirm("¿Estas Seguro de hacer este cambio?");
    //Detectamos si el usuario acepto el mensaje
    if (mensaje) {
    alert("Baja Exitosa");
    }
    //Detectamos si el usuario denegó el mensaje
    else {
    alert("Baja Fallida");
    }
}