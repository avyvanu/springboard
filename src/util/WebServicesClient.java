package util;

import javax.xml.ws.WebServiceRef;

import servlets.Users.LoginServlet;

import com.sun.xml.wss.impl.configuration.StaticApplicationContext;

public class WebServicesClient 
{
	@WebServiceRef(wsdlLocation="http://connect.247customer.com/connect247service/connect247.asmx?wsdl") static LoginServlet service;	
	public static void main(String []args)
	{
		LoginServlet client= new LoginServlet();
		// client.		
	}
}
