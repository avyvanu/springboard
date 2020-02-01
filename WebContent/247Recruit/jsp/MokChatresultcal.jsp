<%@ page language="java" import="java.util.*,java.sql.Connection,util.ConnectDatabase,java.sql.ResultSet,java.sql.Statement,java.sql.PreparedStatement" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MokChatresultcal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
          <% 
            Connection con = ConnectDatabase.getConnection();
              String userid="4";
              String transcriptdump = (String) request.getParameter("transcrptQuery");
		   	  System.out.println("transcript data-------"+transcriptdump);
              if(userid!=null)
		        {
		          try
			         {	
			       		
					
					String query1="select * from mock_chat_test_details where user_id="+userid; 		
					System.out.println("query1 : "+query1);	
				    String attemptid=null;
			      	String mokscriptid = "SELECT scriptid FROM mokchat_scriptid_archive where userid='"+userid+"'";
			      	System.out.println("Script id ::"+mokscriptid);
			      	Statement stmtscriptid = con.createStatement();
					ResultSet rssscriptid = stmtscriptid.executeQuery(mokscriptid);
			      	if(rssscriptid.next())
	               	{
			      	attemptid=rssscriptid.getString(1);
			        System.out.println("Mok script Id ::"+attemptid);
			      	
	             	}
				
				
					String insertQuery="update  mock_chat_test_attempt_master set End_date_test=sysdate(),chat_script_id=?,transcript=? where user_id='"+userid+"'";
					PreparedStatement Pst = con.prepareStatement(insertQuery);
					Pst.setString(1,attemptid);  
					Pst.setString(2,transcriptdump);  
			        int k=Pst.executeUpdate();
				    System.out.println("inserted sucessfully"); 
					
	             		if(k!=0)
		           	{
	 			
			      RequestDispatcher rd=request.getRequestDispatcher("/247Recruit/jsp/sucess2.jsp");
				  rd.forward(request, response);
			}
		}
		catch (Exception e) 
			{
				System.out.println("pst:sss"+e.getMessage());	
			}
	
		}%>

   
  </body>
</html>
           
