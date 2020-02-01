package beans;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Test {
	
	
	
	
	public static void main(String[] args) throws AddressException, MessagingException {
		String a="a";
		String b="A";
		System.out.println(a.equalsIgnoreCase(b));
		String host = "smtp.wifinitytech.com";
	    String from = "WifinityAlert@wifinitytech.com";
	    String to = "rajesh.pillai.r@gmail.com";

	    Properties properties=System.getProperties();
	    properties.put("mail.smtp.host", host);
	    properties.put("mail.smtp.port", "2525");
	    //Authenticator t=new SMTPAuthenticator();
	    Session session=Session.getDefaultInstance(properties,null);
	   // Session session=Session.getDefaultInstance(properties, t);
	    MimeMessage message=new MimeMessage(session);
	    message.setFrom(new InternetAddress(from));
	    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	    message.setText("welcome mail");
	    Transport transport=session.getTransport("smtp");
	    transport.connect(host, "WifinityAlert@wifinitytech.com", "wifial123");
	    message.saveChanges();
	    transport.sendMessage(message, message.getAllRecipients());
	    transport.close();
	    
	    
	    
	    
	}

}
