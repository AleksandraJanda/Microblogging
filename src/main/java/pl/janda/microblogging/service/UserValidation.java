package pl.janda.microblogging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.janda.microblogging.model.User;
import pl.janda.microblogging.repository.UserRepository;

import java.util.Optional;

@Service
public class UserValidation {

    @Autowired
    UserRepository userRepository;

    public boolean validateUsername(String username) {
        Optional<User> user = userRepository.findUserByUsername(username);
        return username.length() > 3 && !user.isPresent();
    }

    public boolean validatePassword(String password, String passwordConfifm) {
        return password.equals(passwordConfifm) && password.length() > 3;
    }

    public boolean validateEmail(String email) {
        //String p = "^[_A-Za-z0-9-+]+(.[_A-Za-z0-9-]+)*@"+"[A-Za-z0-9-]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$";
        return email.length() > 4 && email.contains("@");
    }

    public boolean validateFields(String username, String password, String passwordConfirm, String email){
        return username.length()>0 && password.length()>0 && passwordConfirm.length()>0 && email.length()>0;
    }

}
