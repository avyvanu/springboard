<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="GlobalDeclare.jsp" %>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	
	<!-- POP UP CSS -->
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/msgPOPUP.css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/msgPOPUP.js"></script>
	
	
	<!-- Plugins for calender -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/epoch_styles.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/epoch_classes.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>
	
	<script type="text/javascript"></script>
	
	<!-- Start Javascript for Test Fiels Blur Data -->
	<script type="text/javascript">
		function ReFocus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmta"; } } function Focus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "nta"; } } function Blur(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmta"; } else { obj.className = "nta"; } } function ReFocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmtr"; } } function FocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "ntr"; } } function BlurR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmtr"; } else { obj.className = "ntr"; } }
	</script>


	<!-- End Javascript for Test Fiels Blur Data -->
	<!-- jQuery for Datepicker -->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css"	rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />

 	<script src="<%=request.getContextPath() %>/247Recruit/Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/247Recruit/Scripts/jquery_tinywatermark-3_1_0.js" type="text/javascript"></script>
    
<style type="text/css">
html,body,form
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
    width: 100%;
    vertical-align: middle;
}
.wrapper
{
	margin: 0 auto;
   	width: 100%;
}
.w100p
{
	width: 100%;
}
.tPersonal
{
	width: 930px;
}

.close
{
	background:url("<%=request.getContextPath()%>/247Recruit/images/delO.png") no-repeat scroll 0 0 transparent;    
	cursor:pointer;
	float:right;
	position:absolute;
	right:0px;
	top:2px;
	width: 20px;
	height: 20px;
} 
</style>
   
<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	
			<!-- End jQuery for Datepicker -->
   		
<%
							Connection con=null;
							Statement stmt, fatchsqlDateSt, stQualification,stcurrentskill=null;
							ResultSet rs, fatchsqlDateRs,rsLocation,rsQualification,rscurrentskill =null;
							String state =null;
							String stateCode=null;
							String fectSqlString18=null;
							String fectSqlString58=null;
							String splitArr=null;
							String toDay=null;
							try
							{
								con=ConnectDatabase.getConnection();
								String queryForcurDate="SELECT DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 18 YEAR), '%d-%m-%Y') AS 18years, DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 58 YEAR), '%d-%m-%Y') AS 58years, DATE_FORMAT(CURDATE(), '%d-%m-%Y') AS todayDate";
								fatchsqlDateSt=con.createStatement();
								fatchsqlDateRs=fatchsqlDateSt.executeQuery(queryForcurDate);
								if(fatchsqlDateRs.next())
								{
									fectSqlString18=fatchsqlDateRs.getString("18years");
									fectSqlString58=fatchsqlDateRs.getString("58years");
									toDay=fatchsqlDateRs.getString("todayDate");
									//System.out.println(fectSqlString18+" =============  "+fectSqlString58);
								}
								fatchsqlDateRs.close();
								fatchsqlDateSt.close();
							}
							catch(Exception ex)
							{
								System.out.println(ex.getMessage());
							}
							
						 %>	

		
<script type="text/javascript">
$(function() {
		var mnDt;
		var mxDt;
		mnDt = '<%= fectSqlString58 %>';
		//alert(mnDt);
		mxDt = '<%= fectSqlString18 %>';
	//	smNae= 'Mar';
	//	alert(mxDt);
		$("#dob").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1950:2020',
            showOn: 'both',
			buttonImage: '<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			buttonText: 'Cannot register if age is less then 18 years.',			
			minDate: mnDt,
			maxDate: mxDt
		});

	});
</script>

		
<script type="text/javascript">
$(function() {
		var mxDt;
		mxDt ='<%=toDay%>';
		$("#CompletionYear").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			maxDate: mxDt
		});
	});
</script>

<script type="text/javascript">
$(function() {
		$("#popup_container_JobFair").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage: '<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		});

	});
</script>


<script type="text/javascript">
function isNumberKey(evt) 
{
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Only numeric allowed here !';
		document.getElementById('closeblock').focus();
		myFunction();
	
//		alert("Only Numeric allowed here");
		return false;
	}
	return true;
}
</script>

<script type="text/javascript">
	function AllowAlphabet(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
        // alert(charCode);
		if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 13) {
			return true;
		}
		else
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Only alphabets allowed here !';
			document.getElementById('closeblock').focus();
			myFunction();
//			alert("Only Alphabets allowed here !!");
			return false;
		}
	}      
</script>

<script type="text/javascript">
	function AllowAlphabetAndSpace(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
        // alert(charCode);
		if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 13 || charCode == 32) {
			return true;
		}
		else
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Only alphabets allowed here !';
			document.getElementById('closeblock').focus();
			myFunction();
			return false;
		}
	}      
</script>

<script type="text/javascript">
	function SetNamingConvention(obj)
	{
		var tempText = obj.value.toLowerCase();
		tempArray = tempText.split(" ");
		tempText = "";
		for(var i = 0; i < tempArray.length; i++)
		{
			if(i > 0)
			{
				tempText = tempText + " " + tempArray[i].substr(0, 1).toUpperCase() + tempArray[i].substr(1);
			}
			else
			{
				tempText = tempArray[i].substr(0, 1).toUpperCase() + tempArray[i].substr(1);
			}
		}
		obj.value = tempText;
	}
</script>

<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
        // alert(charCode);
		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 13 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) 
		{
			return true;
		}
		else
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid character entered !';
			document.getElementById('closeblock').focus();
			myFunction();
			//alert("Invalid character entered !!");
			return false;
		}
	}      
</script>
	
