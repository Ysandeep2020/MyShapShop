package com.example.demo.securityConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import lombok.RequiredArgsConstructor;
import com.example.demo.login.UserLogin;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalMethodSecurity(securedEnabled = true, jsr250Enabled = true, prePostEnabled = true)

public class WebSecurityConfig {

	@Autowired
	private LoginUserDetailsService userDetailsService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public UserDetailsService userDetailsService() {
		return new LoginUserDetailsService();
	}

	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(userDetailsService);
		auth.setPasswordEncoder(passwordEncoder());
		return auth;
	}

	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
			throws Exception {
		return authenticationConfiguration.getAuthenticationManager();
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
				.antMatchers("/index","/signIn", "/js/**", "/css/**", "/resources/**", "/theme/**", "/docs/**", "/assets/**",
						"/static/**", "/css/**", "/js/**", "/images/**", "/img/**", "/test", "/register", "/otp-send",
						"/otp-resend", "/otp-verify", "/forgot-password", "/forgot-password/**", "/SaveRegistration",
						"/validate-login", "/invoiceGenerate", "/invoiceStatus", "/previous-invoice-list", "/tally/**",
						"/oauth/**", "/api/tally/**")
				.permitAll().anyRequest().authenticated().and().formLogin().loginPage("/home").defaultSuccessUrl("/")
				.and().logout().logoutUrl("/logout") // Specify the URL for logout
				.logoutSuccessUrl("/home") // Redirect after successful logout
				.permitAll();
//                .usernameParameter("email")
//                .passwordParameter("password")
//                .defaultSuccessUrl("/dashboard")
//                .failureUrl("/login?error")
//                .and()
//                .oauth2Login()
//                .loginPage("/login")
//                .userInfoEndpoint()
//                .userService(oauthUserService)
//                .and()
//                .successHandler(oAuthLoginSuccessHandler)
//                .and().logout().invalidateHttpSession(true).clearAuthentication(true)
//                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//                .logoutSuccessUrl("/signIn?logout")
//                .permitAll()
//                .and()
//                .exceptionHandling().accessDeniedPage("/403")
//                .and()
//                .httpBasic();
		return http.build();
	}

}
