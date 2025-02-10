package com.example.Online_book_store.controller;

import com.example.Online_book_store.Entity.Book;
import com.example.Online_book_store.Entity.NhaCungCap;
import com.example.Online_book_store.request.ChiTietPhieuNhapWrapper;
import com.example.Online_book_store.request.EditUserRequest;
import com.example.Online_book_store.response.OrderResponse;
import com.example.Online_book_store.response.ProductResponse;
import com.example.Online_book_store.response.UserResponse;
import com.example.Online_book_store.service.EmailService;
import com.example.Online_book_store.service.admin.AdminService;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AdminController {

    AdminService adminService;
    EmailService emailService;
    @GetMapping("home")
    String getInfor(Model model) {

        List<UserResponse> userResponse = adminService.getRole("admin");
        model.addAttribute("User", userResponse);

        return "admin/home";
    }

    @GetMapping("manageraccount")
    String managerAccount(Model model, @RequestParam(required = false) String name, @RequestParam(required = false) String phone) {
        List<UserResponse> userResponse = adminService.findUser(name, phone);
        model.addAttribute("User", userResponse);
        return "admin/manageraccount";
    }

    @GetMapping("warehouse")
    String warehouse(Model model) {
        List<Book> list=adminService.getAllBook();
        model.addAttribute("books", list);
        List<NhaCungCap> nhaCungCaps=adminService.getAllNCC();
        model.addAttribute("nhcungCaps", nhaCungCaps);
        List<ProductResponse> books = adminService.getProduct();
        model.addAttribute("ProductResponse", books);
        return "admin/inventorymanagement";
    }

    @GetMapping("product")
    String getProduct(Model model) {

        List<Book> books = adminService.getAllBook();
        model.addAttribute("books", books);
        return "admin/product";
    }
    @GetMapping("order")
    String order(Model model, @RequestParam(required = false) String code, @RequestParam(required = false) String name) {

        List<OrderResponse> order = adminService.getOrder(code, name);
        model.addAttribute("order", order);
        return "admin/order";
    }
    @GetMapping("editusers")
    String editUsers(Model model, @RequestParam("accountname") String accountname) {
        model.addAttribute("user",adminService.getUserByAccountName(accountname));
        return "admin/editusers";
    }
    @PostMapping("editusers")
    String updateUsers(Model model, @ModelAttribute EditUserRequest editUserRequest) {
        adminService.updateUser(editUserRequest);
        return "redirect:/admin/home";
    }
    @GetMapping("editbook")
    String editBook(Model model,@RequestParam("id") Integer id) {
        Book books = adminService.getProductById(id);

        model.addAttribute("books", books);
        return "admin/editbook";
    }
    @PostMapping("editbook")
    String editBook(Model model,@ModelAttribute Book book,@RequestParam("file") MultipartFile img) {
        adminService.updateProduct(book,img.getOriginalFilename());

        return "redirect:/admin/product";
    }
    @GetMapping("orderinfo")
    String orderinfo(Model model,@RequestParam(required = false) int code) {
        model.addAttribute("order",adminService.findOrderById(code));
        return "admin/orderinfo";
    }
    @GetMapping("phieunhap")
    String phieunhap(Model model) {
        model.addAttribute("ncc",adminService.getAllNCC());
        return "admin/phieunhap";
    }
    @PostMapping("phieunhap")
    String phieuNhapSave(Model model, @ModelAttribute ChiTietPhieuNhapWrapper chiTietPhieuNhapWrapper
            , @RequestParam(name = "ncc") String ncc) {
        adminService.phieuNhap(chiTietPhieuNhapWrapper,ncc);
        return "redirect:/admin/warehouse";
    }



}
