<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>

<%
String username = request.getParameter("username");
System.out.println("userid>>>>>>"+username);


%>

<%
String CONNECTION_URL = "jdbc:mysql://192.168.1.19:3306/ipc_online_chat";
Connection conn = null;
try
{
    if(conn == null)
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection("jdbc:mysql://192.168.1.19:3306/ipc_online_chat", "root", "root"); 
    }
}catch(SQLException sqlex)
{
    System.out.println((new StringBuilder("ConnectDatabase class SQL Error")).append(sqlex).toString());
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>[24]7 Online Test Instructions</title>
		<link rel="stylesheet" type="text/css" href="../css/careers.css" />
		<script type="text/javascript">

</script>
</head>
<body>
		<%
		   
    	   String wpm = request.getParameter("username");
		   Statement stmt = conn.createStatement();
		   String sql = "SELECT * FROM bpo_user WHERE EMAIL= "+"'"+wpm+"'";
		  // String sql = "SELECT * FROM result_total WHERE user_id ='2'";
		   System.out.println("sql>>>>>>"+sql);
		   ResultSet rs1 = stmt.executeQuery(sql);
		%>

<%String wpm1=null;
if (rs1.next()) {
	 wpm1 = rs1.getString("USER_ID");
	System.out.println("wpm>>>>>>........"+wpm1);
	}
	Statement stmt1 = conn.createStatement();
		   String sql1 = "SELECT * FROM result_total WHERE user_id= "+wpm1;
		  // String sql = "SELECT * FROM result_total WHERE user_id ='2'";
		   System.out.println("sql>>>>>>"+sql);
		   ResultSet rs2 = stmt1.executeQuery(sql1);
		   while (rs2.next()) {
	String wpm3 = rs2.getString("Speed");
	System.out.println("wpm>>>>>>"+wpm3);
	out.println(wpm3);
}


	%>

</body>
</html>








