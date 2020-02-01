<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String recruitPath = path + "/247Recruit/";
String canId = (String)session.getAttribute("Bpo_Cand_Id");
System.out.println("Bpo_Cand_Id ID:::::"+canId);
session.setAttribute( "Bpo_Cand_Id", canId );
String UpdateState = (String)session.getAttribute("ScriptUpdateState");
if(UpdateState==null)
{
session.setAttribute( "ScriptUpdateState", "0");
UpdateState = "0";
}
System.out.println("LD Update Script page Page::::ProofStatus::::"+UpdateState);
Connection connection=ConnectDatabase.getConnection();
String ChatText=null;
String query="select * from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'"; 
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query);
if(rs.next())
{
ChatText=rs.getString("ChatText");
if(ChatText==null ||(ChatText==""))
{
ChatText="";
}
}
%>


<html>
  <head>
    <title>[24]7 Chat Upload</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<script type="text/javascript">
	function ClearScript(BioForm)
  	{
  		document.getElementById('txtScript').value="";
  		
  	}
	</script>
 </head>
  <body>
    <form name="FileUpoadForm" action="<%=recruitPath%>jsp/LD_ChatScriptSubmit.jsp" method="post">
    	<table border="0" cellpadding="0" cellspacing="0">
		         <tr>
		         <%
		    		System.out.println("LD_ChatScriptRight::::Session Value of:::::"+UpdateState);
		    		if(UpdateState.equalsIgnoreCase("1")){ 
    			 %>
		            <td align="left" >
		               <textarea name="txtScript" id="txtScript" style="width:350px;height:75px;border: 0px;resize:none;" wrap="soft" onkeypress="return AllowChars(event);" readonly="readonly" class="allTdBackColor" ><%=ChatText %></textarea>
		            </td>
		            <td width="10px">
                     </td>
		            <td align="center">
		            	<input type="submit" name="submit" value="Change" class="buttonMedium" /><br />
		             </td>
		            <%} else { %>
		            
		            <td align="left" >
		               <textarea name="txtScript" id="txtScript" style="width: 350px; height: 75px;"  wrap="soft" onkeypress="return AllowChars(event);"></textarea>
		            </td>
		            <td width="10px">
                     </td>
		            <td align="center">
		            	<input type="submit" name="submit" value="Upload" class="buttonMedium" /><br />
		                <input type="button" name="back" value="Clear" class="buttonMedium" onclick="javascript:ClearScript(this);" />
		            </td>
		            <%} %>
		        </tr>
		      </table>
    	</form>
  	 </body>
</html>
