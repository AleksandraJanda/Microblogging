package pl.janda.microblogging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.repository.PostRepository;
import pl.janda.microblogging.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PostRepository postRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Optional<User> byLogin = userRepository.findUserByUsername(s);
        return byLogin.orElse(null);
    }

    public String username(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getName();
    }

    public void saveUserWithPosts(Post post, User user){
        List<Post> posts = user.getPosts();
        posts.add(post);
        user.setPosts(posts);
        userRepository.save(user);
    }
}