<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ include file="GlobalDeclare.jsp" %>
   <%
	String USER_ID = "";
	int USER_AUTOID = 0;
	String User_Type_Id = "";
	String USER_Name = "";
	Connection con=null;
	Statement stmtN=null;
	ResultSet rsN=null;
	String task_id=null;
	String taskDescription = "";
	String task_URL = "";
	String IsSAdmin = "No";
	String EmailID=null;
	String Phone=null;
	int	Cand_Status = 0;
	int can_init_result = 0;
	int Upload_Done = 0;
	boolean User_AllPrrmsAccess = false;
	
	 try
	  {
		 USER_ID = (String)session.getAttribute("USER_ID");
		 if(USER_ID == null)
		  	{
		  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
		 System.out.println("USER_ID in home page::::"+USER_ID);
		 USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
		 if(USER_AUTOID == 0)
		  	{
		  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
		 System.out.println("USER_AUTOID in home page::::"+USER_AUTOID);
	  	USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	     if(USER_Name == null)
		  	{
		  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		  	}
	     System.out.println("USER_Name in home page::::"+USER_Name);
		 
	      if(USER_ID.substring(0, 2).compareToIgnoreCase("ic") == 0)
				    {
						Cand_Status =(Integer)session.getAttribute("Cand_Status");
						System.out.println("Cand_Status in home page:::::: : "+Cand_Status);
						can_init_result=(Integer)session.getAttribute("Cand_Init_Result");
						System.out.println("can_init_result in home page:::::: : "+can_init_result);
						Upload_Done =(Integer)session.getAttribute("Cand_DocUpload_Done");
				 		System.out.println("Upload_Done in home page:::::: : "+Upload_Done);
				   }
			 else
			      {
					 User_Type_Id = (String)session.getAttribute("User_Type_Id");
				     System.out.println("User_Type_Id in home page::::"+User_Type_Id);
				     if(User_Type_Id == null)
					  	{
					  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
					  	}
				     
				     IsSAdmin = ((String)session.getAttribute("IsSAdmin")).trim();
				      if(IsSAdmin == null)
					  	{
					  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
					  	}
				     session.setAttribute("IsSAdmin",IsSAdmin);
				     System.out.println("IsSAdmin in home page::::"+IsSAdmin);
			      }
		 con=ConnectDatabase.getConnection();
	     stmtN=con.createStatement();
	}
	catch(Exception e)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
  %>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">

		<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
		<script type="text/javascript" language="javascript">	
			function logout()
			{
				location.href = "<%=logoutPage%>";
			}
			function display_id(obj)
			{
				document.getElementById('hidProgVal').value=obj.options[obj.selectedIndex].value;
			}
		   function redirectops(taskURL)
			{
			  if ( form1.programname.selectedIndex == 0 ) 
			  { 
				alert ( "Please select Program !" ); 
				return false; 
			  }
				progId = document.getElementById('hidProgVal').value;
				location.href="<%=recruitPath%>"+taskURL+"?progVal=" + progId;
			}
	   </script>
	
	    <!-- Opening PDF Help Document  -->
		<script type="text/javascript">
		function ShowDoc(Filepath)
		{
		someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
		}
		</script>
      <!-- End of Opening PDF Help Document  -->
	<style type="text/css">
		html,body
		{
			margin: 0px;
		}
		.logo
		{
			height: 69px;
			width: 143px;
		}
		.contentSize
		{
			border: 0px solid #FFFFFF;
		    clear: both;
		    display: block;
		    overflow: hidden;
		    padding: 0px;
		    width: 100%;
		}
	
		.wrapper
		{
			border: 0px solid #FFFFFF;
			margin: 0 auto;
	    	width: 100%;
		}
	
		.tPersonal
		{
			width: 935px;
			height: 135px;
		}
	</style>
	
	<title>[24]7 SPRINBOARD</title>
     <link type="text/css" rel="stylesheet" href="../dhtmlgoodies_calendar/dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
	 </head>
  <body>
    <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	        <td align="left">
	            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	    </tr>
	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:12px;">
			</td>
		</tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Home</font>
	           
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	       <td colspan="2">
	        <!--  ***************************Begin********************************* -->
    		 <form id="form1" name="form1" method="post" action="">
  			  <br/>
  			  <!--*************** Candidate part Display ******************-->
  			  <%if(USER_ID.substring(0, 2).compareToIgnoreCase("ic") == 0) 
  			  {
  			  %>
  			  	<div class="wrapper">
					<div class="contentSize">
					    <table border="0" cellpadding="6" cellspacing="6" class="tPersonal" align="center">
					    	<tr class="allTdBackColor">
						    	<%
		    				       try
		    				       {
		    				        String loc=(String)session.getAttribute("User_Center_Id");				    				       
		    				        con=ConnectDatabase.getConnection();
									String queryForarea="SELECT Contact_Phone_No, Contact_Email_Id FROM cand_query_contact_info where Is_Active=1 and Center_Id="+loc;
									Statement stmtarea=con.createStatement();								
									ResultSet rsarea=stmtarea.executeQuery(queryForarea);
							
								 	while(rsarea.next())
								    {								
									EmailID=rsarea.getString("Contact_Email_Id");
									Phone=rsarea.getString("Contact_Phone_No");
									}
										
		  							rsarea.close();
		  							stmtarea.close();
									}
									catch(Exception e)
									{
										e.printStackTrace();
									}
								%>   
						    	   <td align="left" valign="top" class="allTdBackColor" style="padding-left: 15px;padding-top: 15px;">
										<b>
						    	     		Thank you for Contacting [24]7 careers, your test results are at the moment getting processed, once the results are processed you will receive  
						    	      		an email and a SMS confirmation on your contact information as registered with us, you are also free to check back online at 
						    	      	 	any time, thank you and Good Luck!!!
						    	     	  	<br/>
						    	     	  	<br/>
										    For any further questions or clarifications please feel free to reach out to us on:
						    	     	  	<br/>
										    Email: <%=EmailID%>
						    	     	  	<br/>
										    Phone: <%=Phone%>
										</b>
						    	   </td>
					          </tr>
				         </table>
	           		 <%
	            		 try
			     	        {
					     	 if(Cand_Status < 6)
					     	  {
					     	  		String secQueryResumeDoc = "SELECT Bpo_Cand_Id FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+USER_ID+"' and IsResumeUpload = 1";
									System.out.println("--- secQueryDoc \t"+secQueryResumeDoc);
								  	Statement stmtResumeDoc = con.createStatement();
									ResultSet rsResumeDoc = stmtResumeDoc.executeQuery(secQueryResumeDoc);
									boolean resumeDocs = rsResumeDoc.next();
									System.out.println("resumeDocs ==== ========  \t"+resumeDocs);
							        if(resumeDocs)
							        {			          
								          %>
											<table border="0" cellpadding="0" cellspacing="0" align="center">
												<tr>
													<td align="center" style="color: gray; font-size: 12px;">
														<b>Resume uploaded successfully.</b> 
													</td>
												</tr>
									        </table>
								          <%
						           }
							       else
							       {
							         %>
										<table border="0" cellpadding="0" cellspacing="0" align="center">
									        <tr>
									        	<td align="center">
									        		<input type="button" name="btnNewWindow" class="buttonLarge320" value="Candidate Resume Upload" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Cand_Resume_Upload.jsp'">
									        	</td>
									        </tr>
								        </table>
							        <% 
							       }
						         rsResumeDoc.close();    
								 stmtResumeDoc.close();
					     	  }
					     	 if(Cand_Status > 5)
					     	  {
			     				if(Cand_Status < 8 && can_init_result == 1)
					     	    {	
					     	   		String secQueryDoc = "SELECT Bpo_Cand_Id FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+USER_ID+"' and Upload_Done=1";
									System.out.println("--- secQueryDoc \t"+secQueryDoc);
								  	Statement stmtDoc = con.createStatement();
									ResultSet rsDoc = stmtDoc.executeQuery(secQueryDoc);
									boolean docs=rsDoc.next();
									System.out.println("docs ==== ========  \t"+docs);
							        if(docs)
							        {			          
								          %>
											<table border="0" cellpadding="0" cellspacing="0" align="center">
												<tr>
													<td align="center" style="color: gray; font-size: 12px;">
														<b>Documents uploaded successfully.</b> 
													</td>
												</tr>
									        </table>
								          <%
						           }
							       else
							       {
							         %>
										<table border="0" cellpadding="0" cellspacing="0" align="center">
									        <tr>
									        	<td align="center">
									        		<input type="button" name="btnNewWindow" class="buttonLarge320" value="Candidate Document Upload" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Cand_Doc_Upload.jsp'">
									        	</td>
									        </tr>
								        </table>
							        <% 
							       }
						         rsDoc.close();    
								 stmtDoc.close();
								}
						if(Cand_Status < 8 && can_init_result == 1)
				     	      {	
				     	   		if(Upload_Done == 1)
						        {			          
							     %>
										<table border="0" cellpadding="0" cellspacing="0" align="center">
								        <tr>
								        	<td align="center">
								        		<input type="button" name="btnNewWindow" class="buttonLarge320" value="Additional Documents Upload" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Cand_Additional_Doc_Upload.jsp'">
								        	</td>
								        </tr>
							        </table>
										
							     <%
					           }
						       else
						       {
						         %>
									<table border="0" cellpadding="0" cellspacing="0" align="center">
											<tr>
												<td align="center" style="color: gray; font-size: 12px;">
													<b>Additional Documents Upload.</b> 
												</td>
											</tr>
								    </table>
						        <% 
						       }
					       }
						if(Cand_Status > 6 && Cand_Status < 9) // Cand_Status == 7 && can_init_result == 1
							{	
							   int Result_Status=0;
								try
				  				   {
				  				    con=ConnectDatabase.getConnection();
									String queryForarea="SELECT Result_Status FROM  operations_interview_master where candidate_Id="+USER_AUTOID+"";
									Statement stmtarea=con.createStatement();								
									ResultSet rsarea=stmtarea.executeQuery(queryForarea);
							
								 	while(rsarea.next())
								    {								
										Result_Status=rsarea.getInt("Result_Status");
									}
										
											rsarea.close();
											stmtarea.close();
									}
									catch(Exception e)
									{
										e.printStackTrace();
									}
								if(Result_Status == 1)
								{
							        String secQuery= "SELECT COUNT(Cand_Passed_Auto_Id) AS RowCount FROM cand_personal_details_final WHERE Cand_Passed_Auto_Id='"+USER_AUTOID+"'";
								  	Statement stmt = con.createStatement();
									ResultSet rs = stmt.executeQuery(secQuery);
									boolean regis=rs.next();
							        if(regis==true)	        
									{			
										int getValue=rs.getInt("RowCount");
										if(getValue > 0)
										{
										System.out.println("getValue : "+getValue+" :AutoID   "+USER_AUTOID);
										%>
											<table border="0" cellpadding="0" cellspacing="0" align="center">
												 <tr>
										        	<td align="center" style="color: gray; font-size: 12px;">
										        		<b>Final registration completed. Thank you.</b> 
										        	</td>
										         </tr>
									        </table>
										<%
								        }
								        else
								        {
								        %>
											<table border="0" cellpadding="0" cellspacing="0" align="center">
										         <tr>
										        	<td align="center">
										        		<input type="button" name="btnNewWindow" class="buttonLarge320" value="Final Registration" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Cand_FinalRegistrationForm.jsp'">
										        	</td>
										        </tr>
									        </table>
								        <%
								        }
							        }
							        else
							        {
							        %>
										<table border="0" cellpadding="0" cellspacing="0" align="center">
											 <tr>
									        	<td align="center" style="color: gray; font-size: 12px;">
									        		<b>Final registration incomplete. Please re-login and try again later.</b> 
									        	</td>
									         </tr>
								        </table>
							        <%
							        }
						       	 	rs.close();
						       	 	stmt.close();
						        	con.close();
								}
					        }
		                  }
		              }
			        catch(Exception e)
			        {
			        	e.printStackTrace();
			        }
	        		 %>
		       </div>
			 </div>
	        <br/>
	         <!--************* End of Candidate Display ******************-->
	        <%
	        } 
	       else if(User_Type_Id.equalsIgnoreCase("3"))
  			{
	        %>
  			  <!--**************** Operations part Display***************** -->
  			  <%
  			 
  			    try
  			     {
				%>
  			  <table width="733" border="0" cellpadding="0" cellspacing="0" align="center">
				      <tr align="center" >
					  	<td colspan="2">
					  		<%
					  		String QueryUserAllPrgms = "SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ USER_AUTOID + "' AND Program_Id = 0";
							System.out.println("QueryUserAllPrgms::::::" + QueryUserAllPrgms);
							Statement stmtsprogs = con.createStatement();
							ResultSet rssprogs = stmtsprogs.executeQuery(QueryUserAllPrgms);
							User_AllPrrmsAccess = rssprogs.next();
							System.out.println("User_AllPrrmsAccess::::"+User_AllPrrmsAccess);
							rssprogs.close();
							stmtsprogs.close();
					  		
					  		String qryforSIMTasks = "SELECT tm.Task_Id,tm.task_description,tm.task_url FROM User_Type_Task_Mapping uttm,task_master tm WHERE uttm.task_id = tm.task_id and tm.Is_Active = 1 and uttm.User_Type_Id = "+User_Type_Id+" and tm.Pareent_Task_Id = 0  AND uttm.UTT_Mapping_Id IN (SELECT UTT_Mapping_Id FROM User_UTT_Mapping WHERE User_Id = "+USER_AUTOID+")";
							System.out.println("qryforSIMTasks::::"+qryforSIMTasks);
							con=ConnectDatabase.getConnection();
							stmtN=con.createStatement();
					  		rsN=stmtN.executeQuery(qryforSIMTasks);
					  		int opsId = 0;
				    	    while(rsN.next())
				      		 {
						    	task_id = rsN.getString("tm.Task_id");
						    	System.out.println("task_id::::"+task_id);
						    	taskDescription = rsN.getString("tm.task_description");
						    	task_URL =  rsN.getString("tm.task_url");
				      			
				      			if(task_id.equalsIgnoreCase("46"))
					  			{
				  				   if(User_AllPrrmsAccess == false)
					  				  {
						  				  String qry= "SELECT Program_Id,Program_Name FROM program_names_master WHERE Is_Alive=1 and Program_Id IN (SELECT Program_Id FROM User_Program_Mapping WHERE Is_Active=1 AND User_Id="+USER_AUTOID+") order by Program_name";
						  				  System.out.println("Query::::::"+qry);	
						  				  Statement stmtprogramN = con.createStatement();		        
										  ResultSet rsprogramN = stmtprogramN.executeQuery(qry);
										  if(rsprogramN.next())
											  {
							  			   %>
							  				<table border="0" cellpadding="0" cellspacing="0" align="center">
											  	<tr>
										  		 <td align="right">
										  			<font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Program</font>
										  		 </td>
										  		 <td align="left" style="padding-left: 10px">
											  			<select name="programname" id="programname" onchange="display_id(this)">
											  				<option value="0">---Select---</option>
											  				<%
															  rsprogramN.beforeFirst();
															  while(rsprogramN.next())
																{				        
																%>					
																	<option value="<%=rsprogramN.getString("Program_Id")%>"><%=rsprogramN.getString("Program_Name") %></option>
																<%
																}
											  				 %>
											  			</select>
										  			<input type="hidden" id="hidProgVal" value="" />
										  		 </td>
											   </tr>
											   <tr>
							  						<td style="height:10px;"></td>	
							  				  </tr>
										    </table>
							  				<input type="button" name="<%=taskDescription %>" id="<%=taskDescription %>" value="<%=taskDescription %>" class="buttonLarge320" onclick="javascript:redirectops('<%=task_URL %>');" /><br/>
							  	    	    <%
											  }
											  else
											  {
									            %>
											          <div align="center" style="color: #808080;font-family: Arial;font-size: 12px;font-weight: bold;" >Not configured to any programs for operations interview.</div>
											          <br/>
											    <%
										      }
								      }
								      else
								      {
								      	%>
								      	<div align="center" style="color: #808080;font-family: Arial;font-size: 12px;font-weight: bold;" >Operations Interview Not Applicable</div>
										          <br/>
										          <%
								      }    
					  	    	  }
					  	    	else
					  	    	{
					  	    	 %>
					  	    	 	<input type="button" name="<%=taskDescription %>" id="<%=taskDescription %>" value="<%=taskDescription %>" class="buttonLarge320" onclick="javascript:location.href='<%=recruitPath%><%=task_URL %>'" /><br/>
					  	     	<%
					  	     	}
					  	     opsId++;
					  	     }
					  	     if(opsId == 0)
					  	     {
					  	     %>
					  	     	<div align="center" style="color: #808080;font-family: Arial;font-size: 12px;font-weight: bold;" >No Access Granted</div>
						     <%
					  	     }
				  	     	%>
			  	     	</td>
					  </tr>
				</table>
  				<%
  				 }
				 catch(Exception ex)
				 {
				 	System.out.println(ex.getMessage());
				 	ex.printStackTrace();
				 }
				 finally
				 {
				 	ConnectionDAO.closeConnection(con,stmtN,rsN);
				 }
  			 }
  		   else 
  		     {
  			 %>
  			  <!--End of  Operations part Display -->
		         <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
					  <%
					    try
						{
						 	String qryforTasks = "";
						 	qryforTasks = "SELECT tm.Task_Id,tm.task_description,tm.task_url FROM User_Type_Task_Mapping uttm,task_master tm WHERE uttm.task_id = tm.task_id and tm.Is_Active = 1 and uttm.User_Type_Id = "+User_Type_Id+" and tm.Pareent_Task_Id = 0  AND uttm.UTT_Mapping_Id IN (SELECT UTT_Mapping_Id FROM User_UTT_Mapping WHERE User_Id = "+USER_AUTOID+")";
						 	System.out.println("qryforTasks::::"+qryforTasks);
						 	//String name="SELECT Task_Id FROM User_Type_Task_Mapping WHERE User_Type_Id = "+User_Type_Id+" AND UTT_Mapping_Id IN (SELECT UTT_Mapping_Id FROM User_UTT_Mapping WHERE User_Id = "+User_Id+")";
						 	rsN=stmtN.executeQuery(qryforTasks);
						 	int i =1;
						    while(rsN.next())
						    {
						    	task_id=rsN.getString("Task_Id");
						    	taskDescription = rsN.getString("tm.task_description");
						    	task_URL =  rsN.getString("tm.task_url");
					   %>
				         <tr>
					        <td align="center">
					          <input type="button" name="<%=taskDescription %>" value="<%=taskDescription %>" class="buttonLarge320" title="<%=taskDescription %>" onclick="javascript:location.href='<%=recruitPath%><%=task_URL %>'" /> <br/>
					       </td>       
					      </tr>
				      <%
				           i++;
				           }
				           if(i == 1)
		            {
		            %>
		             <tr>
				        <td>
				          <div align="center" style="color: #808080;font-family: Arial;font-size: 12px;font-weight: bold;" >No Access Granted
				          </div>
				         </td>
				     </tr>
				    <%
		            }
					   }
					 catch(Exception ex)
					 {
					 	System.out.println(ex.getMessage());
					 	ex.printStackTrace();
					 }
					 finally
					 {
					 	ConnectionDAO.closeConnection(con,stmtN,rsN);
					 }
					%>
			  </table>
			  <%
			  }
			 %> 
	       </form>
			<!-- ############################################ -->    
	     </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1")) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						     %>
						     <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						   <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3")) 
						    {
						     %>
						     <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						   <%
						    }
						   %>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1")) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
							<%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						    %>
						    <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3")) 
						    {
						    %>
						    <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						    <%
						    }
						    %>
						</td>
					</tr>
				</table>
			</td>
	    </tr>
	</table>

<!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->

  </body>
</html>

