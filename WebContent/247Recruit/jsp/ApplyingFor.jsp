<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.*" %>

<html>
  <head>
    
    <title>[24]7 SPRINGBOARD</title>
 	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<!-- POP UP CSS -->
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/msgPOPUP.css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/msgPOPUP.js"></script>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/MasterTheme.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
	<style type="text/css">
	html,body,form
	{
		margin: 0px;
	}
	
	.contentSize
	{
		border: 0px solid #FFFFFF;
	    clear: both;
	    display: block;
	    overflow: hidden;
	    width: 100%;
	}

	.w100p
	{
		width: 100%;
	}

	.wrapper
	{
		margin: 0 auto;
    	width: 100%;
	}

	.tPersonal
	{
		width: 935px;
	}
	.tPersonalButton
	{
		width: 935px;
	}
	.username
	{
		padding-right: 10px;
	}
	.close
	{
		background:url("<%=request.getContextPath()%>/247Recruit/images/delO.png") no-repeat scroll 0 0 transparent;    
		cursor:pointer;
		float:right;
		position:absolute;
		right:0px;
		top:2px;
		width: 20px;
		height: 20px;
	} 
	</style>
	<script type="text/javascript">
	var cookie_date = new Date ();  // now
    cookie_date.setTime ( cookie_date.getTime() - 1 ); // one second before now.
			// empty cookie's value and set the expiry date to a time in the past.
	document.cookie = "logged_in=;expires=" + cookie_date.toGMTString();
	</script>
	
	<script type="text/javascript">
		function changeProcess(obj)
		{
			txt = obj.options[obj.selectedIndex].value;
			document.getElementById('SkillTypeLBL').style.display = '';
			document.getElementById('SkillTypeDDL').style.display = '';
			document.getElementById('noType').style.display = '';
			document.getElementById('chatType').style.display = 'none';
		  	document.getElementById('voiceType').style.display = 'none';
			document.getElementById('chatTypeLBL').style.display = 'none';
		  	document.getElementById('voiceTypeLBL').style.display = 'none';
			document.getElementById('chatTypeDDL').style.display = 'none';
		  	document.getElementById('voiceTypeDDL').style.display = 'none';
		  	// document.getElementById('Take_Chat_Test').style.display = 'none';
		  	// document.getElementById('Take_Voice_Test').style.display = 'none';
	    	document.getElementById('Take_Test').value = 'Take Test';
		  	document.getElementById('Take_Test').style.display = 'none';
		  	
		   	if(txt=='1')
			{
				document.getElementById('SkillTypeLBL').style.display = 'none';
				document.getElementById('SkillTypeDDL').style.display = 'none';
				document.getElementById('noType').style.display = 'none';
				document.getElementById('voiceType').style.display = '';
			  	document.getElementById('voiceTypeLBL').style.display = '';
			  	document.getElementById('voiceTypeDDL').style.display = '';
	    		// document.getElementById('Take_Voice_Test').style.display = '';	  
	    		document.getElementById('Take_Test').value = 'Take Voice Test';
	    		document.getElementById('Take_Test').style.display = '';
			}	
			if(txt=='2')
			{	
				document.getElementById('SkillTypeLBL').style.display = 'none';
				document.getElementById('SkillTypeDDL').style.display = 'none';
				document.getElementById('noType').style.display = 'none';
	    		document.getElementById('chatType').style.display = '';
				document.getElementById('chatTypeLBL').style.display = '';
				document.getElementById('chatTypeDDL').style.display = '';
	     		// document.getElementById('Take_Chat_Test').style.display = '';
	    		document.getElementById('Take_Test').value = 'Take Chat Test';
	    		document.getElementById('Take_Test').style.display = '';
			}
		}
	</script>
	<script type="text/javascript">
	function redirectToPhotoCam()
	{
		window.location.href ="<%=request.getContextPath() %>/247Recruit/jsp/camcanvas.jsp";
	}
	</script>
	<script type="text/javascript">
	function validation()
	{
		if ( applyingForform.skillSet.selectedIndex == 1 ) 
		{ 
		    if ( applyingForform.voiceProcess.selectedIndex == 0 ) 
			{ 
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Please select voice type !';
				document.getElementById('closeblock').focus();
				myFunction();
				//alert ( "Please select voice type !" ); 
				return false; 
			}
		}
		else if ( applyingForform.skillSet.selectedIndex == 2 ) 
		{ 
		    if ( applyingForform.chatProcess.selectedIndex == 0 ) 
			{ 
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Please select chat type !';
				document.getElementById('closeblock').focus();
				myFunction();
				//alert ( "Please select chat type !" ); 
				return false; 
			}
		}
	}
	</script>
  </head>
  <body>
	<%
	    Connection con = null;
		Statement smt = null;
		ResultSet rst = null;
       	String qry = "";
		try
		{
		int USER_AUTOID=(Integer)session.getAttribute("USER_AUTOID");
		System.out.println("USER_AUTOID : "+USER_AUTOID);
		if(USER_AUTOID == 0)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		String USER_Name =((String)session.getAttribute("USER_Name")).trim();
		if(USER_Name == null)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		System.out.println("USER_Name : "+USER_Name);	
		String USER_ID = (String) session.getAttribute("USER_ID");
		if(USER_ID == null)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		System.out.println("USER_ID : "+USER_ID);
	 
	 	String User_Center_Id = (String)session.getAttribute("User_Center_Id");
	 	if(User_Center_Id == null)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
	 	System.out.println(" APPLYING FOR User_Center_Id ID "+User_Center_Id); 
	 %>
   <table border="0" cellpadding="0" cellspacing="0" width="100%">
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Applying For</font>
	        </td>
   	        <td align="right" style="padding-right:10px;">
			<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor:hand; cursor:pointer;">Logout</a></font>

			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	 <br/>
	        <!-- ############################################ -->
	            <div class="wrapper">
					<div class="contentSize">
						<form action="<%=request.getContextPath()%>/ApplyingFor" method="post" name="applyingForform" onsubmit="return validation();" accept-charset="utf-8">
						    <table border="0" cellpadding="6" cellspacing="6" class="tPersonal">
						    	<tr>
						    	 	<td class="allBackColor" style="background-color: #d8d8d8;width: 100px;" align="left">Location</td>
						    		<td class="allTdBackColor" style="width: 175px;">
										
									   <%  
										con = ConnectDatabase.getConnection();
										smt = con.createStatement();
						              	qry = "SELECT centre_name FROM centre_master WHERE centre_id="+User_Center_Id;
										System.out.println("query "+qry);
										rst = smt.executeQuery(qry);
										while(rst.next())
										{
											String centre_name = rst.getString("centre_name");
										%>
											<label><%=centre_name%></label>
									   	<%
										}
										rst.close();
						               %>
								     
									</td>									
						    		<td class="allBackColor" style="background-color: #d8d8d8;width: 100px;" align="left">Skill Set</td>
						    		<td class="allTdBackColor" style="width: 175px;">
										<select name="skillSet" id="skillSet" onchange="changeProcess(this)" onkeyup="changeProcess(this)" class="reSizeforOther">
											<option value="0">---Select---</option>
												<%
													qry = "SELECT program_type_Id, program_type_Name FROM program_type_master WHERE is_Active=1";
													System.out.println("query "+qry);
													rst = smt.executeQuery(qry);
													while(rst.next())
													{
													%>
														<option value="<%=rst.getString("program_type_Id")%>"><%=rst.getString("program_type_Name")%></option>	
												    <%
													}
												rst.close();
									            %>
																			
										</select>
									</td>
						    	 	<td class="allBackColor" style="background-color: #d8d8d8;" align="left">
							    	 	<div id="SkillTypeLBL">Type</div>
							    	 	<div style="display: none;" id="voiceTypeLBL">Voice Type</div>
							    	 	<div style="display: none;" id="chatTypeLBL">Chat Type</div>	
						    	 	</td>
						    	 	<td class="allTdBackColor" style="width: 175px;" align="left">
							    	 	<div id="SkillTypeDDL">NA</div>
							    	 	<div style="display: none;" id="voiceTypeDDL">
								     		<select name="voiceProcess" id="voiceProcess" class="reSizeforOther">
												<option value="">---Select---</option>
												
												<%
													qry = "SELECT Skill_type_Id, Skill_type_Name FROM skill_type_master WHERE is_Active=1";
													System.out.println("query "+qry);
													rst = smt.executeQuery(qry);
													while(rst.next())
													{
													%>
														<option value="<%=rst.getString("Skill_type_Id")%>"><%=rst.getString("Skill_type_Name")%></option>	
												    <%
													}
												rst.close();
									            %>
											</select>
							    	 	</div>
							    	 	<div style="display: none;" id="chatTypeDDL">
								     		<select name="chatProcess" id="chatProcess" class="reSizeforOther">
												<option value="">---Select---</option>
												
												<%
													qry = "SELECT Skill_type_Id, Skill_type_Name FROM skill_type_master WHERE is_Active=1";
													System.out.println("query "+qry);
													rst = smt.executeQuery(qry);
													while(rst.next())
													{
													%>
														<option value="<%=rst.getString("Skill_type_Id")%>"><%=rst.getString("Skill_type_Name")%></option>	
												    <%
													}
												rst.close();
									            %>
											</select>
										</div>	
						    	 	</td>		  
						    	</tr>
						     	<tr>
						     		<td colspan="6" align="left" valign="top" class="allTdBackColor" style="height: 150px;">
							     		<div id="noType" class="allTdBackColor">
							     			Please select a skill set.
							     		</div>
							     		<div id="voiceType" style="display: none;" class="allTdBackColor">
							     			Job description (Voice) given below:
							     			<ul>
								     			<li>Excellent spoken English and communication skills.</li>
												<li>Must have completed 12 years of formal education.</li>
												<li>Program based mandatory skills required (different for each program)</li> 
												<li>Candidates with and with out experience can apply.</li>
							     			</ul>
							     		</div>
							     		<div id="chatType" style="display: none;" class="allTdBackColor">
							     			Job description (Non-Voice) given below:
							     			<ul>
								     			<li>Excellent written English</li>
								     			<li>Can type at least 25 words per minute with 85% accuracy.</li>
								     			<li>Graduates and Undergraduates.</li>
								     			<li>Must have completed minimum of 12 years of formal education.</li>
								     			<li>Candidates with and with out experience can apply.</li>
							     			</ul>
							     		</div>
									</td>
						     	</tr>
						    </table>
							
							<br/>
							
							<table border="0" cellpadding="0" cellspacing="0" class="w100p" style="height: 41px;">	
							    <tr>
							        <td style="padding-left: 10px;" align="left" valign="middle">
								    	<%
										    System.out.println("Image Size \t : "+session.getAttribute("ImgSize"));					    
										    int newImgSize=(Integer)session.getAttribute("ImgSize");
										    if (newImgSize != 0)
										    {
										        if(newImgSize < 6000)
										        {
											   	  session.setAttribute("photoCam","1");
										%>
									    		<input type="button" name="Take_Photo" id="Take_Photo" class="buttonMedium" value="Take Photo" onclick="redirectToPhotoCam()"/>
									    <%
											    }
										    }
							    	 	%>
							        </td>
							        <td style="padding-right: 10px;" align="right" valign="middle">
<!-- 
							    		<input type="button" name="Take_Voice_Test" id="Take_Voice_Test" class="buttonLarge" value="Take Voice Test"  style="display: none;" onclick="return redirectToTallFree();"/>
							    		<input type="Submit" name="Take_Chat_Test" id="Take_Chat_Test" class="buttonLarge" value="Take Chat Test" style="display: none;" onclick="return validation();"/>
 -->
							    		<input type="Submit" name="Take_Test" id="Take_Test" class="buttonLarge" value="Take Test" style="display: none;" onclick="return validation();"/>
							        </td>
							    </tr>
							</table>			
						</form>
					</div>
			    </div>
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
  	<%
		}
		catch(Exception ex)
		{
			System.out.println(ex);
			System.out.println(ex.getMessage());
			System.out.println(ex.getCause());
			ex.printStackTrace();
			// response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		finally
		{
			ConnectionDAO.closeConnection(con, smt, rst);
		}
	%>   

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
<div id="light" class="white_content">
	<table cellspacing="0" cellpadding="0" border="0" style="width:450px; height:100px;">
	<tr>
		<td align="right"> 
			<a href="javascript:void(0)" onClick="closelightbox()" style="float: right" class="close">			
			</a>
		</td>
	</tr>
	<tr>
		<td align="center" style="padding-bottom:10px;">
			<span class="msgClass" id="dispMSG"></span>
			<br>
			<br>
				<input type="button" style="font-weight: bold;" value=" Ok " id="closeblock" onclick="closelightbox()">
		</td>	  		
	</tr>
	</table>
</div>
<div id="fade" class="black_overlay">
</div>
<div style="display:none;">
	<input type="button" id="openPOP" onclick="createlightbox()">
</div>	
  </body>
</html>
