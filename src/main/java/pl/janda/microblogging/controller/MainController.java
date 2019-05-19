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
    UserValidation userValidation;

    @Autowired
    PostsService postsService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/")
    String home(Model model) {
        if (!userDetailsService.username().equals("anonymousUser")) {
            addUsernameAttribute(model);
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

    @GetMapping("/login")
    String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @GetMapping("/logout")
    String logout(Model model) {
        addUsernameAttribute(model);
        return "logout";
    }

    @GetMapping("/sign")
    String sign(Model model) {
        model.addAttribute("user", new User());
        addUsernameAttribute(model);
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

    @GetMapping("/me")
    String me(Model model) {
        String username = userDetailsService.username();

        User user = (User) userDetailsService.loadUserByUsername(username);
        LocalDateTime since = user.getSince();

        postsAndAttributes(model, username, user, since);
        model.addAttribute("new-post", new Post());

        return "me";
    }

    @PostMapping("/me")
    String post(Model model, @ModelAttribute("new-post") Post post) {
        String username = userDetailsService.username();

        User user = (User) userDetailsService.loadUserByUsername(username);
        LocalDateTime since = user.getSince();

        postsService.savePost(post, user);
        userDetailsService.saveUserWithPosts(post, user);

        postsAndAttributes(model, username, user, since);

        return "me";
    }

    @GetMapping("/admin")
    String admin(Model model) {
        addUsernameAttribute(model);
        return "admin";
    }

    @GetMapping("/error")
    String error() {
        return "error";
    }

    //METHODS
    private void addUsernameAttribute(Model model) {
        model.addAttribute("username", userDetailsService.username());
    }

    private void postsAndAttributes(Model model, String username, User user, LocalDateTime since) {
        List<Post> posts = postsService.findPosts(user);
        int postsNumber = 0;

        if (posts != null) {
            posts.sort(Comparator.comparing(Post::getDateTime).reversed());
            postsNumber = posts.size();
        }

        model.addAttribute("posts", posts);
        model.addAttribute("username", username);
        model.addAttribute("since", since.toLocalDate());
        model.addAttribute("postsNumber", postsNumber);
    }
}
