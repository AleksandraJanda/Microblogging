package pl.janda.microblogging.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.service.PostsService;
import pl.janda.microblogging.service.UserDetailsServiceImpl;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Autowired
    PostsService postsService;


    @GetMapping("/")
    String home(Model model) {
        addUsernameAttribute(model);
        return "home";
    }

    @GetMapping("/home")
    String home2() {
        return "home";
    }

   @GetMapping("/login")
    String login(Model model) {
        model.addAttribute("user", new User());
        addUsernameAttribute(model);
        return "login";
    }

    @GetMapping("/logout")
    String logout(Model model) {
        addUsernameAttribute(model);
        return "logout";
    }

    @GetMapping("/sign")
    String sign() {
        return "sign";
    }

    @GetMapping("/me")
    String me(Model model) {
        String username = userDetailsService.username();

        User user = (User) userDetailsService.loadUserByUsername(username);
        LocalDateTime since = user.getSince();
        List<Post> posts = user.getPosts();

        Integer postsNumber = posts.size();

        model.addAttribute("username", username);
        model.addAttribute("since", since.toLocalDate());
        model.addAttribute("postsNumber", postsNumber);
        model.addAttribute("new-post", new Post());

        return "me";
    }

    @PostMapping("/me")
    String post(Model model, @ModelAttribute("new-post") Post post){
        String username = userDetailsService.username();

        User user = (User) userDetailsService.loadUserByUsername(username);
        LocalDateTime since = user.getSince();
        List<Post> posts = postsService.findPosts(user);

        Integer postsNumber = posts.size();
        System.out.println(post.getContent());
        System.out.println(postsNumber);

        postsService.savePost(post.getContent(), user);
        //model.addAttribute("content", post.getContent());
        model.addAttribute("username", username);
        model.addAttribute("since", since.toLocalDate());
        model.addAttribute("postsNumber", postsNumber);

        return "me";
    }

    @GetMapping("/admin")
    String admin(Model model) {
        addUsernameAttribute(model);
        return "admin";
    }

    private void addUsernameAttribute(Model model){
        model.addAttribute("username", userDetailsService.username());
    }
}
