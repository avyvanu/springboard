<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<html>
<head>
	<title>[24]7 SPRINGBOARD</title>
	<%
	String USER_Name = null;
  	String User_Type_Id = null;
  	try
  	{
  	USER_Name =(String)session.getAttribute("USER_Name");
  	if(USER_Name == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
  	User_Type_Id = (String)session.getAttribute("User_Type_Id");
    if(User_Type_Id == null)
  	{
  	  response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
	}
	catch(Exception e)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	} 		
	%>
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>

		<!-- jQuery for Datepicker -->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />

	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	<!-- End jQuery for Datepicker -->

	<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
	</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
	<script language="javascript" src="<%=recruitPath%>js/shortcut.js"></script>
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
		someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
	<script type="text/javascript">
		function AllowChars(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode;
	        if (charCode == 13) 
	        {
				return false;
			}
		}      
	</script>

	<style type="text/css">
	html,body
	{
		margin: 0px;
		
	}
	.theader 
	{
	    background: url("/springboard/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;
	    color: #FFFFFF;
	}
	.classlangTestleft_TD
	{
		width: 200px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classlangTestright_TD
	{
		width: 200px;
		font-size: 12px;
		background-color: #F8F8F8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.inputText
	{
		width: 100%;
	}
	.setBgStyple
	{
		resize: none; 
		width: 660px; 
		height: 150px; 
		text-align: left; 
		background-color:#f8f8f8; 
		border-bottom-color: gray;	

		border-right-color: gray;	
	}
	</style>
	<script type="text/javascript">
	function getQuestionNumber(obj)
	{
		document.getElementById('rowA1').style.display = 'none';
		document.getElementById('rowA2').style.display = 'none';
		document.getElementById('rowA3').style.display = 'none';
		document.getElementById('rowA4').style.display = 'none';
		document.getElementById('rowA5').style.display = 'none';
		document.getElementById('rowA6').style.display = 'none';
		document.getElementById('rowA7').style.display = 'none';
		document.getElementById('rowA8').style.display = 'none';
		document.getElementById('rowA9').style.display = 'none';

		document.getElementById('rowB1').style.display = 'none';
		document.getElementById('rowB2').style.display = 'none';
		document.getElementById('rowB3').style.display = 'none';
		document.getElementById('rowB4').style.display = 'none';
		document.getElementById('rowB5').style.display = 'none';
		document.getElementById('rowB6').style.display = 'none';
		document.getElementById('rowB7').style.display = 'none';
		document.getElementById('rowB8').style.display = 'none';
		document.getElementById('rowB9').style.display = 'none';
			
		var nof_ques = obj.options[obj.selectedIndex].value;
		var getCount = 10 - parseInt(nof_ques);
		
		document.getElementById("dispQuesNo").innerHTML = getCount;

		for(var i = 1; i <= parseInt(nof_ques); i++)
		{
			document.getElementById('rowA'+i).style.display = '';
		}
		for(var j = 1; j <= parseInt(getCount); j++)
		{
			document.getElementById('rowB'+j).style.display = '';
		}
	}
	</script>
	
	<script type="text/javascript">
	var PartAPart1Header = 0;
	var getCountValidate = 0;
	function chkLangValidation()
	{
		var TestName = document.getElementById('TestName').value;
		if(TestName == '' || TestName == null || TestName.trim().length == 0)
		{
			alert('Please enter the test name !');
			document.getElementById('TestName').focus();
			return false;
		}
		var ParagraphText = document.getElementById('ParagraphText').value;
		if(ParagraphText == '' || ParagraphText == null || ParagraphText.trim().length == 0)
		{
			alert('Please enter the Paragraph !');
			document.getElementById('ParagraphText').focus();
			return false;
		}
		var PartAHeader = document.getElementById('PartAHeader').value;
		if(PartAHeader == '' || PartAHeader == null || PartAHeader.trim().length == 0)
		{
			alert('Please enter the Part A Header !');
			document.getElementById('PartAHeader').focus();
			return false;
		}
		var PartAPart1Header = document.getElementById('PartAPart1Header').value;
		if(PartAPart1Header == '' || PartAPart1Header == null || PartAPart1Header.trim().length == 0)
		{
			alert('Please enter the Part A 1 Header !');
			document.getElementById('PartAPart1Header').focus();
			return false;
		}
		 PartAPart1Header = document.getElementById('PartAPart1QCount').value;
		 getCountValidate = 10 - PartAPart1Header; 
		for(var i = 1; i <= parseInt(PartAPart1Header); i++)
		{
			var partAques = document.getElementById('PartAPart1Q'+i).value;
			if(partAques == '' || partAques == null || partAques.trim().length <= 3)
			{
				alert('Please enter Part A - Part 1 question '+i+'.');
				document.getElementById('PartAPart1Q'+i).focus();
				return false;	
			}			
		}
		var PartAPart2Header = document.getElementById('PartAPart2Header').value;
		if(PartAPart2Header == '' || PartAPart2Header == null || PartAPart2Header.trim().length == 0)
		{
			alert('Please enter the Part A 2 Header !');
			document.getElementById('PartAPart2Header').focus();
			return false;
		}
		for(var i = 1; i <= parseInt(getCountValidate); i++)
		{
			var partBques = document.getElementById('PartAPart2Q'+i).value;
			if(partBques == '' || partBques == null || partBques.trim().length <= 3)
			{
				alert('Please enter Part A - Part 2 question '+i+'.');
				document.getElementById('PartAPart2Q'+i).focus();
				return false;	
			}			
		}
		
		var PartBHeader = document.getElementById('PartBHeader').value;
		if(PartBHeader == '' || PartBHeader == null || PartBHeader.length == 0)
		{
			alert('Please enter the Part B header !');
			document.getElementById('PartBHeader').focus();
			return false;
		}
		var partBQuestion = document.getElementById('partBQuestion').value;
		if(partBQuestion == '' || partBQuestion == null || partBQuestion.trim().length <= 3)
		{
			alert('Please enter the Part B question !');
			document.getElementById('partBQuestion').focus();
			return false;
		}
		var PartCHeader = document.getElementById('PartCHeader').value;
		if(PartCHeader == '' || PartCHeader == null || PartCHeader.trim().length == 0)
		{
			alert('Please enter the Part C Header !');
			document.getElementById('PartCHeader').focus();
			return false;
		}
		var PartCQuestion1 = document.getElementById('PartCQuestion1').value;
		if(PartCQuestion1 == '' || PartCQuestion1 == null || PartCQuestion1.trim().length <= 3)
		{
			alert('Please enter Part C - question 1 ');
			document.getElementById('PartCQuestion1').focus();
			return false;
		}
		var PartCQuestion2 = document.getElementById('PartCQuestion2').value;
		if(PartCQuestion2 == '' || PartCQuestion2 == null || PartCQuestion2.trim().length <= 3)
		{
			alert('Please enter Part C - question 2 ');
			document.getElementById('PartCQuestion2').focus();
			return false;
		}
		var PartCQuestion3 = document.getElementById('PartCQuestion3').value;
		if(PartCQuestion3 == '' || PartCQuestion3 == null || PartCQuestion3.trim().length <= 3)
		{
			alert('Please enter Part C - question 3 ');
			document.getElementById('PartCQuestion3').focus();
			return false;
		}

		document.getElementById('ParagraphTextLBL').innerHTML=document.getElementById("ParagraphText").value;  	
		
		document.getElementById('PartAHeaderLBL').innerHTML=document.getElementById("PartAHeader").value;  	

		document.getElementById('PartAPart1HeaderLBL').innerHTML=document.getElementById("PartAPart1Header").value;  	

		for(var i = 1; i < 10; i++)
		{
			document.getElementById('PartAPart1Q'+i+'ROW').style.display = "none";
			document.getElementById('partA'+i).style.display = "none";
			document.getElementById('PartAPart2Q'+i+'ROW').style.display = "none";
			document.getElementById('truFalse'+i).style.display = "none";				
		}

		for(var i = 1; i<= parseInt(PartAPart1Header); i++)
		{								
			document.getElementById('PartAPart1Q'+i+'ROW').style.display = "";
			document.getElementById('partA'+i).style.display = "";				
			document.getElementById('PartAPart1Q'+i+'LBL').innerHTML=document.getElementById("PartAPart1Q"+i).value;  	
		}
					
		document.getElementById('PartAPart2HeaderLBL').innerHTML=document.getElementById("PartAPart2Header").value;

		for(var j = 1; j<= parseInt(getCountValidate); j++)
		{			
			
			document.getElementById('PartAPart2Q'+j+'ROW').style.display="";
			document.getElementById('truFalse'+j).style.display = "";				
			document.getElementById('PartAPart2Q'+j+'LBL').innerHTML=document.getElementById("PartAPart2Q"+j).value;  	
		}

		document.getElementById('PartBHeaderLBL').innerHTML=document.getElementById("PartBHeader").value;  	

		document.getElementById('partBQuestionLBL').innerHTML=document.getElementById("partBQuestion").value;  	
		
		document.getElementById('PartCHeaderLBL').innerHTML=document.getElementById("PartCHeader").value;  	

		document.getElementById('PartCQuestion1LBL').innerHTML=document.getElementById("PartCQuestion1").value;  	

		document.getElementById('PartCQuestion2LBL').innerHTML=document.getElementById("PartCQuestion2").value;  	

		document.getElementById('PartCQuestion3LBL').innerHTML=document.getElementById("PartCQuestion3").value;  	

		document.getElementById('EditDetailsData').style.display="none"; 
		document.getElementById('displayPriviewDetails').style.display="";	
	}
	</script>
	<script type="text/javascript">
	function EditValidationField()
	{			
			document.getElementById('displayPriviewDetails').style.display="none";
			document.getElementById('EditDetailsData').style.display="";
	}
	</script>
	
	<script type="text/javascript">
	function confirmSubmitField()
	{
		if(confirm('Are you sure you want to add this test? It will be available to candidates immediately.'))
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	</script>

</head>
<body>
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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;"><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
	           <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">Administration </a>></font> 
	           <font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
					<a href="<%=recruitPath%>jsp/Admin_Disp_LanguageList.jsp">Manage Language Tests</a> >
			   </font>
	           <font class="nonLink">Add</font>
	           
	        </td>
	        <td align="right" class="recName" style="padding-right:10px;">
				<b><span class="username"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2">
	     </td>
	   </tr>
	   <tr>
	        <td colspan="2" style="height:10px;" align="center"><br/>
	        <!-- *************************************************************************** -->
	       <form action="<%=request.getContextPath()%>/addLanguageTest" name="addLanguageTest" id="addLanguageTest" method="post" autocomplete="off">
		<div id="EditDetailsData">	  
	        <table border="0" cellpadding="6" cellspacing="6">
	        	<tr>
	        		<th colspan="4" class="classlangTestleft_TD">Add New Language Test</th>
	        	</tr>
	        	<tr>
	        		<td class="classlangTestleft_TD">Test Name</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="TestNameDiv">
	        			<input type="text" name="TestName" id="TestName" class="inputText" value="Recruitment Test" onkeypress="return AllowChars(event);"/>
					</div>
	        		</td>
	        	</tr>
	        	<tr>	
	        		<td class="classlangTestleft_TD">Paragraph</td>
	        		
	        		<td colspan="3" class="classlangTestright_TD"> 
	        		<div id="ParagraphTextDIV">
	        		<textarea name="ParagraphText" id="ParagraphText" style=" height: 128px; width: 656px; resize: none;"></textarea> 
	        		</div>
	        		</td>
	        		
	        	</tr>
	        	<tr>
	        		<th colspan="4" class="classlangTestleft_TD">Part A</th>
	        	</tr>
	        	<tr>
	        		<td class="classlangTestleft_TD"><b>Part A Header</b></td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAHeaderDIV">	
	        			<input type="text" name="PartAHeader" id="PartAHeader" class="inputText" value="Read the passage carefully and answer the questions that follow: (10 marks)" onkeypress="return AllowChars(event);"/>
	        		</div>
	        		
	        		</td>
	        	</tr>
	        	<tr>
	        		<th colspan="4" class="classlangTestleft_TD">Part A - Part 1</th>
	        	</tr>
	        	<tr>
	        		<td class="classlangTestleft_TD"><b>Part 1 Header</b></td>
	        		<td class="classlangTestright_TD">
	        		<div id="PartAPart1HeaderDIV">
	        			<input type="text" name="PartAPart1Header" id="PartAPart1Header" class="inputText" value="1. Find words from the passage:" onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        		<td class="classlangTestleft_TD">Number of Questions</td>
	        		<td class="classlangTestright_TD">
					<div id="PartAPart1QCountDIV">
						<select name="PartAPart1QCount" id="PartAPart1QCount" onchange="return getQuestionNumber(this);" class="inputText">
							<option value="1">1</option>
							<option value="2">2</option>							
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8" selected="selected">8</option>
							<option value="9">9</option>
						</select>
					</div>
					</td>
	        	</tr>
	        	<tr id="rowA1">
	        		<td class="classlangTestleft_TD">Enter question 1</td>
	        		<td colspan="3" class="classlangTestright_TD">
					<div id="PartAPart1Q1DIV">
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q1" class="inputText" value="a) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	        	<tr id="rowA2">
	        		<td class="classlangTestleft_TD">Enter question 2</td>
	        		<td colspan="3" class="classlangTestright_TD">
					<div id="PartAPart1Q2DIV">
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q2" class="inputText" value="b) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	        	<tr id="rowA3">
	        		<td class="classlangTestleft_TD">Enter question 3</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart1Q3DIV">	
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q3" class="inputText" value="c) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        		
	        	</tr>
    			<tr id="rowA4"> 
	        		<td class="classlangTestleft_TD">Enter question 4</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart1Q4DIV">
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q4" class="inputText" value="d) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	    	    <tr id="rowA5">
	        		<td class="classlangTestleft_TD">Enter question 5</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart1Q5DIV">
	        		<input type="text" name="PartAPart1Q" id="PartAPart1Q5" class="inputText" value="e) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	    	    <tr id="rowA6">
	        		<td class="classlangTestleft_TD">Enter question 6</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart1Q6DIV">
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q6" class="inputText" value="f) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	
	        	</tr>
	        	<tr id="rowA7">
	        		<td class="classlangTestleft_TD">Enter question 7</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart1Q7DIV">
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q7" class="inputText" value="g) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
    			<tr id="rowA8">
	        		<td class="classlangTestleft_TD">Enter question 8</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart1Q8DIV">
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q8" class="inputText" value="h) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	    	    <tr id="rowA9" style="display:none;">
	        		<td class="classlangTestleft_TD">Enter question 9</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart1Q9DIV">
	        			<input type="text" name="PartAPart1Q" id="PartAPart1Q9" class="inputText" value="i) " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th colspan="4" class="classlangTestleft_TD">Part A - Part 2</th>
	        	</tr>
	        	<tr>
	        		<td class="classlangTestleft_TD"><b>Part 2 Header</b></td>
	        		<td class="classlangTestright_TD">
	        		<div id="PartAPart2HeaderDIV">
	        			<input type="text" name="PartAPart2Header" id="PartAPart2Header" class="inputText" value="2. State true or false:" onkeypress="return AllowChars(event);"/>
					</div>						      			
	        		</td>
					
					<td class="classlangTestleft_TD">Number of Questions</td>
					<td class="classlangTestright_TD"><label id="dispQuesNo" style="font-size: 14px; color: #000000; text-align: right;">2</label> </td>
	        	</tr>
	        	<tr id="rowB1">
	        		<td class="classlangTestleft_TD">Enter question 1</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q1DIV">
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q1" class="inputText" value="a. " onkeypress="return AllowChars(event);"/>
	 				</div>
	        		</td>
	        	</tr>
	        	<tr id="rowB2">
	        		<td class="classlangTestleft_TD">Enter question 2</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q2DIV">
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q2" class="inputText" value="b. " onkeypress="return AllowChars(event);"/>
					</div>	        			
	        		</td>
	        	</tr>
	        	<tr id="rowB3" style="display:none;">
	        		<td class="classlangTestleft_TD">Enter question 3</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q3DIV">	
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q3" class="inputText" value="c. " onkeypress="return AllowChars(event);"/>
	 				</div>
	        		</td>
	        	</tr>
    			<tr id="rowB4" style="display:none;"> 
	        		<td class="classlangTestleft_TD">Enter question 4</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q4DIV">
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q4" class="inputText" value="d. " onkeypress="return AllowChars(event);"/>
	 				</div>
	        		</td>
	        	</tr>
	    	    <tr id="rowB5" style="display:none;">
	        		<td class="classlangTestleft_TD">Enter question 5</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q5DIV">
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q5" class="inputText" value="e. " onkeypress="return AllowChars(event);"/>
					</div>	        			
	        		</td>
	        	</tr>
	    	    <tr id="rowB6" style="display:none;">
	        		<td class="classlangTestleft_TD">Enter question 6</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q6DIV">
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q6" class="inputText" value="f. " onkeypress="return AllowChars(event);"/>
					</div>	        			
	        		</td>
	        	</tr>
	        	<tr id="rowB7" style="display:none;">
	        		<td class="classlangTestleft_TD">Enter question 7</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q7DIV">
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q7" class="inputText" value="g. " onkeypress="return AllowChars(event);"/>
					</div>	        			
	        		</td>
	        	</tr>

    			<tr id="rowB8" style="display:none;">
	        		<td class="classlangTestleft_TD">Enter question 8</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartAPart2Q8DIV">
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q8" class="inputText" value="h. " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	    	    <tr id="rowB9" style="display:none;">
	        		<td class="classlangTestleft_TD">Enter question 9</td>
	        		<td colspan="3" class="classlangTestright_TD">
					<div id="PartAPart2Q9DIV">	        			
	        			<input type="text" name="PartAPart2Q" id="PartAPart2Q9" class="inputText" value="i. " onkeypress="return AllowChars(event);"/>
					</div>	        			
	        		</td>
	        	</tr>
	        	<tr>
	        		<th colspan="4" class="classlangTestleft_TD">Part B</th>
	        	</tr>	
				<tr>
	        		<td class="classlangTestleft_TD"><b>Part B Header</b></td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartBHeaderDIV">	
	        			<textarea rows="2" name="PartBHeader" id="PartBHeader" class="inputText" style="resize: none;">Instruction to the candidate – Please keep in mind sentence construction, while answering the question. 
