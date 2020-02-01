<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	System.out.println("Full URL Script Error Other Pages- "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error Other Pages");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
%>
