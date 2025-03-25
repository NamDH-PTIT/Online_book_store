package com.example.Online_book_store.service.admin;

import com.example.Online_book_store.DTO.DTO;
import com.example.Online_book_store.Entity.*;
import com.example.Online_book_store.exception.AppException;
import com.example.Online_book_store.exception.ErrorCode;
import com.example.Online_book_store.object.OtpData;
import com.example.Online_book_store.repository.*;
import com.example.Online_book_store.request.ChiTietPhieuNhapRequest;
import com.example.Online_book_store.request.ChiTietPhieuNhapWrapper;
import com.example.Online_book_store.request.EditUserRequest;
import com.example.Online_book_store.response.OrderResponse;
import com.example.Online_book_store.response.ProductResponse;
import com.example.Online_book_store.response.UserResponse;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AdminService {
    ChiTietPhieuNhapRepository chiTietPhieuRepository;

    AuthorRepository authorRepository;

    CategoryRepository categoryRepository;

    NhaCungCapRepository nhaCungCapRepository;

    OrdersRepository ordersRepository;

    UserRepository userRepository;

    RoleRepository roleRepository;

    HttpSession session;

    BookRepository bookRepository;
    PhieuNhapRepository phieuNhapRepository;
    public List<UserResponse> getRole(String description)
    {
        Roles role=roleRepository.findByDescription(description).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));


        return DTO.userResponse(role.getUsers());
    }

    public List<ProductResponse> getProduct()
    {
        List<ProductResponse> books=DTO.bookResponse(bookRepository.findAll());
        return books;
    }
    public List<Book> getAllBook()
    {
        return bookRepository.findAll();
    }
    public  List<Book> getProductByTitle(String title)
    {
        List<Book> books=new ArrayList<>();
        books.add(bookRepository.findByTitle(title).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE)));
        return books;
    }
    public List<UserResponse> findUser(String name,String phone)
    {
        List<Users> users;
        if(name!=null&&phone!=null&&name.length()>0&&phone.length()>0)
        {
            users=userRepository.findByNameAndPhone(name,phone).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        }
        else if(name!=null&&name.length()>0)
        {
            users=userRepository.findByName(name).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        }
        else if(phone!=null&&phone.length()>0)
        {
            users=userRepository.findByPhone(phone).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        }
        else
        {
            Roles role=roleRepository.findByDescription("user").orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
            users=role.getUsers();
        }

        return DTO.userResponse(users);

    }
    public List<OrderResponse> getOrder(String code, String name)
    {
        if(code!=null&&name!=null&&name.length()>0&&code.length()>0)
        {
            Orders orders=ordersRepository.getOrder(name,code);
            return DTO.codeToOrderResponse(orders);
        }
        else if(code!=null&&code.length()>0)
        {
                Orders orders=ordersRepository.findById(Integer.parseInt(code)).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
                return DTO.codeToOrderResponse(orders);
        }
        else if(name!=null&&name.length()>0)
        {
            List<Users> list=userRepository.findByName(name).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
            return DTO.nameToOrderResponse(list);
        }
        else
        {
            List<Orders> list=ordersRepository.findAll();
            List<OrderResponse> orderResponses=new ArrayList<>();
            for (Orders orders:list)
            {
                List<OrderDetail> orderDetails = orders.getOrderDetailList();
                int total=0;
                for(OrderDetail orderDetail : orderDetails) {
                    total+=orderDetail.getPrice()*orderDetail.getQuantity();
                }
                orderResponses.add(OrderResponse.builder()
                        .code(orders.getId())
                        .customer(orders.getUser().getName())
                        .date(orders.getDate())
                        .total(total)
                        .hinhThuc("Thanh toán trực tiếp")
                        .build());
            }
            return orderResponses;
        }


    }
    public Users getUserByAccountName(String accountName)
    {
        Users users=userRepository.findByAccountname(accountName).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        return users;
    }
    public void updatePassword(String password)
    {

        Users users=getUserByAccountName((String)session.getAttribute("username"));

        users.setPassword(password);
        userRepository.save(users);
    }
    public void updateUser(EditUserRequest editUserRequest)
    {
        Users users= userRepository.findByAccountname(editUserRequest.getAccount_name()).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        users.setName(editUserRequest.getName());
        users.setPhone(editUserRequest.getPhone());
        users.setPassword(editUserRequest.getPassword());
        userRepository.save(users);

    }
    public Book getProductById(Integer id)
    {
        return bookRepository.findById(id).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
    }
    public void updateProduct(Book book ,String img)
    {
        Book book1=bookRepository.findById(book.getId()).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        book1.setPrice(book.getPrice());
        book1.setDescription(book.getDescription());
        book1.setImg("/img/"+img);
        bookRepository.save(book1);
    }
    public Orders findOrderById(Integer id)
    {
        return ordersRepository.findById(id).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
    }
    public List<NhaCungCap> getAllNCC()
    {
        return nhaCungCapRepository.findAll();
    }
    @Transactional
    public void phieuNhap(ChiTietPhieuNhapWrapper chiTietPhieuNhap,String ncc)
    {
        LocalDate today = LocalDate.now();

        // Định dạng ngày
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = today.format(formatter);
        NhaCungCap nhaCungCap=nhaCungCapRepository.findByName(ncc).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        PhieuNhap phieuNhap=PhieuNhap.builder()
                .nhaCungCap(nhaCungCap)
                .date(formattedDate).build();
        phieuNhapRepository.save(phieuNhap);
        List<ChiTietPhieuNhap> chiTietPhieuNhaps=new ArrayList<>();
        List<ChiTietPhieuNhapRequest> list=chiTietPhieuNhap.getChiTietPhieuNhapRequests();
        for(ChiTietPhieuNhapRequest request:list)
        {

            Book book=new Book();
            Author author=new Author();
            Category category=new Category();
            Optional<Author> optionalAuthor=authorRepository.findByName(request.getAuthor());
            Optional<Book> optionalBook=bookRepository.findByTitle(request.getBook());
            Optional<Category> optionalCategory =categoryRepository.findByName(request.getCategory());
            ChiTietPhieuNhap chiTietPhieuNhap1=new ChiTietPhieuNhap();

            if(optionalBook.isPresent())
            {
                book=optionalBook.get();
                book.setSoluongton(book.getSoluongton()+request.getQuantity());
                if(book.getPrice()<(int)request.getPrice())
                {
                    book.setPrice((int)request.getPrice()+10000);
                }
                chiTietPhieuNhaps=book.getChiTietPhieuNhaps();



            }
            else{
                if(optionalAuthor.isPresent())
                {
                    author=optionalAuthor.get();
                }
                else
                {
                    author.setName(request.getAuthor());
                    authorRepository.save(author);
                }
                if(optionalCategory.isPresent())
                {
                    category=optionalCategory.get();
                }
                else
                {
                    category.setName(request.getCategory());
                    categoryRepository.save(category);
                }
                book.setTitle(request.getBook());
                book.setDescription(request.getCategory());
                book.setCategory(category);
                book.setAuthor(author);
                book.setPrice((int)(request.getPrice()*110/100));
                book.setSoluongton(request.getQuantity());


            }
            chiTietPhieuNhap1.setBook(book);
            chiTietPhieuNhap1.setQuantity(request.getQuantity());
            chiTietPhieuNhap1.setPhieuNhap(phieuNhap);
            chiTietPhieuNhap1.setPrice((int)request.getPrice());
            chiTietPhieuRepository.save(chiTietPhieuNhap1);
            chiTietPhieuNhaps.add(chiTietPhieuNhap1);
            book.setChiTietPhieuNhaps(chiTietPhieuNhaps);
//            phieuNhap.setChiTietPhieuNhaps(chiTietPhieuNhaps);
            if(optionalBook.isPresent())
            {
                List<ChiTietPhieuNhap> current=new ArrayList<>();
                current.add(chiTietPhieuNhap1);
                phieuNhap.setChiTietPhieuNhaps(current);
            }
            else
            {
                phieuNhap.setChiTietPhieuNhaps(chiTietPhieuNhaps);
            }
            bookRepository.save(book);
            phieuNhapRepository.save(phieuNhap);
        }
    }
    public boolean validate(HttpSession session, String otp) {
        OtpData otpData = (OtpData) session.getAttribute("otpData");
        return otpData != null
                && !LocalDateTime.now().isAfter(otpData.getDate())
                && otp.equals(otpData.getOtp());
    }

    public boolean checkRequestOtp(String username, String email) {
        return userRepository.findByAccountname(username)
                .map(user -> user.getEmail().equals(email))
                .orElse(false);
    }


    public List<Book> getQuantity()
    {
        return bookRepository.getQuantityBook();
    }

}
