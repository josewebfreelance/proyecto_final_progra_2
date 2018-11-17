/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author Desarrollo
 */
abstract class Inventario {
    private String Producto,Descripcion,Imagen,Fecha_ingreso;
    private int Existencia;
    private double Precio_costo, Precio_venta;
    private int idMarca;

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String Producto) {
        this.Producto = Producto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public double getPrecio_costo() {
        return Precio_costo;
    }

    public void setPrecio_costo(double Precio_costo) {
        this.Precio_costo = Precio_costo;
    }

    public double getPrecio_venta() {
        return Precio_venta;
    }

    public void setPrecio_venta(double Precio_venta) {
        this.Precio_venta = Precio_venta;
    }

  

  

    public int getExistencia() {
        return Existencia;
    }

    public void setExistencia(int Existencia) {
        this.Existencia = Existencia;
    }

    public String getFecha_ingreso() {
        return Fecha_ingreso;
    }

    public void setFecha_ingreso(String Fecha_ingreso) {
        this.Fecha_ingreso = Fecha_ingreso;
    }

     public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }
    
    
}