<script type="text/javascript">
function showOption(value)
{
	if (value == "Y")
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

try
{
	var tital=document.getElementById("title").value;
	// alert(tital);
	if(tital == '' || tital == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please select title !';
		document.getElementById('closeblock').focus();
		// myFunction();
		//var appStr = 'Please Select Title !';
		//alert(appStr);
		return false;
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid title ! Please check !';
	document.getElementById('closeblock').focus();
	myFunction();

//	alert(" Invalid Title ! Please check !");
	return false;
}
try
{
	var fname=document.getElementById("firstName").value;
	if( fname == '' || fname == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please Enter First Name !';
		document.getElementById('closeblock').focus();
		myFunction();
//		alert("Please Enter First Name !");
		document.getElementById('firstName').focus();
		return false;
	}
	else
	{
		var fnametrim = fname.trim();
		if( fnametrim == '' || fnametrim == null)
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = ' Invalid first name ! Please check !';
			document.getElementById('closeblock').focus();
			myFunction();

			//alert(" Invalid First Name ! Please check !");
			document.getElementById('firstName').focus();
			return false;
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = ' Invalid first name ! Please check !';
	document.getElementById('closeblock').focus();
	myFunction();

	//alert("Invalid First Name ! Please check !");
	return false;
}
try
{
	var lname = document.getElementById("lastName").value; 
	if(lname == '' || lname == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please enter last name !';
		document.getElementById('closeblock').focus();
		myFunction();

		//alert("Please Enter Last Name !");
		document.getElementById('lastName').focus();
		return false;
	}
	else
	{
		var lanametrim = lname.trim(); 
		if(lanametrim == '' || lanametrim == null)
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = ' Invalid last name ! Please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			// alert(" Invalid Last Name ! Please check !");
			document.getElementById('lastName').focus();
			return false;
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = ' Invalid last name ! Please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	// alert(" Invalid Last Name ! Please check !");
	return false;
}
try
{
	var dobDATE = document.getElementById("dob").value;
	if(dobDATE == '' || dobDATE.length == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please enter DOB !';
		document.getElementById('closeblock').focus();
		myFunction();
		//alert("Please Enter DOB !");
		document.getElementById('dob').focus();
		return false;
	}
	else
	{
		var trimmedStr = dobDATE.trim();
		if(trimmedStr == '' || trimmedStr == null)
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid DOB ! Please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			// alert("Invalid DOB ! Please check !");
			document.getElementById('dob').focus();
			return false;
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid DOB ! Please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	// alert("Invalid DOB ! Please check !");
	return false;
}
try
{
	if ((candidateSubmitForm.radiobutton[0].checked == false ) && ( candidateSubmitForm.radiobutton[1].checked == false ) ) 
	{ 
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please choose your Gender: Male or Female!';
		document.getElementById('closeblock').focus();
		myFunction();
		// alert ( "Please choose your Gender: Male or Female" );
		return false;
    }
    else 
    {
	    if ( ( candidateSubmitForm.radiobutton[0].checked == true ) && ( candidateSubmitForm.radiobutton[1].checked == true ) ) 
		{ 

	    }
    } 
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid gender selection ! Please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//	 alert ( "Invalid gender selection ! Please check !" );
	return false;
}
try
{
	var nativState = document.getElementById("nativeState").value;	 
	if (nativState == '' || nativState.length == 0) 
	{ 
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please select your native !';
		document.getElementById('closeblock').focus();
		myFunction();
		// alert ( "Please select your Native !" ); 
		return false; 
	}
	else
	{
		var nativStateTrim = nativState.trim();
		if (nativStateTrim == '' || nativStateTrim == null) 
		{ 
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Inavlid your native selection ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			// alert ( "Inavlid your native selection ! please check !" ); 
			return false; 
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid your native selection ! Please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//alert ( "Invalid your native selection ! Please check !" ); 
	return false; 
}
try
{	var curLoc = document.getElementById("Current_Location").value;
	if (curLoc == "" || curLoc.length == 0) 
	{ 
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please select your Current Location !';
		document.getElementById('closeblock').focus();
		myFunction();
		// alert ( "Please select your Current Location !" ); 
		return false; 
	}
	else
	{
		var curLocTrim = curLoc.trim(); 
		if (curLocTrim == "" || curLocTrim == null) 
		{ 
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid your current location ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			// alert ( "Invalid your current location ! please check !" ); 
			return false; 
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid your current location ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	// alert ("Invalid your current location ! please check !" ); 
	return false; 
}
try
{	var curCity = document.getElementById("Current_city").value;
	if (curCity == "0" || curCity.length == 0) 
	{ 
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please select your Current City !';
		document.getElementById('closeblock').focus();
		myFunction();
		// alert ( "Please select your Current City !" ); 
		return false; 
	}
	else
	{
		var curCityTrim = curCity.trim(); 
		if (curCityTrim == "0" || curCityTrim == null) 
		{ 
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid your current city ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			// alert ("Invalid your current city ! please check !" ); 
			return false; 
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid your current city ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//	alert ( "Invalid your current city ! please check !" ); 
		return false; 
}

try
{
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	var email = document.getElementById("Email_id").value;
	if(email == "" || email.length == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please enter email id !';
		document.getElementById('closeblock').focus();
		myFunction();
		//alert("Please Enter Email Id !");
		document.getElementById('Email_id').focus();
		return false;
	}
	else if(reg.test(email) == false) 
	{ 
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please enter valid email id !';
		document.getElementById('closeblock').focus();
		myFunction();
		//alert('Please Enter Valid Email Id !'); 
		return false;
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid email Id ! Please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	// alert("Invalid email Id ! Please check !");
	return false;
}

try
{
	var v=document.getElementById("mobile").value;
	var preLand=document.getElementById("preFixLand").value;
	var LanLine=document.getElementById("Landline").value;
	
	if(v=='' || v=='Mobile' || v.length == 0) 
	{	
		if((preLand=='' || preLand=='STD') && (LanLine=='' || LanLine=='Landline'))
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Please enter either the mobile or landline number!';
			document.getElementById('closeblock').focus();
			myFunction();
			//var appStr = 'Please Enter Either The Mobile Or Landline Number!';		
			//alert(appStr);
			return false;
		}
		else
		{
			if(preLand=='' || preLand=='STD')
			{
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Please enter the STD code!';
				document.getElementById('closeblock').focus();
				myFunction();
				//var appStr = 'Please Enter The STD Code!';		
				//alert(appStr);
				document.getElementById('preFixLand').focus();
				return false;
			}
			else if(LanLine=='' || LanLine=='Landline')
			{
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Please Enter The Landline Number!';
				document.getElementById('closeblock').focus();
				myFunction();
				//var appStr = 'Please Enter The Landline Number!';		
				//alert(appStr);
				document.getElementById('Landline').focus();
				return false;
			}
		}
	}
	else if(v.length<10)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please Enter Complite Mobile No !';
		document.getElementById('closeblock').focus();
		myFunction();
		//var appStr = 'Please Enter Complite Mobile No !';		
		//alert(appStr);
		document.getElementById('mobile').focus();
		return false;
	}
	else
	{
		var vTrim= v.trim();
		if(vTrim == "" || vTrim == null)
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid mobile number ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			//var appStr = 'Invalid mobile number ! please check !';		
			//alert(appStr);
			return false;
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid mobile number ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//var appStr = 'Invalid mobile number ! please check !';		
	//alert(appStr);
	return false;
}

try
{
	var schoolName = document.getElementById("SchoolName").value;
	if(schoolName == "" || schoolName.length == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please Enter School Name !';
		document.getElementById('closeblock').focus();
		myFunction();
		//var appStr = 'Please Enter School Name !';
		//alert(appStr);
		document.getElementById('SchoolName').focus();
		return false;
	}
	else
	{
		var sNameTrim = schoolName.trim();
		if(sNameTrim == "" || sNameTrim == null)
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid School Name ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			//var appStr = 'Invalid School Name ! please check !';
			//alert(appStr);
			document.getElementById('SchoolName').focus();
			return false;
		}
	}

}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid School Name ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//	var appStr = 'Invalid School Name ! please check !';
	//	alert(appStr);
		return false;
}
try
{
	var quli = document.getElementById("Qualification").value;
	if(quli == "" || quli.length == 0) 
	{ 
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please your Qualification !';
		document.getElementById('closeblock').focus();
		myFunction();
		// alert ( "Please your Qualification !" ); 
		return false; 
	}
	else
	{
		var qualTrim = quli.trim(); 
		if(quli == "" || quli == null) 
		{ 
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid select your Qualification ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			// alert ( "Invalid select your Qualification ! please check !" ); 
			return false; 
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid select your Qualification ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//	alert ( "Invalid select your Qualification ! please check !" ); 
		return false; 
}

try
{
	var comYear = document.getElementById("CompletionYear").value;
	if(comYear == "" || comYear.length == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please Completion of Year !';
		document.getElementById('closeblock').focus();
		myFunction();
		//var appStr = 'Please Completion of Year !';		
		//alert(appStr);
		document.getElementById('CompletionYear').focus();
		return false;
	}
	else
	{
		var comYearTrim = comYear.trim();
		if(comYearTrim == "" || comYearTrim == null)
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'Invalid Completion of Year ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			//var appStr = 'Invalid Completion of Year ! please check !';		
			//alert(appStr);
			document.getElementById('CompletionYear').focus();
			return false;
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid Completion of Year ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//	var appStr = 'Invalid Completion of Year ! please check !';		
	//	alert(appStr);
		return false;
}

try
{
	var clssPer = document.getElementById("ClassPer").value;
	if(clssPer == "" || clssPer.length == 0)
	{
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please Enter Class Percentage !';
		document.getElementById('closeblock').focus();
		myFunction();
		//var appStr = 'Please Enter Class Percentage !';		
		//alert(appStr);
		document.getElementById('ClassPer').focus();
		return false;
	}
	else
	{
		var clssPerTrim = clssPer.trim();
		if(clssPerTrim == "" || clssPerTrim == null)
		{
			document.getElementById('openPOP').click();
			document.getElementById('dispMSG').innerHTML = 'invalid class percentage ! please check !';
			document.getElementById('closeblock').focus();
			myFunction();
			//var appStr = 'invalid class percentage ! please check !';		
			//alert(appStr);
			document.getElementById('ClassPer').focus();
			return false;
		}
	}
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'invalid class percentage ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	//var appStr = 'invalid class percentage ! please check !';		
	//alert(appStr);
	return false;
}

try
{
	if ((candidateSubmitForm.redioYes[0].checked == false ) && ( candidateSubmitForm.redioYes[1].checked == false)) 
	{ 
		document.getElementById('openPOP').click();
		document.getElementById('dispMSG').innerHTML = 'Please choose your Work Experience : Yes or No !';
		document.getElementById('closeblock').focus();
		myFunction();
		// alert ("Please choose your Work Experience : Yes or No !");
		 return false;
    }
    else
    {
		if ((candidateSubmitForm.redioYes[0].checked == true ) && ( candidateSubmitForm.redioYes[1].checked == true)) 
		{ 
			 
	    }
    }    
}
catch(e)
{
	document.getElementById('openPOP').click();
	document.getElementById('dispMSG').innerHTML = 'Invalid selection work experience ! please check !';
	document.getElementById('closeblock').focus();
	myFunction();
	// alert ("Invalid selection work experience ! please check !");
	 return false;
}
if ((candidateSubmitForm.redioYes[0].checked == true )) 
{
	try
	{
		 try
		 {
		 	 var priORG = document.getElementById("PriviousORG").value;
		 	 
			 if(priORG == "" || priORG.length == 0)
		     {
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Please Enter Previous ORG Name !';
				document.getElementById('closeblock').focus();
				myFunction();
				//var appStr = 'Please Enter Previous ORG Name !';		
				//alert(appStr);
				document.getElementById('PriviousORG').focus();
				return false;
			 }
			 else
			 {
			     var priORGtrim = priORG.trim();
				 if(priORGtrim == "" || priORGtrim == null)
			     {
					document.getElementById('openPOP').click();
					document.getElementById('dispMSG').innerHTML = 'Invlaid Previous ORG Name ! please check !';
					document.getElementById('closeblock').focus();
					myFunction();
					//var appStr = 'Invlaid Previous ORG Name ! please check !';		
					//alert(appStr);
					document.getElementById('PriviousORG').focus();
					return false;
				 }
			 }
		 }
		 catch(e)
		 {
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Invlaid Previous ORG Name ! please check !';
				document.getElementById('closeblock').focus();
				myFunction();
 			//var appStr = 'Invlaid Previous ORG Name ! please check !';		
			//alert(appStr);
			return false;
		 }
		 
		 try
		 {
		 	 var currSkill = document.getElementById('CurrentSkill').value;
			 if(currSkill == "" || currSkill.length == 0) 
			 { 
					document.getElementById('openPOP').click();
					document.getElementById('dispMSG').innerHTML = 'Please select Current Skill !';
					document.getElementById('closeblock').focus();
					myFunction();
				// alert( "Invlaid Previous ORG Name ! please check !" ); 
				return false; 
			 } 
			 else
			 {
			 	 var curSkillTrim = currSkill.trim(); 
				 if(currSkill == "" || currSkill == null) 
				 { 
						document.getElementById('openPOP').click();
						document.getElementById('dispMSG').innerHTML = 'Invalid your Current Skill ! please check !';
						document.getElementById('closeblock').focus();
						myFunction();
					/// alert ( "Invalid your Current Skill ! please check !" ); 
					return false; 
				 } 
			 }
		 }
		 catch(e)
		 {
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Invalid your Current Skill ! please check !';
				document.getElementById('closeblock').focus();
				myFunction();
	 			// alert ( "Invalid your Current Skill ! please check !" ); 
				return false; 
		 } 
		 try
		 {
		 	 var relExp = document.getElementById("RelevantExprience").value;
			 if(relExp == "" || relExp.length == 0)
		     {
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Please Enter Customer Interaction Experience !';
				document.getElementById('closeblock').focus();
				myFunction();
				//var appStr = 'Please Enter Customer Interaction Experience !';		
				//alert(appStr);
				document.getElementById('RelevantExprience').focus();
				return false;
			 }		 
			 else
			 {
			 	var relExptrim = relExp.trim();
			 	if(relExptrim == "" || relExptrim == null)
		     	{
					document.getElementById('openPOP').click();
					document.getElementById('dispMSG').innerHTML = 'Invalid Customer Interaction Experience ! please check !';
					document.getElementById('closeblock').focus();
					myFunction();
					//var appStr = 'Invalid Customer Interaction Experience ! please check !';		
					//alert(appStr);
					return false;
			 	}
			 }
		 }
		 catch(e)
		 {
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Invalid Customer Interaction Experience ! please check !';
				document.getElementById('closeblock').focus();
				myFunction();
			    //var appStr = 'Invalid Customer Interaction Experience ! please check !';		
				//alert(appStr);
				return false;
		 }
		 try
		 {
		 	 var nonrel= document.getElementById("NONRelevantExprience").value; 
			 if( nonrel == "" || nonrel.length == 0)
		     {
				document.getElementById('openPOP').click();
				document.getElementById('dispMSG').innerHTML = 'Please Enter Other Experience !';
				document.getElementById('closeblock').focus();
				myFunction();
				//var appStr = 'Please Enter Other Experience !';		
				//alert(appStr);
				document.getElementById('NONRelevantExprience').focus();
				return false;
			 }
			 else
			 {
			 	 var nonrevTrim = nonrel.trim();
				 if( nonrevTrim == "" || nonrevTrim == null)
			     {
					document.getElementById('openPOP').click();
					document.getElementById('dispMSG').innerHTML = 'Invalid Other Experience ! please check !';
					document.getElementById('closeblock').focus();
					myFunction();
					//var appStr = 'Invalid Other Experience ! please check !';		
					//alert(appStr);
					document.getElementById('NONRelevantExprience').focus();
					return false;
				 }
			 }
		 }
		 catch(e)
		 {
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Other Experience ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			 //var appStr = 'Invalid Other Experience ! please check !';		
			//alert(appStr);
			return false;	 	
		 }
	}
	catch(e)
	{
		 document.getElementById('openPOP').click();
		 document.getElementById('dispMSG').innerHTML = 'Invalid Entries with work exprience ! please check !';
		 document.getElementById('closeblock').focus();
		 myFunction();
		//var appStr = 'Invalid Entries with work exprience ! please check !';		
		//alert(appStr);
		return false;	
	}
}
try
{
	var pSource = document.getElementById("PrimarySource").value;
	if(pSource == "" || pSource.length == 0) 
	{ 
		 document.getElementById('openPOP').click();
		 document.getElementById('dispMSG').innerHTML = 'Please select your Primary Source !';
		 document.getElementById('closeblock').focus();
		 myFunction();
		// alert( "Please select your Primary Source !" ); 
		return false; 
	}
	else
	{
		var pSourceTrim = pSource.trim();
		if(pSourceTrim == "" || pSourceTrim == null) 
		{ 
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your Primary Source ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert( "Invalid your Primary Source ! please check !" ); 
			return false; 
		}		
	}
}
catch(e)
{
	 document.getElementById('openPOP').click();
	 document.getElementById('dispMSG').innerHTML = 'Invalid your Primary Source ! please check !';
	 document.getElementById('closeblock').focus();
	 myFunction();
	// alert( "Invalid your Primary Source ! please check !" ); 
	return false; 
} 


	var txtChange = document.getElementById('PrimarySource').value;
	
	if(txtChange=='2')
	{
		try
		{
			var refID = document.getElementById('RefID').value;
			if(refID == '' || refID == 'Referal Id' || refID.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Employee Referal Id !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please Enter Employee Referal Id!" ); 
				return false; 
			}
			else
			{
				var refIdTrim = refID.trim();
				if(refIdTrim == '' || refIdTrim == 'Referal Id' || refIdTrim == null)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid  employee eeferal Id ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					//alert ( "Invalid  employee eeferal Id ! please check !" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid  employee eeferal Id ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			//alert ( "Invalid  employee eeferal Id ! please check !" ); 
			return false; 
		}
		try
		{	var empId = document.getElementById('empID').value;
			if( empId == '' || empId == 'Employee Id' || empId.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Employee Id !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please Enter Employee Id !" ); 
				return false; 
			}
			else
			{
				var empIdTrim = empId.trim();
				if(empIdTrim == '' || empId == 'Employee Id' || empId == null)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Employee Id ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Employee Id ! please check ! " ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Employee Id ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ( "Invalid Employee Id ! please check ! " ); 
			return false; 
		}
		try
		{
			var empName = document.getElementById('empName').value;
			if(empName == '' || empName == 'Employee Name' || empName.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Employee Name !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please Enter Employee Name !" ); 
				return false; 
			}
			else
			{	
				var empNameTrim = empName.trim();
				if(empNameTrim == '' || empNameTrim == 'Employee Name' || empNameTrim == null)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid employee name ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid employee name ! please check !" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid employee name ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ( "Invalid employee name ! please check !" ); 
			 return false; 
		}
		
		try
		{
			var empPhone = document.getElementById('empPhone').value; 
			if( empPhone == '' || empPhone == 'Phone Number' || empPhone.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Employee Phone Number !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please Enter Employee Phone Number !" ); 
				return false; 
			}
			else
			{
				var empPhoneTrim = empPhone.trim();
				if( empPhoneTrim == '' || empPhoneTrim == 'Phone Number' || empPhoneTrim == null)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Employee Phone Number ! plese check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Employee Phone Number ! plese check !" ); 
					 return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Employee Phone Number ! plese check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			//	alert ( "Invalid Employee Phone Number ! plese check !" ); 
				return false; 
			
		}
		
	}
	if(txtChange=='3')
	{
		try
		{
			var jobPId = document.getElementById('jobPortalD').value;
			if(jobPId == "" || jobPId.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your job Portal !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please select your job Portal !" ); 
				return false; 
			}
			else
			{
				var jobIdtrim = jobPId.trim();
				if(jobIdtrim == "" || jobIdtrim == null) 
				{ 
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid your job Portal ! plese check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					//alert ( "Invalid your job Portal ! plese check !" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your job Portal ! plese check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ("Invalid your job Portal ! plese check !"); 
			return false; 
		}
		try
		{
			if(document.getElementById('jobPortalD').value == '0') 
			{ 
				try
				{
					var jOther = document.getElementById('JPOther').value;
					if(jOther == '' || jOther == 'Details' || jOther.length == 0) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details!';
						 document.getElementById('closeblock').focus();
						 myFunction();
					//	alert ( "Please Enter Details!" ); 
						return false; 
					}
					else
					{
						var jotherTrim = jOther.trim();
						if(jotherTrim == '' || jotherTrim == 'Details' || jotherTrim == null) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'invalid Details ! plese check !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							// alert ( "invalid Details ! plese check !" ); 
							return false; 
						}
					}
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'invalid Details ! plese check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
						// alert ( "invalid Details ! plese check !" ); 
						return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'invalid job portal ! plese check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ( "invalid job portal ! plese check !" ); 
			return false;
		}
	}
	if(txtChange=='4')
	{
		try
		{
			var consult = document.getElementById('Consultant').value;
			if(consult == "") 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your Consultant !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please select your Consultant !" ); 
				return false; 
			}
			if(consult == '0') 
			{
				try
				{
					var consOther = document.getElementById('ConsOther').value; 
					if( consOther == '' || consOther == 'Details' || consOther.length == 0) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						//alert ( "Please Enter Details!" ); 
						return false; 
					}
					else
					{
						var consOtherTrim = consOther.trim();
						if( consOtherTrim == '' || consOtherTrim == 'Details' || consOtherTrim == null) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details!';
							 document.getElementById('closeblock').focus();
							 myFunction();
							// alert ( "Invalid Enter Details !" ); 
							return false; 
						}
					}
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Enter Details!" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your Consultant !';
			 document.getElementById('closeblock').focus();
			 myFunction();
		//	alert ( "Invalid your Consultant !" ); 
			return false; 
		}
	}
	
// done for the till 4	
	if(txtChange=='5')
	{
		try
		{
			var advt = document.getElementById('Advertisment').value;
			if(advt == "" || advt.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your Advertisment !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please select your Advertisment !" ); 
				return false; 
			}
			if(document.getElementById('Advertisment').value == '0') 
			{
				try
				{
					var advtTrim = document.getElementById('AdvertisOther').value;
				 	
				 	if(advtTrim == '' || advtTrim == 'Details' || advtTrim == null) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						// alert ( "Please Enter Details!" ); 
						return false; 
					}
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Enter Details! please check !" ); 
					return false; 	
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your Advertisment ! Please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ("Invalid your Advertisment ! Please check !"); 
			return false; 
		}
	}
	if(txtChange=='6')
	{ 
		try
		{
			var other = document.getElementById("otherD").value;
			if(other == '' || other == 'Details' || other.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Other Details !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please Enter Other Details !" ); 
				return false; 
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Other Details ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ( "Invalid Enter Other Details ! please check !" ); 
			return false; 
		}
	}
	if(txtChange=='8')
	{ 	
		try
		{
			var jobFid = document.getElementById('jobFairD').value; 
			if(jobFid == "" || jobFid.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your Job Fair !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please select your Job Fair !" ); 
				return false; 
			}		
			if(document.getElementById('jobFairD').value == '0') 
			{
				var jother = document.getElementById('jobFOther').value;
			 	if(jother == '' || jother == 'Details' || jother == null || jother.length == 0) 
				{ 
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Please Enter Details!';
					 document.getElementById('closeblock').focus();
					 myFunction();
					//alert ( "Please Enter Details!" ); 
					return false; 
				}
				else
				{
					var jotherTrim = jother.trim();
					if(jotherTrim == '' || jother == 'Details' || jother == null) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						//alert ( "Invalid Enter Details ! please check ! " ); 
						return false; 
					}	
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your Job Fair ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ("Invalid your Job Fair ! please check !"); 
			return false; 
		}
	}
	if(txtChange=='9')
	{	
		try
		{
			var email = document.getElementById('emailMailers').value;
			if(email == "" || email.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your Email !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please select your Email !" ); 
				return false; 
			}
			if(document.getElementById('emailMailers').value == '0') 
			{ 
				try
				{
					var emailOther = document.getElementById('emailOther').value; 
					if(emailOther == "" || emailOther == 'Details' || emailOther.length == 0) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						//alert ( "Please Enter Details!" ); 
						return false; 
					}
					else
					{
						var emailOtherTrim = emailOther.trim();
						if(emailOtherTrim == "" || emailOtherTrim == 'Details' || emailOtherTrim == null) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							//alert ( "Invalid Enter Details ! please check !" ); 
							return false; 
						}
					}				
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Enter Details ! please check !" ); 
					 return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your Email ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ( "Invalid your Email ! please check !" ); 
			return false;
		}
	}
	if(txtChange=='11')
	{ 		
		try
		{
			var sms = document.getElementById('sms').value;
			if(sms == "" || sms.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'plese select your SMS !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "plese select your SMS !" ); 
				return false; 
			}
			if(document.getElementById('sms').value == '0') 
			{
				try
				{	
					var smsOther = document.getElementById('smsOtherField').value;
				  	if(smsOther == '' || smsOther == 'Details' || smsOther.length == 0) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						// alert ( "Please Enter Details!" ); 
						return false; 
					}
					else
					{
						var smsOtherTrim = smsOther.trim();
					  	if(smsOtherTrim == '' || smsOtherTrim == 'Details' || smsOtherTrim.length == null) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! plese check !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							// alert ( "Invalid Enter Details ! plese check !" ); 
							return false; 
						}
					}
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Enter Details!" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your SMS ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			//	alert ( "Invalid your SMS ! please check !" ); 
				return false; 
		}
	}
	if(txtChange=='13')
	{
		try
		{
			var candrefID = document.getElementById('candiReferalD').value;
			if(candrefID == "" || candrefID == 'Candidate Name' || candrefID.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Candidate Name !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please Enter Candidate Name !" ); 
				return false; 
			}
			else
			{
				var candrefIDTrim = candrefID.trim();
				if(candrefIDTrim == "" || candrefIDTrim == 'Candidate Name' || candrefIDTrim == null)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Candidate Name ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					//alert ( "Invalid Candidate Name ! please check !" ); 
					return false; 
				}				
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Candidate Name ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			//		alert ( "Invalid Candidate Name ! please check !" ); 
					return false; 		
		}
		
		try
		{
			var candPhone = document.getElementById('candiPhoneD').value; 
			if(candPhone == '' || candPhone == 'Phone Number' || candPhone.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Phone Number !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please Enter Phone Number !" ); 
				return false; 
			}
			else
			{
				var candPhoneTrim = candPhone.trim();
				if(candPhoneTrim == '' || candPhoneTrim == 'Phone Number' || candPhoneTrim == null)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Phone Number ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					//alert ( "Invalid Phone Number ! please check !" ); 
					return false; 
				}
			}
		
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Phone Number ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			 // alert ( "Invalid Phone Number ! please check !" ); 
			 return false; 		
		}

	}
	if(txtChange=='14')
	{
		try
		{
			var camp = document.getElementById('campusD').value;
			if(camp == "" || camp.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your Campus !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please select your Campus !" ); 
				return false; 
			}
			if(document.getElementById('campusD').value == '0') 
			{ 
				try
				{
					var compOther = document.getElementById('campusOtherField').value;
					if(compOther == '' || compOther == 'Details' || compOther.length == 0) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						// alert ( "Please Enter Details!" ); 
						return false; 
					}
					else
					{
						var compOtherTrim = compOther.trim();
						if(compOtherTrim == '' || compOtherTrim == 'Details' || compOtherTrim == null) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							//alert ( "Invalid Enter Details ! please check !" ); 
							return false; 
						}
					}
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					//	alert ( "Invalid Enter Details ! please check !" ); 
						return false; 
				}
			}
		}
		catch(e)
		{ 
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			 // alert ( "Invalid Enter Details ! please check !" ); 
					return false; 
		}
	}
	if(txtChange=='15')
	{
		try
		{
			if(candidateSubmitForm.traingInsituteD.selectedIndex == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your Traing Insitute !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please select your Traing Insitute !" ); 
				return false; 
			}
			if(document.getElementById('traingInsituteD').value == 'Other') 
			{
				try
				{
					var trinId = document.getElementById('traingInsituteOtherField').value;
				 	if(trinId == '' || trinId == 'Details' || trinId.length == 0) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						//alert ( "Please Enter Details!" ); 
						return false; 
					}
					else
					{
						var trinIdTrim = trinId.trim();
					 	if(trinIdTrim == '' || trinIdTrim == 'Details' || trinIdTrim == null) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							// alert ( "Invalid Enter Details!" ); 
							return false; 
						}
					}
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Enter Details!" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'invalid your Traing Insitute ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			 //alert ( "invalid your Traing Insitute ! please check !" ); 
			 return false; 
		}
	}
	if(txtChange=='16')
	{
		try
		{
			var xemp = document.getElementById('xEmployeeD').value; 
			if(xemp == '' || xemp == 'Emp Name' || xemp.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter X Employee !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please Enter X Employee !" ); 
				return false; 
			}
			else
			{
				var xempTrim = xemp.trim();
				if(xempTrim == '' || xempTrim == 'Emp Name' || xempTrim == 0)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid X Employee ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid X Employee ! please check !" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid X Employee ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			//alert ( "Invalid X Employee ! please check !" ); 
			return false; 
		}
		try
		{
			var xEmpPhone = document.getElementById('xEmployeePhoneD').value;
			if(xEmpPhone == '' || xEmpPhone == 'Phone Number' || xEmpPhone.length == 0)
			{
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please Enter Phone Number !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				// alert ( "Please Enter Phone Number !" ); 
				return false; 
			}
			else
			{
				var xEmpPhoneTrim = xEmpPhone.trim();
				if(xEmpPhoneTrim == '' || xEmpPhoneTrim == 'Phone Number' || xEmpPhoneTrim == null)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Phone Number ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					//alert ( "Invalid Phone Number ! please check !" ); 
					return false; 
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid Phone Number ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			 //alert ( "Invalid Phone Number ! please check !" ); 
					return false; 
		}
	}
	if(txtChange=='17')
	{
		try
		{
			var TeleCall = document.getElementById('TeleCallTeam_REC_Name').value;
			if(TeleCall == "" || TeleCall.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select your Tele Call Team !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please select your Tele Call Team !" ); 
				return false; 
			}
			if(document.getElementById('TeleCallTeam_REC_Name').value == '0') 
			{ 	
				try
				{
					var callOther = document.getElementById('callingOther').value; 
					if( callOther == '' || callOther == 'Details' || callOther.length == 0) 
					{ 
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Please Enter Details!';
						 document.getElementById('closeblock').focus();
						 myFunction();
						 // alert ( "Please Enter Details!" ); 
							return false; 
					}
					else
					{
						var callOthertRIM = callOther.trim();
						if( callOthertRIM == '' || callOthertRIM == 'Details' || callOthertRIM == null) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							//alert ( "Invalid Enter Details ! please check !" ); 
							return false; 
						}
					}
				}
				catch(e)
				{
					 document.getElementById('openPOP').click();
					 document.getElementById('dispMSG').innerHTML = 'Invalid Enter Details ! please check !';
					 document.getElementById('closeblock').focus();
					 myFunction();
					// alert ( "Invalid Enter Details ! please check !" ); 
					return false; 
				}
			}			
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid your Tele Call Team ! please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			// alert ( "Invalid your Tele Call Team ! please check !" ); 
			return false;
		}
	}
	
	if(txtChange=='18')
	{	
		try
		{
			var VendorCity = document.getElementById('VendorCity').value;
			if(VendorCity == '' || VendorCity.length == 0) 
			{ 
				 document.getElementById('openPOP').click();
				 document.getElementById('dispMSG').innerHTML = 'Please select vendor city name !';
				 document.getElementById('closeblock').focus();
				 myFunction();
				//alert ( "Please select vendor city name !" ); 
				return false; 				
			}
			else 
			{
				if(VendorCity == '0')
				{
					try
					{
						var VendorOtherCity = document.getElementById('VendorCityOtherVal').value;
						if(VendorOtherCity == '' || VendorOtherCity == 'City' || VendorOtherCity.length == 0) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Please enter vendor city name !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							//alert ("Please enter vendor city name !"); 
							return false; 
						}
						var VendorNameOther = document.getElementById('VendorNameOtherVal').value; 
						if(VendorNameOther == '' || VendorNameOther == 'Vendor' || VendorNameOther.length == 0) 
						{ 
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Please enter vendor name !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							//alert ("Please enter vendor name !"); 
							return false; 
						}
					}
					catch(e)
					{
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Invalid vendor details ! Please check !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						//alert ("Invalid vendor details ! Please check !"); 
						return false; 
					}			
				}
				else
				{
					try
					{
						var VendorName = document.getElementById('VendorName').value;
						if(VendorName == '' || VendorName.length == 0)
						{
							 document.getElementById('openPOP').click();
							 document.getElementById('dispMSG').innerHTML = 'Please select your vendor name !';
							 document.getElementById('closeblock').focus();
							 myFunction();
							//alert ("Please select your vendor name !"); 
							return false; 								
						}
						if(VendorName == 'Other') 
						{
							try
							{
								var VendorNameOther = document.getElementById('VendorNameOtherVal').value; 
								if(VendorNameOther == '' || VendorNameOther == 'Vendor' || VendorNameOther.length == 0) 
								{ 
									 document.getElementById('openPOP').click();
									 document.getElementById('dispMSG').innerHTML = 'Please enter vendor name !';
									 document.getElementById('closeblock').focus();
									 myFunction();
									//alert ("Please enter vendor name !"); 
									return false; 
								}
							}
							catch(e)
							{
								 document.getElementById('openPOP').click();
								 document.getElementById('dispMSG').innerHTML = 'Invalid vendor details ! Please check !';
								 document.getElementById('closeblock').focus();
								 myFunction();
								//alert ("Invalid vendor details ! Please check !"); 
								return false; 
							}			
						}
					}
					catch(e)
					{
						 document.getElementById('openPOP').click();
						 document.getElementById('dispMSG').innerHTML = 'Invalid vendor selection ! Please check !';
						 document.getElementById('closeblock').focus();
						 myFunction();
						//alert ("Invalid vendor selection ! Please check !"); 
						return false; 
					}			
				}
			}
		}
		catch(e)
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Invalid vendor city selection ! Please check !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			//alert ( "Invalid vendor city selection ! Please check !" ); 
			return false;
		}
	}
	
	try
	{
		var location = document.getElementById('location').value;
		if(location == '' || location.length == 0) 
		{ 
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Please select applying for location !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			//alert ( "Please select applying for location !" ); 
			return false;
		}
	}
	catch(e)
	{
		 document.getElementById('openPOP').click();
		 document.getElementById('dispMSG').innerHTML = 'Invalid location selection ! Please check !';
		 document.getElementById('closeblock').focus();
		 myFunction();
		//alert ( "Invalid location selection ! Please check !" ); 
		return false;
	}
	
	try
	{
		if(candidateSubmitForm.checkbox.checked == false ) 
		{
			 document.getElementById('openPOP').click();
			 document.getElementById('dispMSG').innerHTML = 'Please check the Declaration  box !';
			 document.getElementById('closeblock').focus();
			 myFunction();
			 //alert ( "Please check the Declaration  box." );
			 return false;
		}
	}
	catch(e)
	{
		 document.getElementById('openPOP').click();
		 document.getElementById('dispMSG').innerHTML = 'Invalid check the Declaration box ! please check !';
		 document.getElementById('closeblock').focus();
		 myFunction();
		 //alert ( "Invalid check the Declaration box ! please check !" );
		 return false;
	}

     document.getElementById("mrs1").style.display="none";
     document.getElementById("mrs2").style.display="none";
     document.getElementById("mrs3").style.display="none";
     document.getElementById("mrs4").style.display="none";
     document.getElementById("mrs5").style.display="none";
     document.getElementById("mrs6").style.display="none";
     document.getElementById("mrs7").style.display="none";
     document.getElementById("mrs8").style.display="none";
     document.getElementById("mrs9").style.display="none";
     document.getElementById("mrs10").style.display="none";
     document.getElementById("mrs11").style.display="none";
     document.getElementById("mrs12").style.display="none";
     document.getElementById("mrs13").style.display="none";
     document.getElementById("mrs14").style.display="none";
     document.getElementById("mrs15").style.display="none";
     document.getElementById("mrs16").style.display="none";
     document.getElementById("mrs17").style.display="none";
     document.getElementById("mrs18").style.display="none";
     document.getElementById("mrs19").style.display="none";
     document.getElementById("lblDeclaration").style.display="none";
     document.getElementById("DeclarationDisp").style.display="none";
     document.getElementById("lblConfirmation").style.display="";
     document.getElementById("ConfirmationDisp").style.display="";
     document.getElementById("Next_button").style.display="none";
     document.getElementById("Back_button").style.display="none";
     document.getElementById("confirm").style.display="";
 	  document.getElementById('editbutton').style.display="";
 	  document.getElementById('titleDDL').style.display="none";
 	  document.getElementById('titleDisp').style.display="";  	  
 	  document.getElementById('titleLBL').innerHTML=document.getElementById("title").value;  	
 	  document.getElementById('firstnamefield').style.display="none";  
 	  document.getElementById('firstnameDisp').style.display="";  	  
 	  document.getElementById('firstnameLBL').innerHTML=document.getElementById("firstName").value;
 	  document.getElementById('middlenamefield').style.display="none";  
 	  document.getElementById('middlenameDisp').style.display="";  	  
 	  document.getElementById('middlenameLBL').innerHTML=document.getElementById("middleName").value;
 	  document.getElementById('lastnamefield').style.display="none";  
 	  document.getElementById('lastnameDisp').style.display="";  	  
 	  document.getElementById('lastnameLBL').innerHTML=document.getElementById("lastName").value;
 	  document.getElementById('dobfield').style.display="none";  
 	  document.getElementById('dobDisp').style.display="";  	  
 	  document.getElementById('dobLBL').innerHTML=document.getElementById("dob").value;
 	  document.getElementById('genderoptions').style.display="none";  
 	  document.getElementById('genderoptionsDisp').style.display="";  	  
	if ( ( candidateSubmitForm.radiobutton[0].checked == true ) ) 
	{ 
  	  document.getElementById('genderoptionsLBL').innerHTML=candidateSubmitForm.radiobutton[0].value;
    }
    else
	{ 
  	  document.getElementById('genderoptionsLBL').innerHTML=candidateSubmitForm.radiobutton[1].value;
    } 
 	  document.getElementById('stateoptions').style.display="none";  
 	  document.getElementById('stateoptionsDisp').style.display="";  	  
 	  document.getElementById('stateoptionsLBL').innerHTML=candidateSubmitForm.nativeState.options[candidateSubmitForm.nativeState.selectedIndex].text;
 	  document.getElementById('locationDDL').style.display="none";  
 	  document.getElementById('locationoptionsDisp').style.display="";  	  
 	  document.getElementById('locationoptionsLBL').innerHTML=candidateSubmitForm.Current_Location.options[candidateSubmitForm.Current_Location.selectedIndex].text;
 	  document.getElementById('CityDDL').style.display="none";  
 	  document.getElementById('CityDisp').style.display="";  	  
 	  document.getElementById('CityLBL').innerHTML=candidateSubmitForm.Current_city.options[candidateSubmitForm.Current_city.selectedIndex].text;
 	  document.getElementById('EmailField').style.display="none";  
 	  document.getElementById('EmailDisp').style.display="";  	  
 	  document.getElementById('EmailLBL').innerHTML=document.getElementById("Email_id").value;
 	  document.getElementById('Mobilefield').style.display="none";
 	  document.getElementById('MobileDisp').style.display="";  	  
	  if(v=='' || v=='Mobile')
		{	
	 	  document.getElementById('MobileLBL').innerHTML="&lt;no mobile&gt;";
	 	}
	  else
		{	
	 	  document.getElementById('MobileLBL').innerHTML="+91 "+document.getElementById("mobile").value;
	 	}
 	  
 	  document.getElementById('Landlinefield').style.display="none";
 	  document.getElementById('LandlineDisp').style.display="";  	
 	  
	  if(LanLine=='' || LanLine=='Landline')
		{	
	 	  document.getElementById('LandlineLBL').innerHTML="&lt;no landline&gt;";
	 	}
	  else
		{	
	 	  document.getElementById('LandlineLBL').innerHTML=document.getElementById("preFixLand").value + "-" + document.getElementById("Landline").value;
	 	}
 	  
 	  document.getElementById('HighestEducField').style.display="none";  
 	  document.getElementById('HighestEducDisp').style.display="";  	  
 	  document.getElementById('HighestEducLBL').innerHTML=document.getElementById("SchoolName").value;
 	  document.getElementById('QualificationDDL').style.display="none";  
 	  document.getElementById('QualificationDisp').style.display="";  	  
 	  document.getElementById('QualificationLBL').innerHTML=candidateSubmitForm.Qualification.options[candidateSubmitForm.Qualification.selectedIndex].text;
 	  document.getElementById('CompletionField').style.display="none";  
 	  document.getElementById('CompletionFieldDisp').style.display="";  	  
 	  document.getElementById('CompletionFieldLBL').innerHTML=document.getElementById("CompletionYear").value; 
 	  document.getElementById('ClassField').style.display="none";  
 	  document.getElementById('ClassFieldDisp').style.display="";  	  
 	  document.getElementById('ClassFieldLBL').innerHTML=document.getElementById("ClassPer").value;
 	  document.getElementById('WorkExpoptions').style.display="none";  
	if ( ( candidateSubmitForm.redioYes[0].checked == true ) ) 
	{ 
		 document.getElementById('PreviousOrgField').style.display="none";  
  	     document.getElementById('PreviousOrgDisp').style.display="";  	  
  	     document.getElementById('PreviousOrgLBL').innerHTML=document.getElementById("PriviousORG").value;
  	     document.getElementById('SkillDDL').style.display="none";  
  	     document.getElementById('SkillDisp').style.display="";  	  
	  	 document.getElementById('SkillLBL').innerHTML=candidateSubmitForm.CurrentSkill.options[candidateSubmitForm.CurrentSkill.selectedIndex].text;
	  	 document.getElementById('RelevantExprienceField').style.display="none";  
	  	 document.getElementById('RelevantExprienceDisp').style.display="";  	  
	  	 document.getElementById('RelevantExprienceLBL').innerHTML=document.getElementById("RelevantExprience").value;
  	     document.getElementById('NONRelevantExprienceField').style.display="none";  
	  	 document.getElementById('NONRelevantExprienceDisp').style.display="";  	  
	  	 document.getElementById('NONRelevantExprienceLBL').innerHTML=document.getElementById("NONRelevantExprience").value;
	    }
    else
	{ 
		 document.getElementById('WorkExpoptionsDisp').style.display="";	  
    }
	document.getElementById('SourceDDL').style.display="none";  
	document.getElementById('SourceDisp').style.display="";  	  
	document.getElementById('SourceLBL').innerHTML=candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].text;
	document.getElementById('SourceLBLHF').value=candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].text;
 	
 	if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==2)
 	{ 
 	  document.getElementById('RefIDField').style.display="none";  
	  document.getElementById('RefIDDisp').style.display="";  	  
	  document.getElementById('RefIDLBL').innerHTML=document.getElementById("RefID").value;
  	  document.getElementById('empIDField').style.display="none";  
	  document.getElementById('empIDDisp').style.display="";  	  
	  document.getElementById('empIDLBL').innerHTML=document.getElementById("empID").value;
	  document.getElementById('empNameField').style.display="none";  
	  document.getElementById('empNameDisp').style.display="";  	  
	  document.getElementById('empNameLBL').innerHTML=document.getElementById("empName").value;
	  document.getElementById('empPhoneField').style.display="none";  
	  document.getElementById('empPhoneDisp').style.display="";  	  
	  document.getElementById('empRefHelpdesk').style.display="none";  
	  document.getElementById('empPhoneLBL').innerHTML=document.getElementById("empPhone").value;
 	   }
 	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==3)
 	   {
 	     document.getElementById('jobPortalDDL').style.display="none";  
 	     document.getElementById('jobPortalDisp').style.display="";
 	     document.getElementById('jobPortalLBL').innerHTML=candidateSubmitForm.jobPortalD.options[candidateSubmitForm.jobPortalD.selectedIndex].text;
 	     document.getElementById('jobPortalHF').value=candidateSubmitForm.jobPortalD.options[candidateSubmitForm.jobPortalD.selectedIndex].text;
 	     if(candidateSubmitForm.jobPortalD.options[candidateSubmitForm.jobPortalD.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('jobPortalOther').style.display="none";  
	 	     document.getElementById('jobPortalOtherDisp').style.display="";
	 	     document.getElementById('jobPortalOtherLBL').innerHTML="- "+document.getElementById("JPOther").value;
	 	     document.getElementById('jobPortalOtherHF').value=" - "+document.getElementById("JPOther").value;
 	     } 
 	   }
 	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==4)
 	   {
 	     document.getElementById('ConsultantDDL').style.display="none";  
 	     document.getElementById('ConsultantDisp').style.display="";  	  
 	     document.getElementById('ConsultantLBL').innerHTML=candidateSubmitForm.Consultant.options[candidateSubmitForm.Consultant.selectedIndex].text;
 	     document.getElementById('ConsOtherHF').value=candidateSubmitForm.Consultant.options[candidateSubmitForm.Consultant.selectedIndex].text;
 	    
  	     if(candidateSubmitForm.Consultant.options[candidateSubmitForm.Consultant.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('ConsultantOther').style.display="none";
	 	     document.getElementById('ConsultantOtherDisp').style.display="";
	 	     document.getElementById('ConsultantOtherLBL').innerHTML="- "+document.getElementById("ConsOther").value;
	 	     document.getElementById('ConsultantOtherHF').value="- "+document.getElementById("ConsOther").value;
	 	     
 	     } 
 	   }
 	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==5)
 	   {
 	     document.getElementById('AdvertismentDDL').style.display="none";  
 	     document.getElementById('AdvertismentDisp').style.display="";  	  
 	     document.getElementById('AdvertismentLBL').innerHTML=candidateSubmitForm.Advertisment.options[candidateSubmitForm.Advertisment.selectedIndex].text;
 	     document.getElementById('AdvertismentOtherHF').value=candidateSubmitForm.Advertisment.options[candidateSubmitForm.Advertisment.selectedIndex].text;
 	     
 	     if(candidateSubmitForm.Advertisment.options[candidateSubmitForm.Advertisment.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('AdvertismentOther').style.display="none";
	 	     document.getElementById('AdvertismentOtherDisp').style.display="";
	 	     document.getElementById('AdvertismentOtherLBL').innerHTML="- "+document.getElementById("AdvertisOther").value;
	 	     document.getElementById('AdvertismentOtherDispHF').value=" - "+document.getElementById("AdvertisOther").value;	 	     
 	     }
 	    }
 	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==7)
 	    {
 	    	document.getElementById('Friends_Relative').style.display="none";
 	    }
 	    
 	    
 	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==6)
 	   {
 	     document.getElementById('otherDField').style.display="none";  
 	     document.getElementById('otherDDisp').style.display="";  	  
 	     document.getElementById('otherDLBL').innerHTML=document.getElementById("otherD").value;
 	    }
 	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==8)
 	   {
 	     document.getElementById('jobFairDDL').style.display="none";  
 	     document.getElementById('jobFairDisp').style.display="";  	  
 	     document.getElementById('jobFairLBL').innerHTML=candidateSubmitForm.jobFairD.options[candidateSubmitForm.jobFairD.selectedIndex].text;
 	     document.getElementById('jobFairOtherHF').value=candidateSubmitForm.jobFairD.options[candidateSubmitForm.jobFairD.selectedIndex].text;
 	     
 	     if(candidateSubmitForm.jobFairD.options[candidateSubmitForm.jobFairD.selectedIndex].text == "Other")
 	     {
	 	    document.getElementById('jobFairOther').style.display="none";
	 	    document.getElementById('jobFairOtherDisp').style.display="";
	 	    document.getElementById('jobFairOtherLBL').innerHTML="- "+document.getElementById("jobFOther").value;
	 	    document.getElementById('jobFairOtherDispHF').value=" - "+document.getElementById("jobFOther").value;
	 	     
 	     }
 	    }
 	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==9)
 	   {
 	     document.getElementById('emailMailersDDL').style.display="none";  
 	     document.getElementById('emailMailersDisp').style.display="";  	  
 	     document.getElementById('emailMailersLBL').innerHTML=candidateSubmitForm.emailMailers.options[candidateSubmitForm.emailMailers.selectedIndex].text;
 	     document.getElementById('emailMailersOtherDISPHF').value=candidateSubmitForm.emailMailers.options[candidateSubmitForm.emailMailers.selectedIndex].text;
 
 	     if(candidateSubmitForm.emailMailers.options[candidateSubmitForm.emailMailers.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('emailMailersOther').style.display="none";
	 	     document.getElementById('emailOtherDisp').style.display="";
	 	     document.getElementById('emailOtherLBL').innerHTML="- "+document.getElementById("emailOther").value;
	 	     document.getElementById('emailOtherDispHF').value=" - "+document.getElementById("emailOther").value;
 	     }
 	    }
 	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==11)
 	   {
 	     document.getElementById('smsDDL').style.display="none";  
 	     document.getElementById('smsDisp').style.display="";  	  
 	     document.getElementById('smsLBL').innerHTML=candidateSubmitForm.sms.options[candidateSubmitForm.sms.selectedIndex].text;
 	     document.getElementById('smsOtherIDHF').value=candidateSubmitForm.sms.options[candidateSubmitForm.sms.selectedIndex].text;
 
 	     if(candidateSubmitForm.sms.options[candidateSubmitForm.sms.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('smsOtherID').style.display="none";
	 	     document.getElementById('smsOtherDisp').style.display="";
	 	     document.getElementById('smsOtherLBL').innerHTML="- "+document.getElementById("smsOtherField").value;
	 	      document.getElementById('smsOtherDispHF').value="- "+document.getElementById("smsOtherField").value;
 	     }
 	    }
 	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==13)
 	   {
 	     document.getElementById('candiReferalField').style.display="none";  
 	     document.getElementById('candiReferalDisp').style.display="";  	  
 	     document.getElementById('candiReferalLBL').innerHTML=document.getElementById("candiReferalD").value;
 	     document.getElementById('candiPhoneField').style.display="none";  
 	     document.getElementById('candiPhoneDisp').style.display="";  	  
 	     document.getElementById('candiPhoneLBL').innerHTML=document.getElementById("candiPhoneD").value;
 	    }
 	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==14)
 	   {
 	     document.getElementById('campusDDL').style.display="none";  
 	     document.getElementById('campusDisp').style.display="";  	  
 	     document.getElementById('campusLBL').innerHTML=candidateSubmitForm.campusD.options[candidateSubmitForm.campusD.selectedIndex].text;
 	     document.getElementById('campusOtherIDHF').value=candidateSubmitForm.campusD.options[candidateSubmitForm.campusD.selectedIndex].text;
 
 	     if(candidateSubmitForm.campusD.options[candidateSubmitForm.campusD.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('campusOtherID').style.display="none";
	 	     document.getElementById('campusOtherDisp').style.display="";
	 	     document.getElementById('campusOtherLBL').innerHTML="- "+document.getElementById("campusOtherField").value;
	 	     document.getElementById('campusOtherDispHF').value="- "+document.getElementById("campusOtherField").value;
 	     }
 	    }
 	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==15)
 	    {
 	     document.getElementById('traingInsituteDDL').style.display="none";  
 	     document.getElementById('traingInsituteDisp').style.display="";  	  
 	     document.getElementById('traingInsituteLBL').innerHTML=candidateSubmitForm.traingInsituteD.options[candidateSubmitForm.traingInsituteD.selectedIndex].text;
 		 document.getElementById('traingInsituteOtherIDHF').value=candidateSubmitForm.traingInsituteD.options[candidateSubmitForm.traingInsituteD.selectedIndex].text;
 
 	     if(candidateSubmitForm.traingInsituteD.options[candidateSubmitForm.traingInsituteD.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('traingInsituteOtherID').style.display="none";
	 	     document.getElementById('traingInsituteOtherDisp').style.display="";
	 	     document.getElementById('traingInsituteOtherLBL').innerHTML="- "+document.getElementById("traingInsituteOtherField").value;
 	         document.getElementById('traingInsituteOtherDispHF').value=" - "+document.getElementById("traingInsituteOtherField").value;
 	     }
 	    }
 	      if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==16)
 	    {
 	     document.getElementById('xEmployeeField').style.display="none";  
 	     document.getElementById('xEmployeeDisp').style.display="";  	  
 	     document.getElementById('xEmployeeLBL').innerHTML=document.getElementById("xEmployeeD").value;
 	     document.getElementById('xEmployeePhoneField').style.display="none";  
 	     document.getElementById('xEmployeePhoneDisp').style.display="";  	  
 	     document.getElementById('xEmployeePhoneLBL').innerHTML=document.getElementById("xEmployeePhoneD").value;
 	    }
 	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==17)
 	    {
  	     document.getElementById('TeleCallTeamDDL').style.display="none";  
  	     document.getElementById('TeleCallTeamDisp').style.display="";  		  
 	     document.getElementById('TeleCallTeamLBL').innerHTML=candidateSubmitForm.TeleCallTeam_REC_Name.options[candidateSubmitForm.TeleCallTeam_REC_Name.selectedIndex].text;
 		 document.getElementById('callingTeamOtherHF').value=candidateSubmitForm.TeleCallTeam_REC_Name.options[candidateSubmitForm.TeleCallTeam_REC_Name.selectedIndex].text;
 	    
 	     if(candidateSubmitForm.TeleCallTeam_REC_Name.options[candidateSubmitForm.TeleCallTeam_REC_Name.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('callingTeamOther').style.display="none";
	 	     document.getElementById('callingteamOtherDisp').style.display="";
	 	     document.getElementById('callingteamOtherLBL').innerHTML="- "+document.getElementById("callingOther").value;
	 	     document.getElementById('callingteamOtherDispHF').value=" - "+document.getElementById("callingOther").value;
 	     }
 	    
 	    }
	if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==18)
	{
		document.getElementById('VendorCityDDL').style.display="none";
		document.getElementById('VendorCityDisp').style.display="";		  
		document.getElementById('VendorCityLBL').innerHTML=candidateSubmitForm.VendorCity.options[candidateSubmitForm.VendorCity.selectedIndex].text;
		document.getElementById('VendorCityHF').value="City Name : "+candidateSubmitForm.VendorCity.options[candidateSubmitForm.VendorCity.selectedIndex].text;

		if(candidateSubmitForm.VendorCity.options[candidateSubmitForm.VendorCity.selectedIndex].text == "Other")
		{
			document.getElementById('VendorCityOther').style.display="none";
			document.getElementById('VendorCityOtherDisp').style.display="";
			document.getElementById('VendorCityOtherLBL').innerHTML="- "+document.getElementById("VendorCityOtherVal").value;
			document.getElementById('VendorNameOther').style.display="none";
			document.getElementById('VendorNameOtherDisp').style.display="";
			document.getElementById('VendorNameOtherLBL').innerHTML="& Vendor : "+document.getElementById("VendorNameOtherVal").value;
		}
		else
		{
			document.getElementById('VendorNameDDL').style.display="none";
			document.getElementById('VendorNameDisp').style.display="";		  
			document.getElementById('VendorNameLBL').innerHTML="& Vendor : "+candidateSubmitForm.VendorName.options[candidateSubmitForm.VendorName.selectedIndex].text;
			document.getElementById('VendorNameHF').value="& Vendor : "+candidateSubmitForm.VendorName.options[candidateSubmitForm.VendorName.selectedIndex].text;

			if(candidateSubmitForm.VendorName.options[candidateSubmitForm.VendorName.selectedIndex].text == "Other")
			{
				document.getElementById('VendorNameOther').style.display="none";
				document.getElementById('VendorNameOtherDisp').style.display="";
				document.getElementById('VendorNameOtherLBL').innerHTML="- "+document.getElementById("VendorNameOtherVal").value;
			}
		}  
	}
	
	document.getElementById('locationDDl').style.display="none";  
	document.getElementById('locationDSP').style.display="";  	  
	document.getElementById('locationLBL').innerHTML=candidateSubmitForm.location.options[candidateSubmitForm.location.selectedIndex].text;

}

function confirmclick() 
{
	document.getElementById("confirm").style.display="none";
	document.getElementById('editbutton').style.display="none";
	document.getElementById("processing").style.display="";
	document.forms["candidateSubmitForm"].submit();
}

function editclick() 
{     
	  document.getElementById("mrs1").style.display="";
      document.getElementById("mrs2").style.display="";
      document.getElementById("mrs3").style.display="";
      document.getElementById("mrs4").style.display="";
      document.getElementById("mrs5").style.display="";
      document.getElementById("mrs6").style.display="";
      document.getElementById("mrs7").style.display="";
      document.getElementById("mrs8").style.display="";
      document.getElementById("mrs9").style.display="";
      document.getElementById("mrs10").style.display="";
      document.getElementById("mrs11").style.display="";
      document.getElementById("mrs12").style.display="";
      document.getElementById("mrs13").style.display="";
      document.getElementById("mrs14").style.display="";
      document.getElementById("mrs15").style.display="";
      document.getElementById("mrs16").style.display="";
      document.getElementById("mrs17").style.display="";
      document.getElementById("mrs18").style.display="";
      document.getElementById("mrs19").style.display="";
      document.getElementById("lblDeclaration").style.display="";
      document.getElementById("DeclarationDisp").style.display="";
      document.getElementById("lblConfirmation").style.display="none";
      document.getElementById("ConfirmationDisp").style.display="none";
      document.getElementById("confirm").style.display="none";
  	  document.getElementById('editbutton').style.display="none";
      document.getElementById("Next_button").style.display="";
      document.getElementById("Back_button").style.display="";
  	  document.getElementById('titleDisp').style.display="none";  	  
  	  document.getElementById('titleDDL').style.display="";
  	  document.getElementById('firstnamefield').style.display="";  
  	  document.getElementById('firstnameDisp').style.display="none";  
  	  document.getElementById('middlenamefield').style.display="";  
  	  document.getElementById('middlenameDisp').style.display="none";	  
  	  document.getElementById('lastnamefield').style.display="";  
  	  document.getElementById('lastnameDisp').style.display="none";
  	  document.getElementById('dobfield').style.display="";  
  	  document.getElementById('dobDisp').style.display="none";
  	  document.getElementById('genderoptions').style.display="";  
  	  document.getElementById('genderoptionsDisp').style.display="none"; 
  	  document.getElementById('stateoptions').style.display="";  
  	  document.getElementById('stateoptionsDisp').style.display="none"; 
  	  document.getElementById('locationDDL').style.display="";  
  	  document.getElementById('locationoptionsDisp').style.display="none";
  	  document.getElementById('CityDDL').style.display="";  
  	  document.getElementById('CityDisp').style.display="none";
  	  document.getElementById('EmailField').style.display="";  
  	  document.getElementById('EmailDisp').style.display="none";
  	  document.getElementById('Mobilefield').style.display="";  
  	  document.getElementById('MobileDisp').style.display="none";
  	  
  	  document.getElementById('Landlinefield').style.display="";
  	  document.getElementById('LandlineDisp').style.display="none";
  	  
  	  document.getElementById('HighestEducField').style.display="";  
  	  document.getElementById('HighestEducDisp').style.display="none";
  	  document.getElementById('QualificationDDL').style.display="";  
  	  document.getElementById('QualificationDisp').style.display="none";
  	  document.getElementById('CompletionField').style.display="";  
  	  document.getElementById('CompletionFieldDisp').style.display="none";
  	  document.getElementById('ClassField').style.display="";  
  	  document.getElementById('ClassFieldDisp').style.display="none";
  	  document.getElementById('WorkExpoptions').style.display="";  
  	  document.getElementById('WorkExpoptionsDisp').style.display="none";

		if ( ( candidateSubmitForm.redioYes[0].checked == true ) ) 
		{ 
	  	  document.getElementById('PreviousOrgField').style.display="";  
	  	  document.getElementById('PreviousOrgDisp').style.display="none";
	  	  document.getElementById('SkillDDL').style.display="";  
	  	  document.getElementById('SkillDisp').style.display="none";
	  	  document.getElementById('RelevantExprienceField').style.display="";  
		  document.getElementById('RelevantExprienceDisp').style.display="none";
		  document.getElementById('NONRelevantExprienceField').style.display="";  
		  document.getElementById('NONRelevantExprienceDisp').style.display="none";
 	    }

  	  document.getElementById('SourceDDL').style.display="";  
  	  document.getElementById('SourceDisp').style.display="none";

	  if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==2)
  	  {
  	      document.getElementById('RefIDField').style.display="";  
		  document.getElementById('RefIDDisp').style.display="none";
		  document.getElementById('empIDField').style.display="";  
		  document.getElementById('empIDDisp').style.display="none";
		  document.getElementById('empNameField').style.display="";  
		  document.getElementById('empNameDisp').style.display="none";
		  document.getElementById('empPhoneField').style.display="";  
		  document.getElementById('empPhoneDisp').style.display="none";
		  document.getElementById('empRefHelpdesk').style.display="";  
	  }
	  if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==3)
  	  {
  	     document.getElementById('jobPortalDDL').style.display="";  
  	     document.getElementById('jobPortalDisp').style.display="none";  	  
 	     if(candidateSubmitForm.jobPortalD.options[candidateSubmitForm.jobPortalD.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('jobPortalOther').style.display="";
	 	     document.getElementById('jobPortalOtherDisp').style.display="none";
 	     } 
  	   }
  	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==4)
  	   {
  	     document.getElementById('ConsultantDDL').style.display="";  
  	     document.getElementById('ConsultantDisp').style.display="none";
  	     if(candidateSubmitForm.Consultant.options[candidateSubmitForm.Consultant.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('ConsultantOther').style.display="";
	 	     document.getElementById('ConsultantOtherDisp').style.display="none";
 	     } 
  	    }
  	     if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==5)
  	   {
  	     document.getElementById('AdvertismentDDL').style.display="";  
  	     document.getElementById('AdvertismentDisp').style.display="none";  	  
  	     if(candidateSubmitForm.Advertisment.options[candidateSubmitForm.Advertisment.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('AdvertismentOther').style.display="";
	 	     document.getElementById('AdvertismentOtherDisp').style.display="none";
 	     }
  	    }
  	     
  	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==6)
  	   {
  	     document.getElementById('otherDField').style.display="";  
  	     document.getElementById('otherDDisp').style.display="none";  	  
  	    }
  	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==7)
 	    {
 	    	document.getElementById('Friends_Relative').style.display="";
 	    }
  	    
  	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==8)
  	    {
  	     document.getElementById('jobFairDDL').style.display="";  
  	     document.getElementById('jobFairDisp').style.display="none";  	  
  	     if(candidateSubmitForm.jobFairD.options[candidateSubmitForm.jobFairD.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('jobFairOther').style.display="";
	 	     document.getElementById('jobFairOtherDisp').style.display="none";
 	     }
  	    }  	    
  	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==9)
  	    {
  	     document.getElementById('emailMailersDDL').style.display="";  
  	     document.getElementById('emailMailersDisp').style.display="none";  	  
  	     if(candidateSubmitForm.emailMailers.options[candidateSubmitForm.emailMailers.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('emailMailersOther').style.display="";
	 	     document.getElementById('emailOtherDisp').style.display="none";
 	     }
 	    }
  	   if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==11)
  	   {
  	     document.getElementById('smsDDL').style.display="";  
  	     document.getElementById('smsDisp').style.display="none";  
  	     if(candidateSubmitForm.sms.options[candidateSubmitForm.sms.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('smsOtherID').style.display="";
	 	     document.getElementById('smsOtherDisp').style.display="none";
 	     }	  
  	    }
  	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==13)
  	   {
  	     document.getElementById('candiReferalField').style.display="";  
  	     document.getElementById('candiReferalDisp').style.display="none";  	  
  	     document.getElementById('candiPhoneField').style.display="";  
  	     document.getElementById('candiPhoneDisp').style.display="none";  	  
  	    }
  	      if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==14)
  	   {
  	     document.getElementById('campusDDL').style.display="";  
  	     document.getElementById('campusDisp').style.display="none";  	  
  	      if(candidateSubmitForm.campusD.options[candidateSubmitForm.campusD.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('campusOtherID').style.display="";
	 	     document.getElementById('campusOtherDisp').style.display="none";
 	     }
  	    }
  	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==15)
  	    {
  	     document.getElementById('traingInsituteDDL').style.display="";  
  	     document.getElementById('traingInsituteDisp').style.display="none";  	  
  	     if(candidateSubmitForm.traingInsituteD.options[candidateSubmitForm.traingInsituteD.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('traingInsituteOtherID').style.display="";
	 	     document.getElementById('traingInsituteOtherDisp').style.display="none";
 	     }
  	    }
  	      if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==16)
  	    {
  	     document.getElementById('xEmployeeField').style.display="";  
  	     document.getElementById('xEmployeeDisp').style.display="none";  	  
  	     document.getElementById('xEmployeePhoneField').style.display="";  
  	     document.getElementById('xEmployeePhoneDisp').style.display="none";  	  
  	    
  	    }
  	    if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==17)
  	    {
  	     document.getElementById('TeleCallTeamDDL').style.display="";  
  	     document.getElementById('TeleCallTeamDisp').style.display="none";  	  
  	     if(candidateSubmitForm.TeleCallTeam_REC_Name.options[candidateSubmitForm.TeleCallTeam_REC_Name.selectedIndex].text == "Other")
 	     {
	 	     document.getElementById('callingTeamOther').style.display="";
	 	     document.getElementById('callingteamOtherDisp').style.display="none";
 	     }
  	    }
  	    
		if(candidateSubmitForm.PrimarySource.options[candidateSubmitForm.PrimarySource.selectedIndex].value==18)
		{
		     document.getElementById('VendorCityDDL').style.display="";  
		     document.getElementById('VendorCityDisp').style.display="none";  	  
			if(candidateSubmitForm.VendorCity.options[candidateSubmitForm.VendorCity.selectedIndex].text == "Other")
			{
				document.getElementById('VendorCityOther').style.display="";
				document.getElementById('VendorCityOtherDisp').style.display="none";	 	     
				document.getElementById('VendorNameOther').style.display="";
				document.getElementById('VendorNameOtherDisp').style.display="none";
			}
			else
			{
				document.getElementById('VendorNameDDL').style.display="";
				document.getElementById('VendorNameDisp').style.display="none";		  
				if(candidateSubmitForm.VendorName.options[candidateSubmitForm.VendorName.selectedIndex].text == "Other")
				{
					document.getElementById('VendorNameOther').style.display="";
					document.getElementById('VendorNameOtherDisp').style.display="none";
				}
			}  
		    
		}
		document.getElementById('locationDDl').style.display="";  
 	  	document.getElementById('locationDSP').style.display="none";  	  
		
  	   
}
</script>

