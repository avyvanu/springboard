package util;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailFunction 
{
	
	public static boolean mailSending(String to,String Mailmessage)throws Exception
	{
		String host = "smtp.wifinitytech.com";
	    String from = "WifinityAlert@wifinitytech.com";
	    to = "rajesh.pillai.r@gmail.com";
	    // Get system properties
	    Properties props = System.getProperties();
	    // Setup mail server
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", "2525");
	    // Get session
	    Session session = Session.getDefaultInstance(props, null);
	    // Define message
	    MimeMessage message = new MimeMessage(session);
	    // Set the from address
	    message.setFrom(new InternetAddress(from));
	    // Set the to address
	    message.addRecipient(Message.RecipientType.TO, 
	      new InternetAddress(to));
	    // Set the subject
	    message.setSubject("[24]7 Online Exam Login Details");
	    // Set the content
	    message.setText("Your Login details Are Added Here:-"+ Mailmessage);	    
	    Transport tr = session.getTransport("smtp");
	    tr.connect(host, "WifinityAlert@wifinitytech.com", "wifial123");
	    message.saveChanges();      // don't forget this
	    tr.sendMessage(message, message.getAllRecipients());
	    System.out.println("Message Sent");
	    tr.close();
		return false;
	}	
	
  public static void main(String args[]) throws Exception
  {
	  MailFunction.mailSending("rajesh.pillai.r@gmail.com", "hi rajesh how ru dear iam fine da how r u");    
  }
  
}