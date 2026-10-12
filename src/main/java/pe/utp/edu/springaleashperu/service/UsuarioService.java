package pe.utp.edu.springaleashperu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import pe.utp.edu.springaleashperu.model.Usuario;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Usuario findByEmailAndPassword(String email, String password) {
        String sql = "SELECT * FROM usuarios WHERE email = ? AND contrasena = ?";
        List<Usuario> usuarios = jdbcTemplate.query(sql, new Object[]{email, password}, new UsuarioRowMapper());
        return usuarios.isEmpty() ? null : usuarios.get(0);
    }

    public void save(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, email, contrasena, rol, activo) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, usuario.getNombre(), usuario.getEmail(), usuario.getContrasena(), usuario.getRol(), 1); // Set 'activo' to 1
    }

    public boolean validarCredenciales(String email, String password) {
        return findByEmailAndPassword(email, password) != null;
    }

    public String obtenerRol(String email) {
        Usuario usuario = findByEmail(email);
        return usuario != null ? usuario.getRol() : null;
    }

    public Usuario findByEmail(String email) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        List<Usuario> usuarios = jdbcTemplate.query(sql, new Object[]{email}, new UsuarioRowMapper());
        return usuarios.isEmpty() ? null : usuarios.get(0);
    }

    public boolean registrarUsuario(String name, String email, String password, String rol) {
        if (findByEmail(email) != null) {
            return false; // Usuario ya existe
        }
        try {
            Usuario usuario = new Usuario(name, email, password, rol);
            save(usuario);
            return true; // Registro exitoso
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Error al registrar
        }
    }

    private static class UsuarioRowMapper implements RowMapper<Usuario> {
        @Override
        public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(rs.getInt("idUsuario"));
            usuario.setNombre(rs.getString("nombre"));
            usuario.setEmail(rs.getString("email"));
            usuario.setContrasena(rs.getString("contrasena"));
            usuario.setRol(rs.getString("rol"));
            usuario.setActivo(rs.getInt("activo"));
            return usuario;
        }
    }
}
































//package pe.utp.edu.springtecnotienda.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.RowMapper;
//import org.springframework.stereotype.Service;
//import pe.utp.edu.springtecnotienda.model.Usuario;
//
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.List;
//
//@Service
//public class UsuarioService {
//
//    @Autowired
//    private JdbcTemplate jdbcTemplate;
//
//    public Usuario findByEmailAndPassword(String email, String password) {
//        String sql = "SELECT * FROM usuarios WHERE email = ? AND contrasena = ?";
//        List<Usuario> usuarios = jdbcTemplate.query(sql, new Object[]{email, password}, new UsuarioRowMapper());
//        return usuarios.isEmpty() ? null : usuarios.get(0);
//    }
//
//    public void save(Usuario usuario) {
//        String sql = "INSERT INTO usuarios (nombre, email, contrasena, rol, activo) VALUES (?, ?, ?, ?, ?)";
//        jdbcTemplate.update(sql, usuario.getNombre(), usuario.getEmail(), usuario.getContrasena(), usuario.getRol(), usuario.getActivo());
//    }
//
//    public boolean validarCredenciales(String email, String password) {
//        Usuario usuario = findByEmailAndPassword(email, password);
//        return usuario != null && usuario.getActivo() == 1;
//    }
//
//    public String obtenerRol(String email) {
//        Usuario usuario = findByEmail(email);
//        return usuario != null ? usuario.getRol() : null;
//    }
//
//    public Usuario findByEmail(String email) {
//        String sql = "SELECT * FROM usuarios WHERE email = ?";
//        List<Usuario> usuarios = jdbcTemplate.query(sql, new Object[]{email}, new UsuarioRowMapper());
//        return usuarios.isEmpty() ? null : usuarios.get(0);
//    }
//
//    public boolean registrarUsuario(String name, String email, String password, String rol) {
//        if (findByEmail(email) != null) {
//            return false; // Usuario ya existe
//        }
//        try {
//            Usuario usuario = new Usuario(name, email, password, rol);
//            usuario.setActivo(1); // Activo por defecto
//            save(usuario);
//            return true; // Registro exitoso
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false; // Error al registrar
//        }
//    }
//
//    private static class UsuarioRowMapper implements RowMapper<Usuario> {
//        @Override
//        public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
//            Usuario usuario = new Usuario();
//            usuario.setIdUsuario(rs.getInt("idUsuario"));
//            usuario.setNombre(rs.getString("nombre"));
//            usuario.setEmail(rs.getString("email"));
//            usuario.setContrasena(rs.getString("contrasena"));
//            usuario.setRol(rs.getString("rol"));
//            usuario.setActivo(rs.getInt("activo"));
//            return usuario;
//        }
//    }
//}
