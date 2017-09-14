package com.logistic.tool;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class EmailUtils {
	  @Autowired
	    private JavaMailSender sender;  
	  @Value("${spring.mail.username}")
	    private String from;  
	    /** 
	     * 发送html格式的邮件 
	     * @param to 收件人
	     * @param subject  主题 
	     * @param content 
	     */  
	    public void sendHtmlMail(String to, String subject, String content){  
	        MimeMessage message = sender.createMimeMessage();  
	  
	        try {  
	            //true表示需要创建一个multipart message  
	            MimeMessageHelper helper = new MimeMessageHelper(message, true);  
	            helper.setFrom(from);  
	            helper.setTo(to);   //邮箱
	            helper.setSubject(subject);   //邮件主题
	            helper.setText(content, true);   //邮件内容
	            sender.send(message);  
	        } catch (MessagingException e) {  
	        	
	        }  
	    }	    
}
