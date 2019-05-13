package pl.janda.microblogging.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findUserByPosts(Post post);
    Optional<User> findUserByUsername(String username);
}
