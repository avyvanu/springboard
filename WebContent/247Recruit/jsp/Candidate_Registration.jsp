<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>My JSP 'Recruiter_Sim_Option.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	
	<!-- Plugins for calender -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/epoch_styles.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/epoch_classes.js"></script>
	<script type="text/javascript">
		/*You can also place this code in a separate file and link to it like epoch_classes.js*/
	var dp_cal, dp_cal_year;      
	window.onload = function ()
	{	
		dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('dob'));
		dp_cal_year  = new Epoch('epoch_popup','popup',document.getElementById('popup_container_year'));
	};
</script>
<script type="text/javascript">

function checkAge()
{

var today = new Date();
var d = document.getElementById("dob").value;
if (!/\d{4}\-\d{2}\-\d{2}/.test(d))
{ // check valid format
showMessage();
return false;
}

d = d.split("-");
var byr = parseInt(d[0]);
var nowyear = today.getFullYear();
if (byr >= nowyear || byr < 1900)
{ // check valid year
showMessage();
return false;
}
var bmth = parseInt(d[1],10)-1; // radix 10!
if (bmth <0 || bmth >11)
{ // check valid month 0-11
showMessage();
return false;
}
var bdy = parseInt(d[2],10); // radix 10!
var dim = daysInMonth(bmth+1,byr);
if (bdy <1 || bdy > dim)
{ // check valid date according to month
showMessage();
return false;
}

var age = nowyear - byr;
var nowmonth = today.getMonth();
var nowday = today.getDate();
var age_month = nowmonth - bmth;
var age_day = nowday - bdy;
if (age < 18 )
{
alert ("We're sorry but thesite.com won't allow children under 18 years old to login.");
}
else if (age == 18 && age_month <= 0 && age_day <0)
{
alert ("We're sorry but thesite.com won't allow children under 18 years old to login.");
}


}

function showMessage()
{
if (document.getElementById("dob").value != "")
{
alert ("Invalid date format or impossible year/month/day of birth - please re-enter as YYYY-MM-DD");
document.getElementById("dob").value = "";
document.getElementById("dob").focus();
}
}

function daysInMonth(month,year) { // months are 1-12
var dd = new Date(year, month, 0);
return dd.getDate();
}
</script>
	
<script type="text/javascript">
	function showOption(value)
	{
		if (value == "Yes")
	   	{
	  		document.getElementById('displayExpOnChange').style.display="";
	   		
	   	}
	   	else
	   	{
	   		document.getElementById('displayExpOnChange').style.display="none";
	    }
	}
	function submitForm()
	{
	    
		
	}	
	
