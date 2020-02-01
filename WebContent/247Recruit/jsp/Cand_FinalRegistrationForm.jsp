<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.ConnectDatabase"%>
<%@page import="util.ConnectionDAO"%>
<%@page import="java.sql.CallableStatement"%>
<%@ include file="GlobalDeclare.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>

<html>
  <head>
    <title>[24]7 Final Registration</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/validate2.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
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

<!--start To date to 100 years back display date -->

<%
	Connection con=null;
	Statement sttForJquery=null;
	ResultSet rsForjquery=null;
	String todate_30=null;
	String years_100=null;
	try
	{
		con=ConnectDatabase.getConnection();
		//String queryForcurDate="SELECT DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 30 YEAR), '%d-%m-%Y') AS years_30, DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 100 YEAR), '%d-%m-%Y') AS years_100";
		
		String queryForcurDate="SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y') AS years_30, DATE_FORMAT(DATE_SUB(CURDATE(),INTERVAL 100 YEAR), '%d-%m-%Y') AS years_100";
		System.out.println("queryForcurDate >>>>   >>>>>   >>>>> "+queryForcurDate);
		sttForJquery=con.createStatement();
		rsForjquery=sttForJquery.executeQuery(queryForcurDate);
		if(rsForjquery.next())
		{
			todate_30=rsForjquery.getString("years_30");
			years_100=rsForjquery.getString("years_100");
			System.out.println("todate_30 >>>>   >>>>>   >>>>> "+todate_30);
			System.out.println("years_100 >>>>   >>>>>   >>>>> "+years_100);
			//System.out.println(fectSqlString18+" =============  "+fectSqlString58); todate years_100
		}
		rsForjquery.close();
		sttForJquery.close();
	}
	catch(Exception ex)
	{
		System.out.println(ex.getMessage());
	}

 %>
