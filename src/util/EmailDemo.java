package util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;


public class EmailDemo 
{

	private static String host="sinprd0310.outlook.com";
	private static String port="587";
	final static String username = "247apps@247-inc.com";
	final static String password = "IS247#inc";
	public static void main(String p[])
	{
		//sendMailNew("ritesh","121212","ritesh.jeetujain@gmail.com","sdfsdf","spring test");
	}
	public static void sendMailNew( String username1, String password1, String to, String body, String subject) 
	{	   

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props,new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(username, password);
			}
		});
		try 
		{
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("247apps@247-inc.com","Springboard-No-Reply"));
			String tonew[] = to.split(",");
			InternetAddress[] address = new InternetAddress[tonew.length];
			for(int i=0;i<tonew.length;i++)
			{
				address[i] =  new InternetAddress(tonew[i]);
			}
			message.setRecipients(Message.RecipientType.TO,address);
			message.setSubject(subject);
			MimeBodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(body, "text/html");
			message.setContent(body, "text/html");
			Transport.send(message);			
		} 
		catch (Exception e) 
		{
			throw new RuntimeException(e);
		}
	}

	public static void sendMail( String username1, String password1, String to, String body, String subject) 
	{	   

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props,new javax.mail.Authenticator() 
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication(username, password);
			}
		});
		try 
		{
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("247apps@247-inc.com","Springboard-No-Reply"));
			String tonew[] = to.split(",");
			InternetAddress[] address = new InternetAddress[tonew.length];            
			for(int i=0;i<tonew.length;i++)
			{
				address[i] =  new InternetAddress(tonew[i]);
			}
			message.setRecipients(Message.RecipientType.BCC,address);
			message.setSubject(subject);
			MimeBodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(body, "text/html");
			message.setContent(body, "text/html");
			Transport.send(message);			
		} 
		catch (Exception e) 
		{
			throw new RuntimeException(e);
		}
	}

}
