<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<html>
<head>
<title>[24]7 SPRINGBOARD</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<meta http-equiv="Content-Type"  content="text/html;charset=UTF-8" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/NoBack.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/site.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/camcanvas.js"></script>		
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/base64.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/canvas2image.js"></script>		
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/excanvas.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/excanvas.compiled.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/excanvas-compressed.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
			
	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
	</style>

<script type="text/javascript">
	function GetXmlHttpObject()
    {	
	 	if (window.XMLHttpRequest)
		{
			return new XMLHttpRequest();
		}
		if (window.ActiveXObject)
		{
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
	return null;
    }    
	function getchargeCode()
	{
		try
		{
		 var image = document.getElementById("canvas");
		 var img   = image.toDataURL("image/png");
	 	 var splitImg=img.replace('data:image/png;base64,', '');
	 	 document.getElementById("hidenData").value=splitImg;
		}
		catch(e)
		{
			//alert('Exception');
			document.getElementById("hidenData").value = "iVBORw0KGgoAAAANSUhEUgAAAUAAAADwCAYAAABxLb1rAAADYUlEQVR4nO3OIQEAMAwEsfdvepNxoAHh2bYHcFQeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4ASHwDZOV32KpaSQAAAABJRU5ErkJggg==";
		}
	 	document.forms["xyz"].submit();
	} 
	function visible()
	{
		document.getElementById("display").style.display='';
	}
</script>
</head>
<body onLoad="initCanvas(320,240);">
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
		<%
		try
		{
			System.out.println("Camcanvas Page : ");
			int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
			System.out.println("USER_AUTOID : "+USER_AUTOID);
			if(USER_AUTOID == 0)
			{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
			}
			String USER_Name =((String)session.getAttribute("USER_Name")).trim();
			System.out.println("USER_Name : "+USER_Name);
			String USER_ID =(String)session.getAttribute("USER_ID");
			System.out.println("USER_ID : "+USER_ID);
		%>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <%
            	String photoCam=(String)session.getAttribute("photoCam");
            	System.out.println("photoCam \t"+photoCam);
            	if(photoCam!="0")
            	{
	            %>	            
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > </font>	            
	            <%
	            }
	            else
	            {
	            %>	            
	             <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Registration > </font>	            
	            <%
	            }
	            
	             %>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Photo Identification</font>
	            </td>
       	        <td align="right" style="padding-right:10px;">
					  <b><span class="recName"><%=USER_Name%></span></b>
				</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        
	        <!-- ##################### =====================================  ##################### -->
<br/>
<table border="0" cellpadding="0" cellspacing="0" style="width: 900px; color:#AD0000;" height="350px;">
<tr>	
	<!-- p> webcam-origin  webcam-target  <a href="http://github.com/taboca/CamCanvas-API-/tree/master">For code information please visit the github repository</a>.</p-->
	<!-- style="padding-left: 120px;" -->
	<td width="50%" align="center">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;height: 350px">
			
			<tr align="center"><td style="font-size: 13px; font-family:Verdana; font-weight: bold">Please align your face to the center of the screen</td></tr>
			<tr>
				
				<td align="center">
					<div style="-moz-border-radius:12px; background-color:#ddd;width:360px;text-align:center;height:260px;padding-top:15px;">
						<object id="iembedflash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="320" height="240">
			  				<param name="movie" value="<%=request.getContextPath()%>/247Recruit/webCamSWF/camcanvas.swf" />
			  				<param name="quality" value="high" />
							<param name="allowScriptAccess" value="always" />
			  				<embed allowScriptAccess="always" id="embedflash" src="<%=request.getContextPath()%>/247Recruit/webCamSWF/camcanvas.swf" quality="high" width="320" height="240" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" mayscript="true" />
						</object>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" style="height: 41px;">
					<div>
						<button class="buttonLarge320" onClick="setFunction('passLineNormal'), visible()">Click Here To Capture Picture</button>
					</div>
				</td>
			</tr>
		</table>
	</td>

	<td width="50%" align="center">
							<!--  padding-left: 40px; -->
		<div id="display" style="display: none; height: 350px;" align="right">
								<!-- templateCreationpopAjaxAction.jsp  ||||   <%//=request.getContextPath() %>/247Recruit/jsp/templateCreationpopAjaxAction.jsp-->
		<form method="post" name="xyz" id="xyz" action="<%=request.getContextPath()%>/CanvasServlet" style="height: 350px;" accept-charset="utf-8">
			<table border="0" cellpadding="0" cellspacing="0" style="width:100%;height: 350px">
				
				<tr><td align="center" style="font-size: 13px; font-family:Verdana; font-weight: bold"">Please re-take your photo if require</td></tr>
				<tr>
				
					<td align="center">
						<div class="" style="-moz-border-radius: 12px; background-color: #ddd; width: 360px; text-align: center; height: 260px; padding-top: 15px;">
							<canvas id="canvas" name="canvas" width="360" height="240">
								Your browser does not support the webcam functionality.
							</canvas>
							<input type="hidden" name="cptumre" id="cp" value="<%=request.getContextPath()%>">
							<p style="padding-top: 2px;"></p>
							<input type="hidden" name="hidenData" id="hidenData">
						</div>
					</td>
				</tr>
				<tr>
					<td align="center" style="height: 41px;">
						<div>
							<%
			            	if(photoCam!="0")
			            	{
				            %>	            
				            <input type="button" id="btnSave" name="btnSave" value="Submit" class="buttonMedium"  onclick="return getchargeCode()" />            
				            <%
				            }
				            else
				            {
				            %>	            
				            <input type="button" id="btnSave" name="btnSave" value="Next" class="buttonMedium"  onclick="return getchargeCode()" />            
				            <%
				            }
				            %>
						</div>
					</td>
				</tr>
			</table>
		</form>
	  </div>
     </td>
</tr>
  	<%
		}
		catch(Exception ex)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
	%>   
</table>
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
	<!-- 
	<script type="text/javascript">
	function DoSubmit()
	{
		//alert('In DoSubmit...');
		var oCanvas = document.createElement("canvas");
		try
		{
		if (oCanvas.getContext("2d")) 
		{
			var ohidenCheck = "0";
		}
		}
		catch(e)
		{
		document.getElementById("display").style.display='';
		document.getElementById("hidenData").value = "iVBORw0KGgoAAAANSUhEUgAAAUAAAADwCAYAAABxLb1rAAADYUlEQVR4nO3OIQEAMAwEsfdvepNxoAHh2bYHcFQeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4AqOQBgEoeAKjkAYBKHgCo5AGASh4ASHwDZOV32KpaSQAAAABJRU5ErkJggg==";
	 	document.forms["xyz"].submit();
		}
	}
	DoSubmit();
	</script>
	 -->

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