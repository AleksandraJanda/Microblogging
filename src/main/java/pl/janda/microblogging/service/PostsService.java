package pl.janda.microblogging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.repository.PostRepository;
import pl.janda.microblogging.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class PostsService {

    @Autowired
    PostRepository postRepository;

    @Autowired
    UserRepository userRepository;

    public void savePost(Post post, User user){
        post.setUser(user);
        post.setDateTime(LocalDateTime.now());
        postRepository.save(post);
    }

    private List<Post> findPosts(User user){
        Optional<List<Post>> find = postRepository.findAllByUser(user);
        return find.orElse(null);
    }

    public List<Post> getAllPostsFromWeek(){
        Optional<List<Post>> find = postRepository.findPostsByDateTimeBetween(LocalDateTime.now().minusDays(30),LocalDateTime.now());
        return find.orElse(null);
    }

    public List<Post> getAllPosts(){
        return postRepository.findAll();
    }

    public void postsAndAttributes(Model model, String username, User user, LocalDateTime since) {
        List<Post> posts = findPosts(user);
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