<!--End To date to 100 years back display date -->
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
	    width: 100%;
	    vertical-align: middle;
	}

	.wrapper
	{
		margin: 0 auto;
    	width: 100%;
	}

	.tPersonal
	{
		width: 930px;
	}
	.pTdDHeader
	{
	  background-color: #d8d8d8;
      color: #41383C;
      font-family: Arial,Helvetica,sans-serif;
      font-size: 12px;
      height: 10px;
      width: 50px;
      text-align: center;
	}
	.pTdworkExp
	{ 
      text-align: center;  
      background-color: #F1F1F1;
      color: #41383C;
      font-family: Arial,Helvetica,sans-serif;
      font-size: 12px;     
	}
	.workExpField
	{
	 width: 100px; 
	 border: 1px solid #C8C8C8;
	 color: #342826;
	 height: 21px;
	
	
	}
	.pTdDJob
	{
	  background-color: #F8F8F8;
      color: #41383C;
      font-family: Arial,Helvetica,sans-serif;
      font-size: 12px;
      height: 21px;
	}
   	 </style>
	
		<script type="text/javascript">
		$(function() {
		$("#wedding_Date").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true		
		    });
	    });
	   </script>  
		<!-- end birth_City calender  -->
		
		
		<!--  from date and to date start -->
		<script type="text/javascript">
		$(function() {
		$("#from1").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
	   	<script type="text/javascript">
		$(function() {
		$("#from2").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
	    	<script type="text/javascript">
		$(function() {
		$("#from3").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	    	<script type="text/javascript">
		$(function() {
		$("#from4").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
	    	<script type="text/javascript">
		$(function() {
		$("#from5").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
	   	<script type="text/javascript">
		$(function() {
		$("#to1").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
	   	<script type="text/javascript">
		$(function() {
		$("#to2").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	    
	   	<script type="text/javascript">
		$(function() {
		$("#to3").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
	    
	   	<script type="text/javascript">
		$(function() {
		$("#to4").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	    
	   	<script type="text/javascript">
		$(function() {
		$("#to5").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1970:2015',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true
		
		    });

	    });
	   </script>
	   
   	<script type="text/javascript">
		$(function() {
		var mnDt;
		var mxDt;
		mnDt = '<%=years_100 %>';  
		mxDt = '<%=todate_30 %>';
		
		$("#FBdob").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1900:2100',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			minDate: mnDt,
			maxDate: mxDt
		    });

	    });
	   </script>

   	<script type="text/javascript">
		$(function() {
		var mnDt;
		var mxDt;
		mnDt = '<%=years_100 %>';  
		mxDt = '<%= todate_30 %>';
		$("#FBdob1").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1900:2100',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			minDate: mnDt,
			maxDate: mxDt		
		    });

	    });
	   </script>
   	<script type="text/javascript">
		$(function() {
		var mnDt2;
		var mxDt2;
		mnDt2 = '<%=years_100 %>';  
		mxDt2 = '<%= todate_30 %>';		
		$("#FBdob_m").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1900:2100',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			minDate: mnDt2,
			maxDate: mxDt2		
		    });

	    });
	   </script>
   	<script type="text/javascript">
		$(function() {
		var mnDt3;
		var mxDt3;
		mnDt3 = '<%=years_100 %>';  
		mxDt3 = '<%= todate_30 %>';			
		$("#FBdob3").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1900:2100',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			minDate: mnDt3,
			maxDate: mxDt3		
		
		    });

	    });
	   </script>
   	<script type="text/javascript">
		$(function() {
		var mnDt4;
		var mxDt4;
		mnDt4 = '<%=years_100 %>';  
		mxDt4 = '<%= todate_30 %>';			
		
		$("#FBdob4").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1900:2100',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			minDate: mnDt4,
			maxDate: mxDt4		
		
		    });

	    });
	   </script>

   	<script type="text/javascript">
		$(function() {
		var mnDt5;
		var mxDt5;
		mnDt5 = '<%=years_100 %>';  
		mxDt5 = '<%=todate_30 %>';			
		
		$("#FBdob5").datepicker({
			changeMonth: true,
			changeYear: true,
            yearRange: '1900:2100',
            showOn: 'both',
			buttonImage:'<%=request.getContextPath() %>/247Recruit/images/calendar.gif',
			buttonImageOnly: true,
			minDate: mnDt5,
			maxDate: mxDt5		
		
		    });

	    });
	   </script>


<script type="text/javascript">
	function AllowAlphaNumeric(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)) 
		{
			return true;
		}
		else
		{
			alert("Invalid character entered !!");
			return false;
		}
	}      
</script>

<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
 		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) 
		{
			return true;
		}
		else
		{
			alert("Invalid character entered !!");
			return false;
		}
	}      
</script>


<script type="text/javascript">
function otherChk(obj)
{
	vis = obj.options[obj.selectedIndex].value;	
	document.getElementById('CityNotListDIV').style.display = 'none';	
	if(vis=='0'){document.getElementById('CityNotListDIV').style.display = ''};	
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
		document.getElementById("city").disabled=false;
	    document.getElementById("City_org").disabled=false;		
		getStateListCity();
}
function getStateListCity()	
{	
	var cp=document.getElementById("State").value;
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
	 document.getElementById('city').options.length = 0;
	 
     arry[0] = document.createElement('option');  
	 arry[0].text = '---Select---';
	 arry[0].value ='0';
	 document.getElementById('city').options[0]= arry[0];
	 	
	 
	 var arry1 = new Array(0);	 
	 document.getElementById('City_org').options.length = 0;	
     arry1[0] = document.createElement('option');  
	 arry1[0].text = '---Select---';
	 arry1[0].value ='0';	 
	 document.getElementById('City_org').options[0]= arry1[0];		
	}        
}

function chargeCodeSelected(request)
{
	 var data = request.responseText;
	 idata=data.split(",");
	 var arry = new Array(idata.length);
	 var arry1 = new Array(idata.length);
 	 var i = 0;
 	 
	 document.getElementById('city').options.length = 0;
     arry[i] = document.createElement('option'); 
	 arry[i].text = '-- Select --';
	 arry[i].value ='';
	
	 document.getElementById('city').options[i]= arry[i];
	 for(i=1;i<idata.length;i++)
	 {
		fenName = idata[i-1].split(":");
	    arry[i] = document.createElement('option');  
 		arry[i].text = fenName[1];
		arry[i].value =fenName[0];
		document.getElementById('city').options[i]= arry[i];
	 }	 
	 arry[i] = document.createElement('option');  
	 arry[i].text = 'Other';
	 arry[i].value ='0';
	 document.getElementById('city').options[i]= arry[i];	
	 
	 
	 document.getElementById('City_org').options.length = 0;		 
     arry1[0] = document.createElement('option');     
	 arry1[0].text = '-- Select --';
	 arry1[0].value ='';
	 document.getElementById('City_org').options[0]= arry1[0];		
	 for(i=1;i<idata.length;i++)
	 {
		fenName = idata[i-1].split(":");
	    arry1[i] = document.createElement('option');  
 		arry1[i].text = fenName[1];
		arry1[i].value =fenName[0];
		document.getElementById('City_org').options[i]= arry1[i];	
	 }
	arry1[0] = document.createElement('option');  
	arry1[0].text = 'Other';
	arry1[0].value ='0';
	document.getElementById('City_org').options[i]= arry1[0];
}

</script>

<script type="text/javascript">
  function ValidateEmail(strEmailCtrlId) 
  { 
	 var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;	  
	 var address = document.getElementById(strEmailCtrlId).value;	  
   	 if(reg.test(address) == false) 
	    { 
	       alert('Please Enter Valid Email Id !');
	       document.getElementById(strEmailCtrlId).value = '';
	       document.getElementById(strEmailCtrlId).focus();     
	       return false;
	    }
  }
</script>


<script>
function onSubmitClick() 
{
	var addChk = document.getElementById("parmanentAdd");
	
	var address = document.getElementById('address');	
	var addressOrg = document.getElementById('addressOrg'); 
	
	var State = document.getElementById('State');	
	var State_Org = document.getElementById('State_Org'); 
	
	var city = document.getElementById('city');	
	var City_org = document.getElementById('City_org'); 
	
	var Pin_code = document.getElementById('Pin_Code');	
	var Pin_code_org = document.getElementById('Pin_Code_Org'); 
	
	var Phone = document.getElementById('Phone');	
	var Phone_org = document.getElementById('Phone_org'); 
	
	if(addChk.checked)
	{	
	    addressOrg.value = address.value;		
		Pin_code_org.value = Pin_code.value;				
		State_Org.value=State.value;
		City_org.value=city.value;
		Phone_org.value = Phone.value;
	}
	else
	{		 
		//addressOrg.value = "";	
		//Pin_code_org.value = "";		
		///State_Org.value='0';
		//City_org.value='0';
		//Phone_org.value = "";
	}
  
}
</script>


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

 <script type="text/javascript" language="javascript">

 function logout()
 {
	 location.href = "<%=logoutPage%>";
 }
</script>

<script type="text/javascript">
	function chkRegistrationValidation()
	{
		var i=1;
		if ( detailsReg.CountryBirth.selectedIndex == 0 ) 
		{ 
			alert ( "Please select your country birth !" ); 
			document.getElementById('CountryBirth').focus();
			return false; 
			
		}
	    if ( detailsReg.Nationality.selectedIndex == 0 ) 
		{ 
			alert ( "Please select your Nationality !" ); 
			document.getElementById('Nationality').focus();
			return false; 
		}
		if ( detailsReg.MotherTongue.selectedIndex == 0 ) 
		{ 
			alert ( "Please select your mother tongue !" ); 
			document.getElementById('MotherTongue').focus();
			return false; 
		}

		if ( ( detailsReg.Marial_Status[0].checked == false ) && ( detailsReg.Marial_Status[1].checked == false ) ) 
		{ 
			 alert ( "Please choose your Marital Status !" );
			 return false;
	    }
		if (detailsReg.Marial_Status[0].checked == true) 
		{ 
			if(document.getElementById("wedding_Date").value=='')
			{
				var appStr = 'Please Enter wedding date !';		
				alert(appStr);
				document.getElementById('wedding_Date').focus();
				return false;
		    }
	    }

		if(document.getElementById("Fathre_HusbandName").value=='')
		{
			var appStr = 'Please Enter Father / Husbands name !';		
			alert(appStr);
			document.getElementById('Fathre_HusbandName').focus();
			return false;
	    }		
	
		if (detailsReg.Religion.selectedIndex == 0) 
		{ 
			alert ( "Please select your Religion !" ); 
			document.getElementById('Religion').focus();
			return false; 
		}	    
		
		if(document.getElementById("address").value=='')
		{
			var appStr = 'Please Enter Address !';		
			alert(appStr);
			document.getElementById('address').focus();
			return false;
		}
		if ( detailsReg.State.selectedIndex == 0 ) 
		{ 
			alert ( "Please select your State !" ); 
			document.getElementById('State').focus();
			return false; 
		}
		
		if(detailsReg.city.selectedIndex == 0)
		{
			
			var appStr = 'Please select city !';			
			alert(appStr);
			document.getElementById('city').focus();
			return false;
		}
		
		if(document.getElementById('city').value == "0")
		{
			var cityOthervalue = document.getElementById('CityOtherList').value.trim();
			if(cityOthervalue == "")
			{
				var appStr = 'Please enter city other !';			
				alert(appStr);
				document.getElementById('CityOtherList').focus();
				return false;
			}
		}
		if((detailsReg.trans[0].checked == false ) && ( detailsReg.trans[1].checked == false )) 
		{ 
			 alert ( "Please choose your transport facilities  Yes/No !" );
			 return false;
	    }		
		if (detailsReg.trans[0].checked == true) 
		{ 
			if(detailsReg.area.selectedIndex == 0)
			{
				var appStr = 'Please select Area !';			
				alert(appStr);
				document.getElementById('area').focus();
				return false;
			}
	    }

		if(document.getElementById("Pin_Code").value=='')
		{
			var appStr = 'Please Enter Pin Code !';
			
			alert(appStr);
			document.getElementById('Pin_Code').focus();
			return false;
		}
		if(detailsReg.parmanentAdd.checked == false )
		{			
				if(document.getElementById("addressOrg").value=='')
				{
					var appStr = 'Please Enter parmanent Address !';		
					alert(appStr);
					document.getElementById('addressOrg').focus();
					return false;
				}
				if ( detailsReg.State_Org.selectedIndex == 0 ) 
				{ 
					alert ( "Please select your parmanent State !" ); 
					document.getElementById('State_Org').focus();
					return false; 
				}
				if(detailsReg.City_org.selectedIndex == 0)
				{
					var appStr = 'Please select parmanent city !';			
					alert(appStr);
					document.getElementById('City_org').focus();
					return false;
				}
		
				if(document.getElementById("Pin_Code_Org").value=='')
				{
					var appStr = 'Please Enter parmanent Pin Code !';
					
					alert(appStr);
					document.getElementById('Pin_Code_Org').focus();
					return false;
				}
		}		
		
	   // End validation for Address //
	   
	   //  ***************   Start validation for the eMERGENCY cONTECT dETAILS***************//
	   if(document.getElementById("ECDName").value=='')
		{
			var appStr = 'Please enter emergency contact name !';			
			alert(appStr);
			document.getElementById('ECDName').focus();
			return false;
		}

	   if (detailsReg.ecdRelationShipSelect.selectedIndex == 0) 
		{ 
			alert ( "Please select your relationship !" ); 
			document.getElementById('ecdRelationShipSelect').focus();
			return false; 
		}
		
		  for(i=1;i<=emerContact;i++)
	       {
		   		if(document.getElementById("ECDName"+i).value=='')
		   		{
		   			var appStr = "Please enter additional emergency contact "+i+"'s name !";
		   			alert(appStr);
		   			document.getElementById('ECDName'+i).focus();
		   			return false;
		   		}
		   		var ECDR = document.getElementById("ECDRelationship"+i);
		   		if (ECDR.selectedIndex == 0) 
				{ 
					alert ( "Please select your additional emergency contact "+i+"'s relationship !" ); 
					ECDR.focus();
					return false; 
				}
		   }
	   
	  //  ***************   Ends validation for the eMERGENCY cONTECT dETAILS*************** // 
	
	   //  ***************   Start Work Experience  *************** //
	 var isExprience=document.getElementById("candExprience").value;
	 // alert('Is Exprience == '+ isExprience);
	 if(isExprience == 'Y')
	 { 	
	   if(document.getElementById("company1").value=='')
		{
			var appStr = 'Please enter company name !';			
			alert(appStr);
			document.getElementById('company1').focus();
			return false;
		}
	   if(document.getElementById("from1").value=='')
		{
			var appStr = 'Please enter from date !';			
			alert(appStr);
			document.getElementById('from1').focus();
			return false;
		}
	   if(document.getElementById("to1").value=='')
		{
			var appStr = 'Please enter to date !';			
			alert(appStr);
			document.getElementById('to1').focus();
			return false;
		}
	   if(document.getElementById("Initial_Desig1").value=='')
		{
			var appStr = 'Please enter initial desiganation !';			
			alert(appStr);
			document.getElementById('Initial_Desig1').focus();
			return false;
		}	   
	   if(document.getElementById("Final_Desig1").value=='')
		{
			var appStr = 'Please enter final desiganation !';			
			alert(appStr);
			document.getElementById('Final_Desig1').focus();
			return false;
		}
	   if(document.getElementById("Reason_For_Leaving1").value=='')
		{
			var appStr = 'Please enter reason for leaving !';			
			alert(appStr);
			document.getElementById('Reason_For_Leaving1').focus();
			return false;
		}	   
	   if(document.getElementById("last_sal1").value=='')
		{
			var appStr = 'Please enter last salary !';			
			alert(appStr);
			document.getElementById('last_sal1').focus();
			return false;
		}
	   if(( detailsReg.BPO_Exp1[0].checked == false ) && ( detailsReg.BPO_Exp1[1].checked == false ) )
	   {
			var appStr = 'Please choose Customer Interaction Experience !';			
			alert(appStr);
			document.getElementById('BPO_Exp1').focus();
			return false;
	   }
	}
	   //  ***************   End Work Experience  *************** //
	   
	  // **************** Start Family Background **************** //	  
	   if(document.getElementById("FBMemberName").value=='')
		{
			var appStr = 'Please enter father name !';			
			alert(appStr);
			document.getElementById('FBMemberName').focus();
			return false;
		}

	   	if(document.getElementById("FBMotherName").value=='')
		{
			var appStr = 'Please enter mother name !';			
			alert(appStr);
			document.getElementById('FBMotherName').focus();
			return false;
		}
	   
	   
	    //if(detailsReg.FBrelationSelect.selectedIndex == 0 )
		//{
		//var appStr = 'Please select relationship !';
		//	alert(appStr);	
		//	document.getElementById('FBrelationSelect').focus();		
		//	return false;
		//}
		if(document.getElementById("FBMemberName").value=='')
		{
			var appStr = 'Please enter father name !';			
			alert(appStr);
			document.getElementById('FBMemberName').focus();
			return false;
		}
		for(i=1;i<=faimly_Count;i++)
	    {
	   		if(document.getElementById("FBMemberName"+i).value=='')
	   		{
	   			var appStr = "Please enter additional family background member "+i+"'s name !";
	   			alert(appStr);
	   			document.getElementById('FBMemberName'+i).focus();
	   			return false;
	   		}
	   		var FBR = document.getElementById("FBRelationship"+i);
	   		if (FBR.selectedIndex == 0) 
			{ 
				alert ( "Please select your additional family background "+i+"'s relationship !" ); 
				FBR.focus();
				return false; 
			}
		}

    // **************** End Family Background ***************** // 
	// *************** Start  Education Qualification  SCC Details **************** ////
	   if(document.getElementById("EQInstituteSSC").value=='')
		{
			var appStr = 'Please enter institute name !';			
			alert(appStr);
			document.getElementById('EQInstituteSSC').focus();
			return false;
		}
	   if(document.getElementById("EQBoardSSC").value=='')
		{
			var appStr = 'Please enter board name !';			
			alert(appStr);
			document.getElementById('EQBoardSSC').focus();
			return false;
		}
	    if(detailsReg.EQCitySSC.selectedIndex == 0 )
		{
			var appStr = 'Please select city !';			
			alert(appStr);	
			document.getElementById('EQCitySSC').focus();		
			return false;
		}
		if(detailsReg.EQStateSSC.selectedIndex == 0 )
		{
			var appStr = 'Please select state !';			
			alert(appStr);	
			document.getElementById('EQStateSSC').focus();		
			return false;
		}
		if(detailsReg.EQmediumOfEduSSC.selectedIndex == 0 )
		{
			var appStr = 'Please select medium of instruction !';			
			alert(appStr);	
			document.getElementById('EQmediumOfEduSSC').focus();		
			return false;
		}	
		if(detailsReg.EQyearOfJoinSSC.selectedIndex == 0 )
		{
			var appStr = 'Please select year of joining !';			
			alert(appStr);	
			document.getElementById('EQyearOfJoinSSC').focus();		
			return false;
		}	
		if(detailsReg.monthNameSSC.selectedIndex == 0 )
		{
			var appStr = 'Please select passing month !';			
			alert(appStr);	
			document.getElementById('monthNameSSC').focus();		
			return false;
		}
		if(detailsReg.EQMyearOfJoinMSSC.selectedIndex == 0 )
		{
			var appStr = 'Please select passing year !';			
			alert(appStr);	
			document.getElementById('EQMyearOfJoinMSSC').focus();		
			return false;
		}
		
		var f = document.getElementById("EQyearOfJoinSSC");
		var e = document.getElementById("EQMyearOfJoinMSSC");
		
		var strUserf = f.options[f.selectedIndex].value;
		var strUsere = e.options[e.selectedIndex].value;

		if(strUsere < strUserf)
        {
			var appStr = 'Year of passing can not be less than year of joining !';			
			alert(appStr);	
			document.getElementById('EQMyearOfJoinMSSC').focus();		
			return false;
		}	
		if(detailsReg.CourseEQSSC.selectedIndex == 0 )
		{
			var appStr = 'Please select Course Appraisal !';			
			alert(appStr);	
			document.getElementById('CourseEQSSC').focus();		
			return false;
		}
		
	/// *************** Start  Education Qualification  SCC Details **************** ////
	/// *************** Start  Education Qualification  HSC  Details **************** ////
	
	    if(detailsReg.SpecializationHSC.selectedIndex == 0 )
		{
			var appStr = 'Please select specilazation !';			
			alert(appStr);	
			document.getElementById('SpecializationHSC').focus();		
			return false;
		}
	  
	   if(document.getElementById("EQInstituteHSC").value=='')
		{
			var appStr = 'Please enter institute name !';			
			alert(appStr);
			document.getElementById('EQInstituteHSC').focus();
			return false;
		}
	   if(document.getElementById("EQBoardHSC").value=='')
		{
			var appStr = 'Please enter board name !';			
			alert(appStr);
			document.getElementById('EQBoardHSC').focus();
			return false;
		}
	    if(detailsReg.EQCityHSC.selectedIndex == 0 )
		{
			var appStr = 'Please select city !';			
			alert(appStr);	
			document.getElementById('EQCityHSC').focus();		
			return false;
		}
		if(detailsReg.EQStateHSC.selectedIndex == 0 )
		{
			var appStr = 'Please select state !';			
			alert(appStr);	
			document.getElementById('EQStateHSC').focus();		
			return false;
		}
		if(detailsReg.EQmediumOfEduHSC.selectedIndex == 0 )
		{
			var appStr = 'Please select medium of instruction !';			
			alert(appStr);	
			document.getElementById('EQmediumOfEduHSC').focus();		
			return false;
		}	
		if(detailsReg.EQyearOfJoinHSC.selectedIndex == 0 )
		{
			var appStr = 'Please select year of joining !';			
			alert(appStr);	
			document.getElementById('EQyearOfJoinHSC').focus();		
			return false;
		}	
		if(detailsReg.monthNameHSC.selectedIndex == 0 )
		{
			var appStr = 'Please select passing month !';			
			alert(appStr);	
			document.getElementById('monthNameHSC').focus();		
			return false;
		}
		if(detailsReg.EQyearOfJoinMHSC.selectedIndex == 0 )
		{
			var appStr = 'Please select passing year !';			
			alert(appStr);	
			document.getElementById('EQyearOfJoinMHSC').focus();		
			return false;
		}
		
		var eh = document.getElementById("EQyearOfJoinHSC");
		var fh = document.getElementById("EQyearOfJoinMHSC");
		var strUsereh = eh.options[eh.selectedIndex].value;
		var strUserfh = fh.options[fh.selectedIndex].value;
		if(strUsereh > strUserfh)
        {
			var appStr = 'Year of passing can not be less than year of joining !';			
			alert(appStr);	
			document.getElementById('EQyearOfJoinHSC').focus();		
			return false;
		}	
		
		if(detailsReg.CourseEQHSC.selectedIndex == 0)
		{
			var appStr = 'Please select Course Appraisal !';			
			alert(appStr);	
			document.getElementById('CourseEQHSC').focus();		
			return false;
		}
		
/// *************** End  Education Qualification  HSC Details ****************   ////
		
		for(i=1;i<=counter;i++)
	    {
		   		var QEH = document.getElementById("QualificationEQHigher"+i);
		   		if (QEH.selectedIndex == 0) 
				{ 
					alert ("Please select your additional "+i+"'s education !"); 
					QEH.focus();
					return false; 
				}
		   		var SPC = document.getElementById("SpecializationHiger"+i);
		   		if (SPC.selectedIndex == 0) 
				{ 
					alert ( "Please select your additional "+i+"'s specialization !" ); 
					SPC.focus();
					return false; 
				}

		   		if(document.getElementById("EQInstituteHiger"+i).value=='')
		   		{
		   			var appStr = "Please enter additional Insititue "+i+"'s name !";
		   			alert(appStr);
		   			document.getElementById('EQInstituteHiger'+i).focus();
		   			return false;
		   		}		   		
		   		if(document.getElementById("EQBoardHiger"+i).value=='')
		   		{
		   			var appStr = "Please enter additional univercity "+i+"'s name !";
		   			alert(appStr);
		   			document.getElementById('EQBoardHiger'+i).focus();
		   			return false;
		   		}
		   		var CITY = document.getElementById("EQCityHiger"+i);
		   		if (CITY.selectedIndex == 0) 
				{ 
					alert ( "Please select your additional "+i+"'s city !" ); 
					CITY.focus();
					return false; 
				}		   		
		   		var STATE = document.getElementById("EQStateHiger"+i);
		   		if (STATE.selectedIndex == 0) 
				{ 
					alert ( "Please select your "+i+"'s additional state !" ); 
					STATE.focus();
					return false; 
				}		   		
		   		var COURCAT = document.getElementById("EQCourse_CategoryHiger"+i);
		   		if (COURCAT.selectedIndex == 0) 
				{ 
					alert ( "Please select your course category "+i+"'s state !" ); 
					COURCAT.focus();
					return false; 
				}		   		
		   		var COURTYPE = document.getElementById("CourseType"+i);
		   		if (COURTYPE.selectedIndex == 0) 
				{ 
					alert ( "Please select your course "+i+"'s type !" ); 
					COURTYPE.focus();
					return false; 
				}		   		
		   		var MEDINS = document.getElementById("EQmediumOfEduHiger"+i);
		   		if (MEDINS.selectedIndex == 0) 
				{ 
					alert ( "Please select your medium  "+i+"'s !" ); 
					MEDINS.focus();
					return false; 
				}
				
		   		var YEAREQ = document.getElementById("EQDCYear"+i);
		   		if (YEAREQ.selectedIndex == 0) 
				{ 
					alert ( "Please select your duration year  "+i+"'s !" ); 
					YEAREQ.focus();
					return false; 
				}
		   		var MONTHEQS = document.getElementById("EQDCYear"+i);
		   		if (MONTHEQS.selectedIndex == 0) 
				{ 
					alert ( "Please select your duration month "+i+"'s !" ); 
					MONTHEQS.focus();
					return false; 
				}
				
		   		var JOINYEAR = document.getElementById("EQyearOfJoinHiger"+i);
		   		if (JOINYEAR.selectedIndex == 0) 
				{ 
					alert ( "Please select your year "+i+"'s joining !" ); 
					JOINYEAR.focus();
					return false; 
				}
		   		var PASSMONTH = document.getElementById("monthNameHiger"+i);
		   		if (PASSMONTH.selectedIndex == 0) 
				{ 
					alert ( "Please select your passing "+i+"'s month !" ); 
					PASSMONTH.focus();
					return false; 
				}
		   		var PASSYEAR = document.getElementById("EQyearOfJoinMHiger"+i);
		   		if (PASSYEAR.selectedIndex == 0) 
				{ 
					alert ( "Please select your passing "+i+"'s year !" ); 
					PASSYEAR.focus();
					return false; 
				}
				
				var ehh = document.getElementById("EQyearOfJoinHiger"+i);
				var fhh = document.getElementById("EQyearOfJoinMHiger"+i);
				var strUserehh = ehh.options[ehh.selectedIndex].value;
				var strUserfhh = fhh.options[fhh.selectedIndex].value;
				if(strUserehh > strUserfhh)
		        {
					var appStr = 'Year of passing can not be less than year of joining !';			
					alert(appStr);	
					document.getElementById('EQyearOfJoinHiger'+i).focus();		
					return false;
				}
		   		var CAPPRS = document.getElementById("CourseEQHiger"+i);
		   		if (CAPPRS.selectedIndex == 0) 
				{ 
					alert ( "Please select your Course Appraisal  "+i+"'s year !" ); 
					CAPPRS.focus();
					return false; 
				}
	       }

		
		
	/// *************** End  Education Qualification  SCC Details ****************   ////
	   
	// ************  Start Referances Validation *********** //
	
	var ref_1 = document.getElementById("refName1").value;
  	if (ref_1 == "" ) 
	{ 
		alert ( "Please enter the Ref. Name -1 !" ); 
		document.getElementById("refName1").focus();
		return false; 
	}

  	var ref_2 = document.getElementById("refName2").value;
  	if (ref_2 == "" ) 
	{ 
		alert ( "Please enter the Ref. Name -2 !" ); 
		document.getElementById("refName2").focus();
		return false; 
	}

	var add_1 = document.getElementById("Address1").value;
  	if (add_1 == "" || add_1.trim().length == 0) 
	{ 
		alert ( "Please enter the Address -1 !" ); 
		document.getElementById("Address1").focus();
		return false; 
	}
	var add_2 = document.getElementById("Address2").value;
  	if (add_2 == "" || add_2.trim().length == 0) 
	{ 
		alert ( "Please enter the Address -2 !" ); 
		document.getElementById("Address2").focus();
		return false; 
	}
	var ph_1 = document.getElementById("Phone1").value;
  	if (ph_1 == "" ) 
	{ 
		alert ( "Please enter the Phone -1 !" ); 
		document.getElementById("Phone1").focus();
		return false; 
	}
	var ph_2 = document.getElementById("Phone2").value;
  	if (ph_2 == "" ) 
	{ 
		alert ( "Please enter the Phone -2 !" ); 
		document.getElementById("Phone2").focus();
		return false; 
	}

	// ************  End Referances Validation *********** //


	// ************  Start Declaretion *********** //
		if(detailsReg.Dec_1.checked == false )
		{
			var appStr = 'Please check first Declaration !';			
			alert(appStr);	
			document.getElementById('Dec_1').focus();		
			return false;
		}
		if(detailsReg.Dec_2.checked == false )
		{
			var appStr = 'Please check second Declaration !';			
			alert(appStr);	
			document.getElementById('Dec_2').focus();		
			return false;
		}
	   if(detailsReg.Dec_3.checked == false )
		{
			var appStr = 'Please check third Declaration !';			
			alert(appStr);	
			document.getElementById('Dec_3').focus();		
			return false;
		}
		if(detailsReg.Dec_4.checked == false )
		{
			var appStr = 'Please check fourth Declaration !';			
			alert(appStr);	
			document.getElementById('Dec_4').focus();		
			return false;
		}		
	// ************  End Declaretion *********** //
	
	// ************ Start FeedBack *********** //
		var sln1 = document.getElementById('sln1').innerHTML;
		var feed_txtarea1 = document.getElementById("feed_txtarea1").value;
		if(feed_txtarea1 == "" || feed_txtarea1.trim().length == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln1);	
			document.getElementById('feed_txtarea1').focus();		
			return false;
		}	
		var sln2 = document.getElementById('sln2').innerHTML;
		var feed_txtarea2 = document.getElementById("feed_txtarea2").value;
		if(feed_txtarea2 == "" || feed_txtarea2.trim().length == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln2);	
			document.getElementById('feed_txtarea2').focus();		
			return false;
		}	
		var sln3 = document.getElementById('sln3').innerHTML;
		if (( detailsReg.feed_radio1[0].checked == false ) && ( detailsReg.feed_radio1[1].checked == false ) ) 
		{ 
			 alert ("Incomplete feedback ! Please answer question # "+sln3);
			 return false;
	    }
		var sln4 =document.getElementById('sln4').innerHTML;
		if(detailsReg.offCampus.selectedIndex == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln4);	
			document.getElementById('offCampus').focus();		
			return false;
		}

		if (detailsReg.feed_radio1[0].checked == true) 
		{ 
			var sln5 = document.getElementById('sln5').innerHTML;
			var radios = document.getElementById('feed_radio1').value;
			if(radios == 'Yes')
			{
				if(detailsReg.consult_towards.selectedIndex == 0)
				{
					alert("Incomplete feedback ! Please answer question # "+sln5);	
					document.getElementById('consult_towards').focus();		
					return false;
				}
			}	
	    }
		var sln6 = document.getElementById('sln6').innerHTML;
		if(detailsReg.rec_Polite.selectedIndex == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln6);	
			document.getElementById('rec_Polite').focus();		
			return false;
		}
		var sln7 = document.getElementById('sln7').innerHTML;
		if(detailsReg.rec_247.selectedIndex == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln7);	
			document.getElementById('rec_247').focus();		
			return false;
		}

		var sln8 = document.getElementById('sln8').innerHTML;
		if(detailsReg.int_process.selectedIndex == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln8);	
			document.getElementById('int_process').focus();		
			return false;
		}
		var sln9 = document.getElementById('sln9').innerHTML;
		if(detailsReg.voice_acent.selectedIndex == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln9);	
			document.getElementById('voice_acent').focus();		
			return false;
		}
		var sln10 = document.getElementById('sln10').innerHTML;
		if(detailsReg.rec_process.selectedIndex == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln10);	
			document.getElementById('rec_process').focus();		
			return false;
		}
		var sln11 = document.getElementById('sln11').innerHTML;
		if(detailsReg.ops_process.selectedIndex == 0)
		{
			alert("Incomplete feedback ! Please answer question # "+sln11);	
			document.getElementById('ops_process').focus();		
			return false;
		}
		var sln12 = document.getElementById('sln12').innerHTML;
		if (( detailsReg.feed_247[0].checked == false ) && ( detailsReg.feed_247[1].checked == false ) ) 
		{ 
			 alert ("Incomplete feedback ! Please answer question # "+sln12);
			 return false;
	    }
		
		var sln13 = document.getElementById('sln13').innerHTML;
		var feed_txtarea3 = document.getElementById("feed_txtarea3").value;
		if(feed_txtarea3 == "" || feed_txtarea3.trim().length == 0)
		{
			alert("Incomplete feedback ! Please answer question #"+sln13);	
			document.getElementById('feed_txtarea3').focus();		
			return false;
		}	

		var sln14 = document.getElementById('sln14').innerHTML;
		var feed_txtarea4 = document.getElementById("feed_txtarea4").value;
		if(feed_txtarea4 == "" || feed_txtarea4.trim().length == 0)
		{
			alert("Incomplete feedback ! Please answer question #"+sln14);	
			document.getElementById('feed_txtarea4').focus();		
			return false;
		}	
		
		document.getElementById("processSubmit").style.display="none";
		document.getElementById("processing").style.display="";
		
	// ************ End FeedBack *********** //	   
	   
	}
		
</script>
<script type="text/javascript">
	function showOptionUn(value)
	{
		document.getElementById('WeddingDateLBL').style.display="";
		document.getElementById('WeddingDateDIV').style.display="";	
				
		document.getElementById('husband').style.display="";
		document.getElementById('father').style.display="none";	 
 	}
	function showOptionMr(value)
	{
		document.getElementById('WeddingDateLBL').style.display="none";
		document.getElementById('WeddingDateDIV').style.display="none";
		document.getElementById('husband').style.display="none";
		document.getElementById('father').style.display="";
	}
	function showOptionTransY(value)
	{
		document.getElementById('rowDataAREAINFO').style.display="";
		document.getElementById('rowDataLandINFO').style.display="";		 
 	}
	function showOptionTransN(value)
	{
		document.getElementById('rowDataAREAINFO').style.display="none";
		document.getElementById('rowDataLandINFO').style.display="none";		 
 	}
