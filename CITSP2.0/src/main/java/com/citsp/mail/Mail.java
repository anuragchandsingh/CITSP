package com.citsp.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;






public class Mail {
	

	public static void sendMail(String name, String toAddress, int oid ) throws AddressException, MessagingException
	{
		Properties properties = System.getProperties();
		
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		Session newSession = Session.getDefaultInstance(properties,null);
		//---------------------------------------------------------------------
		
		String emailRecipients =toAddress;
		String emailSubject= "";
					
		String emailBody= "Hello,\n"+name+"\nYou have Successfully Registered on CITSP. \nYour ID is: "+  oid+
				" do not share with any one.\nThank You";
		
		MimeMessage mimeMessage =  new MimeMessage(newSession);		
		//for(int i=0; i<emailRecipients.length; i++)
		//{
			 mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailRecipients));
		//}
		mimeMessage.setSubject(emailSubject);
		
				
		MimeBodyPart bodyPart = new MimeBodyPart();
		bodyPart.setContent(emailBody,"text/plain");
	
		
		MimeMultipart multipart = new MimeMultipart();
		multipart.addBodyPart(bodyPart);
		
		mimeMessage.setContent(multipart);
		//----------------------------------------------------------------------
		
		String fromUser="citsp.info@gmail.com";
		String fromUserPassword="zyix ftzq kcjx astb";
		String emailHost="smtp.gmail.com";
		
		 
		
		Transport transport= newSession.getTransport("smtp");
		transport.connect(emailHost, fromUser, fromUserPassword);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
		
		
	}
	
	public static void sendMail(String name, String toAddress, int caseid, int id, String pass) throws AddressException, MessagingException
	{
		Properties properties = System.getProperties();
		
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		Session newSession = Session.getDefaultInstance(properties,null);
		//---------------------------------------------------------------------
		
		String emailRecipients =toAddress;
		String emailSubject= "";
				
		String emailBody= "Hello,\n"+name+"\nYou have successfully added to a case. Your CaseId is: "+caseid+
				", Officer Id is:"+id+" and Password is: "+pass+" do not share with any one.\nThank You";
		
		MimeMessage mimeMessage =  new MimeMessage(newSession);		
		//for(int i=0; i<emailRecipients.length; i++)
		//{
			 mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailRecipients));
		//}
		mimeMessage.setSubject(emailSubject);
		
				
		MimeBodyPart bodyPart = new MimeBodyPart();
		bodyPart.setContent(emailBody,"text/plain");
	
		
		MimeMultipart multipart = new MimeMultipart();
		multipart.addBodyPart(bodyPart);
		
		mimeMessage.setContent(multipart);
		//----------------------------------------------------------------------
		
		String fromUser="citsp.info@gmail.com";
		String fromUserPassword="zyix ftzq kcjx astb";
		String emailHost="smtp.gmail.com";
		
		 
		
		Transport transport= newSession.getTransport("smtp");
		transport.connect(emailHost, fromUser, fromUserPassword);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
		
		
	}

}