</script>
<script type="text/javascript">
function chkRegistrationValidation()
{
	if(document.getElementById("title").value =='')
	{
		var appStr = 'Please Select Title !';
		alert(appStr);
		document.getElementById('title').focus();
		return false;
	
	}
	else	
	if(document.getElementById("firstName").value=='')
	{
		var appStr = 'Please Enter First Name !';		
		alert(appStr);
		document.getElementById('firstName').focus();
		return false;
	}
	else
	if(document.getElementById("lastName").value=='')
	{
		var appStr = 'Please Enter Last Name !';		
		alert(appStr);
		document.getElementById('lastName').focus();
		return false;
	}
	else
	if(document.getElementById("dob").value=='')
	{
		var appStr = 'Please Enter DOB !';
		
		alert(appStr);
		document.getElementById('dob').focus();
		return false;
	}
	else
	if ( ( candidateSubmitForm.radiobutton[0].checked == false ) && ( candidateSubmitForm.radiobutton[1].checked == false ) ) 
	{ 
		 alert ( "Please choose your Gender: Male or Female" );
		 return false;
    } 
	else 
	if ( candidateSubmitForm.nativeState.selectedIndex == 0 ) 
	{ 
		alert ( "Please select your Native !" ); 
		return false; 
	}
 
	else 
	if(document.getElementById("Email_id").value=='')
	{
		var appStr = 'Please Enter Email Id !';
		
		alert(appStr);
		document.getElementById('Email_id').focus();
		return false;
	}
	else
	if(document.getElementById("mobile").value=='')
	{
		var appStr = 'Please Enter Mobile No !';
		
		alert(appStr);
		document.getElementById('mobile').focus();
		return false;
	}
	//////////////////////////////////////////////////
	else
	if(document.getElementById("SchoolName").value=='')
	{
		var appStr = 'Please Enter School Name !';
		
		alert(appStr);
		document.getElementById('SchoolName').focus();
		return false;
	}
	
	else 
	if(candidateSubmitForm.Qualification.selectedIndex == 0) 
	{ 
		alert ( "Please select your Qualification !" ); 
		return false; 
	}
	else
	if(document.getElementById("Course").value=='')
	{
		var appStr = 'Please Enter Course !';
		
		alert(appStr);
		document.getElementById('Course').focus();
		return false;
	}
	else
	if(document.getElementById("Studied").value=='')
	{
		var appStr = 'Please Enter Subjects Studied  !';
		
		alert(appStr);
		document.getElementById('Studied').focus();
		return false;
	}
	else
	if(document.getElementById("popup_container_year").value=='')
	{
		var appStr = 'Please Completion of Year !';		
		alert(appStr);
		document.getElementById('popup_container_year').focus();
		return false;
	}
	else
	if(document.getElementById("University").value=='')
	{
		var appStr = 'Please Enter University Name !';		
		alert(appStr);
		document.getElementById('University').focus();
		return false;
	}
	else
	if(document.getElementById("ClassPer").value=='')
	{
		var appStr = 'Please Enter Class Percentage !';		
		alert(appStr);
		document.getElementById('ClassPer').focus();
		return false;
	}
	else
	if ((candidateSubmitForm.redioYes[0].checked == false ) && ( candidateSubmitForm.redioYes[1].checked == false)) 
	{ 
		 alert ("Please choose your Work Experience : Yes or No !");
		 return false;
    }
    else
	if ((candidateSubmitForm.redioYes[0].checked == true )) 
	{ 
		 
		 if(document.getElementById("RelevantExprience").value=='')
	     {
			var appStr = 'Please Enter Relevant Exprience !';		
			alert(appStr);
			document.getElementById('RelevantExprience').focus();
			return false;
		 }
		 else
		 if(document.getElementById("NONRelevantExprience").value=='')
	     {
			var appStr = 'Please Enter NON Relevant Exprience !';		
			alert(appStr);
			document.getElementById('NONRelevantExprience').focus();
			return false;
		 }
		 else
		 if(document.getElementById("PriviousORG").value=='')
	     {
			var appStr = 'Please Enter Privious ORG Name !';		
			alert(appStr);
			document.getElementById('PriviousORG').focus();
			return false;
		 }
    } 
      
	else 
	if(candidateSubmitForm.PrimarySource.selectedIndex == 0) 
	{ 
		alert ( "Please select your Primary Source !" ); 
		return false; 
	}
	
}

</script>
 	
