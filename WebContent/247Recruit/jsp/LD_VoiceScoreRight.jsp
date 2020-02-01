<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
     if(USER_Name == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
     System.out.println("USER_Name in LD score righthome page::::"+USER_Name);
    String canId = (String) request.getParameter("candId");
    String USER_ID = (String)session.getAttribute("USER_ID");
	 if(USER_ID == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	session.setAttribute("Bpo_Cand_Id", canId );
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
   	
	session.setAttribute( "page","1");	
	String voiceScorePath=recruitPath+"jsp/VoiceScore.jsp?candidateid="+canId;
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

    <script type="text/javascript" language="javascript">
    	<%
		if(USER_Name==null)
 			{
	%>
		parent.location.href="<%=logoutPage%>";
	<%
		}
	%>
	  function RedirectPage()
    	{
	 		parent.location.href= "<%=voiceScorePath%>";
	 	}
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
	  </script>
  </head>
  
  <body>
  <form name="BioForm" onsubmit="return RedirectPage();">
  
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
	int MarkVoiceReScore=0;
  	if(rs.next())
  	{
  		int RAG=rs.getInt("RAG");
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		Date dateStr = rs.getDate("System_Date_Time");
  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
    	String DOR = formatter.format(dateStr);
    	String Phone = rs.getString("Phone");
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
		MarkVoiceReScore = rs.getInt("MarkVoiceReScore");
		System.out.println("MarkVoiceReScore:::::::"+MarkVoiceReScore);
		if(MarkVoiceReScore==1)
		{
		session.setAttribute( "VoicePageVal", "2" );
		}
		else
		{
		session.setAttribute( "VoicePageVal", "1" );
		}
		
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
                Mobile #
            </td>
            
            <td align="left" class="allBackColor">
                <%=Phone%>
            </td>
        </tr>
       <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                V&A Test Recording
            </td>
            
            <td align="left" class="allBackColor">
                <%
            		if(rs.getDate("VAAudioUploadOn")==null)
            		{
            	 %>
            	 	NA
            	<%}
            		else
            		{
	            		Date dateVoiceTestUploadOn = rs.getDate("VAAudioUploadOn");
				  		SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
				    	String VoiceTestUploadOn = formatter1.format(dateVoiceTestUploadOn);
            	%>
            		Available, Updated on: <%=VoiceTestUploadOn%>
            	<%}
            	%>
            </td>
        </tr>
        
        <tr>
            <td colspan="3" align="center">   
            	
                <input type="submit" name="submit" value="Score Test" class="buttonMedium" />&nbsp;&nbsp;
                
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
