<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" isELIgnored="false" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="java.text.DateFormat"%>
<%@ include file="GlobalDeclare.jsp" %>


<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	String USER_ID = (String)session.getAttribute("USER_ID");
	System.err.println(">>>USER_ID ++++++++++++++++++++++++++++++++++++++++ " + USER_ID);
	if(USER_Name==null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	System.out.println("USER_Name in Reports home page::::"+USER_Name);		  	
	
	// ***********************
	int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
	System.err.println(">>>USER_AUTOID ++++++++++++++++++++++++++++++++++++++++ " + USER_AUTOID);
	if(USER_AUTOID == 0)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	System.out.println("USER_AUTOID in User access  REports page::::"+USER_AUTOID);
	String User_Type_Id = (String)session.getAttribute("User_Type_Id");
	System.out.println("User_Type_Id in User access REports page::::"+User_Type_Id);
	String IsSAdmin = ((String)session.getAttribute("IsSAdmin")).trim();
	if(IsSAdmin == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}

	// ***********************
	
	
	Connection connection = null;
	String userType_name = "";
	String qryUserType = "";
	try
	{
		connection = ConnectDatabase.getConnection();
		Statement smtUserType = connection.createStatement();
		qryUserType = "SELECT  User_Type_Description FROM user_type_master WHERE Is_Active = 1 AND User_Type_ID = '"+User_Type_Id+"'";
		ResultSet rstUserType = smtUserType.executeQuery(qryUserType);
		if(rstUserType.next())
		{
			userType_name = rstUserType.getString("User_Type_Description");
			System.out.println("userType_name \t"+userType_name);
		}
	rstUserType.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	

	String location = "";
	String Parent_Access = ""; 
	String Child_Access = ""; 
	String Program_Access = "";

	try
	{
		location = request.getParameter("location");
		if(location == null)
		{
			location = "0";	
		}
		Parent_Access = request.getParameter("parentAccess");
		if(Parent_Access == null)
		{
			Parent_Access = "0";
		}
		Child_Access = request.getParameter("childAccess");
		if(Child_Access == null)
		{
			Child_Access = "0";
		}
		Program_Access = request.getParameter("programAccess");
		if(Program_Access == null)
		{
			Program_Access = "0";
		}
		System.out.println("location\t"+location+ " Parent_Access\t"+Parent_Access+" Child_Access\t"+Child_Access+" Program_Access\t"+Program_Access);
	}
	catch(Exception e)
	{
		e.printStackTrace();
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
	
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<style>
		.tblGRID 
		{ 
		    width: 100%; 
		    background-color: #fff; 
		    margin: 5px 0 10px 0; 
		    border: solid 1px #525252; 
		    border-collapse:collapse; 
		}
		.tblGRID td { 
		    padding: 2px; 
		    border: solid 1px #c1c1c1; 
		    color: #333333; 
		    font-size: 12px; 
		}
		.tblGRID th { 
		    padding: 4px 2px; 
		    color: #fff; 
		    background-color: #424242; 
		    border-left: solid 1px #525252; 
		    font-size: 12px; 
		}
		html,body
		{
			margin: 0px;
		}
	</style>
	<script type="text/javascript" language="javascript">	
		
		function logout()
		{
			location.href = "<%=logoutPage%>";
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

<script type="text/javascript">
function GetXmlHttpObject()
{
	if (window.XMLHttpRequest)
    {
		// code for IE7+, Firefox, Chrome, Opera, Safari
  		return new XMLHttpRequest();
  	}
	if (window.ActiveXObject)
	{
		// code for IE6, IE5
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}
function getChildAccess(pgval,chval)
		{
			document.getElementById("childAccess").disabled=false;
			getChildAccessList(pgval,chval);
		}
function getChildAccessList(pgval)
{
	var pa;
	if(pgval == null)
	{
		pa = document.getElementById("parentAccess").value;
	}
	else
	{
		pa = pgval;
	}
	if (pa != "0")
	{
	    var url="<%=request.getContextPath()%>/247Recruit/jsp/GetChildAccessData.jsp";	    
		url=url+"?sid="+Math.random();
		url=url+"&parentId="+pa; 
	    var request = GetXmlHttpObject();
	    if (request==null)
	    {
	 		 alert("Your browser does not support AJAX!");
			 return false;
		}
		request.onreadystatechange = function () 
		{		
			chargeCodeSelected(request);
		};
		request.open("POST", url, true);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		request.send(null);
	}
	else
		{
		 var arry = new Array(0);
		 document.getElementById('childAccess').options.length = 0;	
	     arry[0] = document.createElement('option');  
		 arry[0].text = 'All';
		 arry[0].value ='0';
		 document.getElementById('childAccess').options[0]= arry[0];	
		}  
}

function chargeCodeSelected(request)
{	
	if(request.readyState==4 && request.status==200)
	{
		var data = request.responseText;
		idata=data.split(",");
		var arry = new Array(idata.length+1);
		var i = 0;
		document.getElementById('childAccess').options.length = 0;
		arry[i] = document.createElement('option');  
		arry[i].text = 'All';
		arry[i].value ='0';
		document.getElementById('childAccess').options[i]= arry[i];	
		for(i=1;i<idata.length;i++)
		{
			fenName = idata[i-1].split(":");
			arry[i] = document.createElement('option');  
			arry[i].text = fenName[1].trim();
			arry[i].value = fenName[0].trim();
			document.getElementById('childAccess').options[i]= arry[i];	
		}
		dailyFrmName.childAccess.value = document.getElementById('childAccessHdd').value;
		//document.getElementById('childAccess').options[i]= arry[i];	
	}
}
</script>

</head>
  
  <body onload="callDailyReg()">
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/Reports_Home_Page.jsp">Reports</a> > </font>
	            <font class="nonLink">User Access Report</font>
	        </td>
	        <td align="right"  style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" style="padding-left:10px;padding-right: 10px;" align="center">
	        <br/>
	            <table width="1200px">
		            <tr>
			            <td colspan="2">
			            	<form action="" method="post" name="dailyFrmName" id="dailyFrmName">
			            	<table>
			            		<tr>
						            <td>
						            	 	<span style="font-size: 12px;">User Type: <b><%=userType_name%></b></span>
						            	 	<span style="font-size: 12px;">Location:</span>						
											<select name="location" id="location">
									    	<option value="0">All</option>
									    	<%  
									    		Statement smt = connection.createStatement();
							              		String qry = "SELECT centre_id,centre_name FROM centre_master WHERE is_alive=1";
												System.out.println("query "+qry);
												ResultSet rst = smt.executeQuery(qry);
												while(rst.next())
												{
											%>
													<option value="<%=rst.getString("centre_id")%>"><%=rst.getString("centre_name")%></option>	
									   		<%
												}
												rst.close();
						                	%>
								        	</select>
								        	<span style="font-size: 12px;">Parent Access:</span>	
								        	<select style="width:150px;" name="parentAccess" id="parentAccess" onchange="getChildAccess();">
								        		<option value="0">All</option>
								        		<%
								    		 	String qryforReportTasks = "SELECT tm.Task_Id,tm.task_description,tm.task_url FROM User_Type_Task_Mapping uttm,task_master tm WHERE uttm.task_id = tm.task_id and tm.Is_Active = 1 and uttm.User_Type_Id = "+User_Type_Id+" and tm.Pareent_Task_Id = 0  AND uttm.UTT_Mapping_Id IN (SELECT UTT_Mapping_Id FROM User_UTT_Mapping WHERE User_Id = "+USER_AUTOID+")";
								    		 	System.out.println("qryforSIMTasks::::"+qryforReportTasks);
								    		 	connection=ConnectDatabase.getConnection();
								    		 	Statement stmtN=connection.createStatement();
								    		    ResultSet rsN=stmtN.executeQuery(qryforReportTasks);
								    		    while(rsN.next())
								    		    {
									    		    %>
														<option value="<%=rsN.getString("tm.Task_Id")%>"><%=rsN.getString("tm.task_description")%></option>
													<%
								    		    }								    		    
								        		%>								        		
								        	</select>
								        	<span id="childSpan" style="font-size: 12px;">Child Access:</span>
							        		<select name="childAccess" id="childAccess"  style="width:150px;">
							        		<option value="0">All</option>
							        		</select>
								        	
								        	<span style="font-size: 12px;">Program Access:</span>
								        		<select id="programAccess" name="programAccess" style="width:150px;">
								        		<option value="0">All</option>
								        	<%
												String OpsProgramNameS=null;
												int OpsProgramId= 0;
												String QueryOPSDISPS= "select Program_Name,Program_id from program_names_master where program_id in(select Program_id from user_program_mapping where User_id='"+USER_AUTOID+"') and Is_Alive=1 order by Program_Name";
												System.out.println("Selection Query:: >>>> S "+QueryOPSDISPS);
												Statement stmtOpsISPS=connection.createStatement();
												ResultSet OpsDISPS=stmtOpsISPS.executeQuery(QueryOPSDISPS);
												while(OpsDISPS.next())
												{
													OpsProgramNameS=OpsDISPS.getString("Program_Name");
													OpsProgramId = OpsDISPS.getInt("Program_id");
												%> 
													<option value="<%= OpsProgramId%>"><%=OpsProgramNameS %></option>
												<%
												}
												%>
							       				<!-- -***************Operations Initial display****** --> 
								        		
								        		</select>
								        	
								     </td>
			            			<td>
			            			<input type="hidden" name="locationHdd" id="locationHdd" value="<%=location%>"/>
		            				<input type="hidden" name="parentAccessHdd" id="parentAccessHdd" value="<%=Parent_Access%>"/>
		            				<input type="hidden" name="programAccessHdd" id="programAccessHdd" value="<%=Program_Access%>"/>
		            				<input type="hidden" name="childAccessHdd" id="childAccessHdd" value="<%=Child_Access%>"/>
			            			<input type="submit" name="searchCand" class="buttonSmall" value="Go"/></td>
				            		<td nowrap="nowrap"></td>
			            		</tr>
			            	</table>
			            	</form>
						    <table cellpadding="5" cellspacing="0" rules="all" class="tblGRID" width="100%">
						    <%
						   
						    %>
						    	<tr>
						    		<th>
						    			Emp_id <!-- 1 -->
						    		</th>
						    		<th>
						    			Emp_name <!-- 2 -->
						    		</th>
						    		<th>
						    			Program <!-- 3 -->
						    		</th>						    		
						    								    		
						    		<th>
						    			User Type <!-- 4 -->
						    		</th>
						    		<th>
						    			Location <!-- 5 -->
						    		</th>
						    		<th>
						    			User access <!-- 6  -->
						    		</th>
						    		<th>
						    			Program access <!-- 7 -->
						    		</th>
						    	</tr>

							<%
							String UserTypeId ="";
							String EmpUserAutoId ="";
							int programID = 0;
							int subProgramId = 0;
							Statement smtUser = connection.createStatement();
							String qryUser = "";
							String qryUserPgrm = "";
							String userProgramName = null;
							int Task_ID = 0;
							if(User_Type_Id.equalsIgnoreCase("3"))
							{
								System.out.println("Operation Useraccess main qry part::::::::::::::;");
								if(location.equalsIgnoreCase("0") && Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0") && Program_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT User_Id, Emp_ID, Emp_Name, User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id  FROM user_master  WHERE Is_Active=1 AND User_Type_Id = '"+User_Type_Id+"' and User_Id not in ("+USER_AUTOID+")";
								}
								if(!location.equalsIgnoreCase("0") && Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0") && Program_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT User_Id, Emp_ID, Emp_Name, User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id   FROM user_master  WHERE Is_Active=1 AND User_Type_Id = '"+User_Type_Id+"' and Centre_Id = '"+location+"' and User_Id not in ("+USER_AUTOID+")";
								}
								if(!location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0") && Program_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,U.Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) INNER JOIN user_program_mapping UP ON U.User_Id = UP.User_Id WHERE T.Is_Active=1 AND U.Centre_Id = '"+location+"' AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Parent_Access+"' AND T.Pareent_Task_Id = 0";
								}
								
								////////To be done from here//////
								
								if(!location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && !Child_Access.equalsIgnoreCase("0") && Program_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) WHERE T.Is_Active=1 AND U.Centre_Id = '"+location+"' AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Child_Access+"' AND T.Pareent_Task_Id = '"+Parent_Access+"'";
								}
								if(location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && !Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) WHERE T.Is_Active=1  AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Child_Access+"' AND T.Pareent_Task_Id = '"+Parent_Access+"'";
								}
								if(location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) WHERE T.Is_Active=1  AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Parent_Access+"' AND T.Pareent_Task_Id = 0";
								}
							}
							else
							{
								System.out.println("Else part::::::::::::::;");
								if(location.equalsIgnoreCase("0") && Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT User_Id, Emp_ID, Emp_Name, User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id  FROM user_master  WHERE Is_Active=1 AND User_Type_Id = '"+User_Type_Id+"' and User_Id not in ("+USER_AUTOID+")";
								}
								if(!location.equalsIgnoreCase("0") && Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT User_Id, Emp_ID, Emp_Name, User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id   FROM user_master  WHERE Is_Active=1 AND User_Type_Id = '"+User_Type_Id+"' and Centre_Id = '"+location+"' and User_Id not in ("+USER_AUTOID+")";
								}
								if(!location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) WHERE T.Is_Active=1 AND U.Centre_Id = '"+location+"' AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Parent_Access+"' AND T.Pareent_Task_Id = 0";
								}
								if(!location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && !Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) WHERE T.Is_Active=1 AND U.Centre_Id = '"+location+"' AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Child_Access+"' AND T.Pareent_Task_Id = '"+Parent_Access+"'";
								}
								if(location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && !Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) WHERE T.Is_Active=1  AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Child_Access+"' AND T.Pareent_Task_Id = '"+Parent_Access+"'";
								}
								if(location.equalsIgnoreCase("0") && !Parent_Access.equalsIgnoreCase("0") && Child_Access.equalsIgnoreCase("0"))
								{
									qryUser = "SELECT U.User_Id, Emp_ID, Emp_Name, U.User_Type_Id , Centre_Id AS Location,Program_Id,SubProgram_Id,T.task_id  FROM user_master U INNER JOIN user_type_task_mapping UT ON U.User_Type_Id=UT.User_Type_Id INNER JOIN task_master T ON T.Task_Id=UT.Task_Id INNER JOIN user_utt_mapping UTM ON (UTM.User_Id=U.User_Id AND UTM.UTT_Mapping_id = UT.UTT_Mapping_id) WHERE T.Is_Active=1  AND U.User_Type_Id = '"+User_Type_Id+"' AND U.User_Id NOT IN ('"+USER_AUTOID+"') AND T.task_id = '"+Parent_Access+"' AND T.Pareent_Task_Id = 0";
								}
							}
							
							try
							{
		              		System.out.println("qryUser:::::::: "+qryUser);
							ResultSet rstUser = smt.executeQuery(qryUser);
							while(rstUser.next())
							{
								UserTypeId=rstUser.getString("User_Type_Id");
								EmpUserAutoId = rstUser.getString("User_Id");
								programID = rstUser.getInt("Program_Id");
								subProgramId = rstUser.getInt("SubProgram_Id");
								if(!Parent_Access.equalsIgnoreCase("0"))
								{
								Task_ID  = rstUser.getInt("T.task_id");
								}
								qryUserPgrm = "SELECT Program_Name FROM program_names_master WHERE mst_programid = "+programID+" AND mst_subprogramid = "+subProgramId+" ";
								ResultSet rstUserPrgm = smtUser.executeQuery(qryUserPgrm);
								if(rstUserPrgm.next())
								{
									userProgramName = rstUserPrgm.getString("Program_Name");
								}
								else
								{
									userProgramName = "NA";
								}
							%>
						    	<tr>
						    		<td align="center"><!-- 1 -->
						    			<%=rstUser.getString("Emp_ID")%>
						    		</td>
						    		
						    		<td align="left"><!-- 2 -->
						    			<%=rstUser.getString("Emp_Name")%>
						    		</td>
						    		
						    		<td><!-- 3 -->
						    			<%=userProgramName %>
						    		</td>						    		
						    		
						    		<td align="center"><!-- 4 -->
						    		<%
						    			String userType = rstUser.getString("User_Type_Id");
						    			String qryusrtype_name = "SELECT  User_Type_Description FROM user_type_master WHERE Is_Active = 1 AND User_Type_ID ="+userType;
						    			Statement smtUserType_NAME = connection.createStatement();
						    			ResultSet rstUserType_Name= smtUserType_NAME.executeQuery(qryusrtype_name);
										if(rstUserType_Name.next())
										{
						    			%>
						    				<%=rstUserType_Name.getString("User_Type_Description")%>
						    			<%
										}
										rstUserType_Name.close();
						    			%>							    			
						    		</td>
						    		
						    		<td align="center"><!-- 5 -->
						    			
						    			<%
						    			String locId = rstUser.getString("Location");
						    			Statement smtLoc = connection.createStatement();
					              		String qryLoc = "SELECT centre_id,centre_name FROM centre_master WHERE is_alive=1 and centre_id ="+locId;
										ResultSet rstLoc = smtLoc.executeQuery(qryLoc);
										if(rstLoc.next())
										{
						    			%>
						    				<%=rstLoc.getString("centre_name")%>
						    			<%
										}
										rstLoc.close();
						    			%>
						    			
						    		</td>
						    		<td><!-- 6  -->
									<!-- start of the code -->
									
									<%
										String UTTMappingId = null;
										String TaskDescription = null;
										int TaskId = 0;
										int i = 1;
										String QuerychkBox = "";
										//QuerychkBox = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"+ USER_AUTOID+ "' and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 1 order by tm.Task_Id";
										if(Parent_Access.equalsIgnoreCase("0"))
										{
											QuerychkBox = "SELECT Task_Id,Task_Description,sel.UTT_Mapping_Id FROM (SELECT tm.Task_Id,Task_Description,uttm.UTT_Mapping_Id FROM task_master tm,user_type_task_mapping uttm,user_utt_mapping uum WHERE uttm.task_id = tm.task_id  AND  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id AND uum.user_id = '"+USER_AUTOID+"' AND tm.Is_Active = 1 AND tm.Pareent_Task_Id = 0 ) logedin JOIN (SELECT UTT_Mapping_Id FROM user_utt_mapping WHERE User_id = '"+EmpUserAutoId+"') sel ON logedin.UTT_Mapping_Id = sel.UTT_Mapping_Id ORDER BY task_id";
										}
										else
										{
											QuerychkBox = "SELECT Task_Id,Task_Description,sel.UTT_Mapping_Id FROM (SELECT tm.Task_Id,Task_Description,uttm.UTT_Mapping_Id FROM task_master tm,user_type_task_mapping uttm,user_utt_mapping uum WHERE uttm.task_id = tm.task_id  AND  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id AND uum.user_id = '"+USER_AUTOID+"' AND tm.Is_Active = 1 AND tm.Task_Id = '"+Task_ID+"') logedin JOIN (SELECT UTT_Mapping_Id FROM user_utt_mapping WHERE User_id = '"+EmpUserAutoId+"') sel ON logedin.UTT_Mapping_Id = sel.UTT_Mapping_Id ORDER BY task_id";
										}
										System.out.println("Check Box Selection Edit Query Recruiter:: "+ QuerychkBox);
										Statement stmtChkBox = connection.createStatement();
										ResultSet ChkBoxRec = stmtChkBox.executeQuery(QuerychkBox);
										while (ChkBoxRec.next()) 
											{
												TaskId = ChkBoxRec.getInt("Task_Id");
												//System.out.println("TaskId Edit part:: " + TaskId);
												UTTMappingId = ChkBoxRec.getString("sel.UTT_Mapping_Id");
												//System.out.println("UTTMappingId Edit part:: "+ UTTMappingId);
												TaskDescription = ChkBoxRec.getString("Task_Description");
												//System.out.println("TaskDescription Edit part::::::::"+ TaskDescription);
												%>
												<b><%=i%>. <%=TaskDescription%></b><br />
												<div style="padding-left: 20px;">
														<%
		 									 	  			String UTTMappingIdChd = null;
		 									 	  			String TaskDescriptionChd = null;
		 									 	  			int TaskIdChd = 0;
		 									 	  			int i1 = 1;
		 									 	  			String QuerychkBoxChd = "";
		 									 	  			//QuerychkBoxChd = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"+ USER_AUTOID+ "' and tm.Is_Active = 1  and tm.Pareent_Task_Id = '"+ TaskId+ "' and  uttm.user_type_id = 1 order by tm.Task_Id";
		 									 	  			QuerychkBoxChd = "SELECT Task_Id,Task_Description,sel.UTT_Mapping_Id FROM (SELECT tm.Task_Id,Task_Description,uttm.UTT_Mapping_Id FROM task_master tm,user_type_task_mapping uttm,user_utt_mapping uum WHERE uttm.task_id = tm.task_id  AND  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id AND uum.user_id = '"+USER_AUTOID+"' AND tm.Is_Active = 1 AND tm.Pareent_Task_Id =  '"+ TaskId+ "' ) logedin JOIN (SELECT UTT_Mapping_Id FROM user_utt_mapping WHERE User_id = '"+EmpUserAutoId+"') sel ON logedin.UTT_Mapping_Id = sel.UTT_Mapping_Id ORDER BY task_id";
		 									 	  			//System.out.println("Check Box Chd Selection Edit Query Recruiter:: "+ QuerychkBoxChd);
		 									 	  			Statement stmtChkBoxchd = connection.createStatement();
		 									 	  			ResultSet ChkBoxRecchd = stmtChkBoxchd.executeQuery(QuerychkBoxChd);
		 									 	  			while (ChkBoxRecchd.next())
		 									 	  			 {
		 									 	  				//System.out.println("checkedStateRec:: "+ checkedStateRec);
		 									 	  				TaskIdChd = ChkBoxRecchd.getInt("Task_Id");
		 									 	  				//System.out.println("TaskIdChd  Edit part:: "+ TaskIdChd);
		 									 	  				TaskDescriptionChd = ChkBoxRecchd.getString("Task_Description");
		 									 	  				UTTMappingIdChd = ChkBoxRecchd.getString("sel.UTT_Mapping_Id");
		 									 	  				//System.out.println("UTTMappingIdChd Edit part:: "+ UTTMappingIdChd);
		 									 	  				//System.out.println("Available for chd");
		 									 	  					%>
																		<%=i1%>. <%=TaskDescriptionChd%><br />
																<%
																i1++;
															 }
															%>
													</div>
											   <%
											 	i++;
											 }
									 System.out.println("i value  Edit part:: " + i+"Username:::"+rstUser.getString("Emp_Name"));
							 		 if(i == 1)
							 		 {
							 		 %>
							 		 	No access granted
							 		 <%
							 		 }
									 %>
									<input type="hidden" name="CountValue" id="CountValue" value="<%=i%>">
									<!-- end of the code -->
									</td>
						    		
						    		<td><!-- 7 -->
									<!-- -***************Operations Initial display****** --> 
									<%
										if(UserTypeId.equalsIgnoreCase("3"))
										{ 
											String OpsProgramName=null;
											int kOps =1;
											String QueryOPSDISP  = "";
											if(Program_Access.equalsIgnoreCase("0"))
											{
												QueryOPSDISP = "SELECT Program_Name FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+ USER_AUTOID+ "') logedin JOIN  (SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ EmpUserAutoId+ "') sel ON logedin.program_id = sel.program_id ORDER BY Program_Name";
											}
											else
											{
												QueryOPSDISP = "SELECT Program_Name FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+ USER_AUTOID+ "' and upm.Program_id = '"+Program_Access+"') logedin JOIN  (SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ EmpUserAutoId+ "') sel ON logedin.program_id = sel.program_id ORDER BY Program_Name";
											}
											System.out.println("Selection Query:: "+QueryOPSDISP);
											Statement stmtOpsISP=connection.createStatement();
											ResultSet OpsDISP=stmtOpsISP.executeQuery(QueryOPSDISP);
											while(OpsDISP.next())
											{
											OpsProgramName=OpsDISP.getString("Program_Name");
											%> 
											<div>
												<span style="font-weight: bold;"><%=kOps %>. <%=OpsProgramName %> </span>
											</div>
											<%
											kOps++;
											}
											if(kOps == 1)
											{
											  %>
											 	No Programs mapped
											  <%
											} 
											 %> 										
							        	<%}else{ %>
							        		NA
							        	<%} %>
							        <!-- -***************Operations Initial display****** --> 
						    		</td>
						    	</tr>
						    <%
							}
							}
							catch(Exception ex)
							{
								ex.printStackTrace();
							}
						    %> 	
						    	
						    </table>
			            </td>
		            </tr>
	            </table>
	            <br/>
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	         <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px; font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
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
 <script type="text/javascript">
 function callDailyReg()
 {
	 
	 var lochidVal = document.getElementById("locationHdd").value;
	 var parenthidVal = document.getElementById("parentAccessHdd").value;
	 var childhidVal = document.getElementById("childAccessHdd").value;
	 var programhidVal = document.getElementById("programAccessHdd").value;
	 if(lochidVal == '0')
	 {
		 dailyFrmName.location.value = 0;
	 }
	 else
	 {
		 dailyFrmName.location.value = lochidVal;	
	 }
	 if(parenthidVal == '0')
	 {
		  dailyFrmName.parentAccess.value = 0;
		  dailyFrmName.childAccess.value = 0;
	 }
	 else
	 {
		 dailyFrmName.parentAccess.value = parenthidVal;
		 getChildAccess(parenthidVal,childhidVal);
	 }
	if(childhidVal != '0')
	 {
		dailyFrmName.childAccess.value = childhidVal;
	 }
	 	
	 if(programhidVal == '0')
	 {
		 dailyFrmName.programAccess.value = 0;
	 }
	 else
	 {
		 dailyFrmName.programAccess.value = programhidVal;
	 }	
 }
 </script> 	
  </body>
</html>
