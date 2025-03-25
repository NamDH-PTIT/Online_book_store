package com.example.Online_book_store.config;

import com.example.Online_book_store.filtercustom.JWTAuthenticationFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    private final String[] PUBLIC_ENDPOINTS_GET = {"/","/account/login","/logout1","/account/register","book-category","book-author","cart","search-book","/403","/forgot","/resetpassword"
    };
    private final String[] PUBLIC_ENDPOINTS_POST = {"/account/login","/account/register","/","update-cart","checkout","/forgot","/resetpassword"

    };
    @Bean
    public JWTAuthenticationFilter jwtAuthenticationFilter() {
        return new JWTAuthenticationFilter();
    }
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(httpSecurityCsrfConfigurer -> httpSecurityCsrfConfigurer.disable());
        http.sessionManagement(session -> session
                .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)); // Tạo session nếu cần thiết

        http.authorizeRequests(request->request.requestMatchers(HttpMethod.GET,PUBLIC_ENDPOINTS_GET).permitAll()
                .requestMatchers(HttpMethod.POST,PUBLIC_ENDPOINTS_POST).permitAll()
                .requestMatchers(HttpMethod.GET,"account/profile").hasRole("USER")
                .requestMatchers(HttpMethod.GET,"admin/**").hasRole("ADMIN")
                .requestMatchers("/WEB-INF/views/**").permitAll()
                .requestMatchers("/img/**", "/css/**", "/js/**", "/resources/**").permitAll()
                .anyRequest().authenticated()

        );
        http.logout(logout -> logout
                .logoutUrl("/logout")  // Đăng xuất qua GET request gửi tới /logout
                .logoutSuccessUrl("/")  // Sau khi đăng xuất thành công, chuyển hướng về trang chủ
                .invalidateHttpSession(true)  // Hủy session sau khi đăng xuất
                .clearAuthentication(true));   // URL mà người dùng sẽ gửi yêu cầu GET tới để đăng xuất
//                        .logoutSuccessUrl("/logout"));
        http.exceptionHandling(handle->handle.authenticationEntryPoint(new LoginUrlAuthenticationEntryPoint("/403"))
                //authenticationEntryPoint :chưa xác thực
                .accessDeniedPage("/403"));
        //accessDeniedPage :là đã xác thực nhưng k có quyền
        http.addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);
        // Các yêu cầu khác cần xác thực
        return http.build();
    }

}
