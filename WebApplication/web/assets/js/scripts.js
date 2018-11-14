/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Menus obtenidos
let menus = [];
let idNuevoDetalle = 1;

let arraySerie = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T'];

const dt = new Date();

let month = dt.getMonth() + 1;
let day = dt.getDate();
let year = dt.getFullYear();

function cerrarSesion() {
    // $(window).replaceAll('location', '/proyecto_final_progra_2/');
    $(window).attr('location', '/proyecto_final_progra_2/index.jsp');
}

function menuHijos(id, obj) {
    console.log(id);
    console.log(obj)
}

function obtenerMenu(obj) {

    obj.forEach(item => {
        menuHijos(item.id, item)
    });

}

function activarMenu(seleccionado, comparar) {
    const el = $(`#${seleccionado}`);
    if (seleccionado === comparar) {
        el.addClass('active');
    }
}

function obtenerValoresVenta(idVenta, factura, serie, fechafactura, idcliente, idempleado, fechaingreso) {
    const txt_factura = document.querySelector("#txt_factura");
    const txt_serie = document.querySelector("#txt_serie");
    const txt_fecha_factura = document.querySelector("#txt_fecha_factura");
    const txt_id_cliente = document.querySelector("#txt_id_cliente");
    const txt_id_empleado = document.querySelector("#txt_id_empleado");
    const txt_fecha_ingreso = document.querySelector("#txt_fecha_ingreso");

    // VENTAS DETALLE

    const txt_id_venta = document.querySelector("#txt_idventa");

    txt_factura.value = factura;
    txt_serie.value = serie;
    txt_fecha_factura.value = fechafactura;
    txt_id_cliente.value = idcliente;
    txt_id_empleado.value = idempleado;
    txt_fecha_ingreso.value = fechaingreso;

    // VENTAS DETALLE

    txt_id_venta.value = idVenta;
}

function obtenerProductoId(id) {
    const txt_id_producto = document.querySelector("#txt_id_producto");

    txt_id_producto.value = id;
}

function fechaDefault(el) {
    let txt_fecha = document.querySelector(el);

    txt_fecha.value = year + '-' + month + '-' + day;
}

function generarFactura(el, id) {
    let txt_factura = document.querySelector(el);

    txt_factura.value = month + "" + day + "" + id;
}

function generarSerieFactura(el) {
    let txt_factura = document.querySelector(el);
    let randomUno = arraySerie[Math.floor(Math.random()*arraySerie.length)];
    let randomDos = arraySerie[Math.floor(Math.random()*arraySerie.length + 1)];

    txt_factura.value = randomUno + "" + randomDos;
}
