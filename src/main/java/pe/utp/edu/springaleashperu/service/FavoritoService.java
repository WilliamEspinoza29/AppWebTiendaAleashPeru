package pe.utp.edu.springaleashperu.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import pe.utp.edu.springaleashperu.model.Favorito;

@Service
public class FavoritoService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void agregarFavorito(int usuarioId, int productoId) {
        String sql = "INSERT INTO favoritos (usuario_id, producto_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, usuarioId, productoId);
    }

    public void eliminarFavorito(int usuarioId, int productoId) {
        String sql = "DELETE FROM favoritos WHERE usuario_id = ? AND producto_id = ?";
        jdbcTemplate.update(sql, usuarioId, productoId);
    }

    public List<Favorito> obtenerFavoritosPorUsuario(int usuarioId) {
        String sql = "SELECT * FROM favoritos WHERE usuario_id = ?";
        return jdbcTemplate.query(sql, new FavoritoRowMapper(), usuarioId);
    }
    
    public boolean estaEnFavoritos(int usuarioId, int productoId) {
        String sql = "SELECT COUNT(*) FROM favoritos WHERE usuario_id = ? AND producto_id = ?";
        int count = jdbcTemplate.queryForObject(sql, Integer.class, usuarioId, productoId);
        return count > 0;
    }

    private static class FavoritoRowMapper implements RowMapper<Favorito> {

        @Override
        public Favorito mapRow(ResultSet rs, int rowNum) throws SQLException {
            Favorito favorito = new Favorito();
            favorito.setId(rs.getInt("id_favoritos"));
            favorito.setUsuarioId(rs.getInt("usuario_id"));
            favorito.setProductoId(rs.getInt("producto_id"));
            return favorito;
        }
    }
}
