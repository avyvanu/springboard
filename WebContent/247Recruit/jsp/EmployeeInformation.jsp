<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%

String data = "";
String EmployeeId=request.getParameter("EmployeeId").trim();
System.out.println("Employee Id:::"+EmployeeId);
       Connection con = ConnectDatabase.getConnection();
       String qry = "select * from employee_information where CandidateId='"+EmployeeId+"'";
       System.out.println("Query"+qry);
       try
       {
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
               if(rs.next())
               {
                       data+=rs.getString("CandidateId")+","+rs.getString("CenterName")+","+rs.getString("EmailId");
               }
       }
       
       catch(Exception ex)
       {
               ex.printStackTrace();
       }
       System.out.println("Employee Information are ----->"+data);
       out.println(data);
%>
