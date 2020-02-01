<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="util.ConnectionDAO"%>
<%@page import="java.sql.CallableStatement"%>

<%
	String chkURI=request.getHeader("Referer");
	System.out.println("Display URI\t"+chkURI);
	if(chkURI==null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
	}
	else
	{
		chkURI = chkURI.toLowerCase();
		System.out.println("Check\t"+chkURI.indexOf(request.getContextPath().toLowerCase()));
		if(chkURI.indexOf(request.getContextPath().toLowerCase()) < 1)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
		}
	}
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL - "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
	}
	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String recruitPath = path + "/247Recruit/";
	
	String TCV = "6.0";
	String PFP = "";//"Program Files\\";
	String candImgPath= basePath + "../247Recruitment/canImage/";
	String candResumePath= "C:\\"+PFP+"Apache Software Foundation\\Tomcat "+TCV+"\\webapps\\247Recruitment\\CandidateResumes\\";
	String candResumeVPath= basePath + "../247Recruitment/CandidateResumes/";
	String candVoicePath= "C:\\"+PFP+"Apache Software Foundation\\Tomcat "+TCV+"\\webapps\\247Recruitment\\VoiceUploads\\";
	String candDocPath= "C:\\"+PFP+"Apache Software Foundation\\Tomcat "+TCV+"\\webapps\\247Recruitment\\CandDocs\\";
	String candDocVPath= basePath + "../247Recruitment/CandDocs/";
	
	String logoutPage = basePath + "/247Recruit/jsp/Logout.jsp";
	String loginPage = basePath + "/jsp/Login.jsp";
	String voicePath= basePath + "../247Recruitment/VoiceUploads/";
	
	Connection connKEY = null;
	//Statement stmtKEY = null;
	ResultSet rsKEY = null;
	String EDKey = null;
	
	String ownIPS  = request.getHeader("X-FORWARDED-FOR");  
    if(ownIPS == null)  
    {  
     	ownIPS = request.getRemoteAddr();  
    }  
	System.out.println("User System ipAddress in GLOBAL PAGE : "+ownIPS);
	
	
	String EDKPass="247Cust0m3r"; 
	try
	{
	if (session.getAttribute("EDKey") == null)
	{
		connKEY = ConnectDatabase.getConnection();
		CallableStatement call = connKEY.prepareCall("CALL GetKFL(?,?)");
		call.setString(1,ownIPS);
		call.setString(2,EDKPass);
		rsKEY = call.executeQuery();
		if(rsKEY.next())
		{
			EDKey = rsKEY.getString("KFL");	
			System.out.println("<<<<<<<<<<<<<<<<    KEY VALUE SUCCESS GET VALUE >>>>>>>>>>>>>>>>");
		}
		
		if(EDKey != null)
		{
			session.setAttribute("EDKey",EDKey);
			session.setAttribute("EDKPass",EDKPass);
			System.out.println("<<<<<<<<<<<<<<<<    KEY VALUE SUCCESS SET VALUE  >>>>>>>>>>>>>>>>");

		}
		else
		{
			session.setAttribute("EDKey","AD");
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
		}
	}
	else
	{
		if((String)session.getAttribute("EDKey") != "AD")
		{
			EDKey = (String)session.getAttribute("EDKey");
			System.out.println("<<<<<<<<<<<<<<<<    KEY VALUE SUCCESS GET SESSION VALUE  >>>>>>>>>>>>>>>>");
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
		}
	}
	}
	catch(Exception e)
	{
	System.out.println(e);
	}
	finally
	{
		ConnectionDAO.closeConnection(connKEY,null,rsKEY);
	}	
	
%>
