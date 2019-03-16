package com;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class otpSender {

	public static void sendmail(int otp) {

		final String username = "abineshsiva191@gmail.com";
		final String password = "123abc.D";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("abineshsiva191@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("abineshsiva191@gmail.com"));
			message.setSubject("Testing Subject");
			message.setText("Dear User,"
				+ "\n\n The otp to sign is "+otp);

			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}