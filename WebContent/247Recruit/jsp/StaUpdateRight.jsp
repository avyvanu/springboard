<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
    if(USER_Name == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
    System.out.println("USER_Name in cand status update home page::::"+USER_Name);
  	
   %>

<%


String canId= (String) request.getParameter("candId");
session.setAttribute( "Bpo_Cand_Id", canId );
String query="select * from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'";
	Statement stmts=null;
	ResultSet rs = null;
	CallableStatement cs=null;
	Connection connection=ConnectDatabase.getConnection();	
	try
	{
		connection=ConnectDatabase.getConnection();									
		stmts = connection.createStatement();
		String strProcedure="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
		System.out.println("strProcedure"+strProcedure);
		cs=connection.prepareCall(strProcedure);
		cs.setString(1,canId);
        cs.setString(2,EDKey);
        cs.setString(3,EDKPass);
		rs=cs.executeQuery();
		 




			
%>



<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BioRegLeft.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">

<!-- Start Javascript for Test Fiels Blur Data -->
	<script type="text/javascript">
		function ReFocus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmta"; } } function Focus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "nta"; } } function Blur(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmta"; } else { obj.className = "nta"; } } function ReFocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmtr"; } } function FocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "ntr"; } } function BlurR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmtr"; } else { obj.className = "ntr"; } }
	</script>
	
<style type="text/css">
	.wmta
	{       		 
		color:gray;       		
	}
	.wmtr
	{       		 
		color:black;       		
	}
	.nta
	{
		color: black;
	}	
</style>
	<!-- End Javascript for Test Fiels Blur Data -->

<!-- Char allowing scripts --> 
<script type="text/javascript">
	function AllowChars(evt)
	{
	var charCode = (evt.which) ? evt.which : event.keyCode;
	      // alert(charCode);
	if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) {
				return true;
	}
	else
	{
	alert("Invalid character entered !!");
	return false;
	}
	}      
