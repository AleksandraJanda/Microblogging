package pl.janda.microblogging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.repository.UserRepository;

import java.util.Optional;

@Controller
public class LoginController {


/*
    @Autowired
    UserRepository userRepository;

    @GetMapping("/login/")
    String lloog(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/welcome")
    private String verifyAndLog(@ModelAttribute("user") User u,
                                Model model) {
        Optional<User> opt = userRepository.findUserByUsername(u.getUsername());
        User user;
        if(opt.isPresent()){
            user = opt.get();
            System.out.println(user.getUsername()+" "+user.getPassword());
            if(user.getPassword().equals(u.getPassword())){
                model.addAttribute("username", u.getUsername());
                return "welcome";
            }
        }
        return "welcome";
    }*/
}
