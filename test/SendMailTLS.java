import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailTLS {

	public static void main(String[] args) {

		final String username = "ubuntu@yori.gotechsolutions.net";
		final String password = "pass1234";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "false");
		props.put("mail.smtp.starttls.enable", "false");
		props.put("mail.smtp.host", "yori.gotechsolutions.net");
		props.put("mail.smtp.port", "25");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(null, null);
			}
		  });

		try {
			
			String htmlContent = "<a a href=\"https://www.google.com\">sadasdasds</a>";

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ubuntu@yori.gotechsolutions.net"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("rhaynel.samar.sillador@gmail.com"));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("amontero.gotechsolutions@gmail.com"));
			message.setSubject("Testing Subject");
			message.setSentDate(new Date());
			// set plain text message
			message.setContent(htmlContent, "text/html");
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}