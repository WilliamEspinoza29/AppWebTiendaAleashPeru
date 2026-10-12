package pe.utp.edu.springaleashperu.model;


public class Usuario {

    private int idUsuario;
    private String nombre;
    private String email;
    private String contrasena;
    private String rol;
    private int activo;

    public Usuario() {
    }

    public Usuario(String name, String email, String password, String rol) {
        this.nombre = name;
        this.email = email;
        this.contrasena = password;
        this.rol = rol;
    }

    public Usuario(int idUsuario, String nombre, String email, String contrasena, String rol, int activo) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.email = email;
        this.contrasena = contrasena;
        this.rol = rol;
        this.activo = activo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public int getActivo() {
        return activo;
    }

    public void setActivo(int activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", email=" + email + ", contrasena=" + contrasena + ", rol=" + rol + ", activo=" + activo + '}';
    }

}
