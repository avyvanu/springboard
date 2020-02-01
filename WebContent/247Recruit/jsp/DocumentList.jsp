<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%

String data = null;
String TypeId=request.getParameter("TypeId");
System.out.println("TypeId::::::"+TypeId);

       Connection con = ConnectDatabase.getConnection();
       String qry = "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id='"+TypeId+"')";     
       try
       {
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
			   data = "";
               while(rs.next())
               {
                       data+=rs.getInt("Doc_Id")+":"+rs.getString("Document_Name")+",";
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
       out.println(data);	
%>