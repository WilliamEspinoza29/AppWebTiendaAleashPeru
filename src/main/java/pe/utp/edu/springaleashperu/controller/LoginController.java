package pe.utp.edu.springaleashperu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import pe.utp.edu.springaleashperu.service.UsuarioService;
import pe.utp.edu.springaleashperu.model.Usuario;

@Controller
public class LoginController {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/LoginC")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
        if (usuarioService.validarCredenciales(email, password)) {
            Usuario usuario = usuarioService.findByEmail(email);
            String rol = usuarioService.obtenerRol(email);
            if (usuario != null) {

                session.setAttribute("idUsuario", usuario.getIdUsuario());
                session.setAttribute("name", usuario.getNombre());
                session.setAttribute("email", email);
                session.setAttribute("rol", rol);
            }

            if ("administrador".equals(rol)) {
                return "redirect:/administrador";
            } else {
                return "redirect:/tienda";
            }
        } else {
            session.setAttribute("error", "Error al ingresar. Verifique correo o contraseña.");
            return "redirect:/login"; // Redirige de vuelta al login con un parámetro de error
        }
    }
}
