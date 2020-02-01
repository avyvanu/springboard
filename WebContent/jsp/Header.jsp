<!DOCTYPE html  "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	System.out.println("START - H");
%>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css">
	<script language="javascript" src="<%=request.getContextPath()%>/js/shortcut.js"></script>
	<style type="text/css">
	  	html,body
		{
			margin: 0px;
		}
	</style>
<script type="text/javascript">
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
  <body>
  	 <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	        <td align="left">
	            <img src="<%=request.getContextPath()%>/247Recruit/images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=request.getContextPath()%>/247Recruit/images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	    </tr>
	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:12px;">
				
			</td>
			
	    </tr>
	 </table>
  </body>
</html>
<%
	System.out.println("ENDED - H");
%>