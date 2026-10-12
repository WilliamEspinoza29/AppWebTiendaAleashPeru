package pe.utp.edu.springaleashperu.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import pe.utp.edu.springaleashperu.model.Producto;

@Service
public class ProductoService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Producto> findAll() {
        String sql = "SELECT * FROM productos";
        return jdbcTemplate.query(sql, new ProductoRowMapper());
    }
    
    //buscar por id utilizado en favoritos
//    public List<Producto> findProductosByIds(List<Integer> ids) {
//        if (ids.isEmpty()) {
//            return List.of();  // Devuelve una lista vacía si no hay IDs
//        }
//        String sql = "SELECT * FROM productos WHERE IDProducto IN (" + ids.stream().map(String::valueOf).collect(Collectors.joining(",")) + ")";
//        return jdbcTemplate.query(sql, new ProductoRowMapper());
//    }
    
    
    public Producto findById(int id) {
        String sql = "SELECT * FROM productos WHERE IDProducto = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new ProductoRowMapper());
    }
    // Clase interna ProductoRowMapper
    private static class ProductoRowMapper implements RowMapper<Producto> {
        @Override
        public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
            Producto producto = new Producto();
            producto.setIdProducto(rs.getInt("IDProducto"));
            producto.setNombre(rs.getString("Nombre"));
            producto.setDescripcion(rs.getString("Descripcion"));
            producto.setPrecio(rs.getDouble("Precio"));
            producto.setStock(rs.getInt("Stock"));
            producto.setProveedorIdFk(rs.getInt("Proveedor_ID_FK"));
            producto.setCategoria(rs.getString("Categoria"));
            producto.setImagen(rs.getString("Imagen"));
            return producto;
        }
    }
}


