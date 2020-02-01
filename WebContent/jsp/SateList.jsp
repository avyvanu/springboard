<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%

String data = "";
String countryId=request.getParameter("countryId");
System.out.println(":::::::::::::     "+countryId);
String emailId=request.getParameter("emailId");
String reEntrEmailId=request.getParameter("reEntrEmailId");
System.out.println("VALUES ----->"+emailId+"RE-EN"+reEntrEmailId);
       Connection con = ConnectDatabase.getConnection();
       String qry = "SELECT LOOKUP_CODE,DESCRIPTION FROM bpo_state_lookups where LOOKUP_TYPE='"+countryId+"'";
       System.out.println("Query"+qry);
       try
       {
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
               while(rs.next())
               {
                       data+=rs.getString("LOOKUP_CODE")+":"+rs.getString("DESCRIPTION")+",";
               }
       }
       
       catch(Exception ex)
       {
               ex.printStackTrace();
       }
       System.out.println("Set values are ----->"+data);
       out.println(data);
%>