Read the above passage and answer the questions given below in your own words. Write between 80 to 90 words. (10 marks)</textarea>
	        		</div>
	        		</td>
	        	</tr>	        	    
				<tr id="rowpartB">
	        		<td class="classlangTestleft_TD">Enter Question</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="partBQuestionDIV">
	        			<input type="text" name="PartBQuestion" id="partBQuestion" class="inputText" value="a. " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<th colspan="4" class="classlangTestleft_TD">Part C</th>
	        	</tr>	
				<tr>
	        		<td class="classlangTestleft_TD"><b>Part C Header</b></td>
	        		<td colspan="3" class="classlangTestright_TD">
	        			<div id="PartCHeaderDIV">
	        				<textarea rows="2" name="PartCHeader" id="PartCHeader" class="inputText" style="resize: none;">Write a passage on any one of the following topics in your own words (80 to 90 words) (10 marks).</textarea>
	        			</div>
	        		</td>
	        	</tr>	        	    
				<tr id="rowpartC">
	        		<td class="classlangTestleft_TD">Enter Question 1</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartCQuestion1DIV">
	        			<input type="text" name="PartCQuestion" id="PartCQuestion1" class="inputText" value="a. " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	        	<tr id="rowpartC">
	        		<td class="classlangTestleft_TD">Enter Question 2</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartCQuestion2DIV">
	        			<input type="text" name="PartCQuestion" id="PartCQuestion2" class="inputText" value="b. " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
	        	<tr id="rowpartC">
	        		<td class="classlangTestleft_TD">Enter Question 3</td>
	        		<td colspan="3" class="classlangTestright_TD">
	        		<div id="PartCQuestion3DIV">
	        			<input type="text" name="PartCQuestion" id="PartCQuestion3" class="inputText"value="c. " onkeypress="return AllowChars(event);"/>
	        		</div>
	        		</td>
	        	</tr>
				<tr id="Addbutton">
					<td colspan="4" align="center">
						<div align="center">		
							<input type="button" name="AddQuestion" value="Preview" class="buttonMedium" onclick="return chkLangValidation();"/>
						</div>					
					</td>
				</tr>
	        	
	        </table>
