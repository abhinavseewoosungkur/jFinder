package com.jfinder.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  DataSource dataSource;

  @Autowired
  public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {

    auth.jdbcAuthentication().dataSource(dataSource)
        .usersByUsernameQuery(
            "select username,password, enabled from login where username=?")
        .authoritiesByUsernameQuery(
            "select username, role from user_roles where username=?");
  }

/*  @Autowired
  public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
    auth.inMemoryAuthentication().withUser("admin").password("123456").roles("ADMIN");
  }*/



  @Override
  protected void configure(HttpSecurity http) throws Exception {

    http.csrf().disable();

    http.authorizeRequests()
        .antMatchers("/Administrator/**").access("hasRole('ROLE_ADMIN')")
        .and().formLogin().loginPage("/login")
        .permitAll();

    http.authorizeRequests()
        .antMatchers("/Administrator.**").access("hasRole('ROLE_ADMIN')")
        .and().formLogin().loginPage("/login")
        .permitAll();
  }
}
