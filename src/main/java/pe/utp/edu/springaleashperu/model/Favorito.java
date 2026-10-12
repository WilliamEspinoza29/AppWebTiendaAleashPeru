/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.utp.edu.springaleashperu.model;

/**
 *
 * @author 51934
 */
public class Favorito {
    private int id;
    private int usuarioId;
    private int productoId;

    public Favorito() {
    }

    public Favorito(int usuarioId, int productoId) {
        this.usuarioId = usuarioId;
        this.productoId = productoId;
    }

    
    public Favorito(int id, int usuarioId, int productoId) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.productoId = productoId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }

    @Override
    public String toString() {
        return "Favorito{" + "id=" + id + ", usuarioId=" + usuarioId + ", productoId=" + productoId + '}';
    }

    
    
    
}
