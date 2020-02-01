<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>

<%
String CONNECTION_URL = "jdbc:mysql://172.30.0.135:3306/ipc_online_chat";
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
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>

<link href="rfid.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" href="winter.css" />
  <link rel="stylesheet" type="text/css" href="style.css"/>
  <style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style2 {font-family: "Times New Roman", Times, serif}
.style3 {font-weight: bold}
.style10 {
	font-weight: bold;
	font-size: 8pt;
}
.style11 {color: #000000}
.style12 {
	color: #000000;
	font-weight: bold;
}
.style13 {color: #CC6633}
.style14 {color: #333333}
-->
  </style>
   

</head>

<body>
<form action="score.jsp" method="post">
          <table width="100%" cellspacing="1" cellpadding="6" border="0">
            <tbody><tr>
              <th colspan="4" class="taL">Search by  Email
            </th></tr>
           <tr>
        <td width="20%" class="taR"><span class="redTxt">*</span>Search :</td>
        <td width="30%" class="alterRow">
        <div class="txt-box" >
            <input type="text" id="username" name="username"/>
            
          </div>
                  <span id="fname_id" class="redTxt"></span></td>
      
      </tr>
       <tr>  <td width="20%" class="alterRow" align="left"></td>
        <td class="alterRow"> 
        <input type="submit"  name="submit" id="submit" value=" " />
        
	</td></tr>
      
    </tbody></table>
        
<%
	String username = request.getParameter("username");
	String user_id = null;
	Statement stmt = conn.createStatement();
	String sql = "SELECT user_id FROM bpo_user WHERE email like '%"+ username + "%'";
	System.out.println("sql>>>>>>"+sql);
	ResultSet rs = stmt.executeQuery(sql);
	
	while (rs.next())
	{
	user_id = rs.getString("user_id");
	
	}
	request.setAttribute("user_id",user_id);
%>


</form>


<%
String userid2= (String)request.getAttribute("user_id");
request.setAttribute("userid2",userid2);
System.out.println("userid>>>>>>"+userid2);
%>

</body></html>
