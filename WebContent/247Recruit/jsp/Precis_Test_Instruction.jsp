<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>


<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>[24]7 Online Precis Writing Instructions</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/careers.css"/>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css"/>
 
 <script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
 
<script type="text/javascript">
function redirect()
{
window.location.href='<%=request.getContextPath()%>/247Recruit/jsp/PrecisWritingTest.jsp';
return false;
}
</script>
  </head>
  
  <body>
<%
	
	String USER_Name =(String) session.getAttribute("USER_Name");
	 %>
	 <table border="0" width="100%">
		<tr>
	        <td align="left" style="padding-left:10px;">
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Post Registration > Chat Process Tests  ></font>
		<font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Precis Writing</font>
		</td>
		<td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b>
			</td>
		</tr>
		</table><br/>

<div class="wrapperSize">

<div class="">

<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 720px;" class="cont-lft"> <div class="redTxt"></div>      
        <div class="forms">
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid" />
          <table width="100%" cellspacing="1" cellpadding="6" border="0">
            <tbody><tr>
              <th class="taL" colspan="2">Please go through the instructions below, before you proceed.
              </th></tr>
            <tr>
              <td width="45%" colspan="2" >
              <h3>Precis Writing Test</h3>
<ul><li>In this test, please read the given passage and summarise it in your own words (not exceeding 70 - 80 words). </li>
<li>You are required to type out the summarised passage in the space given. </li>
<li>The test will start on click of the start test button.</li>
<li>You have 10 minutes to complete this test.</li>
  <li>A timer would be displayed below the passage , indicating the time remaining to complete the assessment. The timer will commence as soon as you click on "Start" button, indicating you are ready to start the test.
  <br/></li>
  <li ><img src="<%=recruitPath%>images/precis_instruction.jpg" alt="" align="middle" style="width: 450px; height: 250px;"/></li>
 <li>You may exit the test anytime by clicking on FINISH. Please remember, you would not be allowed to take the Precis Writing test again. <b>FINISH</b> button. </li>
    
     <li>When you are ready to take the assessment, please click on <b>START</b>.<br/>
    <b style="color: red;"> Note: </b>Time Starts when you click on Start button</li>
	</ul>
</td>
          </tr>
           <tr>
              <td class="taR">
              </td><td class="alterRow" align="center"><div style="float: right; overflow: hidden; margin: 0px 48px 0pt 0pt;">
                  <input name="Submit" type="submit" value="Start"  class="buttonMedium" onclick="javascript:redirect();"/>
                 
                </div></td>
            </tr>
          </tbody></table>
        </div>
   </div>
  </div>
  <div class="rightside rundgratxt">
 </div>
</div>
</div>

 </body>
</html>
