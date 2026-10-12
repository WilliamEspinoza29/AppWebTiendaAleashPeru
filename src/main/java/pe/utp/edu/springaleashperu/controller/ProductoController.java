package pe.utp.edu.springaleashperu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pe.utp.edu.springaleashperu.model.Producto;
import pe.utp.edu.springaleashperu.service.ProductoService;
import pe.utp.edu.springaleashperu.service.FavoritoService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import jdk.internal.javac.ParticipatesInPreview;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    @Autowired
    private FavoritoService favoritoService;

//    @GetMapping("/tienda")
//    public String mostrarTienda(HttpSession session, Model model) {
//        List<Producto> productos = productoService.findAll();
//        int usuarioId = (int) session.getAttribute("idUsuario");
//        List<Integer> favoritosIds = favoritoService.obtenerFavoritosPorUsuario(usuarioId).stream()
//                .map(f -> f.getProductoId())
//                .collect(Collectors.toList());
//
//        for (Producto producto : productos) {
//            producto.setEnFavoritos(favoritosIds.contains(producto.getIdProducto()));
//        }
//
//        model.addAttribute("productos", productos);
//        return "tienda";
//    }
    @GetMapping("/tienda")
    public String mostrarTienda(HttpSession session, Model model) {
        List<Producto> productos = productoService.findAll();
        int usuarioId = (int) session.getAttribute("idUsuario");
        Set<Integer> favoritosIds = favoritoService.obtenerFavoritosPorUsuario(usuarioId).stream()
                .map(f -> f.getProductoId())
                .collect(Collectors.toSet());

        for (Producto producto : productos) {
            producto.setEnFavoritos(favoritosIds.contains(producto.getIdProducto()));
        }

        model.addAttribute("productos", productos);
        model.addAttribute("favoritosIds", favoritosIds);
        return "tienda";
    }

    /*
    @GetMapping("/detalleProducto")
    public String mostrarDetalle(Model model, @PathVariable int productId) {

        System.out.println("Hello World!");

        return "detalleProducto";
    }*/

    @GetMapping("/tienda/detalleProducto/{productId}")
    public String mostrarDetalleProducto(Model model, @PathVariable int productId) {
        Producto producto = productoService.findById(productId);

        model.addAttribute("producto", producto);
        System.out.println("Hello World!");
        System.out.println(productId);

        return "detalleProducto";
    }
}
