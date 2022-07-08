function Confirm() {
    //Ingresamos un mensaje a mostrar
    alert("Taller Liberado  Exitosamente");
    
}
function No_liberado() {
    //Ingresamos un mensaje a mostrar
    alert("ccccccc");
    
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