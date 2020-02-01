package util;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;



public class testing 
{

	private static String host="";
	private static String port="";
	private static String username="";
	private static String password="";    
	    
	public static void main(String p[])
	{
		sendMail("ritesh.jeetujain@gmail.com","247RecruitmentIS@247customer.com","123456@abc","Hi","hello");
	}
	
	 
	public static void sendMail( String username1, String password1, String Email_id, String msg, String subject) 
	{	   
	  String status = "";
	try
	{
	javax.mail.Session session;	       
	host = "webmail.247customer.com";
	port = "465";
	String authh = "true";
	                
	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", port);
	props.put("mail.smtp.starttls.enable","true");
	 
	props.put("mail.smtp.debug", "true");
	props.put("mail.smtp.socketFactory.port","465");
	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.socketFactory.fallback","false");
	 
	props.put("mail.smtp.auth", "true");
	 
	// This is From email Address which requires username and password 
	username=username1;
	password=password1;
	 
	String from="247"+"Online";
	String sendmessage=msg;
	           
	// To is  email address to be sent. 
    // String to[]={"vishnuniit2010@gmail.com"};
	String to[]=Email_id.split(",");
	 
	Authenticator auth = new SMTPAuthenticator();
	System.out.println(auth);
	session = javax.mail.Session.getDefaultInstance(props,auth);
	 
	 
	MimeMessage message = new MimeMessage(session);
	message.setFrom(new InternetAddress(from));
	 
	InternetAddress[] address = new InternetAddress[to.length];            
	for(int i=0;i<to.length;i++)
	{
	address[i] =  new InternetAddress(to[i]);
	}
	           
	message.addRecipients(Message.RecipientType.BCC, address);
	message.setSubject(subject);
	message.setDataHandler(new DataHandler(new ByteArrayDataSource(sendmessage, "text/html")));
	           
	        
	Transport.send(message);            
	status="success";   
	System.out.println(" Success ");
	}       
	catch (MessagingException ex) 
	{
	ex.printStackTrace();
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
	      
	   }	 

	static class SMTPAuthenticator extends javax.mail.Authenticator
	{    
	    public PasswordAuthentication getPasswordAuthentication()
	    {   
	    username=username;
	    password=password;
	   
	    return new PasswordAuthentication(username, password);
	    }
	}
	
	
}
