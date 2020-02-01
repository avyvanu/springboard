<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 Gotya!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">

  </head>
  
  <body>
  <fieldset>
   <form>

<table width="100%" bgcolor="#ad0000" cellpadding="5"  style="-moz-border-radius:12px;">
<tr>
      <td width="15%" height="41" rowspan="5"><p align="left" style="color: white;"> <b>Scored Successfully</b></td>
</tr>
  </table>
	<table width="100%" border="0">
	<tr>
	<td height="100" style="background-color:#F7F7F7 ;font-family: Arial,Helvetica,sans-serif;font-size: 12px; color: #41383C;">
	<b>
	The User Information has been successfully uploaded.
	</b><br/>
	<ul>
	
<li> <a href="instruction.jsp" style="color: gray"><b>Score another Candidate</b></a><br/></li>
 <li><a href="instruction.jsp" style="color: gray"><b>Go to Home Page</b></a></li>
 <li>
 <font size="2" face="Verdana" color="#000000">
<a href="http://www.roseindia.net">Home</a>
</font>
 </li>
 </ul>
	</td>
	</tr>
	</table>
	<table width="100%" border="0">
	<tr>
	<td width="52%"  align="center">
	 
	</td>

	<td width="48%" align="center">
	 
	  </td>
	</tr>
	</table>
</form>
</fieldset>
  </body>
</html>
