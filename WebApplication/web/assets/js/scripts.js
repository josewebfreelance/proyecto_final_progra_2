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
