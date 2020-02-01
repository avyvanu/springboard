<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String canId= (String) session.getAttribute("Bpo_Cand_Id");
String bioCode= request.getParameter("txtBioCode");
if(bioCode==null)
{
	bioCode="";
}
String query="update bpo_candidatesreg_details set BiometricCode='" + bioCode + "',BioSubmitStatus=1 where Bpo_Cand_Id='" + canId + "'";
	Connection connection=ConnectDatabase.getConnection();		
	Statement stmt=connection.createStatement();
	int rs=stmt.executeUpdate(query);
session.setAttribute( "Bpo_Cand_Id", "" );
%>
<%
					
					stmt.close();
					connection.close();
				 %>


<html>
  <head>
    <title>[24]7 Biometric Registration</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" language="javascript">
   alert("Updated Successfully.");
 parent.location.href= "<%=recruitPath%>jsp/Biometric_Registration.jsp";
  
  </script>
  </head>
  
  <body>
    
  </body>
</html>
