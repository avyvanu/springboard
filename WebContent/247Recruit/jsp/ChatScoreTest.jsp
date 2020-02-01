<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.CallableStatement"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
String username=((String)session.getAttribute("RecUserName")).trim();
System.out.println("username==="+username);
String candID = (String) request.getParameter("candidateid");
System.out.println("candID==="+candID);
String pagevalue=(String)session.getAttribute("page");
System.out.println("pagevalue==="+pagevalue);
if(username==null)
{
		response.sendRedirect("../247Recruit/jsp/Login.jsp");
}
String LDEmployeeId=((String)session.getAttribute("LDEmployeeId")).trim();
if(LDEmployeeId==null)
{
   response.sendRedirect("../247Recruit/jsp/Login.jsp");
}
System.out.println("LDEmployeeId==="+LDEmployeeId);
 %>

<html>
  <head>
    <title>[24]7 Chat Score</title>
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

<script type="text/javascript" language="javascript">

 function logout()
 {
 location.href = "<%=logoutPage%>";
 }
 
 function showWindowScript()
	{
	var url = "<%=request.getContextPath()%>/247Recruit/jsp/ChatScriptPrint.jsp?CandidateId=<%=candID%>"
	someWindow = window.open(url,'ReasonWindow','height=550,width=610,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
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

<!-- Calculating Scores Based on Selection -->
<script type="text/javascript">
function chk()
		   {
			// =IF(G43=0,9,IF((9-(G43*0.25))>0,9-(G43*0.25),0))
			var totalerror1=document.getElementById("totalerror1").value;
			var b=0.25;
			var a=9;
			if(totalerror1==0)
			{	
				document.getElementById("display1").value=a;
				document.getElementById("dis1").value=a;
				//document.getElementById("display").value=a;
			}
			else if(totalerror1>0 && totalerror1<=36)
			{
				var c=a-(document.getElementById("totalerror1").value*0.25);
				document.getElementById("display1").value=c;
					document.getElementById("dis1").value=c;
				//document.getElementById("display").value=c;
			}
			else if( totalerror1>36)
			{
				var c=0
				document.getElementById("display1").value=c;
					document.getElementById("dis1").value=c;
				//document.getElementById("display").value=c;
			}
					ValCalc();
		
		    }
</script>

<!-- Script for Calculating Scores based on drop down selection -->
 <script type="text/javascript">
function chk2()
		  {
			// =IF(G43=0,9,IF((9-(G43*0.25))>0,9-(G43*0.25),0))
			var totalerror1=document.getElementById("totalerror2").value;
			var b=0.25;
			var a=3;
			if(totalerror1==0)
			{	
				document.getElementById("display2").value=a;
					document.getElementById("dis2").value=a;
				//document.getElementById("display").value=a;
			}
			else if(totalerror1>0 && totalerror1<=12)
			{
				var c=a-(document.getElementById("totalerror2").value*0.25);
				document.getElementById("display2").value=c;
				document.getElementById("dis2").value=c;
				//document.getElementById("display").value=c;
			}
			else if( totalerror1>12)
			{
				var c=0;
				document.getElementById("display2").value=c;
				document.getElementById("dis2").value=c;
				//document.getElementById("display").value=c;
			}
			
			ValCalc();
			
		 }
</script>

<script type="text/javascript">
function validate(evt)
		 {
		  var theEvent = evt || window.event;
		  var key = theEvent.keyCode || theEvent.which;
		  key = String.fromCharCode( key );
		  var regex = /[0-9]|\./;
		  if( !regex.test(key) ) 
		  {
		    theEvent.returnValue = false;
		    if(theEvent.preventDefault) theEvent.preventDefault();
		  }
		
		}
</script>
	 
<!-- Script to calculate the Total Score --> 
<script type="text/javascript">
	 
	 function calcscore()	 
	 {

	   var  appropraiteOpening=document.getElementById("appropraiteOpening").value; 
	   var  appropriateClosing=document.getElementById("appropriateClosing").value;
       var  Candidateownership=document.getElementById("Candidateownership").value;
       var  candidateAssistance=document.getElementById("candidateAssistance").value;
	   var  candidatepolite=document.getElementById("candidatepolite").value; 
       var  candidateEmpathize=document.getElementById("candidateEmpathize").value;
       var   candidateComprehend=document.getElementById("candidateComprehend").value;
       var   candidateconcise=document.getElementById("candidateconcise").value;
	   
	  var total=parseFloat(appropraiteOpening)+parseFloat(appropriateClosing)+parseFloat(Candidateownership)+parseFloat(candidateAssistance)+parseFloat(candidatepolite)+parseFloat(candidateEmpathize)+parseFloat(candidateComprehend)+parseFloat(candidateconcise);	   
      //alert(total);
	   	document.getElementById("dis").value=total;
	  	document.getElementById("display").value=total;
	  	ValCalc();
	 }	
</script>

<!-- Final Total Score Script -->
 <script type="text/javascript">
		function ValCalc()
		{
		   
			var x=document.getElementById('dis').value;
			var y=document.getElementById('dis1').value;
			var z=document.getElementById('dis2').value;
			var sum = parseFloat(x)+parseFloat(y)+parseFloat(z);
			document.getElementById("display").value=sum;
		}
</script>
	 
<!-- Script for Validating the Selection -->	 
 <script type="text/javascript">
       
		      function CheckValidation()
			{
			if(document.getElementById("programnames").value =='')
			{
				var appStr = 'Please Select The Program!!!';
				alert(appStr);
				document.getElementById('programnames').focus();
				return false;
			
			}
			else	
			if(chatscoresubmitform.appropraiteOpening.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Did the Candidate use the appropriate Opening" Field !');
                 document.getElementById('appropraiteOpening').focus(); 
                 return false; 
              }
			else	
			if(chatscoresubmitform.appropriateClosing.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Did the Candidate use the appropriate Closing" Field !'); 
                 document.getElementById('appropriateClosing').focus(); 
                 return false; 
              }
			
			else	
			if(chatscoresubmitform.Candidateownership.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Did the Candidate take ownership of the situation" Field !'); 
                 document.getElementById('Candidateownership').focus(); 
                 return false; 
              }
			
			else	
			if(chatscoresubmitform.candidateAssistance.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Did the Candidate ask for additional assistance before closing" Field !');
                 document.getElementById('candidateAssistance').focus();  
                 return false; 
              }
			
			else	
			if(chatscoresubmitform.candidatepolite.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Please Select "Was the Candidate Courteous/Polite" Field !'); 
                 document.getElementById('candidatepolite').focus();  
                 return false; 
              }
			
			else	
			if(chatscoresubmitform.candidateEmpathize.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Please Select "Did the Candidate Empathize/Showed concern" Field !'); 
                document.getElementById('candidateEmpathize').focus();  
                 return false; 
              }
			
			else	
			if(chatscoresubmitform.candidateComprehend.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Please Select "Did the Candidate Comprehend the customer questions and statements" Field !');
                document.getElementById('candidateComprehend').focus(); 
                 return false; 
              }
			
			else
			if(chatscoresubmitform.candidateconcise.selectedIndex == 0) 
              { 
                alert ( 'Please Select "Please Select "Was the Candidate clear and concise with his explanations" Field !');
                 document.getElementById('candidateconcise').focus();  
                 return false; 
              }	
			else
				
			if(document.getElementById("totalerror1").value=='')
			{
				var appStr = 'Please Enter Total score for Grammar !';		
				alert(appStr);
				document.getElementById('comments').focus();
				return false;
			}
			else
				
			if(document.getElementById("totalerror2").value=='')
			{
				var appStr = 'Please Enter Total Score For Sentence Construction !';		
				alert(appStr);
				document.getElementById('comments').focus();
				return false;
			}
			
			else
				
			if(document.getElementById("comments").value=='')
			{
				var appStr = 'Please Enter Comments !';		
				alert(appStr);
				document.getElementById('comments').focus();
				return false;
			}
			else
			if ( ( chatscoresubmitform.select[0].checked == false ) && ( chatscoresubmitform.select[1].checked == false )&&( chatscoresubmitform.select[2].checked == false ) ) 
			{ 
				 alert ( "Please choose the status(Select/Hold?Reject) !" );
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
	    		Connection con=null;
	            Statement stmts7 =null;
				ResultSet rss7 = null;          
               try
               {
                con = ConnectDatabase.getConnection(); 
  			    String recruiterName=null;
	    	    String recruiterid=null;
  			    String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_ID='"+LDEmployeeId+"'";
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
	        { %>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/LD_Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/LD_SIM_Options.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_ChatScore.jsp">Select Candidate</a> ></font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Score Chat</font>
	        <%} 
	        else if(pagevalue=="2")
	        {%>
	        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/LD_Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/LD_SIM_Options.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_ReChatScore.jsp">Select Candidate</a> ></font>
	        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Rescore Chat</font>
	            <%} %>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=username%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
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
  <!-- ********************************************** -->
  
   <form action="<%=request.getContextPath()%>/ChatScore" method="post" id="chatscoresubmitform" name="chatscoresubmitform" method="post" onsubmit="return CheckValidation();">
<div class="wrapper">
  <div class="contentSize">
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
                 String doe=null;
                 String imagepath=null;
                 String dobfinal=null;
                 String transcript=null; 
                 Blob image = null;  
                 byte[] imgData = null;  
                OutputStream o=null;
    	        //String secQsnxQry7 = "SELECT * FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+candID+"'";
				//System.out.println("query "+secQsnxQry7);
				//Statement stmts = con.createStatement();
				//ResultSet rss = stmts.executeQuery(secQsnxQry7);
				//String EDKey="[24]7";
				//String EDKPass="247Cust0m3r"; 
				Statement stmts=null;
				ResultSet rss = null;
				CallableStatement cs=null;
				con=ConnectDatabase.getConnection();									
				stmts = con.createStatement();
				String strProcedure="{call BpoCandDtls_Encrypt_Proc('"+candID+"','"+EDKey+"','"+EDKPass+"')}"; //your procedure name
				System.out.println("strProcedure"+strProcedure);
				cs=con.prepareCall(strProcedure);
				rss=cs.executeQuery();
				if(rss.next())
				{
				id=rss.getString("AutoID");
				candID=rss.getString("Bpo_Cand_Id");
				firstname=rss.getString("First_Name");
				middlename=rss.getString("Middle_Name");
				higeduc=rss.getString("Qualification");
				ApplyingFor=rss.getInt("Applying_For");
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
				System.out.println("date:::::::;"+date);
				//imagepath=rss.getString("ImagePath");
				image = rss.getBlob("ImagePath");  
				dobfinal=dateFormat2.format(date);
				}
				System.out.println("image:::::::;"+image);
				imgData = image.getBytes(1, (int) image.length());  
				System.out.println("imgData:::::::;"+imgData);
				response.setContentType("image/gif");  
				//o = response.getOutputStream();
				
			//*******Qualification Group Code*********//
			Statement stQualification=null;
			ResultSet rsQualification=null;
		    String QualificationGroupName="";
		    String queryForqualification="SELECT  QualificationGroupName FROM mstqualgroup where QualificationGroupId='"+higeduc+"'";
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
                 <%
                 if(imgData==null)
           		{
            	 %>
	            	<td rowspan="4" style="width:100px;" colspan="1" valign="middle">
		            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="120px" alt="image" />
		            </td>
            	<%}
            		else
            		{
            	%>
   <td width="120px" rowspan="4">   
   <img src="<% o.write(imgData);%>" width="120px" height="120px" alt="image" /></td>
   <%} %>
    <td width="250px" class="allBackColor" id="candidateid" align="left"><%=candID%>
        <input type="hidden" name="candidateid" value="<%=id %>"/>
        <input type="hidden" name="recruitername" value="<%= recruiterid%>">
        <input type="hidden" name="pagevalue" value="<%= pagevalue%>">
        <input type="hidden" name="CandidateGeneratedID" value="<%=candID%>" /></td>

    <td width="250px" class="allBackmain" align="left"><b>Highest Education</b></td>
    <td width="300px" class="allBackColor" align="left">
       <%if(higeduc.equalsIgnoreCase("0")) {%>NA
			    <%}else{ %>
		 <%=QualificationGroupName%>
			 <%} %>
    </td>
  </tr>
  <tr align="left">
	    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename %></td>
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
		    <%}else{ %>
		    <%=nonReveexpYrs%> Years <%=nonReveexpMts %> Months
		    <%} %>
   		</td>
  </tr>
  <tr align="left">
	    <td class="allBackColor">DOE : <%= dobfinal %></td>
	    <td class="allBackmain"><b>Scoring For Program</b></td>
	    <td class="allTdBackColor">
			  <select name="programnames" id="programnames" size="1" class="reSizeforOther">
			    <option value="">Select</option>
		              <% 
		              	String secQsnQry = "select program_id,program_name  from program_names_master where program_typeid=2 and is_alive=1";
						System.out.println("query "+secQsnQry);
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(secQsnQry);
						while(rs.next())
						{%>
							<option value="<%=rs.getString("program_id")%>"><%=rs.getString("program_name")%></option>	
					<%	}
		               %>
		              
		            </select>
	  </td>
  </tr>
  <tr class="allBackColor">
	   <td  class="allBackmain" colspan="1"> 
		   <table width="100%" height="100%" border="0">
			   <tr>
				   <td align="center" valign="bottom" class="allBackmain" height="70px">
				   <b>Transcript</b>
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
            String sectranscript = "select transcript from mock_chat_test_attempt_master where user_id='"+id+"'";
			System.out.println("sectranscript "+sectranscript);
			Statement stmttranscript = con.createStatement();
			ResultSet rstranscript = stmttranscript.executeQuery(sectranscript);
			System.out.println("rstranscript"+rstranscript);
			
         %>
    <td colspan="3" align="left">
    <!-- <textarea style="width:100%;height:150px;font-size:13px;border:white;resize:none;background-color: #F7F7F7;font-weight: normal" readonly="readonly" id="w" class="allTdBackColor"> --> 
	<div style="width:100%;height:150px;font-size:12px;background-color: #F7F7F7; overflow-y: scroll;" class="allTdBackColor">
	<%
    if(rstranscript.next())
			{
				transcript= rstranscript.getString("transcript");
				System.out.println("Transcript "+transcript);	
				if((transcript==null)||(transcript==""))
				{
				out.print("No Transcript available for this candidate");
				}
				else
				{
				String stringsplit[]=transcript.split("::");
                for(int i=1;i<stringsplit.length-1;i+=2)
              {
              	
              	System.out.println(i);
         if(i>1)
         {
   	%>
		<br/>
	<%
         }
         if(((i+1) % 4) != 0)
         {
   	%>
		<b>:: <%= stringsplit[i] %> :: </b><%=stringsplit[i+1] %>
	<%
         }
         else
         {
   	%>
		<b style="color: red;">:: <%= stringsplit[i] %> :: </b><%=stringsplit[i+1] %>
	<%
         }
         }
		}
		}
		 if (!rstranscript.next() ) {
		    String ChatText=null;
		    String secUploadedtranscript = "SELECT ChatText FROM candidate_chattestupdate_history WHERE CandidateID='"+candID+"' ORDER BY AutoID DESC LIMIT 1";
			System.out.println("sectranscript "+sectranscript);
			Statement stmtUploadedtranscript = con.createStatement();
			ResultSet rsUploadedtranscript = stmtUploadedtranscript.executeQuery(secUploadedtranscript);
			System.out.println("rstranscript"+rstranscript);
		    if(rsUploadedtranscript.next())
		    {
		    ChatText=rsUploadedtranscript.getString("ChatText");
		    System.out.println("Chat Uploaded Text::::"+ChatText);
		    %>
		    <%= ChatText%>
		    <% 
		    }
		    else if (!rsUploadedtranscript.next() )
		    {
			out.print("No Transcript available for this candidate");
			}
			}
	     %>
	</div>
	    </td>
	   </tr>
	     <tr>
	       <td align="left" class="allBackheading" colspan="4">Part A - Chat Etiquette</td>
	     </tr> 
	
   <tr class="allBackmain" align="left">
    <td  style="padding-left: 10px;" colspan="2"><b>Parameter</b></td>
    <td  colspan="2"><b>Score</b></td>
  </tr> 
  
   <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate use the appropriate Opening</td>
    <td class="allTdBackColor" colspan="2">
	  <select name="appropraiteOpening" id="appropraiteOpening" size="1" class="reSizeforOther" onchange="calcscore()">
	     <option value="0">Select</option>
              <%
              	String secQsnQrys = "select score,concat(score,description) as scoredesc from  chat_score_pp_master where chat_pp_id='1' order by score";
				System.out.println("query "+secQsnQrys);
				Statement stmts1 = con.createStatement();
				ResultSet rss1 = stmts1.executeQuery(secQsnQrys);
				while(rss1.next())
				{%>
					<option value="<%=rss1.getString("score")%>"><%=rss1.getString("scoredesc")%></option>	
			<%	}
               %>
              
            </select>
	</td>
	</tr> 
  
   <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate use the appropriate Closing</td>
    <td class="allTdBackColor" colspan="2">
	
	<select name="appropriateClosing" id="appropriateClosing" size="1" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys1 = "select score,concat(score,description) as ritesh from  chat_score_pp_master where chat_pp_id='2' order by score";
				System.out.println("query "+secQsnQrys1);
				Statement stmtss1 = con.createStatement();
				ResultSet rsss1 = stmtss1.executeQuery(secQsnQrys1);
				while(rsss1.next())
				{%>
					<option value="<%=rsss1.getString("score")%>"><%=rsss1.getString("ritesh")%></option>	
			<%	}
               %>
              
            </select>
	  </td>
  </tr>
  <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate take ownership of the situation</td>
    <td class="allTdBackColor" colspan="2">
	<select name="Candidateownership" id="Candidateownership"size="1" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys2 = "select score,concat(score,description) as ritesh from  chat_score_pp_master where chat_pp_id='3' order by score";
				System.out.println("query "+secQsnQrys2);
				Statement stmts2 = con.createStatement();
				ResultSet rss2 = stmts2.executeQuery(secQsnQrys2);
				while(rss2.next())
				{%>
					<option value="<%=rss2.getString("score")%>"><%=rss2.getString("ritesh")%></option>	
			<%	}
               %>
               </select>
	  </td>
  </tr>
  
  <tr align="left">
    <td class="allBackColor" colspan="2">Did the Candidate ask for additional assistance before closing</td>
    <td class="allTdBackColor" colspan="2">
	<select name="candidateAssistance" id="candidateAssistance" size="1" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys3 = "select score,concat(score,description) as ritesh from  chat_score_pp_master where chat_pp_id='4' order by score";
				System.out.println("query "+secQsnQrys3);
				Statement stmts3 = con.createStatement();
				ResultSet rss3 = stmts3.executeQuery(secQsnQrys3);
				while(rss3.next())
				{%>
					<option value="<%=rss3.getString("score")%>"><%=rss3.getString("ritesh")%></option>	
			<%	}
               %>
               </select>
	</td>
  </tr>

 <tr>
   <td align="left" class="allBackheading" colspan="4">Part B - Customer Service</td>
    </tr>

  <tr class="allBackmain" align="left">
   <td  style="padding-left: 10px;" colspan="2"><b>Parameter</b></td>
    <td colspan="2"><b>Score</b></td>
 </tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Was the Candidate Courteous/Polite</td>
    <td class="allTdBackColor" colspan="2">
	<select name="candidatepolite" id="candidatepolite" size="1" class="reSizeforOther" onchange="calcscore()">
	  <option value="0">Select</option>
              <%
              	String secQsnQrys4 = "select score,concat(score,description) as ritesh from  chat_score_pp_master where chat_pp_id='5' order by score";
				System.out.println("query "+secQsnQrys4);
				Statement stmts4 = con.createStatement();
				ResultSet rss4 = stmts4.executeQuery(secQsnQrys4);
				while(rss4.next())
				{%>
					<option value="<%=rss4.getString("score")%>"><%=rss4.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
</tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Did the Candidate Empathize/Showed concern</td>
    <td class="allTdBackColor" colspan="2">
    <select name="candidateEmpathize" id="candidateEmpathize" size="1" class="reSizeforOther" onchange="calcscore()">
	   <option value="0">Select</option>
              <%
              	String secQsnQrys5 = "select score,concat(score,description) as ritesh from  chat_score_pp_master where chat_pp_id='6' order by score";
				System.out.println("query "+secQsnQrys5);
				Statement stmts5 = con.createStatement();
				ResultSet rss5 = stmts5.executeQuery(secQsnQrys5);
				while(rss5.next())
				{%>
					<option value="<%=rss5.getString("score")%>"><%=rss5.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
   </tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Did the Candidate Comprehend the customer questions and statements </td>
    <td class="allTdBackColor" colspan="2">
	<select name="candidateComprehend" id="candidateComprehend" size="1" class="reSizeforOther" onchange="calcscore()">
	<option value="0">Select</option>
              <%
              	String secQsnQrys6 = "select score,concat(score,description) as ritesh from  chat_score_pp_master where chat_pp_id='7' order by score";
				System.out.println("query "+secQsnQrys6);
				Statement stmts6 = con.createStatement();
				ResultSet rss6 = stmts6.executeQuery(secQsnQrys6);
				while(rss6.next())
				{%>
					<option value="<%=rss6.getString("score")%>"><%=rss6.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
  </tr>
  <tr align="left">
   <td class="allBackColor" colspan="2">Was the Candidate clear and concise with his explanations</td>
    <td class="allTdBackColor" colspan="2">
		<select name="candidateconcise" id="candidateconcise" size="1" class="reSizeforOther" onchange="calcscore()">
	  <option value="0">Select</option>
              <%
              	String secQsnQrys7 = "select score,concat(score,description) as ritesh from  chat_score_pp_master where chat_pp_id='8' order by score";
				System.out.println("query "+secQsnQrys7);
				stmts7 = con.createStatement();
				rss7 = stmts7.executeQuery(secQsnQrys7);
				while(rss7.next())
				{%>
					<option value="<%=rss7.getString("score")%>"><%=rss7.getString("ritesh")%></option>	
			<%	}
               %>
        </select>
	</td>
  </tr>

		 <tr>
		 	<td align="left"  class="allBackheading" colspan="4">Part C - Language </td> 
		 </tr>
		
		<tr class="allBackmain">
			 <td  style="padding-left:10px;"  colspan="2" align="left"><b>Parameter</b></td> 
			 <td  align="center"><b>Total Errors</b></td> 
		     <td  align="center"><b>Score</b> </td> 
		 </tr>
		 <tr>
			 <td  class="allBackColor"  colspan="2" align="left">Grammar - (Verbs, Prepositions, Tenses, Articles etc) [9 for 0 errors and 0.25 deduction for every error]</td> 
			 <td class="allBackColor"  align="center"><b><input type="text" name="totalerror1" id="totalerror1" onchange="chk()" size="6px" onkeypress='validate(event)'maxlength="3" ><input type="hidden" id="totalerror1" name="totalerror1" value="0" /></b></td> 
		     <td  class="allBackColor" id="grammarscore" align="center"><input type="text" id="display1" name="display1" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center" readonly="readonly" /> </td> 
		 </tr>
		 <tr>
			 <td  class="allBackColor"  colspan="2" align="left">Sentence Construction [3 for 0 errors and 0.25 deduction for every error]</td> 
			 <td class="allBackColor" align="center"><b><input type="text" size="6px" name="totalerror2" id="totalerror2"  onchange="chk2()" onkeypress='validate(event)' maxlength="3"><input type="hidden" id="totalerror2" name="totalerror2" value="0" /></b></td> 
			 <td class="allBackColor" id="sentenceconstruction" align="center"><input type="text" id="display2" name="display2" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center" readonly="readonly"/></td> 
		 </tr> 
          <tr>
			 <td  class="allBackmain" align="center"  colspan="1"><b>Comments</b></td>
			 <td  class="allTdBackColor"  colspan="3" align="left">
               <textarea name="comments" id="comments" style="width:100%;" rows="4" class="resizetextarea" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
            </td>
         </tr>
	     <tr>
	        <td  class="allBackmain" nowrap="nowrap" colspan="1" align="center"><b style="padding-left: 20px" >
	        TOTAL SCORE</b></td>
		      <td  class="allBackColor" align="center" ><b><input type="text" id="display" name="display" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center"/>
		      <input type="hidden" name="dis" id="dis" value="0">
		      <input type="hidden" name="dis1" id="dis1" value="0">
		      <input type="hidden" name="dis2" id="dis2" value="0">
		   </b></td>
		  <td colspan="1" nowrap="nowrap" style="font-family: Arial;font-size: 12px;color: #41383C;">
				<input TYPE="RADIO" NAME="select" VALUE="1"> Select 
				<input TYPE="RADIO" NAME="select" VALUE="2" > Hold 
				<input TYPE="RADIO" NAME="select" VALUE="3" > Reject
		</td>
		<td colspan="1">
		<table border="0" width="100%">
		<tr>
		  <td align="center">
	       <input name="Clear" type="reset" value="Clear" id="Clear" class="buttonSmall"/>
         </td>
      <td align="center">
	  <input name="Submit" type="submit" value="Submit" id="Submit" class="buttonSmall" onClick="return CheckValidation(this.form);" />
		 <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
		 </td>
		    </tr>
		    </table>
		    </td>
		    </tr>
		   <%   
		        
					rss7.close();
					stmts7.close();
					rss6.close();
					stmts6.close();
					rss5.close();
					stmts5.close();
					rss4.close();
					stmts4.close();
					rss3.close();
					stmts3.close();
					rss2.close();
					stmts2.close();
					rsss1.close();
					stmtss1.close();
					rss1.close();
					stmts1.close();
					rstranscript.close();
					stmttranscript.close();
					rs.close();
					stmt.close();
					rss.close();
					stmts.close();
				    con.close();
				}
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
				}
				
				%>
  </table>
  </div>
  </div>
  </form>
  
  <!-- ************************* -->
  	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;">.</td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" style="background-color:#666666; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#666666;height:21px; padding-right:5px;">
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
  </body>
</html>
