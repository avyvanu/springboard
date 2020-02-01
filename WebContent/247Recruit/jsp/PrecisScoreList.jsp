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
String programvalue=request.getParameter("programvalue");
 
       String qry = "select desired_score from precis_desired_score where program_id='"+programvalue+"'";
       System.out.println("Query"+qry);
       try
       { 
               Connection con = ConnectDatabase.getConnection();
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
               while(rs.next())
               {
                       data+=rs.getString("desired_score")+",";
               }
               rs.close();
               st.close();
               con.close();
       }
       
       catch(Exception ex)
       {
               ex.printStackTrace();
       }
       System.out.println("program values are ----->"+data);
       out.println(data);
%>
