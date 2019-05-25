package pl.janda.microblogging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.service.PostsService;
import pl.janda.microblogging.service.UserDetailsServiceImpl;
import pl.janda.microblogging.service.UserValidation;

@Controller
public class LoginController {

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    UserValidation userValidation;

    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/login")
    String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @GetMapping("/logout")
    String logout(Model model) {
        userDetailsService.addUsernameAttribute(model);
        return "logout";
    }

    @GetMapping("/sign")
    String sign(Model model) {
        model.addAttribute("user", new User());
        userDetailsService.addUsernameAttribute(model);
        return "sign";
    }

    @PostMapping("/sign")
    String signIn(Model model, @ModelAttribute("user") User user) {
        String email = user.getEmail();
        String username = user.getUsername();
        String password = user.getPassword();
        String passwordConfirm = user.getPasswordConfirm();

        if (userValidation.validateUsername(username)
                && userValidation.validateEmail(email)
                && userValidation.validatePassword(password, passwordConfirm)) {
            userDetailsService.saveNewUser(username, passwordEncoder.encode(password), email);
            return "login";
        } else {
            String info = "";
            if(!userValidation.validateFields(username,password,passwordConfirm,email)){
                info = "Please fill all fields";
            } else if(!userValidation.validateUsername(username)){
                info = "User with that username is already registered";
            } else if(!userValidation.validateEmail(email)){
                info = "Invalid email";
            } else if(!userValidation.validatePassword(password, passwordConfirm)){
                info = "Password length has to be greater than 3 characters";
            }
            model.addAttribute("info", info);
            return "sign";
        }
    }
}