<script type="text/javascript">
function display_id(obj) 
{
	txt = obj.options[obj.selectedIndex].value;
	document.getElementById('empInfo').style.display = 'none';	
  	document.getElementById('jobPortal').style.display = 'none';  	
  	document.getElementById('ConsultantID').style.display = 'none';  	
  	document.getElementById('AdvertismentID').style.display = 'none';
  	document.getElementById('otherDAta').style.display = 'none'; 
  	document.getElementById('Friends_Relative').style.display = 'none'; 
  	document.getElementById('jobFair').style.display = 'none';  
    document.getElementById('emailMailersID').style.display = 'none';
    document.getElementById('smsID').style.display = 'none';
	document.getElementById('candiReferal').style.display = 'none';
	document.getElementById('campus').style.display = 'none';
	document.getElementById('traingInsitute').style.display = 'none';
	document.getElementById('xEmployee').style.display = 'none';
	document.getElementById('TeleCallTeam').style.display = 'none';
	document.getElementById('Vendor').style.display = 'none';
	
	// if(txt=='1'){};	
	if(txt=='2'){ document.getElementById('empInfo').style.display = ''};
	if(txt=='3'){ document.getElementById('jobPortal').style.display = ''};
	if(txt=='4'){ document.getElementById('ConsultantID').style.display = ''};
	if(txt=='5'){ document.getElementById('AdvertismentID').style.display = ''};
	if(txt=='6'){ document.getElementById('otherDAta').style.display = ''};
	if(txt=='7'){ document.getElementById('Friends_Relative').style.display = ''};
	if(txt=='8'){ document.getElementById('jobFair').style.display = ''};
	if(txt=='9'){ document.getElementById('emailMailersID').style.display = ''};
	// if(txt=='10'){};
	if(txt=='11'){ document.getElementById('smsID').style.display = ''};
	// if(txt=='12'){};
	if(txt=='13'){document.getElementById('candiReferal').style.display = ''};
	if(txt=='14'){document.getElementById('campus').style.display = ''};
	if(txt=='15'){document.getElementById('traingInsitute').style.display = ''};
	if(txt=='16'){document.getElementById('xEmployee').style.display = ''};
	if(txt=='17'){document.getElementById('TeleCallTeam').style.display = ''};
	if(txt=='18'){document.getElementById('Vendor').style.display = ''};
}
</script>

