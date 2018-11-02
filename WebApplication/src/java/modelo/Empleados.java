/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Giordy Perez
 */
public class Empleados {

    public String nombre, apellido, direccion, telefono, dpi;
    public String fechaNacimiento, puesto, puestoID, puestoTipo, fecha_inicioLab, genero;
    public int idpuesto, tipopuesto, idEmpleados;

    public String getFecha_inicioLab() {
        return fecha_inicioLab;
    }

    public void setFecha_inicioLab(String fecha_inicioLab) {
        this.fecha_inicioLab = fecha_inicioLab;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setNombre(String prNombre) {
        nombre = prNombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setApellido(String prApellido) {
        apellido = prApellido;
    }

    public String getApellido() {
        return apellido;
    }

    public void setDireccion(String prDireccion) {
        direccion = prDireccion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setTelefono(String prTelefono) {
        telefono = prTelefono;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setDpi(String prDpi) {
        dpi = prDpi;
    }

    public String getDpi() {
        return dpi;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public void setIdpuesto(int prIdpuesto) {
        idpuesto = prIdpuesto;
    }

    public int getIdpuesto() {
        return idpuesto;
    }

    public void setTipopuesto(int prTipopuesto) {
        tipopuesto = prTipopuesto;
    }

    public int getTipopuesto() {
        return tipopuesto;
    }

    public int getIdEmpleados() {
        return idEmpleados;
    }

    public void setIdEmpleados(int idEmpleados) {
        this.idEmpleados = idEmpleados;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

}
