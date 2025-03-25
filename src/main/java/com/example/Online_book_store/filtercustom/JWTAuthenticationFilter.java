package com.example.Online_book_store.filtercustom;

import com.example.Online_book_store.Entity.Users;
import com.example.Online_book_store.service.user.UserService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@Component
public class JWTAuthenticationFilter extends OncePerRequestFilter {
    @Autowired
    UserService userService;
    private String SIGNERKEY ="5/uLKaNGXKP7ccbcPdP2aFd00fr8soLNsVpaa7BozhuEUvWXA+e0tLSkIL9nndTsOCywzD0hSON++8EF7k9W/Gyk+FYkZOpoF2SVU2hI9VU=";

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException  {
        HttpSession session = request.getSession();

        if(session!=null)
        {
            String token=(String)session.getAttribute("token");
            if(token!=null)
            {
                try {
                    boolean verify=userService.verifyToken(token);
                    if(!verify)
                    {
                        return;
                    }
                    Users users=(Users) session.getAttribute("user");
                    UsernamePasswordAuthenticationToken authentication=new UsernamePasswordAuthenticationToken(users,null,getAuthorities(users));
                    SecurityContextHolder.getContext().setAuthentication(authentication);  // Đặt vào SecurityContext

                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
                  }
        }
        filterChain.doFilter(request, response);
    }
    private List<GrantedAuthority> getAuthorities(Users user) {
        // Lấy quyền hạn của người dùng từ roles
        return Collections.singletonList(new SimpleGrantedAuthority("ROLE_"+(user.getRole().getDescription()).toUpperCase()));  // Ví dụ cấp quyền USER
    }
}
