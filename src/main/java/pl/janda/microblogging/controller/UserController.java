package pl.janda.microblogging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.service.PostsService;
import pl.janda.microblogging.service.UserDetailsServiceImpl;
import pl.janda.microblogging.service.UserValidation;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    PostsService postsService;

    @GetMapping("/me")
    String me(Model model) {
        String username = userDetailsService.username();

        User user = (User) userDetailsService.loadUserByUsername(username);
        LocalDateTime since = user.getSince();

        postsService.postsAndAttributes(model, username, user, since);
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

        postsService.postsAndAttributes(model, username, user, since);

        return "me";
    }

    @GetMapping("/admin")
    String admin(Model model) {
        userDetailsService.addUsernameAttribute(model);
        List<User> users = userDetailsService.getAllUsers();
        model.addAttribute("numberOfUsers",users.size());
        List<Post> posts = postsService.getAllPosts();
        model.addAttribute("numberOfPosts",posts.size());
        model.addAttribute("users",users);
        model.addAttribute("posts",posts);

        return "admin";
    }
}
