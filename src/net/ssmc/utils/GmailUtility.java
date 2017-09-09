package net.ssmc.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;

import net.ssmc.model.Email;

public class GmailUtility {

	@Value("{username}")
	private String username;
	@Value("{password}")
	private String password;
	@Value("{mail.smtp.auth}")
	private String auth;
	@Value("{mail.smtp.starttls.enable}")
	private String enable;
	@Value("{mail.smtp.host}")
	private String host;
	@Value("{mail.smtp.port}")
	private String port;
	private Session session;
	
	
	public void init(){
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", auth);
		properties.put("mail.smtp.starttls.enable", enable);
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", 587);
		
		System.out.println(port);
		
		Session session = Session.getInstance(properties,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
		System.out.println("email session created.");
		
		this.session=session;
	}
	
	public void sendEmail(Email email){
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress(username));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getEmail()));
					message.setSubject(email.getSubject());
					message.setContent(email.getMessage(), "text/html");
					Transport.send(message);
					
				} catch (MessagingException e) {
				}
			}
		}).start();
		
		
	}
	
	
}
