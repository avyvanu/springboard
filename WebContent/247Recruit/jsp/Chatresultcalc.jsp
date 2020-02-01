<%@ page language="java" import="java.util.*,java.sql.Connection,util.ConnectDatabase,java.sql.ResultSet,java.sql.Statement,java.sql.PreparedStatement" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>[24]7 Gotya!!!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
 
  <body>
          <% 
            
              int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
              String transcriptdump = (String) request.getParameter("transcrptQuery");
              if(transcriptdump==null)
              {
              transcriptdump="";
              }
              System.out.println("transcript data-------"+transcriptdump);
              if(USER_AUTOID !=0)
		        {
		          try
			         {	
			       		
					Connection con = ConnectDatabase.getConnection();
					String query1="select * from mock_chat_test_details where user_id="+USER_AUTOID; 		
					System.out.println("query1 : "+query1);	
				    String scriptid=null;
			      	String mokscriptid = "SELECT scriptid FROM mokchat_scriptid_archive where userid='"+USER_AUTOID+"'";
			      	System.out.println("Script id ::"+mokscriptid);
			      	Statement stmtscriptid = con.createStatement();
					ResultSet rssscriptid = stmtscriptid.executeQuery(mokscriptid);
			      	if(rssscriptid.next())
	               	{
			      	scriptid=rssscriptid.getString("scriptid");
			        System.out.println("Mok script Id ::"+scriptid);
			      	}
				    PreparedStatement Pst = con.prepareStatement("update  mock_chat_test_attempt_master set End_date_test=now(),chat_script_id=?,transcript=? where user_id=?");
					Pst.setString(1,scriptid);
					Pst.setString(2,transcriptdump);
					Pst.setInt(3,USER_AUTOID);
					Pst.executeUpdate();
				    System.out.println("inserted sucessfully"); 
					response.sendRedirect(request.getContextPath()+"/247Recruit/jsp/MockChatSucessPage.jsp");
					rssscriptid.close();
					stmtscriptid.close();
					Pst.close();
					con.close();
		}
		catch (Exception e) 
			{
				System.out.println("pst:sss"+e.getMessage());	
			}
	
		}%>

   
  </body>
</html>
           
