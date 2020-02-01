<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

   		System.out.println("Inside the click pic jsp page.   ");
   		out.println("jsp/clickmypic.jsp");
   		session.setAttribute("x_val","1");
		session.setAttribute("x_val2","1");		
		int USER_AUTOID=(Integer)session.getAttribute("USER_AUTOID");
		System.out.println("USER_AUTOID : "+USER_AUTOID);
		String USER_Name =(String)session.getAttribute("USER_Name");
		System.out.println("USER_Name : "+USER_Name);		
		  		
   		response.sendRedirect("jsp/clickmypic.jsp");
 %>
