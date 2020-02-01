<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL - "+FullURL);
	
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String recruitPath = path + "/247Recruit/";
	
	session.removeAttribute("USER_Name");
	session.removeAttribute("USER_AUTOID");
	session.removeAttribute("USER_ID");
	session.removeAttribute("x_val");
	session.removeAttribute("x_val2");
	session.removeAttribute("ScriptType");
	session.removeAttribute("password_random");
	session.setAttribute("photoCam","0");
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
		<link rel="stylesheet"  type="text/css" media="screen" href="<%=request.getContextPath() %>/247Recruit/css/style.css" />
		
		<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/scripts.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/imagesG/jquery-1.3.1.min.js"></script>
			
		<style type="text/css">
			body
			{
				font-family:arial
			}
			
			.clear 
			{
				clear:both
			}
			
			#gallery {
				position:relative;
				height:360px
			}
			
			#gallery a {
				float:left;
				position:absolute;
			}
			
			#gallery a img {
				border:none;
			}
			
			#gallery a.show {
				z-index:400
			}
		
			#gallery .caption {
				z-index:500; 
				background-color:#000; 
				color:#ffffff; 
				height:200px; 
				width:50px; 
				position:absolute;
				bottom:100px;
				
			}
		
			#gallery .caption .content {
				margin:5px
			}
			
			#gallery .caption .content h3 {
				margin:0;
				padding:0;
				color:#1DCCEF;
			}
			
			.button_image
			{
				background-image: url("<%=request.getContextPath()%>/247Recruit/images/Button_Big.png");
	            background-repeat: no-repeat;
			    border: medium none;
			    border-radius: 10px 10px 10px 10px;
			    color: black;
			    cursor: pointer;
			    font: 12px Verdana,Arial,Helvetica,sans-serif;
			 	width: 161px;
			 	height:41px;
			    text-align: center;
			}
		</style>
		
		<script type="text/javascript">
			function redirect()
			{
				 window.location.href ="<%=request.getContextPath()%>/247Recruit/jsp/Main_Instruction_Page.jsp";
			}
		</script>
	</head>
	<body>
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
	        <td colspan="2" align="center">
	        
	        <!-- ############################################ -->
 
  <!--/top-->
   <div id="header" style="height:351px;">
   <div class="wrap">
   <div id="slide-holder">
   <div id="slide-runner">
    <a href=""><img id="slide-img-1" src="<%=request.getContextPath()%>/247Recruit/imagesG/Home-Page-Banner-Image1.jpg" class="slide" alt="" style="width:1024px;" height="351px;"/></a>
    <a href=""><img id="slide-img-2" src="<%=request.getContextPath()%>/247Recruit/imagesG/Home-Page-Banner-Image2.jpg" class="slide" alt="" style="width:1024px;" height="351px;"/></a>
 
    <div id="slide-controls">
     <p class="text"><strong>THANK YOU FOR YOUR INTEREST IN [24]7 INC.</strong><span></span></p>
     <p class="vis">We are always looking for talent, for our Social Media, <br/> Chat and Voice based client programs. </p>
     <p class="vis"> We invite you to take the next step in your career with us.</p>
	 <div class="vis">
	 	<table border="0" cellpadding="0" cellspacing="0" align="left">
  			<tr>
   			 <td valign="middle" class="visch" align="left" style="width: 150px;">
			  <a href="<%=request.getContextPath() %>/jsp/Login.jsp" >Click Here to Login</a> 
			 </td>
   			 <td align="right" style="width: 220px;">
				 <input type="button" name="Candidate_Search" value="CLICK TO START" onClick="redirect()" class="buttonLarge"/>
			</td>
 		  </tr>
		</table>
	</div>
	
    </div>
