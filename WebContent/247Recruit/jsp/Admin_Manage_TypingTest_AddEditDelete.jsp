<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<html>
	<head>
	<title>[24]7 SPRINGBOARD</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	</head>
	<body>
	<%
		System.out.println("++++++++++++++++++++++++++ Start Inside the Typing Test Moudle +++++++++++++++++++++++++++++++++");
		String str=request.getParameter("buttons");
		System.out.println("buttons vlaue ::::\t"+str);
		String USER_ID = (String)session.getAttribute("USER_ID");
		String  ID=(String)session.getAttribute("ID");
		System.out.println("ID:::::"+ID);
		String status=request.getParameter("type_status");
		System.out.println(":::::Edit status::::"+status);
		String oldstatus=request.getParameter("type_Edit_Isactive");
		System.out.println(":::::type_Edit_Isactive::::"+oldstatus);
		boolean chkinAcStatus = false;
		String query= "";
		int new_status  = 0;
		int updateQuery=0;
		int updateQuery1=0;
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		Statement stmt=null;
		Statement stmt1=null;
		int cnt=0;
		try
		{
			con=ConnectDatabase.getConnection();
			if(str.equalsIgnoreCase("Confirm"))
			{
				System.out.println("-----------------START ADD------------------------");
				String tname=request.getParameter("type_name");
				System.out.println(":::tname:::"+tname);
				String theader = request.getParameter("type_header");
				System.out.println(":::theader:::"+theader);
				String tpassage=request.getParameter("text_area");
				System.out.println(":::tpassage:::"+tpassage);
				
				query="SELECT COUNT(*) as  cnt  FROM bpo_typing_master WHERE Typing_Test_Name='"+tname+"'";
				System.out.println("::query::"+query);
				stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(query);
				if(rs.next())
				{
					cnt=rs.getInt("cnt");
					System.out.println("Count::::"+cnt);
				}
				if(cnt == 1)
				{
					%>  
					<script type="text/javascript">
						alert("Passage name already exists !");
						parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest_Add.jsp";
						
					</script> 
					<%
				}
				else
				{
					pstmt = con.prepareStatement("INSERT INTO bpo_typing_master(Typing_Test_Name,Typing_Test_Header, PASSAGE, Is_Active, Added_by, Added_on)VALUES(?,?,?,?,?,now())");
					pstmt.setString(1,tname);
					pstmt.setString(2,theader);
					pstmt.setString(3,tpassage);
					pstmt.setInt(4,1);
					pstmt.setString(5,USER_ID);
					updateQuery = pstmt.executeUpdate();	
					if(updateQuery!= 0)
					{ 
					%>
						<script type="text/javascript">
							alert("Passage inserted successfully!!!!");
							parent.location.href = "<%= recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
						</script>	
					<% 	   
				    }
				    else
				    {
					%>
						<script type="text/javascript">
							alert("Passage not Inserted successfully !");
							parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
						</script>	
					<% 	  
					}
				}
				System.out.println("-----------------END ADD------------------------");
				
			}	

			else if(str.equalsIgnoreCase("Update"))
			{
				
				if(status.equals("Active"))
		 		{
		 			new_status = 1;
		 			chkinAcStatus = true;	
		 		}
		 		
		 		int countActive = 0;
				
		 		if(chkinAcStatus)
		 		{
		 			query="SELECT COUNT(*) AS ActiveCount FROM bpo_typing_master WHERE Is_Deleted = 0";
		 		}
		 		else
		 		{
			 		query="SELECT COUNT(*) AS ActiveCount FROM bpo_typing_master WHERE Is_Active = 1 AND Is_Deleted = 0";
		 		}				
				
				System.out.println("::query::"+query);
				stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(query);
				if(rs.next())
				{
					countActive = rs.getInt("ActiveCount");
					System.out.println("countActive \t"+countActive);
					
					if(countActive == 1)
					{
					%>
					 	<script type="text/javascript">
							alert("Can't deactivate all typing tests! At least one must be active.");
							parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
						</script>	
					<%
					}
					else
					{
						String updated = "INSERT INTO bpo_typing_master_history(TYPING_MASTER_ID, old_status, new_status, Updated_by, Updated_on) VALUES(?,?,?,?, NOW())";
						pstmt1=con.prepareStatement(updated);				
						pstmt1.setString(1,ID);
						pstmt1.setString(2,oldstatus);
						pstmt1.setInt(3,new_status);
						pstmt1.setString(4,USER_ID);
						updateQuery1=pstmt1.executeUpdate();
				 		
						pstmt=con.prepareStatement("UPDATE bpo_typing_master SET Is_Active=? WHERE TYPING_MASTER_ID=?");
						pstmt.setInt(1,new_status);
						pstmt.setString(2,ID);
						updateQuery=pstmt.executeUpdate();
						
						if(updateQuery > 0)
						{ 
						%>
						 	<script type="text/javascript">
								alert("Typing test status updated successfully !");
								parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
								
							</script>	
						<% 	   
						}
						else
						{
						%>
							<script type="text/javascript">
								alert("Not Updated");
								parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
							</script>	
						<% 	  
						}

					}
				}
				System.out.println("-----------------END EDIT------------------------");
			}
			else if(str.equalsIgnoreCase("Submit"))
			{
				System.out.println("-----------------START DELETE------------------------");
				String delreason=request.getParameter("delete_Reason");
		 		System.out.println(":::::deletereason::::"+delreason);	
				int countActive = 0;
				
				query="SELECT COUNT(*) AS ActiveCount FROM bpo_typing_master WHERE Is_Deleted = 0";
		 		System.out.println("::query::"+query);
				stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(query);
				if(rs.next())
				{
					countActive = rs.getInt("ActiveCount");
					System.out.println("countActive \t"+countActive);
					
					if(countActive == 1)
					{
					%>
					 	<script type="text/javascript">
							alert("Can't delete all typing tests! At least one must be active.");
							parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
						</script>	
					<%
					}
					else
					{		
						pstmt=con.prepareStatement("INSERT INTO bpo_typing_master_history(TYPING_MASTER_ID,old_status, new_status,Deleted_by, Deleted_on,Deleted_reason) VALUES(?,?,?,?,NOW(),?)");
						pstmt.setString(1,ID);
						pstmt.setString(2,oldstatus);
						pstmt.setInt(3,new_status);
						pstmt.setString(4,USER_ID);
						pstmt.setString(5,delreason);
						updateQuery=pstmt.executeUpdate();
						
						pstmt1=con.prepareStatement("UPDATE bpo_typing_master SET Is_Deleted=1 WHERE TYPING_MASTER_ID=?");
						pstmt1.setString(1,ID);
						updateQuery1=pstmt1.executeUpdate();
						if(updateQuery1!= 0)
						{ 
						%>
						 	<script type="text/javascript">
								alert("Deleted Successfully!!!");
								parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
							</script>	
						<% 	   
						}
						else
						{
						%>
							<script type="text/javascript">
								alert("Not Deleted");
								parent.location.href = "<%=recruitPath%>jsp/Admin_Manage_TypingTest.jsp";
							</script>	
						<% 	  
						}
					}	
				}	
				System.out.println("-----------------END DELETE------------------------");
			}
		System.out.println("++++++++++++++++++++++++++ End Inside the Typing Test Moudle +++++++++++++++++++++++++++++++++");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	%>
	</body>
</html>
