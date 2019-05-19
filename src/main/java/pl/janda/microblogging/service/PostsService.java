package pl.janda.microblogging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.repository.PostRepository;
import pl.janda.microblogging.repository.UserRepository;

import java.time.LocalDateTime;
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
        if(LocalDateTime.now().toLocalTime().getHour()<10){

        }
    }

    public List<Post> findPosts(User user){
        Optional<List<Post>> find = postRepository.findAllByUser(user);
        return find.orElse(null);
    }

    public List<Post> getAllPostsFromWeek(){
        Optional<List<Post>> find = postRepository.findPostsByDateTimeBetween(LocalDateTime.now().minusDays(30),LocalDateTime.now());
        return find.orElse(null);
    }
}
