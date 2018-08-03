package src;


import java.util.Properties;

import javax.mail.*;

import javax.mail.internet.*;



public class sendMail {
	 
	public void prepareMail(String tenant_email,String tenant_username,String tenant_password)
	{
		  String to = tenant_email;
	      
	      String from = "rentalmanagementsys@gmail.com";
	      
	      final String username = "rentalmanagementsys@gmail.com";
	      final String password = "RentSystem";

	      String host = "smtp.gmail.com";
System.out.println("at host");
	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");

	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });

	      try 
	      {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);
	       
	         message.setFrom(new InternetAddress(from));

	         message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

	         message.setSubject("Landlord's Manager");
	         
	         message.setText("Hello,\n \t This is Your Log In Details , \n \n \t \t User Name: \t "+ tenant_username +" \n \t \t Password : \t" + tenant_password+"\n \n This is Software generated Mail , Please do not Reply to this Mail");
	         System.out.println("at send");
	         Transport.send(message);

	         System.out.println("Sent message successfully....");

	      } 
	      catch (MessagingException e) 
	      {
	            throw new RuntimeException(e);
	      }
		
	}
	

public static void main(String[] args) 
   {
	   
      
   }
}