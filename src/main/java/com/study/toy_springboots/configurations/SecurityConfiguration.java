package com.study.toy_springboots.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf().disable();

        httpSecurity.authorizeRequests()
            .antMatchers("/member/*").authenticated()
            .antMatchers("/manager/*").access("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
            .antMatchers("/admin/*").access("hasRole('ROLE_ADMIN')")
            .anyRequest().permitAll();
            

        // 로그인 메뉴
        httpSecurity.formLogin().loginPage("/loginpage")
        .loginProcessingUrl("/login") // 
        .defaultSuccessUrl("/");

        return httpSecurity.build();
    }

    @Bean
    public BCryptPasswordEncoder getBCryptPasswordEncorder() {
        return new BCryptPasswordEncoder();
    }
}
