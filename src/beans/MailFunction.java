package beans;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailFunction {
	
	
	
	public static String sendMail(String to,String txtmesage)throws Exception
	{String statusMessage=null;
		
		try{
			
		String host = "webmail.247customer";
	    String from = "WifinityAlert@wifinitytech.com";
	    //String to = "rajesh.pillai.r@gmail.com";

	    // Get system properties
	    Properties props = System.getProperties();
	    

	    // Setup mail server
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", "26");

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
	    message.setSubject("Hello JavaMail");

	    // Set the content
	    message.setText(txtmesage);
	    
	    Transport tr = session.getTransport("smtp");
	    tr.connect(host, "WifinityAlert@wifinitytech.com", "wifial123");
	    message.saveChanges();      // don't forget this
	    tr.sendMessage(message, message.getAllRecipients());
	    System.out.println("Message Sent");
	    tr.close();
	    statusMessage="Message Sent";
		}catch (Exception e) {
			e.printStackTrace();
			statusMessage="sendfailed";
		}
		return statusMessage;
		
		
	}
	
	
	
	
	
  public static void main(String args[]) throws Exception{
	  MailFunction.sendMail("rajesh.pillai.r@gmail.com", "hai daaa");
    
  }
  
}