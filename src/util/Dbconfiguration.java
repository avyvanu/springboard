package util;
/**
 * 
 * @author admin
 *
 */
public class Dbconfiguration {
	public static String url=null;
	public static String username=null;
	public static String password=null;
//mail config starts
	
	public static String smtphost=null;
	public static String smtpport=null;
	public static String emailfrom=null;

	public static String emailpassword=null;
	public static String emailsubject=null;
	public static String emailmessage=null;
	
	
	
	
	
	
	
	
	
	
	
	public static String getURl() {
		return url;
	}

	public static void setURl(String rl) {
		url = rl;
	}

	public static String getUsername() {
		return username;
	}

	public static void setUsername(String username) {
		Dbconfiguration.username = username;
	}

	public static String getPassword() {
		return password;
	}

	public static void setPassword(String password) {
		Dbconfiguration.password = password;
	}

	public static String getUrl() {
		return url;
	}

	public static void setUrl(String url) {
		Dbconfiguration.url = url;
	}

	public static String getSmtphost() {
		return smtphost;
	}

	public static void setSmtphost(String smtphost) {
		Dbconfiguration.smtphost = smtphost;
	}

	public static String getSmtpport() {
		return smtpport;
	}

	public static void setSmtpport(String smtpport) {
		Dbconfiguration.smtpport = smtpport;
	}

	public static String getEmailfrom() {
		return emailfrom;
	}

	public static void setEmailfrom(String emailfrom) {
		Dbconfiguration.emailfrom = emailfrom;
	}

	public static String getEmailpassword() {
		return emailpassword;
	}

	public static void setEmailpassword(String emailpassword) {
		Dbconfiguration.emailpassword = emailpassword;
	}

	public static String getEmailsubject() {
		return emailsubject;
	}

	public static void setEmailsubject(String emailsubject) {
		Dbconfiguration.emailsubject = emailsubject;
	}

	public static String getEmailmessage() {
		return emailmessage;
	}

	public static void setEmailmessage(String emailmessage) {
		Dbconfiguration.emailmessage = emailmessage;
	}

}
