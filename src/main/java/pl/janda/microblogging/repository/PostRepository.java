package pl.janda.microblogging.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.User;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    Optional<List<Post>> findAllByUser(User user);
    Optional<List<Post>> findPostsByDateTimeBetween(LocalDateTime dateTime1, LocalDateTime dateTime2);
}