<script type="text/javascript">
function validate(candidateSubmitForm,Email_id) 
{ 
   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
   var address = document.forms[candidateSubmitForm].elements[Email_id].value;
   if(reg.test(address) == false) 
   { 
		 document.getElementById('openPOP').click();
		 document.getElementById('dispMSG').innerHTML = 'Please Enter Valid Email Id !';
		 document.getElementById('closeblock').focus();
		 myFunction();
 
	   //alert('Please Enter Valid Email Id !');      
       document.getElementById('Email_id').focus();
       return false;
   }
}
</script>	


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
function selectStateGetDistrict()
{
		
		document.getElementById("Current_city").disabled=false;
		
		getStateListCity();
}
function getStateListCity()	
{	
	
	var cp=document.getElementById("Current_Location").value;
	
	if (cp != "0")
	{
	    var url="<%=request.getContextPath()%>/jsp/CityList.jsp";	    
		url=url+"?sid="+Math.random();
		url=url+"&countryId="+cp; 
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
	 document.getElementById('Current_city').options.length = 0;	
     arry[0] = document.createElement('option');  
	 arry[0].text = '-- Select City --';
	 arry[0].value ='0';
	 document.getElementById('Current_city').options[0]= arry[0];	
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
		document.getElementById('Current_city').options.length = 0;
		arry[i] = document.createElement('option');  
		arry[i].text = '-- Select City --';
		arry[i].value ='0';
		document.getElementById('Current_city').options[i]= arry[i];	
		for(i=1;i<idata.length;i++)
		{
			fenName = idata[i-1].split(":");
			arry[i] = document.createElement('option');  
			arry[i].text = fenName[1].trim();
			arry[i].value = fenName[0].trim();
			document.getElementById('Current_city').options[i]= arry[i];	
		}
		arry[i] = document.createElement('option');  
		arry[i].text = 'Other';
		arry[i].value ='Other';
		document.getElementById('Current_city').options[i]= arry[i];	
	}
}

