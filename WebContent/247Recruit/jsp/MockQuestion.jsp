<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="util.ConnectionDAO"%>


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
		//String chkSource=request.getContextPath()+" ---------- "+request.getContextPath().+" ---------- "+request.getPathTranslated()+" ---------- "+request.getRequestURI()+" ---------- "+request.getRequestURL();
		//System.out.println("Display Source\t"+chkSource);
	}
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL - "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
	}


String Ques="";
Connection con=null;
Statement st=null;
ResultSet rs=null;
String quesId=request.getParameter("quesId");
System.out.println(" ----- quesId ----- "+quesId);
Object SCRIPT_ID_QUES=session.getAttribute("SCRIPT_ID_QUES");
System.out.println(" Object Script "+SCRIPT_ID_QUES);
try
{
	con=ConnectDatabase.getConnection();
	String queryGetQs ="SELECT Chat_Question_Id, Chat_Question FROM mock_chat_scripts WHERE Chat_Script_Id="+SCRIPT_ID_QUES+" AND chat_Question_Id="+quesId+"";   
	System.out.println(" ----- queryGetQs ----- "+queryGetQs);
	st = con.createStatement();								
	rs=st.executeQuery(queryGetQs);
	if(rs.next())
	{
		Ques = rs.getString("Chat_Question");
		System.out.println(" ----- Ques ----- "+Ques);
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	ConnectionDAO.closeConnection(con, st, rs);	
}
out.println(Ques);
%>  
