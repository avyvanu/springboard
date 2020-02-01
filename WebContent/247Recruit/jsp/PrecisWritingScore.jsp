<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.CallableStatement"%>

<%@ include file="GlobalDeclare.jsp" %>
<%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
     if(USER_Name == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	System.out.println("USER_Name in Precis Score page::::"+USER_Name);
	String USER_ID = (String)session.getAttribute("USER_ID");
	 if(USER_ID == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	 System.out.println("USER_ID in Precis score score page::::"+USER_ID);
	
	String candID = (String) request.getParameter("candidateid");
	System.out.println("candID==="+candID);
	String pagevalue=(String)session.getAttribute("PrecisPageVal");
	System.out.println("PrecisWRtiing pagevalue==="+pagevalue);
	
 %>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/Common_ritesh.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">

<style type="text/css">
html,body

{
margin: 0px;
}
.logo
{

height: 69px;

width: 143px;

} 
.contentSize
	{
		border: 0px solid #FFFFFF;
	    clear: both;
	    display: block;
	    overflow: hidden;
	    padding-left: 0px;
	    width: 920px;
	    vertical-align: middle;
	}

.wrapper
	{
		margin: 0 auto;
    	width: 920px;
	}
</style>

<!-- Opening PDF Help Document  -->
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
	someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
   <!-- End of Opening PDF Help Document  -->
   
<script type="text/javascript" language="javascript">

 function logout()
 {
 location.href = "<%=logoutPage%>";
 }
 
  function showWindowScript()
	{
	var url = "<%=request.getContextPath()%>/247Recruit/jsp/PrecisPassagePrint.jsp?CandidateId=<%=candID%>"
	someWindow = window.open(url,'ReasonWindow','height=550,width=610,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
</script>

<!-- Script for for Onchange of program -->	 
<script type="text/javascript">

function programval()
{

getprogramvalue();

}
function getprogramvalue()
	{
		var programvalue=document.getElementById("programsnames").value;
		//alert(programvalue);
		xmlhttp=GetXmlHttpObject();
		if (xmlhttp==null)
  		{
	 		alert("Your browser does not support AJAX!");
	 	 	return;
  		}
		var url="<%=request.getContextPath()%>/247Recruit/jsp/PrecisScoreList.jsp";
		url=url+"?sid="+Math.random();
		url=url+"&programvalue="+programvalue;
		//alert(url);
		xmlhttp.onreadystatechange=stateChanged;
		xmlhttp.open("GET",url,true);
		xmlhttp.send(null);
	}
	function stateChanged()
	{
		if (xmlhttp.readyState==4)
	  	{
			 var data = xmlhttp.responseText;
			// alert("Fences----->"+data);
			 idata=data.split(",");
			 var arry = new Array(idata.length);
			 for(var i=0;i<idata.length-1;i++)
			 {
			    //alert("string ---->"+idata[0]);
			    //fenName = idata[i].split(":");
			    //alert("fence name is"+fenName[0]);
			    //arry[i] = document.createElement('option');  
	  			//arry[i].text = fenName[1];
				//arry[i].value =fenName[0];
				document.getElementById('desiredscore1').value= idata[0];	
				document.getElementById('desiredscore2').value= idata[1];
				document.getElementById('desiredscore3').value= idata[2];
				document.getElementById('desiredscore4').value= idata[3];
			}
		}
	}
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
</script>

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

<script type="text/javascript">
	 
		 function calcscore()	 
		 {
	
		   var ClarityLogical=document.getElementById("ClarityLogical").value; 
		   var  punctuation=document.getElementById("punctuation").value;
	       var  spellings=document.getElementById("spellings").value;
	       var  sentencecontruction=document.getElementById("sentencecontruction").value;
		   
		   
		    total=parseFloat(ClarityLogical)+parseFloat(punctuation)+parseFloat(spellings)+parseFloat(sentencecontruction);	   
	      //alert(total);
		   	document.getElementById("display").value=total;
		
		 }	
</script>	 
 <script type="text/javascript">
       
		    function CheckValidation()
			{
			if(precisscoresubmitform.ClarityLogical.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Clarity/ logical flow of thought" Field !'); 
                document.getElementById('ClarityLogical').focus();
                 return false; 
              }
			
			else
			if(precisscoresubmitform.punctuation.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Punctuation" Field !'); 
                document.getElementById('punctuation').focus();
                 return false; 
              }	
			
			else
			if(precisscoresubmitform.spellings.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Spellings" Field  !'); 
                  document.getElementById('spellings').focus();
                 return false; 
              }		
			
			else	
			if(precisscoresubmitform.sentencecontruction.selectedIndex == 0) 
              { 
                alert ('Please Select "Sentence construction (Grammatical errors)" !'); 
                document.getElementById('sentencecontruction').focus();
                 return false; 
              }		
			
			else	
			if(document.getElementById("comments").value=='')
			{
				var appStr = 'Please Enter Comments !!!';		
				alert(appStr);
				document.getElementById('comments').focus();
				return false;
			}
			document.getElementById('Submit').style.display="none";
            document.getElementById("processing").style.display="";
			}
</script>
 </head>
  
  <body>
  
 
  	 <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	     <%      
             try
             {
                Connection con = ConnectDatabase.getConnection(); 
                String recruiterName=null;
                String recruiterid=null;
                String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_ID='"+USER_ID+"'";
				System.out.println("query "+secqryrecruiter);
				Statement stmtsrec = con.createStatement();
				ResultSet rssrec = stmtsrec.executeQuery(secqryrecruiter);
				while(rssrec.next())
				{
				recruiterName=rssrec.getString("Emp_Name");
				recruiterid=rssrec.getString("Emp_ID");
				
				}
                 %>
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
	               <%if(pagevalue=="1")
	                { 
	                %>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/SIM_Home.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_PrecScore.jsp">Select Candidate</a> ></font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Score Precis</font>
	             <%
	             } 
	        else if(pagevalue=="2")
	        {%>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/SIM_Home.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_PrecScore.jsp">Select Candidate</a> ></font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Rescore Precis</font>
	            <%} %>
	        </td>
	       <td align="right" class="recName" style="padding-right:10px;">
				<b><span class="username"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			   </td>
	    </tr>
	    <tr>
	         <td colspan="2" align="center">
	       <%
						if (request.getAttribute("DuplicateCheck") != null)
						 {
						String DuplicateCheck = (String) request.getAttribute("DuplicateCheck");
						 if (DuplicateCheck.equalsIgnoreCase("Already_Inserted")) 
						 {
					%>
					<div align="center">
						<span class="register" style="color: red; font-weight: bold;">
							Data already Exists!! </span>
					</div>
					<%
						}
							}
					%>
	 <br/>  
	        <!-- ******************Header code begins************** -->
 <div class="wrapper">
  <div class="contentSize">
 <form action="<%=request.getContextPath()%>/PrecisWritingScore" method="post" id="precisscoresubmitform" name="precisscoresubmitform" method="post" onsubmit="return CheckValidation();">

<table width="920px" cellspacing="6" cellpadding="6" border="0">
  <tr>
   <%            
                 
	                 String firstname=null; 
	                 String middlename=null; 
	                 String id=null;
	                 String higeduc=null;
	                 int Reveexp = 0;
			         int ReveexpMts=0;
			         int ReveexpYrs = 0;
				     int nonReveexp = 0;
				     int nonReveexpMts=0;
				     int nonReveexpYrs = 0;
				     int ApplyingFor=0;
				     String imagepath=null;
	                 String doe=null;
	                 String dobfinal=null;
	                Statement stmts=null;
					ResultSet rss = null;
					CallableStatement cs=null;
					con=ConnectDatabase.getConnection();									
					stmts = con.createStatement();
					String strProcedure="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
					System.out.println("strProcedure"+strProcedure);
					cs=con.prepareCall(strProcedure);
					cs.setString(1,candID);
			        cs.setString(2,EDKey);
			        cs.setString(3,EDKPass);
					rss=cs.executeQuery();
				if(rss.next())
				{
					id=rss.getString("AutoID");
					System.out.println("Auto ID::::::"+id);
					candID=rss.getString("Bpo_Cand_Id");
					firstname=rss.getString("First_Name");
					middlename=rss.getString("Middle_Name");
					ApplyingFor=rss.getInt("Applying_For");
					higeduc=rss.getString("Qualification");
					Reveexp = rss.getInt("RelevantExprience");
					System.out.println("RelevantExprience"+Reveexp);
					ReveexpMts=Reveexp%12;
					System.out.println("RelevantExprience:::ReveexpMts"+ReveexpMts);
					ReveexpYrs=Reveexp/12;
					System.out.println("RelevantExprience::ReveexpYrs"+ReveexpYrs);
					nonReveexp = rss.getInt("NONRelevantExprience");
					System.out.println("Non RelevantExprience"+nonReveexp);
					nonReveexpMts=nonReveexp%12;
					System.out.println("Non RelevantExprience:::nonReveexpMts"+nonReveexpMts);
					nonReveexpYrs=nonReveexp/12;
					System.out.println("Non RelevantExprience:::nonReveexpYrs"+nonReveexpYrs);
					doe= rss.getString("system_date_time");
				    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat dateFormat2=new SimpleDateFormat("dd-MMM-yyyy");
					Date date=dateFormat.parse(doe);
					imagepath=rss.getString("ImagePath");
				    dobfinal=dateFormat2.format(date);
				}
			//*******Qualification Group Code*********//
			Statement stQualification=null;
			ResultSet rsQualification=null;
		    String QualificationGroupName="";
		    String queryForqualification="SELECT  QualificationGroupName FROM mstqualgroup where QualificationGroupId='"+higeduc+"'";
			System.out.println(" queryForqualification"+queryForqualification);
			stQualification=con.createStatement();
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
			System.out.println(" queryApplyingFor"+queryApplyingFor);
			stApplyingFor=con.createStatement();
			rsApplyingFor=stApplyingFor.executeQuery(queryApplyingFor);
			if(rsApplyingFor.next())
	    	{	
	    	ApplyingForName=rsApplyingFor.getString("Program_type_Name");
	    	System.out.println("ApplyingForName"+ApplyingForName);
	    	}
		    rsApplyingFor.close();
		    stApplyingFor.close();
    	
    	//**************End of Applying For*****************//	
				
                 %>
            <%     if(imagepath==null)
           		{
            	 %>
	            	<td rowspan="3" style="width:100px;" colspan="1" valign="middle">
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="120px" alt="image" />
		            </td>
            	<%}
            		else
            		{
            	%>
   		<td width="120px" rowspan="3">  
   		
   		
   		<img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=candID%>" width="120px" height="120px" alt="image" /></td>
   		
   		
    <%} %>
    <td width="200px"   class="allBackColor" id="candidateid" align="left"><%=candID%>
     <input type="hidden" name="candidateid" value="<%=id %>"/>
     <input type="hidden" name="recruitername" value="<%=recruiterid%>">
     <input type="hidden" name="pagevalue" value="<%=pagevalue%>">
     <input type="hidden" name="CandidateGeneratedID" value="<%=candID%>" />
     </td>
   
    <td width="300px" class="allBackmain" align="left"><b>Highest Education</b></td>
    <td width="300px" class="allBackColor" align="left">
      <%if(higeduc.equalsIgnoreCase("0")) {%>NA
			    <%}else{ %>
		 <%=QualificationGroupName%>
			 <%} %>
    </td>
  </tr>
  <tr align="left">
    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename%></td>
    <td class="allBackmain"><b>Customer Interaction Experience</b></td>
    <td class="allBackColor">
		    <%if(Reveexp==0) {%>
		    Fresher
		    <%}else { %>
        <%=ReveexpYrs%> Years <%=ReveexpMts %> Months
		    <%} %>
    </td>
  </tr>
  <tr align="left">
    <td class="allBackColor"><%=ApplyingForName %></td>
    <td class="allBackmain"><b>Other Experience</b></td>
    <td class="allBackColor">
       <%if(nonReveexp==0){ %>
       Fresher
       <%} else { %>
    <%=nonReveexpYrs%> Years <%=nonReveexpMts %> Months
      <%} %>
      </td>
  </tr>

  <tr>
   <td class="allBackmain" align="center" colspan="1"><b>Passage</b></td>
    <%
                String paragraph=null;
                String secpara = "select pm.precis_writing_passage from precis_writing_passages_master pm, precis_test_attempt_master pt  where pm.precis_passage_id=pt.precis_passage_id and pt.user_id='"+id+"'";
                System.out.println("query "+secpara);
				Statement stmenpara = con.createStatement();
				ResultSet rsss_para = stmenpara.executeQuery(secpara);
				
				while(rsss_para.next())
				{
				
				paragraph=rsss_para.getString(1);
				System.out.println("paragraph "+paragraph);
				}
	%>
    
     
    <td colspan="3">
    <textarea style="width:100%;resize:none;height:150px;font-size:13px;border: 0px;"" readonly="readonly" id="w" class="allTdBackColor" oncopy="return false" onpaste="return false" oncut="return false">
<%if(paragraph==null)
 {
 out.print("No Passage Tagged for this Candidate!");
 } else 
 {%><%=paragraph%><%}%></textarea>
         </td>
</tr>
  
  <tr>
   <td class="allBackmain" align="center" colspan="1">
   <table width="100%" height="100%" border="0">
			   <tr>
				   <td align="center" valign="bottom" class="allBackmain" height="70px">
				   <b>Summary</b>
				   </td>
			   </tr>
			   <tr>
				   <td class="allBackmain" align="right" valign="bottom" height="70px">
				   <b><a style="color: maroon;" onclick="showWindowScript()">Print</a></b>
				   </td>
			   </tr>
		   </table>
		   </td>
   <%
                String typedpara=null;
                String secquery = "select Precis_Typed_Area_Text  from precis_test_attempt_master where user_id="+id+"";
                System.out.println("query "+secquery);
				Statement stments = con.createStatement();
				ResultSet rssss = stments.executeQuery(secquery);
				
				while(rssss.next())
				{
				
				typedpara=(rssss.getString("Precis_Typed_Area_Text")).trim();
				System.out.println("typedpara "+typedpara);
				}
	  %>
   <td class="allBackColor" colspan="3" align="left"> 
<textarea style="width:100%;resize:none;height:150px;font-size:13px;border:0px;" readonly="readonly" id="w" class="allTdBackColor" oncopy="return false" onpaste="return false" oncut="return false">
<%if((typedpara==null)||(typedpara==""))
{
out.print("No Passage Summary Available For This Candidate!");
}
else
{%><%=typedpara%><%}%></textarea>  	 
 
    </td>
 </tr>
  <tr align="left">
    <td  class="allBackmain" colspan="2"><b>Parameter</b></td>
    
    <td  class="allBackmain" colspan="2"><b>Score</b></td>
  </tr>
 <tr align="left">
    <td  class="allBackColor" colspan="2">Clarity/ logical flow of thought</td>
    <td  class="allTdBackColor" colspan="2">
	<select name="ClarityLogical" id="ClarityLogical" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
	 <option value="0">Select</option>
               
               <%String seccsQsnQry1 = "select score,concat(score,' ',description) as ritesh from precis_writing_pp_master where precis_writing_PP_id='1' order by score";
				System.out.println("query "+seccsQsnQry1);
				Statement stssmt1 = con.createStatement();
				ResultSet rsss1 = stssmt1.executeQuery(seccsQsnQry1);
				while(rsss1.next())
				{%>
					<option value="<%=rsss1.getString("score")%>"><%=rsss1.getString("ritesh")%></option>	
			<%	}
			
               %>
              
      </select>
	</td>
  </tr>
  <tr align="left">
    <td class="allBackColor" colspan="2">Punctuation</td>
    <td class="allTdBackColor" colspan="2"> 
	<select name="punctuation" id="punctuation" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
	  <option value="0">Select</option>
               
               <%String seccsQsnQry2 = "select score,concat(score,' ',description) as ritesh from precis_writing_pp_master where precis_writing_PP_id='2' order by score";
				System.out.println("query "+seccsQsnQry2);
				Statement stssmt2 = con.createStatement();
				ResultSet rsss2 = stssmt2.executeQuery(seccsQsnQry2);
				while(rsss2.next())
				{%>
					<option value="<%=rsss2.getString("score")%>"><%=rsss2.getString("ritesh")%></option>	
			<%	}
			
               %>
              
      </select>
	
	</td>
  </tr>
  <tr align="left">
    <td class="allBackColor" colspan="2">Spellings</td>
    <td class="allTdBackColor" colspan="2">
	<select name="spellings" id="spellings" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
	  <option value="0">Select</option>
               
               <%String seccsQsnQry3 = "select score,concat(score,' ',description) as ritesh from precis_writing_pp_master where precis_writing_PP_id='3' order by score";
				System.out.println("query "+seccsQsnQry3);
				Statement stssmt3 = con.createStatement();
				ResultSet rsss3 = stssmt3.executeQuery(seccsQsnQry3);
				while(rsss3.next())
				{%>
					<option value="<%=rsss3.getString("score")%>"><%=rsss3.getString("ritesh")%></option>	
			<%	}
		
               %>
              
      </select>
	
	</td>
  </tr>
   <tr align="left">
    <td class="allBackColor" colspan="2">Sentence construction (Grammatical errors)</td>
    
    <td class="allTdBackColor" colspan="2">
	<select name="sentencecontruction" id="sentencecontruction" class="reSizeforOther" onChange="calcscore()" style="width: 100%; height: 20px;">
	 <option value="0">Select</option>
               
               <%String seccsQsnQry4 = "select score,concat(score,' ',description) as ritesh from precis_writing_pp_master where precis_writing_PP_id='4' order by score";
				System.out.println("query "+seccsQsnQry4);
				Statement stssmt4 = con.createStatement();
				ResultSet rsss4 = stssmt4.executeQuery(seccsQsnQry4);
				while(rsss4.next())
				{%>
					<option value="<%=rsss4.getString("score")%>"><%=rsss4.getString("ritesh")%></option>	
			<%	}
			   
               %>
              
      </select>
	
	</td>
  </tr>
<tr align="left">
 <td class="allBackmain" align="center" colspan="1"><b>Comments</b></td>
 <td  class="allTdBackColor" colspan="3">
 <textarea name="comments" id="comments" rows="4" style="resize:none;width: 100%;" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
 </td>
 </tr>
<tr>
 <td class="reds" colspan="4" align="left"> *Clearing Score :  13/25<br/>
    **The Candidate must get the Clarity and Sentence Construction Threshold
 </td>
 </tr>
<tr>
      <td  class="allBackmain" align="center" colspan="1"><b>TOTAL SCORE</b></td>
      <td class="allBackColor" align="center" colspan="2">
      	<b>
      		<input type="text" id="display" name="display" value="0" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center"/>
      	</b>
      </td>
					
<td colspan="1">
<table border="0" width="100%">
		<tr>
		  <td align="center">
  <input name="Clear" type="reset" value="Clear" id="Clear" class="buttonSmall"/>
   </td>
      <td align="center">
  <input name="Submit" id="Submit" type="submit" value="Submit"  class="buttonSmall" onClick="return CheckValidation(this.form);" />
  <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
</td>
		    </tr>
		    </table>
		    </td>
		    </tr>
		    </table>
             <%  
					rsss4.close();
					stssmt4.close();
					rsss3.close();
					stssmt3.close();
					rsss2.close();
					stssmt2.close();
					rsss1.close();
					stssmt1.close();
					rssss.close();
					stments.close();
					rsss_para.close();
					stmenpara.close();
					rss.close();
					stmts.close();
			        con.close();
				}
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
					
				} %>
  
</form>
 </div>
 </div>
			<!-- ############################################ -->    
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
							<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
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
  </body>
</html>


