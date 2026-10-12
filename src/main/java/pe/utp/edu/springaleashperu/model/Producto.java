
package pe.utp.edu.springaleashperu.model;

public class Producto {
    private int idProducto;
    private String nombre;
    private String descripcion;
    private double precio;
    private int stock;
    private int proveedorIdFk;
    private String categoria;
    private String imagen;
     private boolean enFavoritos;

    public Producto() {
    }

    public Producto(int idProducto, String nombre, String descripcion, double precio, int stock, int proveedorIdFk, String categoria, String imagen) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.proveedorIdFk = proveedorIdFk;
        this.categoria = categoria;
        this.imagen = imagen;
    }
 
    public Producto(String nombre, String descripcion, double precio, int stock, int proveedorIdFk, String categoria, String imagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.proveedorIdFk = proveedorIdFk;
        this.categoria = categoria;
        this.imagen = imagen;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getProveedorIdFk() {
        return proveedorIdFk;
    }

    public void setProveedorIdFk(int proveedorIdFk) {
        this.proveedorIdFk = proveedorIdFk;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    public void setEnFavoritos(boolean enFavoritos) {
        this.enFavoritos = enFavoritos;
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio=" + precio + ", stock=" + stock + ", proveedorIdFk=" + proveedorIdFk + ", categoria=" + categoria + ", imagen=" + imagen + '}';
    }

    
    
}
