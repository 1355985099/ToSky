package com.logistic.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


@Component
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
	
	    	/**
	    	 * @param username 用户名
	    	 * @param link 连接
	    	 * @param date 时限
	    	 * @return 返回用于激活邮件个数
	    	 */
	    	public  String simpleHtml(String username,String link,Date date) {
	    		StringBuilder format = new StringBuilder();
	    		format.append("<p>").append(username).append(":</p>");
	    		format.append("<p>谢谢您在 <span style=\"font-size:12px\" >通天国际物流<span></p>")
	    		.append("<p>注册次帐号</p>");
	    		format.append("<p><a href=\"").append(link+"\">").append("此链接用于激活帐号,").append("链接会在")
	    			.append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date))
	    			.append("后失效").append("</a></p>").append("<p>无法跳转时请复制以下连接--</p>").append("<p>"+link+"</p>");
	    		format.append("<p>--  通天国际物流 团队</p>");
				return format.toString();
	    		
	    	}
	  
}
