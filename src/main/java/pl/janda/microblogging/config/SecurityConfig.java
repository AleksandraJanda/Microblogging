package pl.janda.microblogging.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import pl.janda.microblogging.service.UserDetailsServiceImpl;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .httpBasic()
                .and()
                .authorizeRequests()
                .antMatchers("/", "/home").permitAll()
                .antMatchers("/console").anonymous()
                //.antMatchers(HttpMethod.GET, "/app").permitAll()
                //.antMatchers(HttpMethod.POST, "/app").hasRole("MOD")
                //.antMatchers(HttpMethod.DELETE, "/app").hasRole("ADMIN")
                .antMatchers("/me/**").authenticated()
                .antMatchers("/admin").hasAuthority("ROLE_ADMIN")
                //.antMatchers("/admin").hasRole("ADMIN")
                //.anyRequest().hasRole("ADMIN")
                .and()
                .formLogin()
                .loginPage("/login").permitAll()
                .and()
                .logout()
                .logoutUrl("/logout").permitAll()
                .and()
                .csrf().disable();
        http.headers().frameOptions().disable();
    }
}