function redirectBack()
{
	window.location.href ="<%=request.getContextPath()%>/247Recruit/jsp/Main_Instruction_Page.jsp";
}
</script>
<script type="text/javascript">
function otherChk(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('jobPortalOther').style.display = 'none';	
	if(vis=='0'){document.getElementById('jobPortalOther').style.display = ''};	
}
</script> 

<script type="text/javascript">
function otherChkA(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('ConsultantOther').style.display = 'none';	
	if(vis=='0'){document.getElementById('ConsultantOther').style.display = ''};	
}
</script>
<script type="text/javascript">
function otherChkB(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('AdvertismentOther').style.display = 'none';	
	if(vis=='0'){document.getElementById('AdvertismentOther').style.display = ''};	
}
</script>
<script type="text/javascript">
function otherChkC(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('jobFairOther').style.display = 'none';	
	if(vis=='0'){document.getElementById('jobFairOther').style.display = ''};	
}
</script>
<script type="text/javascript">
function otherChkD(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('emailMailersOther').style.display = 'none';	
	if(vis=='0'){document.getElementById('emailMailersOther').style.display = ''};	
}
</script>
<script type="text/javascript">
function otherChkE(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('smsOtherID').style.display = 'none';	
	if(vis=='0'){document.getElementById('smsOtherID').style.display = ''};	
}
</script>
<script type="text/javascript">
function otherChkF(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('campusOtherID').style.display = 'none';	
	if(vis=='0'){document.getElementById('campusOtherID').style.display = ''};	
}
</script>
<script type="text/javascript">
function otherChkG(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('traingInsituteOtherID').style.display = 'none';	
	if(vis=='0'){document.getElementById('traingInsituteOtherID').style.display = ''};	
}
</script>
<script type="text/javascript">
function otherChkH(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	//document.getElementById('callingTeamOther').style.display = 'none';	
	if(vis=='0')
	{
		document.getElementById('callingTeamOther').style.display = '';
	}
	else
	{
		document.getElementById('callingTeamOther').style.display = 'none';
	}	
}
</script>

<script type="text/javascript">
function otherChkVen(obj)
{
	var vis = obj.options[obj.selectedIndex].value;	
	if(vis=='0')
	{
		// VendorNameOther
		document.getElementById('VendorCityOther').style.display = '';
		document.getElementById('VendorNameOther').style.display = '';
		document.getElementById('VendorNameDDL').style.display = 'none';
	}
	else
	{
		document.getElementById('VendorCityOther').style.display = 'none';
		document.getElementById('VendorNameOther').style.display = 'none';
		document.getElementById('VendorNameDDL').style.display = '';		
		if (vis != "0")
		{
		    var url="<%=request.getContextPath()%>/247Recruit/jsp/getVendorNameList.jsp";
			url=url+"?venid="+Math.random();
			url=url+"&cityListID="+vis; 
		    var request = GetXmlHttpObject();
		    if (request==null)
		    {
		 		 alert("Your browser does not support AJAX!");
				 return false;
			}
			request.onreadystatechange = function () 
			{		
				vanderGetResponse(request);
			};
			request.open("POST", url, true);
			request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			request.send(null);
		}
		else
		{
		 var arry = new Array(0);
		 document.getElementById('VendorCity').options.length = 0;	
	     arry[0] = document.createElement('option');  
		 arry[0].text = '-- Select Vendor Name --';
		 arry[0].value ='';
		 document.getElementById('VendorCity').options[0]= arry[0];	
		}        
	}
}