</head>
<body>
<fieldset>
<form action="<%=request.getContextPath()%>/CandidateRegis" method="post" name="candidateSubmitForm" onsubmit="return chkRegistrationValidation();">
<input type="hidden" name="target" id="target" value="CandidateRegis"/>
				<!--  Personaml Information Registration Form Table Start -->
					
					<table width="100%" class="tBackColor" cellpadding="5" style="-moz-border-radius:12px;"; >
						<tr>
							<td align="left">
								<b>Personaml Information Registration Form</b>
							</td>
						</tr>
					</table>
				    <table width="100%" border="0"  cellpadding="6" cellspacing="1">
						 <tr class="allBackColor">
							<td width="25%">
								Title <span class="redTxt">*</span>
							</td>
							<td width="25%">
								First Name <span class="redTxt">*</span>								
							</td>
							<td width="25%">
								Middle Name / Initial
							</td>
							<td width="25%">
								Last Name / Surname <span class="redTxt">*</span>
							</td>
						 </tr>
						<tr class="allBackColor">
							<td class="allTdBackColor" width="25%">
								<div class="txt-box">
									<select name="title" id="title" class="reSizeforOther">
									    <option value="">Select</option>
										<option value="Mr">Mr.</option>
										<option value="Mrs">Mrs.</option>
										<option value="Miss">Miss.</option>
										<option value="Dr">Dr.</option>
									</select>
								</div>
							</td>
							<td width="25%" class="allTdBackColor">
								<div>
									<input type="text" name="firstName" id="firstName" class="reSizeforOther"/>
								</div>
								<span id="mail_id" class="redTxt"></span>
							</td>
							<td width="25%" class="allTdBackColor">
								<div>
									<input type="text" name="middleName" id="middleName" class="reSizeforOther"/>
								</div>
							</td>
							<td width="25%" class="allTdBackColor">
								<div>
									<input type="text" name="lastName" id="lastName" class="reSizeforOther"/>
								</div>
							</td>
						</tr>
						<tr>
							<td width="25%" class="allBackColor">
								Date of Birth <span class="redTxt">*</span>
							</td>
							<td width="25%" class="allBackColor">
								<div>
								    <div id="basic_container" style="display:none"></div>
									<input type="text" id="dob" class="reSizeforOther"  name="dob" onblur = "checkAge()"/>
									<div id="multi_container" style="display:none"></div>
                                </div>
								<span id="uname_id"></span>
							</td>
							<td width="25%" class="allTdBackColor">
								&nbsp;
							</td>
							<td width="25%" class="allTdBackColor">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="25%" class="allBackColor">
								Gender <span class="redTxt">*</span>
							</td>
							<td width="25%"  class="allTdBackColor">
								<div>			  
								   <input name="radiobutton" value="Male" type="radio" id="radiobutton"> Male
                             	   <input name="radiobutton" value="Female" type="radio" id="radiobutton"> Female							
							    </div>
								<span id="country_id" ></span>
							</td>
							<td width="25%" class="allBackColor">
								Native State<span class="redTxt">*</span>
							</td>
							<%
							Connection con=null;
							Statement stmt=null;
							ResultSet rs=null;
							String state=null;
							String stateCode=null;
							try
							{
								String queryForState="SELECT * FROM bpo_state_lookups";
								con=ConnectDatabase.getConnection();
								stmt=con.createStatement();
								rs=stmt.executeQuery(queryForState);								
						
							 %>
							
							<td width="25%"  class="allTdBackColor">
								<select name="nativeState" id="nativeState" class="reSizeforOther">
									<option value="">Select </option>
									
									<%
									while(rs.next())
								    {								
									 %>
										<option value="<%=rs.getString(2)%>"><%=rs.getString(3)%></option>
									 <%
									}
									%>
								</select>
							</td>
							
							<%								
							}
							catch(Exception ex)
							{
								System.out.println("Error Message Display : "+ex.getMessage());
								ex.printStackTrace();
							}
							%>
							
						</tr>
						<tr>
							<td width="25%" class="allBackColor">
								Email id <span class="redTxt">*</span>
							</td>
							<td width="25%"  class="allTdBackColor">
								<div>
									<input type="text" name="Email_id" id="Email_id" maxlength="240" class="reSizeforOther"/>
								</div>
								<span id="state_id"></span>
							</td>
							<td width="25%" class="allBackColor">
								Phone / Mobile<span class="redTxt">*</span>
							</td>
							<td width="25%"  class="allTdBackColor">
								<div >
									<input type="text" name="mobile" id="mobile" maxlength="10" class="reSizeforOther"/>
								</div>
							</td>
						</tr>



						<tr class="allTdBackColor">
							<td colspan="4" width="25%">
								&nbsp;
							</td>
						</tr>
					</table>
					<!-- Personaml Information Registration Form Table E -->
						<table width="100%" class="tBackColor"  cellpadding="6" cellspacing="1" style="-moz-border-radius:12px;";>
							<tr>
								<td align="left" width="25%">
									<b>Highest Education</b> 
								</td>
							</tr>
						</table>

					<table width="100%" cellpadding="6" cellspacing="1">
						<tr class="allBackColor">
							<td width="20%" height="52" align="left" nowrap="nowrap">
								School/ Institute Name <span class="redTxt">*</span>
							</td>
							<td width="20%" align="left" nowrap="nowrap">
								Qualification <span class="redTxt">*</span>
							</td>
							<td width="20%" align="left" nowrap="nowrap">
								Course (BBM,BBA,BE.) <span class="redTxt">*</span>
							</td>
							<td width="20%" align="left" nowrap="nowrap">
								Subjects Studied <span class="redTxt">*</span>
							</td>
							<td width="20%" align="left" nowrap="nowrap">
								Year of Completion <span class="redTxt">*</span>
							</td>
							<td width="20%" align="left" nowrap="nowrap">
								Board / University <span class="redTxt">*</span>
							</td>
							<td width="20%" align="left" nowrap="nowrap">
								Class in % <span class="redTxt">*</span>
							</td>

						</tr>
						<tr class="allTdBackColor">
							<td align="left" width="20%">
								<div>
									<input type="text" name="SchoolName" id="SchoolName" class="reSize" />
								</div>
							</td>
							<td align="left" width="20%">
								<div>
									
									<select id="Qualification" name="Qualification" class="reSize" >
										<option value="">Select</option>
										<option value="0"> Diploma </option>
										<option value="56"> Grad-Arts </option>
										<option value="0"> Grad-Business </option>
										<option value="0"> Grad-Commerce </option>
										<option value="56"> Grad-Computers </option>
										<option value="0"> Grad-Engineering </option>
										<option value="56"> Grad-Science </option>
										<option value="0"> Post-Grad </option>
										<option value="56"> Under-Grad </option>
										
									</select>
								</div>
							</td>
							<td align="left" width="20%">
								<div>
									<input type="text" name="Course" id="Course" class="reSize"/>
								</div>
							</td>
							<td align="left" width="20%">
								<div>
									<input type="text" name="Studied" id="Studied" class="reSize"/>
								</div>
							</td>
							<td align="left" width="20%">
								<div>
									<input type="text" name="CompletionYear" id="popup_container_year" class="reSize"/>
								</div>
							</td>
							<td align="left" width="20%">
								<div>
									<input type="text" name="University" id="University" class="reSize"/>
								</div>
							</td>
							<td align="left" width="20%">
								<div>
									<input type="text" name="ClassPer" id="ClassPer" class="reSize"/>
								</div>
							</td>

						</tr>
					</table>


					<table width="100%" border="0">

					</table>

				

				

				<table width="100%" cellpadding="6" cellspacing="1">
					<tr>
						<td width="22%" class="allBackColor">
							Current Skill Set
						</td>
						<td width="28%" class="allTdBackColor">
							<select name="CurrentSkill" class="reSizeforOther" id="CurrentSkill">
								<option value="-">Select</option>
								<option value="V">voice</option>
								<option value="NV">Non voice</option>
								<option value="NVV">Non voice & Voice</option>
								<option value="F">Fresher</option>
							</select>
						</td>
						<td width="17%" class="allBackColor">
							Applying For
						</td>
						<td width="33%" class="allTdBackColor">
							<select name="ApplyingFor" class="reSizeforOther" id="ApplyingFor">
							    <option value="-">Select</option>
							    <option value="TSE"> Technical Support Executive (voice)</option>							   
								<option value="CSE">Customer Support Executive (voice)</option>
								<option value="SIMA">Social and Interactive Media Advisor (Non-voice)</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="allBackColor">
							Work Experience <span class="redTxt">*</span>
						</td>
						<td colspan="3" class="allTdBackColor">
							<label>
							       <input name="redioYes" value="Yes" type="radio" id="redioYes" onclick="showOption(this.value);"> Yes
                             	   <input name="redioYes" value="No" type="radio" id="redioYes" onclick="showOption(this.value);"> No						
							</label>
						</td>

					</tr>
					</table>
					
					<div id="displayExpOnChange" style="display: none;">
					<table width="100%" cellpadding="6" cellspacing="1">
					<tr>
						<td class="allBackColor">
							Relevant Experience <span class="redTxt">*</span>
						</td>
						<td class="allTdBackColor">
							<input type="text" name="RelevantExprience" id="RelevantExprience" maxlength="60" class="reSizeforOther"/>
						</td>
						<td class="allTdBackColor"></td>
						<td class="allTdBackColor"></td>
					</tr>
					
					<tr>
						<td class="allBackColor">
							Non Relevant Experience <span class="redTxt">*</span>
						</td>
						<td class="allTdBackColor">
							<input type="text" name="NONRelevantExprience" id="NONRelevantExprience" maxlength="60" class="reSizeforOther"/>
						</td>
						<td class="allTdBackColor">
							Name of Prev Org <span class="redTxt">*</span>
						</td>
						<td class="allTdBackColor">
							<input type="text" name="PriviousORG" id="PriviousORG" maxlength="60" class="reSizeforOther"/>
						</td>
					</tr>
				</table>
				</div>
					
					
					<table width="100%" cellpadding="6" cellspacing="1">
					 <tr>
						<td class="allBackColor">
							Primary Source <span class="redTxt">*</span>
						</td>
						<td class="allTdBackColor">
							<select name="PrimarySource" class="reSizeforOther" id="PrimarySource">								
								<option value="">---Select---</option>
								<option value="0">Advt</option>
								<option value="58">Consultant</option>
								<option value="43">E-Recruitment</option>
								<option value="58">Jobfair</option>
								<option value="0">Referal</option>
								<option value="0">Re-Join</option>
								<option value="0">SMS Blast</option>
								<option value="0">Walking</option>
								<option value="43">WebSite</option>
								
							</select>
						</td>
						<td colspan="2" class="allTdBackColor">
							<input type="text" name="lastName6" id="lastName6" maxlength="60"
								value="Based on Primary Source show sub selection option out here" class="reSizeforOtherSpc"/>
						</td>

					</tr>
					<tr>
						<td class="allBackColor">
							Declaration
						</td>
						<td colspan="3" class="allTdBackColor">
							<label>
								<input type="checkbox" name="checkbox" value="1">
							</label>
							All the Information furnished by me is correct in all aspects ,
							and i take responsbility for the authencity of the same.

						</td>

					</tr>
					<tr class="allTdBackColor">
						<td colspan="2">
							<input type="reset" name="reset" value="" class="cancel"/>

						</td>

						<td align="right" colspan="2">
							<input type="submit" name="submit" value="" class="submit" onclick="return chkRegistrationValidation(this.form);"/>
						</td>
					</tr>
				</table>
			
</form>
</fieldset>
</body>
	
</html>
