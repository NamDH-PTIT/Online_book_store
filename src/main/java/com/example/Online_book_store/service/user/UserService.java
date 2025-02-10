package com.example.Online_book_store.service.user;

import com.example.Online_book_store.DTO.DTO;
import com.example.Online_book_store.Entity.*;
import com.example.Online_book_store.exception.AppException;
import com.example.Online_book_store.exception.ErrorCode;
import com.example.Online_book_store.repository.*;
import com.example.Online_book_store.request.OrderDetailRequest;
import com.example.Online_book_store.request.OrderWrapper;
import com.example.Online_book_store.request.RegisterRequest;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Transactional
public class UserService {
    OrderDetailRepository orderDetailRepository;
    OrdersRepository ordersRepository;
    CategoryRepository categoryRepository;
    RoleRepository roleRepository;
    UserRepository userRepository;
    BookRepository bookRepository;
    AuthorRepository authorRepository;


    private String SIGNERKEY ="5/uLKaNGXKP7ccbcPdP2aFd00fr8soLNsVpaa7BozhuEUvWXA+e0tLSkIL9nndTsOCywzD0hSON++8EF7k9W/Gyk+FYkZOpoF2SVU2hI9VU=";

    public Users login(String username, String password) {
        Optional<Users> optionalUsers = userRepository.findByAccountname(username);
        if (optionalUsers.isPresent()) {
            Users users = optionalUsers.get();
            if (password.equals(users.getPassword())) {
                return users;
            }
        }
        return null;
    }

    public boolean createUser(RegisterRequest registerRequest) {
        if (userRepository.findByAccountname(registerRequest.getUsername()).isPresent()) {
            return false;
        } else {
            Roles roles = roleRepository.findByDescription("user").orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));

            Users user = DTO.toUser(registerRequest, roles);

            userRepository.save(user);
            return true;
        }
    }

    public List<Book> findAllBook() {
        return bookRepository.findAll();
    }

    public List<Category> findAllCategory() {
        return categoryRepository.findAll();
    }

    public Category findCategoryById(Integer id) {
        return categoryRepository.findById(id).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
    }

    public List<Author> findAllAuthor() {
        return authorRepository.findAll();
    }

    public Author findAuthorById(Integer id) {
        return authorRepository.findById(id).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
    }

    public Book getBookByTitle(String title) {
        return bookRepository.findByTitle(title).orElseThrow(() -> new RuntimeException());
    }

    @Transactional
    public void checkout(OrderWrapper orderWrapper, Users users) {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Orders orders = new Orders();
        orders.setUser(users);
        orders.setDate(simpleDateFormat.format(date));
        List<OrderDetail> orderDetails = new ArrayList<>();
        List<OrderDetailRequest> list = orderWrapper.getProduct();
        ordersRepository.save(orders);
        for (OrderDetailRequest orderDetailRequest : list) {
            OrderDetail orderDetail = new OrderDetail();
            int id = orderDetailRequest.getId();
            int quantity = orderDetailRequest.getQuantity();
            double price = orderDetailRequest.getPrice();
            Book book = bookRepository.findById(id).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
            book.setSoluongton(book.getSoluongton()-quantity);
            orderDetail.setOrder(orders);
            orderDetail.setQuantity(quantity);
            orderDetail.setPrice(price*quantity);
            orderDetail.setBook(book);
            bookRepository.save(book);
            orderDetails.add(orderDetail);
            orderDetailRepository.save(orderDetail);
        }
        orders.setOrderDetailList(orderDetails);
        ordersRepository.save(orders);

    }

    public List<Book> updateCart(OrderWrapper orderWrapper) {
        List<OrderDetailRequest> list = new ArrayList<>();
        if (orderWrapper.getProduct() != null)
            list = orderWrapper.getProduct();
        List<Book> books = new ArrayList<>();
        for (OrderDetailRequest orderDetailRequest : list) {
            int id = orderDetailRequest.getId();
            books.add(bookRepository.findById(id).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE)));
        }
        return books;
    }

    public boolean existBook(String title, List<Book> books) {
        for (Book book : books) {
            if (book.getTitle().equals(title))
                return true;
        }
        return false;
    }
    @Transactional
    public void updateUser(Users users)
    {
        Users user =userRepository.findById(users.getId()).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        user.setName(users.getName());
        user.setPassword(users.getPassword());
        user.setEmail(users.getEmail());
        user.setPhone(users.getPhone());
        userRepository.save(user);
    }
    public String generateToken(String username) {
        Users users=userRepository.findByAccountname(username).orElseThrow(() -> new AppException(ErrorCode.ERROR_CODE));
        JWSHeader header=new JWSHeader(JWSAlgorithm.HS512);
        JWTClaimsSet jwtClaimsSet=new JWTClaimsSet.Builder()
                .subject(username)
                .issuer("DTS.D2X")
                .issueTime(new Date())
                .expirationTime(new Date(Instant.now().plus(1, ChronoUnit.HOURS).toEpochMilli()))
                .claim("scope",users.getRole().getDescription())
                .build();
        Payload payload=new Payload(jwtClaimsSet.toJSONObject());
        JWSObject jwsObject=new JWSObject(header,payload);
        try {
            jwsObject.sign(new MACSigner(SIGNERKEY.getBytes()));
            return jwsObject.serialize();
        }
        catch (Exception e) {
            throw new AppException(ErrorCode.ERROR_CODE);
        }

    }
    public boolean verifyToken(String token) throws JOSEException, ParseException {
        JWSVerifier verifier=new MACVerifier(SIGNERKEY.getBytes());
        SignedJWT jwt=SignedJWT.parse(token);
        Date date=jwt.getJWTClaimsSet().getExpirationTime();
        boolean verify=jwt.verify(verifier);
        boolean checkDate=date.after(new Date());
        return verify&&checkDate ;

    }
    public List<Book> findListBook(String title) {
       return bookRepository.findBooksByTitle(title);
    }
}
