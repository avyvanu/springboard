<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp"%>

<%
 	Connection connection = null;
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
     if(USER_Name == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
    System.out.println("USER_Name in source target page::::"+USER_Name);
  	String  User_Center_Id = (String)session.getAttribute("User_Center_Id");
	 if(User_Center_Id == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	System.out.println("User_Center_Id in source target page::::"+User_Center_Id);
	connection=ConnectDatabase.getConnection();
	CallableStatement cs=connection.prepareCall("call GetRecruiterSTMList(?)");
	cs.setString(1,User_Center_Id);	
	ResultSet rs=cs.executeQuery();
	
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
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
		someWindow =  window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menuba r=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
	
<!-- Number Validation for Input field -->
<script type="text/javascript">
		function isNumberKey(evt) 
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if (charCode > 31 && (charCode < 48 || charCode > 57)) {
				alert("Only Numeric allowed here");
				return false;
			}
			return true;
		}
</script>
<!-- End of Number Validation -->
<script type="text/javascript" language="javascript">
		var ASCount = 0;	
		function logout()
		{
			location.href = "<%=logoutPage%>";
		}
		function ChangeColor(tableRow, canId, canName, RowId)
	    {
	    	var iVal = document.getElementById("iValHid").value;
	    	var sCount = 0;
	    	var trRow;
	    	var i=1;
	    	for (i=1; i<iVal;i++)
	    	{
	    		trRow = document.getElementById(i);
	    		trRow.style.backgroundColor = '#F2F2F2';
	    	}
		    tableRow.style.backgroundColor = '#C7C3DD';
		    document.getElementById("recName").value=canName;
		    document.getElementById("recId").value=canId;
		    sCount = parseInt(document.getElementById(RowId+"SCount").value);
		    if(sCount > 0)
		    {
				for(i=ASCount;i>0;i--)
		        {
		   			RemoveThisSource(i);
			    }
			    
			    document.getElementById("recId").value = canId;			    
			    for(var j=1;j<=sCount;j++)
			    {			    	
			    	document.getElementById("source"+j).value = document.getElementById(RowId+"AS"+j).value;
			    	document.getElementById("PS"+j+"Id").value = document.getElementById(RowId+"PS"+j).value;
			    	document.getElementById("SS"+j+"Id").value = document.getElementById(RowId+"SS"+j).value;
			    	document.getElementById('div'+j).style.display = '';
			    }
			    
			    document.getElementById("target").value = document.getElementById(RowId+"DayTarget").value;
			   	document.getElementById("SCount").value = sCount;
			    ASCount = sCount;

			  	document.getElementById('btnRemove').style.display = '';
		    }
	  	}
	  	
  		function SetSource()
	  	{

	  		var recId = document.getElementById('recId').value;
	  		var recName = document.getElementById('recName').value;
	  		var targetVal=document.getElementById("target").value;
	  		var PrimarySource = document.getElementById("SCount").value;
	  		
	  		if (recId=="" || recName=="")
	  		{
	  			alert("Please select a recruiter.");
	  			return false;
	  		}
	  		if(PrimarySource=="0")
	  		{
	  			alert("Please assign at least one source for " + recName + ".");
	  			return false;
	  		}
	  		if(targetVal=="")
	  		{
	  			alert("Please enter the target for " + recName + ".");
	  			return false;
	  		}
	  		else if(isNaN(targetVal))
	  		{
	  			alert("Target must be a numeric value.");
	  			return false;
	  		}
	  		if(parseInt(targetVal) > 0)
	  		{}
	  		else
	  		{
	  			alert("Target must be a grater then 0 .");
	  			return false;
	  		}
	  		
  		}

	  	function RemoveSource()
	  	{
	  		var iTemp = ASCount;
			for(i=ASCount;i>0;i--)
	        {
		   		if(document.getElementById('chk'+i).checked)
		   		{
		   			RemoveThisSource(i);
		   		}
		    }
	    	if(ASCount==0)
	    	{
	    		document.getElementById('btnRemove').style.display = 'none';
	    	}
		    if(iTemp == ASCount)
		    {
	   			alert("No assigned source selected to remove.");
		    }
	  	}
	  	
	  	function RemoveThisSource(RSID)
	  	{
			for ( var i=RSID+1;i<=ASCount;i++)
			{
	  			document.getElementById('source'+(i-1)).value = document.getElementById('source'+i).value;
	  			document.getElementById('chk'+(i-1)).checked = document.getElementById('chk'+i).checked;
	  			document.getElementById('PS'+(i-1)+'Id').value = document.getElementById('PS'+i+'Id').value;
	  			document.getElementById('SS'+(i-1)+'Id').value = document.getElementById('SS'+i+'Id').value;
			}

  			document.getElementById('source'+ASCount).value = '';
  			document.getElementById('chk'+ASCount).checked = false;
  			document.getElementById('PS'+ASCount+'Id').value = '';
  			document.getElementById('SS'+ASCount+'Id').value = '';
			document.getElementById('div'+ASCount).style.display="none";	
			ASCount = ASCount - 1;
        	document.getElementById("SCount").value = ASCount;
	  	}
	  	
	  	function AssignSource()
	  	{
	  		var recId = document.getElementById('recId').value;
	  		var recName = document.getElementById('recName').value;
	  		if (recId=="" || recName=="")
	  		{
	  			alert("Please select a recruiter.");
	  		}
	  		else if(document.BioForm.PrimarySource.selectedIndex == 0)
	  		{
	  			alert("Please select primary source.");
	  		}
	  		else
	  		{
	  			if(ASCount==5)
	  			{
	  				alert("Max of 5 sources already assigned.");
	  			}
	  			else
	  			{
					var psrcval = document.BioForm.PrimarySource[document.BioForm.PrimarySource.selectedIndex].value;			
					var psrctxt = document.BioForm.PrimarySource[document.BioForm.PrimarySource.selectedIndex].text;
	
					var ssrcval = 0;			
					var ssrctxt = "";
					var HassSS = false;
					
					if(psrcval=='3')
					{
						HassSS = true;
						ssrcval = document.BioForm.jobPortalD[document.BioForm.jobPortalD.selectedIndex].value;			
						ssrctxt = document.BioForm.jobPortalD[document.BioForm.jobPortalD.selectedIndex].text;
					}
					else if(psrcval=='4')
					{
						HassSS = true;
						ssrcval = document.BioForm.Consultant[document.BioForm.Consultant.selectedIndex].value;			
						ssrctxt = document.BioForm.Consultant[document.BioForm.Consultant.selectedIndex].text;
					}
					else if(psrcval=='5')
					{ 
						HassSS = true;
						ssrcval = document.BioForm.Advertisment[document.BioForm.Advertisment.selectedIndex].value;			
						ssrctxt = document.BioForm.Advertisment[document.BioForm.Advertisment.selectedIndex].text;
					}
					else if(psrcval=='8')
					{ 
						HassSS = true;
						ssrcval = document.BioForm.jobFairD[document.BioForm.jobFairD.selectedIndex].value;			
						ssrctxt = document.BioForm.jobFairD[document.BioForm.jobFairD.selectedIndex].text;
					}
					else if(psrcval=='9')
					{ 
						HassSS = true;
						ssrcval = document.BioForm.emailMailers[document.BioForm.emailMailers.selectedIndex].value;			
						ssrctxt = document.BioForm.emailMailers[document.BioForm.emailMailers.selectedIndex].text;
					}
					else if(psrcval=='11')
					{ 
						HassSS = true;
						ssrcval = document.BioForm.sms[document.BioForm.sms.selectedIndex].value;			
						ssrctxt = document.BioForm.sms[document.BioForm.sms.selectedIndex].text;
					}
					else if(psrcval=='14')
					{
						HassSS = true;
						ssrcval = document.BioForm.campusD[document.BioForm.campusD.selectedIndex].value;			
						ssrctxt = document.BioForm.campusD[document.BioForm.campusD.selectedIndex].text;
					}
					else if(psrcval=='15')
					{
						HassSS = true;
						ssrcval = document.BioForm.traingInsituteD[document.BioForm.traingInsituteD.selectedIndex].value;			
						ssrctxt = document.BioForm.traingInsituteD[document.BioForm.traingInsituteD.selectedIndex].text;
					}
					else if(psrcval=='18')
					{
						HassSS = true;
						ssrcval = document.BioForm.VendorD[document.BioForm.VendorD.selectedIndex].value;			
						ssrctxt = document.BioForm.VendorD[document.BioForm.VendorD.selectedIndex].text;
					}
	
	  				var flag=true;
					for(i=1;i<=ASCount;i++)
			        {
			        	if(HassSS)
			        	{
				        	if(document.getElementById('PS'+i+'Id').value==psrcval)
					   		{
					   			if(ssrcval=='0')
						  		{
						        	if(document.getElementById('SS'+i+'Id').value=='0')
							   		{
							   			alert("Source already assigned. Assigned source "+i+".");
							   			flag=false;
							   			break;
							   		}
						        	else
							   		{
							   			alert("Secondary source already assigned. Assigned source "+i+". Remove this to assign primary source.");
							   			flag=false;
							   			break;
							   		}
						  		}
						  		else 
						  		{
						        	if(document.getElementById('SS'+i+'Id').value=='0')
							   		{
							   			alert("Primary source already assigned. Assigned source "+i+".");
							   			flag=false;
							   			break;
							   		}
						        	else if(document.getElementById('SS'+i+'Id').value==ssrcval)
							   		{
							   			alert("Secondary source already assigned. Assigned source "+i+".");
							   			flag=false;
							   			break;
							   		}
						  		}
					   		}
			        	}
				   		else if(document.getElementById('PS'+i+'Id').value==psrcval)
				   		{
				   			alert("Source already assigned. Assigned source "+i+".");
				   			flag=false;
				   			break;
				   		}
				    }
				    if(flag)
				    {
				    	if(ASCount==0)
				    	{
				    		document.getElementById('btnRemove').style.display = '';
				    	}
			        	ASCount = ASCount + 1;
			        	document.getElementById("SCount").value = ASCount;
			        	if(!HassSS)
			        	{
				  			document.getElementById('source'+ASCount).value = psrctxt;
				  		}
				  		else if(ssrcval=='0')
				  		{
				  			document.getElementById('source'+ASCount).value = psrctxt;
				  		}
				  		else 
				  		{
				  			document.getElementById('source'+ASCount).value = ssrctxt;
				  		}
			  			document.getElementById('chk'+ASCount).checked = false;
			  			document.getElementById('PS'+ASCount+'Id').value = psrcval;
			  			document.getElementById('SS'+ASCount+'Id').value = ssrcval;
			        	document.getElementById('div'+ASCount).style.display = 'block';
				    }
	  			}
		  	}
	  	}
	  	
	  	function display_id(obj) 
		{
			txt = obj.options[obj.selectedIndex].value;
					
		  	document.getElementById('PrimarySourceOptions').style.display = 'none';	
		  	document.getElementById('jobPortal').style.display = 'none';  	
		  	document.getElementById('Consultant').style.display = 'none';  	
		  	document.getElementById('Advertisment').style.display = 'none';		  	
		  	document.getElementById('jobFair').style.display = 'none';  
		    document.getElementById('emailMailers').style.display = 'none';
		    document.getElementById('sms').style.display = 'none';			
			document.getElementById('campus').style.display = 'none';
			document.getElementById('traingInsitute').style.display = 'none';
			document.getElementById('Vendor').style.display = 'none';

			if(txt!='0')
			{
				document.getElementById('PrimarySourceOptions').style.display = '';
				if(txt=='3'){ document.getElementById('jobPortal').style.display = ''};
				if(txt=='4'){ document.getElementById('Consultant').style.display = ''};
				if(txt=='5'){ document.getElementById('Advertisment').style.display = ''};
				if(txt=='8'){ document.getElementById('jobFair').style.display = ''};
				if(txt=='9'){ document.getElementById('emailMailers').style.display = ''};
				if(txt=='11'){ document.getElementById('sms').style.display = ''};
				if(txt=='14'){document.getElementById('campus').style.display = ''};
				if(txt=='15'){document.getElementById('traingInsitute').style.display = ''};
				if(txt=='18'){document.getElementById('Vendor').style.display = ''};
			}
		}
	</script>
  </head>
  <body>
  <form name="BioForm" action="<%=recruitPath%>jsp/SourceTargetSubmit.jsp" method="post">
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
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">
	            <a href="<%=recruitPath%>jsp/Home_Page.jsp">Home > </a>
	            </font>
	            <font class="nonLink">Source Target Mapping</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	            <table width="950px" style="padding-top:10px;">
		            <tr>
			            <td style="width:600px; vertical-align: top;">
				              <table width="100%" rules="all" style="border:1px solid black;background-color:#F2F2F2;margin:0;">
							<tr style="font-size: 12px;">
								<td style="border-bottom:1px solid black;margin:0; width:100px;" align="center"><b>Recruiter ID</b></td>
								<td style="border-left:1px solid black;border-bottom:1px solid black;margin:0; width:150px;" align="center"><b>Name</b></td>
								<td style="border-left:1px solid black;border-bottom:1px solid black;margin:0; width:150px;" align="center"><b>Source</b></td>
								<td style="border-left:1px solid black;border-bottom:1px solid black;margin:0; width:100px;" align="center"><b>Target</b></td>
							</tr>
							
							<%
								int i = 1;
								while(rs.next())
								{
									String recruiterId = rs.getString("Recruiter_Id").trim();
									String recruitName = rs.getString("Recruiter_Name").trim();
									
									String DayTarget = rs.getString("DayTarget");
									if(DayTarget==null)
									{
										DayTarget = "";
									}
									// , , , 
									// , , , , , , , , , SMCount, 
									// , DayTimeStamp									
									
									String UserId = rs.getString("UserId");									
									String RecruiterId = rs.getString("RecruiterId");
							%>
										<tr id="<%=i%>" onclick="javascript:ChangeColor(this,'<%=recruiterId%>','<%=recruitName%>','<%=i%>');">
											<td style="border-left:1px solid black;margin:0; font-size: 12px;">
												<%=recruiterId%>												
												<input type="hidden" id="RecruiterId" name="RecruiterId" value="<%=RecruiterId%>"/>
											</td>
											<td style="border-left:1px solid black;margin:0; font-size: 12px;">												
												<%=recruitName %>
											</td>
											<td style="border-left:1px solid black;margin:0; font-size: 12px;">
											<%
												String sourceTextData = "";										
												int SCount = rs.getInt("SMCount");
												for(int j=1;j<=SCount;j++)
												{
													if(j==1)
													{
														sourceTextData = rs.getString("AS_1");
													}
													else
													{
														sourceTextData = sourceTextData+", "+rs.getString("AS_"+j);
													}
											%>
												<input type="hidden" id="<%=i%>PS<%=j%>" name="<%=i%>PS<%=j%>" value="<%=rs.getString("PS_"+j)%>"/>
												<input type="hidden" id="<%=i%>SS<%=j%>" name="<%=i%>SS<%=j%>" value="<%=rs.getString("SS_"+j)%>"/>
												<input type="hidden" id="<%=i%>AS<%=j%>" name="<%=i%>AS<%=j%>" value="<%=rs.getString("AS_"+j)%>"/>
											<%
												}
											%>
												<%=sourceTextData %>
											</td>
											<td style="border-left:1px solid black;margin:0; font-size: 12px;">
												<%=DayTarget%>
												<input type="hidden" id="<%=i%>DayTarget" name="<%=i%>DayTarget" value="<%=DayTarget%>"/>
												<input type="hidden" id="<%=i%>SCount" name="<%=i%>SCount" value="<%=SCount%>"/>
											</td>
											
										</tr>
									<%
									i = i + 1;									
								}								
							%>
							
						</table>
							<input type="hidden" id="iValHid" name="iValHid" value="<%=i%>" />
							<input type="hidden" id="currIValHid" name="currIValHid" value="0" />            				  
			            </td>
			            <td style="vertical-align: top;">
				            <table border="0" cellpadding="6" cellspacing="6">
				            	<tr>
						            <td align="left" style=" padding-left:3px;background-color: #d8d8d8; width: 200px;" width="200px" class="allBackColor">
						                Recruiter Name
						            </td>
						            
						            <td align="left" style=" width:300px; padding-left:3px;">
						                <input type="text" id="recName" name="recName" style="width: 175px;" readonly="readonly" value=""/>
						                <input type="hidden" id="recId" name="recId" value=""/>
						                <input type="hidden" id="SCount" name="SCount" value="0"/>
						            </td>
						        </tr>
						        <tr>
						            <td align="left" style="padding-left:3px;background-color: #d8d8d8;width: 200px;" class="allBackColor">
						                Primary Source
						            </td>
						            <td align="left" style=" width:300px; padding-left:3px;">
						                <%
												        Statement stmt_source=null;
													    ResultSet rs_source=null;
													  	String queryForSource="SELECT * FROM source_from order by Order_No";
														
														stmt_source=connection.createStatement();
														rs_source=stmt_source.executeQuery(queryForSource);
										%>
												     <select name="PrimarySource" id="PrimarySource" onkeyup="display_id(this)" onchange="display_id(this)" class="reSizeforOther">								
														
														<option value="0">---Select---</option>
										<%
														while(rs_source.next())
														{
														 %>
														<option value="<%=rs_source.getString(1) %>"><%=rs_source.getString(2)%></option>
														<%
														}
										%>
									</select>
					            </td>
					        </tr>
						        <tr id="PrimarySourceOptions" style="display: none">
						            <td align="left" colspan="2">
						                <div id="jobPortal" style="display: none">
							               <table border="0">
											  <tr>
											  <td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
												Job Portal
												</td>
												<td>
												 
									<select name="jobPortalD" id="jobPortalD" class="reSizeforOther">
											   	<option value="0">---Select---</option>		
											 	<%
											 	    String PortalDate=null;
											 	    SimpleDateFormat formatter = new SimpleDateFormat(" MMM yyyy ");
											 	    String dateStr=null;
											 	    String jobPortalDH=null;
											 	    try
											 	    {
													String queryForSkillSet="SELECT Job_Portal_Id,Job_Portal_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(Job_Portal_Date,'%b %Y'),' ]'),'') AS Job_Portal_Date FROM job_portal_master";
													Statement stcurrentskill=connection.createStatement();
													ResultSet rscurrentskill=stcurrentskill.executeQuery(queryForSkillSet);
													while(rscurrentskill.next())
											    	{	
											    		try
											    		{	
											    			String valueData=rscurrentskill.getString("Job_Portal_Id");							    	
											    			String textData=rscurrentskill.getString("Job_Portal_Name"); 
												    		dateStr = rscurrentskill.getString("Job_Portal_Date");
															jobPortalDH =textData+""+dateStr;
			
				    										%>
											  <option value="<%=valueData%>"><%=textData%><%=dateStr%></option>
														    	<% 
															 }
																	 catch(Exception dpz)
																	 {
																	 	dpz.printStackTrace();
																	 }
																}
																rscurrentskill.close();
																stcurrentskill.close();
																}
																catch(SQLException ex)
																{
																	System.out.println("message---:  "+ex.getCause());
																	System.out.println("message---:  "+ex.getMessage());
																	ex.printStackTrace();
																	connection.close();
																}
														%>				 		
											 </select>
				                            </td>
										</tr>
									</table>
								</div>
											
						                <div id="Consultant" style="display: none">
											<table border="0">
											  <tr>
											  
											  <td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
												 Consultant
												</td>
												<td>
												 <select name="Consultant" id="Consultant" class="reSizeforOther">								
													<option value="0">---Select---</option>
													<%
														String valueConsult=null;
												        String secQueryconsultant= "SELECT * FROM consultant_master";			        
													  	Statement stmtconsultant = connection.createStatement();
														ResultSet rsconsultant = stmtconsultant.executeQuery(secQueryconsultant);
														while(rsconsultant.next())
														{	
														valueConsult=rsconsultant.getString("Consultant_Name");			        
														%>					
															<option value="<%=rsconsultant.getString("Consultant_Value")%>"><%=rsconsultant.getString("Consultant_Name") %></option>
														<%
														}
														rsconsultant.close();
														stmtconsultant.close();
													%>
								                </select>
												</td>
											</tr>
										</table>
									</div>
						            
						                <div id="Advertisment" style="display: none">
											<table border="0">
											  <tr>
											  
											  <td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
												 Advertisment
												</td>
												<td>
												 
											<select id="Advertisment" name="Advertisment" class="reSizeforOther">
													<option value="0">---Select---</option>
														<%
															String AdvtH=null;
													        String secQueryadvertisment= "SELECT Advertisment_Id,Advertisment_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(Advertisment_Date,'%b %Y'),' ]'),'') AS Advertisment_Date FROM advertisment_master";			        
														  	Statement stmtadvertisment = connection.createStatement();
															ResultSet rsadvertisment = stmtadvertisment.executeQuery(secQueryadvertisment);
															while(rsadvertisment.next())
															{	
														    		try
														    		{	
														    			String valueData=rsadvertisment.getString("Advertisment_Id");							    	
														    			String textData=rsadvertisment.getString("Advertisment_Name"); 
															    		dateStr = rsadvertisment.getString("Advertisment_Date");
																		AdvtH= textData+""+dateStr;
							    										%>
											     <option value="<%=valueData%>"><%=textData%><%=dateStr%></option>
										    	<% 
											 }
											 catch(Exception dpz)
											 {
											 	dpz.printStackTrace();
											 }
									}
									rsadvertisment.close();
									stmtadvertisment.close();
								%>
									 </select>		
									 </td>
									</tr>
								</table>
							</div>
						            
			                <div id="jobFair" style="display: none">
								<table border="0">
								  <tr>
								    <td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
												Job Fairs
									</td>
												<td>
												 
									<select name="jobFairD" id="jobFairD" class="reSizeforOther">
										 <option value="0">---Select---</option>								 		
										 <%
										 	String jobFairDHd=null;
									        String secQueryjobFair= "SELECT jobfair_Id,jobfair_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(jobfair_Date,'%b %Y'),' ]'),'') AS jobfair_Date  FROM jobfair_master";			        
										  	Statement stmtjobFair = connection.createStatement();
											ResultSet rsjobFair = stmtjobFair.executeQuery(secQueryjobFair);
											while(rsjobFair.next())
											{	
												try
												{
									    			String valueData=rsjobFair.getString("jobfair_Id");							    	
									    			String textData=rsjobFair.getString("jobfair_Name"); 
										    		dateStr = rsjobFair.getString("jobfair_Date");
													jobFairDHd =textData+""+dateStr;
		    										%>
											<option value="<%=valueData%>"><%=textData%><%=dateStr%></option>
									    	<% 
										}
										catch(Exception e)
										{
											e.printStackTrace();
										}
									}
									rsjobFair.close();
									stmtjobFair.close();
								  %>
								          </select>
                                         </td>
									</tr>
								</table>
							</div>						           
						      <div id="emailMailers" style="display: none">
								<table border="0">
									<tr>
										<td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
												 Email
												</td>
												<td>
												 
								<select name="emailMailers" id="emailMailers" class="reSizeforOther">
									 	<option value="0">---Select---</option>		
										<%
									 	String emailMailersDS=null;
								        String secQueryEmail= "SELECT Email_Id,Email_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(Email_Date,'%b %Y'),' ]'),'') AS Email_Date  FROM email_master";			        
									  	Statement stmtEmail = connection.createStatement();
										ResultSet rsEmail = stmtEmail.executeQuery(secQueryEmail);
										while(rsEmail.next())
										{
											try
											{
								    			String valueData=rsEmail.getString("Email_Id");							    	
								    			String textData=rsEmail.getString("Email_Name"); 
									    		dateStr = rsEmail.getString("Email_Date");
												emailMailersDS=textData+""+dateStr;
	    										%>
										     		<option value="<%=valueData%>"><%=textData%><%=dateStr%></option>
										    	<% 
											}
											catch(Exception e)
											{
												e.printStackTrace();
											}
										}
										rsEmail.close();
										stmtEmail.close();
									%>		
								  </select>
								 </td>
								</tr>
							</table>
						</div>
						           
						<div id="sms" style="display: none">
							<table border="0">
								<tr>
									<td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
										 SMS
										</td>
											<td>
												 
							               <select name="sms" id="sms" class="reSizeforOther">
											 	<option value="0">---Select---</option>		
											 	<%
											 	String smsDS=null;
										        String secQuerySMS= "SELECT SMS_Id,SMS_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(SMS_Date,'%b %Y'),' ]'),'') AS SMS_Date FROM SMS_Master";			        
											  	Statement stmtSMS = connection.createStatement();
												ResultSet rsSMS = stmtSMS.executeQuery(secQuerySMS);
												while(rsSMS.next())
												{	
													try
													{
										    			String valueData=rsSMS.getString("SMS_Id");							    	
										    			String textData=rsSMS.getString("SMS_Name"); 
											    		dateStr = rsSMS.getString("SMS_Date");
														smsDS=textData+""+dateStr;
			    										%>
												<option value="<%=valueData%>"><%=textData%><%=dateStr%></option>
												    	<% 
													}
													catch(Exception e)
													{
														e.printStackTrace();
													}
												}
												rsSMS.close();
												stmtSMS.close();
								                       %>	
								            </select>
										  </td>
										</tr>
									</table>
								</div>
						            
		                <div id="campus" style="display: none">
							<table border="0">
							  <tr>
							    <td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
								 Campus
								</td>
								<td>
								   <select name="campusD" id="campusD" class="reSizeforOther">
									 	<option value="0">---Select---</option>		
									 <%
									 	String campusDSa=null;
								        String secQueryCampus= "SELECT campus_Id,campus_Name, IFNULL(CONCAT(' [ ',DATE_FORMAT(campus_Date,'%b %Y'),' ]'),'') AS campus_Date FROM campus_master";			        
									  	Statement stmtCampus = connection.createStatement();
										ResultSet rsCampus = stmtCampus.executeQuery(secQueryCampus);
										while(rsCampus.next())
										{
											try
											{
								    			String valueData=rsCampus.getString("campus_Id");							    	
								    			String textData=rsCampus.getString("campus_Name"); 
									    		dateStr = rsCampus.getString("campus_Date");
												campusDSa = textData+""+dateStr;
	    										%>
										     		<option value="<%=valueData%>"><%=textData%><%=dateStr%></option>
										    	<% 
													}
													catch(Exception e)
													{
														e.printStackTrace();
													}
												}
												rsCampus.close();
												stmtCampus.close();
											 %>								 				 		
									  </select>
								  </td>
							  </tr>
						   </table>
						</div>
						           
                <div id="traingInsitute" style="display: none">
						<table border="0">
							  <tr>
								  <td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
									 Training Institute
								  </td>
								<td>
							     <select name="traingInsituteD" id="traingInsituteD" class="reSizeforOther">
								  	<option value="0">---Select---</option>	
								 	<%
								 	String traingInsituteDDSD=null;
							        String secQueryTINAME= "SELECT T_I_Name_Id,T_I_Name_Name, IFNULL(CONCAT(' [ ',DATE_FORMAT(T_I_Name_Date,'%b %Y'),' ]'),'') AS T_I_Name_Date  FROM training_institute_master";			        
								  	Statement stmtTINAME = connection.createStatement();
									ResultSet rsTINAME = stmtTINAME.executeQuery(secQueryTINAME);
									while(rsTINAME.next())
									{
										try
										{
							    			String valueData=rsTINAME.getString("T_I_Name_Id");							    	
							    			String textData=rsTINAME.getString("T_I_Name_Name"); 
								    		dateStr = rsTINAME.getString("T_I_Name_Date");
											traingInsituteDDSD=textData+""+dateStr;
                                            %>
									     		<option value="<%=valueData%>"><%=textData%><%=dateStr%></option>
									    	<% 
												}
												catch(Exception e)
												{
													e.printStackTrace();
												}
											}
									rsTINAME.close();
									stmtTINAME.close();
								 %>		
								  </select>
								</td>
							 </tr>
						</table>
					</div>
					
					
					
					
                <div id="Vendor" style="display: none">
						<table border="0">
							  <tr>
								  <td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
									 Vendor City List
								  </td>
								<td>
							     <select name="VendorD" id="VendorD" class="reSizeforOther">
								  	<option value="0">---Select---</option>	
								 	<%
								 	String secQueryVendor= "SELECT Vendor_city_id, vendor_city_name from vendor_city_master";			        
								  	Statement stmtVendor = connection.createStatement();
									ResultSet rsVendor = stmtVendor.executeQuery(secQueryVendor);
									while(rsVendor.next())
									{
										try
										{
		                                    %>
									     		<option value="<%=rsVendor.getInt("Vendor_city_id")%>"><%=rsVendor.getString("vendor_city_name")%><%=dateStr%></option>
									    	<% 
										}
										catch(Exception e)
										{
											e.printStackTrace();
										}
									 }
									rsTINAME.close();
									stmtTINAME.close();
								 %>		
								  </select>
								</td>
							 </tr>
						</table>
					</div>
					
                  </td>
		        </tr>
	        
	            <tr>
	            	<td colspan="2">
			            <div id="div1" style="display: none">
		            		<table border="0" width="100%">
		            				<tr>
		            					<td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
							                Assigned Source 1
							            </td>
							            
							            <td align="left" style="padding-left:3px;">
							                <input type="text" id="source1" name="source1" readonly="readonly" value=""/>
							            </td>
							            <td align="left" style="padding-left:3px;">
							                <input type="checkbox" id="chk1" />
							                <input type="hidden" id="PS1Id" name="PS1Id" value="" />
							                <input type="hidden" id="SS1Id" name="SS1Id" value="" />
							            </td>
		            				</tr>
		            		</table>
						</div>
		            	<div id="div2" style="display: none">
		            		<table border="0" width="100%">
		            				<tr>
		            					<td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
							                Assigned Source 2
							            </td>
							            
							            <td align="left" style="padding-left:3px;">
							                <input type="text" id="source2" name="source2" readonly="readonly" value=""/>
							            </td>
							            <td align="left" style="padding-left:3px;">
							                <input type="checkbox" id="chk2" />
							                <input type="hidden" id="PS2Id" name="PS2Id" value="" />
							                <input type="hidden" id="SS2Id" name="SS2Id" value="" />
							            </td>
		            				</tr>
		            		</table>
		            	 </div>
		            	 <div id="div3" style="display: none">
		            		<table border="0" width="100%">
		            				<tr>
		            					<td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
							                Assigned Source 3
							            </td>
							            
							            <td align="left" style="padding-left:3px;">
							                <input type="text" id="source3" name="source3" readonly="readonly" value=""/>
							            </td>
							            <td align="left" style="padding-left:3px;">
							                <input type="checkbox" id="chk3" />
							                <input type="hidden" id="PS3Id" name="PS3Id" value="" />
							                <input type="hidden" id="SS3Id" name="SS3Id" value="" />
							            </td>
		            				</tr>
		            		</table>
		            	</div>
		            	<div id="div4" style="display: none">
		            		<table border="0" width="100%">
		            				<tr>
		            					<td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
							                Assigned Source 4
							            </td>
							            
							            <td align="left" style="padding-left:3px;">
							                <input type="text" id="source4" name="source4" readonly="readonly" value=""/>
							            </td>
							            <td align="left" style="padding-left:3px;">
							                <input type="checkbox" id="chk4" />
							                <input type="hidden" id="PS4Id" name="PS4Id" value="" />
							                <input type="hidden" id="SS4Id" name="SS4Id" value="" />
							            </td>
		            				</tr>
		            			</table>
		            	  </div>
		            	  <div id="div5" style="display: none">
		            		    <table border="0" width="100%">
		            				<tr>
		            					<td align="left" style=" padding-left:3px;background-color: #d8d8d8;" width="200px" class="allBackColor">
							                Assigned Source 5
							            </td>
							            
							            <td align="left" style="padding-left:3px;">
							                <input type="text" id="source5" name="source5" readonly="readonly" value=""/>
							            </td>
							            <td align="left" style="padding-left:3px;">
							                <input type="checkbox" id="chk5" />
							                <input type="hidden" id="PS5Id" name="PS5Id" value="" />
							                <input type="hidden" id="SS5Id" name="SS5Id" value="" />
							            </td>
		            				</tr>
		            			</table>
		            		</div>
	            	  </td>
		         </tr>
		         <tr>
	            	<td colspan="2" align="right">
            		    <table border="0" cellpadding="0" cellspacing="0" width="100%">
            				<tr>
            					<td align="center">
				            		<input type="button" id="btnRemove" value="Remove" class="buttonMedium" onclick="javascript:RemoveSource();" style="display: none;" />
				            		
					            </td>
					            <td align="center">
				            		<input type="button" id="btnAdd" value="Add" class="buttonMedium" onclick="javascript:AssignSource();" />
					            </td>
            				</tr>
            			</table>
	            	</td>			            
		        </tr>
			    <tr>
		            <td align="left" style=" padding-left:3px;background-color: #d8d8d8; width: 200px;" class="allBackColor">
		                Todays Target
		            </td>
		            <td align="left" style=" width:300px; padding-left:3px;">
            		    <table border="0" cellpadding="0" cellspacing="0" width="100%">
            				<tr>
            					<td align="left" style="width: 75px;">
					                <input type="text" id="target" name="target" style="width: 60px;" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return isNumberKey(event);" maxlength="3" />
					            </td>
					            <td align="left">
				            		<input type="submit" id="btnSet" value="Set Target" class="buttonMedium" onclick="return SetSource();" />
					            </td>
            				</tr>
            			</table>
		            </td>
		        </tr>
           	</table>
        </td>
    </tr>
  </table>
</td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;">
	        </td>
	    </tr>
	    <tr class="footerBackColor">
	       <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
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
	</form>
	<%
		rs.close();
		connection.close();
	%>
  </body>
  
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
</html>