function vanderGetResponse(request)
{
	if(request.readyState==4 && request.status==200)
	{
		var data = request.responseText;
		idata=data.split(",");
		var arry = new Array(idata.length+1);
		var i = 0;
		document.getElementById('VendorName').options.length = 0;	
		arry[i] = document.createElement('option');  
		arry[i].text = '-- Select Vendor name --';
		arry[i].value ='';
		document.getElementById('VendorName').options[i]= arry[i];	
		
		for(i=1;i<idata.length;i++)
		{
			fenName = idata[i-1].split(":");
			arry[i] = document.createElement('option');  
			arry[i].text = fenName[1].trim();
			arry[i].value =fenName[0].trim();
			document.getElementById('VendorName').options[i]= arry[i];	
		}
		
		arry[i] = document.createElement('option');  
		arry[i].text = 'Other';
		arry[i].value ='0';
		document.getElementById('VendorName').options[i]= arry[i];	
	}
}
</script>

<script type="text/javascript">
function chkOthersVen(venName)
{
	var venNameData = venName.options[venName.selectedIndex].value;	
	if(venNameData=='0')
	{
		document.getElementById('VendorNameOther').style.display = '';		
	}
	else
	{
		document.getElementById('VendorNameOther').style.display = 'none';		
	}
	
}
</script>
<script type="text/javascript">
function callEmpReferal()
{
	document.getElementById('Friends_Relative').style.display = 'none';
	document.getElementById('empInfo').style.display = '';
	candidateSubmitForm.PrimarySource.selectedIndex = 4;
	
}
</script>
</head>
<body >
	 <table border="0" cellpadding="0" cellspacing="0" width="100%">
	     <tr>
	        <td align="left">
	            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	    </tr>	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:10px;">
			</td>
		</tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">Registration > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Personal Information Form</font>
	        </td>
	        <td align="right"></td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        <!-- ********************************************** -->

