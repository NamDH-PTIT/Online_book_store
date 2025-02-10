package com.example.Online_book_store.controller;

import com.example.Online_book_store.Entity.Book;
import com.example.Online_book_store.Entity.Users;
import com.example.Online_book_store.request.OrderWrapper;
import com.example.Online_book_store.request.RegisterRequest;
import com.example.Online_book_store.service.EmailService;
import com.example.Online_book_store.service.admin.AdminService;
import com.example.Online_book_store.service.user.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Controller
public class UserController {
    UserService userService;
    AdminService adminService;
    EmailService emailService;
    @GetMapping("/")
    public String home(Model model,HttpSession session) throws Exception {

        model.addAttribute("books",userService.findAllBook());
        model.addAttribute("categorys",userService.findAllCategory());
        model.addAttribute("authors",userService.findAllAuthor());
        return "home";
    }
    @GetMapping("/account/login")
    String showLoginForm(HttpSession session, Model model)
    {
        if(session.getAttribute("user") != null)
            return "redirect:/";
        return "general/login";
    }
    @PostMapping("/account/login")
    String login(@RequestParam String username,
                 @RequestParam String password,
                 HttpSession session) {
        Users users= userService.login(username, password);
        if(users!=null) {
            session.setAttribute("token",userService.generateToken(username));
            session.setAttribute("user", users);
            if("admin".equals(users.getRole().getDescription())) {
                session.removeAttribute("book-cart");
                return "redirect:/admin/home";
            }
            else
                return "redirect:/";
        }
        else
        {
            session.setAttribute("error", "tài khoản hoặc mật khẩu không đúng");
            return "error";
        }

    }
    @GetMapping("/logout")
     String logout(HttpSession session) {
        session.invalidate(); // Xóa session
        return "redirect:/";
    }
    @GetMapping("/account/register")
    String showRegisterForm() {
        return "general/register";
    }
    @PostMapping("/account/register")
    String register(@ModelAttribute RegisterRequest registerRequest, Model model) {

        boolean kiemTra=userService.createUser(registerRequest);
        if(kiemTra)
        {
            model.addAttribute("success","success");
            return "success";
        }
        else{
            model.addAttribute("error","error");
            return "error";
        }

    }
    @GetMapping("book-category")
    String showBookCategory(@RequestParam (name = "id") Integer id,Model model) {
        if (id==0)
            return "redirect:/";
        model.addAttribute("books",userService.findCategoryById(id).getBooks());
        model.addAttribute("categorys",userService.findAllCategory());
        model.addAttribute("authors",userService.findAllAuthor());
        return "home";

    }
    @GetMapping("book-author")
    String showAuthor(@RequestParam (name = "id") Integer id,Model model) {
        if (id==0)
            return "redirect:/";
        model.addAttribute("books",userService.findAuthorById(id).getBooks());
        model.addAttribute("authors",userService.findAllAuthor());
        model.addAttribute("categorys",userService.findAllCategory());
        return "home";

    }

    @PostMapping("/")
    String addBook(HttpSession httpSession,@RequestParam(name = "title") String title)
    {

        List<Book> list= httpSession.getAttribute("book-cart")==null?new ArrayList<>():(List<Book>) httpSession.getAttribute("book-cart");
        if(!userService.existBook(title,list))
            list.add(userService.getBookByTitle(title));

        httpSession.setAttribute("book-cart",list);
        return "redirect:/";
    }


    @GetMapping("cart")
    String showCart (Model model,HttpSession session)
    {
//        List<Book> list= httpSession.getAttribute("book-cart")==null?new ArrayList<>():(List<Book>) httpSession.getAttribute("book-cart");
//        list.add(userService.getBookByTitle(title));
//        httpSession.setAttribute("book-cart",list);
        model.addAttribute("books",session.getAttribute("book-cart"));
        return "user/cart";
    }
    @PostMapping("checkout")
    String checkOut(HttpSession httpSession, Model model , @ModelAttribute OrderWrapper orderWrapper)
    {
        if(httpSession.getAttribute("user") == null)
            return "redirect:/account/login";
        if(httpSession.getAttribute("book-cart")==null)
            return "redirect:/";
        userService.checkout(orderWrapper,(Users) httpSession.getAttribute("user"));
        httpSession.removeAttribute("book-cart");
        model.addAttribute("success","Thanh toan thanh cong");
        return "success";
    }
    @PostMapping("/update-cart")
    String updateCart(@ModelAttribute OrderWrapper orderWrapper,HttpSession session)
    {
        if(session.getAttribute("book-cart") == null)
            return "redirect:/";
        session.setAttribute("book-cart",userService.updateCart(orderWrapper));
        return "redirect:/";
    }
    @GetMapping("/account/profile")
    String showProfile(HttpSession session,Model model)
    {
        if(session.getAttribute("user") == null)
            return "redirect:/";
        String name=(String)((Users)session.getAttribute("user")).getAccountname();
        model.addAttribute("user",adminService.getUserByAccountName(name));
        return "user/profile";
    }
    @PostMapping("update-info")
    String updateInfo(@ModelAttribute Users users,HttpSession session,Model model)
    {
        model.addAttribute("success","thay đổi thành công");
        userService.updateUser(users);
        return "success";
    }
    @GetMapping("/search-book")
    String searchBook(@RequestParam (name = "search") String search,HttpSession session,Model model)
    {
        if(search.trim().equals(""))
            return "redirect:/";
        model.addAttribute("books",userService.findListBook(search));
        return "home";
    }
    @GetMapping("/403")
    String accessDenied(HttpSession session,Model model)
    {
//        model.addAttribute("error","access denied");
        return "error";
    }
    @GetMapping("forgot")
    String showForgot(){
        return"general/forgot";
    }
    @PostMapping("/forgot")
    String forgot(Model model,@RequestParam("email") String email,@RequestParam("username") String username,HttpSession session) throws Exception {
        if(!adminService.checkRequestOtp(username, email))
        {
            model.addAttribute("error","email và tài khoản không khớp");
            return "error";
        }
        session.setAttribute("username",username);
        emailService.sendEmail(email,"nam",session);
            return "redirect:/resetpassword";
    }
    @GetMapping("/resetpassword")
    String showResetPassword(Model model) {
        return "general/resetpassword";
    }
    @PostMapping("/resetpassword")
    String resetPass(@RequestParam("otp") String otp,@RequestParam("password") String password,HttpSession session,Model model)
    {

        boolean checkOTP=adminService.validate(session,otp);
        if(checkOTP)
        {
            adminService.updatePassword(password);
            model.addAttribute("success","thay đổi thành công");
        }
        else
        {
            model.addAttribute("error","không hợp lệ");
            return "error";
        }

        return "success";

    }
}
