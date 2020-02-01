<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="util.ConnectionDAO"%>
<%@page import="java.sql.ResultSet"%>

<%
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL Script Error Other Pages- "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error Other Pages");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}

    String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String recruitPath = path + "/247Recruit/";

	session.removeAttribute("F5_REFERSH");	
	String Sec_Error = request.getParameter("secruity_violation");
	System.out.println("Sec_Error \t"+Sec_Error);

 	 session.removeAttribute("USER_Name");
	 session.removeAttribute("USER_AUTOID");
	 session.removeAttribute("User_Id");
	 session.removeAttribute("x_val");
	 session.removeAttribute("x_val2");
	 session.removeAttribute("ScriptType");
	 session.removeAttribute("password_random");
	 session.setAttribute("photoCam","0");
	 
	Connection connKEY = null;
	//Statement stmtKEY = null;
	ResultSet rsKEY = null;
	String EDKey = null;
	
	String ownIPS  = request.getHeader("X-FORWARDED-FOR");  
    if(ownIPS == null)  
    {  
     	ownIPS = request.getRemoteAddr();  
    }  
	System.out.println("User System ipAddress in GLOBAL PAGE : "+ownIPS);
	
	
	String EDKPass="247Cust0m3r"; 
	try
	{
	if (session.getAttribute("EDKey") == null)
	{
		connKEY = ConnectDatabase.getConnection();
		CallableStatement call = connKEY.prepareCall("CALL GetKFL(?,?)");
		call.setString(1,ownIPS);
		call.setString(2,EDKPass);
		rsKEY = call.executeQuery();
		if(rsKEY.next())
		{
			EDKey = rsKEY.getString("KFL");	
			System.out.println("<<<<<<<<<<<<<<<<    KEY VALUE SUCCESS GET VALUE >>>>>>>>>>>>>>>>");
		}
		
		if(EDKey != null)
		{
			session.setAttribute("EDKey",EDKey);
			session.setAttribute("EDKPass",EDKPass);
			System.out.println("<<<<<<<<<<<<<<<<    KEY VALUE SUCCESS SET VALUE  >>>>>>>>>>>>>>>>");

		}
		else
		{
			session.setAttribute("EDKey","AD");
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
		}
	}
	else
	{
		if((String)session.getAttribute("EDKey") != "AD")
		{
			EDKey = (String)session.getAttribute("EDKey");
			System.out.println("<<<<<<<<<<<<<<<<    KEY VALUE SUCCESS GET SESSION VALUE  >>>>>>>>>>>>>>>>");
		}
		else
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
		}
	}
	}
	catch(Exception e)
	{
	System.out.println(e);
	}
	finally
	{
		ConnectionDAO.closeConnection(connKEY,null,rsKEY);
	}	
	 
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>[24]7 SPRINGBOARD</title>
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css"/>
		<!-- POP UP CSS -->
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/msgPOPUP.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/msgPOPUP.js"></script>
		
		<link rel="stylesheet" type="text/css" href="../css/careers.css" />		
		<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
		
		#reg_error{
		
		background: none repeat scroll 0 0 #FFEBE8;
		
		border: 1px solid #DD3C10;
		
		line-height: 15px;
		
		margin: 10px 0 0;
		
		overflow: hidden;
		
		padding: 7px 3px;
		
		text-align: center;
		
		}
		.button_image
		{
			background-image: url("<%=request.getContextPath()%>/247Recruit/images/Button_Small.png");
            background-repeat: no-repeat;
		    border: medium none;
		    border-radius: 10px 10px 10px 10px;
		    color: black;
		    cursor: pointer;
		    font: 12px Verdana,Arial,Helvetica,sans-serif;
		 	width: 71px;
		 	height:41px;
		    text-align: center;
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
			function CheckValidation()
			{
				if(document.getElementById("userName").value=='')
				{
					document.getElementById('openPOP').click();
					document.getElementById('dispMSG').innerHTML = 'Please Enter User Name !';
					document.getElementById('closeblock').focus();
					myFunction();
					//var appStr = 'Please Enter User Name !';		
					//alert(appStr);
					document.getElementById('userName').focus();
					return false;
				}
				else
				{
					if(document.getElementById("password").value=='')
					{
						document.getElementById('openPOP').click();
						document.getElementById('dispMSG').innerHTML = 'Please Enter Password !';
						document.getElementById('closeblock').focus();
						myFunction();
						//var appStr = 'Please Enter Password !!!';		
						//alert(appStr);
						document.getElementById('password').focus();
						return false;
					}
				}
			}
		
			function AllowAlphaNumeric(evt)
			{
				var charCode = (evt.which) ? evt.which : event.keyCode;
				if (charCode == 8 || charCode == 13 || (charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)) 
				{
					return true;
				}
				else
				{
					document.getElementById('openPOP').click();
					document.getElementById('dispMSG').innerHTML = 'Invalid character entered !';
					document.getElementById('closeblock').focus();
					myFunction();
					//alert("Invalid character entered !!");
					return false;
				}
			}      
		</script>	 

<script type="text/javascript">
function disablePopUp() {
   var ac, c, f, fa, fe, fea, x, y, z;
    ac = "autocomplete";
   c = 0;
   f = document.forms;
  for(x = 0; x < f.length; x++) {
      fa = f[x].attributes;
      for(y = 0; y < fa.length; y++) {
         if(fa[y].name.toLowerCase() == ac) {
            fa[y].value = "off";
            c++;
         }
      }

      fe = f[x].elements;
      for(y = 0; y < fe.length; y++) {
         fea = fe[y].attributes;
         for(z = 0; z < fea.length; z++) {
            if(fea[z].name.toLowerCase() == ac) {
               fea[z].value = "off";
               c++;
            }
         }
      }
   }
}
</script>
	</head>
	<body onload="disablePopUp()">
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=request.getContextPath()%>/247Recruit/jsp/Welcome_Page.jsp">Home</a> > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Login</font>
	        </td>
	        <td></td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center" valign="middle" style="height:450px;">
	        	        
	        <!-- ############################################ -->
	        
								<form action="ControllerServlet" method="post">
									<%
										if (request.getAttribute("LoginStatus") != null) 
										{
											String loginStatus = (String) request.getAttribute("LoginStatus");								
											if ("UnSuccessfull".equals(loginStatus))
											{ 
												String getParameter =request.getParameter("target");
												if ("Logout".equals(getParameter)) 
												{											
												}
												else
												{
									%>
									<div id="reg_error" style="opacity:1; height: 15px; text-align: center; font-size: 13px; width: 345px;">
										The username or password you entered is incorrect.
									</div>
									<%
												}
											}
										}										
										if (Sec_Error != null) 
										{
											if (Sec_Error.equals("error"))
											{ 
									%>
									
									<div id="reg_error" style="opacity:1; height: 15px; text-align: center; font-size: 13px; width: 345px;">
										Security violation. Please relogin to continue.
									</div>
									
									<%
											}
										}
									%>

									<div class="forms">
										<input type="hidden" name="target" value="Login" />
										<table cellspacing="6" cellpadding="6" border="0">
											<tbody>
												<tr>
													
												</tr>
												<tr>
													<td width="90" class="taR"> 
														<font style="font-weight:bold; font-size:12px; font-family:Arial;">User ID :</font>
													</td>
													<td class="alterRow" align="center">
														<div class="txt-box">
															<input type="text" id="userName" name="userName" maxlength="15" autocomplete="off" onpaste="" oncopy="return false" oncut="return false" onkeypress="return AllowAlphaNumeric(event);" />
														</div>
														<span class="redTxt" id="txtusername"></span>
													</td>
												</tr>
												<tr>
													<td class="taR">
														<font style="font-weight:bold; font-size:12px; font-family:Arial;">Password :</font>
													</td>
													<td class="alterRow" align="center">
														<div class="txt-box">
															<input type="password" id="password" name="password" onpaste="" oncopy="return false" oncut="return false" maxlength="30" autocomplete="off" />
														</div>
														<span class="redTxt" id="txtpass"></span>
													</td>
												</tr>

												<tr>
													<td style="background-color: white;">
													</td>
													<td align="center" style="background-color: white;">
														<div
															style="overflow: hidden;">
															<input type="submit" class="buttonSmall" value="Login" id="submit" name="submit" onclick="return CheckValidation();"/>
														</div>
													</td>
												</tr>

											</tbody>
										</table>
									</div>

								</form>
			<!-- ############################################ -->    
	        </td>
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