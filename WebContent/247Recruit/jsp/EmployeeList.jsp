<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%

String data = null;
String ProgramId=request.getParameter("ProgramId");
System.out.println("Program ID"+ProgramId);
String SubprogramId=request.getParameter("Subprogram");
System.out.println("Sub program Id::::"+SubprogramId);
       Connection con = ConnectDatabase.getConnection();
       String qry = "select * from Employee_master where subprogramid='"+SubprogramId+"' and programid='"+ProgramId+"' order by EmployeeName asc";     
       System.out.println("Query:"+qry);
       try
       {
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
			   data = "";
               while(rs.next())
               {
                       data+=rs.getString("EmployeeCode")+":"+rs.getString("EmployeeName")+",";
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