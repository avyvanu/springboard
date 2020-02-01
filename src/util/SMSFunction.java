package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import util.ConnectDatabase;

public class SMSFunction {

	public static String sendSMS(String phoneNo, String msg, String email) 
	{

		String append = "";		
		String smsText = msg.replace(" ", "+");
		String email1 = email.replace(" ", "+");		
		smsText="Your%20registration%20with%20[24]7%20was%20successful.%20User%20ID="+email1+"%20Password="+smsText+"%20%20%20.";
		System.out.println("vis......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ phoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	public static String sendSMSPWReset(String phoneNo, String password, String candId) 
	{

		String append = "";		
		String smsText = password.replace(" ", "+");
		String candId1 = candId.replace(" ", "+");		
		smsText="Your%20Password%20has%20been%20successfully%20reset.%20User%20ID="+candId1+"%20Password="+smsText+"%20%20%20.";
		System.out.println("vis......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ phoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	public static String sendSMSCCA(String phoneNo, String password, String candId) 
	{

		String append = "";		
		String smsText = password.replace(" ", "+");
		String candId1 = candId.replace(" ", "+");		
		smsText="Your%20ID%20has%20been%20successfully%20Created.%20User%20ID="+candId1+"%20Password="+smsText+"%20%20%20.";
		System.out.println("sendSMSCCA......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ phoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	
	public static String sendSMSRec(String RecphoneNo, String msgRec, String phone) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
//   has completed Communicaton Ability - Non-Voice round on [24]7 career
		smsText=""+smsText+"%20has%20completed%20communication%20Ability%20(Non-Voice)%20round%20on%20[24]7%20carreer.%20Mob:%20"+phone+".";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ RecphoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	
	public static String sendSMSRecVoice(String RecphoneNo, String msgRec, String phone) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20has%20completed%20HR%20(Voice)%20round%20on%20[24]7%20career.%20Mob:%20"+phone+".";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ RecphoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	
	public static String sendSMSLNDVoice(String RecphoneNo, String msgRec, String phone, String ResultStatus) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20for%20Communication%20Ability%20(Voice)%20round%20on%20[24]7%20career.%20Mob:%20"+phone+"%20Result:"+ResultStatus+".";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ RecphoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}

	public static String sendSMSLNDChat(String RecphoneNo, String msgRec, String phone, String ResultStatus) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20for%20Communication%20Ability%20(Non-Voice-MockChat)%20round%20on%20[24]7%20career.%20Mob:%20"+phone+"%20Result:"+ResultStatus+".";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ RecphoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	
	public static String sendSMSLNDPrecis(String RecphoneNo, String msgRec, String phone, String ResultStatus) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20for%20Communication%20Ability%20(Non-Voice-Precis)%20round%20on%20[24]7%20career.%20Mob:%20"+phone+"%20Result:"+ResultStatus+".";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ RecphoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	
	public static String sendSMSLNDOPS(String RecphoneNo, String msgRec, String phone, String ResultStatus) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20for%20OPS%20Round%20on%20[24]7%20career.%20Mob:%20"+phone+"%20Result:"+ResultStatus+".";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ RecphoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	public static String sendSMSRecStability(String RecphoneNo, String msgRec, String phone, String ResultStatus) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20for%20Communication%20Ability%20(Stability)%20round%20on%20[24]7%20career.%20Mob:%20"+phone+"%20Result:"+ResultStatus+".";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ RecphoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	public static String sendSMSFinalCheckList(String phoneNo, String msgRec) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20%20%20.";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ phoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	
	public static String sendSMSVoiceSelection(String phoneNo, String msgRec) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20%20%20.";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ phoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}
	public static String sendSMSOffer(String phoneNo, String msgRec) 
	{

		String append = "";
		String smsText = msgRec.replace(" ", "+");
        smsText=""+smsText+"%20%20%20.";
		System.out.println("SMS......."+smsText);
		
		String smsURL = "http://www.unicel.in/SendSMS/sendmsg.php?uname=247%20Cust&pass=cus12&send=247Customer&dest=91"+ phoneNo + "&msg=" + smsText;
		System.out.println("smsURL  -------  :"+smsURL);
		try 
		{
			URL sms = new URL(smsURL);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(sms.openStream()));
			System.out.println("bReader :"+bReader);
			String inputData = null;
			while ((inputData = bReader.readLine()) != null)
			{
				append += inputData;
			}
			bReader.close();

		}
		catch (MalformedURLException mue)
		{
			mue.printStackTrace();
			System.out.println("SMS Sending Error MalformedURLException----------"+mue.getMessage());
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
			System.out.println("SMS Sending Error IOException----------"+ioe.getMessage());
		}
		return null;
	}


	public static void main(String[] args) 
	{
		SMSFunction.sendSMS("", "hi sms to mys mobile vishnu","");
	}
}
