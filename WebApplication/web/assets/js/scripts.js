/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Menus obtenidos
let idNuevoDetalle = 1;
let menuDinamico;
let menus;

let ul = document.createElement('ul');

const rutaApp = "/proyecto_final_progra_2/";

let arraySerie = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T'];

const dt = new Date();

let month = dt.getMonth() + 1;
let day = dt.getDate();
let year = dt.getFullYear();

function cerrarSesion() {
    $(window).attr('location', '/proyecto_final_progra_2/index.jsp');
}

function obtenerMenu() {
    menuDinamico.appendChild(ul);

    menus.hijos.forEach(obj => {
        if (obj.hijos.length === 0) {
            // console.log(obj.menu + " * ")
        } else {
            let li = document.createElement('li');
            let innerUl = document.createElement('ul');

            ul.appendChild(li);
            if (obj.url === "") {
                li.innerHTML = "<h5>" + obj.menu + "</h5>";
            } else {
                let a = document.createElement('a');
                li.appendChild(a);
                a.setAttribute('href', rutaApp + obj.url);
                a.innerHTML = obj.menu;
            }

            // console.log(obj.menu + " -> ")

            obj.hijos.forEach(item => {
                let innerLi = document.createElement('li');
                innerUl.appendChild(innerLi);

                li.appendChild(innerUl);
                //innerLi.innerHTML = item.menu;
                if (item.url === "") {
                    if (item.hijos.length > 0) {
                        innerLi.innerHTML = "<h5>" + item.menu + "</h5>";
                    } else {
                        innerLi.innerHTML = item.menu;
                    }
                } else {
                    let a = document.createElement('a');
                    innerLi.appendChild(a);
                    a.setAttribute('href', rutaApp + item.url);
                    a.innerHTML = item.menu;
                }

                // console.log(item.menu + " * ")

                if (item.hijos.length > 0) {
                    testHijos(item.hijos, innerUl, innerLi)
                }
            });
            //testHijos(obj)
        }
    });

    console.log(menus.hijos)
}

function testHijos(hijos, pInnerUl, pInnerLi) {
    let innerUl = document.createElement('ul');


    hijos.forEach(item => {
        let innerLi = document.createElement('li');
        let a = document.createElement('a');

        innerUl.appendChild(innerLi);

        pInnerLi.appendChild(innerUl);
        // innerLi.innerHTML = item.menu;

        if (item.url === "") {
            innerLi.innerHTML = "<h5>" + item.menu + "</h5>";
        } else {
            innerLi.appendChild(a);
            a.setAttribute('href', rutaApp + item.url);
            a.innerHTML = item.menu;
        }

        // console.log(" -> " + item.menu)

        if (item.hijos.length > 0) {
            testHijos(item.hijos, innerUl, innerLi);
        }
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
    let randomUno = arraySerie[Math.floor(Math.random() * arraySerie.length)];
    let randomDos = arraySerie[Math.floor(Math.random() * arraySerie.length + 1)];

    txt_factura.value = randomUno + "" + randomDos;
}