</script>

<script type="text/javascript">
function feedBack_Consultonload()
{
	for(var i=1; i<=14; i++)
	{
		document.getElementById('sln'+(i)).style.fontWeight = 'bold';
	}
}
function feedBack_ConsultY()
{
	document.getElementById('consID').style.display="";
	for(var i=1; i<=14; i++)
	{
		document.getElementById('sln'+(i)).innerHTML = i;
		document.getElementById('sln'+(i)).style.fontWeight = 'bold';
	}
}

function feedBack_ConsultN()
{
	document.getElementById('consID').style.display="none";
	for(var i=5; i<14; i++)
	{
		document.getElementById('sln'+(i+1)).innerHTML = i;	
		document.getElementById('sln'+(i)).style.fontWeight = 'bold';
	}
}

</script>

<script type="text/javascript">
var counter = 0;
function dispalyHigherQualification()
{
	counter += 1;
	document.getElementById('displayHigerEducation'+counter).style.display="";
	
	if(counter==3)
	 {
		document.getElementById('hideAddMoreQualification').style.display="none";
	 }
}
function DeleteHigherQualification(HQID)
{
	if (HQID < counter)
	{
		for ( var i=HQID+1;i<=counter;i++)
		{
			document.getElementById("QualificationEQHigher"+(i-1)).selectedIndex = document.getElementById("QualificationEQHigher"+i).selectedIndex;
			document.getElementById("QualificationEQHigher"+i).selectedIndex = "0";
			
			document.getElementById("SpecializationHiger"+(i-1)).selectedIndex = document.getElementById("SpecializationHiger"+i).selectedIndex;
			document.getElementById("SpecializationHiger"+i).selectedIndex = "0";
			

			document.getElementById("SpecializationHiger2nd"+(i-1)).selectedIndex = document.getElementById("SpecializationHiger2nd"+i).selectedIndex;
			document.getElementById("SpecializationHiger2nd"+i).selectedIndex = "0";
			
			document.getElementById("EQInstituteHiger"+(i-1)).value = document.getElementById("EQInstituteHiger"+i).value;
			document.getElementById("EQInstituteHiger"+i).value = "";
			
			document.getElementById("EQBoardHiger"+(i-1)).value = document.getElementById("EQBoardHiger"+i).value;
			document.getElementById("EQBoardHiger"+i).value = "";
			
			document.getElementById("EQCityHiger"+(i-1)).selectedIndex = document.getElementById("EQCityHiger"+i).selectedIndex;
			document.getElementById("EQCityHiger"+i).selectedIndex = "0";
			
			document.getElementById("EQStateHiger"+(i-1)).selectedIndex = document.getElementById("EQStateHiger"+i).selectedIndex;
			document.getElementById("EQStateHiger"+i).selectedIndex = "0";
			
			document.getElementById("EQCourse_CategoryHiger"+(i-1)).selectedIndex = document.getElementById("EQCourse_CategoryHiger"+i).selectedIndex;
			document.getElementById("EQCourse_CategoryHiger"+i).selectedIndex = "0";
			
			document.getElementById("CourseType"+(i-1)).selectedIndex = document.getElementById("CourseType"+i).selectedIndex;
			document.getElementById("CourseType"+i).selectedIndex = "0";
			
			document.getElementById("EQmediumOfEduHiger"+(i-1)).selectedIndex = document.getElementById("EQmediumOfEduHiger"+i).selectedIndex;
			document.getElementById("EQmediumOfEduHiger"+i).selectedIndex = "0";

			document.getElementById("EQDCYear"+(i-1)).selectedIndex = document.getElementById("EQDCYear"+i).selectedIndex;
			document.getElementById("EQDCYear"+i).selectedIndex = "0";
			
			document.getElementById("EQDCMonth"+(i-1)).selectedIndex = document.getElementById("EQDCMonth"+i).selectedIndex;
			document.getElementById("EQDCMonth"+i).selectedIndex = "0";			
			
			document.getElementById("EQyearOfJoinHiger"+(i-1)).selectedIndex = document.getElementById("EQyearOfJoinHiger"+i).selectedIndex;
			document.getElementById("EQyearOfJoinHiger"+i).selectedIndex = "0";

			document.getElementById("EQDCMonth"+(i-1)).selectedIndex = document.getElementById("EQDCMonth"+i).selectedIndex;
			document.getElementById("EQDCMonth"+i).selectedIndex = "0";
			
			
			
			document.getElementById("monthNameHiger"+(i-1)).selectedIndex = document.getElementById("monthNameHiger"+i).selectedIndex;
			document.getElementById("monthNameHiger"+i).selectedIndex = "0";

			document.getElementById("EQyearOfJoinMHiger"+(i-1)).selectedIndex = document.getElementById("EQyearOfJoinMHiger"+i).selectedIndex;
			document.getElementById("EQyearOfJoinMHiger"+i).selectedIndex = "0";

			document.getElementById("ScoreEQHiger"+(i-1)).value = document.getElementById("ScoreEQHiger"+i).value;
			document.getElementById("ScoreEQHiger"+i).value = "";

			document.getElementById("GradeEQHiger"+(i-1)).value = document.getElementById("GradeEQHiger"+i).value;
			document.getElementById("GradeEQHiger"+i).value = "";

			document.getElementById("CourseEQHiger"+(i-1)).selectedIndex = document.getElementById("CourseEQHiger"+i).selectedIndex;
			document.getElementById("CourseEQHiger"+i).selectedIndex = "0";
		}
		document.getElementById('displayHigerEducation'+counter).style.display="none";	
	}
	else
	{			
		document.getElementById("QualificationEQHigher"+HQID).selectedIndex = "0";	
		document.getElementById("SpecializationHiger"+HQID).selectedIndex = "0";	
		document.getElementById("SpecializationHiger2nd"+HQID).selectedIndex = "0";			
		document.getElementById("EQInstituteHiger"+HQID).value = "";	
		document.getElementById("EQBoardHiger"+HQID).value = "";
		document.getElementById("EQCityHiger"+HQID).selectedIndex = "0";
		document.getElementById("EQStateHiger"+HQID).selectedIndex = "0";
		document.getElementById("EQCourse_CategoryHiger"+HQID).selectedIndex = "0";
		document.getElementById("CourseType"+HQID).selectedIndex = "0";
		document.getElementById("EQmediumOfEduHiger"+HQID).selectedIndex = "0";
		document.getElementById("EQDCYear"+HQID).selectedIndex = "0";
		document.getElementById("EQDCMonth"+HQID).selectedIndex = "0";
		document.getElementById("EQyearOfJoinHiger"+HQID).selectedIndex = "0";
		document.getElementById("monthNameHiger"+HQID).selectedIndex = "0";
		document.getElementById("EQyearOfJoinMHiger"+HQID).selectedIndex = "0";
		document.getElementById("ScoreEQHiger"+HQID).value = "";
		document.getElementById("GradeEQHiger"+HQID).value = "";
		document.getElementById("CourseEQHiger"+HQID).selectedIndex = "0";	
		document.getElementById('displayHigerEducation'+HQID).style.display="none";	
	}
	counter -=1;
	document.getElementById('hideAddMoreQualification').style.display="";
}
</script>


<script type="text/javascript">
var faimly_Count=0;
function dispalyfaimlyBackgroung()
{
	faimly_Count += 1;
	document.getElementById('faimlyDetails'+faimly_Count).style.display="";
	if(faimly_Count==4)
	{
		document.getElementById('hidedisplayfaimlylink').style.display="none";
	}
}
function deleteFaimlyDetails(FDID)
{
	if (FDID < faimly_Count)
	{
		for ( var i=FDID+1;i<=faimly_Count;i++)
		{
			document.getElementById("FBMemberName"+(i-1)).value = document.getElementById("FBMemberName"+i).value;
			document.getElementById("FBMemberName"+i).value = "";
			
			document.getElementById("FBRelationship"+(i-1)).selectedIndex = document.getElementById("FBRelationship"+i).selectedIndex;
			document.getElementById("FBRelationship"+i).selectedIndex = "0";
			
			document.getElementById("FBdob"+(i-1)).value = document.getElementById("FBdob"+i).value;
			document.getElementById("FBdob"+i).value = "";
			
			document.getElementById("FBAge"+(i-1)).value = document.getElementById("FBAge"+i).value;
			document.getElementById("FBAge"+i).value = "";
			
			document.getElementById("FBOccupation"+(i-1)).value = document.getElementById("FBOccupation"+i).value;
			document.getElementById("FBOccupation"+i).value = "";
			
			document.getElementById("FBOIncome"+(i-1)).value = document.getElementById("FBOIncome"+i).value;
			document.getElementById("FBOIncome"+i).value = "";
			
		}
		document.getElementById('faimlyDetails'+faimly_Count).style.display="none";	
	}
	else
	{
		
		document.getElementById("FBMemberName"+FDID).value = "";
		document.getElementById("FBRelationship"+FDID).selectedIndex = "0";			
		document.getElementById("FBdob"+FDID).value = "";
		document.getElementById("FBAge"+FDID).value = "";			
		document.getElementById("FBOccupation"+FDID).value = "";			
		document.getElementById("FBOIncome"+FDID).value = "";
		document.getElementById('faimlyDetails'+FDID).style.display="none";	
	}
	faimly_Count -=1;
	document.getElementById('hidedisplayfaimlylink').style.display="";
}	

</script>

<script type="text/javascript">
var emerContact=0;
function dispalyEmergencyContact()
{
	emerContact += 1;
	document.getElementById('displayEmerContact'+emerContact).style.display="";
	if(emerContact==4)
	{
		document.getElementById('hideAddMoreEmergencyContact').style.display="none";
	}
}
function deleteEmerCOntact(EMCDID)
{
	if (EMCDID < emerContact)
	{
		for ( var i=EMCDID+1;i<=emerContact;i++)
		{
			document.getElementById("ECDName"+(i-1)).value = document.getElementById("ECDName"+i).value;
			document.getElementById("ECDName"+i).value = "";
			
			document.getElementById("ECDRelationship"+(i-1)).selectedIndex = document.getElementById("ECDRelationship"+i).selectedIndex;
			document.getElementById("ECDRelationship"+i).selectedIndex = "0";	
			
			document.getElementById("ECDAddress"+(i-1)).value = document.getElementById("ECDAddress"+i).value;
			document.getElementById("ECDAddress"+i).value = "";
			
			document.getElementById("ECDHomePhone1"+(i-1)).value = document.getElementById("ECDHomePhone1"+i).value;
			document.getElementById("ECDHomePhone1"+i).value = "";
			
			document.getElementById("ECDCity"+(i-1)).selectedIndex = document.getElementById("ECDCity"+i).selectedIndex;
			document.getElementById("ECDCity"+i).selectedIndex = "0"; ECDHomePhone21	
			
			document.getElementById("ECDHomePhone2"+(i-1)).selectedIndex = document.getElementById("ECDHomePhone2"+i).selectedIndex;
			document.getElementById("ECDHomePhone2"+i).selectedIndex = "0";
			
			document.getElementById("ECDMobile"+(i-1)).value = document.getElementById("ECDMobile"+i).value;
			document.getElementById("ECDMobile"+i).value = "";
			
			document.getElementById("ECDWorkPhone"+(i-1)).value = document.getElementById("ECDWorkPhone"+i).value;
			document.getElementById("ECDWorkPhone"+i).value = ""; 
			
			document.getElementById("ECDState"+(i-1)).selectedIndex = document.getElementById("ECDState"+i).selectedIndex;
			document.getElementById("ECDState"+i).selectedIndex = "0";
			
			document.getElementById("ECDEmail"+(i-1)).value = document.getElementById("ECDEmail"+i).value;
			document.getElementById("ECDEmail"+i).value = ""; 
			
			document.getElementById("ECDPinCode"+(i-1)).value = document.getElementById("ECDPinCode"+i).value;
			document.getElementById("ECDPinCode"+i).value = "";  
			
			document.getElementById("ECDCountry"+(i-1)).selectedIndex = document.getElementById("ECDCountry"+i).selectedIndex;
			document.getElementById("ECDCountry"+i).selectedIndex = "0";

		}
		document.getElementById('displayEmerContact'+emerContact).style.display="none";	
	}
	else
	{	
			document.getElementById("ECDName"+EMCDID).value = "";
			document.getElementById("ECDRelationship"+EMCDID).selectedIndex = "0";	
			document.getElementById("ECDAddress"+EMCDID).value = "";
			document.getElementById("ECDHomePhone1"+EMCDID).value = "";
			document.getElementById("ECDCity"+EMCDID).selectedIndex = "0"; 	
			document.getElementById("ECDHomePhone2"+EMCDID).selectedIndex = "0";
			document.getElementById("ECDMobile"+EMCDID).value = "";
			document.getElementById("ECDWorkPhone"+EMCDID).value = ""; 
			document.getElementById("ECDState"+EMCDID).selectedIndex = "0";
			document.getElementById("ECDEmail"+EMCDID).value = ""; 
			document.getElementById("ECDPinCode"+EMCDID).value = "";  
			document.getElementById("ECDCountry"+EMCDID).selectedIndex = "0";
			
		    document.getElementById('displayEmerContact'+EMCDID).style.display="none";	
	}
	emerContact -=1;
	document.getElementById('hideAddMoreEmergencyContact').style.display="";
}
</script>

<script type="text/javascript">
function AllowAlphabet(evt)
{
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 ||charCode == 32) {
		return true;
	}
	else
	{
		alert("Only Alphabets allowed here");
		return false;
	}
}      
</script>


</head>
  