<div class="wrapper">
<div class="contentSize">
<form action="<%=request.getContextPath()%>/CanRegPage" method="post" name="candidateSubmitForm"  id="candidateSubmitForm" accept-charset="utf-8" onsubmit="return chkRegistrationValidation();">
<input type="hidden" name="target" id="target" value="CandidateRegis"/>
				<!--  Personaml Information Registration Form Table Start -->
					
					<br>
					
				    <table border="0" cellpadding="6" cellspacing="6" class="tPersonal">
						 <tr class="allBackColor">
							<td class="allBackColor" rowspan="2" style="width: 150px; background-color: #d8d8d8;" align="left">
								Name
							</td>
							<td style="background-color: #d8d8d8;" align="left">
								Title <span class="redTxt" id="mrs1">*</span>								
							</td>
							<td style="background-color: #d8d8d8;" align="left">
								First Name <span class="redTxt" id="mrs2">*</span>								
							</td>
							<td style="background-color: #d8d8d8;" align="left">
								Middle Name / Initial
							</td>
							<td style="background-color: #d8d8d8;" align="left">
								Last Name / Surname <span class="redTxt" id="mrs3">*</span>
							</td>							
						 </tr>
						 
						 <tr class="allBackColor">
						 	<td align="left" class="allTdBackColor" style="width: 175px;">
								<div class="txt-box" id="titleDDL">
									<select name="title" id="title" class="reSizeforOther">
									    <option value="">---Select---</option>
								<% 		 
				              	String secQsnQry = "SELECT * FROM  title_master";
								//   System.out.println("query "+secQsnQry);
								Statement stmttitle = con.createStatement();
								ResultSet rstitle = stmttitle.executeQuery(secQsnQry);
								//   System.out.println("Result Set Hash Cose \t "+rstitle);
								while(rstitle.next())
								{%>
									<option value="<%=rstitle.getString("Title_Value")%>"><%=rstitle.getString("Title_Name")%></option>	
							   <%	
							     }
							     rstitle.close();
							     //   System.out.println("Result Set Hash Cose \t "+rstitle);
							    %>
									</select>
								</div>
								<div id="titleDisp" style="display: none;">
									<label id="titleLBL"></label>
								</div>
							</td>
							<td align="left" class="allTdBackColor" style="width: 175px;">
								<div id="firstnamefield">
									<input type="text" name="firstName" id="firstName" maxlength="25" class="reSizeforOther" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" onblur="SetNamingConvention(this);"/>
								</div>
								<span id="mail_id" class="redTxt"></span>
								<div id="firstnameDisp" style="display: none;">
									<label id="firstnameLBL"></label>
								</div>
							</td>
							<td align="left" class="allTdBackColor" style="width: 175px;">
								<div id="middlenamefield">
									<input type="text" name="middleName" id="middleName" maxlength="25" class="reSizeforOther" onkeypress="return AllowAlphabetAndSpace(event);" oncopy="return false" onpaste="return false" oncut="return false" onblur="SetNamingConvention(this);"/>
								</div>
								<div id="middlenameDisp" style="display: none;">
									<label id="middlenameLBL"></label>
								</div>
							</td>
							<td align="left" class="allTdBackColor" style="width: 175px;">
								<div id="lastnamefield">
									<input type="text" name="lastName" id="lastName" maxlength="25" class="reSizeforOther" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" onblur="SetNamingConvention(this);"/>
								</div>
								<div id="lastnameDisp" style="display: none;">
									<label id="lastnameLBL"></label>
								</div>
							</td>
							
						</tr>
						<tr>
							<td class="allBackColor" style="width: 150px; background-color: #d8d8d8;" title="Cannot register if age is less then 18 years." align="left">
								Date of Birth <span class="redTxt" id="mrs4">*</span>
							</td>
							<td align="left" class="allBackColor" valign="middle" title="Cannot register if age is less then 18 years.">
								<div id="basic_container" style="display:none" title="Cannot register if age is less then 18 years."></div>
								    <div id="dobfield" title="Cannot register if age is less then 18 years.">
									 <input class="datepicker" style="height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;background-color: white;border: 1px solid #C8C8C8;" name="dob" size="20" id="dob" type="text" onblur="checkAge()" onchange="checkAge()" readonly="readonly" title="Cannot register if age is less then 18 years.">
									</div>
									<div id="multi_container" style="display:none"></div>
                                <span id="uname_id"></span>
                                <div id="dobDisp" style="display: none;">
									<label id="dobLBL"></label>
								</div>
							</td>
							<td class="allBackColor" style="background-color: #d8d8d8;" align="left">
								Gender <span class="redTxt" id="mrs5">*</span>
							</td>
							<td class="allTdBackColor" colspan="2" align="left">
								<div id="genderoptions">			  
								   <input name="radiobutton" value="Male" type="radio" id="radiobutton" maxlength="1"> Male
                             	   <input name="radiobutton" value="Female" type="radio" id="radiobutton" maxlength="1"> Female							
							    </div>
							    <div id="genderoptionsDisp" style="display: none;">
									<label id="genderoptionsLBL"></label>
								</div>
							</td>
						</tr>
						
						
						<tr>
							<td class="allBackColor" style="width: 150px; background-color: #d8d8d8;" title="The state you were born in." align="left">
								Native State<span class="redTxt" id="mrs6">*</span>
							</td>
							<%						
							try
							{
								String queryForState="SELECT StateId, stateName FROM mststate WHERE stateId NOT IN (1,68) ORDER BY stateName";
								con=ConnectDatabase.getConnection();
								stmt=con.createStatement();
								
								rs=stmt.executeQuery(queryForState);
								//   System.out.println("Result Set Hash Code 2\t "+rs);
							 %>
							
							<td align="left" class="allTdBackColor" title="The state you were born in.">
							<div id="stateoptions" title="The state you were born in.">
								<select name="nativeState" id="nativeState" class="reSizeforOther" title="The state you were born in.">
									<option value="">---Select---</option>
									
									<%
									while(rs.next())
								    {								
									 %>
										<option value="<%=rs.getString("StateId")%>"><%=rs.getString("stateName")%></option>
									 <%
									}
									rs.close();
									%>
								</select>
								</div>
								<div id="stateoptionsDisp" style="display: none;">
									<label id="stateoptionsLBL"></label>
								</div>
							</td>
							
							<td class="allBackColor" style="background-color: #d8d8d8;" title="Current City & State you are living in." align="left">
								Current Location<span class="redTxt" id="mrs7">*</span>
							</td>							
							
							<td align="left" class="allTdBackColor" title="Current State you are living in.">
							<div id="locationDDL" title="Current State you are living in.">
								<select name="Current_Location" id="Current_Location" class="reSizeforOther" onchange="selectStateGetDistrict()" onkeyup="selectStateGetDistrict()" title="Current State you are living in.">
									<option value="0">-- Select State --</option>								
										<%
										String queryForCity="SELECT StateId, stateName FROM mststate WHERE stateId NOT IN (1,68) ORDER BY stateName";
										Statement zx=con.createStatement();
									    ResultSet sdsd=zx.executeQuery(queryForCity);
									    //   System.out.println("Result Set Hash Cose 3\t "+sdsd);
										while(sdsd.next())
								    	{								
										 %>
										<option value="<%=sdsd.getString("StateId")%>"><%=sdsd.getString("stateName")%></option>
										 <%
										}
										sdsd.close();
										%>									
									<option value="68">Other</option>								
								</select>
								</div>
								<div id="locationoptionsDisp" style="display: none;">
									<label id="locationoptionsLBL"></label>
								</div>
							</td>
							<td align="left" class="allTdBackColor" title="Current City you are living in.">
							<div id="CityDDL" title="Current City you are living in.">
								<select name="Current_city" id="Current_city" class="reSizeforOther" title="Current City you are living in.">
									<option value="">-- Select City --</option>
								</select>
								</div>
								<div id="CityDisp" style="display: none;">
									<label id="CityLBL"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="allBackColor" style="width: 150px; background-color: #d8d8d8;" align="left">
								Personal Email id <span class="redTxt" id="mrs8">*</span>
							</td>
							<td align="left" class="allTdBackColor">
								<div id="EmailField">
									<input type="text" name="Email_id" id="Email_id" maxlength="240" class="reSizeforOther" onchange="javascript:return validate('candidateSubmitForm','Email_id');" oncopy="return false" onpaste="return false" oncut="return false"/>
								</div>
								<div id="EmailDisp" style="display: none;">
									<label id="EmailLBL"></label>
								</div>
							</td>
							<td class="allBackColor" style="background-color: #d8d8d8;" align="left">
								Mobile / Landline No<span class="redTxt" id="mrs9">*</span>
							</td>
							<td align="left" class="allTdBackColor" nowrap="nowrap">
								<div id="Mobilefield">
									<input type="text" name="preFixPh" id="preFixPh" value="+91" style="background-color: #f5f5f5;width: 27px;text-align: center; border: 1px solid #C8C8C8; height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" readonly="readonly">
									<input type="text" name="mobile" id="mobile" onkeypress="return isNumberKey(event);" maxlength="10" class="wmta" style="width: 145px;border: 1px solid #C8C8C8 ;height: 20px;" onblur="Blur(this.id,'Mobile')" onfocus="Focus(this.id,'Mobile')" value="Mobile" oncopy="return false" onpaste="return false" oncut="return false"/>
								</div>
								<div id="MobileDisp" style="display: none;">
									<label id="MobileLBL"></label>
								</div>
							</td>
							<td align="left" class="allTdBackColor" nowrap="nowrap">
								<div id="Landlinefield">
									<input type="text" name="preFixLand" id="preFixLand" maxlength="4" onkeypress="return isNumberKey(event);" style="width: 45px;text-align: center; border: 1px solid #C8C8C8; height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="wmta" onblur="Blur(this.id,'STD')" onfocus="Focus(this.id,'STD')" value="STD" oncopy="return false" onpaste="return false" oncut="return false">
									<input type="text" name="Landline" id="Landline" onkeypress="return isNumberKey(event);" maxlength="8" class="wmta" style="width: 127px;" onblur="Blur(this.id,'Landline')" onfocus="Focus(this.id,'Landline')" value="Landline" oncopy="return false" onpaste="return false" oncut="return false"/>
								</div>
								<div id="LandlineDisp" style="display: none;">
									<label id="LandlineLBL"></label>
								</div>
							</td>
						</tr>

						<tr class="allBackColor">
						    <td align="left" rowspan="2" style="width: 150px; background-color: #d8d8d8;">
								Highest Completed Education
							</td>
							<td align="left" nowrap="nowrap" style="background-color: #d8d8d8;">
								School/ Institute Name <span class="redTxt" id="mrs10">*</span>
							</td>
							<td align="left" nowrap="nowrap" style="background-color: #d8d8d8;">
								Qualification <span class="redTxt" id="mrs11">*</span>
							</td>
							
							<td align="left" nowrap="nowrap" style="background-color: #d8d8d8;">
								Year of Completion <span class="redTxt" id="mrs12">*</span>
							</td>
							
							<td align="left" nowrap="nowrap" style="background-color: #d8d8d8;">
								Class / &nbsp;Grad /&nbsp; <b>%</b> <span class="redTxt" id="mrs13">*</span>
							</td>

						</tr>
						<tr class="allTdBackColor">
						
							<td align="left">
								<div id="HighestEducField">
									<input type="text" name="SchoolName" id="SchoolName" class="reSize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
								</div>
								<div id="HighestEducDisp" style="display: none;">
									<label id="HighestEducLBL"></label>
								</div>
							</td>
							<td align="left">
								<div id="QualificationDDL">
									<select id="Qualification" name="Qualification" class="reSize" >
										<option value="">---Select---</option>
										<%
										String queryForqualification="SELECT qualificationgroupid, qualificationgroupname FROM  mstqualificationgroup ORDER BY qualificationgroupid";
										stQualification=con.createStatement();
										rsQualification=stQualification.executeQuery(queryForqualification);
										while(rsQualification.next())
								    	{								
										 %>
										<option value="<%=rsQualification.getString("qualificationgroupid")%>"><%=rsQualification.getString("qualificationgroupname")%></option>
										 <%
										}
										%>									
									</select>
								</div>
								<div id="QualificationDisp" style="display: none;">
									<label id="QualificationLBL"></label>
								</div>
							</td>
						
							<td align="left" nowrap="nowrap">
								<div id="CompletionField">
									<input type="text" name="CompletionYear" id="CompletionYear" style="height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;background-color: white;border: 1px solid #C8C8C8;" class="datepicker" readonly="readonly"/>
								</div>
								<div id="CompletionFieldDisp" style="display: none;">
									<label id="CompletionFieldLBL"></label>
								</div>
							</td>
							
							<td align="left">
								<div id="ClassField">
									<input type="text" name="ClassPer" id="ClassPer" class="reSize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
								</div>
								<div id="ClassFieldDisp" style="display: none;">
									<label id="ClassFieldLBL"></label>
								</div>
							</td>
						</tr>
					<tr>
						<td align="left" class="allBackColor" style="width: 150px; background-color: #d8d8d8;" title="All working experience is considered.">
							Work Experience <span class="redTxt" id="mrs14">*</span>
						</td>
						<td class="allTdBackColor" colspan="4" align="left">
						<div id="WorkExpoptions"  title="All working experience is considered.">	
							       <input name="redioYes" title="All working experience is considered." value="Y" type="radio" id="redioYes" onclick="showOption(this.value);"> Yes
                             	   <input name="redioYes" title="All working experience is considered." value="N" type="radio" id="redioYes" onclick="showOption(this.value);"> No	
                             	   </div>
                             	<div id="WorkExpoptionsDisp" style="display: none;">
									<label>No</label>
								</div>   					
						<!-- ************    this for On Select Radio Button Experience ****************** -->
						<div id="displayExpOnChange" style="display: none;">
							<table border="0" cellpadding="6" cellspacing="6">
							<tr>
								<td class="allTdBackColor" style="background-color: #d8d8d8; width: 175px;"  align="left">
									Name of Prev Org <span class="redTxt" id="mrs15">*</span>
								</td>
								<td align="left" class="allTdBackColor" style="background-color: #F2F2F2;width: 175px;">
								<div id="PreviousOrgField">
									<input type="text" name="PriviousORG" id="PriviousORG" maxlength="60" class="reSizeforOther" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									</div>
									<div id="PreviousOrgDisp" style="display: none;">
									<label id="PreviousOrgLBL"></label>
								</div>
								</td>
								<td class="allBackColor" style="background-color: #d8d8d8; width: 175px;" align="left">
									Current Skill Set <span class="redTxt" id="mrs15">*</span>
								</td>
								<td align="left" class="allTdBackColor" style="background-color: #F2F2F2;width: 175px;">
								<div id="SkillDDL">
									<select name="CurrentSkill" class="reSizeforOther" id="CurrentSkill">
										<option value="">---Select---</option>
										<%
										String queryForSkillSet="SELECT * FROM current_skill_master ORDER BY Current_Skill_id asc";
										stcurrentskill=con.createStatement();
										rscurrentskill=stcurrentskill.executeQuery(queryForSkillSet);
										
										while(rscurrentskill.next())
								    	{								
										 %>
											<option value="<%=rscurrentskill.getString("Current_Skill_id")%>"><%=rscurrentskill.getString("Current_Skill_name")%></option>
										 <%
										}
										rscurrentskill.close();
										%>	
									</select>
									</div>
								<div id="SkillDisp" style="display: none;">
									<label id="SkillLBL"></label>
								</div>
								</td>
							</tr>
							<tr>
								<td align="left" class="allBackColor" style="background-color: #d8d8d8; width: 175px;" title="Any customer facing experience.">
									Customer Interaction Experience <span class="redTxt" id="mrs16">*</span>&nbsp;&nbsp;&nbsp;<font color="red" size="1">(in months)</font>
								</td>
								<td align="left" class="allTdBackColor" style="background-color: #F2F2F2;width: 175px;">
								<div id="RelevantExprienceField">
									<input type="text" name="RelevantExprience" id="RelevantExprience"  class="reSizeforOther" maxlength="3" onkeypress="return isNumberKey(event);"/>
								</div>
								<div id="RelevantExprienceDisp" style="display: none;">
									<label id="RelevantExprienceLBL"></label>
								</div>
								</td>
								<td align="left" class="allBackColor" style="background-color: #d8d8d8; width: 175px;" title="Any non customer facing experience.">
									Other Experience <span class="redTxt" id="mrs17">*</span><br><font color="red" size="1">(in months)</font>
								</td>
								<td align="left" class="allTdBackColor" style="background-color: #F2F2F2;width: 175px;">
								<div id="NONRelevantExprienceField">
									<input type="text" name="NONRelevantExprience" id="NONRelevantExprience"  class="reSizeforOther" maxlength="3" onkeypress="return isNumberKey(event);"/>
								</div>
								<div id="NONRelevantExprienceDisp" style="display: none;">
									<label id="NONRelevantExprienceLBL"></label>
								</div>
								</td>
							</tr>
						  </table>
						</div>
					 	<!-- ************ End for  Select Redio Button Exprience ****************** -->				
						</td>
					</tr>

					 <tr class="allBackColor">
						<td align="left" style="width: 150px; background-color: #d8d8d8;" title="How did you come to know about [24]7">
							Primary Source <span class="redTxt" id="mrs18">*</span>
						</td>
						<td align="left" class="allTdBackColor">
						 <%
						        String priSOurce=null;
						        Statement stmt_source=null;
							    ResultSet rs_source=null;
							    
							  	String queryForSource="SELECT source_id, source_name FROM source_from WHERE is_Active=0 ORDER BY order_No";
								con=ConnectDatabase.getConnection();
								stmt_source=con.createStatement();
								rs_source=stmt_source.executeQuery(queryForSource);
						 %>
						     <div id="SourceDDL">
						     <select name="PrimarySource" class="reSizeforOther" id="PrimarySource" onchange="display_id(this)" onkeyup="display_id(this)">								
								
								<option value="">---Select---</option>
								<%
								while(rs_source.next())
								{
								
								 %>
								<option value="<%=rs_source.getString("source_id")%>"><%=rs_source.getString("source_name")%></option>
								<%
								}
								rs_source.close();
							}
						    catch(Exception ex)
						    {
							   //   System.out.println("Error Message Display : "+ex.getMessage());
							   ex.printStackTrace();
						    }
						 %>
							</select>
							
							</div>
							<div id="SourceDisp" style="display: none;">
									<label id="SourceLBL"></label>
									<input type="hidden" name="SourceLBLHF" id="SourceLBLHF"/>
									
							</div>
						</td>
						<td class="allTdBackColor" colspan="3" style="height: 20px;" nowrap="nowrap">
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->							
									<!-- web site -->
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<div id="empInfo" style="display: none;">
							<table border="0" cellpadding="0" cellspacing="0">
							  <tr class="allBackColor">
								<td> 
								<div id="RefIDField">
									<input type="text" name="RefID" id="RefID" class="wmta" onblur="Blur(this.id,'Referal Id')" onfocus="Focus(this.id,'Referal Id')" value="Referal Id" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" maxlength="10" onkeypress="return isNumberKey(event);"/>
								</div>
								<div id="RefIDDisp" style="display: none;">
									Ref. Id : <label id="RefIDLBL"></label>,
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td> 
								<div id="empIDField">
									<input type="text" name="empID" id="empID" class="wmta" onblur="Blur(this.id,'Employee Id')" onfocus="Focus(this.id,'Employee Id')" value="Employee Id" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" maxlength="10" onkeypress="return isNumberKey(event);"/>
								</div>
								<div id="empIDDisp" style="display: none;">
									Emp. Id : <label id="empIDLBL"></label>,
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="empNameField">
									<input type="text" name="empName" id="empName" maxlength="50" class="wmta" onblur="Blur(this.id,'Employee Name')" onfocus="Focus(this.id,'Employee Name')" value="Employee Name" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowAlphabet(event);"/>
								</div>
								<div id="empNameDisp" style="display: none;">
									Emp. Name : <label id="empNameLBL"></label>,
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="empPhoneField">
									<input type="text" name="empPhone" id="empPhone" maxlength="10" class='wmta' onblur="Blur(this.id,'Phone Number')" onfocus="Focus(this.id,'Phone Number')" value="Phone Number" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" maxlength="10" onkeypress="return isNumberKey(event);"/>
								</div>
								<div id="empPhoneDisp" style="display: none;">
									Phone # : <label id="empPhoneLBL"></label>
							    </div>
								</td>
							  </tr>
							</table>
							<div id="empRefHelpdesk">
								<font color="red" size="1">For any information or details on Employee Referral please call the Employee Referral helpline 9901302246</font>
						    </div>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="jobPortal" style="display:none;">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							  
							  <td>
								 Name :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="jobPortalDDL">
								 <select name="jobPortalD" id="jobPortalD" class="reSizeforOther" onchange="return otherChk(this);">
								 	<option value="">---Select---</option>		
								 	<%
								 	    String PortalDate=null;
								 	    SimpleDateFormat formatter = new SimpleDateFormat(" MMM yyyy ");
								 	    String dateStr=null;
								 	    String jobPortalDH=null;
								 	    try
								 	    {
										String queryForSkillSet="SELECT Job_Portal_Id,Job_Portal_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(Job_Portal_Date,'%b %Y'),' ]'),'') AS Job_Portal_Date FROM job_portal_master WHERE Is_Active = 1";
										stcurrentskill=con.createStatement();
										rscurrentskill=stcurrentskill.executeQuery(queryForSkillSet);
										while(rscurrentskill.next())
								    	{	
								    		try
								    		{	
								    			String valueData=rscurrentskill.getString("Job_Portal_Id");							    	
								    			String textData=rscurrentskill.getString("Job_Portal_Name"); 
									    		dateStr = rscurrentskill.getString("Job_Portal_Date");
												jobPortalDH =textData+""+dateStr;
												//   System.out.println("valueData---:  "+valueData);
												//   System.out.println("textData---:  "+textData);
												//   System.out.println("dateStr---:  "+dateStr);

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
											//   System.out.println("message---:  "+ex.getCause());
											//   System.out.println("message---:  "+ex.getMessage());
											ex.printStackTrace();
											con.close();
										}
										
										%>				 		
								 	<option value="0">Other</option>		
								 </select>
								 </div>
								 <div id="jobPortalDisp" style="display: none;">
									<label id="jobPortalLBL"></label>
									
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="jobPortalOther" style="display: none;">
									<input type="text" name="JPOther" id="JPOther" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
								    <input  type="hidden" id="jobPortalHF" name="jobPortalHF"/>
								</div>
								<div id="jobPortalOtherDisp" style="display: none;">
									<label id="jobPortalOtherLBL"></label>
								    <input  type="hidden" id="jobPortalOtherHF" name="jobPortalOtherHF"/>
							    </div>
								</td>
								</tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="ConsultantID" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							  
							  <td>
								 Name:
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="ConsultantDDL">
								 <select name="Consultant" id="Consultant" class="reSizeforOther" onchange="return otherChkA(this);">								
									<option value="">---Select---</option>
								<%
									String valueConsult=null;// SELECT Consultant_Value , Consultant_Name, Is_Active  FROM consultant_master WHERE Is_Active = 1 ORDER BY  consultant_name ASC 
							        String secQueryconsultant= "SELECT Consultant_Value , Consultant_Name  FROM consultant_master WHERE Is_Active = 1 and is_Deleted = 0 ORDER BY  consultant_name ASC ";			        
								  	Statement stmtconsultant = con.createStatement();
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
								<option value="0">Other</option>
								 </select>
								 
								 </div>
								 <div id="ConsultantDisp" style="display: none;">
									<label id="ConsultantLBL"></label>
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="ConsultantOther" style="display: none;">
									<input type="text" name="ConsOther" id="ConsOther" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									<input  type="hidden" id="ConsOtherHF" name="ConsOtherHF"/>
								</div>
								<div id="ConsultantOtherDisp" style="display: none;">
									<label id="ConsultantOtherLBL"></label>
									<input  type="hidden" id="ConsultantOtherHF" name="ConsultantOtherHF"/>
							    </div>
								</td>
								</tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="AdvertismentID" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							   <td>
								Posted In :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="AdvertismentDDL">
								<select id="Advertisment" name="Advertisment" class="reSizeforOther" onchange="return otherChkB(this);">
									<option value="">---Select---</option>
								<%
									String AdvtH=null;
							        String secQueryadvertisment= "SELECT Advertisment_Id,Advertisment_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(Advertisment_Date,'%b %Y'),' ]'),'') AS Advertisment_Date FROM advertisment_master WHERE Is_Active = 1";			        
								  	Statement stmtadvertisment = con.createStatement();
									ResultSet rsadvertisment = stmtadvertisment.executeQuery(secQueryadvertisment);
									while(rsadvertisment.next())
									{	
								    		try
								    		{	
								    			String valueData=rsadvertisment.getString("Advertisment_Id");							    	
								    			String textData=rsadvertisment.getString("Advertisment_Name"); 
									    		dateStr = rsadvertisment.getString("Advertisment_Date");
												AdvtH= textData+""+dateStr;
												//   System.out.println("valueData---:  "+valueData);
												//   System.out.println("textData---:  "+textData);
												//   System.out.println("dateStr---:  "+dateStr);
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
								 	<option value="0">Other</option>		
								</select>
								<input type="hidden" name="AdvertismentH" value="<%=AdvtH%>">
								</div>
								<div id="AdvertismentDisp" style="display: none;">
									<label id="AdvertismentLBL"></label>
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="AdvertismentOther" style="display: none;">
									<input type="text" name="AdvertisOther" id="AdvertisOther" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									<input  type="hidden" id="AdvertismentOtherHF" name="AdvertismentOtherHF"/>
								</div>
								<div id="AdvertismentOtherDisp" style="display: none;">
									<label id="AdvertismentOtherLBL"></label>
									<input  type="hidden" id="AdvertismentOtherDispHF" name="AdvertismentOtherDispHF"/>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->	
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="otherDAta" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							   <td>
								Details :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="otherDField">
									<input name="otherD" id="otherD" type="text" class='wmta' onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details"  style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" >
								</div>
								<div id="otherDDisp" style="display: none;">
									<label id="otherDLBL"></label>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->	
							
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<!-- friends & relative -->
							<div id="Friends_Relative" style="display:none">
								<input type="button" value="Please click here if your friend/relative is an employee at [24]7" onclick="callEmpReferal()" style="font-size: 10px; padding-bottom: 2px;"/>
								<br/>
								<font color="red" size="1">For any information or details on Employee Referral please call the Employee Referral helpline 9901302246</font>
							</div>
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="jobFair" style="display:none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							    <td>
									Details :
								</td> 
								<td style="width: 5px;"></td>
								<td>
								<div id="jobFairDDL">
								 <select name="jobFairD" id="jobFairD" class="reSizeforOther" onchange="return otherChkC(this);">
								 <option value="">---Select---</option>								 		
								 <%
								 	String jobFairDHd=null;
							        String secQueryjobFair= "SELECT jobfair_Id,jobfair_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(jobfair_Date,'%b %Y'),' ]'),'') AS jobfair_Date  FROM jobfair_master";			        
								  	Statement stmtjobFair = con.createStatement();
									ResultSet rsjobFair = stmtjobFair.executeQuery(secQueryjobFair);
									while(rsjobFair.next())
									{	
										try
										{
							    			String valueData=rsjobFair.getString("jobfair_Id");							    	
							    			String textData=rsjobFair.getString("jobfair_Name"); 
								    		dateStr = rsjobFair.getString("jobfair_Date");
											jobFairDHd =textData+""+dateStr;
											//   System.out.println("valueData---:  "+valueData);
											//   System.out.println("textData---:  "+textData);
											//   System.out.println("dateStr---:  "+dateStr);

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
								  <option value="0">Other</option>							 				 		
								 </select>
								 
								 </div>
								 <div id="jobFairDisp" style="display: none;">
									<label id="jobFairLBL"></label>
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="jobFairOther" style="display: none;">
									<input type="text" name="jobFOther" id="jobFOther" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									<input  type="hidden" id="jobFairOtherHF" name="jobFairOtherHF"/>
								</div>
								<div id="jobFairOtherDisp" style="display: none;">
									<label id="jobFairOtherLBL"></label>
									<input  type="hidden" id="jobFairOtherDispHF" name="jobFairOtherDispHF"/>									
							    </div>
								</td>
							</tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="emailMailersID" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							   <td>
								Details :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="emailMailersDDL">
								  <select name="emailMailers" id="emailMailers" class="reSizeforOther" onchange="return otherChkD(this);">
								 	<option value="">---Select---</option>		
								 	
								 <%
								 	String emailMailersDS=null;
							        String secQueryEmail= "SELECT Email_Id,Email_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(Email_Date,'%b %Y'),' ]'),'') AS Email_Date  FROM email_master";			        
								  	Statement stmtEmail = con.createStatement();
									ResultSet rsEmail = stmtEmail.executeQuery(secQueryEmail);
									while(rsEmail.next())
									{
										try
										{
							    			String valueData=rsEmail.getString("Email_Id");							    	
							    			String textData=rsEmail.getString("Email_Name"); 
								    		dateStr = rsEmail.getString("Email_Date");
											emailMailersDS=textData+""+dateStr;
											//   System.out.println("valueData---:  "+valueData);
											//   System.out.println("textData---:  "+textData);
											//   System.out.println("dateStr---:  "+dateStr);
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
								 	<option value="0">Other</option>								 				 		
								 </select>
								 <input type="hidden" name="emailMailersH" value="<%=emailMailersDS%>"/>
								 </div>
								 <div id="emailMailersDisp" style="display: none;">
									<label id="emailMailersLBL"></label>
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="emailMailersOther" style="display: none;">
									<input type="text" name="emailOther" id="emailOther" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									<input  type="hidden" id="emailMailersOtherDISPHF" name="emailMailersOtherDISPHF"/>
								</div>
								<div id="emailOtherDisp" style="display: none;">
									<label id="emailOtherLBL"></label>
									<input  type="hidden" id="emailOtherDispHF" name="emailOtherDispHF"/>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<!-- 4 internet Job Posting-->
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="smsID" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							    <td>
								Details :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="smsDDL">
								 <select name="sms" id="sms" class="reSizeforOther" onchange="return otherChkE(this);">
								 	<option value="">---Select---</option>		
								 		
								 	<%
								 	String smsDS=null;
							        String secQuerySMS= "SELECT SMS_Id,SMS_Name,IFNULL(CONCAT(' [ ',DATE_FORMAT(SMS_Date,'%b %Y'),' ]'),'') AS SMS_Date FROM SMS_Master WHERE Is_Active = 1";			        
								  	Statement stmtSMS = con.createStatement();
									ResultSet rsSMS = stmtSMS.executeQuery(secQuerySMS);
									while(rsSMS.next())
									{	
										try
										{
							    			String valueData=rsSMS.getString("SMS_Id");							    	
							    			String textData=rsSMS.getString("SMS_Name"); 
								    		dateStr = rsSMS.getString("SMS_Date");
											smsDS=textData+""+dateStr;
											//   System.out.println("valueData---:  "+valueData);
											//   System.out.println("textData---:  "+textData);
											//   System.out.println("dateStr---:  "+dateStr);
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
								<option value="0">Other</option>					 				 		
								 </select>
								 <input type="hidden" name="smsH" value="<%=smsDS%>">
								 </div>
								 <div id="smsDisp" style="display: none;">
									<label id="smsLBL"></label>
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="smsOtherID" style="display: none;">
									<input type="text" name="smsOtherField" id="smsOtherField" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
								    <input  type="hidden" id="smsOtherIDHF" name="smsOtherIDHF"/>
								</div>
								<div id="smsOtherDisp" style="display: none;">
									<label id="smsOtherLBL"></label>
									<input  type="hidden" id="smsOtherDispHF" name="smsOtherDispHF"/>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- reHire -->
							
								<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="candiReferal" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							    <td>
								Details :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="candiReferalField">
									<input name="candiReferalD" id="candiReferalD" type="text" class='wmta' onblur="Blur(this.id,'Candidate Name')" onfocus="Focus(this.id,'Candidate Name')" value="Candidate Name"  style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" maxlength="50" onkeypress="return AllowAlphabet(event);"/>
								</div>
								<div id="candiReferalDisp" style="display: none;">
									Name :<label id="candiReferalLBL"></label>,
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="candiPhoneField">
									<input name="candiPhoneD" id="candiPhoneD" type="text" class='wmta' onblur="Blur(this.id,'Phone Number')" onfocus="Focus(this.id,'Phone Number')" value="Phone Number"  style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" maxlength="10" onkeypress="return isNumberKey(event);"/>
								</div>
								<div id="candiPhoneDisp" style="display: none;">
									Phone # :<label id="candiPhoneLBL"></label>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="campus" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							   <td>
								Details :
								</td>
								<td style="width: 5px;"></td>
								<td>
								
								<div id="campusDDL">
									<select name="campusD" id="campusD" class="reSizeforOther" onchange="return otherChkF(this);">
								 	<option value="">---Select---</option>		
								 <%
								 	String campusDSa=null;
							        String secQueryCampus= "SELECT campus_Id,campus_Name, IFNULL(CONCAT(' [ ',DATE_FORMAT(campus_Date,'%b %Y'),' ]'),'') AS campus_Date FROM campus_master";			        
								  	Statement stmtCampus = con.createStatement();
									ResultSet rsCampus = stmtCampus.executeQuery(secQueryCampus);
									while(rsCampus.next())
									{
										try
										{
							    			String valueData=rsCampus.getString("campus_Id");							    	
							    			String textData=rsCampus.getString("campus_Name"); 
								    		dateStr = rsCampus.getString("campus_Date");
											campusDSa = textData+""+dateStr;
											//   System.out.println("valueData---:  "+valueData);
											//   System.out.println("textData---:  "+textData);
											//   System.out.println("dateStr---:  "+dateStr);

								    	
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
								 	<option value="0">Other</option>		
								 </select>
								 <input type="hidden" name="campusDH" value="<%=campusDSa%>">
								 </div>
								 <div id="campusDisp" style="display: none;">
									<label id="campusLBL"></label>
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="campusOtherID" style="display: none;">
									<input type="text" name="campusOtherField" id="campusOtherField" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									<input  type="hidden" id="campusOtherIDHF" name="campusOtherIDHF"/>
								</div>
								<div id="campusOtherDisp" style="display: none;">
									<label id="campusOtherLBL"></label>
									<input  type="hidden" id="campusOtherDispHF" name="campusOtherDispHF"/>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
								
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="traingInsitute" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							    <td>
								Details :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="traingInsituteDDL">
								  <select name="traingInsituteD" id="traingInsituteD" class="reSizeforOther" onchange="return otherChkG(this);">
								  	<option value="">---Select---</option>	
								 	<%
								 	String traingInsituteDDSD=null;
							        String secQueryTINAME= "SELECT T_I_Name_Id,T_I_Name_Name, IFNULL(CONCAT(' [ ',DATE_FORMAT(T_I_Name_Date,'%b %Y'),' ]'),'') AS T_I_Name_Date  FROM training_institute_master";			        
								  	Statement stmtTINAME = con.createStatement();
									ResultSet rsTINAME = stmtTINAME.executeQuery(secQueryTINAME);
									while(rsTINAME.next())
									{
										try
										{
							    			String valueData=rsTINAME.getString("T_I_Name_Id");							    	
							    			String textData=rsTINAME.getString("T_I_Name_Name"); 
								    		dateStr = rsTINAME.getString("T_I_Name_Date");
											traingInsituteDDSD=textData+""+dateStr;
											//   System.out.println("valueData---:  "+valueData);
											//   System.out.println("textData---:  "+textData);
											//   System.out.println("dateStr---:  "+dateStr);

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
								 	<option value="0">Other</option>					 				 		
								  </select>
								  <input type="hidden" name="traingInsituteDH" value="<%=traingInsituteDDSD%>">
								  </div>
								 <div id="traingInsituteDisp" style="display: none;">
									<label id="traingInsituteLBL"></label>
							    </div> 
								</td>								
								<td style="width: 5px;"></td>
								<td>
								<div id="traingInsituteOtherID" style="display: none;">
									<input type="text" name="traingInsituteOtherField" id="traingInsituteOtherField" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
								    <input  type="hidden" id="traingInsituteOtherIDHF" name="traingInsituteOtherIDHF"/> 
								</div>
								<div id="traingInsituteOtherDisp" style="display: none;">
									<label id="traingInsituteOtherLBL"></label>
							    <input  type="hidden" id="traingInsituteOtherDispHF" name="traingInsituteOtherDispHF"/>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
						
						
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="xEmployee" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							    <td>
								Details :
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="xEmployeeField">
									<input name="xEmployeeD" id="xEmployeeD" type="text" class='wmta' onblur="Blur(this.id,'Emp Name')" onfocus="Focus(this.id,'Emp Name')" value="Emp Name" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowAlphabet(event);">
								</div>
								<div id="xEmployeeDisp" style="display: none;">
								Emp. Name :	<label id="xEmployeeLBL"></label>,
							    </div>
								</td>
								<td style="width: 5px;"></td>
								<td>
								<div id="xEmployeePhoneField">
									<input name="xEmployeePhoneD" id="xEmployeePhoneD" type="text" class='wmta' onblur="Blur(this.id,'Phone Number')" onfocus="Focus(this.id,'Phone Number')" value="Phone Number" maxlength="10" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return isNumberKey(event);">
								</div>
								<div id="xEmployeePhoneDisp" style="display: none;">
								Phone # :	<label id="xEmployeePhoneLBL"></label>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="TeleCallTeam" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							    <td>
								Recruiter Name :
								</td>
								<td style="width: 5px;"></td>
								<td>
									<div id="TeleCallTeamDDL">
								  <select name="TeleCallTeam_REC_Name" id="TeleCallTeam_REC_Name" class="reSizeforOther" onchange="otherChkH(this);">
								  	<option value="">---Select---</option>	
								 	<%
								 	String callTeamDS=null;
							        String secQueryTeleCallTeam= "SELECT CallingTeam_Emp_id,CallingTeam_name FROM CallingTeam_master WHERE is_active = 1 ORDER BY CallingTeam_name ASC";	
							        //   System.out.println(secQueryTeleCallTeam);		        
								  	Statement stmtTeleCallTeam = con.createStatement();
									ResultSet rsTeleCallTeam = stmtTeleCallTeam.executeQuery(secQueryTeleCallTeam);
									while(rsTeleCallTeam.next())
									{
									callTeamDS=	rsTeleCallTeam.getString("CallingTeam_name");
										%>					
											<option value="<%=rsTeleCallTeam.getString("CallingTeam_Emp_id")%>"><%=rsTeleCallTeam.getString("CallingTeam_name")%></option>
										<%										
									}
									stmtTeleCallTeam.close();
									rsTeleCallTeam.close();
								    //   System.out.println("=============Done...======");	
								 %>
								   <option value="0">Other</option>						 				 		
								  </select>
								  
								  </div>
								 <div id="TeleCallTeamDisp" style="display: none;">
									<label id="TeleCallTeamLBL"></label>
							    </div> 
								</td>


								<td style="width: 5px;"></td>
								<td>
								<div id="callingTeamOther" style="display: none;">
									<input type="text" name="callingOther" id="callingOther" maxlength="50" class="wmta" onblur="Blur(this.id,'Details')" onfocus="Focus(this.id,'Details')" value="Details" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
								<input  type="hidden" id="callingTeamOtherHF" name="callingTeamOtherHF"/>
								</div>
								<div id="callingteamOtherDisp" style="display: none;">
									<label id="callingteamOtherLBL"></label>
							   <input  type="hidden" id="callingteamOtherDispHF" name="callingteamOtherDispHF"/>
							    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->


							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
							<div id="Vendor" style="display: none">
							<table border="0" cellpadding="0" cellspacing="0" style="width:300xpx;">
							  <tr class="allBackColor">
							    <td>
								City Name :
								</td>
								<td style="width: 5px;"></td>
								<td>
									<div id="VendorCityDDL">
								 	 	<select name="VendorCity" id="VendorCity" class="reSizeforOther" onchange="otherChkVen(this);">
									  		<option value="">---Select---</option>	
										 	<%
										 	try
										 	{
											 	String VendorCity_master=null;
										        String venCM_query= "SELECT Vendor_City_Id, Vendor_City_Name FROM Vendor_city_master ORDER BY  Vendor_City_Name ASC ";	 // Vendor_City_Id, Vendor_City_Name
										        //   System.out.println( " venCM_query Vendor City Master \t"+venCM_query);		        
											  	Statement stmtVendor = con.createStatement();
												ResultSet venRs = stmtVendor.executeQuery(venCM_query);
												while(venRs.next())
												{
													%>					
														<option value="<%=venRs.getInt("Vendor_City_Id")%>"><%=venRs.getString("Vendor_City_Name")%></option>
													<%
												}
												venRs.close();
												stmtVendor.close();											
											    //   System.out.println("=============Done...======");	
										 	}
										 	catch(Exception e)
										 	{
										 		e.printStackTrace();
										 	}
										 	
										 %>
										   <option value="0">Other</option>						 				 		
									  </select>
								  </div>
								  <div id="VendorCityDisp" style="display: none;">
									<label id="VendorCityLBL"></label>
									<input type="hidden" id="VendorCityHF" name="VendorCityHF"/>
							      </div> 
								</td>
								<td style="width: 5px;"></td>
								<td>
									<div id="VendorCityOther" style="display: none;">
										<input type="text" name="VendorCityOtherVal" id="VendorCityOtherVal" maxlength="50" class="wmta" onblur="Blur(this.id,'City')" onfocus="Focus(this.id,'City')" value="City" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									</div>
									<div id="VendorCityOtherDisp" style="display: none;">
										<label id="VendorCityOtherLBL"></label>
								    </div>
									<div id="VendorNameDDL" style="display: none;">
										<select name="VendorName" id="VendorName" class="reSizeforOther" onchange="chkOthersVen(this);">
											<option value="">-- Select Vendor --</option>
										</select>
									</div>
									<div id="VendorNameDisp" style="display: none;">
										<label id="VendorNameLBL"></label>
										<input type="hidden" id="VendorNameHF" name="VendorNameHF"/>
								    </div> 
								</td>								
								<td style="width: 5px;"></td>
								<td nowrap="nowrap">								
									<div id="VendorNameOther" style="display: none;">
										<input type="text" name="VendorNameOtherVal" id="VendorNameOtherVal" maxlength="50" class="wmta" onblur="Blur(this.id,'Vendor')" onfocus="Focus(this.id,'Vendor')" value="Vendor" style="width: 120px;height: 20px;font-size: 12px;font-family: Arial,Helvetica,sans-serif;" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" />
									</div>																
									<div id="VendorNameOtherDisp" style="display: none;">
										<label id="VendorNameOtherLBL"></label>
								    </div>
								</td>
							  </tr>
							</table>
							</div>
							<!-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV -->
					   </td>
					</tr>
				  <tr>
					<td align="left" class="allBackColor" style="width: 150px; background-color: #d8d8d8;">
					 	Applying For Location <span class="redTxt" id="mrs19">*</span>
					</td>
					<td class="allBackColor" colspan="4">
						<div id="locationDDl">
						<select name="location" id="location" class="reSizeforOther">
						<option value="">---Select---</option>
					    <%  
							con = ConnectDatabase.getConnection();
							Statement smt = con.createStatement();
			              	String qry = "SELECT centre_id,centre_name FROM centre_master WHERE is_alive=1";
							//   System.out.println("query "+qry);
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
				        </div>
				        <div id="locationDSP" style="display: none;">				        
				        	<label id="locationLBL"></label>
				        </div>					
					</td>
					</tr>					
				    <tr>
						<td align="left" class="allBackColor" style="width: 150px; background-color: #d8d8d8;">
							<span id="lblDeclaration">Declaration</span><span id="lblConfirmation" style="display: none;">Confirmation</span> <span class="redTxt" id="mrs19">*</span>
						</td>
						<td class="allTdBackColor" colspan="4" align="left">
							<div id="DeclarationDisp">
								<input type="checkbox" name="checkbox" value="1" id="checkbox">
								All the information furnished by me is correct in all aspects,
								and I take responsibility for the authenticity of the same.
							</div>
							<div id="ConfirmationDisp" style="display: none">
								<b class="redTxt">Please check and confirm if all the information, entered by you,  
								and displayed above is correct. If not, click on edit to correct.</b>
							</div>
						</td>
					</tr>					
				</table>
				<!-- Personaml Information Registration Form Table E -->					
					<br/>
					
				<table border="0" cellpadding="0" cellspacing="0" class="w100p" style="height: 41px;">	
					<tr>
						<td align="left" style="padding-left: 10px">
							<input type="button" name="Back" value="Back" id="Back_button" class="buttonMedium" onclick="redirectBack()"/>
							<div id="editbutton" style="display: none;">
							<input type="button" name="Edit" value="Edit" id="Edit_button" class="buttonMedium" onclick="editclick();"/>
							</div>
						</td>
						<td align="right" style="padding-right: 10px">
							<input type="button" name="Next_button" value="Next" class="buttonMedium" onkeypress="return chkRegistrationValidation();" onclick="return chkRegistrationValidation();" id="Next_button"/>
							<div id="confirm" style="display: none;">
							<input type="button" name="confirm_button" value="Confirm" class="buttonMedium" onclick="confirmclick();" id="confirm_button"/>
							</div>
							<span id="processing" style="display:none;padding-right: 15px;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" colspan="2">Processing, please wait...</font></b></span>
						</td>
					</tr>
				</table>			
			</form>
		</div>
	</div>

	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
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
<div id="light" class="white_content">
	<table cellspacing="0" cellpadding="0" border="0" style="width:450px; height:100px;">
	<tr>
		<td align="right"> 
			<a href="javascript:void(0)" onClick="closelightbox()" style="float: right" class="close">			
			</a>
		</td>
	</tr>
	<tr>
		<td align="center" style="padding-bottom:10px;">
			<span class="msgClass" id="dispMSG"></span>
			<br>
			<br>
				<input type="button" style="font-weight: bold;" value=" Ok " id="closeblock" onclick="closelightbox()">
		</td>	  		
	</tr>
	</table>
</div>
<div id="fade" class="black_overlay">
</div>
<div style="display:none;">
	<input type="button" id="openPOP" onclick="createlightbox()">
</div>		
</body>
</html>
