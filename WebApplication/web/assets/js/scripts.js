/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Menus obtenidos
let menus = [];
let idNuevoDetalle = 1;

function cerrarSesion() {
    // $(window).replaceAll('location', '/proyecto_final_progra_2/');
    $(window).attr('location', '/proyecto_final_progra_2/index.jsp');
}

function obtenerMenu(id, padre, menu, url) {
    let obj = {};
    obj.id = id;
    obj.padre = padre;
    obj.menu = menu;
    obj.url = url;
    menus.push(obj);
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
