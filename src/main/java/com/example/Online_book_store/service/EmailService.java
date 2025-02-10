package com.example.Online_book_store.service;

import com.example.Online_book_store.object.OtpData;
import com.example.Online_book_store.util.JspTemplateProcessor;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.security.auth.Subject;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class EmailService {
     JavaMailSender mailSender;


    public String generateOTP() {
        Random rand = new Random();
        int otp = 100000 + rand.nextInt(900000); // tạo OTP 6 chữ số
        return String.valueOf(otp);
    }
    public void sendEmail(String to, String name, HttpSession session) throws MessagingException, IOException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "utf-8");
        Map<String,String> map=new HashMap<>();
        String otp=generateOTP();
        map.put("name",name);
        map.put("OTP",otp);
        OtpData otpData=new OtpData(otp, LocalDateTime.now().plus(5, ChronoUnit.MINUTES));
        session.setAttribute("otpData",otpData);
        String htmpContent= JspTemplateProcessor.process("src/main/webapp/WEB-INF/views/general/email-template.jsp",map);
        mimeMessageHelper.setFrom("emgaitoi201019974@gmail.com");
        mimeMessageHelper.setTo(to);
        mimeMessageHelper.setSubject("Mã OTP - Lấy Lại Mật Khẩu");
        mimeMessageHelper.setText(htmpContent,true);
        this.mailSender.send(mimeMessage);
    }
}