</div>
	
	<!--content featured gallery here -->
   </div>
   <script type="text/javascript">
    if(!window.slider) var slider={};slider.data=[
	{
		"id":"slide-img-1",
		"client":"nature beauty",
		"desc":"nature beauty photography"
	},
	{
		"id":"slide-img-2",
		"client":"nature beauty",
		"desc":"add your description here"
	}	
	];
   </script>
  </div></div>


  <table width="100%" cellpadding="0" cellspacing="0" >
  	  <tr style="background-color: #f38900; height: 12px;">
  			<td colspan="6"></td>
  	  </tr>
  	  <tr style="background-color: #808080; height: 34px; color:#ffffff; font-weight: bold;">
  			<td colspan="6" style="padding-left: 10px;" align="left">SOUND BYTES FROM [24]7ITES</td>
  	  </tr>
  	  <tr style="height:120px;" >
  	  		<td style="width: 220px;" align="left">
	  	  		<table width="210" border="0" cellpadding="0" cellspacing="0">
	  				<tr>
	    				<td align="left" style="width:57px; height:57px;">
	    					<img alt="" src="<%=request.getContextPath()%>/247Recruit/images/33029--Somanna.jpg" width="57" height="57" style="padding-left: 20px;">
	    				</td>
	    				<td align="left" style="font-size: 11px; padding-left: 10px; color: #333333;">
	    					Somanna
	    				</td>
	  				</tr>
	  				<tr>
	  					<td align="left" colspan="2" style="width:210px; font-size: 10px; color:#666666; padding-left: 20px; font-weight: bold; padding-top: 5px; cursor: pointer;" title="It’s an amazing place to work and has provided me with good opportunities for growth and recognition.">"It’s an amazing place to work and has provided me with good..."</td>
	  				</tr>
				</table>
  	  		</td>
  	  		<td style="width: 220px;" align="left">
	  	  		<table width="210" border="0" cellpadding="0" cellspacing="0">
	  				<tr>
	    				<td align="left" style="width:57px; height:57px;">
	    					<img alt="" src="<%=request.getContextPath()%>/247Recruit/images/46311--Poulami.jpg" width="57" height="57" style="padding-left: 20px;">
	    				</td>
	    				<td align="left" style="font-size: 10px; padding-left: 10px; color: #333333;">
	    					Poulami
	    				</td>
	  				</tr>
	  				<tr>
	  					<td align="left" colspan="2" style="width:210px; font-size: 10px; color:#666666; padding-left: 10px; font-weight: bold; padding-top: 5px; cursor: pointer;" title="I love coming to [24]7 every day as I get to work with a supportive team and learn more about the work I do.">"I love coming to [24]7 every day as I get to work with a supportive team..."</td>
	  				</tr>
				</table>
  	  		</td>
  	  		<td style="width: 220px;" align="left">
	  	  		<table width="210" border="0" cellpadding="0" cellspacing="0">
	  				<tr>
	    				<td align="left" style="width:57px; height:57px;">
	    					<img alt="" src="<%=request.getContextPath()%>/247Recruit/images/7090---Pradeep-Acharya.jpg" width="57" height="57" style="padding-left: 20px;">
	    				</td>
	    				<td align="left" style="font-size: 11px; padding-left: 10px; color: #333333;">
	    					Pradeep Acharya
	    				</td>
	  				</tr>
	  				<tr>
	  					<td align="left" colspan="2" style="width:210px; font-size: 10px; color: #666666; padding-left: 20px; font-weight: bold; padding-top: 5px; cursor: pointer;" title="[24]7 being an employee friendly organization has been very close to my heart for the last 6 years. It helped me learn new things every day, so I never got bored of my work.">"[24]7 being an employee friendly organization has been very close..."</td>
	  				</tr>
				</table>
  	  		</td>
  	  		<td></td>
  	  		<td style="background-color: #ececec; width: 150px;" align="left">  	  		
  	  			<table width="165" border="0" cellpadding="0" cellspacing="0">
  					<tr>
   						 <td align="left" style="width:51px; height:51px; padding-left: 20px;">
   						 	<img alt="" src="<%=request.getContextPath()%>/247Recruit/images/facebook_logo.png" width="57" height="57">
						 </td>
						 <td align="left" style="font-size: 10px; padding-left: 10px; color: #666666;">
						 	Join us on<br/> facebook
						 </td>
  					</tr>
  					<tr>
  						<td align="left" colspan="2" style="font-size: 11px; padding-left: 20px; color:#666666;">
  						facebook.com/247customer
  						</td>
  					</tr>
				</table>
  	  		</td>
  	  		<td style="background-color: #ececec; width: 150px;" align="left">  	  		
  	  			<table width="165" border="0" cellpadding="0" cellspacing="0">
  					<tr>
	   					<td align="left" style="width:51px; height:51px; padding-left: 20px;">
	  	  					<img alt="" src="<%=request.getContextPath()%>/247Recruit/images/Twitter_Logo.png" width="57" height="57">
	  	  				</td>
  	  				 	<td align="left" style="font-size: 10px; padding-left: 10px; color: #666666;">
						 	Follow us on<br/> twitter
						</td>
  					</tr>
  					<tr>
  						<td align="left" colspan="2" style="font-size: 11px; padding-left: 20px; color: #666666;">
  	  						twitter.com/#!/24_7inc
  	  					</td>
  					</tr>
				</table> 	 
  	  		</td>
  	  </tr>
  </table> 
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

  </body>
</html>
