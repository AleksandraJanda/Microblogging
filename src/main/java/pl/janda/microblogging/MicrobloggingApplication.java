package pl.janda.microblogging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import pl.janda.microblogging.model.Post;
import pl.janda.microblogging.model.Role;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.repository.PostRepository;
import pl.janda.microblogging.repository.RoleRepository;
import pl.janda.microblogging.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@SpringBootApplication
public class MicrobloggingApplication implements CommandLineRunner {

    public static void main(String[] args) {
        SpringApplication.run(MicrobloggingApplication.class, args);
    }

    @Autowired
    UserRepository userRepository;

    @Autowired
    PostRepository postRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        Role roleUser = new Role("ROLE_USER");
        Role roleAdmin = new Role("ROLE_ADMIN");
        roleRepository.save(roleUser);
        roleRepository.save(roleAdmin);

        User user1 = new User("user1",passwordEncoder.encode("pass"),"aleksandra_janda@wp.pl",LocalDateTime.now(),roleUser);
        userRepository.save(user1);

        User admin = new User("admin",passwordEncoder.encode("admin"),"user1@gmail.com",LocalDateTime.now(),roleAdmin);
        userRepository.save(admin);

        Post post1 = new Post("Life is pure fun!",LocalDateTime.now().minusDays(10),user1);
        postRepository.save(post1);

        List<Post> list = new ArrayList<>();
        list.add(post1);

        user1.setPosts(list);
        userRepository.save(user1);

        Post post2 = new Post("What about party tonight?",LocalDateTime.now(),user1);
        postRepository.save(post2);

        list.add(post2);
        user1.setPosts(list);
        userRepository.save(user1);
    }
}
