<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%
	String chkURI=request.getHeader("Referer");
	System.out.println("Display URI\t"+chkURI);
	if(chkURI==null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
	}
	else
	{
		chkURI = chkURI.toLowerCase();
		System.out.println("Check\t"+chkURI.indexOf(request.getContextPath().toLowerCase()));
		if(chkURI.indexOf(request.getContextPath().toLowerCase()) < 1)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
		}
	}
	String FullURL = request.getRequestURL()+"?"+request.getQueryString();
	FullURL = FullURL.toLowerCase();
	System.out.println("Full URL - "+FullURL);
	if(FullURL.indexOf("sessionid") > 0 || FullURL.indexOf("%3cscript%3e") > 0)
	{
		System.out.println("Url Script Error");
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
	}
	String USER_Name =(String) session.getAttribute("USER_Name");
 %>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>[24]7 SPRINGBOARD</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" src="<%=request.getContextPath()%>/js/shortcut.js"></script>
	<style type="text/css">
	  	html
		{
			margin: 0px;
		}
	</style>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
<script language="javascript" src="../js/shortcut.js"></script>

<script type="text/javascript" src="../example/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../example/jquery.webcam.js"></script>

<script language="javascript">
var msg = "Sorry, this functionality is disabled.";
shortcut.add("F5",function()
{
	return false;
});
	
shortcut.add("Alt+Left",function()
{
	return false;
});

shortcut.add("f12",function()
{
	return false;
});
shortcut.add("backspace",function()
{
	return false;
});
</script>

<script type="text/javascript"> 
<!-- 
//Disable right click script 
//visit http://www.rainbow.arch.scriptmania.com/scripts/ 
var msg = "Sorry, this functionality is disabled.";
function clickIE() 
{
	if (document.all) 
	{
		return false;
	}
} 
function clickNS(e) 
{
	if(document.layers||(document.getElementById&&!document.all)) 
	{ 
		if(e.which==2||e.which==3) 
		{
			return false;
		}
	}
} 
if(document.layers) 
{
	document.captureEvents(Event.MOUSEDOWN);
	document.onmousedown=clickNS;
} 
else
{
	document.onmouseup=clickNS;
	document.oncontextmenu=clickIE;
} 
document.oncontextmenu=new Function("return false"); 
// --> 
</script> 

</head>
 
	<frameset rows="81,*,21" frameborder="no" border="0" framespacing="0" >
		<frame name="botNav1" src="jsp/Header.jsp" scrolling="no">   
		<frameset cols="*" frameborder="no" border="0" framespacing="0">
					
   			<frame name="botNav3" src="jsp/instruction.jsp" scrolling="auto">
   			
		</frameset>
		<frame name="botNav2" src="jsp/Footer.jsp" scrolling="no">
		
       <noframes>
			<p>
				This section (everything between the 'noframes' tags) will only be
				displayed if the users' browser doesn't support frames. You can
				provide a link to a non-frames version of the website here. Feel
				free to use HTML tags within this section.
			</p>
		</noframes>
</frameset>
</html>
