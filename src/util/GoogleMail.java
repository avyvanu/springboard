package util;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class GoogleMail {
	public static void main(String[] args)

	{

		String[] to = { "prakash8339@gmail.com" };

		String[] cc = {"prakash8339@gmail.com" };

		String[] bcc = { "prakash8339@gmail.com" };

		//This is for google

		GoogleMail.sendMail("radifinity.security", "RFIDRFIDRFID123",
				"smtp.gmail.com", "465", "true",

				"true", true, "javax.net.ssl.SSLSocketFactory", "false", to,
				cc, bcc,

				"IFFCO - TOKIO ALERT",
				"Testmails from radinfinity  for IFFCO");

	}

	public synchronized static boolean sendMail(String userName,
			String passWord, String host, String port, String starttls,
			String auth, boolean debug, String socketFactoryClass,
			String fallback, String[] to, String[] cc, String[] bcc,
			String subject, String text) {

		Properties props = new Properties();

		//Properties props=System.getProperties();

		props.put("mail.smtp.user", userName);

		props.put("mail.smtp.host", host);

		if (!"".equals(port))

			props.put("mail.smtp.port", port);

		if (!"".equals(starttls))

			props.put("mail.smtp.starttls.enable", starttls);

		props.put("mail.smtp.auth", auth);

		if (debug) {

			props.put("mail.smtp.debug", "true");

		} else {

			props.put("mail.smtp.debug", "false");

		}

		if (!"".equals(port))

			props.put("mail.smtp.socketFactory.port", port);

		if (!"".equals(socketFactoryClass))

			props.put("mail.smtp.socketFactory.class", socketFactoryClass);

		if (!"".equals(fallback))

			props.put("mail.smtp.socketFactory.fallback", fallback);

		try

		{

			Session session = Session.getDefaultInstance(props, null);

			session.setDebug(debug);

			MimeMessage msg = new MimeMessage(session);

			msg.setText(text);

			msg.setSubject(subject);

			msg.setFrom(new InternetAddress("yatin@radifinity.com"));

			for (int i = 0; i < to.length; i++) {

				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
						to[i]));

			}

			for (int i = 0; i < cc.length; i++) {

				msg.addRecipient(Message.RecipientType.CC, new InternetAddress(
						cc[i]));

			}
			for (int i = 0; i < bcc.length; i++) {

				msg.addRecipient(Message.RecipientType.BCC,
						new InternetAddress(bcc[i]));

			}

			msg.saveChanges();

			Transport transport = session.getTransport("smtp");

			transport.connect(host, userName, passWord);

			transport.sendMessage(msg, msg.getAllRecipients());

			transport.close();

			return true;

		}

		catch (Exception mex)

		{

			mex.printStackTrace();

			return false;

		}

	}

}
