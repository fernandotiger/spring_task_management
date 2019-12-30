package com.demo.taskmanagment.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
    private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	
	@Autowired
	private DataSource dataSource;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//super.configure(http);
		System.out.println("TESTE 111 ");
		System.out.println("TESTE: "+http.authorizeRequests());
		http.authorizeRequests().antMatchers("/", "/register", "/about","/font/**", "/login", "/saveUser", "/css/**", "/images/**", "/js/**").permitAll()
		.antMatchers("/myTasks").hasAnyRole("USER,ADMIN")
		.antMatchers("/taskForm").authenticated()
		.antMatchers("/userList", "addTask").hasRole("ADMIN")
		.antMatchers("/allTasks").hasRole("ADMIN").and()
		//.anyRequest().authenticated().and()
		.formLogin().loginPage("/login").permitAll()
		.defaultSuccessUrl("/myTasks")
		.successHandler( customAuthenticationSuccessHandler ) // added for login session
        //.failureUrl("/login?error=true")  // added for login session
        .and()
		.logout().logoutSuccessUrl("/login")
		.and().csrf().ignoringAntMatchers("/logout")
		;
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//super.configure(auth);
		System.out.println("TESTE 2222 ");
		// the true means the user can be authenticated, its like the user is active
		auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery("select email as principal, password as credentials, true from user where email = ?")
		.authoritiesByUsernameQuery("select user_email as principal, role_name as role from user_roles where user_email = ?")
		.passwordEncoder(passwordEncoder()).rolePrefix("ROLE_");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