</script>
<!-- End of script -->


    <script type="text/javascript" language="javascript">
    <%
		if(USER_Name==null)
 			{
	%>
		parent.location.href="<%=logoutPage%>";
	<%
		}
	%>
	 
	 function showWindow()
	{
	var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=canId%>&ColorType=1"
	someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	function showWindowYellow()
	{
	var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=canId%>&ColorType=2"
	someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	
    function ValidatePage(BioForm)
    {
    
    	
    	BioForm.selFor.value = BioForm.selForState.value
    	
    	
    	if ( BioForm.selForState.value == "select" ) 
   		{
   			alert ( "Please select current status." ); 
   			BioForm.selForState.focus();
   			return false; 
   		}
   			var changeReason=document.getElementById("changeReason").value;	
   			if(changeReason=="Change Reason" || changeReason.trim().length == 0)
   			{
   			alert ( "Please enter reason for State change" ); 
   			document.getElementById("changeReason").focus();	
   			return false;
   			}
   		  		
   		
   		if ( BioForm.selForState.value != "select" ) 
   		{
   			var hidStatus=document.getElementById("candidatestatus").value;
   			var curStatus=BioForm.selForState.value;
   			   			
   			if(curStatus >= hidStatus)
   			{
   				alert ( "You cannot update the status." ); 
	   			BioForm.selForState.focus();
	   			return false;
   			}
   			
   		}
    	
  	}

    
  
  </script>
  </head>
  
  <body>
  <form name="BioForm" action="<%=recruitPath%>jsp/StaUpdateSubmit.jsp" method="post" onsubmit="return ValidatePage(this);">
    
    <%
    String higeduc = null;
    int SkillSet=0;
	int Reveexp = 0;
	int ReveexpMts=0;
	int ReveexpYrs = 0;
	int nonReveexp = 0;
	int nonReveexpMts=0;
	int nonReveexpYrs = 0;
	int ApplyingFor=0;
	int CandAutoId=0;
  	if(rs.next())
  	{
  		CandAutoId=rs.getInt("AutoID");
  		int RAG=rs.getInt("RAG");
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		Date dateStr = rs.getDate("System_Date_Time");
  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
    	String DOR = formatter.format(dateStr);
        int IsResumeUpload = rs.getInt("IsResumeUpload");
        higeduc = rs.getString("Qualification");
    	ApplyingFor=rs.getInt("Applying_For");
    	SkillSet=rs.getInt("Current_Skill_Set");
		Reveexp = rs.getInt("RelevantExprience");
		System.out.println("RelevantExprience"+Reveexp);
		ReveexpMts=Reveexp%12;
		System.out.println("RelevantExprience:::ReveexpMts"+ReveexpMts);
		ReveexpYrs=Reveexp/12;
		System.out.println("RelevantExprience::ReveexpYrs"+ReveexpYrs);
		nonReveexp = rs.getInt("NONRelevantExprience");
		System.out.println("Non RelevantExprience"+nonReveexp);
		nonReveexpMts=nonReveexp%12;
		System.out.println("Non RelevantExprience:::nonReveexpMts"+nonReveexpMts);
		nonReveexpYrs=nonReveexp/12;
		System.out.println("Non RelevantExprience:::nonReveexpYrs"+nonReveexpYrs);
		
		//*******Qualification Group Code*********//
		    Statement stQualification=null;
			ResultSet rsQualification=null;
		    String QualificationGroupName="";
		    String queryForqualification="SELECT  QualificationGroupName FROM mstqualgroup where QualificationGroupId='"+higeduc+"'";
			stQualification=connection.createStatement();
			rsQualification=stQualification.executeQuery(queryForqualification);
			if(rsQualification.next())
	    	{	
	    	QualificationGroupName=rsQualification.getString("QualificationGroupName");
	    	System.out.println("QualificationGroupName"+QualificationGroupName);
	    	}
		    rsQualification.close();
		    stQualification.close();
		    //*****End ofQualification Group Code*****//
    	
    	//**************Applying For*****************//
    	    Statement stApplyingFor=null;
			ResultSet rsApplyingFor=null;
		    String ApplyingForName="";
		    String queryApplyingFor="SELECT Program_type_Name FROM  program_type_master Where Program_Type_Id='"+ApplyingFor+"'";
			stApplyingFor=connection.createStatement();
			rsApplyingFor=stApplyingFor.executeQuery(queryApplyingFor);
			if(rsApplyingFor.next())
	    	{	
	    	ApplyingForName=rsApplyingFor.getString("Program_type_Name");
	    	System.out.println("ApplyingForName"+ApplyingForName);
	    	}
	    	else
	    	{
	    	ApplyingForName="NA";
	    	}
		    rsApplyingFor.close();
		    stApplyingFor.close();
    	
    	//**************End of Applying For*****************//
    	
    	//**************Current Skill Set For Experience*****************//
    	    Statement stSkillSet=null;
			ResultSet rsSkillSet=null;
		    String SkillSetName="";
		    String querySkillSet="SELECT Current_Skill_name FROM current_skill_master where Current_Skill_id='"+SkillSet+"'";
			stSkillSet=connection.createStatement();
			rsSkillSet=stSkillSet.executeQuery(querySkillSet);
			if(rsSkillSet.next())
	    	{	
	    	SkillSetName=rsSkillSet.getString("Current_Skill_name");
	    	System.out.println("SkillSetName"+SkillSetName);
	    	}
		    rsSkillSet.close();
		    stSkillSet.close();
    	
    	//**************End of Current Skill Set For Experience*****************//
  		
  		//***************Candidate Status Master Query********************//
  		String queryStatus="select * from cand_status_master where StatusID < "+rs.getInt("cand_Status")+" and (status_type=0 or status_type="+ApplyingFor+")";
        System.out.print("queryStatus:::::::"+queryStatus);
        Statement stmtStatus=connection.createStatement();
        ResultSet rsStatus=stmtStatus.executeQuery(queryStatus);
  		//***************End of Candidate Status Master Query********************//
  		%>
  			<table border="0" cellpadding="6" cellspacing="6" width="450px">
        <tr>
	           <td rowspan="3" style="width:80px;" align="left" valign="middle">
	            <%
	            		if(rs.getString("ImagePath")==null)
	            		{
	            	 %>
			            	<img src="<%=recruitPath%>images/default_person.jpg" width="80px" height="80px" alt="image" />
	            	<%}
	            		else
	            		{
	            	%>
			            	<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=canId%>" width="80px" height="80px" alt="image" />
	            	<%}%>  
	           </td>
                
            	 <td rowspan="3" style="width:85px;" align="center" valign="middle">
            	  <%
            		if(RAG==2)
            		{
            	 %>
            	<a style="text-align: right;color: maroon;" onclick="showWindowYellow()"><img src="<%=recruitPath%>images/yellow.jpg" width="65px" height="80px" alt="image" /></a>
            	 	<%}
            		else if(RAG==3)
            		{
            	 %>
            	 <img src="<%=recruitPath%>images/green.jpg" width="65px" height="80px" alt="image" />
            	 <%}
            		else
            		{
            	 %>
            	<a style="text-align: right;color: maroon;" onclick="showWindow()"> <img src="<%=recruitPath%>images/red.jpg" width="65px" height="80px" alt="image" /></a>
            	 </td>
            	<%} %>
            <td  class="allBackColor">
                     <%=rs.getString("Bpo_Cand_Id")%>
                 </td>
            </tr>    
            <tr>
                <td  class="allBackColor">
                    <%=canName %>
                </td>
            </tr>
                    
           <tr>
               <td  class="allBackColor">
                   DOR: <%=DOR%>
               </td>
          </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Highest Education
            </td>
            
            <td align="left" class="allBackColor">
                 <%if(higeduc.equalsIgnoreCase("0")) {%>
                NA
            <%}else{ %>
                <%=QualificationGroupName%>
                <%} %>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Current Skill Set
            </td>
            
            <td align="left" class="allBackColor">
                <%if(SkillSet==0){ %>
            Fresher
            <%}else{ %>
                <%=SkillSetName%>
            <%} %>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Applying For
            </td>
            
            <td align="left" class="allBackColor">
                <%=ApplyingForName%>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Relevant Experience
            </td>
            
            <td align="left" class="allBackColor">
                <%if(Reveexp==0)
					{ %>
					Fresher
					<%}
					else
					{ %>
					<%=ReveexpYrs%> Years <%=ReveexpMts %> Months
					<%} %>
            </td>
        </tr>
         <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Non Relevant Experience
            </td>
            
            <td align="left" class="allBackColor">
                <%if(nonReveexp==0){
					 %>
					 Fresher
					 <%}else{ %>
					<%=nonReveexpYrs%> Years <%=nonReveexpMts %> Months
					<%} %>
            </td>
        </tr>
       <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Current Status
            </td>
                 <%
            		if(rs.getString("cand_Status").equalsIgnoreCase("0"))
            		{
            	 %>
            	 	<td align="left" class="allBackColor">
            			NA
            		</td>
            	<%}
            		else
            		{
            	%>
            		<td align="left" class="allBackColor">
            		<%
            			String queryStatusName="select CanStatus from cand_status_master where StatusID=" + rs.getInt("cand_Status") + ""; 
            			Statement stmtName=connection.createStatement();
            			ResultSet rsName=stmtName.executeQuery(queryStatusName);
            			if(rsName.next())
            			{
            			String CandStatus=rsName.getString("CanStatus");
            		 %>
            		<%=CandStatus%>
            		<input type="hidden" name="candidatestatus" id="candidatestatus" value=<%= rs.getString("cand_Status")%>>
            		<%
            			}
            		 %>
            		</td>
            	<%}
            	%>
                
            
        </tr>
         <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Select Status
            </td>
            
            <td align="left" class="allBackColor">
                <select id="selForState" name="selForState" class="reSizeforOther">
            	  <option value="select">--Select For--</option>
            	  <%
					while(rsStatus.next())
				    {								
					 %>
						<option value="<%=rsStatus.getString("StatusID")%>"><%=rsStatus.getString("CanStatus")%></option>
					 <%
					}
					
					%>
				  
				  
				</select>
            </td>
        </tr>
        
         <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                 Status Change Reason
            </td>
            
            <td align="left" class="allBackColor">
                <input type="text" name="changeReason" id="changeReason" class="wmta" value="Change Reason" onfocus="Focus(this.id,'Change Reason')" onblur="Blur(this.id,'Change Reason')" onkeypress="return AllowChars(event);" oncut="return false" onpaste="return false" oncopy="return false" style="border: 1px solid #C8C8C8;font-family: Arial,Helvetica,sans-serif;font-size: 12px;height: 25px;width: 175;">
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">   
            	
            	<input type="hidden" name="selFor" value="" />
            	<input type="hidden" name="ApplyingFor" value="<%=ApplyingFor %>" /> 
            	<input type="hidden" name="CandAutoId" value="<%=CandAutoId %>" /> 
                <input type="submit" name="submit" value="Submit" class="buttonMedium" />&nbsp;&nbsp;
                
            </td>
        </tr>
       
    </table>
  		<%
  	}
  
   %>


   <%}
   	catch(Exception e)
   	{
   		e.printStackTrace();
   	}
	
					rs.close();
					stmts.close();
					connection.close();
				 %>
   </form>
  </body>
</html>