</div>
        
	<div id="displayPriviewDetails"  class="demo" style="width: 700px; display: none;">
		<table>	
			<tr>
				<td class="theader" height="32px;">
					<div style="float: left; font-size: 13px; font-weight: bold; font: Verdana,Arial,sans-serif; padding-left: 5px;" >
						Read the below passage and answer Part A, Part B and Part C
					</div>
					<div style="float: right;font-size: 13px; font-weight: bold; Verdana,Arial,sans-serif;">
						Time Remaining
						<input id="disp" type="text" style="border: 0px ; color: white; font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight: bold;background-color: #666666;" size="5" readonly="readonly" name="disp" value="20:00"/>
					</div>				
				</td>
			</tr>
			<tr>
				<td align="center">
					<textarea class="quest_output" id="ParagraphTextLBL" style="resize: none; width: 700px; height: 200px; overflow-x: hidden; background-color: white; text-align: justify;" readonly="readonly" onKeyDown="return nocopypaste(event)" oncopy="return false" onpaste="return false" oncut="return false"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">					
<div id="displayQuestion" style="width: 700px;">
<div class="demo" style="width: 700px; padding-top: 5px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px;">
<div id="tabs">
	<ul>
		<li><a href="#tabs-1"><b>Part A</b></a></li>
		<li><a href="#tabs-2"><b>Part B</b></a></li>
		<li><a href="#tabs-3"><b>Part C</b></a></li>
	</ul>
	<!-- ==================================     START  tabs-2 Language PArt A       ==================================        -->
	<div id="tabs-1">
				<table border="0" style="width: 100%;">
					<tr>
									<td colspan="3" align="left" style="font-size: 12px; font-weight: bold;">
										
										<label id="PartAHeaderLBL"></label>
										
									</td>
								</tr>
								<tr>						
									<td colspan="3" align="left" style="font-size: 12px; font-weight: bold;">										
										<label id="PartAPart1HeaderLBL"></label>				        							
									</td>
								</tr>
								<tr id="PartAPart1Q1ROW">
									<td>
										<label id="PartAPart1Q1LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA1" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
									
								</tr>
								<tr id="PartAPart1Q2ROW">
									<td>
										<label id="PartAPart1Q2LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA2" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
								</tr>
								<tr id="PartAPart1Q3ROW">
									<td>
										<label id="PartAPart1Q3LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA3" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
										        		
								</tr>
								<tr id="PartAPart1Q4ROW"> 
									<td>
										<label id="PartAPart1Q4LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA4" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
									
								</tr>
								<tr id="PartAPart1Q5ROW">
									<td>
										<label id="PartAPart1Q5LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA5" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
									
								</tr>
								<tr id="PartAPart1Q6ROW">
									<td>
										<label id="PartAPart1Q6LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA6" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>	        	
								</tr>
								<tr id="PartAPart1Q7ROW">
									<td>	        		
										<label id="PartAPart1Q7LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA7" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
									
								</tr>
								<tr id="PartAPart1Q8ROW">
									<td>	        		
										<label id="PartAPart1Q8LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA8" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
									
								</tr>
								<tr id="PartAPart1Q9ROW">
									<td >
										<label id="PartAPart1Q9LBL"></label>
									</td>
									<td align="left"><input type="text" name="partA1" id="partA9" class="bgCol" maxlength="50" readonly="readonly" style="display: none;"/></td>
									<td></td>
									
								</tr>
								<tr></tr>
								<tr>
									<td colspan="3" align="left" style="font-size: 12px; font-weight: bold;">
										<label id="PartAPart2HeaderLBL"></label>
									</td>
								</tr>
								<tr></tr>
								
								<tr id="PartAPart2Q1ROW">
									<td colspan="3">
										<label id="PartAPart2Q1LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse1" style="display: none;">
									<td colspan="3" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
																
								<tr id="PartAPart2Q2ROW">
									<td colspan="3">
										<label id="PartAPart2Q2LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse2" style="display: none;">
									<td colspan="2" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
								<tr id="PartAPart2Q3ROW">
									<td>
										<label id="PartAPart2Q3LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse3" style="display: none;">
									<td colspan="2" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
								<tr id="PartAPart2Q4ROW">
									<td colspan="3">
										<label id="PartAPart2Q4LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse4" style="display: none;">
									<td colspan="3" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
								<tr id="PartAPart2Q5ROW">
									<td colspan="3">
										<label id="PartAPart2Q5LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse5" style="display: none;">
									<td colspan="3" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
								<tr id="PartAPart2Q6ROW">
									<td colspan="3">
										<label id="PartAPart2Q6LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse6" style="display: none;">
									<td colspan="3" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
								<tr id="PartAPart2Q7ROW">
									<td colspan="3">
										<label id="PartAPart2Q7LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse7" style="display: none;">
									<td colspan="3" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
								<tr id="PartAPart2Q8ROW">
									<td colspan="3">
										<label id="PartAPart2Q8LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse8" style="display: none;">
									<td colspan="3" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
								<tr id="PartAPart2Q9ROW">
									<td colspan="3">
										<label id="PartAPart2Q9LBL"></label>
									</td>									
								</tr>
								<tr id="truFalse9" style="display: none;">
									<td colspan="3" nowrap="nowrap">
										<input type="radio" name="truFalse" id="truFalse" value="True" disabled="disabled"/> True 
										<input type="radio" name="truFalse" id="truFalse" value="False" disabled="disabled"/> False
									</td>
								</tr>
					
			</table>
	</div>
	<!-- ==================================     END    tabs-2 Language PArt A       ==================================        -->

	<!-- ==================================     START  tabs-3 Language PArt B       ==================================        -->
	<div id="tabs-2">
		<table>			
			<tr>				
				<td align="left" style="font-weight: bold; font-size: 12px;">
	        		<label id="PartBHeaderLBL"></label>	        		
				</td>				
			</tr>
			<tr>
				<td align="left" >
		        	<label id="partBQuestionLBL"></label>
				</td>
			</tr>
			
			<tr>
				<td><textarea name="partBQ" id="partBQ" class="setBgStyple" style="resize: none;border;0px; width: 660px; height: 150px; text-align: left;" oncopy="return false" onpaste="return false" oncut="return false" readonly="readonly" disabled="disabled"></textarea></td>
			</tr>
		</table>
	</div>
	<!-- ==================================     END  tabs-3 Language PArt B       ==================================        -->


	<!-- ==================================     START  tabs-4 Language PArt C       ==================================        -->
	<div id="tabs-3">	
	<table>
	<tr>
		<td align="left" style="font-weight: bold; font-size: 12px;">
		  	<label id="PartCHeaderLBL"></label>
		</td>
	</tr>
	
	<tr>
		<td>
		  	<label id="PartCQuestion1LBL"></label>
		</td>
	</tr>
	
	<tr>
		<td>
			<label id="PartCQuestion2LBL"></label>
		</td>
	</tr>
	
	<tr>
		<td>
			<label id="PartCQuestion3LBL"></label>
		</td>
	</tr>
	
	<tr>
		<td><textarea name="partCQ" id="partCQ" class="setBgStyple" disabled="disabled" readonly="readonly"></textarea></td>
	</tr>
	
	</table>
	</div>
	<!-- ==================================     END  tabs-4 Language PArt C       ==================================        -->

</div>
</div>
	<table style="width: 700px;">
		<tr id="Confirmation">
				<td colspan="2" align="left">					
					<div id="Editbutton" align="left">
						<input type="button" name="EditQuestion" class="buttonMedium" value="Edit" onclick="return EditValidationField();"/>
					</div>
				</td>
				<td colspan="2" align="right">
					<div id="Confirmbutton" align="right">
						<input type="submit" name="Confirm" value="Confirm" class="buttonMedium" onclick="return confirmSubmitField();"/>
					</div>
				</td>
		</tr>		
	</table>	
</div>
<!--******************************************************* End TAB CODE ****************************************************************** -->
				</td>
			</tr>		
		</table>
	</div>
</form>	
</td>
</tr>
<tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	     <tr class="footerBackColor" >
	       <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						     %>
						     <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						   <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						  <%
						   }
						   %>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
							<%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						    %>
						    <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						  <%
						   }
						   %>
						   
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