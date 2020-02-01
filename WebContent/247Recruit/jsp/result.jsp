<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 Online Test Instructions</title>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
<script type="text/javascript">
function redirect()
{
window.location.href = "reading_com_test.html";
return false;
}
</script>
</head>

<body>
<form method="post">
<%
//String sessionid=(String)session.getAttribute("USERID2");



response.sendRedirect("Chatresultcalc.jsp");
 %>
</form>
</body></html>