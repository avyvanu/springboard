<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>

<%
String data = null;
String parentId = request.getParameter("parentId");
System.out.println(" parentId :::::::::::::     "+parentId);
int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
System.err.println(">>>USER_AUTOID ++++++++++++++++++++++++++++++++++++++++ " + USER_AUTOID);
if(USER_AUTOID == 0)
 	{
 		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
 	}
	System.out.println("USER_AUTOID in getChildACcess page::::"+USER_AUTOID);
String User_Type_Id = (String)session.getAttribute("User_Type_Id");
	String IsSAdmin = ((String)session.getAttribute("IsSAdmin")).trim();
	if(IsSAdmin == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	
       Connection con = ConnectDatabase.getConnection();
       String qry = "SELECT tm.Task_Id as Task_Id,tm.task_description as Task_Description FROM User_Type_Task_Mapping uttm,task_master tm WHERE uttm.task_id = tm.task_id and tm.Is_Active = 1 and uttm.User_Type_Id = "+User_Type_Id+" and tm.Pareent_Task_Id = '"+parentId+"'  AND uttm.UTT_Mapping_Id IN (SELECT UTT_Mapping_Id FROM User_UTT_Mapping WHERE User_Id = "+USER_AUTOID+")";     
       System.out.println("Query:::::getChildAccess"+qry);
       try
       {
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery(qry);
			   data = "";
               while(rs.next())
               {
                    data+=rs.getInt("Task_ID")+":"+rs.getString("Task_Description")+",";
               }
               rs.close();
               st.close();
       }       
       catch(Exception ex)
       {
            ex.printStackTrace();
       }
       finally
       {
             con.close();
                
       }
       System.out.println("Set values are ----->"+data);
       out.println(data);	
%>