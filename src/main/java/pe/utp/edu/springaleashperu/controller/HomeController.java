package pe.utp.edu.springaleashperu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pe.utp.edu.springaleashperu.model.Producto;
import pe.utp.edu.springaleashperu.service.ProductoService;

@Controller
public class HomeController {

    @RequestMapping(value = "/")
    public ModelAndView test(HttpServletResponse response) throws IOException {
        return new ModelAndView("home");
    }

    @Autowired
    private ProductoService productoService;

    @GetMapping({"/","/home"})
    public String mostrarHome(Model model) {

        List<Producto> productosHome = productoService.findAll();
        model.addAttribute("productosHome", productosHome);
        return "home";
    }
}
