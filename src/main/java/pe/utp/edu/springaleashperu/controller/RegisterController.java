package pe.utp.edu.springaleashperu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pe.utp.edu.springaleashperu.service.UsuarioService;

@Controller
public class RegisterController {

    @Autowired
    private UsuarioService usuarioService;

    @PostMapping("/register")
    @ResponseBody
    public String register(@RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("pass") String password) {
        boolean success = usuarioService.registrarUsuario(name, email, password, "cliente");
        if (success) {
            return "success";
        } else {
            return "failure";
        }
    }
}
