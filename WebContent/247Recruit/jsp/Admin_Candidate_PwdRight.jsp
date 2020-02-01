<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
  	String USER_Name=(String)session.getAttribute("USER_Name");
  	if(USER_Name == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
  	String candId= (String) request.getParameter("candId");
	session.setAttribute( "CandID", candId );
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
		cs.setString(1,candId);
        cs.setString(2,EDKey);
        cs.setString(3,EDKPass);
		rs=cs.executeQuery();
		Statement stmtScore;
		ResultSet rsScore;
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
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/Recruiter.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">

<!-- Script for Checking the Validation on submit -->
	<script type="text/javascript">      
	        function CheckValidation()
			{
			document.getElementById('submit').style.display="none";
            document.getElementById("processing").style.display="";
			}
	</script>
    <script type="text/javascript" language="javascript">
    	<%
		if(USER_Name == null)
 			{
	%>
		parent.location.href="<%=logoutPage%>";
	<%
		}
	%>
	  </script>
	  <script type="text/javascript" language="javascript">
	function showWindow()
	{
	var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=candId%>&ColorType=1"
	someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	function showWindowYellow()
	{
	var url = "<%=request.getContextPath()%>/247Recruit/jsp/CandidateListPopUp.jsp?canId=<%=candId%>&ColorType=2"
	someWindow = window.open(url,'ReasonWindow','height=600,width=400,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	
	</script>
  </head>
  
  <body>
  <form name="BioForm" action="<%=recruitPath%>jsp/Admin_Candidate_PwdSubmit.jsp" method="post" onsubmit="return CheckValidation();" accept-charset="utf-8">
   
   <%
    String higeduc = null;
    String canPhone = "";
    String canEmail = "";
    int SkillSet=0;
	int Reveexp = 0;
	int ReveexpMts=0;
	int ReveexpYrs = 0;
	int nonReveexp = 0;
	int nonReveexpMts=0;
	int nonReveexpYrs = 0;
	int ApplyingFor=0;
  	if(rs.next())
  	{
  		int RAG=rs.getInt("RAG");
  		String canFname = rs.getString("First_Name");
  		System.out.println("canFname"+canFname);
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		Date dateStr = rs.getDate("System_Date_Time");
  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
    	String DOR = formatter.format(dateStr);
    	int autoId=rs.getInt("AutoID");
    	canPhone = rs.getString("Phone");
    	if(canPhone == null)
    	{
    	canPhone = "";
    	}
    	System.out.println("canPhone"+canPhone);
    	canEmail = rs.getString("Email");
    	if(canEmail == null)
    	{
    	canEmail = "";
    	}
    	System.out.println("canEmail"+canEmail);
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
    	String queryScore="select * from candidate_voice_score where Cand_Id=" + autoId + ""; 
    	stmtScore=connection.createStatement();
		rsScore=stmtScore.executeQuery(queryScore);
    	
    	String lastScoreOn="";
    	String lastScoreBy="";
    	String lastScore="";
    	
      		%>
  	<table border="0" cellpadding="6" cellspacing="6" width="450px">
          <tr>
	           <td rowspan="3" style="width:80px;" align="left" valign="middle">
	            <input type="hidden" name="canFName" id="canFName" value="<%=canFname%>">
	           <input type="hidden" name="canMobile" id="canMobile" value="<%=canPhone%>">
	           <input type="hidden" name="canEmail" id="canEmail" value="<%=canEmail%>">
	                 <%
	            		if(rs.getString("ImagePath")==null)
	            		{
	            	 %>
			            	<img src="<%=recruitPath%>images/default_person.jpg" width="80px" height="80px" alt="image" />
	            	<%}
	            		else
	            		{
	            	%>
			            	<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=candId%>" width="80px" height="80px" alt="image" />
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
            <td align="left" class="allBackColor">
                   <%=rs.getString("Bpo_Cand_Id")%>
               </td>
      </tr>
       <tr>
               <td align="left" class="allBackColor">
                   <%=canName %>
               </td>
        </tr>
        <tr>
            <td align="left" class="allBackColor">
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
               <%if((ApplyingForName == null) || (ApplyingForName == "")){ %>
               NA
               <%} else { %>
                <%=ApplyingForName%>
               <%} %>
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
               Email
            </td>
            
            <td align="left" class="allBackColor">
                <%if(canEmail==null){
					 %>
					 NA
					 <%}else{ %>
					<%=canEmail%>
					<%} %>
            </td>
        </tr>
        
         <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
               Mobile #
            </td>
            
            <td align="left" class="allBackColor">
                <%if(canPhone==null){
					 %>
					 NA
					 <%}else{ %>
					<%=canPhone%>
					<%} %>
            </td>
        </tr>
      <tr>
		 <td style=" font-size:11px; color:#FF0000; font-family: Arial,Helvetica,sans-serif;padding: 0px;" colspan="3" align="left"> 
		   Note: **Reset Password will be sent to above mentioned Email and Mobile #.
		 </td>
 	</tr>
        <tr>
            <td colspan="3" align="center">   
            	<input type="submit" name="submit" id="submit" value="Reset Password" class="buttonMedium" onClick="return CheckValidation(this.form);"/>&nbsp;&nbsp;
                <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
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