<body onload="feedBack_Consultonload();">
  
    <%
 
  	String FirstName=null;
  	String MiddleName=null;
  	String LastName=null;
  	String Gender=null;
  	String Email=null;
  	String CandDOB=null;
  	String candExp=null;
  	String matchSelectFieldtitle=null;
  	
  	String mobileNumber=null;
  	String landLineNumber=null;
	String STD_Code=null;
	String Std_LandLine=null;	
	
	Statement st=null;
	ResultSet rs=null;
    
	try
	{
		String USER_Name =(String)session.getAttribute("USER_Name");
		System.out.println("USER_Name : "+USER_Name);
	    String USER_ID =(String) session.getAttribute("USER_ID");
	    System.out.println("USER_ID : "+USER_ID);		  
     %>

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
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Final Registration</font>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	        <!-- ############################################ -->
	 <br/>
 <div class="wrapper">
 <div class="contentSize">
 <form name="detailsReg" id="detailsReg" method="post" action="<%=request.getContextPath()%>/CandidateDetailsReg_Final" onSubmit="return chkRegistrationValidation();">
  	<%
	  	try
	  	{
		  	con=ConnectDatabase.getConnection();
		  	CallableStatement callProc = con.prepareCall("call FinalRegistration_Data_ENCRYPT(?,?,?)");
		  	System.out.println("Calllable statement \t"+callProc);
		  	System.out.println("call FinalRegistration_Data_ENCRYPT('"+USER_ID+"','"+EDKey+"','"+EDKPass+"')");
		  	callProc.setString(1,USER_ID);
		  	callProc.setString(2,EDKey);
		  	callProc.setString(3,EDKPass);
		  	rs = callProc.executeQuery();
			if(rs.next())
			{
				System.out.println(" ===  INSIDE RESULT SET ===  ");
				
				FirstName=rs.getString("First_Name");
			    System.out.println(FirstName);	
			    	
				MiddleName=rs.getString("Middle_Name");
				 System.out.println(MiddleName);	
				 
				LastName=rs.getString("Last_Sir_Name");
				 System.out.println(LastName);
				 	
				Gender=rs.getString("Gender").trim();
				 System.out.println(Gender);	
				 				
				Email=rs.getString("Email");
				 System.out.println(Email);
				 	
				System.out.println("Email  "+Email);
				CandDOB=rs.getString("Cand_DOB");
				 System.out.println(CandDOB);	
				 
				matchSelectFieldtitle=rs.getString("title");
				 System.out.println(matchSelectFieldtitle);	
				 
				mobileNumber=rs.getString("Phone");
				 System.out.println(mobileNumber);
				 		
				STD_Code=rs.getString("STD_Code");
				 System.out.println(FirstName);
				 	
				landLineNumber=rs.getString("Land_Line");
				 System.out.println(STD_Code);
				 	
				Std_LandLine=STD_Code+"-"+landLineNumber;
					 System.out.println(Std_LandLine);		
				candExp=rs.getString("Work_Experience");
				
				 System.out.println(candExp);	
							
				System.out.println(STD_Code+" --- --- "+landLineNumber);
 			}
 			rs.close();
 		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
  	 %>
  	 <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">    	
  		<tr>
  			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Personal Details</b></td>
  			<td colspan="3" align="right" valign="middle"><span style="color: red;"><b>*</b></span>&nbsp;<b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Mandatory Fields</b></td>
  		</tr>
  			<tr>
   			<td class="allBackColor" style="background-color: #d8d8d8;width: 75px;" rowspan="2">Name</td>
   			<td class="allBackColor" style="background-color: #d8d8d8;" align="center">Title</td>
   			<td class="allBackColor" style="background-color: #d8d8d8;" align="center">First Name</td>
   			<td class="allBackColor" style="background-color: #d8d8d8;" align="center">Middle Name</td>
   			<td class="allBackColor" style="background-color: #d8d8d8;" align="center">Last Name</td>
   		</tr>
   		<tr>					
			<td class="allBackColor" align="center">
				<label id="title"><%=matchSelectFieldtitle%></label> 
				<input type="hidden" name="title" id="title" value="<%=matchSelectFieldtitle%>"/>	
				<span></span>
   			</td>
   			<td class="allBackColor" align="center"><label id="F_HusbandName"><%=FirstName %></label></td><input type="hidden" name="F_HusbandName" id="F_HusbandName" value="<%=FirstName%>"/>	
   			<td class="allBackColor" align="center"><label id="M_HusbandName"><%=MiddleName %></label></td><input type="hidden" name="M_HusbandName" id="F_HusbandName" value="<%=MiddleName %>"/>	
   			<td class="allBackColor" align="center"><label id="L_HusbandName"><%=LastName %></label></td><input type="hidden" name="L_HusbandName" id="F_HusbandName" value="<%=LastName %>"/>	
   		</tr>    		
    		<tr>
    			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;" colspan="2">Gender</td>
    			<td class="allBackColor">
    				<%if(Gender.equals("Male")) 
    				{ 
    				%>
    					Male <input type="hidden" name="gen" value="M"/>    				
    				<%}else
    				{
    				%>    				
    					Female<input type="hidden" name="gen" value="F" id="F"/>
    				<%}%>
    			</td>
    			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Country of Birth&nbsp;<span style="color: red;">*</span></td>
    			<td class="allBackColor">
    				<select class="inputFieldResize" name="CountryBirth" id="CountryBirth">
    				<option value="">-- Select --</option>
    				<%
   				try
   				{
			        String secQueryCountryBirth= "SELECT countryId, countryName FROM mstcountry ORDER BY countryName";			        
			        st = con.createStatement();
					rs= st.executeQuery(secQueryCountryBirth);
					while(rs.next())
					{
					%>				
						<option value="<%=rs.getString("countryId")%>"><%=rs.getString("countryName") %></option>
					<%
					}
					rs.close();
				}
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
					%>  				
    			</select>
				</td>
    		</tr>
    		<tr>
    			<td class="allBackColor" style="background-color: #d8d8d8;" colspan="2">Date of Birth<br></td>
    			<td class="allBackColor"><%=CandDOB%> <input type="hidden" name="dob" value="<%=CandDOB%>"/></td>
    			<td class="allBackColor" style="background-color: #d8d8d8;">City of Birth</td>
    			<td class="allBackColor"><input type="text" name="birth_City" id="birth_City" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		</tr>
    		<tr>
    			<td  class="allBackColor" style="background-color: #d8d8d8;" colspan="2">Blood Group</td>
    			<td class="allBackColor">
    			<select class="inputFieldResize" name="Blood_Group">
    				<option value="">-- Select --</option>
    				<%
   				try
   				{
			        String secQueryBlood= "SELECT bloodGroupId, bloodGroupName FROM mstbloodgroup order by bloodGroupName";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryBlood);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("bloodGroupId")%>"><%=rs.getString("bloodGroupName") %></option>
					<%
					}
					rs.close();
				}
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
					%>
    			</select>
    			</td>
    			<td  class="allBackColor" style="background-color: #d8d8d8;">Domicile State</td>
    			<td class="allBackColor">
    			<select class="inputFieldResize" name="Domicile_State">
    				<option value="0">---Select---</option>
									
				<%
				try
				{
					String queryForCity="SELECT StateId, stateName FROM mststate WHERE stateId >1 ORDER BY stateName";
					st=con.createStatement();
				    rs=st.executeQuery(queryForCity);
					while(rs.next())
			    	{								
					 %>
					<option value="<%=rs.getString("StateId")%>"><%=rs.getString("stateName")%></option>
					 <%
					}
					rs.close();
				 }
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
				%>	
    			</select>
    			</td>
    		</tr>
    		
    		<tr>
    			<td  class="allBackColor" style="background-color: #d8d8d8;" colspan="2">Nationality <span style="color: red;">*</span></td>
    			<td class="allBackColor">
    			<select class="inputFieldResize" name="Nationality" id="Nationality">
    				<option value="">-- Select --</option>
    		<%
   				try
   				{
			        String secQueryNation= "SELECT nationalityId,nationalityName FROM mstnationality ORDER BY nationalityName";			        
				  	st= con.createStatement();
					rs= st.executeQuery(secQueryNation);
					while(rs.next())
					{
								        
					%>				
						<option value="<%=rs.getInt("nationalityId")%>"><%=rs.getString("nationalityName") %></option>
					<%
					}
					rs.close();
    			}
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
			%>  				
    			</select>
    			</td>
    			<td class="allBackColor" style="background-color: #d8d8d8;">Mother Tongue <span style="color: red;">*</span></td>
    			<td class="allBackColor">
    			<select  class="inputFieldResize" name="MotherTongue" id="MotherTongue">
					<option value="">--Select--</option>				
			<%
			   try
			   {
			        String secQueryMotherTongue= "SELECT languageId, LanguageName FROM mstlanguage ORDER BY LanguageName";			        
				  	st= con.createStatement();
					rs= st.executeQuery(secQueryMotherTongue);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
				}
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
			%>
				</select>
    		</td>
    			
    		</tr>
    		<tr>
    			<td class="allBackColor" style="background-color: #d8d8d8;" colspan="2">Marital Status <span style="color: red;">*</span></td>
    			<td class="allBackColor">
    				<input type="radio" name="Marial_Status" id="Marial_Status" value="Y" onClick="showOptionUn(this.value);"/>Married
    				<input type="radio" name="Marial_Status" id="Marial_Status" value="N" onClick="showOptionMr(this.value);"/>UnMarried
    			</td>
    			
    			<td  class="allBackColor" style="background-color: #d8d8d8;">Email Id<br></td>
    			<td class="allBackColor"><%=Email %><input type="hidden" name="emailID" value="<%=Email%>"/></td>
    			
    		</tr>
    		<tr>
				<td class="allBackColor" style="background-color: #d8d8d8;" colspan="2">
				
				<%if(Gender.equals("Male")){%>
    			<span id="father">Father's </span>
    			<%}else{%>    				
    			<span id="husband" style="display: none;">Husband's </span>
    			<span id="father">Father's </span>				
    			<%}%>
				Name
				
				<span style="color: red;">*</span></td>
    			<td class="allBackColor">
    			<input type="text" name="Fathre_HusbandName" id="Fathre_HusbandName" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" />
    			</td>
    			<td class="allBackColor" style="background-color: #d8d8d8;"><label id="WeddingDateLBL" style="display: none;">Wedding Date<span style="color: red;">*</span></label></td>
    			<td class="allBackColor">
    				<div id="WeddingDateDIV" style="display: none;">
	    				<input type="text" name="wedding_Date" id="wedding_Date" class="inputFieldResize"/>
	    			</div>
    			</td>
    		</tr> 
    		   
    		<tr>
    			<td class="allBackColor" style="background-color: #d8d8d8;" colspan="2">Pan No</td>
    			<td class="allBackColor"><input type="text" name="Pan_no" id="Pan_no" class="inputFieldResize" maxlength="10" onkeypress="return AllowAlphaNumeric(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>    			
    			<td class="allBackColor" style="background-color: #d8d8d8;">Religion <span style="color: red;">*</span></td>
    			<td class="allBackColor">    			
    			<select class="inputFieldResize" name="Religion" id="Religion">
    				<option value="">-- Select --</option>
    			<%
    				try
    				{
    						String queryRelision="SELECT religionId, religionName FROM mstreligion ORDER BY religionName";
    						st=con.createStatement();
						    rs=st.executeQuery(queryRelision);
							while(rs.next())
					    	{								
							 %>
							<option value="<%=rs.getInt("ReligionId")%>"><%=rs.getString("ReligionName")%></option>
							 <%
							}
							rs.close();
					 }
				    catch(Exception e)
				    {
				   	  e.printStackTrace();
				    }
    			%>
    			</select>
    			</td>
    		</tr> 	
    </table>
 <!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  -->   
    <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
    	<tr>
    		<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Current Address</b></td>
    		<td colspan="2" align="right" valign="middle"><input type="checkbox" name="parmanentAdd" id="parmanentAdd" onClick="return onSubmitClick();" value="Y"/>&nbsp;<b><font color="#777777" size="1.5">Same as the Current address</font></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Permanent Address</b></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address (Max 500 chars) <span style="color: red;">*</span></td>
    		<td class="allBackColor"><textarea name="address" id="address" style="resize:none;" maxlength="500" oncopy="return false" onpaste="return false" oncut="return false"/></textarea></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address (Max 500 chars)</td>
    		<td class="allBackColor"><textarea name="addressOrg" id="addressOrg" style="resize:none;" maxlength="500" oncopy="return false" onpaste="return false" oncut="return false"/></textarea></td>
    	</tr>
    	
    	<tr>
   			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State <span style="color: red;">*</span></td>
			<td class="allBackColor" style="color: #41383C; font-family: Arial,Helvetica,sans-serif; font-size: 12px; height: 18px; width: 100px;">
					<select class="inputFieldResize" name="State" id="State" onChange="selectStateGetDistrict()">
    					<option value=""> --select--</option>
    			<%
    				try
    				{    				
						String queryForS="SELECT StateId, stateName FROM mststate WHERE stateId >1 ORDER BY stateName";
						System.out.println("queryForS  =========   ::   "+queryForS);
						st=con.createStatement();
					    rs=st.executeQuery(queryForS);
						while(rs.next())
				    	{								
						 %>
						<option value="<%=rs.getInt("StateId")%>"><%=rs.getString("stateName")%></option>
						 <%
						}
						rs.close();
					}
					catch(Exception e)
					{
						e.getMessage();
						e.printStackTrace();
					}
				%>	 						
   				 </select>						
		   </td>
	
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="State_Org" id="State_Org">
    			<%
   				      try
   				       {
							String queryForStatesad="SELECT StateId, stateName FROM mststate WHERE stateId >1 ORDER BY stateName";
							System.out.println("queryForStatesad  =========   ::   "+queryForStatesad);
							st=con.createStatement();								
							rs=st.executeQuery(queryForStatesad);
							%>
    						<option value="">-- Select --</option>
  							<%
						 	while(rs.next())
						    {								
							 %>
								<option value="<%=rs.getString("StateId")%>"><%=rs.getString("stateName")%></option>
							 <%
							}
  							rs.close();
  						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
				%>   
    			</select>
   		  </td>
   			
    	</tr>
		<tr>
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;"> City <span style="color: red;">*</span></td>
			<td class="allBackColor" nowrap="nowrap">
				<select class="" name="city" id="city" onChange="return otherChk(this);">
    				   <option value=""> --select--</option>   
    			</select>
    			  <label id="CityNotListDIV" style="display:none;">Other<input type="text" name="CityOtherList" id="CityOtherList" style="width: 100px;" maxlength="50" oncopy="return false" onpaste="return false" oncut="return false"/></label>
					
			</td>
			
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City</td>
   			<td class="allBackColor">
   				
   				<select class="inputFieldResize" name="City_org" id="City_org">
    				   <option value=""> --select--</option>     
    			</select>
   			</td>
		</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Transport Required <span style="color: red;">*</span></td>
   			<td class="allBackColor">
   				<input type="radio" name="trans" id="trans" value="Y" onClick="showOptionTransY(this.value);"/>Yes
   				<input type="radio" name="trans" id="trans" value="N" onClick="showOptionTransN(this.value);"/>No
   			</td>
   			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;"></td>
   			<td class="allBackColor"></td>
    	</tr>								
		
		<tr id="rowDataAREAINFO" style="display: none;">
		
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Area <span style="color: red;">*</span></td>
			<td class="allBackColor">
			
					<select class="inputFieldResize" name="area" id="area" class="inputFieldResize">
    				<%
    				       String zoneID=null;
    				       try
    				       {
    				       
							String queryForarea="SELECT areaId, areaName, zoneID FROM mstarea ORDER BY areaName";
							System.out.println("queryForarea  =========   ::   "+queryForarea);
							st=con.createStatement();								
							rs=st.executeQuery(queryForarea);
							%>
    							<option value="">-- Select --</option>
  							<%
						 	while(rs.next())
						    {
						    	zoneID=rs.getString("zoneID");								
							 %>
								<option value="<%=rs.getString("areaId")%>,<%=rs.getString("zoneID")%>"><%=rs.getString("areaName")%></option>
							 <%
							}
  								rs.close();
							}
							catch(Exception e)
							{
								e.printStackTrace();
							}
				   %>   
    			  </select>

			</td>
			
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;"></td>
   			<td class="allBackColor"></td>
		</tr>
    	<tr id="rowDataLandINFO" style="display: none;">
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Landmark</td>
			<td class="allBackColor"><input type="text" name="landMark" id="landMark" class="inputFieldResize" maxlength="50" oncopy="return false" onpaste="return false" oncut="return false" /></td>					
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;"></td>
   			<td class="allBackColor"></td>
    	</tr>
				
    	<tr>
    	    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Pin Code<span style="color: red;">*</span></td>
    			<td class="allBackColor"><input type="text" name="Pin_Code" id="Pin_Code" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="6"/></td>		
    			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Pin Code: </td> 
    			<td class="allBackColor"><input type="text" name="Pin_Code_Org" id="Pin_Code_Org" class="inputFieldResize" maxlength="6" onKeyPress="return isNumberKey(event);"/></td>
    	 </tr>
    		
    		
    	<tr>
    			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Phone<br></td>
    			<td class="allBackColor"><div id="Phone_div"><%if( (STD_Code!=null && !STD_Code.equals("")) && (landLineNumber!=null && !landLineNumber.equals(""))){%><%=Std_LandLine %><input type="hidden" name="Phone" value="<%=Std_LandLine %>"/><%}else{ %><input type="text" name="Phone" id="Phone" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false"/>(R)<%} %></div></td>
    			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Phone</td>
    			<td class="allBackColor"><div id="Phone_divOrg"><%if((STD_Code!=null && !STD_Code.equals("")) && (landLineNumber!=null && !landLineNumber.equals(""))){%><%=Std_LandLine %><input type="hidden" name="Phone_org" value="<%=Std_LandLine %>"/><%}else{ %><input type="text" name="Phone_org" id="Phone_org" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15"/><%} %></div></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">
    			Mobile
    		</td>
    		<td class="allBackColor">
    			 <%if(!mobileNumber.equals("")){%><%=mobileNumber %><input type="hidden" name="Mobile_extra" value="<%=mobileNumber %>"/> (Mobile)<%}else{ %><input type="text" name="Mobile_extra" id="Mobile_extra" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="10" oncopy="return false" onpaste="return false" oncut="return false"/><%} %>
    		</td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;"></td>
    		<td class="allBackColor"></td>
      </tr>
    </table>
<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
<!-- *************************************************************************************************************** -->
   <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
 		<tr>
  			<td colspan="4" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Emergency Contact Details</b></td>
  		</tr> 		
 		 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor" width="27%"><input type="text" name="ECDName" id="ECDName" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">    			
    			<select name="ECDRelationship" id="ecdRelationShipSelect" class="inputFieldResize">
    			<option value="">-- Select --</option>
    			<%
    			
    			   try
    			   {
					String queryEcdrelationship="SELECT relationshipId, relationshipName FROM mstrelationship ORDER BY relationshipName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdrelationship);
					%>
  					
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("relationshipId")%>"><%=rs.getString("relationshipName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>    		
    	</tr>
    	 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address (Max 500)</td>
    		<td class="allBackColor"><textarea name="ECDAddress" id="ECDAddress" maxlength="500" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td> 
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 1</td>
    		<td class="allBackColor">
    			<input type="text" name="ECDHomePhone1" id="ECDHomePhone1" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/><br/>
    		
    		</td>   
    		 		
    	 </tr>
		 <tr>
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCity" id="ECDCity">
    			
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT CityId, cityName FROM mstcity order by cityName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value="">-- Select --</option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td> 
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 2</td>
    		<td class="allBackColor"><input type="text" name="ECDHomePhone2" id="ECDHomePhone2" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	    		 
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Mobile</td>
    		<td class="allBackColor"><input type="text" name="ECDMobile" id="ECDMobile" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="10" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">WorkPhone</td>
    		<td class="allBackColor"><input type="text" name="ECDWorkPhone" id="ECDWorkPhone" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false"/></td>
		 </tr>
		 
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State</td>
    		<td class="allBackColor">
				<select class="inputFieldResize" name="ECDState" id="ECDState">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT stateId, stateName FROM mststate where stateId >1 order by stateName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
			</td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Email</td>
    		<td class="allBackColor"><input type="text" name="ECDEmail" id="ECDEmail" class="inputFieldResize" maxlength="100" onchange="javascript:return ValidateEmail('ECDEmail');" oncopy="return false" onpaste="return false" oncut="return false"/></td>
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">PinCode</td>
    		<td class="allBackColor"><input type="text" name="ECDPinCode" id="ECDPinCode" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="6" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Country</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCountry" id="ECDCountry">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT countryId, countryName FROM mstcountry order by countryName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("countryId")%>"><%=rs.getString("countryName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>
		 </tr>
	
   </table>
   <div id="displayEmerContact1" style="display: none;">
      <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
 		<tr>
 			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Emergency Contact Details 1</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteEmerCOntact(1)" style="color:red;">Delete [X]</a></b></td>
  		</tr>    

 		 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor" width="27%"><input type="text" name="ECDName" id="ECDName1" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">
    			
    			<select name="ECDRelationship" id="ECDRelationship1" class="inputFieldResize">
    			<option value="">-- Select --</option>
    			<%
    			
    			   try
    			   {
					String queryEcdrelationship="SELECT relationshipId, relationshipName FROM mstrelationship ORDER BY relationshipName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdrelationship);
					%>
  					
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("relationshipId")%>"><%=rs.getString("relationshipName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>    		
    	</tr>
    	 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address (Max 500)</td>
    		<td class="allBackColor"><textarea name="ECDAddress" id="ECDAddress1" maxlength="500" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td> 
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 1</td>
    		<td class="allBackColor">
    			<input type="text" name="ECDHomePhone1" id="ECDHomePhone11" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /><br/>
    		
    		</td>   
    		 		
    	 </tr>
		 <tr>
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCity" id="ECDCity1">
    			
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT CityId, cityName FROM mstcity order by cityName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value="">-- Select --</option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td> 
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 2</td>
    		<td class="allBackColor"><input type="text" name="ECDHomePhone2" id="ECDHomePhone21" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	    		 
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Mobile</td>
    		<td class="allBackColor"><input type="text" name="ECDMobile" id="ECDMobile1" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="10" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">WorkPhone</td>
    		<td class="allBackColor"><input type="text" name="ECDWorkPhone" id="ECDWorkPhone1" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false" /></td>
		 </tr>
		 
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State</td>
    		<td class="allBackColor">
				<select class="inputFieldResize" name="ECDState" id="ECDState1">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT stateId, stateName FROM mststate order by stateName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
			</td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Email</td>
    		<td class="allBackColor"><input type="text" name="ECDEmail" id="ECDEmail1" class="inputFieldResize" maxlength="100" onchange="javascript:return ValidateEmail('ECDEmail1');"/></td>
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">PinCode</td>
    		<td class="allBackColor" ><input type="text" name="ECDPinCode" id="ECDPinCode1" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="6" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Country</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCountry" id="ECDCountry1">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT countryId, countryName FROM mstcountry order by countryName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("countryId")%>"><%=rs.getString("countryName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>
		 </tr>

   </table>
   
   </div>
   
   
      <div id="displayEmerContact2" style="display: none">
      <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
    	<tr>
    		<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Emergency Contact Details 2</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteEmerCOntact(2)" style="color:red;">Delete [X]</a></b></td>    		
    	</tr>
 		 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor" width="27%"><input type="text" name="ECDName" id="ECDName2" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">
    			
    			<select name="ECDRelationship" id="ECDRelationship2" class="inputFieldResize">
    			<option value="">-- Select --</option>
    			<%
    			
    			   try
    			   {
					String queryEcdrelationship="SELECT relationshipId, relationshipName FROM mstrelationship ORDER BY relationshipName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdrelationship);
					%>
  					
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("relationshipId")%>"><%=rs.getString("relationshipName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>    		
    	</tr>
    	 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address (Max 500)</td>
    		<td class="allBackColor"><textarea name="ECDAddress" id="ECDAddress2" maxlength="500" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td> 
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 1</td>
    		<td class="allBackColor">
    			<input type="text" name="ECDHomePhone1" id="ECDHomePhone12" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /><br/>
    		
    		</td>   
    		 		
    	 </tr>
		 <tr>
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCity" id="ECDCity2">
    			
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT CityId, cityName FROM mstcity order by cityName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value="">-- Select --</option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td> 
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 2</td>
    		<td class="allBackColor"><input type="text" name="ECDHomePhone2" id="ECDHomePhone22" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	    		 
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Mobile</td>
    		<td class="allBackColor"><input type="text" name="ECDMobile" id="ECDMobile2" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">WorkPhone</td>
    		<td class="allBackColor"><input type="text" name="ECDWorkPhone" id="ECDWorkPhone2" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false"/></td>
		 </tr>
		 
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State</td>
    		<td class="allBackColor">
				<select class="inputFieldResize" name="ECDState" id="ECDState2">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT stateId, stateName FROM mststate order by stateName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
			</td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Email</td>
    		<td class="allBackColor"><input type="text" name="ECDEmail" id="ECDEmail2" class="inputFieldResize" maxlength="100" onchange="javascript:return ValidateEmail('ECDEmail2');"/></td>
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">PinCode</td>
    		<td class="allBackColor"><input type="text" name="ECDPinCode" id="ECDPinCode2" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="6"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Country</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCountry" id="ECDCountry2">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT countryId, countryName FROM mstcountry order by countryName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("countryId")%>"><%=rs.getString("countryName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>
		 </tr>
	
   </table>
   
   </div>
   
    
      <div id="displayEmerContact3" style="display: none">
      <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
        <tr>
    		<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Emergency Contact Details 3</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteEmerCOntact(3)" style="color:red;">Delete [X]</a></b></td>    		
    	</tr>

 		 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor" width="27%"><input type="text" name="ECDName" id="ECDName3" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">
    			
    			<select name="ECDRelationship" id="ECDRelationship3" class="inputFieldResize">
    			<option value="">-- Select --</option>
    			<%
    			
    			   try
    			   {
					String queryEcdrelationship="SELECT relationshipId, relationshipName FROM mstrelationship ORDER BY relationshipName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdrelationship);
				
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("relationshipId")%>"><%=rs.getString("relationshipName")%></option>
					 <%
					}
				 	rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>    		
    	</tr>
    	 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address (Max 500)</td>
    		<td class="allBackColor"><textarea name="ECDAddress" id="ECDAddress3" maxlength="500" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td> 
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 1</td>
    		<td class="allBackColor">
    			<input type="text" name="ECDHomePhone1" id="ECDHomePhone13" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/><br/>
    		
    		</td>   
    		 		
    	 </tr>
		 <tr>
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCity" id="ECDCity3">
    			
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT CityId, cityName FROM mstcity order by cityName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value="">-- Select --</option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td> 
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 2</td>
    		<td class="allBackColor"><input type="text" name="ECDHomePhone2" id="ECDHomePhone23" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    	    		 
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Mobile</td>
    		<td class="allBackColor"><input type="text" name="ECDMobile" id="ECDMobile3" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">WorkPhone</td>
    		<td class="allBackColor"><input type="text" name="ECDWorkPhone" id="ECDWorkPhone3" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false" /></td>
		 </tr>
		 
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State</td>
    		<td class="allBackColor">
				<select class="inputFieldResize" name="ECDState" id="ECDState3">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT stateId, stateName FROM mststate order by stateName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
			</td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Email</td>
    		<td class="allBackColor"><input type="text" name="ECDEmail" id="ECDEmail3" class="inputFieldResize" maxlength="100" oncopy="return false" onpaste="return false" oncut="return false" onchange="javascript:return ValidateEmail('ECDEmail3');"/></td>
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">PinCode</td>
    		<td class="allBackColor"><input type="text" name="ECDPinCode" id="ECDPinCode3" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="6" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Country</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCountry" id="ECDCountry3">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT countryId, countryName FROM mstcountry";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("countryId")%>"><%=rs.getString("countryName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>
		 </tr>
   </table>
   
   </div>
 
	<div id="displayEmerContact4" style="display: none">
      <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
     
        <tr>
			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Emergency Contact Details</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteEmerCOntact(4)" style="color:red;">Delete [X]</a></b></td>    		
    	</tr>
 		 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor" width="27%"><input type="text" name="ECDName" id="ECDName4" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">    			
    			<select name="ECDRelationship" id="ECDRelationship4" class="inputFieldResize">
    			<option value="">-- Select --</option>
    			<%
    			
    			   try
    			   {
					String queryEcdrelationship="SELECT relationshipId, relationshipName FROM mstrelationship ORDER BY relationshipName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdrelationship);
				
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("relationshipId")%>"><%=rs.getString("relationshipName")%></option>
					 <%
					}
				 	rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>    		
    	</tr>
    	 <tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address (Max 500)</td>
    		<td class="allBackColor"><textarea name="ECDAddress" id="ECDAddress4" maxlength="500" oncopy="return false" onpaste="return false" oncut="return false"></textarea></td> 
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 1</td>
    		<td class="allBackColor">
    			<input type="text" name="ECDHomePhone1" id="ECDHomePhone14" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/><br/>
    		</td>   
    		 		
    	 </tr>
		 <tr>
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCity" id="ECDCity4">
    			
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT CityId, cityName FROM mstcity order by cityName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value="">-- Select --</option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td> 
			<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Home Phone No. 2</td>
    		<td class="allBackColor"><input type="text" name="ECDHomePhone2" id="ECDHomePhone24" maxlength="15" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    	    		 
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Mobile</td>
    		<td class="allBackColor"><input type="text" name="ECDMobile" id="ECDMobile4" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">WorkPhone</td>
    		<td class="allBackColor"><input type="text" name="ECDWorkPhone" id="ECDWorkPhone4" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="15" oncopy="return false" onpaste="return false" oncut="return false"/></td>
		 </tr>
		 
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State</td>
    		<td class="allBackColor">
				<select class="inputFieldResize" name="ECDState" id="ECDState4">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT stateId, stateName FROM mststate order by stateName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	e.printStackTrace();
    			   }
					%>   
    			</select>
			</td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Email</td>
    		<td class="allBackColor"><input type="text" name="ECDEmail" id="ECDEmail4" class="inputFieldResize" maxlength="100" oncopy="return false" onpaste="return false" oncut="return false" onchange="javascript:return ValidateEmail('ECDEmail4');"/></td>
		 </tr>
		 <tr>
		 	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">PinCode</td>
    		<td class="allBackColor"><input type="text" name="ECDPinCode" id="ECDPinCode4" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="6" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Country</td>
    		<td class="allBackColor">
    			<select class="inputFieldResize" name="ECDCountry" id="ECDCountry4">
    			   <%
    			   try
    			   {
					String queryEcdCity="SELECT countryId, countryName FROM mstcountry order by countryName";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("countryId")%>"><%=rs.getString("countryName")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    			</select>
    		</td>
		 </tr>

   </table>
   
   </div>
   
   <div align="right" style="padding-top: 10px; padding-right:175px; font-size:13px; font-family:Verdana, Arial, Helvetica, sans-serif; "><b><label id="hideAddMoreEmergencyContact"> <a onClick="dispalyEmergencyContact()" style="color: FF5500;">Add More Emergency Contact</a></label></b></div>


<!-- *************************************************************************************************************** -->
   <input type="hidden" name="candExprience" value="<%=candExp%>" id="candExprience"/>
  <%
  if(candExp.equalsIgnoreCase("Y"))
  {
   %>  

     <table border="0px" cellpadding="2.5" cellspacing="2.5" class="tPersonal">
        <tr>
			<td colspan="4" align="left" valign="middle" style="padding: 6px 6px 6px 6px;"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Work Experience</b></td>
    	</tr>
    	<tr>
    		<td class="pTdDHeader" nowrap="nowrap">Company <span style="color: red;">*</span></td>
    		<td class="pTdDHeader" nowrap="nowrap">From</td>
    		<td class="pTdDHeader" nowrap="nowrap">To</td>
    		<td class="pTdDHeader" nowrap="nowrap">Initial <br/>Designation</td>
    		<td class="pTdDHeader" nowrap="nowrap">Final<br/> Designation</td>
    		<td class="pTdDHeader" nowrap="nowrap">Reason For<br/> Leaving</td>
    		<td class="pTdDHeader" nowrap="nowrap">Last Salary<br/> Drawn(p.a)</td>
    		<td class="pTdDHeader" nowrap="nowrap">Customer <br/>Interaction<br/>Experience (Y/N)</td>
    	</tr>
    	<tr>
    	
    	    <td class="pTdworkExp" nowrap="nowrap"><input type="text" name="company" id="company1" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap"><input type="text" name="from" id="from1" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp" nowrap="nowrap"><input type="text" name="to" id="to1" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp" nowrap="nowrap"><input type="text" name="Initial_Desig" id="Initial_Desig1" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap"><input type="text" name="Final_Desig" id="Final_Desig1" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap"><input type="text" name="Reason_For_Leaving" id="Reason_For_Leaving1" class="workExpField" onkeypress="return AllowAlphaNumeric(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap"><input type="text" name="last_sal" id="last_sal1" class="workExpField" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap">
    			Yes<input type="radio" name="BPO_Exp1" id="BPO_Exp1" value="Y"/>
    			No<input type="radio" name="BPO_Exp1" id="BPO_Exp1" value="N"/>
    		</td> 
    	</tr>
    	
    	
      <tr>
    		<td class="pTdworkExp"><input type="text" name="company" id="company2" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="from" id="from2" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="to" id="to2" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="Initial_Desig" id="Initial_Desig2" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Final_Desig" id="Final_Desig2" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Reason_For_Leaving" id="Reason_For_Leaving2" class="workExpField" onkeypress="return AllowAlphaNumeric(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="last_sal" id="last_sal2" class="workExpField" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap">
    			Yes<input type="radio" name="BPO_Exp2" id="BPO_Exp2" value="Y"/>
    			No<input type="radio" name="BPO_Exp2" id="BPO_Exp2" value="N"/>
    		</td>
    	</tr>
    		<tr>
    		<td class="pTdworkExp"><input type="text" name="company" id="company3" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="from" id="from3" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="to" id="to3" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="Initial_Desig" id="Initial_Desig3" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Final_Desig" id="Final_Desig3" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Reason_For_Leaving" id="Reason_For_Leaving3" class="workExpField" onkeypress="return AllowAlphaNumeric(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="last_sal" id="last_sal3" class="workExpField" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap">
    			Yes<input type="radio" name="BPO_Exp3" id="BPO_Exp3" value="Y"/>
    			No<input type="radio" name="BPO_Exp3" id="BPO_Exp3" value="N"/>
    		</td>
    	</tr>
    	
    	 
    	<tr>
    		<td class="pTdworkExp"><input type="text" name="company" id="company4" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="from" id="from4" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="to" id="to4" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="Initial_Desig" id="Initial_Desig4" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Final_Desig" id="Final_Desig4" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Reason_For_Leaving" id="Reason_For_Leaving4" class="workExpField" onkeypress="return AllowAlphaNumeric(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="last_sal" id="last_sal4" class="workExpField" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap">
    			Yes<input type="radio" name="BPO_Exp4" id="BPO_Exp4" value="Y"/>
    			No<input type="radio" name="BPO_Exp4" id="BPO_Exp4" value="N"/>
    		</td>
    	</tr>
    	
    	
    	<tr>
    		<td class="pTdworkExp"><input type="text" name="company" id="company5" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="from" id="from5" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="to" id="to5" class="workExpField" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdworkExp"><input type="text" name="Initial_Desig" id="Initial_Desig5" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Final_Desig" id="Final_Desig5" class="workExpField" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="Reason_For_Leaving" id="Reason_For_Leaving5" class="workExpField" onkeypress="return AllowAlphaNumeric(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp"><input type="text" name="last_sal" id="last_sal5" class="workExpField" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdworkExp" nowrap="nowrap">
    			Yes<input type="radio" name="BPO_Exp5" id="BPO_Exp5" value="Y"/>
    			No<input type="radio" name="BPO_Exp5" id="BPO_Exp5" value="N"/>
    		</td>
    	
    	</tr>
    </table>    
    <%
    }    
     %>
<!-- *************************************************************************************************************** -->    
   <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
        <tr>
			<td colspan="4" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Recommend Friend for a [24]7 job</b></td>
    	</tr>
    	<tr>
    		<td class="pTdDHeader" nowrap="nowrap">Name</td>
    		<td class="pTdDHeader" nowrap="nowrap">Phone No.</td>
    		<td class="pTdDHeader" nowrap="nowrap">Email Id</td>
    		<td class="pTdDHeader" nowrap="nowrap">Customer Interaction<br/>Experience [Y/N]</td>
    	</tr>
    	<tr>
    		<td class="pTdDJob" align="center"><input type="text" name="name1" id="name1" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center"><input type="text" name="phone_No1" id="phone_No1" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="10" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center"><input type="text" name="Email_Id1" id="Email_Id1" class="inputFieldResize" maxlength="100" onchange="javascript:return ValidateEmail('Email_Id1');" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center">
    			Yes<input type="radio" name="RFJ_exp1" id="RFJ_exp1" value="Y"/>
    			No<input type="radio" name="RFJ_exp1" id="RFJ_exp1" value="N"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<td class="pTdDJob" align="center"><input type="text" name="name2" id="name2" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center"><input type="text" name="phone_No2" id="phone_No2" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="10" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center"><input type="text" name="Email_Id2" id="Email_Id2" class="inputFieldResize" maxlength="100" onchange="javascript:return ValidateEmail('Email_Id2');" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center">
    			Yes<input type="radio" name="RFJ_exp2" id="RFJ_exp2" value="Y"/>
    			No<input type="radio" name="RFJ_exp2" id="RFJ_exp2" value="N"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<td class="pTdDJob" align="center"><input type="text" name="name3" id="name3" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center"><input type="text" name="phone_No3" id="phone_No3" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="10" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center"> <input type="text" name="Email_Id3" id="Email_Id3" class="inputFieldResize" maxlength="100" onchange="javascript:return ValidateEmail('Email_Id3');" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center">
    			Yes<input type="radio" name="RFJ_exp3" id="RFJ_exp3" value="Y"/>
    			No<input type="radio" name="RFJ_exp3" id="RFJ_exp3" value="N"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<td class="pTdDJob" align="center"><input type="text" name="name4" id="name4" class="inputFieldResize" maxlength="50" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center"><input type="text" name="phone_No4" id="phone_No4" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="10" oncopy="return false" onpaste="return false" oncut="return false"/></td>
    		<td class="pTdDJob" align="center"><input type="text" name="Email_Id4" id="Email_Id4" class="inputFieldResize" maxlength="100" onchange="javascript:return ValidateEmail('Email_Id4');" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="pTdDJob" align="center">
    			Yes<input type="radio" name="RFJ_exp4" id="RFJ_exp4" value="Y"/>
    			No<input type="radio" name="RFJ_exp4" id="RFJ_exp4" value="N"/>
    		</td>
    	</tr>
    </table>
    
	<table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">    
        <tr>
			<td colspan="4" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Family Background 1</b></td>
     	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Father Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor"><input type="text" name="FBMemberName" id="FBMemberName" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;</td>
    		<td class="allBackColor">
    			Father 
    		<input type="hidden" name="FBRelationship" id="FBRelationship" value="1"/>
    		
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Date of Birth</td>
    		<td class="allBackColor"><input type="text" name="FBdob" id="FBdob" class="inputFieldResize" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Age</td>
    		<td class="allBackColor"><input type="text" name="FBAge" id="FBAge" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Occupation</td>
    		<td class="allBackColor"><input type="text" name="FBOccupation" id="FBOccupation" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Income</td>
    		<td class="allBackColor"><input type="text" name="FBOIncome" id="FBOIncome" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>
    </table>
    
    
<div id="faimlyDetails">
    <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
    	<tr>
			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Family Background 2</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"></b></td>    		
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Mother Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor"><input type="text" name="FBMemberName" id="FBMotherName" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;</td>
    		<td class="allBackColor">
    		
    		Mother
    		<input type="hidden" name="FBRelationship" id="FBRelationship1" value="2"/>
    		
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Date of Birth</td>
    		<td class="allBackColor"><input type="text" name="FBdob" id="FBdob_m" class="inputFieldResize" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Age</td>
    		<td class="allBackColor"><input type="text" name="FBAge" id="FBAge" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Occupation</td>
    		<td class="allBackColor"><input type="text" name="FBOccupation" id="FBOccupation" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Income</td>
    		<td class="allBackColor"><input type="text" name="FBOIncome" id="FBOIncome"  class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>

    </table>
</div>  

<div id="faimlyDetails1" style="display:none;">
    <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
    	<tr>
			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Family Background 1</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteFaimlyDetails(1)" style="color:red;">Delete [X]</a></b></td>    		
    	</tr>    
		<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Member Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor"><input type="text" name="FBMemberName" id="FBMemberName1" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">
    		<select class="inputFieldResize" name="FBRelationship" id="FBRelationship1">
    			   <%
    			   try
    			   {
					String queryEcdCity3="SELECT Relation_Id,Relation_Name FROM relation_ship_master WHERE Is_Active = 1";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity3);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("Relation_Id")%>"><%=rs.getString("Relation_Name")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    		</select>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Date of Birth</td>
    		<td class="allBackColor"><input type="text" name="FBdob" id="FBdob1" class="inputFieldResize" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Age</td>
    		<td class="allBackColor"><input type="text" name="FBAge" id="FBAge1" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Occupation</td>
    		<td class="allBackColor"><input type="text" name="FBOccupation" id="FBOccupation1" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Income</td>
    		<td class="allBackColor"><input type="text" name="FBOIncome" id="FBOIncome1"  class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>

    </table>

</div>

<div id="faimlyDetails2" style="display:none;">
    <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
    	<tr>
			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Family Background 2</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteFaimlyDetails(2)" style="color:red;">Delete [X]</a></b></td>    		
    	</tr> 
     	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Member Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor"><input type="text" name="FBMemberName" id="FBMemberName2" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">
    		<select class="inputFieldResize" name="FBRelationship" id="FBRelationship2">
    			   <%
    			   try
    			   {
					String queryEcdCity4="SELECT Relation_Id,Relation_Name FROM relation_ship_master WHERE Is_Active = 1";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity4);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("Relation_Id")%>"><%=rs.getString("Relation_Name")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    		</select>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Date of Birth</td>
    		<td class="allBackColor"><input type="text" name="FBdob" id="FBdob2" class="inputFieldResize" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Age</td>
    		<td class="allBackColor"><input type="text" name="FBAge" id="FBAge2" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Occupation</td>
    		<td class="allBackColor"><input type="text" name="FBOccupation" id="FBOccupation2" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Income</td>
    		<td class="allBackColor"><input type="text" name="FBOIncome" id="FBOIncome2"  class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>

    </table>

</div>
<div id="faimlyDetails3" style="display:none;">
    <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
    	 <tr>
			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Family Background 3</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteFaimlyDetails(3)" style="color:red;">Delete [X]</a></b></td>    		
    	</tr> 

     	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Member Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor"><input type="text" name="FBMemberName" id="FBMemberName3" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">
    		<select class="inputFieldResize" name="FBRelationship" id="FBRelationship3">
    			   <%
    			   try
    			   {
					String queryEcdCity5="SELECT Relation_Id,Relation_Name FROM relation_ship_master WHERE Is_Active = 1";
					Statement stmtEcdCity5=con.createStatement();								
					ResultSet rsEcdCity5=stmtEcdCity5.executeQuery(queryEcdCity5);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rsEcdCity5.next())
				    {								
					 %>
						<option value="<%=rsEcdCity5.getInt("Relation_Id")%>"><%=rsEcdCity5.getString("Relation_Name")%></option>
					 <%
					}
					rsEcdCity5.close();
					stmtEcdCity5.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    		</select>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Date of Birth</td>
    		<td class="allBackColor" ><input type="text" name="FBdob" id="FBdob3" class="inputFieldResize" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Age</td>
    		<td class="allBackColor"><input type="text" name="FBAge" id="FBAge3" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Occupation</td>
    		<td class="allBackColor"><input type="text" name="FBOccupation" id="FBOccupation3" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Income</td>
    		<td class="allBackColor"><input type="text" name="FBOIncome" id="FBOIncome3"  class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>
  
    </table>
</div>


<div id="faimlyDetails4" style="display:none;">

    <table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
     	<tr>
			<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Family Background 4</b></td>
    		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onclick="deleteFaimlyDetails(4)" style="color:red;">Delete [X]</a></b></td>    		
    	</tr>    	

     	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Member Name&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor"><input type="text" name="FBMemberName" id="FBMemberName4" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Relationship&nbsp;<span style="color: red;">*</span></td>
    		<td class="allBackColor">
    		<select class="inputFieldResize" name="FBRelationship" id="FBRelationship4">
    			   <%
    			   try
    			   {
					String queryEcdCity6="SELECT Relation_Id,Relation_Name FROM relation_ship_master WHERE Is_Active = 1";
					st=con.createStatement();								
					rs=st.executeQuery(queryEcdCity6);
					%>
  					<option value=""> --Select-- </option>
					<%
				 	while(rs.next())
				    {								
					 %>
						<option value="<%=rs.getInt("Relation_Id")%>"><%=rs.getString("Relation_Name")%></option>
					 <%
					}
					rs.close();
    			   }
    			   catch(Exception e)
    			   {
    			   	 e.printStackTrace();
    			   }
					%>   
    		</select>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Date of Birth</td>
    		<td class="allBackColor"><input type="text" name="FBdob" id="FBdob4" class="inputFieldResize" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Age</td>
    		<td class="allBackColor"><input type="text" name="FBAge" id="FBAge4" class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Occupation</td>
    		<td class="allBackColor"><input type="text" name="FBOccupation" id="FBOccupation4" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Income</td>
    		<td class="allBackColor"><input type="text" name="FBOIncome" id="FBOIncome4"  class="inputFieldResize" onKeyPress="return isNumberKey(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	</tr>

    </table>

</div>

<div align="right" style="padding-top: 10px; padding-right:175px; font-size:13px; font-family:Verdana, Arial, Helvetica, sans-serif; "><b><label id="hidedisplayfaimlylink"> <a onClick="dispalyfaimlyBackgroung();" style="color: FF5500;">Add More Family Details</a></label></b></div>    
 
<table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
	<tr>
		<td colspan="4" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Language Skills</b></td>
	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Language</td>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Proficiency</td>
    	</tr>
    	<tr>
    		<td class="allBackColor">
				<select  class="inputFieldResize" name="Language1">
					<option value="">--Select--</option>
				
				   <%
				   try
				   {
			        String secQueryLangauge1= "SELECT languageId, languageName FROM mstlanguage order by languageName";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryLangauge1);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getInt("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
				}
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
					%>
				</select>
			</td>
    		<td class="allBackColor">
    			Read:<input type="checkbox" name="ReadChk1" id="ReadChk1" value="R"/>
    			Write:<input type="checkbox" name="WriteChk1" id="WriteChk1" value="W"/>
    			Speak:<input type="checkbox" name="SpeakChk1" id="SpeakChk1" value="S"/>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor">
				<select  class="inputFieldResize" name="Language2">
					<option value="">--Select--</option>
					
				   <%
			   try
			   {
			        String secQueryLangauge2= "SELECT languageId, languageName FROM mstlanguage order by languageName";			        
				  	st = con.createStatement();
					rs= st.executeQuery(secQueryLangauge2);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
				}
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
					%>
				</select>
			</td>
    		<td class="allBackColor">
    			Read:<input type="checkbox" name="ReadChk2" id="ReadChk2" value="R"/>
    			Write:<input type="checkbox" name="WriteChk2" id="WriteChk2" value="W"/>
    			Speak:<input type="checkbox" name="SpeakChk2" id="SpeakChk2" value="S"/>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor">
				<select  class="inputFieldResize" name="Language3">
					<option value="">--Select--</option>
					
				   <%
				   try
				   {
			        String secQueryLangauge3= "SELECT languageId, languageName FROM mstlanguage order by languageName";			        
				  	st= con.createStatement();
					rs = st.executeQuery(secQueryLangauge3);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
					}
				    catch(Exception e)
				    {
				   	  e.printStackTrace();
				    }
					%>
				</select>
			</td>
    		<td class="allBackColor">
    			Read:<input type="checkbox" name="ReadChk3" id="ReadChk3" value="R"/>
    			Write:<input type="checkbox" name="WriteChk3" id="WriteChk3" value="W"/>
    			Speak:<input type="checkbox" name="SpeakChk3" id="SpeakChk3" value="S"/>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor">
				<select  class="inputFieldResize" name="Language4">
					<option value="">--Select--</option>
					
				   <%
				   try
  					{
		
			        String secQueryLangauge4= "SELECT languageId, languageName FROM mstlanguage order by languageName";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryLangauge4);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
				 }
   				 catch(Exception e)
   				 {
   	 				 e.printStackTrace();
   				 }
					%>
				</select>
			</td>
    		<td class="allBackColor">
    			Read:<input type="checkbox" name="ReadChk4" id="ReadChk4" value="R"/>
    			Write:<input type="checkbox" name="WriteChk4" id="WriteChk4" value="W"/>
    			Speak:<input type="checkbox" name="SpeakChk4" id="SpeakChk4" value="S"/>
    		</td>
    	</tr>
    	
    </table>
    
   
    
	<table border="0" cellpadding="6" cellspacing="6" class="tPersonal">
	<tr>
		<td colspan="4" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">Education Qualification</b></td>
	</tr>
	<tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Qualification</td>
   		<td class="allBackColor" colspan="3">SSC <input type="hidden" name="SSCQualification" value="113"/></td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name of Institute <span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQInstituteSSC" id="EQInstituteSSC" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Board <span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQBoardSSC" id="EQBoardSSC" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    </tr>
       <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City <span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select name="EQCitySSC" id="EQCitySSC">
    			
    	 <%
  		try
  		{
			String queryEcdCity="SELECT CityId, cityName FROM mstcity ORDER BY cityName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEcdCity);
			%>
					<option value="">-- Select --</option>
			<%
		 	while(rs.next())
		    {								
		 %>
			<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
		 <%
			}
			rs.close();
	    }
	    catch(Exception e)
	    {
	   	  e.printStackTrace();
	    }
		%>   
    			</select>
    	</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State <span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select name="EQStateSSC" id="EQStateSSC">
  	<%
  	try
      {
			String queryEcdCity="SELECT stateId, stateName FROM mststate WHERE stateId>1 ORDER BY stateName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEcdCity);
			%>
					<option value=""> --Select-- </option>
			<%
		 	while(rs.next())
		    {								
			 %>
				<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
			 <%
			}
			rs.close();
	   }
	   catch(Exception e)
	   {
	   	e.printStackTrace();
	   }
			%>   
  			</select>
    	</td>
    	
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Medium Of Instruction <span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQmediumOfEduSSC" id="EQmediumOfEduSSC" class="inputFieldResize">
					<option value="">--Select--</option>
					<%
			        String secQueryDoc5= "SELECT languageId, languageName FROM mstlanguage ORDER BY languageName";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryDoc5);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
					%>
				</select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;"></td>
    	<td class="allBackColor"></td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Year of joining <span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQyearOfJoinSSC" id="EQyearOfJoinSSC" class="inputFieldResize">
				<option value="">--Select--</option>
			<%
		        String secQueryYearC1= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs = st.executeQuery(secQueryYearC1);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
			%>
	   </select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Month and Year of Passing <span style="color: red;">*</span></td>
    	<td class="allBackColor" nowrap="nowrap">
    	<select class="workExpField" name="monthNameSSC" id="monthNameSSC">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    	<select name="EQMyearOfJoinMSSC" id="EQMyearOfJoinMSSC" class="workExpField">
		<option value="">--Select--</option>
			<%
		        String EQyearOfJoinYearC1= "SELECT * FROM years_list";			        
			  	st= con.createStatement();
				rs = st.executeQuery(EQyearOfJoinYearC1);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
			%>
	   </select>
    	</td>
    </tr>
   <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Score %</td>
   		<td class="allBackColor"><input type="text" name="ScoreEQSSC" id="ScoreEQSSC" style="width: 100px;" onkeypress="return blockNonNumbers(this, event, true, false);" onkeyup="extractNumber(this,2,false);" onblur="extractNumber(this,2,false);" oncopy="return false" onpaste="return false" oncut="return false" maxlength="5"/> %</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Appraisal <span style="color: red;">*</span></td>
    	<td class="allBackColor">
    		<select name="CourseEQSSC" id="CourseEQSSC" class="inputFieldResize">
    			<option value=""> --select-- </option>
    			<%
		        String EQyearApprSSC= "SELECT courseAppraisalId, courseAppraisalName FROM mstcourseappraisal";			        
			    st = con.createStatement();
				rs= st.executeQuery(EQyearApprSSC);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("courseAppraisalId")%>"><%=rs.getString("courseAppraisalName") %></option>
				<%
				}
				rs.close();
			%>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Qualification</td>
   		<td class="allBackColor" colspan="3">HSC<input type="hidden" name="HSCQualification" value="78"/></td>
    </tr> 
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Specialization <span style="color: red;">*</span></td>
   		<td class="allBackColor" colspan="3">
   			<select name="SpecializationHSC" id="SpecializationHSC" class="inputFieldResize">
   				<option value=""> --select-- </option>
   			<%
		        String secQuerySpecHSC= "SELECT specialisationId, specialisationName FROM mstspecialisation";			        
			  	st = con.createStatement();
				rs = st.executeQuery(secQuerySpecHSC);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("specialisationId")%>"><%=rs.getString("specialisationName") %></option>
				<%
				}
				rs.close();
			%>
   			</select>
   			
   		</td>
   		
    </tr>   
    
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name of Institute  <span style="color: red;">*</span> </td>
    	<td class="allBackColor"><input type="text" name="EQInstituteHSC" id="EQInstituteHSC" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Board <span style="color: red;">*</span></td>
    	<td class="allBackColor" ><input type="text" name="EQBoardHSC" id="EQBoardHSC" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    </tr>
       <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City <span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQCityHSC" id="EQCityHSC">
    			
    	 <%
  		try
  		{
			String queryEcdCityHSC="SELECT CityId, cityName FROM mstcity ORDER BY cityName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEcdCityHSC);
			%>
					<option value="">-- Select --</option>
			<%
		 	while(rs.next())
		    {								
		 %>
			<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
		 <%
			}
			rs.close();
	    }
	    catch(Exception e)
	    {
	   	  e.printStackTrace();
	    }
		%>   
    			</select>
    	</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State <span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQStateHSC" id="EQStateHSC">
  	<%
 		try
  		{
			String queryEQHSC="SELECT stateId, stateName FROM mststate WHERE stateId>1 ORDER BY stateName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEQHSC);
			%>
					<option value=""> --Select-- </option>
			<%
		 	while(rs.next())
		    {								
			 %>
				<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
			 <%
			}
			rs.close();
  		}
  		catch(Exception e)
  		{
  			e.printStackTrace();
  		}
  		
			%>   
  			</select>
    	</td>
    	
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Medium Of Instruction <span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQmediumOfEduHSC" id="EQmediumOfEduHSC" class="inputFieldResize">
					<option value="">--Select--</option>
					<%
			  try
				{
					String secQueryHSCEQ= "SELECT languageId, languageName FROM mstlanguage ORDER BY languageName";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryHSCEQ);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
		 		}
		  		catch(Exception e)
		  		{
		  			e.printStackTrace();
		  		}
					%>
				</select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;"></td>
    	<td class="allBackColor"></td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Year of joining <span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQyearOfJoinHSC" id="EQyearOfJoinHSC" class="inputFieldResize">
				<option value="">--Select--</option>
			<%
		    try
			{
				String secQueryYearHSCEQ= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs= st.executeQuery(secQueryYearHSCEQ);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
	 		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  		}
			%>
	   </select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Month and Year of Passing <span style="color: red;">*</span></td>
    	<td class="allBackColor" nowrap="nowrap">
    	<select class="workExpField" name="monthNameHSC" id="monthNameHSC">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    	<select name="EQyearOfJoinMHSC" id="EQyearOfJoinMHSC" class="workExpField">
		<option value="">--Select--</option>
			<%
		    try
			{
				String EQyearHSC= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs = st.executeQuery(EQyearHSC);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
	 		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  		}
			%>
	   </select>
    	</td>
    </tr>
   <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Score %</td>
   		<td class="allBackColor"><input type="text" name="ScoreEQHSC" id="ScoreEQHSC" style="width: 100px;"  onkeypress="return blockNonNumbers(this, event, true, false);" onkeyup="extractNumber(this,2,false);" onblur="extractNumber(this,2,false);" oncopy="return false" onpaste="return false" oncut="return false" maxlength="5" /> % </td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Appraisal <span style="color: red;">*</span></td>
    	<td class="allBackColor">
    		<select name="CourseEQHSC" id="CourseEQHSC" class="inputFieldResize">
    			<option value=""> --select-- </option>
    		<%
		    try
    		{
    			String EQyearApprHSC= "SELECT courseAppraisalId, courseAppraisalName FROM mstcourseappraisal";			        
			  	st = con.createStatement();
				rs = st.executeQuery(EQyearApprHSC);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("courseAppraisalId")%>"><%=rs.getString("courseAppraisalName") %></option>
				<%
				}
				rs.close();
	 		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  		}
			%>
    		</select>
    	</td>
    </tr>
   	</table>
  <!-- ********************************** -->	
  <div id="displayHigerEducation1" style="display: none;"> 	
   	<table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
   	<tr>   		
		<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Education Qualification 1</b></td>
		<td colspan="2" align="right" valign="middle">
	<b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;">
		<a onClick="DeleteHigherQualification(1)" style="color: red; padding-left: 190px;">Delete [X]</a>
	</b></td>    
   	</tr>
   	
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Qualification&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor" colspan="3">
			<select name="QualificationEQHigher" id="QualificationEQHigher1">
    			<option value=""> --select-- </option>
    		<%
		    try
    		{
		    	String qualificationQuery= "SELECT * FROM mstqualification WHERE qualificationGroupId !=1";			        
			  	st = con.createStatement();
				rs = st.executeQuery(qualificationQuery);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("qualificationId")%>"><%=rs.getString("qualificationName") %></option>
				<%
				}
				rs.close();
	 		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  		}
			%>
    		</select>		
		</td>
		

    </tr> 
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Specialization 1&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   			<select name="SpecializationHiger1" id="SpecializationHiger1"  class="inputFieldResize"  style="width:178px;">
   				<option value=""> --select-- </option>
   			<%
		    try
   			{
		    	String secQuerySpecHSC1= "SELECT specialisationId, specialisationName FROM mstspecialisation";			        
			    st = con.createStatement();
				rs= st.executeQuery(secQuerySpecHSC1);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("specialisationId")%>"><%=rs.getString("specialisationName") %></option>
				<%
				}
				rs.close();
	 		}
	  		catch(Exception e)
	  		{
	  			e.printStackTrace();
	  		}	
			%>
   			</select>
   			
   		</td>
   		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Specialization 2</td>
   		<td class="allBackColor">
   		<select name="SpecializationHiger2" id="SpecializationHiger2nd1"  class="inputFieldResize">
   			<option value=""> --select-- </option>
   			<%
		    try
   			{
		    	String secQuerySpecHSC2= "SELECT specialisationId, specialisationName FROM mstspecialisation";			        
   				 st = con.createStatement();
				rs = st.executeQuery(secQuerySpecHSC);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("specialisationId")%>"><%=rs.getString("specialisationName") %></option>
				<%
				}
				rs.close();
   	 		}
   	  		catch(Exception e)
   	  		{
   	  			e.printStackTrace();
   	  		}
			%>
   			</select>
   		</td>
    </tr>   
    
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name of Institute &nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQInstituteHiger" id="EQInstituteHiger1" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">University&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQBoardHiger" id="EQBoardHiger1" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false"  /></td>
    </tr>
       <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQCityHiger" id="EQCityHiger1">
    			
    	<%
  		try
  		{
			String queryEcdCityHigher="SELECT CityId, cityName FROM mstcity ORDER BY cityName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEcdCityHigher);
			%>
					<option value=""> --Select--</option>
			<%
		 	while(rs.next())
		    {								
		 %>
			<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
		 <%
			}
			rs.close();
	    }
	    catch(Exception e)
	    {
	   	  e.printStackTrace();
	    }
		%>   
    			</select>
    	</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQStateHiger" id="EQStateHiger1">
  	<%
 		try
  		{	
			String queryEQHigher="SELECT stateId, stateName FROM mststate WHERE stateId>1 ORDER BY stateName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEQHigher);
			%>
					<option value=""> --Select-- </option>
			<%
		 	while(rs.next())
		    {								
			 %>
				<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
			 <%
			}
			rs.close();
	    }
    catch(Exception e)
    {
   	  e.printStackTrace();
    }
			%>   
  			</select>
    	</td>
    	
    </tr>
    <tr>
    <td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Category&nbsp;<span style="color: red;">*</span></td>
    <td class="allBackColor">
    <select name="EQCourse_CategoryHiger" id="EQCourse_CategoryHiger1" class="inputFieldResize">
					<option value="">--Select--</option>
			<%
			try
			{
			        String secQueryCourse_CateHigherEQ= "SELECT courseCategoryId, courseCategoryName FROM mstcoursecategory";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryCourse_CateHigherEQ);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("courseCategoryId")%>"><%=rs.getString("courseCategoryName") %></option>
					<%
					}
					rs.close();
			    }
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }
			%>
				</select>
    
    </td>
    <td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Type&nbsp;<span style="color: red;">*</span></td>
    <td class="allBackColor">
				<select class="inputFieldResize" name="CourseType" id="CourseType1">
					<option value="">--Select--</option>
			<%
			    try
				{
			    	String secQueryCourseTypeHigherEQ= "SELECT courseTypeId, courseTypeName FROM mstcoursetype";			        
				  	st = con.createStatement();
					rs= st.executeQuery(secQueryCourseTypeHigherEQ);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("courseTypeId")%>"><%=rs.getString("courseTypeName") %></option>
					<%
					}
					rs.close();
			    }
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }	
			%>
				</select>
    
    </td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Medium Of Instruction&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQmediumOfEduHiger" id="EQmediumOfEduHiger1"  class="inputFieldResize">
					<option value="">--Select--</option>
					<%
			    try
				{
			    	String secQueryHigherEQ= "SELECT languageId, languageName FROM mstlanguage ORDER BY languageName";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryHigherEQ);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
			    }
			    catch(Exception e)
			    {
			   	  e.printStackTrace();
			    }	
					%>
				</select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Duration of Course&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    		
    		<select name="EQDCYear" id="EQDCYear1" class="workExpField">
			<option value="">--Select--</option>
			<%
		    try
			{
		    	String EQDC2= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs= st.executeQuery(EQDC2);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
			%>
	   </select>
    	<select class="workExpField" name="EQDCMonth" id="EQDCMonth1">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    	
    	</td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Year of joining&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQyearOfJoinHiger" id="EQyearOfJoinHiger1" class="inputFieldResize">
				<option value="">--Select--</option>
			<%
		     try
			 {
		    	 String secQueryYearHigherEQ= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs = st.executeQuery(secQueryYearHigherEQ);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
		    }
		    catch(Exception e)
		    {
		   	  e.printStackTrace();
		    }
			%>
	   </select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Month and Year of Passing&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor" nowrap="nowrap">
    	<select class="workExpField" name="monthNameHiger" id="monthNameHiger1">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    	<select name="EQyearOfJoinMHiger" id="EQyearOfJoinMHiger1" class="workExpField">
		<option value="">--Select--</option>
			<%
		    try
			{
		    	String EQyearHigher= "SELECT * FROM years_list";			        
			  	st= con.createStatement();
				rs= st.executeQuery(EQyearHigher);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
		    }
		    catch(Exception e)
		    {
		   	  e.printStackTrace();
		    }
			%>
	   </select>
    	</td>
    </tr>
   <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Score %</td>
   		<td class="allBackColor"><input type="text" name="ScoreEQHiger" id="ScoreEQHiger1" style="width: 75px;"  onkeypress="return blockNonNumbers(this, event, true, false);" onkeyup="extractNumber(this,2,false);" onblur="extractNumber(this,2,false);" oncopy="return false" onpaste="return false" oncut="return false" maxlength="5" /> % </td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Appraisal&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    		<select name="CourseEQHiger" id="CourseEQHiger1" class="inputFieldResize">
    			<option value="0"> --select-- </option>
    			<%
		    try
    		{
		    	String EQyearApprHigher= "SELECT courseAppraisalId, courseAppraisalName FROM mstcourseappraisal";			        
			  	st= con.createStatement();
				rs= st.executeQuery(EQyearApprHigher);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("courseAppraisalId")%>"><%=rs.getString("courseAppraisalName") %></option>
				<%
				}
				rs.close();
		    }
		    catch(Exception e)
		    {
		   	  e.printStackTrace();
		    }
			%>
    		</select>
    	</td>
    </tr>
   	</table>
   	</div>
   	<!-- *****************  -->
 
 
 	
   	<div id="displayHigerEducation2" style="display: none;"> 	
   	<table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
   	<tr>   		
		<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Education Qualification 2</b></td>
		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onClick="DeleteHigherQualification(2)" style="color: red; padding-left: 190px;">Delete [X]</a></b></td>    
   	</tr>

    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Qualification&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor" colspan="3">
			<select name="QualificationEQHigher" id="QualificationEQHigher2">
    			<option value=""> --select-- </option>
    		<%
    		try
    		{
		        String qualificationQuery1= "SELECT * FROM mstqualification WHERE qualificationGroupId !=1";			        
			  	st= con.createStatement();
				rs = st.executeQuery(qualificationQuery1);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("qualificationId")%>"><%=rs.getString("qualificationName") %></option>
				<%
				}
				rs.close();
		    }
		    catch(Exception e)
		    {
		   	  e.printStackTrace();
		    }
			%>
    		</select>		
		</td>

    </tr> 
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Specialization 1&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   			<select name="SpecializationHiger1" id="SpecializationHiger2" class="inputFieldResize"  style="width:178px;">
   				<option value=""> --select-- </option>
   			<%
			try
			{
		        String secQuerySpecHSC11= "SELECT specialisationId, specialisationName FROM mstspecialisation";			        
			  	st= con.createStatement();
				rs= st.executeQuery(secQuerySpecHSC11);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("specialisationId")%>"><%=rs.getString("specialisationName") %></option>
				<%
				}
				rs.close();
  		  }
  		  catch(Exception e)
  		  {
 			  e.printStackTrace();
		  }
   		%>
   			</select>
   			
   		</td>
   		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Specialization 2</td>
   		<td class="allBackColor">
   		<select name="SpecializationHiger2" id="SpecializationHiger2nd2"  class="inputFieldResize">
   			<option value=""> --select-- </option>
   			<%
		try
   		{
			    String secQuerySpecHSC21= "SELECT specialisationId, specialisationName FROM mstspecialisation";			        
			  	st = con.createStatement();
				rs = st.executeQuery(secQuerySpecHSC);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("specialisationId")%>"><%=rs.getString("specialisationName") %></option>
				<%
				}
				rs.close();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
			%>
   			</select>
   		</td>
    </tr>   
    
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name of Institute<span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQInstituteHiger" id="EQInstituteHiger2" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Univercity&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQBoardHiger" id="EQBoardHiger2" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    </tr>
       <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQCityHiger" id="EQCityHiger2">
    			
    	<%
  		try
  		{
			String queryEcdCityHigher1="SELECT CityId, cityName FROM mstcity ORDER BY cityName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEcdCityHigher1);
			%>
					<option value=""> --Select--</option>
			<%
		 	while(rs.next())
		    {								
		 %>
			<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
		 <%
			}
			rs.close();
	    }
	    catch(Exception e)
	    {
	   	  e.printStackTrace();
	    }
		%>   
    			</select>
    	</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQStateHiger" id="EQStateHiger2">
  	<%
 
	try
  	{
		String queryEQHigher1="SELECT stateId, stateName FROM mststate WHERE stateId>1 order by stateName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEQHigher1);
			%>
					<option value=""> --Select-- </option>
			<%
		 	while(rs.next())
		    {								
			 %>
				<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
			 <%
			}
			rs.close();
   }
   catch(Exception e)
   {
  	  e.printStackTrace();
   }			%>   
  			</select>
    	</td>
    	
    </tr>
    <tr>
    <td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Category&nbsp;<span style="color: red;">*</span></td>
    <td class="allBackColor">
    <select name="EQCourse_CategoryHiger" id="EQCourse_CategoryHiger2" class="inputFieldResize">
					<option value="">--Select--</option>
			<%
			try
			{
				  	String secQueryCourse_CateHigherEQ1= "SELECT courseCategoryId, courseCategoryName FROM mstcoursecategory";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryCourse_CateHigherEQ1);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("courseCategoryId")%>"><%=rs.getString("courseCategoryName") %></option>
					<%
					}
					rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
				</select>
    
    </td>
    <td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Type&nbsp;<span style="color: red;">*</span></td>
    <td class="allBackColor">
				<select class="inputFieldResize" name="CourseType" id="CourseType2">
					<option value="">--Select--</option>
			<%
	try
	{
					String secQueryCourseTypeHigherEQ1= "SELECT courseTypeId, courseTypeName FROM mstcoursetype";			        
				    st= con.createStatement();
					rs= st.executeQuery(secQueryCourseTypeHigherEQ1);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("courseTypeId")%>"><%=rs.getString("courseTypeName") %></option>
					<%
					}
					rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
			%>
				</select>
    
    </td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Medium Of Instruction<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQmediumOfEduHiger" id="EQmediumOfEduHiger2" class="inputFieldResize">
					<option value="">--Select--</option>
					<%
	try
	{
					String secQueryHigherEQ1= "SELECT languageId, languageName FROM mstlanguage ORDER BY languageName";			        
				  	st= con.createStatement();
					rs =st.executeQuery(secQueryHigherEQ1);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		
					%>
				</select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Duration of Course&nbsp;<span style="color: red;">*</span></td>
    	
    	<td class="allBackColor">
    		
    		<select name="EQDCYear" id="EQDCYear2" class="workExpField">
			<option value="">--Select--</option>
			<%
		    try
			{
		    	String EQDC2= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs= st.executeQuery(EQDC2);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
			%>
	   </select>
    	<select class="workExpField" name="EQDCMonth" id="EQDCMonth2">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    	</td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Year of joining&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQyearOfJoinHiger" id="EQyearOfJoinHiger2" class="inputFieldResize">
				<option value="">--Select--</option>
			<%
	try
	{
				String secQueryYearHigherEQ1= "SELECT * FROM years_list";			        
			  	st= con.createStatement();
				rs= st.executeQuery(secQueryYearHigherEQ1);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		
			%>
	   </select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Month and Year of Passing&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor" nowrap="nowrap">
    	<select class="workExpField" name="monthNameHiger" id="monthNameHiger2">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    	<select name="EQyearOfJoinMHiger" id="EQyearOfJoinMHiger2" class="workExpField">
		<option value="">--Select--</option>
			<%
	try
	{		
			    String EQyearHigher1= "SELECT * FROM years_list";			        
			  	st= con.createStatement();
				rs= st.executeQuery(EQyearHigher1);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		
			%>
	   </select>
    	</td>
    </tr>
   <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Score %</td>
   		<td class="allBackColor"><input type="text" name="ScoreEQHiger" id="ScoreEQHiger2" style="width:100px;"  onkeypress="return blockNonNumbers(this, event, true, false);" onkeyup="extractNumber(this,2,false);" onblur="extractNumber(this,2,false);" oncopy="return false" onpaste="return false" oncut="return false" maxlength="5" /> %</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Appraisal&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    		<select name="CourseEQHiger" id="CourseEQHiger2" class="inputFieldResize">
    			<option value=""> --select-- </option>
    			<%
	try
    {
				String EQyearApprHigher1= "SELECT courseAppraisalId, courseAppraisalName FROM mstcourseappraisal";			        
			  	st = con.createStatement();
				rs = st.executeQuery(EQyearApprHigher1);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("courseAppraisalId")%>"><%=rs.getString("courseAppraisalName") %></option>
				<%
				}
				rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
			%>
    		</select>
    	</td>
    </tr>
   	</table>
   	</div>
   	
   	<!-- 5555555 -->

   	
   	
      	<!-- *****************  -->
 
 
   	  <div id="displayHigerEducation3" style="display: none;"> 	
   	<table border="0px;" cellpadding="6" cellspacing="6" class="tPersonal">
  		
   	<tr>   		
		<td colspan="2" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; color: gray;">Additional Education Qualification 3</b></td>
		<td colspan="2" align="right" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif;"><a onClick="DeleteHigherQualification(3)" style="color: red; padding-left: 190px;">Delete [X]</a></b></td>    
   	</tr>

    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Qualification&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor" colspan="3">
			<select name="QualificationEQHigher" id="QualificationEQHigher3">
    			<option value=""> --select-- </option>
    		<%
	try
    {
    			String qualificationQuery11= "SELECT * FROM mstqualification WHERE qualificationGroupId !=1";			        
			  	st= con.createStatement();
				rs= st.executeQuery(qualificationQuery11);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("qualificationId")%>"><%=rs.getString("qualificationName") %></option>
				<%
				}
				rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}			%>
    		</select>		
		</td>

    </tr>
     
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Specialization 1&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   			<select name="SpecializationHiger1" id="SpecializationHiger3"  class="inputFieldResize" style="width: 178px;">
   				<option value=""> --select-- </option>
   			<%
		    try
   			{
		    	String secQuerySpecHSC111= "SELECT specialisationId, specialisationName FROM mstspecialisation";			        
			  	st= con.createStatement();
				rs = st.executeQuery(secQuerySpecHSC111);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("specialisationId")%>"><%=rs.getString("specialisationName") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
			%>
   			</select>
   			
   		</td>
   		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Specialization 2</td>
   		<td class="allBackColor">
   		<select name="SpecializationHiger2" id="SpecializationHiger2nd3"  class="inputFieldResize">
   			<option value=""> --select-- </option>
   			<%
		    try
   			{
		    	String secQuerySpecHSC211= "SELECT specialisationId, specialisationName FROM mstspecialisation";			        
			  	st = con.createStatement();
				rs= st.executeQuery(secQuerySpecHSC);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("specialisationId")%>"><%=rs.getString("specialisationName") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
			%>
   			</select>
   		</td>
    </tr>   
    
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Name of Institute<span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQInstituteHiger" id="EQInstituteHiger3" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Univercity&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor"><input type="text" name="EQBoardHiger" id="EQBoardHiger3" class="inputFieldResize" onkeypress="return AllowChars(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    </tr>
       <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">City&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQCityHiger" id="EQCityHiger3">
    			
    	<%
  		try
  		{
			String queryEcdCityHigher11="SELECT CityId, cityName FROM mstcity ORDER BY cityName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEcdCityHigher11);
			%>
					<option value=""> --Select--</option>
			<%
		 	while(rs.next())
		    {								
		 %>
			<option value="<%=rs.getInt("CityId")%>"><%=rs.getString("cityName")%></option>
		 <%
			}
			rs.close();
	    }
	    catch(Exception e)
	    {
	   	  e.printStackTrace();
	    }
		%>   
    			</select>
    	</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">State&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	<select class="inputFieldResize" name="EQStateHiger" id="EQStateHiger3">
  	<%
 	try
  	{
			String queryEQHigher11="SELECT stateId, stateName FROM mststate WHERE stateId>1 order by stateName";
			st=con.createStatement();								
			rs=st.executeQuery(queryEQHigher11);
			%>
					<option value=""> --Select-- </option>
			<%
		 	while(rs.next())
		    {								
			 %>
				<option value="<%=rs.getInt("stateId")%>"><%=rs.getString("stateName")%></option>
			 <%
			}
			rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}	
			%>   
  			</select>
    	</td>
    	
    </tr>
    <tr>
    <td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Category&nbsp;<span style="color: red;">*</span></td>
    <td class="allBackColor">
    <select name="EQCourse_CategoryHiger" id="EQCourse_CategoryHiger3" class="inputFieldResize">
					<option value="">--Select--</option>
			<%
				try
				{
			        String secQueryCourse_CateHigherEQ11= "SELECT courseCategoryId, courseCategoryName FROM mstcoursecategory";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryCourse_CateHigherEQ11);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("courseCategoryId")%>"><%=rs.getString("courseCategoryName") %></option>
					<%
					}
					rs.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}	
			%>
				</select>
    
    </td>
    <td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Type&nbsp;<span style="color: red;">*</span></td>
    <td class="allBackColor">
				<select class="inputFieldResize" name="CourseType" id="CourseType3">
					<option value="">--Select--</option>
			<%
			try
				{
			        String secQueryCourseTypeHigherEQ11= "SELECT courseTypeId, courseTypeName FROM mstcoursetype";			        
				  	st = con.createStatement();
					rs = st.executeQuery(secQueryCourseTypeHigherEQ11);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("courseTypeId")%>"><%=rs.getString("courseTypeName") %></option>
					<%
					}
					rs.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}	
			%>
				</select>
    
    </td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Medium Of Instruction&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQmediumOfEduHiger" id="EQmediumOfEduHiger3"  class="inputFieldResize">
					<option value="">--Select--</option>
					<%
			   try
				{
					String secQueryHigherEQ11= "SELECT languageId, languageName FROM mstlanguage ORDER BY languageName";			        
				  	st= con.createStatement();
					rs = st.executeQuery(secQueryHigherEQ11);
					while(rs.next())
					{			        
					%>					
						<option value="<%=rs.getString("languageId")%>"><%=rs.getString("languageName") %></option>
					<%
					}
					rs.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}	
					%>
				</select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Duration of Course&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    	
    	<select name="EQDCYear" id="EQDCYear3" class="workExpField">
		<option value="">--Select--</option>
			<%
		    try
			{
		    	String EQDC3= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs= st.executeQuery(EQDC3);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
			%>
	   </select>
    	<select class="workExpField" name="EQDCMonth" id="EQDCMonth3">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    
    	
    	</td>
    </tr>
    <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Year of joining&nbsp;<span style="color: red;">*</span></td>
   		<td class="allBackColor">
   		<select name="EQyearOfJoinHiger" id="EQyearOfJoinHiger3" class="inputFieldResize">
				<option value="">--Select--</option>
			<%
		     try
			 {
		    	String secQueryYearHigherEQ11= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs = st.executeQuery(secQueryYearHigherEQ11);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
			%>
	   </select>
   		</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Month and Year of Passing&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor" nowrap="nowrap">
    	<select class="workExpField" name="monthNameHiger" id="monthNameHiger3">
    		<option value="">--Select--</option>
    		<option value="1">Jan</option>
    		<option value="2">Feb</option>
    		<option value="3">Mar</option>
    		<option value="4">April</option>
    		<option value="5">May</option>
    		<option value="6">June</option>
    		<option value="7">July</option>
    		<option value="8">Aug</option>
    		<option value="9">Sept</option>
    		<option value="10">Oct</option>
    		<option value="11">Nov</option>
    		<option value="12">Dec</option>
    	</select>
    	<select name="EQyearOfJoinMHiger" id="EQyearOfJoinMHiger3" class="workExpField">
		<option value="">--Select--</option>
			<%
		    try
			{
		    	String EQyearHigher11= "SELECT * FROM years_list";			        
			  	st = con.createStatement();
				rs= st.executeQuery(EQyearHigher11);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("year_n")%>"><%=rs.getString("year_n") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}	
			%>
	   </select>
    	</td>
    </tr>
   <tr>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Score %</td>
   		<td class="allBackColor"><input type="text" name="ScoreEQHiger" id="ScoreEQHiger3" style="width: 100px;"  onkeypress="return blockNonNumbers(this, event, true, false);" onkeyup="extractNumber(this,2,false);" onblur="extractNumber(this,2,false);" oncopy="return false" onpaste="return false" oncut="return false" maxlength="5"/> %</td>
    	<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Course Appraisal&nbsp;<span style="color: red;">*</span></td>
    	<td class="allBackColor">
    		<select name="CourseEQHiger" id="CourseEQHiger3" class="inputFieldResize">
    			<option value=""> --select-- </option>
    		<%
		    try
    		{
		    	String EQyearApprHigher11= "SELECT courseAppraisalId, courseAppraisalName FROM mstcourseappraisal";			        
			  	st= con.createStatement();
				rs = st.executeQuery(EQyearApprHigher11);
				while(rs.next())
				{			        
				%>					
					<option value="<%=rs.getString("courseAppraisalId")%>"><%=rs.getString("courseAppraisalName") %></option>
				<%
				}
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
    		</select>
    	</td>
    </tr>
   	</table>
   	</div>
   	
   	<!-- 5555555 -->

   	
<div align="right" style="padding-top: 10px; padding-right:175px; font-size:13px; font-family:Verdana, Arial, Helvetica, sans-serif; "><b><label id="hideAddMoreQualification"> <a onClick="dispalyHigherQualification()" style="color: FF5500;">Add More Qualification</a></label></b></div>
   	
 <table border="0" cellpadding="6" cellspacing="6" class="tPersonal">
    	<tr>
			<td colspan="4" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; ">References</b></td>
    	</tr> 
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Ref. Name -1 <span style="color: red;">*</span></td>
    		<td class="allBackColor" style="width: 238px;"><input type="text" name="refName1" id="refName1" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Ref. Name -2 <span style="color: red;">*</span></td>
    		<td class="allBackColor"><input type="text" name="refName2" id="refName2" class="inputFieldResize" onkeypress="return AllowAlphabet(event);" oncopy="return false" onpaste="return false" oncut="return false" /></td>
    		
    	</tr>
    	
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address -1 <span style="color: red;">*</span></td>    		
    		<td class="allBackColor">
    			<textarea name="Address1" id="Address1" style="resize:none;" oncopy="return false" onpaste="return false" oncut="return false" /></textarea>
    		</td>
    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Address -2 <span style="color: red;">*</span></td>    		
    		<td class="allBackColor">
    			<textarea name="Address2" id="Address2"  style="resize:none;" oncopy="return false" onpaste="return false" oncut="return false" /></textarea>
    		</td>
    	</tr>
    	<tr>
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Phone -1 <span style="color: red;">*</span></td>    		
    		<td class="allBackColor">
    			<input type="text" name="Phone1" id="Phone1" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="12" oncopy="return false" onpaste="return false" oncut="return false" />
    		</td>
    		
    		<td class="allBackColor" style="background-color: #d8d8d8;width: 150px;">Phone -2 <span style="color: red;">*</span></td>    		
    		<td class="allBackColor">
    			<input type="text" name="Phone2" id="Phone2" class="inputFieldResize" onKeyPress="return isNumberKey(event);" maxlength="12" oncopy="return false" onpaste="return false" oncut="return false" />
    		</td>
    	</tr>
    </table>
  <table border="0" cellpadding="6" cellspacing="6" class="tPersonal">
	 	<tr>
			<td colspan="4" align="left" valign="middle"><b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; ">Declaration</b></td>
    	</tr>    	
    	
    	<tr >
    		<td class="allBackColor">
    			<input type="checkbox" name="Dec_1" value="Y" id="Dec_1"/>
    			This is to certify that I have not been convicted by any court of law for any criminal Offense . I do not willfully indulge drug abuse. <span style="color: red;">*</span>  
    		</td>
    	</tr>
    	<tr class="allBackColor">
    		<td>
    			<input type="checkbox" name="Dec_2" value="Y" id="Dec_2"/>
    			All information furnished above me is correct in all aspects, and i take responsibility for the authenticity of the same. <span style="color: red;">*</span>
    		</td>
    	</tr>
    	<tr class="allBackColor">
    		<td>
    			<input type="checkbox" name="Dec_3" value="Y" id="Dec_3"/>
    			I agree to participate in any Background verification Process as per the guidelines of the organization any time during my career in the organization. <span style="color: red;">*</span> 
    		</td>
    	</tr>
    	<tr class="allBackColor">
    		<td>
    			<input type="checkbox" name="Dec_4" value="Y" id="Dec_4"/>
    			I agree to participate in my Drug Test as per the guidelines of the organization any time during my career in the organization. <span style="color: red;">*</span>
    		</td>
    	</tr>
    	
    
    </table>
    
    <table border="0" cellpadding="6" cellspacing="6" class="tPersonal">
	 	<tr>
			<td colspan="4" align="left" valign="middle">
				<b style="font-size:12px; font-family:Verdana, Arial, Helvetica, sans-serif; ">Feedback</b>
			</td>
    	</tr>    	
  
    	<tr> 
    		<td colspan="3" class="allBackColor">
    		<span id="sln1">1</span>.&nbsp;How did you come to know about 247 Customer? <span style="color: red;">*</span>   		
    		</td>
    		
    		<td class="allBackColor">
    			<textarea id="feed_txtarea1" oncut="return false" onpaste="return false" oncopy="return false" style="resize:none; width: 250px; height: 35px;" name="feed_txtarea1"></textarea>
    		</td>    		
    	</tr>
    	
     	<tr> 
    		<td colspan="3" class="allBackColor">
    		<span id="sln2">2</span>.&nbsp;Where did you get interviewed <span style="color: red;">*</span>    		
    		</td>
    		
    		<td class="allBackColor">
    			<textarea id="feed_txtarea2" oncut="return false" onpaste="return false" oncopy="return false" style="resize:none; width: 250px; height: 35px;" name="feed_txtarea2"></textarea>
    		</td>    		
    	</tr>
    	
    	<tr> 
    		<td colspan="3" class="allBackColor">
    		<span id="sln3">3</span>.&nbsp;Are you referred by a consultant/vendor? <span style="color: red;">*</span>   		
    		</td>
    		
    		<td class="allBackColor" style="height: 35px;">
    			<input type="radio" id="feed_radio1" name="feed_radio1" value="Yes" align="middle" onClick="feedBack_ConsultY(this.value);"/> Yes
    			<input type="radio" id="feed_radio1" name="feed_radio1" value="No" align="middle" onClick="feedBack_ConsultN(this.value);"/> No
    		</td>    		
    	</tr>
    	<tr> 
    		<td colspan="3" class="allBackColor">
    		<span id="sln4">4</span>.&nbsp;How would you rate the Look and Feel of the Office Campus? <span style="color: red;">*</span>  		
    		</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="offCampus" name="offCampus" style="width: 250px;">
 					<option value=""> --Select-- </option>
 					<%
 						System.out.println(" >>>>>>>>>>>>>>>   \t <<<<<<<<<<<<<<<");	
	 					String date = "";
 						String feedQuery = "SELECT NOW() AS date";
						System.out.println("feedQuery \t ||| "+feedQuery);
						Statement stFeed = con.createStatement();
						ResultSet rsFeed = stFeed.executeQuery(feedQuery);
						if(rsFeed.next())
						{
							date = rsFeed.getString("date");
						}

 					
 						String offCampus = "SELECT Feedback_Consult_Id, Feedback_Consult_Name  FROM feedback_consultant WHERE Is_Active = 1";
	 					Statement stmtFeed = null;
	 					try
	 					{
	 						stmtFeed = con.createStatement();
	 						ResultSet rsfeed1 = stmtFeed.executeQuery(offCampus);
		 					while(rsfeed1.next())
		 					{
	 					%>
								<option value="<%=rsfeed1.getString("Feedback_Consult_Id")%>"><%=rsfeed1.getString("Feedback_Consult_Name")%></option> 					
	 					<%
		 					}
		 					rsfeed1.close();
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
 					%>
 				</select>
     		</td>    		
    	</tr>
    	
    	<tr id="consID" style="display: none;"> 
    		<td colspan="3" class="allBackColor">
    		<span id="sln5"></span>.&nbsp;How was the approach of the consultant towards you in general? <span style="color: red;">*</span> 		
    		</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="consult_towards" name="consult_towards" style="width: 250px;">
 					<option value=""> --Select-- </option>	
					<%
					
 					try
 					{
 						stmtFeed = con.createStatement();
 						ResultSet rsfeed2 = stmtFeed.executeQuery(offCampus);
	 					while(rsfeed2.next())
	 					{
 					%>
							<option value="<%=rsfeed2.getString("Feedback_Consult_Id")%>"><%=rsfeed2.getString("Feedback_Consult_Name")%></option> 					
 					<%
	 					}
	 					rsfeed2.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}

					%>
				</select>
     		</td>    		
    	</tr>
    	
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln6">5</span>.&nbsp;Was the Recruiter Polite and Friendly at all times? <span style="color: red;">*</span>
    		</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="rec_Polite" name="rec_Polite" style="width: 250px;">
 					<option value=""> --Select-- </option>
 					<%
 					try
 					{
 						stmtFeed = con.createStatement();
 						ResultSet rsfeed3 = stmtFeed.executeQuery(offCampus);
	 					while(rsfeed3.next())
	 					{
 					%>
							<option value="<%=rsfeed3.getString("Feedback_Consult_Id")%>"><%=rsfeed3.getString("Feedback_Consult_Name")%></option> 					
 					<%
	 					}
	 					rsfeed3.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}

 					%>	
 				</select>
     		</td>    		
    	</tr>
    	
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln7">6</span>.&nbsp;How long did you wait for your 1st round with 247 recruiter? <span style="color: red;">*</span>
    		</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="rec_247" name="rec_247" style="width: 250px;">
 					<option value=""> --Select-- </option>	
 					<%
 					try
 					{
 						String mins_rec = "SELECT Feedback_mints_id, Feedback_mints_value  FROM feedback_mints WHERE Is_Active = 1";
 						stmtFeed = con.createStatement();
 						ResultSet rsfeed4 = stmtFeed.executeQuery(mins_rec);
	 					while(rsfeed4.next())
	 					{
 					%>
							<option value="<%=rsfeed4.getString("Feedback_mints_id")%>"><%=rsfeed4.getString("Feedback_mints_value")%></option> 					
 					<%
	 					}
	 					rsfeed4.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}

 					%>	

 				</select>
     		</td>    		
    	</tr>
    	
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln8">7</span>.&nbsp;What was the total time taken for the entire interview process? <span style="color: red;">*</span>
    		</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="int_process" name="int_process" style="width: 250px;">
 					<option value=""> --Select-- </option>	
 					<%
 					try
 					{
 						String hours_rec = "SELECT Feedback_hours_id, Feedback_hours_value  FROM feedback_hours WHERE Is_Active = 1";
 						stmtFeed = con.createStatement();
 						ResultSet rsfeed5 = stmtFeed.executeQuery(hours_rec);
	 					while(rsfeed5.next())
	 					{
 					%>
							<option value="<%=rsfeed5.getString("Feedback_hours_id")%>"><%=rsfeed5.getString("Feedback_hours_value")%></option> 					
 					<%
	 					}
	 					rsfeed5.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
 					%>	

 				</select>
     		</td>    		
    	</tr>
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln9">8</span>.&nbsp;How  would  you rate your interview process with Voice & Accent Expert? <span style="color: red;">*</span>
   			</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="voice_acent" name="voice_acent" style="width: 250px;">
 					<option value=""> --Select-- </option>	
 					<%
 					try
 					{
 						stmtFeed = con.createStatement();
 						ResultSet rsfeed6 = stmtFeed.executeQuery(offCampus);
	 					while(rsfeed6.next())
	 					{
 					%>
							<option value="<%=rsfeed6.getString("Feedback_Consult_Id")%>"><%=rsfeed6.getString("Feedback_Consult_Name")%></option> 					
 					<%
	 					}
	 					rsfeed6.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}

 					%>	
 				
 				</select>
     		</td>    		
    	</tr>
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln10">9</span>.&nbsp;How  would  you rate your interview process with Recruitment? <span style="color: red;">*</span>
   			</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="rec_process" name="rec_process" style="width: 250px;">
 					<option value=""> --Select-- </option>	
 					<%
 					try
 					{
 						stmtFeed = con.createStatement();
 						ResultSet rsfeed7 = stmtFeed.executeQuery(offCampus);
	 					while(rsfeed7.next())
	 					{
 					%>
							<option value="<%=rsfeed7.getString("Feedback_Consult_Id")%>"><%=rsfeed7.getString("Feedback_Consult_Name")%></option> 					
 					<%
	 					}
	 					rsfeed7.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}

 					%>	
 				
 				</select>
     		</td>    		
    	</tr>
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln11">10</span>.&nbsp;How  would  you rate your interview process with Operations <span style="color: red;">*</span>
   			</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<select id="ops_process" name="ops_process" style="width: 250px;">
 					<option value=""> --Select-- </option>	
 					<%
 					try
 					{
 						stmtFeed = con.createStatement();
 						ResultSet rsfeed8 = stmtFeed.executeQuery(offCampus);
	 					while(rsfeed8.next())
	 					{
 					%>
							<option value="<%=rsfeed8.getString("Feedback_Consult_Id")%>"><%=rsfeed8.getString("Feedback_Consult_Name")%></option> 					
 					<%
	 					}
	 					rsfeed8.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}

 					%>	
 				</select>
     		</td>    		
    	</tr>
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln12">11</span>.&nbsp;Will you refer your friends to 247 <span style="color: red;">*</span>
  			</td>
    		
    		<td class="allBackColor" style="height: 35px;">
    			<input type="radio" id="feed_247" name="feed_247" value="Yes" align="middle"/> Yes
    			<input type="radio" id="feed_247" name="feed_247" value="No" align="middle"/> No
     		</td>    		
    	</tr>
    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln13">12</span>.&nbsp;In which areas do you feel we could improve? <span style="color: red;">*</span>
  			</td>
    		
    		<td class="allBackColor" style="height: 35px;">
 				<textarea id="feed_txtarea3" oncut="return false" onpaste="return false" oncopy="return false" style="resize:none; width: 250px; height: 35px;" name="feed_txtarea3"></textarea>
     		</td>    		
    	</tr>

    	<tr> 
    		<td colspan="3" class="allBackColor">
			<span id="sln14">13</span>.&nbsp;In which areas do you feel we could improve? <span style="color: red;">*</span>
  			</td>
    		
    		<td class="allBackColor" style="height: 35px;">
				<input type="hidden" name="dateinerted_finalReg" id="dateinerted_finalReg" value="<%=date%>"/>
				<textarea id="feed_txtarea4" oncut="return false" onpaste="return false" oncopy="return false" style="resize:none; width: 250px; height: 35px;" name="feed_txtarea4"></textarea>     		
			
			</td>    		
    	</tr>

 </table>
    
     <table align="center">
    	<tr id="processSubmit">
    		<td>
    			<input type="Submit" class="buttonSmall" name="compliteRegister" id="compliteRegister" value="Submit" onClick="return chkRegistrationValidation(this.form);"/>
    		</td>
    	</tr>
    	<tr id="processing" style="display:none;">
    		<td>
    			<b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" colspan="2">Processing, please wait...</font></b>
    		</td>
    	</tr>
    </table>
    </form>
</div>
</div>
	<br/>
		<!-- ############################################ -->    
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	    <tr class="footerBackColor">
	        <td align="left" valign="middle" style="background-color:#666666; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
	    </tr>
	</table>
 <%
  }
	catch(Exception e)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
	finally
	{
		ConnectionDAO.closeConnection(con,st,rs);
	}
 %>
  </body>
</html>