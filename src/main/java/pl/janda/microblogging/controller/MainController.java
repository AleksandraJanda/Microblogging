package pl.janda.microblogging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.service.PostsService;
import pl.janda.microblogging.service.UserDetailsServiceImpl;
import pl.janda.microblogging.service.UserValidation;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    PostsService postsService;

    @GetMapping("/")
    String home(Model model) {
        if (!userDetailsService.username().equals("anonymousUser")) {
            userDetailsService.addUsernameAttribute(model);
            List<Post> posts = postsService.getAllPostsFromWeek();
            posts.sort(Comparator.comparing(Post::getDateTime).reversed());
            model.addAttribute("posts", posts);
        }
        return "home";
    }

    @GetMapping("/home")
    String home2(Model model) {
        return home(model);
    }

    @GetMapping("/error")
    String error() {
        return "error";
    }
}
