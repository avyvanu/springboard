<!DOCTYPE html  "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>

<%@page import="util.*" %>
<%@ include file="GlobalDeclare.jsp" %>

<%
	String USER_Name =(String)session.getAttribute("USER_Name");
	System.out.println("USER_Name : "+USER_Name);	
	String USER_ID =(String) session.getAttribute("USER_ID");
	System.out.println("USER_ID : "+USER_ID);
	int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
	System.out.println("USER_AUTOID session : "+USER_AUTOID);
	int	Cand_Status =(Integer)session.getAttribute("Cand_Status");
	System.out.println("Cand_Status session : "+Cand_Status);
	int Cand_Init_Result=(Integer)session.getAttribute("Cand_Init_Result");
	System.out.println("Cand_Init_Result session : "+Cand_Init_Result);
	int Upload_Done =(Integer)session.getAttribute("Cand_DocUpload_Done");
	System.out.println("Upload_Done::::: "+Upload_Done);
	Object isExp=session.getAttribute("IsExprience");
	
	if(USER_AUTOID == 0)
	{
		response.sendRedirect("jsp/Login.jsp");
	}
    Connection con=null;
   	String EmailID=null;
	String Phone=null;
  
%>

<html>
  <head>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>

	<style type="text/css">
		html,body,form
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
	
		.headder
		{
			margin: 0px;
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
	
</head>
  
  <body>   

  	 <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	        <td align="left" style="width:60%">
	            <img src="<%=recruitPath%>images/logo-24-7.gif" alt="Logo" />
	        </td>
	        <td align="right" valign="bottom" style="width:60%; color:#666666; font-size:16px; font-family:Arial; padding-right:30px; padding-bottom:15px;">
	            The Intuitive Consumer Experience Company™ 
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
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2">
	        <br/>
	        <!-- ############################################ -->
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
	     	if(Cand_Status > 5)
	     	{
	     		if(Cand_Status < 8 && Cand_Init_Result == 1)
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
										<b>Documents already uploaded successfully.</b> 
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
			if(Cand_Status < 8 && Cand_Init_Result == 1)
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
			if(Cand_Status > 6 && Cand_Status < 9) // can_ststus == 7 && can_init_result == 1
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
        else
        {
 	        
        
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

			<!-- ############################################ -->    
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
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
