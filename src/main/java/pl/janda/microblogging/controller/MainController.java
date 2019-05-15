package pl.janda.microblogging.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MainController {

    @GetMapping("/")
    String home() {
        return "home";
    }

    @GetMapping("/home")
    String home2() {
        return "home";
    }

    @GetMapping("/login")
    String login() {
        return "login";
    }

    @GetMapping("/logout")
    String logout() {
        return "logout";
    }

    @GetMapping("/sign")
    String sign() {
        return "sign";
    }

    @GetMapping("/welcome")
    String welcome() {
        return "welcome";
    }

    @GetMapping("/me")
    String me() {
        return "myprofile";
    }

    @GetMapping("/admin")
    String admin() {
        return "admin";
    }
}
