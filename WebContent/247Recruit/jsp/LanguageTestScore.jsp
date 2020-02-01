<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.CallableStatement"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
    if(USER_Name == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	System.out.println("USER_Name in Language Score page::::"+USER_Name);
	String USER_ID = (String)session.getAttribute("USER_ID");
	if(USER_ID == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	System.out.println("USER_ID in Chat score score page::::"+USER_ID);
	String candID = (String) request.getParameter("candidateid");
	System.out.println("candID==="+candID);
	String pagevalue=(String)session.getAttribute("LangPageVal");
	System.out.println("pagevalue==="+pagevalue);
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


<script type="text/javascript">
	function AllowNumbers(evt)
	{
		var theEvent = evt || window.event;
		var charCode = (evt.which) ? evt.which : event.keyCode;
		if ((charCode > 47 && charCode < 58) || charCode == 13 || charCode == 8) 
		{
			return true;
		}
		else
		{
			alert("Only numbers allowed here !!");
			return false;
		}
	}      
</script>
<script type="text/javascript">
var storeTotal = 0;
var storeTotal_prtC = 0;

var bLoad=false;
var pureText=true;
var bodyTag="";
var bodyTag1="";
var bTextMode=false;


var counterBlue = 0; 
var counterOrange = 0; 
var counterPurple = 0; 

function countcodeNoBlue()
{	
	var bval = document.getElementById("Clarity_valueB").value;
	counterBlue  = parseInt(bval)+1;
	document.getElementById("Clarity_valueB").value = counterBlue;
}
function countcodeNoOrange()
{
	var oval = document.getElementById("Punctuation_valueB").value;
	counterOrange  = parseInt(oval)+1;
	document.getElementById("Punctuation_valueB").value = counterOrange;
}
function countcodeNoPurple()
{
	var pval = document.getElementById("Sentance_Cons_valueB").value;
	counterPurple  = parseInt(pval)+1;
	document.getElementById("Sentance_Cons_valueB").value = counterPurple;
}

function subcountcodeNoBlue()
{
	var sblue = document.getElementById("Clarity_valueB").value;
	if(sblue > 0)
	{
		var getsblue = sblue - 1; // subtract variable
		document.getElementById("Clarity_valueB").value = getsblue;
	}
}
function subcountcodeNoOrange()
{
	var sorange = document.getElementById("Punctuation_valueB").value;
	if(sorange > 0)
	{
		var getsorange = sorange - 1; // subtract variable
		document.getElementById("Punctuation_valueB").value = getsorange;
	}
}
function subcountcodeNoPurple()
{
	var spurple = document.getElementById("Sentance_Cons_valueB").value;
	if(spurple > 0)
	{
		var getsorange = spurple - 1; // subtract variable
		document.getElementById("Sentance_Cons_valueB").value = getsorange;
	}
}

function clearAllcolorcode_PartB()
{
	if(confirm('Are you sure you want to clear this correction ?'))
	{
		bodyTag = ( document.getElementById("Composition").innerHTML = document.getElementById("partBAns").innerHTML);
		Composition.document.open();
		Composition.document.write(bodyTag);
		Composition.document.body.style.fontSize = "10pt";
		Composition.document.body.style.fontFamily = "Arial";
		Composition.document.body.style.bgColor = "#F7F7F7";
		Composition.document.body.text = '#000000';
		Composition.document.close();
		Composition.document.designMode="On";

		document.getElementById("partBScore").innerHTML = 10;
		document.getElementById("PartB_Score").value = 10;

		document.getElementById("Clarity_valueB").value = 0;
		document.getElementById("Punctuation_valueB").value = 0;
		document.getElementById("Sentance_Cons_valueB").value = 0;

		document.getElementById("blueColorB").value = 2;
		document.getElementById("orangeColorB").value = 2;
		document.getElementById("purpleColorB").value = 6;

		CalcTotalScore();
	}
	else 
	{
		return false;
	}
}

function clearAllcolorcode_PartC()
{
	if(confirm('Are you sure you want to clear this correction ?'))
	{
		bodyTag1 = ( document.getElementById("Composition1").innerHTML = document.getElementById("partCAns").innerHTML);
		Composition1.document.open();
		Composition1.document.write(bodyTag1);
		Composition1.document.body.style.fontSize = "10pt";
		Composition1.document.body.style.fontFamily = "Arial";
		Composition1.document.body.style.bgColor = "#F7F7F7";
		Composition1.document.body.text = '#000000';
		Composition1.document.close();
		Composition1.document.designMode="On";

		document.getElementById("partCScore").innerHTML = 10;
		document.getElementById("PartC_Score").value = 10;

		document.getElementById("Clarity_valueC").value = 0;
		document.getElementById("Punctuation_valueC").value = 0;
		document.getElementById("Sentance_Cons_valueC").value = 0;
		
		document.getElementById("blueColorC").value = 2;
		document.getElementById("orangeColorC").value = 2;
		document.getElementById("purpleColorC").value = 6;

		CalcTotalScore();
	}
	else 
	{
		return false;
	}
}


var counterBlue_partC = 0; 
var counterOrange_partC = 0; 
var counterPurple_partC = 0; 

function cBlue()
{
	var bval = document.getElementById("Clarity_valueC").value;
	counterBlue_partC  = parseInt(bval)+1;
	document.getElementById("Clarity_valueC").value = counterBlue_partC;
}
function cOrange()
{
	var oval = document.getElementById("Punctuation_valueC").value;
	counterOrange_partC  = parseInt(oval)+1;
	document.getElementById("Punctuation_valueC").value = counterOrange_partC;
}
function cPurple()
{
	var pval = document.getElementById("Sentance_Cons_valueC").value;
	counterPurple_partC  = parseInt(pval)+1;
	document.getElementById("Sentance_Cons_valueC").value = counterPurple_partC;
	
}


function subBlue_PartC()
{
	var SClarityC = document.getElementById("Clarity_valueC").value;
	if(SClarityC > 0)
	{
		var getS_ClarityC = SClarityC - 1;
		document.getElementById("Clarity_valueC").value = getS_ClarityC;
	}	
}
function subOrange_PartC()
{
	var SPunc = document.getElementById("Punctuation_valueC").value;

	if(SPunc > 0)
	{
	var getSPunc = SPunc - 1;
	document.getElementById("Punctuation_valueC").value = getSPunc;
	}	
}
function subPurple_PartC()
{
	var SCons = document.getElementById("Sentance_Cons_valueC").value;
	if(SCons > 0)
	{
		var getSCons = SCons - 1;
		
		document.getElementById("Sentance_Cons_valueC").value = getSCons;
	}	
}

var prtC_b = 0;
var prtC_o = 0;
var prtC_p = 0;

function bluepartc_result()
{
	prtC_b = parseInt(document.getElementById("Clarity_valueC").value);	
	if(prtC_b < 1)
	{
		prtC_b = 2; 
	}
	else if(prtC_b < 3)
	{
		prtC_b = 1;
	}	
	else
	{
		prtC_b = 0;
	}	
	document.getElementById("blueColorC").value = prtC_b;
	getSometotalpartC();

}

function orangepartc_result()
{
	prtC_o = parseInt(document.getElementById("Punctuation_valueC").value);	
	if(prtC_o < 1)
	{
		prtC_o = 2; 
	}
	else if(prtC_o < 3)
	{
		prtC_o = 1;
	}	
	else
	{
		prtC_o = 0;
	}	
	document.getElementById("orangeColorC").value = prtC_o;
	getSometotalpartC();
}

function purplepartc_result()
{
	prtC_p = parseInt(document.getElementById("Sentance_Cons_valueC").value);
	if(prtC_p < 3)
	{
		prtC_p = 6; 
	}
	else if(prtC_p < 5)
	{
		prtC_p = 5;
	}
	else if(prtC_p < 7)
	{
		prtC_p = 4;
	}
	else if(prtC_p == 7)
	{
		prtC_p = 3;
	}
	else if(prtC_p == 8)
	{
		prtC_p = 2;
	}
	else if(prtC_p == 9)
	{
		prtC_p = 1;
	}
	else
	{
		prtC_p = 0;
	}	
	document.getElementById("purpleColorC").value = prtC_p;
	getSometotalpartC();

}
</script>


<script type="text/javascript">
function getSometotalpartC()
{
	var btotal_prtC = parseInt(document.getElementById("blueColorC").value);
	var ototal_prtC = parseInt(document.getElementById("orangeColorC").value);
	var ptotal_prtC = parseInt(document.getElementById("purpleColorC").value);

	storeTotal_prtC = (btotal_prtC + ototal_prtC + ptotal_prtC);
	
	document.getElementById("partCScore").innerHTML = storeTotal_prtC;
	document.getElementById("PartC_Score").value = storeTotal_prtC;
	
	CalcTotalScore();
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
   
 <!-- Script for the validating of decimal values --> 
   <script type="text/javascript">
	function validate(evt)
	 {
	  var theEvent = evt || window.event;
	  var key = theEvent.keyCode || theEvent.which;
	  key = String.fromCharCode( key );
	  var regex = /[0-9]|\./;
		  if( !regex.test(key) ) 
		  {
		    alert("Please Enter only Numbers");
		    theEvent.returnValue = false;
		    if(theEvent.preventDefault) theEvent.preventDefault();
		  }
			
	}
   </script>
   <!-- End of Script for the validating of decimal values --> 
   
  <script type="text/javascript" language="javascript">
	 function logout()
	 {
	    location.href = "<%=logoutPage%>";
	 }
    function showScriptPartA()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/LanguagePassagePrint.jsp?CandidateId=<%=candID%>&Part=Partb"
		someWindow = window.open(url,'ReasonWindow','height=550,width=610,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	function showScriptPartB()
	{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/LanguagePassagePrint.jsp?CandidateId=<%=candID%>&Part=Partc"
		someWindow = window.open(url,'ReasonWindow','height=550,width=610,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
   </script>



<!-- Char allowing scripts --> 
   <script type="text/javascript">
		function AllowChars(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
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
       
		    function CheckValidation()
			{

				document.getElementById('PartBtexaHTML').innerHTML = Composition.document.body.innerHTML;
				document.getElementById('PartCtexaHTML').innerHTML = Composition1.document.body.innerHTML;

			for(var j = 1; j<11; j++)
			{
				var radioselection = document.getElementsByName('AnsSlctQ'+j);		
				var state=false;
				for (var i = 0; i < radioselection.length; i++) 
				{
					if (radioselection[i].checked) 
					{
					
						state= true; // checked
					}
				}
				if(state==false)
				{
					alert("Please Select option(Correct/In Correct) for Part A of Question"+j);
					return false;
				}
				// not checked, show error
			}				
			
		    	
			if(document.getElementById("PartB_Comments").value=='')
			{
				var appStr = 'Please Enter Comments for PartB !';		
				alert(appStr);
				document.getElementById('PartB_Comments').focus();
				return false;
			}
				
		    	
			if(document.getElementById("PartC_Comments").value=='')
			{
				var appStr = 'Please Enter Comments for PartC !';		
				alert(appStr);
				document.getElementById('PartC_Comments').focus();
				return false;
			}
			
			if(document.getElementById("comments").value=='')
			{
				var appStr = 'Please Enter Overall Comments !';		
				alert(appStr);
				document.getElementById('comments').focus();
				return false;
			}
			document.getElementById('Submit').style.display="none";
            document.getElementById("processing").style.display="";
			}
    </script>
    
<script type="text/javascript">
var blueresultTotalv = 0;
var orangeresultTotalv = 0;
var purplesultTotalv = 0;
var b = 0;
var o = 0;
var p = 0;
function blueResultTotal()
{
	b = parseInt(document.getElementById("Clarity_valueB").value);	
	if(b < 1)
	{
		//alert('inside < 1');
		b = 2; 
	}
	else if(b < 3)
	{
		//alert('inside < 3');
		b = 1;
	}	
	else
	{
		//alert('inside else');
		b = 0;
	}	
	document.getElementById("blueColorB").value = b;
	getSometotal();
}
function orangeResultTotal()
{	
	o = parseInt(document.getElementById("Punctuation_valueB").value);
	if(o < 1)
	{
		o = 2; 
	}
	else if(o < 3)
	{
		o = 1;
	}	
	else
	{
		o = 0;
	}	
	document.getElementById("orangeColorB").value = o;
	getSometotal();
}
function purpleResultTotal()
{
	p = parseInt(document.getElementById("Sentance_Cons_valueB").value);

	if(p < 3)
	{
		p = 6; 
	}
	else if(p < 5)
	{
		p = 5;
	}
	else if(p < 7)
	{
		p = 4;
	}
	else if(p == 7)
	{
		p = 3;
	}
	else if(p == 8)
	{
		p = 2;
	}
	else if(p == 9)
	{
		p = 1;
	}
	else
	{
		p = 0;
	}	
	
	document.getElementById("purpleColorB").value = p;
	getSometotal();
}

function getSometotal()
{

	var btotal = parseInt(document.getElementById("blueColorB").value);
	var ototal = parseInt(document.getElementById("orangeColorB").value);
	var ptotal = parseInt(document.getElementById("purpleColorB").value);

	storeTotal = (btotal + ototal + ptotal);
	document.getElementById("partBScore").innerHTML = storeTotal;
	document.getElementById("PartB_Score").value = storeTotal;
	
	CalcTotalScore();
}
</script>    


<script type="text/javascript">

 function CalcTotalScorePartA()
 {
	 var total=0;
	 var bcTotal = 20;
	 for(var i=1;i<11;i++)
	 {
		 var selection = document.getElementById("AnsSlctQ" + i);
         if (selection.checked)
         {
             total = total + 1;
             
         }         
	 }
	document.getElementById("PartAtotalscore").value = total;
	CalcTotalScore(); 
 }
 
   </script>	 
<script type="text/javascript">
function CalcTotalScore()
{
	var finalTotal = 0;
	
	var partA = document.getElementById("PartAtotalscore").value;
	
	var partB = document.getElementById("PartB_Score").value;
	
	var partC = document.getElementById("PartC_Score").value;
	
	finalTotal = parseInt(partA)+parseInt(partB)+parseInt(partC);	
	document.getElementById("display").value=finalTotal; 
	
}
</script>    
 </head>
		  <%
		try
		{
			
			Connection con = null;
			Statement stmt = null,stmtCandDtls=null;
			ResultSet rs = null,rsCandDtls=null;
		
			String Lang_Test_ID = "";
			String Lang_Passage = "";
			String PartA_Header = "";
			String PartA_Part1_Header = "";
			String PartA_Part2_Header = "";
			
			String PartB_Header = "";
			String PartB_Q = "";
			String PartC_Header = "";
			String PartC_Q1 = "";
			String PartC_Q2 = "";
			String PartC_Q3 = "";
			
			String Lang_Test_Id=null;
			String PartA_A1=null;
			String PartA_A2=null;
			String PartA_A3=null;
			String PartA_A4=null;
			String PartA_A5=null;
			String PartA_A6=null;
			String PartA_A7=null;
			String PartA_A8=null;
			String PartA_A9=null;
			String PartA_A10=null;
			String PartB_A=null;
			String PartB_A_Disp=null;
			String PartB_A_temp=null;
			String PartC_A=null;
			String PartC_A_Disp=null;
			String PartC_A_temp=null;
		%>
   <body onload="onloadGetDATA();">
      <table cellpadding="0" cellspacing="0" width="100%">
	     <tr>
	        <%  con = ConnectDatabase.getConnection(); 
                String recruiterName=null;
                String recruiterid=null;
                String secqryrecruiter = "SELECT Emp_Name,Emp_ID FROM user_master where Emp_ID='"+USER_ID+"'";
				System.out.println("query \t"+secqryrecruiter);
				Statement stmtsrec = con.createStatement();
				ResultSet rssrec = stmtsrec.executeQuery(secqryrecruiter);
				if(rssrec.next())
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
                <%if(pagevalue.equalsIgnoreCase("1"))
                { 
                %>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/SIM_Home.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_LanguageScore.jsp">Select Candidate</a> ></font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Score Language Test</font>
	            <%
	            } 
		       	else if(pagevalue.equalsIgnoreCase("2"))
		        {
		        %>
		        <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > <a href="<%=recruitPath%>jsp/SIM_Home.jsp">SIM</a> > <a href="<%=recruitPath%>jsp/LD_LanguageScore.jsp">Select Candidate</a> ></font>
		        <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Rescore Language Test</font>
	            <%
	            } 
	            %>
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
     <form action="<%=request.getContextPath()%>/LanguageTestScore" method="post" id="precisscoresubmitform" name="precisscoresubmitform" method="post" onsubmit="return CheckValidation();">
       <table width="920px" cellspacing="6" cellpadding="6" border="0">
        <tr>
                 <%  String firstname=null; 
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
	   
	   //***Candidate Answered Details****//
					String PartA_Ans[]={"","","","","","","","","","",""};
					String[] wordCountPartB = null;
					String[] wordCountPartC = null;
					int wordCount_PartB = 0;
					int wordCount_PartC = 0;
					String getLangCandDtls="SELECT * FROM language_test_attempt_master where Cand_Id="+id+"";
					System.out.println("getLangCandDtls  : \t" + getLangCandDtls);
					con= ConnectDatabase.getConnection();
					stmtCandDtls=con.createStatement();
					rsCandDtls = stmtCandDtls.executeQuery(getLangCandDtls);
					if(rsCandDtls.next())
					{
					    Lang_Test_Id=rsCandDtls.getString("Lang_Test_Id");
						System.out.println("Lang_Test_Id  : " + Lang_Test_Id);
					    try
					     {
							for(int i=1;i<11;i++)
							{
								System.out.println("i"+i);	
								PartA_Ans[i]=rsCandDtls.getString("PartA_A"+i);	
								System.out.println("PartA_Ans:::::"+PartA_Ans[i]+"i  "+i);
									
							}	
						}
						catch(Exception ee)
						{
						ee.getCause();
						ee.printStackTrace();
						}
						PartB_A = rsCandDtls.getString("PartB_A");
						System.out.println("PartB_A::::::" + PartB_A);
						PartB_A_Disp = PartB_A.replaceAll(" ", "&nbsp;");
						System.out.println("PartB_A_Disp::::::" + PartB_A_Disp);
						PartB_A_temp = PartB_A;
						if(PartB_A.trim() != null && !PartB_A.trim().equalsIgnoreCase("") && PartB_A.trim().length() != 0)
						 {
							PartB_A_temp = PartB_A_temp.replaceAll("\\s+", " ");
							System.out.println("PartB_A_temp::::::" + PartB_A_temp);
							wordCountPartB = PartB_A_temp.split(" ");
							wordCount_PartB = wordCountPartB.length;
							System.out.println("wordCountPartB::::::" + wordCountPartB.length);
						}
						PartC_A = rsCandDtls.getString("PartC_A");
						System.out.println("PartC_A::::::" + PartC_A);
						PartC_A_Disp = PartC_A.replaceAll(" ", "&nbsp;");
						System.out.println("PartC_A_Disp::::::" + PartC_A_Disp);
						PartC_A_temp = PartC_A;
						if(PartC_A.trim() != null && !PartC_A.trim().equalsIgnoreCase("") && PartC_A.trim().length() != 0)
						 {
							PartC_A_temp = PartC_A_temp.replaceAll("\\s+", " ");
							System.out.println("PartC_A_temp::::::" + PartC_A_temp);
							wordCountPartC = PartC_A_temp.split(" ");
							wordCount_PartC = wordCountPartC.length;
							System.out.println("wordCountPartC::::::" + wordCountPartC.length);
						}
					}
					String paragraph=null;
					String getLanguagePA = "SELECT * FROM language_test_master where lang_test_id = '"+Lang_Test_Id+"'";
					System.out.println("getLanguagePA \t : " + getLanguagePA);
					con= ConnectDatabase.getConnection();
					stmt = con.createStatement();
					rs = stmt.executeQuery(getLanguagePA);
	
	
				if(rs.next())
				{
					Lang_Test_ID = rs.getString("Lang_Test_Id");
					System.out.println("Lang_Test_ID \t  : " + Lang_Test_ID);
					paragraph = rs.getString("Lang_Passage");
					paragraph = paragraph.replaceAll("\\s+", " ");
					System.out.println("paragraph::"+paragraph);
					PartA_Header = rs.getString("PartA_Header");
					System.out.println("PartA_Header \t  : " + PartA_Header);
					Lang_Passage = rs.getString("Lang_Passage");
					System.out.println("Lang_Passage \t  : " + Lang_Passage);
			
					// PART A
					PartA_Part1_Header = rs.getString("PartA_Part1_Header");
					PartA_Part2_Header = rs.getString("PartA_Part2_Header");
					
					// PART B
					PartB_Header = rs.getString("PartB_Header");
					PartB_Q = rs.getString("PartB_Q");
					
					// PART C
					PartB_Header = rs.getString("PartB_Header");
					PartB_Q = rs.getString("PartB_Q");
					PartC_Header = rs.getString("PartC_Header");
					PartC_Q1 = rs.getString("PartC_Q1");
					PartC_Q2 = rs.getString("PartC_Q2");
					PartC_Q3 = rs.getString("PartC_Q3");		
				}
	        //******End of Answered Details********// 	
                 %>
            <% if(imagepath==null)
           		{
            	 %>
   		    <td width="120px" rowspan="3" style="padding: 0px;">  
            	<img src="<%=recruitPath%>images/default_person.jpg" width="120px" height="90px" alt="image" />
            </td><%}else{%>
   		    <td width="120px" rowspan="3" style="padding: 0px;">  
   		      <img src="<%=recruitPath%>jsp/displayImageView.jsp?CID=<%=candID%>" width="120px" height="90px" alt="image" />
   		    </td>
   		       <%} %>
            <td width="200px"   class="allBackColor" id="candidateid" align="left"><%=candID%>
			     <input type="hidden" name="candidateid" value="<%=id %>"/>
			     <input type="hidden" name="recruitername" value="<%=recruiterid%>">
			     <input type="hidden" name="pagevalue" value="<%=pagevalue%>">
			     <input type="hidden" name="CandidateGeneratedID" value="<%=candID%>" />
            </td>
   
		    <td width="300px" class="allBackmain" align="left"><b>Highest Education</b></td>
		    <td width="300px" class="allBackColor" align="left">
			      <%if(higeduc.equalsIgnoreCase("0")) {%>NA <%}else{ %>
					 <%=QualificationGroupName%>
						 <%} %>
            </td>
       </tr>
       <tr align="left">
		    <td class="allBackColor"><%=firstname%>&nbsp;<%=middlename%></td>
		    <td class="allBackmain"><b>Customer Interaction Experience</b></td>
		    <td class="allBackColor">
			    <%if(Reveexp==0) {%> Fresher
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

 
  <!--Start Passage Display -->
       <tr>
           <td class="allBackmain" align="center" colspan="1"><b>Passage</b></td>
			<td colspan="3" class="allBackColor">
    <textarea style="width:100%;resize:none;height:150px;font-size:13px;border: 0px;"" readonly="readonly" id="w" class="allTdBackColor" oncopy="return false" onpaste="return false" oncut="return false">
<%if(paragraph==null)
 {
 out.print("No Passage Tagged for this Candidate!");
 } else 
 {%><%=paragraph%><%}%></textarea>
         </td>
	</tr>
	    <!--End Passage Display -->
	 
	 <!-- Start of Part A -->
    <tr>
		<td class="allBackmain" align="left" colspan="4"><b>Part A</b></td>
	</tr>
 
    <tr>
       <td colspan="4" style="padding: 0px;">
          <table border="0" style="width: 100%;" cellpadding="6" cellspacing="6">
               <%
				boolean fPart2 = false;
				for(int i = 1;i<11;i++)
				{
					if(i==1)
					{
					%>
					<tr>						
						<td colspan="4" class="allBackmain" style="font-weight: bold; font-size: 12px;">
							<%=PartA_Part1_Header %>
						</td>
					</tr>
					<tr>
						<td width="450" class="allBackColor" style="padding-left: 5px;"><%=rs.getString("PartA_Q1") %></td>
						<td align="left" width="250" class="allBackColor"><input type="text" name="partA1" id="partA1" value="<%= PartA_Ans[i]%>" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
						<td align="left" width="220" style="font-family: Arial;font-size: 12px;color: #41383C;">
							<input type="radio" name="AnsSlctQ1" id="AnsSlctQ1" VALUE="1" onchange="CalcTotalScorePartA()"> Correct 
							<input type="radio" name="AnsSlctQ1" id="AnsSlctQ1" VALUE="0" onchange="CalcTotalScorePartA()"> In Correct 
						</td>
					</tr>
					<%
					}
					else
					{	
						String tempPartA_Part = rs.getString("PartA_Q"+i+"_Part");
						if(tempPartA_Part.equals("1"))
						{
					%>
					<tr>
						<td width="450" class="allBackColor"><%=rs.getString("PartA_Q"+i) %></td>
						<td align="left" class="allBackColor" width="250"><input type="text" name="partA<%=i%>" id="partA<%=i%>" value="<%= PartA_Ans[i]%>" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
						<td align="left" width="220" style="font-family: Arial;font-size: 12px;color: #41383C;">
							<input type="radio" name="AnsSlctQ<%=i%>" id="AnsSlctQ<%=i%>" VALUE="1" onchange="CalcTotalScorePartA()"> Correct 
							<input type="radio" name="AnsSlctQ<%=i%>" id="AnsSlctQ<%=i%>" VALUE="0" onchange="CalcTotalScorePartA()"> In Correct 
						</td>
					</tr>
					<%
						}
						else
						{
							if(fPart2 == true)
							{
					%>
					<tr>
						<td width="450" class="allBackColor"><%=rs.getString("PartA_Q"+i) %>	</td>
					    <td align="left" width="250" class="allBackColor"><input type="text" name="partA<%=i%>" id="partA<%=i%>" value="<%= PartA_Ans[i]%>" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
						<td align="left" width="220" style="font-family: Arial;font-size: 12px;color: #41383C;">
							<input type="radio" name="AnsSlctQ<%=i%>" id="AnsSlctQ<%=i%>" VALUE="1" onchange="CalcTotalScorePartA()"> Correct 
							<input type="radio" name="AnsSlctQ<%=i%>" id="AnsSlctQ<%=i%>" VALUE="0" onchange="CalcTotalScorePartA()"> In Correct 
						</td>						
					</tr>
					<%
							}
							else
							{
								fPart2 = true;
					%>
					
					<tr>
						<td colspan="4" style="font-weight: bold; font-size: 12px;" class="allBackmain">
							<%=PartA_Part2_Header %>
						</td>
					</tr>
					<tr>
						<td width="450" class="allBackColor"><%=rs.getString("PartA_Q"+i) %></td>
					    <td align="left" width="250" class="allBackColor"><input type="text" name="partA<%=i%>" id="partA<%=i%>" value="<%= PartA_Ans[i]%>" style="width: 100%;border: #F2F2F2;background-color: #F2F2F2;height:100%" readonly="readonly"/></td>
					    <td width="220" style="font-family: Arial;font-size: 12px;color: #41383C;">
							<input type="radio" name="AnsSlctQ<%=i%>" id="AnsSlctQ<%=i%>" value="1" onchange="CalcTotalScorePartA()"/> Correct 
							<input type="radio" name="AnsSlctQ<%=i%>" id="AnsSlctQ<%=i%>" value="0" onchange="CalcTotalScorePartA()"/> In Correct
						    <input type="hidden" name="countPart1" value="<%=i-1%>"/>
							<input type="hidden" name="PartAtotalscore" id="PartAtotalscore" value="0"/>
						</td>						
					</tr>
						<%
								}
							}
						}
					}
						%>
            </table>
         </td>
     </tr>
 <!-- End of partA -->
 
 <!-- Start of partB -->
     <tr>
	    <td class="allBackmain" align="left" colspan="4"><b>Part B</b></td>
    </tr>
     <tr>
	   <td colspan="4" style="padding: 0px;">
		  <table border="0" style="width: 100%;" cellpadding="6" cellspacing="6">
		     <%if(PartB_Header!=null){ %>
			  <tr>
				<td class="allBackmain" style="font-weight: bold; font-size: 12px;" colspan="4">
				<%=PartB_Header %>
				</td>
			 </tr>
			   <%} %>
			 <%if(PartB_Q!=null){ %>
			 <tr>
				<td align="left" class="allBackColor" width="450" nowrap="nowrap">
				<%=PartB_Q %>
				</td>
			</tr>
		 </table>
		</td>
	 </tr>
			<%} %>
			<%if(PartB_Q!=null){ %>
	<tr style="display: none;">
	 <td class="allBackmain" align="center" colspan="1">
        <table width="100%" height="100%" border="0">
			   <tr>
				   <td align="center" valign="bottom" class="allBackmain" height="50px">
				   <b>Summary</b>
				   </td>
			   </tr>
			   <tr>
				   <td class="allBackmain" align="right" valign="bottom" height="50px">
				   <b><a style="color: maroon;" onclick="showScriptPartA()">Print</a></b>
				   </td>
			   </tr>
		   </table>
		   </td>
	  <td colspan="3" class="allBackColor">
		<textarea style="width:100%;resize:none;height:120px;font-size:13px;border: 0px;"" readonly="readonly" class="allTdBackColor" oncopy="return false" onpaste="return false" oncut="return false" name="partBAns" id="partBAns">
		<%
		System.out.println(">>>> PartB_A  vvv\t"+PartB_A.trim().length());
		if(PartB_A.trim() == null || PartB_A.trim().equalsIgnoreCase("") || PartB_A.trim().length() == 0) {%>
			
			No Passage available for this Candidate
			
		<%}else{%>
		
			<%=PartB_A_Disp%>
			
		<%}%>
		</textarea>
	</td>
</tr>
<%} %>

<!-- ******************  Start 1 for the color codeing ********************* -->
<tr>	
	<td class="allBackmain" align="center" rowspan="1">
	   	<b>Summary</b>&nbsp;<font color="red" size="1">*</font>
	   <br/>
	   <br/>
	   <br/>
	    	<b><a style="color: maroon; font-size: 10;" onclick="showScriptPartA()">View / Print</a></b>
	</td>
	<td colspan="3" class="allBackColor" style="font-size: 12px;">		
		<iframe class="allTdBackColor" style="width:100%;resize:none;height:150px;font-size:13px;border: 0px;" name="Composition" id="Composition" LANGUAGE="javascript" readonly="readonly">
		</iframe>
	</td>
</tr>
<tr>
	<td class="allBackmain" align="center">
		<font style="color: red;font-weight: bold;"><%=wordCount_PartB %>&nbsp; Words</font>
	</td>
	<td colspan="3" align="left" nowrap="nowrap" class="allBackColor">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td align="left">
					<table>
						<tr>
							<td style="background-color: #007FFF;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
											<input type="button" value="Clarity of thought" id="sbut" name="cmdsub" style="font-size: 11;" LANGUAGE="javascript"  onclick="return countcodeNoBlue(), backColor('#007FFF'), blueResultTotal();">
								       </td>
								       <td>
								       		<input type="text" name="Clarity_valueB" id="Clarity_valueB" autocomplete="off" maxlength="2" style="font-size: 11; width: 30px; text-align: center;" onkeypress="return AllowNumbers(event);" onkeyup="return blueResultTotal();"/>
								       </td>
								       <td>
											<input type="button" value=" - " title="subtraction" id="SubCOT" name="SubCOT" style="font-size: 11;" LANGUAGE="javascript" onclick="return subcountcodeNoBlue(), backColor('#F2F2F2'), blueResultTotal();">
								       </td>
									</tr>
								</table>
							</td>
							<td style="width: 5px;">&nbsp;</td>
							<td style="background-color: #FFBF00;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
											<input type="button" value="Punctuation" id="sbut" name="cmdsub" style="font-size: 11;" LANGUAGE="javascript" onclick="return countcodeNoOrange(), backColor('#FFBF00'), orangeResultTotal();">
								       </td>
								       <td>
								       		<input type="text" name="Punctuation_valueB" id="Punctuation_valueB" autocomplete="off" maxlength="2" style="font-size: 11; width: 30px; text-align: center;" onkeypress="return AllowNumbers(event);" onkeyup="return orangeResultTotal();"/>
								       </td>
								       <td>
											<input type="button" value="-" title="subtraction" id="SubPun" name="SubPun" style="font-size: 11;" LANGUAGE="javascript" onclick="return subcountcodeNoOrange(), backColor('#F2F2F2'), orangeResultTotal();">
								       </td>
									</tr>
								</table>
							</td>
							<td style="width: 5px;">&nbsp;</td>
							<td style="background-color: #C6B0F0;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
											<input type="button" value="Sentence Construction" id="sbut" name="cmdsub" style="font-size: 11;" LANGUAGE="javascript" onclick="return countcodeNoPurple(), backColor('#C6B0F0'), purpleResultTotal();">
								       </td>
								       <td>
					       					<input type="text" name="Sentance_Cons_valueB" id="Sentance_Cons_valueB" autocomplete="off" maxlength="2" style="font-size: 11; width: 30px; text-align: center;" onkeypress="return AllowNumbers(event);" onkeyup="return purpleResultTotal();"/>
								       </td>
								       <td>
											<input type="button" value=" - " title="subtraction" id="SubPun" name="SubPun" style="font-size: 11;" LANGUAGE="javascript" onclick="return subcountcodeNoPurple(), backColor('#F2F2F2'), purpleResultTotal();">
								       </td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td align="right">
					<input type="button" id="clearAllB" name="clearAllB" value="Clear Correction" class="buttonMedium" onclick="return clearAllcolorcode_PartB();"/>
				</td>
			</tr>
		</table>
	</td>
</tr>
<!-- ******************  End 1 for the color codeing ********************* -->	

<tr>
       <td class="allBackmain" align="center">
          <b> Score </b>
       </td>
       <td align="center"class="allBackColor" >
	       <table border="0" cellpadding="3" cellspacing="3">
		       <tr>
		       		<td style="font-size: 9px; background-color: #007FFF;" align="center">       			
		       			<input type="text" name="blueColorB" id="blueColorB" value="2" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #FFBF00;" align="center">       			
		       			<input type="text" name="orangeColorB" id="orangeColorB" value="2" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #C6B0F0;" align="center">       			
		       			<input type="text" name="purpleColorB" id="purpleColorB" value="6" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>
		       		</td>
		       		<td>
		       			=
		       		</td>
		       		<td style="font-size: 12;">         
		        		<span id="partBScore"></span>
		        		<input type="hidden" name="PartB_Score" id="PartB_Score" style="font-size: 10; width: 30px;" onkeypress='validate(event)' maxlength="3" value="10"/>
		       		</td>
		       </tr>
	       </table>
       </td>
       <td class="allBackmain" align="center" width="200">
        	<b> Comments </b>
       </td>
       <td align="center" width="400" class="allBackColor" >
       		<textarea name="PartB_Comments" id="PartB_Comments" rows="2" style="resize:none;width: 100%;" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
       </td>
</tr>
<tr>
	<td colspan="4" align="left">
		<font color="red" size="1">* Please select incorrect text in the Summary and click on one of the correction options to color code the respective error/s made.</font>
	</td>
</tr>

 <!-- End of partB -->
 
  <!-- Start of partC -->
	  <tr>
		<td class="allBackmain" align="left" colspan="4"><b>Part C</b></td>
	  </tr>
	 <tr>
	   <td colspan="4" style="padding: 0px;">
		 <table border="0" style="width: 100%;" cellpadding="6" cellspacing="6">
		 <%if(PartC_Header!= null){ %>
	 <tr>
		<td align="left" style="font-weight: bold; font-size: 12px;background-color: #D8D8D8;font-family: Arial;">
		<%= PartC_Header%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q1 != null){ %>
	<tr>
		<td class="allBackColor" width="450" nowrap="nowrap">
		<%= PartC_Q1%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q2 != null){ %>
	<tr>
		<td class="allBackColor" width="450" nowrap="nowrap">
		<%= PartC_Q2%>
		</td>
	</tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>
	<tr>
		<td class="allBackColor" width="450" nowrap="nowrap">
		<%= PartC_Q3%>
		</td>
	</tr>
	</table>
   </td>
 </tr>
	<%} %>
	<%if(PartC_Q3 != null){ %>
	<tr style="display: none;">
		 <td class="allBackmain" align="center" colspan="1">
            <table width="100%" height="100%" border="0">
			   <tr>
				   <td align="center" valign="bottom" class="allBackmain" height="50px">
				   <b>Summary</b>
				   </td>
			   </tr>
			   <tr>
				   <td class="allBackmain" align="right" valign="bottom" height="50px">
				   <b><a style="color: maroon;" onclick="showScriptPartB()">Print</a></b>
				   </td>
			   </tr>
		   </table>
		   </td>
		<td colspan="3" class="allBackColor">
		<textarea style="width:100%;resize:none;height:120px;font-size:13px;border: 0px;"" readonly="readonly" class="allTdBackColor" oncopy="return false" onpaste="return false" oncut="return false"  name="partCAns" id="partCAns">
			<%if(PartC_A.trim() == null || PartC_A.trim().equalsIgnoreCase("") || PartC_A.trim().length() == 0) {%>
			
				No Passage available for this Candidate
			
			<%}else{%>
			
			<%=PartC_A_Disp%>
			
			<%}%>
		</textarea></td>
	</tr>
	<%} %>
		 

<!-- ******************  Start 2 for the color codeing ********************* -->
<tr>	
	<td class="allBackmain" align="center" rowspan="1">
	   	<b>Summary</b>&nbsp;<font color="red" size="1">*</font>
	   <br/>
	   <br/>
	   <br/>
	    <b><a style="color: maroon; font-size: 10;" onclick="showScriptPartB()">View / Print</a></b>
	</td>
	<td colspan="3" class="allBackColor" style="font-size: 12px;">		
		<iframe class="allTdBackColor" style="width:100%;resize:none;height:150px;font-size:13px;border: 0px;" name="Composition1" id="Composition1" LANGUAGE="javascript" readonly="readonly">
		</iframe>
	</td>
</tr>


<tr>
	<td class="allBackmain" align="center">
		<font style="color: red;font-weight: bold"><%=wordCount_PartC %>&nbsp; Words</font>
	</td>
	<td colspan="3" align="left" nowrap="nowrap" class="allBackColor">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td align="left">
					<table>
						<tr>
							<td style="background-color: #007FFF;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
											<input type="button" value="Clarity of thought" id="ClarityColorC" name="ClarityColorC" style="font-size: 11;" LANGUAGE="javascript" onclick="return cBlue(), backColor1('#007FFF'), bluepartc_result();">
										</td>
								       <td>
								       		<input type="text" name="Clarity_valueC" id="Clarity_valueC" style="font-size: 11; width: 30px; text-align: center;" autocomplete="off" maxlength="2" onkeypress="return AllowNumbers(event);" onkeyup="return bluepartc_result();"/>
								       </td>
								       <td>
											<input type="button" value=" - " title="subtraction" id="SubCOT" name="SubCOT" style="font-size: 11;" LANGUAGE="javascript" onclick="return subBlue_PartC(), backColor1('#F2F2F2'), bluepartc_result();">
								       </td>
									</tr>
								</table>
							</td>
							<td style="width: 5px;">&nbsp;</td>
							<td style="background-color: #FFBF00;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
										<input type="button" value="Punctuation" id="Punctuation_C" name="Punctuation_C" style="font-size: 11;" LANGUAGE="javascript" onclick="return cOrange(), backColor1('#FFBF00'), orangepartc_result();"> 
										</td>
								       <td>
								      		<input type="text" name="Punctuation_valueC" id="Punctuation_valueC"  style="font-size: 11; width: 30px; text-align: center;" autocomplete="off" maxlength="2" onkeypress="return AllowNumbers(event);" onkeyup="return orangepartc_result();"/>
								       </td>
								       <td>
											<input type="button" value="-" title="subtraction" id="SubPunB" name="SubPunB" style="font-size: 11;" LANGUAGE="javascript" onclick="return subOrange_PartC(), backColor1('#F2F2F2'), orangepartc_result();">
								       </td>
									</tr>
								</table>
							</td>
							<td style="width: 5px;">&nbsp;</td>
							<td style="background-color: #C6B0F0;">
								<table cellpadding="3" cellspacing="3" border="0">
									<tr>
								       <td>
												<input type="button" value="Sentence Construction" id="sbut" name="cmdsub" style="font-size: 11;" onclick="return cPurple(),backColor1('#C6B0F0'), purplepartc_result();">
										</td>
								       <td>
								       		<input type="text" name="Sentance_Cons_valueC" id="Sentance_Cons_valueC"  style="font-size: 11; width: 30px; text-align: center;" autocomplete="off" maxlength="2" onkeypress="return AllowNumbers(event);" onkeyup="purplepartc_result();"/>
								       </td>
								       <td>
											
											<input type="button" value=" - " title="subtraction" id="SubConsB" name="SubConsB" style="font-size: 11;" LANGUAGE="javascript" onclick="return subPurple_PartC(), backColor1('#F2F2F2'), purplepartc_result();">
								       </td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td align="right">
					<input type="button" id="clearAllB" name="clearAllB" value="Clear Correction" class="buttonMedium" onclick="return clearAllcolorcode_PartC();"/>
				</td>
			</tr>
		</table>
		
		
		
		
	</td>
</tr>


<!-- ******************  End 2 for the color codeing ********************* -->	
 <tr>
        <td class="allBackmain" align="center">
          <b> Score</b>
        </td>
        <td align="center" class="allBackColor">
	        <table border="0" cellpadding="3" cellspacing="3">
		        <tr>
		       		<td style="font-size: 9px; background-color: #007FFF;" align="center">   
		       			<input type="text" name="blueColorC" id="blueColorC" value="2" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>    			
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #FFBF00;" align="center"> 
		       			<input type="text" name="orangeColorC" id="orangeColorC" value="2"  readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>      			
		       		</td>
		       		<td>+</td>
		       		<td style="font-size: 9px; background-color: #C6B0F0;" align="center">
		       			<input type="text" name="purpleColorC" id="purpleColorC" value="6" readonly="readonly" style="font-size: 10; width: 18px; text-align: center; border: none;"/>       			
		       		</td>
		       		<td>
		       			=
		       		</td>
		       		<td style="font-size: 12;">   
						<span id="partCScore"></span>
						<input type="hidden" name="PartC_Score" id="PartC_Score" value="10" style="font-size: 10; width: 30px;" onkeypress='validate(event)' maxlength="3"/>
		       		</td>
		        </tr>
	        </table>
        </td>
        <td class="allBackmain" align="center" width="200">
          <b> Comments </b>
        </td>
        <td align="center" width="400" class="allBackColor" >
           <textarea name="PartC_Comments" id="PartC_Comments" rows="2" style="resize:none;width: 100%;" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
        </td>
    </tr>
   
<tr>
<td colspan="4" align="left">
		<font color="red" size="1">* Please select incorrect text in the Summary and click on one of the correction options to color code the respective error/s made.</font>
	</td>
</tr>
   
   
   <!-- End of partC -->
   
   
   
   
   
    <tr align="left">
		<td class="allBackmain" align="center" colspan="1"><b>Overall Comments</b></td>
		<td  class="allTdBackColor" colspan="3">
          <textarea name="comments" id="comments" rows="4" style="resize:none;width: 100%;" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"></textarea>
       </td>
   </tr>

   <tr>
      <td  class="allBackmain" align="center" colspan="1">
      	<b>TOTAL SCORE</b>
      </td>
      <td class="allBackColor" align="center" colspan="2"><b>
      	<input type="text" id="display" name="display" value="20" readonly="readonly" style="background: #F2F2F2;border-left: #F2F2F2;border-top: #F2F2F2;border-bottom: #F2F2F2;border-right: #F2F2F2;text-align: center"/></b></td>
	
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
             <%     rss.close();
					stmts.close();
			        con.close();
				 }
				catch(Exception ex)
				{
					System.out.println("========="+ex.getMessage());
					ex.printStackTrace();
					
				} %>
    
<textarea style="width:0;height:0; display: none;" id="PartBtexaHTML" name="PartBtexaHTML"></textarea>
<textarea style="width:0;height:0; display: none;" id="PartCtexaHTML" name="PartCtexaHTML"></textarea>
  
  
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
   
<script  LANGUAGE="javascript">



</script>  
<script type="text/javascript">

function onloadGetDATA()
{
	
	document.getElementById("partBScore").innerHTML = 10;
	document.getElementById("Clarity_valueB").value = 0;
	document.getElementById("Punctuation_valueB").value = 0;
	document.getElementById("Sentance_Cons_valueB").value = 0;
	
	document.getElementById("partCScore").innerHTML = 10;
	document.getElementById("Clarity_valueC").value = 0;
	document.getElementById("Punctuation_valueC").value = 0;
	document.getElementById("Sentance_Cons_valueC").value = 0;
	
	document.getElementById("blueColorB").value = 2;
	document.getElementById("orangeColorB").value = 2;
	document.getElementById("purpleColorB").value = 6;
	
	document.getElementById("blueColorC").value = 2;
	document.getElementById("orangeColorC").value = 2;
	document.getElementById("purpleColorC").value = 6;

	
	

	bodyTag = ( document.getElementById("Composition").innerHTML = document.getElementById("partBAns").innerHTML);
	Composition.document.open();
	Composition.document.write(bodyTag);
	Composition.document.body.style.fontSize = "10pt";
	Composition.document.body.style.fontFamily = "Arial";
	Composition.document.body.style.bgColor = "#F7F7F7";
	Composition.document.body.text = '#000000';
	Composition.document.close();
	Composition.document.designMode="On";

	bodyTag1 = ( document.getElementById("Composition1").innerHTML = document.getElementById("partCAns").innerHTML);
	Composition1.document.open();
	Composition1.document.write(bodyTag1);
	Composition1.document.body.style.fontSize = "10pt";
	Composition1.document.body.style.fontFamily = "Arial";
	Composition1.document.body.style.bgColor = "#F7F7F7";
	Composition1.document.body.text = '#000000';
	Composition1.document.close();
	Composition1.document.designMode="On";
}
</script>

<script LANGUAGE="Javascript" SRC="<%=request.getContextPath()%>/247Recruit/js/compose.js?169"></script>
<script LANGUAGE="Javascript" SRC="<%=request.getContextPath()%>/247Recruit/js/changeBackColorCode.js"></script>
	
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


