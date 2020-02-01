<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%

String data = null;
String ProgramId=request.getParameter("ProgramId");
System.out.println(":::::::::::::     "+ProgramId);

       Connection con = ConnectDatabase.getConnection();
       String qry = "select SubProgramId, SubProgramName from mstsubprogram where isActive='Y' and ProgramId='"+ProgramId+"' order by SubProgramName asc";     
       System.out.println("Query:"+qry);
       try
       {
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
			   data = "";
               while(rs.next())
               {
                       data+=rs.getString("SubProgramId")+":"+rs.getString("SubProgramName")+",";
               }
               rs.close();
               st.close();
               rs=null;
               st=null;
       }       
       catch(Exception ex)
       {
            ex.printStackTrace();
       }
       finally
       {
             con.close();
             con=null;      
       }
       System.out.println("Set values are ----->"+data);
       out.println(data);	
%>