package pe.utp.edu.springaleashperu.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pe.utp.edu.springaleashperu.model.Producto;
import pe.utp.edu.springaleashperu.service.FavoritoService;
import pe.utp.edu.springaleashperu.service.ProductoService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FavoritoController {

    @Autowired
    private FavoritoService favoritoService;

    @Autowired
    private ProductoService productoService;

  @PostMapping("/agregarFavorito")
    @ResponseBody
    public String agregarFavorito(@RequestParam("productoId") int productoId, HttpSession session) {
        int usuarioId = (int) session.getAttribute("idUsuario");
        if (!favoritoService.estaEnFavoritos(usuarioId, productoId)) {
            favoritoService.agregarFavorito(usuarioId, productoId);
            return "Producto agregado a favoritos";
        }
        return "Error al agregar a Favoritos";
    }

    @PostMapping("/eliminarFavorito")
    @ResponseBody
    public String eliminarFavorito(@RequestParam("productoId") int productoId, HttpSession session) {
        int usuarioId = (int) session.getAttribute("idUsuario");
        if (favoritoService.estaEnFavoritos(usuarioId, productoId)) {
            favoritoService.eliminarFavorito(usuarioId, productoId);
            return "Producto eliminado de favoritos";
        }
        return "Producto no está en favoritos";
    }
    
    @GetMapping("/favoritos")
    public String mostrarFavoritos(HttpSession session, Model model) {
        int usuarioId = (int) session.getAttribute("idUsuario");
        List<Producto> productosFavoritos = favoritoService.obtenerFavoritosPorUsuario(usuarioId).stream()
                .map(f -> productoService.findById(f.getProductoId()))
                .collect(Collectors.toList());
        model.addAttribute("productosFavoritos", productosFavoritos);
        return "favoritos";
    }
}