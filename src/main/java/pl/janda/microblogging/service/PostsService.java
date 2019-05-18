package pl.janda.microblogging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.repository.PostRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class PostsService {

    @Autowired
    PostRepository postRepository;

    public void savePost(Post post, User user){
        post.setUser(user);
        post.setDateTime(LocalDateTime.now());
        postRepository.save(post);
    }

    public List<Post> findPosts(User user){
        Optional<List<Post>> find = postRepository.findAllByUser(user);
        return find.orElse(null);
    }
}
