<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.sql.PreparedStatement,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.sql.ResultSet" pageEncoding="utf-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@ include file="GlobalDeclare.jsp"%>
<%
	String USER_Name = (String) session.getAttribute("USER_Name");
	System.out.println("Admin_Add_Right_Page:::USER_Name" + USER_Name);
	String EmpUserId = (String) request.getParameter("EmpUserId");
	if (EmpUserId == null)
	 {
		EmpUserId = "";
	 }
	String Forward = ">>";
	String Backward = "<<";
	String USER_ID = (String)session.getAttribute("USER_ID");
	System.out.println("USER_ID::"+USER_ID);
	System.out.println("EmpUserId:::" + EmpUserId);
	session.setAttribute("EmpUserId", EmpUserId);
	String IsSAdmin = ((String) session.getAttribute("IsSAdmin")).trim();
	if (IsSAdmin == null) {
		response.sendRedirect(request.getContextPath()+ "/247Recruit/jsp/SessionTimeout.jsp");
	}
	session.setAttribute("IsSAdmin", IsSAdmin);
	System.out.println("IsSAdmin in home page::::" + IsSAdmin);
	int USER_AUTOID = (Integer) session.getAttribute("USER_AUTOID");
	if (USER_AUTOID == 0)
	 {
		response.sendRedirect(request.getContextPath()+ "/247Recruit/jsp/SessionTimeout.jsp");
	}
	System.out.println("USER_AUTOID home page::::" + USER_AUTOID);
	String User_Type_Id = ((String) session.getAttribute("User_Type_Id")).trim();
	if (User_Type_Id == null)
	 {
		response.sendRedirect(request.getContextPath()+ "/247Recruit/jsp/SessionTimeout.jsp");
	 }
	System.out.println("User_Type_Id::::" + User_Type_Id);
	Connection connection = null;
	boolean User_AllPrgmsAccess = false;
	int User_ProgramCount = 0;
	try
	{
		connection = ConnectDatabase.getConnection();
		if (User_Type_Id.equalsIgnoreCase("3"))
		 {
			String QueryUserAllPrgms = "SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ USER_AUTOID + "' AND Program_Id = 0";
			System.out.println("QueryUserAllPrgms::::::" + QueryUserAllPrgms);
			Statement stmtsprogs = connection.createStatement();
			ResultSet rssprogs = stmtsprogs.executeQuery(QueryUserAllPrgms);
			User_AllPrgmsAccess = rssprogs.next();
			rssprogs.close();
			stmtsprogs.close();
			
			String QueryUserPrgmsCount = "SELECT count(Program_id) as count FROM user_program_mapping WHERE User_id = '"+ USER_AUTOID + "'";
			System.out.println("QueryUserPrgmsCount::::::" + QueryUserPrgmsCount);
			stmtsprogs = connection.createStatement();
			rssprogs = stmtsprogs.executeQuery(QueryUserPrgmsCount);
			if(rssprogs.next())
			{
				User_ProgramCount = rssprogs.getInt("count");
			}
			System.out.println("User_ProgramCount::::::" + User_ProgramCount);
			System.out.println("User_AllPrgmsAccess::::::" + User_AllPrgmsAccess);
			rssprogs.close();
			stmtsprogs.close();
		}
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
%>

<html>
	<head>
		<title>[24]7 SPRINGBOARD</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<%=recruitPath%>css/Recruiter.css">
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/247Recruit/css/Common.css">

		<script type="text/javascript">
    function chkBoxCHKRec(val)
     {
     	var parentChkboxRecCHK = document.getElementById("UUTRecEdit"+val).checked;
	    var chdRecCount = document.getElementById("CountValue"+val).value;
	     if(parentChkboxRecCHK  == false)
		     {
			   for(var i = 1; i < chdRecCount ; i++ )
			     {
			     	document.getElementById("UUTRecEdit"+val+"Chd"+i).checked = false;
			     	document.getElementById("UUTRecEdit"+val+"Chd"+i).disabled = true;
			    }
			     
			 }
			 if(parentChkboxRecCHK  == true)
		     {
			     for(var j =1; j < chdRecCount ; j++ )
			     {
			     	var childChkboxCHK = document.getElementById("UUTRecTF"+val+"Chd"+j).value;
			     	document.getElementById("UUTRecEdit"+val+"Chd"+j).disabled = false;
			     	if(childChkboxCHK == "true")
			     	{
			     	document.getElementById("UUTRecEdit"+val+"Chd"+j).checked = true;
			     	}
			     }
			}
	   }
	   function chkBoxCHKRecAdd(val)
     	{
     		var parentChkboxRecAdd = document.getElementById("UUTADDRec"+val).checked;
     		var chdRecCountAdd = document.getElementById("RecCountValueAdduser"+val).value;
	    	if(parentChkboxRecAdd  == false)
			     {
				   for(var i = 1; i < chdRecCountAdd ; i++ )
				     {
				     	
				     	document.getElementById("UUTADDRec"+val+"Chd"+i).disabled = true;
				    }
				 }
				 if(parentChkboxRecAdd  == true)
			     {
				     for(var j =1; j < chdRecCountAdd ; j++ )
				     {
				     	document.getElementById("UUTADDRec"+val+"Chd"+j).disabled = false;
				     }
				}
	   	}
     function chkBoxCHKLND(val)
     {
     	var parentChkboxLNDCHK = document.getElementById("UUTLNDEdit"+val).checked;
	    var chdLNDCount = document.getElementById("LNDCountValue"+val).value;
	     if(parentChkboxLNDCHK  == false)
		     {
			   for(var i = 1; i < chdLNDCount ; i++ )
			     {
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+i).checked = false;
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+i).disabled = true;
			    }
			     
			 }
			 if(parentChkboxLNDCHK  == true)
		     {
			     for(var j =1; j < chdLNDCount ; j++ )
			     {
			     	var childChkboxCHK = document.getElementById("UUTLNDTF"+val+"Chd"+j).value;
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+j).disabled = false;
			     	if(childChkboxCHK == "true")
			     	{
			     	document.getElementById("UUTLNDEdit"+val+"Chd"+j).checked = true;
			     	}
			     }
			}
	   }
	   function chkBoxCHKLNDAdd(val)
      {
     	var parentChkboxLNDAdd = document.getElementById("UUTADDLND"+val).checked;
	    var chdLNDCountAdd = document.getElementById("LNDCountValueAdduser"+val).value;
	     if(parentChkboxLNDAdd  == false)
		     {
			   for(var i = 1; i < chdLNDCountAdd ; i++ )
			     {
			     	document.getElementById("UUTADDLND"+val+"Chd"+i).disabled = true;
			     }
			 }
			 if(parentChkboxLNDAdd  == true)
		     {
			     for(var j =1; j < chdLNDCountAdd ; j++ )
			     {
			     	document.getElementById("UUTADDLND"+val+"Chd"+j).disabled = false;
			     }
			}
	   }
	   function chkBoxCHKHROps(val)
       {
     	var parentChkboxHROpsCHK = document.getElementById("UUTHROpsEdit"+val).checked;
	    var chdHROpsCount = document.getElementById("CountValue_HRops"+val).value;
	     if(parentChkboxHROpsCHK  == false)
		     {
			   for(var i = 1; i < chdHROpsCount ; i++ )
			     {
			     	document.getElementById("UUTHROpsEdit"+val+"Chd"+i).checked = false;
			     	document.getElementById("UUTHROpsEdit"+val+"Chd"+i).disabled = true;
			    }
			     
			 }
			 if(parentChkboxHROpsCHK  == true)
		     {
			     for(var j =1; j < chdHROpsCount ; j++ )
			     {
			     	var childChkboxCHK = document.getElementById("UUTHROpsTF"+val+"Chd"+j).value;
			     	document.getElementById("UUTHROpsEdit"+val+"Chd"+j).disabled = false;
			     	if(childChkboxCHK == "true")
			     	{
			     	document.getElementById("UUTHROpsEdit"+val+"Chd"+j).checked = true;
			     	}
			     }
			}
	   }
	    function chkBoxCHKHROpsAdd(val)
      {
     	var parentChkboxHRopsAdd = document.getElementById("UUTADDHROps"+val).checked;
     	var chdHRopsCountAdd = document.getElementById("HROpsCountValueAdduser"+val).value;
	     if(parentChkboxHRopsAdd  == false)
		     {
			   for(var i = 1; i < chdHRopsCountAdd ; i++ )
			     {
			     	document.getElementById("UUTADDHROps"+val+"Chd"+i).disabled = true;
			     }
			 }
			 if(parentChkboxHRopsAdd  == true)
		     {
			     for(var j =1; j < chdHRopsCountAdd ; j++ )
			     {
			     	document.getElementById("UUTADDHROps"+val+"Chd"+j).disabled = false;
			     }
			}
	   }
	   function chkBoxCHKViewer(val)
       {
     	var parentChkboxViewerCHK = document.getElementById("UUTViewerEdit"+val).checked;
	    var chdViewerCount = document.getElementById("CountValue_Viewer"+val).value;
	     if(parentChkboxViewerCHK  == false)
		     {
			   for(var i = 1; i < chdViewerCount ; i++ )
			     {
			     	document.getElementById("UUTViewerEdit"+val+"Chd"+i).checked = false;
			     	document.getElementById("UUTViewerEdit"+val+"Chd"+i).disabled = true;
			    }
			     
			 }
			 if(parentChkboxViewerCHK  == true)
		     {
			     for(var j =1; j < chdViewerCount ; j++ )
			     {
			     	var childChkboxCHK = document.getElementById("UUTViewerTF"+val+"Chd"+j).value;
			     	document.getElementById("UUTViewerEdit"+val+"Chd"+j).disabled = false;
			     	if(childChkboxCHK == "true")
			     	{
			     	document.getElementById("UUTViewerEdit"+val+"Chd"+j).checked = true;
			     	}
			     }
			}
	   }
	    function chkBoxCHKViewerAdd(val)
      {
     	var parentChkboxViewerAdd = document.getElementById("UUTADDViewer"+val).checked;
     	var chdViewerCountAdd = document.getElementById("ViewerCountValueAdduser"+val).value;
	     if(parentChkboxViewerAdd  == false)
		     {
			   for(var i = 1; i < chdViewerCountAdd ; i++ )
			     {
			     	document.getElementById("UUTADDViewer"+val+"Chd"+i).disabled = true;
			     }
			 }
			 if(parentChkboxViewerAdd  == true)
		     {
			     for(var j =1; j < chdViewerCountAdd ; j++ )
			     {
			     	document.getElementById("UUTADDViewer"+val+"Chd"+j).disabled = false;
			     }
			}
	   }
	    function adminChkProgramsAdd()
	   {
	   		var hrOpsPrgmsAddCHK = document.getElementById("accessToProgramAdd").checked;
		   	 if(hrOpsPrgmsAddCHK  == true)
		   	 {
		   	 		document.getElementById("FromLeftRight").disabled = true;
					document.getElementById("FromRightLeft").disabled = true;
					document.getElementById("FromLB").disabled = true;
					document.getElementById("ToLB").disabled = true;
		   	 }
		   	 if(hrOpsPrgmsAddCHK  == false)
		   	 {
					document.getElementById("FromLeftRight").disabled = false;
					document.getElementById("FromRightLeft").disabled = false;
					document.getElementById("FromLB").disabled = false;
					document.getElementById("ToLB").disabled = false;
		   	 }
	   }
	   
	   function adminChkPrograms()
	   {
	   		var hrOpsPrgmsCHK = document.getElementById("accessToProgram").checked;
		   	 if(hrOpsPrgmsCHK  == true)
		   	 {
		   	 		document.getElementById("FromLeft2Right").disabled = true;
					document.getElementById("FromRight2Left").disabled = true;
					document.getElementById("FromLB1").disabled = true;
					document.getElementById("ToLB1").disabled = true;
		   	 }
		   	 if(hrOpsPrgmsCHK  == false)
		   	 {
					document.getElementById("FromLeft2Right").disabled = false;
					document.getElementById("FromRight2Left").disabled = false;
					document.getElementById("FromLB1").disabled = false;
					document.getElementById("ToLB1").disabled = false;
		   	 }
	   }
	   
	   function chkBoxCHKOps(val)
       {
       	var parentChkboxOpsCHK = document.getElementById("UUTOpsEdit"+val).checked;
	    var chdOpsCount = document.getElementById("CountValue_Ops"+val).value;
	     if(parentChkboxOpsCHK  == false)
		     {
				for(var i = 1; i < chdOpsCount ; i++ )
			     {
			     	document.getElementById("UUTOpsEdit"+val+"Chd"+i).checked = false;
			     	document.getElementById("UUTOpsEdit"+val+"Chd"+i).disabled = true;
			    }
			     
			 }
			 if(parentChkboxOpsCHK  == true)
		     {
			    for(var j =1; j < chdOpsCount ; j++ )
			     {
			     	var childChkboxCHK = document.getElementById("UUTOpsTF"+val+"Chd"+j).value;
			     	document.getElementById("UUTOpsEdit"+val+"Chd"+j).disabled = false;
			     	if(childChkboxCHK == "true")
			     	{
			     	document.getElementById("UUTOpsEdit"+val+"Chd"+j).checked = true;
			     	}
			     }
			}
       }
        function chkBoxCHKOpsAdd(val)
      {
     	var parentChkboxOpsAdd = document.getElementById("UUTADDOps"+val).checked;
     	var chdOpsCountAdd = document.getElementById("OpsCountValueAdduser"+val).value;
	     if(parentChkboxOpsAdd  == false)
		     {
			   for(var i = 1; i < chdOpsCountAdd ; i++ )
			     {
			     	document.getElementById("UUTADDOps"+val+"Chd"+i).disabled = true;
			     }
			 }
			 if(parentChkboxOpsAdd  == true)
		     {
			     for(var j =1; j < chdOpsCountAdd ; j++ )
			     {
			     	document.getElementById("UUTADDOps"+val+"Chd"+j).disabled = false;
			     }
			}
	   }
     </script>

		<!-- End of script for List box adding -->
		<script language="javascript"> 
			function selectPrograms(tbTo)
			{ 
				if(AdminForm.UserTypesIdAddUser.value == 3) 
				{ 
					for(var i = 0; i < tbTo.options.length; i++) 
					{
						tbTo.options[i].selected = true;
					}
				}  
			}
			function selectProgramsedit(tbTo)
			{ 
				var UserTypeIdSltd;
				if(document.getElementById('IsSAdmin').value == "Yes")
			 		{
			 			UserTypeIdSltd = AdminForm.UserTypesId.selectedIndex;
			 		}
			 		else
			 		{
			 			UserTypeIdSltd =  document.getElementById('UserTypeIdInitial').value;
			 		}
				if(UserTypeIdSltd == 3) 
				{ 
					for(var i = 0; i < tbTo.options.length; i++) 
					{
						//alert(tbTo.options[i].selected);
						tbTo.options[i].selected = true;
					}
				}  
			}
			function move(tbFrom, tbTo) 
			{
			 var arrFrom = new Array(); 
			 var arrTo = new Array(); 
			 var arrLU = new Array();
			 var i;
				 for (i = 0; i < tbTo.options.length; i++) 
				 {
					  arrLU[tbTo.options[i].text] = tbTo.options[i].value;
					  arrTo[i] = tbTo.options[i].text;
				 }
			 var fLength = 0;
			 var tLength = arrTo.length;
				 for(i = 0; i < tbFrom.options.length; i++) 
				 {
				  arrLU[tbFrom.options[i].text] = tbFrom.options[i].value;
					  if (tbFrom.options[i].selected && tbFrom.options[i].value != "") 
					  {
						   arrTo[tLength] = tbFrom.options[i].text;
						   tLength++;
					  }
					  else 
					  {
						   arrFrom[fLength] = tbFrom.options[i].text;
						   fLength++;
					  }
				}
			tbFrom.length = 0;
			tbTo.length = 0;
			var ii;
				for(ii = 0; ii < arrFrom.length; ii++) 
				{
					  var no = new Option();
					  no.value = arrLU[arrFrom[ii]];
					  no.text = arrFrom[ii];
					  tbFrom[ii] = no;
				}
				for(ii = 0; ii < arrTo.length; ii++) 
				{
					 var no = new Option();
					 no.value = arrLU[arrTo[ii]];
					 no.text = arrTo[ii];
					 tbTo[ii] = no;
				}
			}
	</script>
		<!-- End of script for List box adding -->


		<script type="text/javascript" language="javascript">
    <%
		if(USER_Name==null)
 			{
	%>
		parent.location.href="<%=logoutPage%>";
	<%
		}
	%>
     function CheckValidation()
		{
			var v=document.getElementById("finalreg").value;
				if(document.getElementById("selForProgram").value =='')
				{
					var appStr = 'Please Select The Program!!!';
					alert(appStr);
					document.getElementById('selForProgram').focus();
					return false;	
				}
			elseif(v=="false")
			 {
				 alert("Final Registration is not completed !");
				 return false;
			 }
			document.getElementById('submit').style.display="none";
            document.getElementById("processing").style.display="";
			}
	 </script>
 		 
	<!-- Populating the sub program based on selection of Program  -->
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
		function selectProgramName()
		{
				//alert("programname change!!!!");
				document.getElementById("subprogramname").disabled=false;
				
				getSubProgramNameList();
		}
		function getSubProgramNameList()	
		{	
			//alert("programname change22!!!!");
			var cp=document.getElementById("programname").value;
			//alert(cp);
			
			if (cp != "0")
			{
			    var url="<%=request.getContextPath()%>/247Recruit/jsp/SubProgramList.jsp";
			    
				url=url+"?sid="+Math.random();
				url=url+"&ProgramId="+cp; 
				
			      
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
			 document.getElementById('subprogramname').options.length = 0;	
		     arry[0] = document.createElement('option');  
			 arry[0].text = '- -Select- -';
			 arry[0].value ='';
			 document.getElementById('subprogramname').options[0]= arry[0];	
			}        
		}

		function chargeCodeSelected(request)
		{
			
			 var data = request.responseText;
			 idata=data.split(",");
			 var arry = new Array(idata.length);
		
			 document.getElementById('subprogramname').options.length = 0;	
			 
		     arry[0] = document.createElement('option');  
			 arry[0].text = '- -Select- -';
			 arry[0].value ='';
			 document.getElementById('subprogramname').options[0]= arry[0];	
		
			 for(var i=1;i<idata.length;i++)
			 {
				fenName = idata[i-1].split(":");
			    arry[i] = document.createElement('option');  
		 		arry[i].text = fenName[1];
				arry[i].value =fenName[0];
				document.getElementById('subprogramname').options[i]= arry[i];	
			 }
		}
//End of program Ajax

//Start: Script to populate the Employee List:

		function EmployeeList()
		{
				document.getElementById("EmployeelistDDL").disabled=false;
				getEmployeeNameList();
		}
			function getEmployeeNameList()	
			{	
				var cp=document.getElementById("programname").value;
				var csp=document.getElementById("subprogramname").value;
				
				if (csp != "0")
				{
				    var url="<%=request.getContextPath()%>/247Recruit/jsp/EmployeeList.jsp";
				    
					url=url+"?sid="+Math.random();
					url=url+"&ProgramId="+cp+"&Subprogram="+csp+""; 
					var request = GetXmlHttpObject();
				    if (request==null)
				    {
				 		 alert("Your browser does not support AJAX!");
						 return false;
					}
					request.onreadystatechange = function () 
					{		
						chargeCodeSelectedEmployee(request);
					};
					request.open("POST", url, true);
					request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					request.send(null);
				}
				else
				{
				 var arry = new Array(0);
				 document.getElementById('EmployeelistDDL').options.length = 0;	
			     arry[0] = document.createElement('option');  
				 arry[0].text = '- -Select- -';
				 arry[0].value ='';
				 document.getElementById('EmployeelistDDL').options[0]= arry[0];	
				}        
			}

		function chargeCodeSelectedEmployee(request)
		{
			
			 var data = request.responseText;
			 idata=data.split(",");
			 var arry = new Array(idata.length);
		
			 document.getElementById('EmployeelistDDL').options.length = 0;	
			 
		     arry[0] = document.createElement('option');  
			 arry[0].text = '- -Select- -';
			 arry[0].value ='';
			 document.getElementById('EmployeelistDDL').options[0]= arry[0];	
		
			 for(var i=1;i<idata.length;i++)
			 {
				fenName = idata[i-1].split(":");
			    arry[i] = document.createElement('option');  
		 		arry[i].text = fenName[1];
				arry[i].value =fenName[0];
				document.getElementById('EmployeelistDDL').options[i]= arry[i];	
			 }
		}
//End of script for Employee List

</script>

		<!-- Script for Employee Information -->
		<script type="text/javascript">
		function EmployeeInformation()
		{
			getEmployeeInformation();
		}
		function getEmployeeInformation()
			{
				var EmployeeId=document.getElementById("EmployeelistDDL").value;
				//alert(EmployeeId);
				xmlhttp=GetXmlHttpObject();
				if (xmlhttp==null)
		  		{
			 		alert("Your browser does not support AJAX!");
			 	 	return;
		  		}
				var url="<%=request.getContextPath()%>/247Recruit/jsp/EmployeeInformation.jsp";
				url=url+"?sid="+Math.random();
				url=url+"&EmployeeId="+EmployeeId;
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
				 //var arry = new Array(idata.length);
				 for(var i=0;i<idata.length-1;i++)
				 {
				   
					document.getElementById('employeeid').value= idata[0];
					document.getElementById('employeeLocation').value= idata[1];
					document.getElementById('employeeemailid').value= idata[2];
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

		<!-- Start Java script for Test Fields Blur Data -->
		<script type="text/javascript">
		function ReFocus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmta"; } } function Focus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "nta"; } } function Blur(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmta"; } else { obj.className = "nta"; } } function ReFocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmtr"; } } function FocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "ntr"; } } function BlurR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmtr"; } else { obj.className = "ntr"; } }
		</script>
		
		<style type="text/css">
		.wmta
		 {
			color: gray;
		}
		
		.wmtr 
		{
			color: black;
		}
		
		.nta 
		{
			color: black;
		}
		</style>

		<!-- Java script for Char Validation -->
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

		<script type="text/javascript">
	 function enableOldViewEdit()
	    {
			document.getElementById('editpartButtonDisp').style.display="none";
			document.getElementById('deleteCommentsDISP').style.display="none"; 
			document.getElementById('deletepartButtonDisp').style.display="none";
			document.getElementById('SelectUserType').style.display="none";
			document.getElementById('UserStateRadioDISP').style.display="none";
			document.getElementById('LNDCHKDISP').style.display="none";
			document.getElementById('RECCHKDISP').style.display="none";
			document.getElementById('HROpsCHKDISP').style.display="none";
			document.getElementById('ViewerCHKDISP').style.display="none";
			document.getElementById('OpsCHKDISP').style.display="none";
			document.getElementById('OpsListBoxEdit').style.display="none";
			document.getElementById('OpsListBoxEditDISP').style.display="none";
			document.getElementById('employeeAlertsDISP').style.display="none";
			document.getElementById('AddEditDelete').style.display="";
			document.getElementById('LNDLabelDISP').style.display="";
			document.getElementById('EmployeeIdDISP').style.display="";
			document.getElementById('EmployeeIdValueDISP').style.display="";
			document.getElementById('EmployeeNameDISP').style.display="";
			document.getElementById('userTypeDISP').style.display="";
			document.getElementById('EmployeeNameValueDISP').style.display="";
			document.getElementById('usertypesname').style.display="";
			document.getElementById('LocationDISP').style.display="";
			document.getElementById('emailidDISP').style.display=""; 
			document.getElementById('employeephoneVal').style.display="";
			document.getElementById('EmployeePhoneDISP').style.display="";
			document.getElementById('EmployeeAlertDISP').style.display="";
			document.getElementById('employeeAlertsDISPTXT').style.display="";
			document.getElementById('UserStateDISP').style.display="";
			document.getElementById('UserStateDISPTXT').style.display="";
			document.getElementById('UserAccessDISP').style.display="";
			if(document.getElementById('UserTypeIdInitial').value == 3)
			{
				document.getElementById('OpsPrgmAcssDISP').style.display="";
			}
	 }
	 function enableOldViewDelete()
	 {
		 document.getElementById('AddEditDelete').style.display="";
		 document.getElementById('editpartButtonDisp').style.display="none";
		 document.getElementById('deletepartButtonDisp').style.display="none";
		 document.getElementById('deleteCommentsDISP').style.display="none"; 
		 document.getElementById('deletepartButtonDisp').style.display="none";
	 }
	 function enableOldViewAdd()
	 {
			document.getElementById('addpartButtonDisp').style.display="none";
			document.getElementById('editpartButtonDisp').style.display="none";
			document.getElementById('deletepartButtonDisp').style.display="none";
			document.getElementById('deleteCommentsDISP').style.display="none"; 
			document.getElementById('deletepartButtonDisp').style.display="none";
			document.getElementById('addpartButtonDisp').style.display="none";
			document.getElementById('SelectProgramDISP').style.display="none";
			document.getElementById('SelectProgramDDL').style.display="none";
			document.getElementById('SelectSubPgrmDISP').style.display="none";
			document.getElementById('SelectSubPgrmDDL').style.display="none";
			document.getElementById('EmployeeNameAddDISP').style.display="none";
			document.getElementById('EmployeeIdAddDISP').style.display="none";
			document.getElementById('emailidAdd').style.display="none";
			document.getElementById('employeephoneAdd').style.display="none";
			document.getElementById('EmployeeIdAddValueDISP').style.display="none";
			document.getElementById('locationAdd').style.display="none";
			document.getElementById('usertypesADDUser').style.display="none";
			document.getElementById('SelectUserType').style.display="none";
			document.getElementById('LNDCHKDISPADDUser').style.display="none";
			document.getElementById('RECCHKDISPADDUser').style.display="none";
			document.getElementById('HROpsCHKDISPADDUser').style.display="none";
			document.getElementById('OpsCHKDISPADDUser').style.display="none";
			document.getElementById('ViewerCHKDISPADDUser').style.display="none";
			document.getElementById('EmployeeSelectAlrtsDISP').style.display="none";
			document.getElementById('UserStateSelectDISP').style.display="none";
			document.getElementById('employeeAlertsAdd').style.display="none";
			document.getElementById('UserStateAdd').style.display="none";
			document.getElementById('EmployeeEnterPhoneDISP').style.display="none";
			document.getElementById('AddEditDelete').style.display="";
			document.getElementById('EmployeeIdDISP').style.display="";
			document.getElementById('EmployeeIdValueDISP').style.display="";
			document.getElementById('EmployeeNameDISP').style.display="";
			document.getElementById('userTypeDISP').style.display="";
			document.getElementById('EmployeeNameValueDISP').style.display="";
			document.getElementById('usertypesname').style.display="";
			document.getElementById('LocationDISP').style.display="";
			document.getElementById('emailidDISP').style.display=""; 
			document.getElementById('employeephoneVal').style.display="";
			document.getElementById('EmployeePhoneDISP').style.display="";
			document.getElementById('EmployeeAlertDISP').style.display="";
			document.getElementById('employeeAlertsDISP').style.display="none";
			document.getElementById('employeeAlertsDISPTXT').style.display="";
			document.getElementById('UserStateDISP').style.display="";
			document.getElementById('UserStateDISPTXT').style.display="";
			document.getElementById('UserAccessDISP').style.display="";
			document.getElementById('LNDLabelDISP').style.display="";
			document.getElementById('OpsListBoxAddDISP').style.display="none"; 
			document.getElementById('OpsListBoxAdd').style.display="none"; 
			if(document.getElementById('UserTypeIdInitial').value == 3)
			{
				document.getElementById('OpsPrgmAcssDISP').style.display="";
			}
	 }
	 function deleteuser()
	   {
		 document.getElementById('usertypesname').style.display="none";
		 document.getElementById('deleteCommentsDISP').style.display="";
		 document.getElementById('deletepartButtonDisp').style.display="";
		 document.getElementById('AddEditDelete').style.display="none";
		 document.getElementById('OpsListBoxEditDISP').style.display="none";
		 document.getElementById('OpsListBoxEdit').style.display="none";
		 alert("Are you sure you want to delete this User ??");
	 
	  }
	 function submitdeleteUser()
	  {
		
		var deletecoments = document.getElementById("deleteCommentstxt").value;
		if(deletecoments =='Enter Delete Reason')
			{
			    var appStr = 'Please Enter the reason for deleting the user !';		
				alert(appStr);
				document.getElementById('deleteCommentstxt').focus();
				return false;
			}
		
		else if(deletecoments.trim() == "")
		{
		    var appStr = 'Please Enter the reason for deleting the user !';		
			alert(appStr);
			document.getElementById('deleteCommentstxt').focus();
			return false;
		}
		if(confirm('Are you sure you want Delete the User.Please click "OK" to delete User, else "cancel".'))
		   {
			 
			var deleteComments= document.getElementById('deleteCommentstxt').value; 
			var UserTypeIdInitial = document.getElementById('UserTypeIdInitial').value; 
			var empid = document.getElementById('Empid').value; 
			location.href = "<%=recruitPath%>jsp/Admin_Add_User_UpdateSubmit.jsp?ActionType=3&empid="+empid+"&UserTypeIdInitial="+UserTypeIdInitial+"&deleteComments="+deleteComments;
			document.getElementById('deletepartButtonDisp').style.display = "none";
            document.getElementById("processing").style.display="";  
			return true;
		  }
		else
		  {
			return false;
		 }   
	  }
   
    function edituser()
     {
	  ShowChkBox();
	  if(document.getElementById('IsSAdmin').value == "Yes")
	  {
		  document.getElementById('userTypeDISP').style.display="none";
		  document.getElementById('SelectUserType').style.display="";
		  document.getElementById('usertypesname').style.display="";
	  }
	  document.getElementById('ActionType').value=2;
	  document.getElementById('editpartButtonDisp').style.display="";
	  document.getElementById('AddEditDelete').style.display="none";
	  document.getElementById('LNDLabelDISP').style.display="none";
	  document.getElementById('employeeAlertsDISP').style.display="";
	  document.getElementById('employeeAlertsDISPTXT').style.display="none";
	  document.getElementById('UserStateRadioDISP').style.display="";
	  document.getElementById('UserStateDISPTXT').style.display="none";
	  document.getElementById('OpsListBoxAddDISP').style.display="none"; 
	  document.getElementById('OpsListBoxAdd').style.display="none"; 
    }
  
   function submitEditUser()
    {
     if(AdminForm.UserTypesId.selectedIndex == 0) 
      {
       alert("Please Select the User Type !!");
       return false;
      }
      document.getElementById('editpartButtonDisp').style.display = "none";
  	  document.getElementById("processing").style.display = "";
    } 
  
   function AddUser()
    {
	  document.getElementById('ActionType').value=1;
	  document.getElementById('UserAccessDISP').style.display="none";
	  document.getElementById('LNDLabelDISP').style.display="none";
	  document.getElementById('AddEditDelete').style.display="none";
	  document.getElementById('editpartButtonDisp').style.display="none";
	  document.getElementById('addpartButtonDisp').style.display="";
	  document.getElementById('EmployeeIdDISP').style.display="none";
	  document.getElementById('SelectProgramDISP').style.display="";
	  document.getElementById('EmployeeIdValueDISP').style.display="none";
	  document.getElementById('SelectProgramDDL').style.display="";
	  document.getElementById('EmployeeNameDISP').style.display="none";
	  document.getElementById('userTypeDISP').style.display="none";
	  document.getElementById('SelectSubPgrmDISP').style.display="";
	  document.getElementById('EmployeeNameValueDISP').style.display="none";
	  document.getElementById('SelectSubPgrmDDL').style.display="";
	  document.getElementById('EmployeeNameAddDISP').style.display="";
	  document.getElementById('EmployeeIdAddDISP').style.display="";
	  document.getElementById('usertypesname').style.display="none";
	  document.getElementById('emailidDISP').style.display="none"; 
	  document.getElementById('emailidAdd').style.display="";
	  document.getElementById('employeephoneVal').style.display="none";
	  document.getElementById('employeephoneAdd').style.display="";
	  document.getElementById('EmployeeIdAddValueDISP').style.display="";
	  document.getElementById('LocationDISP').style.display="none";
	  document.getElementById('locationAdd').style.display="";
	  document.getElementById('EmployeePhoneDISP').style.display="none";
	  document.getElementById('EmployeeEnterPhoneDISP').style.display="";
	  document.getElementById('usertypesADDUser').style.display="";
	  document.getElementById('SelectUserType').style.display="";
	  document.getElementById('LNDCHKDISP').style.display="none";
	  document.getElementById('RECCHKDISP').style.display="none";
	  document.getElementById('EmployeeAlertDISP').style.display="none";
	  document.getElementById('UserStateDISP').style.display="none";
	  document.getElementById('EmployeeSelectAlrtsDISP').style.display="";
	  document.getElementById('UserStateSelectDISP').style.display="";
	  document.getElementById('employeeAlertsDISP').style.display="none";
	  document.getElementById('employeeAlertsAdd').style.display="";
	  document.getElementById('UserStateAdd').style.display="";
	  document.getElementById('employeeAlertsDISPTXT').style.display="none";
	  document.getElementById('UserStateDISPTXT').style.display="none";
	  document.getElementById('OpsListBoxEditDISP').style.display="none";
	  document.getElementById('OpsListBoxEdit').style.display="none";
	   if(document.getElementById('UserTypeIdInitial').value == 3)
	  {
	  document.getElementById('OpsPrgmAcssDISP').style.display="none";
	  }
   }
  
   function ValidationAddedUser()
    {
        if(AdminForm.programname.selectedIndex == 0) 
              { 
                alert('Please Select the Program !'); 
                document.getElementById('programname').focus();
                 return false; 
              }	
          
         if(AdminForm.subprogramname.selectedIndex == '') 
              { 
                alert('Please Select the Sub-Program !'); 
                document.getElementById('subprogramname').focus();
                 return false; 
              }  
         if(AdminForm.EmployeelistDDL.selectedIndex == '') 
              { 
                alert('Please Select the Employee !'); 
                document.getElementById('EmployeelistDDL').focus();
                 return false; 
              }       
          if(AdminForm.UserTypesIdAddUser.selectedIndex == 0) 
              { 
                alert( 'Please Select the User Type !'); 
                document.getElementById('UserTypesId').focus();
                 return false; 
              }  
             if(document.getElementById("employeephone").value=='')
			{
				var appStr = 'Please Enter Employee Phone Number !';		
				alert(appStr);
				document.getElementById('employeephone').focus();
				return false;
			}
           
           if ((AdminForm.AlertsRequiredAdd[0].checked == false)&& (AdminForm.AlertsRequiredAdd[1].checked == false))
              {
              alert("Please Check atleast One Field ");
              return false;
           } 
           document.getElementById('addpartButtonDisp').style.display = "none";
           document.getElementById("processing").style.display="";   
      }
 </script>

		<!-- Number Validation Script-->
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
		<script type="text/javascript">
		function ShowChkBox()
		  {
		   var UserTypeIdSltd;
		   document.getElementById('UserAccessDISP').style.display = "";
		   if(document.getElementById('IsSAdmin').value == "Yes")
	  		{
	  			UserTypeIdSltd = AdminForm.UserTypesId.selectedIndex;
	  		}
	  		else
	  		{
	  			UserTypeIdSltd =  document.getElementById('UserTypeIdInitial').value;
	  		}
	  		if(UserTypeIdSltd == 1) 
			     { 
		            document.getElementById('LNDCHKDISP').style.display="none";
		            document.getElementById('OpsListBoxEditDISP').style.display="none";
		            document.getElementById('OpsListBoxEdit').style.display="none";
		            document.getElementById('RECCHKDISP').style.display="";
		            document.getElementById('ViewerCHKDISP').style.display="none"; 
		            document.getElementById('OpsCHKDISP').style.display="none"; 
		            document.getElementById('HROpsCHKDISP').style.display="none";
			      } 
			if(UserTypeIdSltd == 2) 
	              { 
					document.getElementById('RECCHKDISP').style.display="none"; 
					document.getElementById('LNDCHKDISP').style.display=""; 
					document.getElementById('OpsListBoxEditDISP').style.display="none";
					document.getElementById('OpsListBoxEdit').style.display="none";
					document.getElementById('ViewerCHKDISP').style.display="none";
					document.getElementById('OpsCHKDISP').style.display="none"; 
					document.getElementById('HROpsCHKDISP').style.display="none";
	              }
			   
		    if(UserTypeIdSltd == 3) 
	              {
					document.getElementById('OpsCHKDISP').style.display=""; 
					document.getElementById('LNDCHKDISP').style.display="none";
					document.getElementById('RECCHKDISP').style.display="none"; 
						if(document.getElementById('IsSAdmin').value == "Yes")
		  				{
							document.getElementById('OpsListBoxEditDISP').style.display="";
							document.getElementById('OpsListBoxEdit').style.display="";
							if(document.getElementById('IsAllprograms').value == "true")
							{
								document.getElementById("FromLeft2Right").disabled = true;
								document.getElementById("FromRight2Left").disabled = true;
								document.getElementById("FromLB1").disabled = true;
								document.getElementById("ToLB1").disabled = true;
							}
						}
						else if (document.getElementById('IsSAdmin').value == "No" && document.getElementById('IsAllprograms').value == "false")
						{
							document.getElementById('OpsListBoxEditDISP').style.display="";
							document.getElementById('OpsListBoxEdit').style.display="";
						}
					document.getElementById('ViewerCHKDISP').style.display="none";
					document.getElementById('HROpsCHKDISP').style.display="none";
						if(document.getElementById('UserTypeIdInitial').value == 3)
						  {
						  	document.getElementById('OpsPrgmAcssDISP').style.display="none";
						  }
				 }  
		    if(UserTypeIdSltd == 4) 
	             {
		            document.getElementById('LNDCHKDISP').style.display="none";
		            document.getElementById('RECCHKDISP').style.display="none"; 
		            document.getElementById('ViewerCHKDISP').style.display="none";
		            document.getElementById('OpsListBoxEditDISP').style.display="none";
		            document.getElementById('OpsListBoxEdit').style.display="none";
		            document.getElementById('HROpsCHKDISP').style.display="";  
		            document.getElementById('AddEditDelete').style.display="none";
		            document.getElementById('OpsCHKDISP').style.display="none"; 
	            } 
            if(UserTypeIdSltd == 5) 
              	{
	            document.getElementById('LNDCHKDISP').style.display="none";
	            document.getElementById('ViewerCHKDISP').style.display="";  
	            document.getElementById('RECCHKDISP').style.display="none"; 
	            document.getElementById('OpsListBoxEditDISP').style.display="none";
	            document.getElementById('OpsListBoxEdit').style.display="none";
	            document.getElementById('HROpsCHKDISP').style.display="none";  
	            document.getElementById('AddEditDelete').style.display="none";
	            document.getElementById('OpsCHKDISP').style.display="none"; 
            	}      
		   }


    function ShowChkBox1()
      {
        document.getElementById('UserAccessDISP').style.display="";
        var usertypeSelctd = document.getElementById("UserTypesIdAddUser");
        var usertypeSelctdVal = usertypeSelctd.options[usertypeSelctd.selectedIndex].value;
        if(usertypeSelctdVal == 1) 
              { 
		            document.getElementById('RECCHKDISPADDUser').style.display=""; 
		            document.getElementById('LNDCHKDISPADDUser').style.display="none";
		            document.getElementById('OpsCHKDISPADDUser').style.display="none";
		            document.getElementById('HROpsCHKDISPADDUser').style.display="none";
		            document.getElementById('ViewerCHKDISPADDUser').style.display="none";
		            document.getElementById('OpsListBoxAddDISP').style.display="none"; 
		            document.getElementById('OpsListBoxAdd').style.display="none"; 
		            
              } 
	     if(usertypeSelctdVal == 2) 
              { 
	                 document.getElementById('LNDCHKDISPADDUser').style.display="";
		             document.getElementById('RECCHKDISPADDUser').style.display="none"; 
		             document.getElementById('OpsListBoxAddDISP').style.display="none"; 
		             document.getElementById('HROpsCHKDISPADDUser').style.display="none";
		             document.getElementById('OpsCHKDISPADDUser').style.display="none";
		             document.getElementById('OpsListBoxAdd').style.display="none"; 
		             document.getElementById('ViewerCHKDISPADDUser').style.display="none";
              }
	     
	     if(usertypeSelctdVal == 3) 
		     {
					document.getElementById('UserAccessDISP').style.display=""; 
					document.getElementById('OpsCHKDISPADDUser').style.display="";
					document.getElementById('HROpsCHKDISPADDUser').style.display="none";
					document.getElementById('OpsListBoxAddDISP').style.display=""; 
					document.getElementById('OpsListBoxAdd').style.display=""; 
					document.getElementById('ViewerCHKDISPADDUser').style.display="none";
					document.getElementById('LNDCHKDISPADDUser').style.display="none";
					document.getElementById('RECCHKDISPADDUser').style.display="none";
			} 
		 if(usertypeSelctdVal == 4) 
			 { 
					document.getElementById('LNDCHKDISPADDUser').style.display="none";
					document.getElementById('RECCHKDISPADDUser').style.display="none"; 
					document.getElementById('OpsCHKDISPADDUser').style.display="none";
					document.getElementById('HROpsCHKDISPADDUser').style.display=""; 
					document.getElementById('OpsListBoxAddDISP').style.display="none"; 
					document.getElementById('OpsListBoxAdd').style.display="none"; 
					document.getElementById('ViewerCHKDISPADDUser').style.display="none";
             } 
             if(usertypeSelctdVal == 5) 
			 { 
					document.getElementById('LNDCHKDISPADDUser').style.display="none";
					document.getElementById('RECCHKDISPADDUser').style.display="none"; 
					document.getElementById('HROpsCHKDISPADDUser').style.display="none";
					document.getElementById('OpsCHKDISPADDUser').style.display="none";
					document.getElementById('ViewerCHKDISPADDUser').style.display=""; 
					document.getElementById('OpsListBoxAddDISP').style.display="none"; 
					document.getElementById('OpsListBoxAdd').style.display="none"; 
             }         
     
    }
    </script>
	</head>
	<body>
		<form action="<%=recruitPath%>jsp/Admin_Add_User_UpdateSubmit.jsp" name="AdminForm" id="AdminForm" method="post" accept-charset="utf-8">
			<%
    	String query = "select * from user_master where Emp_ID = '"+ EmpUserId + "'";
    	connection = ConnectDatabase.getConnection();
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(query);
    	String EmpName = null;
    	String EmpId = null;
    	String EmpEmail = null;
    	String EmpPhone = null;
    	String LocationName = null;
    	String UserTypename = null;
    	String UserTypeId = null;
    	String IsActive = null;
    	int SendAlerts = 0;
    	int EmpUserAutoId = 0;
    	int location = 0;
    	boolean allprgmsState = false;
    	if (rs.next())
    	 {
    		EmpUserAutoId = rs.getInt("User_Id");
    		session.setAttribute("EmpUserAutoId", EmpUserAutoId);
    		EmpName = rs.getString("Emp_Name");
    		System.out.println("Emp_Name" + EmpName);
    		EmpId = rs.getString("Emp_ID");
    		System.out.println("EmpId" + EmpId);
    		location = rs.getInt("Centre_Id");
    		EmpEmail = rs.getString("Emp_email");
    		SendAlerts = rs.getInt("SendAlerts");
    		EmpPhone = rs.getString("Emp_Mobile_No");
    		UserTypeId = rs.getString("User_Type_Id");
    		System.out.println("UserTypeId::::" + UserTypeId);
    		IsActive = rs.getString("Is_Active");
    		String Querycentre = "select Centre_Name from centre_master where Centre_Id='"+ location + "'";
    		Statement stmts = connection.createStatement();
    		ResultSet rss = null;
    		rss = stmts.executeQuery(Querycentre);
    		if (rss.next())
    		 {
    			LocationName = rss.getString("Centre_Name").trim();
    		 }
    		rss.close();
    		String Querytype = "select User_Type_Description from user_type_master where User_Type_ID='"+ UserTypeId + "'";
    		rss = stmts.executeQuery(Querytype);
    		if (rss.next())
    		 {
    			UserTypename = rss.getString("User_Type_Description").trim();
    		 }
    		rss.close();
    		if (UserTypeId.equalsIgnoreCase("3"))
    		 {
    			String QueryAllPrgms = "SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ EmpUserAutoId + "' AND Program_Id = 0";
    			System.out.println("QueryAllPrgms::::::" + QueryAllPrgms);
    			rss = stmts.executeQuery(QueryAllPrgms);
    			allprgmsState = rss.next();
    			System.out.println("allprgmsState::::::" + allprgmsState);
    		}
    %>
			<table border="0" cellpadding="6" cellspacing="6" width="550px">
				<tr>
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="120px">
							<tr>
								<td align="left" class="allBackColor" id="EmployeeIdDISP"
									style="background-color: #d8d8d8;">
									Employee Id
								</td>
								<td align="left" class="allBackColor" id="SelectProgramDISP"
									style="background-color: #d8d8d8; display: none;">
									Select Program
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="430px">
							<tr>
								<td align="left" class="allBackColor" id="EmployeeIdValueDISP">
									<b><%=EmpId%></b>&nbsp;
								</td>
								<td align="left" class="allBackColor" id="SelectProgramDDL"
									style="display: none;">
									<select name="programname" id="programname" size="1"
										onChange="selectProgramName()" onkeyup="selectProgramName()"
										style="height: 18px; width: 180px;">
										<option value="0">
											- -Select- -
										</option>
										<%
										  	String secQsnQry = "select ProgramId, ProgramName from mstprogram where isActive='Y' order by programname asc";
										  		System.out.println("query " + secQsnQry);
										  		rss = stmts.executeQuery(secQsnQry);
										  		while (rss.next()) {
										  %>
													<option value="<%=rss.getString("ProgramId")%>"><%=rss.getString("ProgramName")%></option>
													<%
										  	}
										  		rss.close();
										  %>
									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="EmployeeNameDISP"
									style="background-color: #d8d8d8;">
									Employee Name
								</td>
								<td align="left" class="allBackColor" id="SelectSubPgrmDISP"
									style="background-color: #d8d8d8; display: none;">
									Select Sub-Program
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="EmployeeNameValueDISP">
									<b><%=EmpName%></b>&nbsp;
								</td>
								<td align="left" class="allBackColor" id="SelectSubPgrmDDL"
									style="display: none;">
									<select name="subprogramname" id="subprogramname" size="1"
										onChange="EmployeeList()" onkeyup="EmployeeList()"
										style="height: 18px; width: 180px;">
										<option value="0">
											- -Select- -
										</option>

									</select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="userTypeDISP">
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						User Type
					</td>
					<td align="left" class="allBackColor">
						<b><%=UserTypename%></b>
					</td>
				</tr>
				<tr style="display: none;" id="EmployeeNameAddDISP">
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="EmployeeNameAddDISP"
									style="background-color: #d8d8d8;">
									Select Employee
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="EmployeeIdAddValueDDL">
									<select name="EmployeelistDDL" id="EmployeelistDDL" size="1"
										style="height: 18px; width: 180px;"
										onChange="EmployeeInformation()"
										onkeyup="EmployeeInformation()">
										<option value="">
											- -Select- -
										</option>
									</select>

								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="display: none;" id="EmployeeIdAddDISP">
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="EmployeeIdAddDISP"
									style="background-color: #d8d8d8;">
									Employee Id
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									id="EmployeeIdAddValueDISP" style="display: none;">
									<input type="text" name="employeeid" id="employeeid"
										style="border: #F8F8F8; background: #F8F8F8;"
										readonly="readonly">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="SelectUserType" style="display: none;">
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8;">
									User Type:
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr id="usertypesname" style="display: none;">
								<td align="left">
									<select name="UserTypesId" id="UserTypesId" size="1"
										style="height: 18px; width: 180px; font-family: Arial, Helvetica, sans-serif; font-size: 12px;"
										onChange="ShowChkBox()" onkeyup="ShowChkBox()">
										<option value="0">
											- -Select- -
										</option>
										<%
										String secQsnQrytypes = "";
											if (IsSAdmin.equalsIgnoreCase("Yes")) {
												secQsnQrytypes = "select  User_Type_ID,User_Type_Description from user_type_master where Is_Active = 1";
											} else {
												secQsnQrytypes = "select  User_Type_ID,User_Type_Description from user_type_master where User_Type_ID='"
														+ UserTypeId + "' and Is_Active = 1";
											}
											System.out.println("query " + secQsnQrytypes);
											rss = stmts.executeQuery(secQsnQrytypes);
											while (rss.next()) {
												if (UserTypeId.equals(rss.getString("User_Type_ID"))) {
									%>
										<option value="<%=rss.getString("User_Type_ID")%>"
											selected="selected" style="font-weight: bold;"><%=rss.getString("User_Type_Description")%></option>
										<%
							        	} else {
							        %>
										<option value="<%=rss.getString("User_Type_ID")%>"><%=rss.getString("User_Type_Description")%></option>
										<%
                                   	}
                                   		}
                                   		rss.close();
                                   %>
									
								</td>
							</tr>
							<tr id="usertypesADDUser" style="display: none;">
								<td align="left">
									<select name="UserTypesIdAddUser" id="UserTypesIdAddUser"
										size="1" style="height: 18px; width: 180px;"
										onChange="ShowChkBox1()" onkeyup="ShowChkBox1()">
										<option value="0">
											- -Select- -
										</option>
										<%
									String QrytypesAddUser = "";
										if (IsSAdmin.equalsIgnoreCase("Yes")) {
											QrytypesAddUser = "select  User_Type_ID,User_Type_Description from user_type_master  where Is_Active = 1";
										} else {
											QrytypesAddUser = "select  User_Type_ID,User_Type_Description from user_type_master where User_Type_ID = '"
													+ User_Type_Id + "' and Is_Active = 1";
										}
										System.out.println("query " + QrytypesAddUser);
										rss = stmts.executeQuery(QrytypesAddUser);
										while (rss.next()) {
								%>
										<option value="<%=rss.getString("User_Type_ID")%>"><%=rss.getString("User_Type_Description")%></option>
										<%
									}
										rss.close();
								%>
									
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8;">
									Location
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="LocationDISP">
									<b><%=LocationName%></b>&nbsp;
								</td>
								<td align="left" class="allBackColor" id="locationAdd"
									style="display: none;">
									<input type="text" name="employeeLocation"
										id="employeeLocation"
										style="border: #F8F8F8; background: #F8F8F8; width: 100%"
										readonly="readonly">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8;">
									Employee Email-Id
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="emailidDISP">
									<b><%=EmpEmail%></b>&nbsp;
								</td>
								<td align="left" class="allBackColor" id="emailidAdd"
									style="display: none;">
									<input type="text" name="employeeemailid" id="employeeemailid"
										style="border: #F8F8F8; background: #F8F8F8; width: 100%"
										readonly="readonly">
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8;" id="EmployeePhoneDISP">
									Employee Phone No.
								</td>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8; display: none;"
									id="EmployeeEnterPhoneDISP">
									Enter Employee Phone No.
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="employeephoneVal">
									<b><%=EmpPhone%></b>&nbsp;
								</td>
								<td align="left" class="allBackColor" id="employeephoneAdd"
									style="display: none;">
									<input type="text" name="employeephone" id="employeephone"
										style="border-color: #41383C;" maxlength="10"
										onkeypress="return isNumberKey(event);"
										title="Enter the Phone Number" oncopy="return false"
										onpaste="return false" oncut="return false">
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<!--*********** Radio Button for Sending Alerts Field **************-->
				<tr>
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8;" id="EmployeeAlertDISP">
									Alerts Recipient
								</td>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8; display: none;"
									id="EmployeeSelectAlrtsDISP">
									Alerts Recipient
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="employeeAlertsDISPTXT">
									<%
					  	if (SendAlerts == 1) {
					  %>

									Yes
									<%
					  	} else {
					  %>
									No
									<%
					  	}
					  %>
								</td>

								<td align="left" class="allBackColor" id="employeeAlertsDISP"
									style="display: none;">
									<%
					  	if (SendAlerts == 1) {
					  %>

									<input type="radio" name="AlertsRequired" id="AlertsRequired"
										checked="checked" value="1">
									Yes
									<%
					  					  	} else {
					  					  %>
									<input type="radio" name="AlertsRequired" id="AlertsRequired"
										value="1">
									Yes
									<%
					   	}
					   		if (SendAlerts == 0) {
					   %>
									<input type="radio" name="AlertsRequired" id="AlertsRequired"
										checked="checked" value="0">
									No
									<%
					  	} else {
					  %>
									<input type="radio" name="AlertsRequired" id="AlertsRequired"
										value="0">
									No
									<%
					  	}
					  %>
								</td>
								<td align="left" class="allBackColor" id="employeeAlertsAdd"
									style="display: none;">
									<input type="radio" name="AlertsRequiredAdd"
										id="AlertsRequiredAdd" value="1">
									Yes
									<input type="radio" name="AlertsRequiredAdd"
										id="AlertsRequiredAdd" value="0" checked="checked">
									No
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<!--**********End of  Radio Button for Sending Alerts Field ************-->

				<!--*********** User Active/NonActive state Part **************-->
				<tr>
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8;" id="UserStateDISP">
									User Status
								</td>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8; display: none;"
									id="UserStateSelectDISP">
									Select User Status
								</td>
							</tr>
						</table>
					</td>
					<td align="left" class="allBackColor">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor" id="UserStateDISPTXT">
									<%
					  	if (IsActive.equalsIgnoreCase("1")) {
					  %>

									Enabled
									<%
					  	} else {
					  %>
									Disabled
									<%
					  	}
					  %>
								</td>

								<td align="left" class="allBackColor" id="UserStateRadioDISP"
									style="display: none;">
									<%
					  	if (IsActive.equalsIgnoreCase("1")) {
					  %>

									<input type="radio" name="UserState" id="UserState"
										checked="checked" value="1">
									Yes
									<%
					  					  	} else {
					  					  %>
									<input type="radio" name="UserState" id="UserState" value="1">
									Yes
									<%
					   	}
					   		if (IsActive.equalsIgnoreCase("0")) {
					   %>
									<input type="radio" name="UserState" id="UserState"
										checked="checked" value="0">
									No
									<%
					  	} else {
					  %>
									<input type="radio" name="UserState" id="UserState" value="0">
									No
									<%
					  	}
					  %>
								</td>
								<td align="left" class="allBackColor" id="UserStateAdd"
									style="display: none;">
									<input type="radio" name="UserStateAdd" id="UserStateAdd"
										value="1" checked="checked">
									Enable
									<input type="radio" name="UserStateAdd" id="UserStateAdd"
										value="0">
									Disable
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<!--**********End of  User  Active/NonActive state Part  ************-->


				<!-- User Access Display Part::::Header Text -->
				<tr id="UserAccessDISP">
					<td colspan="1" align="left" class="allBackColor"
						style="background-color: #d8d8d8;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor"
									style="background-color: #d8d8d8;">
									User Access
								</td>
							</tr>
						</table>
					</td>

					<!--**********User Access Initial Text Display  ************-->

					<td align="left" class="allBackColor" id="LNDLabelDISP">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
							  	String LNDUTTMappingIdDISP = null;
							  		String LNDTaskDescriptionDISP = null;
							  		int LNDTaskIdDISP = 0;
							  		int kDISP = 1;
							  		String QuerychkBoxLDDISP = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = '"
							  				+ UserTypeId
							  				+ "' and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and uum.user_id = '"
							  				+ EmpUserAutoId
							  				+ "' and tm.Is_Active = 1 order by tm.Task_ID";
							  		System.out.println("User Access Disp:: " + QuerychkBoxLDDISP);
							  		Statement stmtChkBoxLDDISP = connection.createStatement();
							  		ResultSet ChkBoxRecLDDISP = stmtChkBoxLDDISP
							  				.executeQuery(QuerychkBoxLDDISP);
							  		while (ChkBoxRecLDDISP.next()) {
							  			LNDTaskIdDISP = ChkBoxRecLDDISP.getInt("tm.Task_ID");
							  			System.out.println("LNDUTTMappingIdDISP:: "
							  					+ LNDUTTMappingIdDISP);
							  			LNDUTTMappingIdDISP = ChkBoxRecLDDISP
							  					.getString("uttm.UTT_Mapping_Id");
							  			System.out.println("LNDUTTMappingIdDISP:: "
							  					+ LNDUTTMappingIdDISP);
							  			LNDTaskDescriptionDISP = ChkBoxRecLDDISP
							  					.getString("tm.Task_Description");
							  			System.out.println("LNDTaskDescriptionDISP:: "
							  					+ LNDTaskDescriptionDISP);
							  %>
									<div>
										<%=kDISP%>.
										<%=LNDTaskDescriptionDISP%>
									</div>
									<%
							 		int kDISP1 = 1;
							 				String TaskDescriptionChd = "";
							 				String QuerychkBoxLDDISPChd = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = '"
							 						+ UserTypeId
							 						+ "' and tm.Pareent_Task_Id = '"
							 						+ LNDTaskIdDISP
							 						+ "' and uum.Is_Active=1 and uum.user_id = '"
							 						+ EmpUserAutoId
							 						+ "' and tm.Is_Active = 1 order by tm.Task_ID";
							 				System.out.println("QuerychkBoxDISPChd:: "
							 						+ QuerychkBoxLDDISPChd);
							 				Statement stmtChd = connection.createStatement();
							 				ResultSet ChkBoxRecLDDISPChd = stmtChd
							 						.executeQuery(QuerychkBoxLDDISPChd);
							 				while (ChkBoxRecLDDISPChd.next()) {
							 					TaskDescriptionChd = ChkBoxRecLDDISPChd
							 							.getString("tm.Task_Description");
							 	%>
									<div style="padding-left: 20;">
										<img src="<%=recruitPath%>images/bullet4.gif" alt="image" />
										<%=TaskDescriptionChd%></div>
									<%
										kDISP1++;
												}
									%>
									<%
						 	kDISP++;
						 		}
						 		if (kDISP == 1) {
						 %>
									<div>
										No Access Granted
									</div>
									<%
						 	}
						 %>
								</td>
							</tr>
						</table>
					</td>

					<!--**********End of User Access Initial Text Display  ************-->


					<!-- Check box For Edit User Field -->
					<!-- L and D part -->
					<td align="left" class="allBackColor" id="LNDCHKDISP"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
							String UTTMappingId_LND = null;
								String TaskDescription_LND = null;
								int TaskId_LND = 0;
								int i_LND = 1;
								int checkedStateLND = 0;
								String QuerychkBox_LND = "";
								if (IsSAdmin.equalsIgnoreCase("Yes")) {
									QuerychkBox_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 2 order by tm.Task_Id";
								} else {
									QuerychkBox_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and  uum.user_id = '"
											+ USER_AUTOID
											+ "' and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 2 order by tm.Task_Id";
								}
								System.out.println("Check Box Selection Edit Query LND:: "
										+ QuerychkBox_LND);
								Statement stmtChkBox_LND = connection.createStatement();
								ResultSet ChkBoxRec_LND = stmtChkBox_LND
										.executeQuery(QuerychkBox_LND);
								while (ChkBoxRec_LND.next()) {
									TaskId_LND = ChkBoxRec_LND.getInt("tm.Task_Id");
									System.out.println("TaskId_LND  Edit part:: " + TaskId_LND);
									UTTMappingId_LND = ChkBoxRec_LND
											.getString("uttm.UTT_Mapping_Id");
									System.out.println("UTTMappingId_LND Edit part:: "
											+ UTTMappingId_LND);
									TaskDescription_LND = ChkBoxRec_LND
											.getString("tm.Task_Description");
									System.out.println("TaskDescription Edit part::::::::"
											+ TaskDescription_LND);
									String QryTaskMasterRec_LND = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 2 and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and tm.Task_ID = '"
											+ TaskId_LND
											+ "' and uum.user_id = '"
											+ EmpUserAutoId
											+ "' and tm.Is_Active = 1 order by tm.Task_ID";
									System.out.println("Tasks master Edit Query LND:: "
											+ QryTaskMasterRec_LND);
									Statement stmtTaskMasterRec_LND = null;
									ResultSet TaskMasterRec_LND = null;
									stmtTaskMasterRec_LND = connection.createStatement();
									TaskMasterRec_LND = stmtTaskMasterRec_LND
											.executeQuery(QryTaskMasterRec_LND);
									if (TaskMasterRec_LND.next()) {
						%>
									<input type="checkbox" name="UUTLNDEdit<%=i_LND%>"
										id="UUTLNDEdit<%=i_LND%>" checked="checked"
										value="<%=UTTMappingId_LND%>" title="Select Field"
										onclick="return chkBoxCHKLND(<%=i_LND%>);"><%=TaskDescription_LND%><br />
									<input type="hidden" name="UUTLNDHdd<%=i_LND%>"
										id="UUTLNDHdd<%=i_LND%>" value="<%=UTTMappingId_LND%>">
									<%
										checkedStateLND = 1;
												} else {
									%>
									<input type="checkbox" name="UUTLNDEdit<%=i_LND%>"
										id="UUTLNDEdit<%=i_LND%>" value="<%=UTTMappingId_LND%>"
										title="Select Field"
										onclick="return chkBoxCHKLND(<%=i_LND%>);"><%=TaskDescription_LND%><br />
									<input type="hidden" name="UUTLNDHdd<%=i_LND%>"
										id="UUTLNDHdd<%=i_LND%>" value="">
									<%
										checkedStateLND = 0;
												}
									%>
									<div style="padding-left: 20px;">
										<%
 									 	  	String UTTMappingIdChd_LND = null;
 									 	  			String TaskDescriptionChd_LND = null;
 									 	  			int TaskIdChd_LND = 0;
 									 	  			int i1_LND = 1;
 									 	  			String QuerychkBoxChd_LND = "";
 									 	  			if (IsSAdmin.equalsIgnoreCase("Yes")) {
 									 	  				QuerychkBoxChd_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_LND
 									 	  						+ "' and  uttm.user_type_id = 2 order by tm.Task_Id";
 									 	  			} else {
 									 	  				QuerychkBoxChd_LND = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"
 									 	  						+ USER_AUTOID
 									 	  						+ "' and tm.Is_Active = 1  and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_LND
 									 	  						+ "' and  uttm.user_type_id = 2 order by tm.Task_Id";
 									 	  			}
 									 	  			System.out
 									 	  					.println("Check Box Chd Selection Edit Query Recruiter:: "
 									 	  							+ QuerychkBoxChd_LND);
 									 	  			Statement stmtChkBoxchd_LND = connection.createStatement();
 									 	  			ResultSet ChkBoxRecchd_LND = stmtChkBoxchd_LND
 									 	  					.executeQuery(QuerychkBoxChd_LND);
 									 	  			while (ChkBoxRecchd_LND.next()) {
 									 	  				TaskIdChd_LND = ChkBoxRecchd_LND.getInt("tm.Task_Id");
 									 	  				System.out.println("TaskIdChd_LND  Edit part:: "
 									 	  						+ TaskIdChd_LND);
 									 	  				TaskDescriptionChd_LND = ChkBoxRecchd_LND
 									 	  						.getString("tm.Task_Description");
 									 	  				UTTMappingIdChd_LND = ChkBoxRecchd_LND
 									 	  						.getString("uttm.UTT_Mapping_Id");
 									 	  				System.out.println("UTTMappingIdChd Edit part:: "
 									 	  						+ UTTMappingIdChd_LND);
 									 	  				System.out
 									 	  						.println("TaskDescriptionChd Edit part::::::::"
 									 	  								+ TaskDescriptionChd_LND);
 									 	  				String QryTaskMasterRecChd_LND = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 2 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_LND
 									 	  						+ "' and uum.Is_Active=1 and tm.Task_ID = '"
 									 	  						+ TaskIdChd_LND
 									 	  						+ "' and uum.user_id = '"
 									 	  						+ EmpUserAutoId
 									 	  						+ "' and tm.Is_Active = 1 order by tm.Task_ID";
 									 	  				System.out
 									 	  						.println("Tasks master Chd Edit Query Recruiter:: "
 									 	  								+ QryTaskMasterRecChd_LND);
 									 	  				Statement stmtTaskMasterRecChd_LND = null;
 									 	  				ResultSet TaskMasterRecChd_LND = null;
 									 	  				stmtTaskMasterRecChd_LND = connection.createStatement();
 									 	  				TaskMasterRecChd_LND = stmtTaskMasterRecChd_LND
 									 	  						.executeQuery(QryTaskMasterRecChd_LND);
 									 	  				if (TaskMasterRecChd_LND.next()) {
 									 	  					System.out.println("checkedStateLND::::"
 									 	  							+ checkedStateLND);
 									 	  					System.out.println("Available for chd");
 									 	  					if (checkedStateLND == 1) {
 									 	  %>
										<input type="checkbox"
											name="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>" checked="checked"
											value="<%=UTTMappingIdChd_LND%>" title="Select Field"><%=TaskDescriptionChd_LND%><br />
										<%
														} else {
													%>
										<input type="checkbox"
											name="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>" checked="checked"
											value="<%=UTTMappingIdChd_LND%>" title="Select Field"
											disabled="disabled"><%=TaskDescriptionChd_LND%><br />
										<%
														}
													%>
										<input type="hidden" name="UUTLNDHdd<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDHdd<%=i_LND%>Chd<%=i1_LND%>"
											value="<%=UTTMappingIdChd_LND%>">
										<input type="hidden" name="UUTLNDTF<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDTF<%=i_LND%>Chd<%=i1_LND%>" value="true">
										<%
														} else {
																		System.out.println("Not Available for chd");
																		if (checkedStateLND == 1) {
													%>
										<input type="checkbox"
											name="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>"
											value="<%=UTTMappingIdChd_LND%>" title="Select Field"><%=TaskDescriptionChd_LND%><br />
										<%
															} else {
														%>
										<input type="checkbox"
											name="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDEdit<%=i_LND%>Chd<%=i1_LND%>"
											value="<%=UTTMappingIdChd_LND%>" title="Select Field"
											disabled="disabled"><%=TaskDescriptionChd_LND%><br />
										<%
														 	}
														 %>
										<input type="hidden" name="UUTLNDHdd<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDHdd<%=i_LND%>Chd<%=i1_LND%>" value="">
										<input type="hidden" name="UUTLNDTF<%=i_LND%>Chd<%=i1_LND%>"
											id="UUTLNDTF<%=i_LND%>Chd<%=i1_LND%>" value="false">
										<%
														}
																	i1_LND++;
																}
													%>
										<input type="hidden" id="LNDCountValue<%=i_LND%>"
											name="LNDCountValue<%=i_LND%>" value="<%=i1_LND%>">
									</div>
									<%
									 	i_LND++;
									 			System.out.println("i value  Edit part:: " + i_LND);
									 		}
									 %>
									<input type="hidden" name="LNDCountValue" id="LNDCountValue"
										value="<%=i_LND%>">
								</td>
							</tr>
						</table>
					</td>
					<!--End of L and D part -->

					<!-- Recruiter part -->
					<td align="left" class="allBackColor" id="RECCHKDISP" style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
								String UTTMappingId = null;
								String TaskDescription = null;
								int TaskId = 0;
								int i = 1;
								String QuerychkBox = "";
								int checkedStateRec = 0;
								if (IsSAdmin.equalsIgnoreCase("Yes")) 
								{
									QuerychkBox = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 1 order by tm.Task_Id";
								} 
								else
								 {
									QuerychkBox = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"+ USER_AUTOID+ "' and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 1 order by tm.Task_Id";
								}
								System.out.println("Check Box Selection Edit Query Recruiter:: "+ QuerychkBox);
								Statement stmtChkBox = connection.createStatement();
								ResultSet ChkBoxRec = stmtChkBox.executeQuery(QuerychkBox);
								while (ChkBoxRec.next()) 
								{
									TaskId = ChkBoxRec.getInt("tm.Task_Id");
									System.out.println("TaskId Edit part:: " + TaskId);
									UTTMappingId = ChkBoxRec.getString("uttm.UTT_Mapping_Id");
									System.out.println("UTTMappingId Edit part:: "+ UTTMappingId);
									TaskDescription = ChkBoxRec.getString("tm.Task_Description");
									System.out.println("TaskDescription Edit part::::::::"+ TaskDescription);
									String QryTaskMasterRec = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 1 and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and tm.Task_ID = '"+ TaskId+ "' and uum.user_id = '"+ EmpUserAutoId+ "' and tm.Is_Active = 1 order by tm.Task_ID";
									System.out.println("Tasks master Edit Query Recruiter:: "	+ QryTaskMasterRec);
									Statement stmtTaskMasterRec = null;
									ResultSet TaskMasterRec = null;
									stmtTaskMasterRec = connection.createStatement();
									TaskMasterRec = stmtTaskMasterRec.executeQuery(QryTaskMasterRec);
									if (TaskMasterRec.next())
									 {
									%>
									<input type="checkbox" name="UUTRecEdit<%=i%>" id="UUTRecEdit<%=i%>" checked="checked" value="<%=UTTMappingId%>" title="Select Field" onclick="return chkBoxCHKRec('<%=i%>');"><%=TaskDescription%><br />
									<input type="hidden" name="UUTRecHdd<%=i%>" id="UUTRecHdd<%=i%>" value="<%=UTTMappingId%>">
									<%
										checkedStateRec = 1;
									}
									 else
								    {
									%>
									<input type="checkbox" name="UUTRecEdit<%=i%>" id="UUTRecEdit<%=i%>" value="<%=UTTMappingId%>" title="Select Field" onclick="return chkBoxCHKRec('<%=i%>');"><%=TaskDescription%><br />
									<input type="hidden" name="UUTRecHdd<%=i%>" id="UUTRecHdd<%=i%>" value="">
									<%
										checkedStateRec = 0;
									}
									%>
									<div style="padding-left: 20px;">
										<%
 									 	  			String UTTMappingIdChd = null;
 									 	  			String TaskDescriptionChd = null;
 									 	  			int TaskIdChd = 0;
 									 	  			int i1 = 1;
 									 	  			String QuerychkBoxChd = "";
 									 	  			if (IsSAdmin.equalsIgnoreCase("Yes"))
 									 	  			 {
 									 	  				QuerychkBoxChd = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id = '"+ TaskId+ "' and  uttm.user_type_id = 1 order by tm.Task_Id";
 									 	  			} 
 									 	  			else
 									 	  			 {
 									 	  				QuerychkBoxChd = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"+ USER_AUTOID+ "' and tm.Is_Active = 1  and tm.Pareent_Task_Id = '"+ TaskId+ "' and  uttm.user_type_id = 1 order by tm.Task_Id";
 									 	  			}
 									 	  			System.out.println("Check Box Chd Selection Edit Query Recruiter:: "+ QuerychkBoxChd);
 									 	  			Statement stmtChkBoxchd = connection.createStatement();
 									 	  			ResultSet ChkBoxRecchd = stmtChkBoxchd.executeQuery(QuerychkBoxChd);
 									 	  			while (ChkBoxRecchd.next())
 									 	  			 {
 									 	  				System.out.println("checkedStateRec:: "+ checkedStateRec);
 									 	  				TaskIdChd = ChkBoxRecchd.getInt("tm.Task_Id");
 									 	  				System.out.println("TaskIdChd  Edit part:: "+ TaskIdChd);
 									 	  				TaskDescriptionChd = ChkBoxRecchd.getString("tm.Task_Description");
 									 	  				UTTMappingIdChd = ChkBoxRecchd.getString("uttm.UTT_Mapping_Id");
 									 	  				System.out.println("UTTMappingIdChd Edit part:: "+ UTTMappingIdChd);
 									 	  				System.out.println("TaskDescriptionChd Edit part::::::::"+ TaskDescriptionChd);
 									 	  				String QryTaskMasterRecChd = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 1 and tm.Pareent_Task_Id = '"+ TaskId+ "' and uum.Is_Active=1 and tm.Task_ID = '"+ TaskIdChd+ "' and uum.user_id = '"+ EmpUserAutoId+ "' and tm.Is_Active = 1 order by tm.Task_ID";
 									 	  				System.out.println("Tasks master Chd Edit Query Recruiter:: "+ QryTaskMasterRecChd);
 									 	  				Statement stmtTaskMasterRecChd = null;
 									 	  				ResultSet TaskMasterRecChd = null;
 									 	  				stmtTaskMasterRecChd = connection.createStatement();
 									 	  				TaskMasterRecChd = stmtTaskMasterRecChd.executeQuery(QryTaskMasterRecChd);
 									 	  				if (TaskMasterRecChd.next())
 									 	  				 {
 									 	  					System.out.println("Available for chd");
 									 	  					if (checkedStateRec == 1)
 									 	  					 {
					 									 	  %>
																<input type="checkbox" name="UUTRecEdit<%=i%>Chd<%=i1%>" id="UUTRecEdit<%=i%>Chd<%=i1%>" checked="checked" value="<%=UTTMappingIdChd%>" title="Select Field"><%=TaskDescriptionChd%><br />
															  <%
															 }
															 else
														     {
															%>
																<input type="checkbox" name="UUTRecEdit<%=i%>Chd<%=i1%>" id="UUTRecEdit<%=i%>Chd<%=i1%>" checked="checked" value="<%=UTTMappingIdChd%>" title="Select Field" disabled="disabled"><%=TaskDescriptionChd%><br />
																<%
														 	}
														 %>
															<input type="hidden" name="UUTRecTF<%=i%>Chd<%=i1%>" id="UUTRecTF<%=i%>Chd<%=i1%>" value="true">
															<input type="hidden" name="UUTRecHdd<%=i%>Chd<%=i1%>" id="UUTRecHdd<%=i%>Chd<%=i1%>" value="<%=UTTMappingIdChd%>">
														<%
														}
														 else
													    {
																		System.out.println("Not Available for chd");
																		if (checkedStateRec == 1) {
													%>
										<input type="checkbox" name="UUTRecEdit<%=i%>Chd<%=i1%>"
											id="UUTRecEdit<%=i%>Chd<%=i1%>" value="<%=UTTMappingIdChd%>"
											title="Select Field"><%=TaskDescriptionChd%><br />
										<%
															} else {
														%>
										<input type="checkbox" name="UUTRecEdit<%=i%>Chd<%=i1%>"
											id="UUTRecEdit<%=i%>Chd<%=i1%>" value="<%=UTTMappingIdChd%>"
											title="Select Field" disabled="disabled"><%=TaskDescriptionChd%><br />
										<%
															}
														%>
										<input type="hidden" name="UUTRecTF<%=i%>Chd<%=i1%>"
											id="UUTRecTF<%=i%>Chd<%=i1%>" value="false">
										<input type="hidden" name="UUTRecHdd<%=i%>Chd<%=i1%>"
											id="UUTRecHdd<%=i%>Chd<%=i1%>" value="">
										<%
														}
																	i1++;
																}
													%>
										<input type="hidden" id="CountValue<%=i%>"
											name="CountValue<%=i%>" value="<%=i1%>">
									</div>
									<%
									 	i++;
									 			System.out.println("i value  Edit part:: " + i);
									 		}
									 %>
									<input type="hidden" name="CountValue" id="CountValue"
										value="<%=i%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End of Recruiter part -->

					<!-- HR Ops  part -->
					<td align="left" class="allBackColor" id="HROpsCHKDISP"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
							String UTTMappingId_HROps = null;
								String TaskDescription_HROps = null;
								int TaskId_HROps = 0;
								int i_HROps = 1;
								int checkedStateHROps = 0;
								String QuerychkBox_HROps = null;
								if (IsSAdmin.equalsIgnoreCase("Yes")) {
									QuerychkBox_HROps = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 4 order by tm.Task_Id";
								} else {
									QuerychkBox_HROps = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"
											+ USER_AUTOID
											+ "'  and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 4 order by tm.Task_Id";
								}
								System.out.println("Check Box Selection Edit Query HROPS:: "
										+ QuerychkBox_HROps);
								Statement stmtChkBox_HROps = connection.createStatement();
								ResultSet ChkBoxRec_HROps = stmtChkBox_HROps
										.executeQuery(QuerychkBox_HROps);
								while (ChkBoxRec_HROps.next()) {
									TaskId_HROps = ChkBoxRec_HROps.getInt("tm.Task_Id");
									System.out.println("TaskId_HROps  Edit part:: "
											+ TaskId_HROps);
									UTTMappingId_HROps = ChkBoxRec_HROps
											.getString("uttm.UTT_Mapping_Id");
									System.out.println("UTTMappingId_HROps Edit part:: "
											+ UTTMappingId_HROps);
									TaskDescription_HROps = ChkBoxRec_HROps
											.getString("tm.Task_Description");
									System.out
											.println("TaskDescription_HROps Edit part::::::::"
													+ TaskDescription_HROps);
									String QryTaskMasterRec_HROps = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 4 and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and tm.Task_ID = '"
											+ TaskId_HROps
											+ "' and uum.user_id = '"
											+ EmpUserAutoId
											+ "' and tm.Is_Active = 1 order by tm.Task_ID";
									System.out.println("Tasks master Edit Query Recruiter:: "
											+ QryTaskMasterRec_HROps);
									Statement stmtTaskMasterRec_HROps = null;
									ResultSet TaskMasterRec_HROps = null;
									stmtTaskMasterRec_HROps = connection.createStatement();
									TaskMasterRec_HROps = stmtTaskMasterRec_HROps
											.executeQuery(QryTaskMasterRec_HROps);
									if (TaskMasterRec_HROps.next()) {
						%>
									<input type="checkbox" name="UUTHROpsEdit<%=i_HROps%>"
										id="UUTHROpsEdit<%=i_HROps%>" checked="checked"
										value="<%=UTTMappingId_HROps%>" title="Select Field"
										onclick="return chkBoxCHKHROps(<%=i_HROps%>);"><%=TaskDescription_HROps%><br />
									<input type="hidden" name="UUTHROpsHdd<%=i_HROps%>"
										id="UUTHROpsHdd<%=i_HROps%>" value="<%=UTTMappingId_HROps%>">
									<%
										checkedStateHROps = 1;
												} else {
									%>
									<input type="checkbox" name="UUTHROpsEdit<%=i_HROps%>"
										id="UUTHROpsEdit<%=i_HROps%>" value="<%=UTTMappingId_HROps%>"
										title="Select Field"
										onclick="return chkBoxCHKHROps(<%=i_HROps%>);"><%=TaskDescription_HROps%><br />
									<input type="hidden" name="UUTHROpsHdd<%=i_HROps%>"
										id="UUTHROpsHdd<%=i_HROps%>" value="">
									<%
										checkedStateHROps = 0;
												}
									%>
									<div style="padding-left: 20px;">
										<%
 									 	  	String UTTMappingIdChd_HROps = null;
 									 	  			String TaskDescriptionChd_HROps = null;
 									 	  			int TaskIdChd_HROps = 0;
 									 	  			int i1_HROps = 1;
 									 	  			String QuerychkBoxChd_HROps = "";
 									 	  			if (IsSAdmin.equalsIgnoreCase("Yes")) {
 									 	  				QuerychkBoxChd_HROps = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_HROps
 									 	  						+ "' and  uttm.user_type_id = 4 order by tm.Task_Id";
 									 	  			} else {
 									 	  				QuerychkBoxChd_HROps = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"
 									 	  						+ USER_AUTOID
 									 	  						+ "'  and tm.Is_Active = 1  and tm.Pareent_Task_Id='"
 									 	  						+ TaskId_HROps
 									 	  						+ "' and  uttm.user_type_id = 4 order by tm.Task_Id";
 									 	  			}
 									 	  			System.out
 									 	  					.println("Check Box Chd Selection Edit Query Recruiter:: "
 									 	  							+ QuerychkBoxChd_HROps);
 									 	  			Statement stmtChkBoxchd_HROps = connection
 									 	  					.createStatement();
 									 	  			ResultSet ChkBoxRecchd_HROps = stmtChkBoxchd_HROps
 									 	  					.executeQuery(QuerychkBoxChd_HROps);
 									 	  			while (ChkBoxRecchd_HROps.next()) {
 									 	  				TaskIdChd_HROps = ChkBoxRecchd_HROps
 									 	  						.getInt("tm.Task_Id");
 									 	  				System.out.println("TaskIdChd_HROps  Edit part:: "
 									 	  						+ TaskIdChd_HROps);
 									 	  				TaskDescriptionChd_HROps = ChkBoxRecchd_HROps
 									 	  						.getString("tm.Task_Description");
 									 	  				UTTMappingIdChd_HROps = ChkBoxRecchd_HROps
 									 	  						.getString("uttm.UTT_Mapping_Id");
 									 	  				System.out.println("UTTMappingIdChd Edit part:: "
 									 	  						+ UTTMappingIdChd_HROps);
 									 	  				System.out
 									 	  						.println("TaskDescriptionChd Edit part::::::::"
 									 	  								+ TaskDescriptionChd_HROps);
 									 	  				String QryTaskMasterRecChd_HROps = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 4 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_HROps
 									 	  						+ "' and uum.Is_Active=1 and tm.Task_ID = '"
 									 	  						+ TaskIdChd_HROps
 									 	  						+ "' and uum.user_id = '"
 									 	  						+ EmpUserAutoId
 									 	  						+ "' and tm.Is_Active = 1 order by tm.Task_ID";
 									 	  				System.out
 									 	  						.println("Tasks master Chd Edit Query Recruiter:: "
 									 	  								+ QryTaskMasterRecChd_HROps);
 									 	  				Statement stmtTaskMasterRecChd_HROps = null;
 									 	  				ResultSet TaskMasterRecChd_HROps = null;
 									 	  				stmtTaskMasterRecChd_HROps = connection
 									 	  						.createStatement();
 									 	  				TaskMasterRecChd_HROps = stmtTaskMasterRecChd_HROps
 									 	  						.executeQuery(QryTaskMasterRecChd_HROps);
 									 	  				if (TaskMasterRecChd_HROps.next()) {
 									 	  					System.out.println("checkedStateHROps"
 									 	  							+ checkedStateHROps);
 									 	  					System.out.println("Available for chd");
 									 	  					if (checkedStateHROps == 1) {
 									 	  %>
										<input type="checkbox"
											name="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											checked="checked" value="<%=UTTMappingIdChd_HROps%>"
											title="Select Field"><%=TaskDescriptionChd_HROps%><br />
										<%
														} else {
													%>
										<input type="checkbox"
											name="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											checked="checked" value="<%=UTTMappingIdChd_HROps%>"
											title="Select Field" disabled="disabled"><%=TaskDescriptionChd_HROps%><br />
										<%
													 	}
													 %>
										<input type="hidden"
											name="UUTHROpsHdd<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsHdd<%=i_HROps%>Chd<%=i1_HROps%>"
											value="<%=UTTMappingIdChd_HROps%>">
										<input type="hidden"
											name="UUTHROpsTF<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsTF<%=i_HROps%>Chd<%=i1_HROps%>" value="true">
										<%
														} else {
																		System.out.println("Not Available for chd");
																		if (checkedStateHROps == 1) {
													%>
										<input type="checkbox"
											name="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											value="<%=UTTMappingIdChd_HROps%>" title="Select Field"><%=TaskDescriptionChd_HROps%><br />
										<%
														} else {
													%>
										<input type="checkbox"
											name="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsEdit<%=i_HROps%>Chd<%=i1_HROps%>"
											value="<%=UTTMappingIdChd_HROps%>" title="Select Field"
											disabled="disabled"><%=TaskDescriptionChd_HROps%><br />
										<%
															}
														%>
										<input type="hidden"
											name="UUTHROpsHdd<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsHdd<%=i_HROps%>Chd<%=i1_HROps%>" value="">
										<input type="hidden"
											name="UUTHROpsTF<%=i_HROps%>Chd<%=i1_HROps%>"
											id="UUTHROpsTF<%=i_HROps%>Chd<%=i1_HROps%>" value="false">
										<%
														}
																	i1_HROps++;
																}
													%>
										<input type="hidden" id="CountValue_HRops<%=i_HROps%>"
											name="CountValue_HRops<%=i_HROps%>" value="<%=i1_HROps%>">
									</div>
									<%
									 	i_HROps++;
									 			System.out.println("i value  Edit part:: " + i_HROps);
									 		}
									 %>
									<input type="hidden" name="CountValue_HRops"
										id="CountValue_HRops" value="<%=i_HROps%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End of HR Ops part -->

					<!-- Viewer Role Part -->
					<td align="left" class="allBackColor" id="ViewerCHKDISP"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
							String UTTMappingId_Viewer = null;
								String TaskDescription_Viewer = null;
								int TaskId_Viewer = 0;
								int i_Viewer = 1;
								int checkedStateViewer = 0;
								String QuerychkBox_Viewer = "";
								if (IsSAdmin.equalsIgnoreCase("Yes")) {
									QuerychkBox_Viewer = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 5 order by tm.Task_Id";
								} else {
									QuerychkBox_Viewer = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"
											+ USER_AUTOID
											+ "'  and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 5 order by tm.Task_Id";
								}
								System.out
										.println("Check Box Selection Edit Query Recruiter:: "
												+ QuerychkBox_Viewer);
								Statement stmtChkBox_Viewer = connection.createStatement();
								ResultSet ChkBoxRec_Viewer = stmtChkBox_Viewer
										.executeQuery(QuerychkBox_Viewer);
								while (ChkBoxRec_Viewer.next()) {
									TaskId_Viewer = ChkBoxRec_Viewer.getInt("tm.Task_Id");
									System.out.println("TaskId_Viewer  Edit part:: "
											+ TaskId_Viewer);
									UTTMappingId_Viewer = ChkBoxRec_Viewer
											.getString("uttm.UTT_Mapping_Id");
									System.out.println("UTTMappingId_Viewer Edit part:: "
											+ UTTMappingId_Viewer);
									TaskDescription_Viewer = ChkBoxRec_Viewer
											.getString("tm.Task_Description");
									System.out
											.println("TaskDescription_Viewer Edit part::::::::"
													+ TaskDescription_Viewer);
									String QryTaskMasterRec_Viewer = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 5 and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and tm.Task_ID = '"
											+ TaskId_Viewer
											+ "' and uum.user_id = '"
											+ EmpUserAutoId
											+ "' and tm.Is_Active = 1 order by tm.Task_ID";
									System.out.println("Tasks master Edit Query Recruiter:: "
											+ QryTaskMasterRec_Viewer);
									Statement stmtTaskMasterRec_Viewer = null;
									ResultSet TaskMasterRec_Viewer = null;
									stmtTaskMasterRec_Viewer = connection.createStatement();
									TaskMasterRec_Viewer = stmtTaskMasterRec_Viewer
											.executeQuery(QryTaskMasterRec_Viewer);
									if (TaskMasterRec_Viewer.next()) {
						%>
									<input type="checkbox" name="UUTViewerEdit<%=i_Viewer%>"
										id="UUTViewerEdit<%=i_Viewer%>" checked="checked"
										value="<%=UTTMappingId_Viewer%>" title="Select Field"
										onclick="return chkBoxCHKViewer(<%=i_Viewer%>);"><%=TaskDescription_Viewer%><br />
									<input type="hidden" name="UUTViewerHdd<%=i_Viewer%>"
										id="UUTViewerHdd<%=i_Viewer%>"
										value="<%=UTTMappingId_Viewer%>">
									<%
										checkedStateViewer = 1;
												} else {
									%>
									<input type="checkbox" name="UUTViewerEdit<%=i_Viewer%>"
										id="UUTViewerEdit<%=i_Viewer%>"
										value="<%=UTTMappingId_Viewer%>" title="Select Field"
										onclick="return chkBoxCHKViewer(<%=i_Viewer%>);"><%=TaskDescription_Viewer%><br />
									<input type="hidden" name="UUTViewerHdd<%=i_Viewer%>"
										id="UUTViewerHdd<%=i_Viewer%>" value="">
									<%
										checkedStateViewer = 0;
												}
									%>
									<div style="padding-left: 20px;">
										<%
 									 	  	String UTTMappingIdChd_Viewer = null;
 									 	  			String TaskDescriptionChd_Viewer = null;
 									 	  			int TaskIdChd_Viewer = 0;
 									 	  			int i1_Viewer = 1;
 									 	  			String QuerychkBoxChd_Viewer = "";
 									 	  			if (IsSAdmin.equalsIgnoreCase("Yes")) {
 									 	  				QuerychkBoxChd_Viewer = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_Viewer
 									 	  						+ "' and  uttm.user_type_id = 5 order by tm.Task_Id";
 									 	  			} else {
 									 	  				QuerychkBoxChd_Viewer = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"
 									 	  						+ USER_AUTOID
 									 	  						+ "'  and tm.Is_Active = 1  and tm.Pareent_Task_Id ='"
 									 	  						+ TaskId_Viewer
 									 	  						+ "' and  uttm.user_type_id = 5 order by tm.Task_Id";
 									 	  			}
 									 	  			System.out
 									 	  					.println("Check Box Chd Selection Edit Query Recruiter:: "
 									 	  							+ QuerychkBoxChd_Viewer);
 									 	  			Statement stmtChkBoxchd_Viewer = connection
 									 	  					.createStatement();
 									 	  			ResultSet ChkBoxRecchd_Viewer = stmtChkBoxchd_Viewer
 									 	  					.executeQuery(QuerychkBoxChd_Viewer);
 									 	  			while (ChkBoxRecchd_Viewer.next()) {
 									 	  				TaskIdChd_Viewer = ChkBoxRecchd_Viewer
 									 	  						.getInt("tm.Task_Id");
 									 	  				System.out.println("TaskIdChd_Viewer  Edit part:: "
 									 	  						+ TaskIdChd_Viewer);
 									 	  				TaskDescriptionChd_Viewer = ChkBoxRecchd_Viewer
 									 	  						.getString("tm.Task_Description");
 									 	  				UTTMappingIdChd_Viewer = ChkBoxRecchd_Viewer
 									 	  						.getString("uttm.UTT_Mapping_Id");
 									 	  				System.out.println("UTTMappingIdChd Edit part:: "
 									 	  						+ UTTMappingIdChd_Viewer);
 									 	  				System.out
 									 	  						.println("TaskDescriptionChd Edit part::::::::"
 									 	  								+ TaskDescriptionChd_Viewer);
 									 	  				String QryTaskMasterRecChd_Viewer = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 5 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_Viewer
 									 	  						+ "' and uum.Is_Active=1 and tm.Task_ID = '"
 									 	  						+ TaskIdChd_Viewer
 									 	  						+ "' and uum.user_id = '"
 									 	  						+ EmpUserAutoId
 									 	  						+ "' and tm.Is_Active = 1 order by tm.Task_ID";
 									 	  				System.out
 									 	  						.println("Tasks master Chd Edit Query Recruiter:: "
 									 	  								+ QryTaskMasterRecChd_Viewer);
 									 	  				Statement stmtTaskMasterRecChd_Viewer = null;
 									 	  				ResultSet TaskMasterRecChd_Viewer = null;
 									 	  				stmtTaskMasterRecChd_Viewer = connection
 									 	  						.createStatement();
 									 	  				TaskMasterRecChd_Viewer = stmtTaskMasterRecChd_Viewer
 									 	  						.executeQuery(QryTaskMasterRecChd_Viewer);
 									 	  				if (TaskMasterRecChd_Viewer.next()) {
 									 	  					System.out.println("checkedStateViewer"
 									 	  							+ checkedStateViewer);
 									 	  					System.out.println("Available for chd");
 									 	  					if (checkedStateViewer == 1) {
 									 	  %>
										<input type="checkbox"
											name="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											checked="checked" value="<%=UTTMappingIdChd_Viewer%>"
											title="Select Field"><%=TaskDescriptionChd_Viewer%><br />
										<%
														} else {
													%>
										<input type="checkbox"
											name="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											checked="checked" value="<%=UTTMappingIdChd_Viewer%>"
											title="Select Field" disabled="disabled"><%=TaskDescriptionChd_Viewer%><br />
										<%
														}
													%>
										<input type="hidden"
											name="UUTViewerHdd<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerHdd<%=i_Viewer%>Chd<%=i1_Viewer%>"
											value="<%=UTTMappingIdChd_Viewer%>">
										<input type="hidden"
											name="UUTViewerTF<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerTF<%=i_Viewer%>Chd<%=i1_Viewer%>" value="true">
										<%
														} else {
																		System.out.println("Not Available for chd");
																		if (checkedStateViewer == 1) {
													%>
										<input type="checkbox"
											name="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											value="<%=UTTMappingIdChd_Viewer%>" title="Select Field"><%=TaskDescriptionChd_Viewer%><br />
										<%
														} else {
													%>
										<input type="checkbox"
											name="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerEdit<%=i_Viewer%>Chd<%=i1_Viewer%>"
											value="<%=UTTMappingIdChd_Viewer%>" title="Select Field"
											disabled="disabled"><%=TaskDescriptionChd_Viewer%><br />
										<%
													 	}
													 %>
										<input type="hidden"
											name="UUTViewerHdd<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerHdd<%=i_Viewer%>Chd<%=i1_Viewer%>" value="">
										<input type="hidden"
											name="UUTViewerTF<%=i_Viewer%>Chd<%=i1_Viewer%>"
											id="UUTViewerTF<%=i_Viewer%>Chd<%=i1_Viewer%>" value="false">
										<%
														}
																	i1_Viewer++;
																}
													%>
										<input type="hidden" id="CountValue_Viewer<%=i_Viewer%>"
											name="CountValue_Viewer<%=i_Viewer%>" value="<%=i1_Viewer%>">
									</div>
									<%
									 	i_Viewer++;
									 			System.out.println("i value  Edit part:: " + i_Viewer);
									 		}
									 %>
									<input type="hidden" name="CountValue_Viewer"
										id="CountValue_Viewer" value="<%=i_Viewer%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End of HR Ops part -->

					<!-- Operations Role Part -->
					<td align="left" class="allBackColor" id="OpsCHKDISP"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
							String UTTMappingId_Ops = null;
								String TaskDescription_Ops = null;
								int TaskId_Ops = 0;
								int i_Ops = 1;
								int checkedStateOps = 0;
								String QuerychkBox_Ops = "";
								if (IsSAdmin.equalsIgnoreCase("Yes")) {
									QuerychkBox_Ops = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 3 order by tm.Task_Id";
								} else {
									QuerychkBox_Ops = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"
											+ USER_AUTOID
											+ "'  and tm.Is_Active = 1 and tm.Pareent_Task_Id=0 and  uttm.user_type_id = 3 order by tm.Task_Id";
								}
								System.out.println("Check Box Selection Edit Query Ops:: "
										+ QuerychkBox_Ops);
								Statement stmtChkBox_Ops = connection.createStatement();
								ResultSet ChkBoxRec_Ops = stmtChkBox_Ops
										.executeQuery(QuerychkBox_Ops);
								while (ChkBoxRec_Ops.next()) {
									TaskId_Ops = ChkBoxRec_Ops.getInt("tm.Task_Id");
									System.out.println("TaskId_Ops  Edit part:: " + TaskId_Ops);
									UTTMappingId_Ops = ChkBoxRec_Ops
											.getString("uttm.UTT_Mapping_Id");
									System.out.println("UTTMappingId_Ops Edit part:: "
											+ UTTMappingId_Ops);
									TaskDescription_Ops = ChkBoxRec_Ops
											.getString("tm.Task_Description");
									System.out.println("TaskDescription_Ops Edit part::::::::"
											+ TaskDescription_Ops);
									String QryTaskMasterRec_Ops = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 3 and tm.Pareent_Task_Id = 0 and uum.Is_Active=1 and tm.Task_ID = '"
											+ TaskId_Ops
											+ "' and uum.user_id = '"
											+ EmpUserAutoId
											+ "' and tm.Is_Active = 1 order by tm.Task_ID";
									System.out.println("Tasks master Edit Query Recruiter:: "
											+ QryTaskMasterRec_Ops);
									Statement stmtTaskMasterRec_Ops = null;
									ResultSet TaskMasterRec_Ops = null;
									stmtTaskMasterRec_Ops = connection.createStatement();
									TaskMasterRec_Ops = stmtTaskMasterRec_Ops
											.executeQuery(QryTaskMasterRec_Ops);
									if (TaskMasterRec_Ops.next()) {
						%>
									<input type="checkbox" name="UUTOpsEdit<%=i_Ops%>"
										id="UUTOpsEdit<%=i_Ops%>" checked="checked"
										value="<%=UTTMappingId_Ops%>" title="Select Field"
										onclick="return chkBoxCHKOps(<%=i_Ops%>);"><%=TaskDescription_Ops%><br />
									<input type="hidden" name="UUTOpsHdd<%=i_Ops%>"
										id="UUTOpsHdd<%=i_Ops%>" value="<%=UTTMappingId_Ops%>">
									<%
										checkedStateOps = 1;
												} else {
									%>
									<input type="checkbox" name="UUTOpsEdit<%=i_Ops%>"
										id="UUTOpsEdit<%=i_Ops%>" value="<%=UTTMappingId_Ops%>"
										title="Select Field"
										onclick="return chkBoxCHKOps(<%=i_Ops%>);"><%=TaskDescription_Ops%><br />
									<input type="hidden" name="UUTOpsHdd<%=i_Ops%>"
										id="UUTOpsHdd<%=i_Ops%>" value="">
									<%
										checkedStateOps = 0;
												}
									%>
									<div style="padding-left: 20px;">
										<%
 									 	  	String UTTMappingIdChd_Ops = null;
 									 	  			String TaskDescriptionChd_Ops = null;
 									 	  			int TaskIdChd_Ops = 0;
 									 	  			int i1_Ops = 1;
 									 	  			String QuerychkBoxChd_Ops = "";
 									 	  			if (IsSAdmin.equalsIgnoreCase("Yes")) {
 									 	  				QuerychkBoxChd_Ops = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm where uttm.task_id = tm.task_id and tm.Is_Active = 1 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_Ops
 									 	  						+ "' and  uttm.user_type_id = 3 order by tm.Task_Id";
 									 	  			} else {
 									 	  				QuerychkBoxChd_Ops = "select distinct(tm.Task_Id),tm.Task_Description,uttm.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id = tm.task_id and  uum.UTT_Mapping_Id = uttm.UTT_Mapping_Id and uum.user_id = '"
 									 	  						+ USER_AUTOID
 									 	  						+ "'  and tm.Is_Active = 1  and tm.Pareent_Task_Id ='"
 									 	  						+ TaskId_Ops
 									 	  						+ "' and  uttm.user_type_id = 3 order by tm.Task_Id";
 									 	  			}
 									 	  			System.out
 									 	  					.println("Check Box Chd Selection Edit Query Recruiter:: "
 									 	  							+ QuerychkBoxChd_Ops);
 									 	  			Statement stmtChkBoxchd_Ops = connection.createStatement();
 									 	  			ResultSet ChkBoxRecchd_Ops = stmtChkBoxchd_Ops
 									 	  					.executeQuery(QuerychkBoxChd_Ops);
 									 	  			while (ChkBoxRecchd_Ops.next()) {
 									 	  				TaskIdChd_Ops = ChkBoxRecchd_Ops.getInt("tm.Task_Id");
 									 	  				System.out.println("TaskIdChd_Ops  Edit part:: "
 									 	  						+ TaskIdChd_Ops);
 									 	  				TaskDescriptionChd_Ops = ChkBoxRecchd_Ops
 									 	  						.getString("tm.Task_Description");
 									 	  				UTTMappingIdChd_Ops = ChkBoxRecchd_Ops
 									 	  						.getString("uttm.UTT_Mapping_Id");
 									 	  				System.out.println("UTTMappingIdChd Edit part:: "
 									 	  						+ UTTMappingIdChd_Ops);
 									 	  				System.out
 									 	  						.println("TaskDescriptionChd Edit part::::::::"
 									 	  								+ TaskDescriptionChd_Ops);
 									 	  				String QryTaskMasterRecChd_Ops = "select distinct(tm.Task_ID),tm.Task_Description,uttm.User_Type_Id,uum.UTT_Mapping_Id from task_master tm,user_type_task_mapping uttm,user_utt_mapping uum where uttm.task_id=tm.task_id and uttm.UTT_Mapping_Id = uum.UTT_Mapping_Id and uttm.user_type_id = 3 and tm.Pareent_Task_Id = '"
 									 	  						+ TaskId_Ops
 									 	  						+ "' and uum.Is_Active=1 and tm.Task_ID = '"
 									 	  						+ TaskIdChd_Ops
 									 	  						+ "' and uum.user_id = '"
 									 	  						+ EmpUserAutoId
 									 	  						+ "' and tm.Is_Active = 1 order by tm.Task_ID";
 									 	  				System.out
 									 	  						.println("Tasks master Chd Edit Query Recruiter:: "
 									 	  								+ QryTaskMasterRecChd_Ops);
 									 	  				Statement stmtTaskMasterRecChd_Ops = null;
 									 	  				ResultSet TaskMasterRecChd_Ops = null;
 									 	  				stmtTaskMasterRecChd_Ops = connection.createStatement();
 									 	  				TaskMasterRecChd_Ops = stmtTaskMasterRecChd_Ops
 									 	  						.executeQuery(QryTaskMasterRecChd_Ops);
 									 	  				if (TaskMasterRecChd_Ops.next()) {
 									 	  					System.out.println("checkedStateOps"
 									 	  							+ checkedStateOps);
 									 	  					System.out.println("Available for chd");
 									 	  					if (checkedStateOps == 1) {
 									 	  %>
										<input type="checkbox"
											name="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>" checked="checked"
											value="<%=UTTMappingIdChd_Ops%>" title="Select Field"><%=TaskDescriptionChd_Ops%><br />
										<%
														} else {
													%>
										<input type="checkbox"
											name="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>" checked="checked"
											value="<%=UTTMappingIdChd_Ops%>" title="Select Field"
											disabled="disabled"><%=TaskDescriptionChd_Ops%><br />
										<%
															}
														%>
										<input type="hidden" name="UUTOpsHdd<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsHdd<%=i_Ops%>Chd<%=i1_Ops%>"
											value="<%=UTTMappingIdChd_Ops%>">
										<input type="hidden" name="UUTOpsTF<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsTF<%=i_Ops%>Chd<%=i1_Ops%>" value="true">
										<%
														} else {
																		System.out.println("Not Available for chd");
																		if (checkedStateOps == 1) {
													%>
										<input type="checkbox"
											name="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>"
											value="<%=UTTMappingIdChd_Ops%>" title="Select Field"><%=TaskDescriptionChd_Ops%><br />
										<%
														} else {
													%>
										<input type="checkbox"
											name="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsEdit<%=i_Ops%>Chd<%=i1_Ops%>"
											value="<%=UTTMappingIdChd_Ops%>" title="Select Field"
											disabled="disabled"><%=TaskDescriptionChd_Ops%><br />
										<%
														}
													%>
										<input type="hidden" name="UUTOpsHdd<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsHdd<%=i_Ops%>Chd<%=i1_Ops%>" value="">
										<input type="hidden" name="UUTOpsTF<%=i_Ops%>Chd<%=i1_Ops%>"
											id="UUTOpsTF<%=i_Ops%>Chd<%=i1_Ops%>" value="false">
										<%
														}
																	i1_Ops++;
																}
													%>
										<input type="hidden" id="CountValue_Ops<%=i_Ops%>"
											name="CountValue_Ops<%=i_Ops%>" value="<%=i1_Ops%>">
									</div>
									<%
									 	i_Ops++;
									 			System.out.println("i value  Edit part:: " + i_Ops);
									 		}
									 %>
									<input type="hidden" name="CountValue_Ops" id="CountValue_Ops"
										value="<%=i_Ops%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End of Operations Role Part -->
					<!------- End of Check box For Edit User Field ---------->


					<!-- -------*******Check box For Add User Field********------- -->
					<!-- Add user Check box field for LND part -->
					<td align="left" class="allBackColor" id="LNDCHKDISPADDUser"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
						  	int LNDUTTMappingIdAdduser = 0;
						  		String LNDTaskDescriptionAdduser = null;
						  		int LNDTaskIdAdduser = 0;
						  		String QryTaskMasterLNDAdduser = "";
						  		if (IsSAdmin.equalsIgnoreCase("Yes")) {
						  			QryTaskMasterLNDAdduser = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id = 2 and tm.Pareent_Task_Id=0";
						  		} else {
						  			QryTaskMasterLNDAdduser = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id  and uum.user_id = '"
						  					+ USER_AUTOID
						  					+ "'  and umt.user_type_id= 2 and tm.Pareent_Task_Id=0";
						  		}
						  		System.out.println("QryTaskMasterLNDAdduser:: "
						  				+ QryTaskMasterLNDAdduser);
						  		Statement stmtTaskMasterLNDAdduser = null;
						  		ResultSet TaskMasterLNDAdduser = null;
						  		stmtTaskMasterLNDAdduser = connection.createStatement();
						  		TaskMasterLNDAdduser = stmtTaskMasterLNDAdduser
						  				.executeQuery(QryTaskMasterLNDAdduser);
						  		int p = 1;
						  		while (TaskMasterLNDAdduser.next()) {
						  			LNDTaskDescriptionAdduser = TaskMasterLNDAdduser
						  					.getString("tm.Task_Description");
						  			System.out.println("LNDTaskDescriptionAdduser Query Add:: "
						  					+ LNDTaskDescriptionAdduser);
						  			LNDUTTMappingIdAdduser = TaskMasterLNDAdduser
						  					.getInt("umt.UTT_Mapping_Id");
						  			System.out.println("LNDUTTMappingIdAdduser  Add:: "
						  					+ LNDUTTMappingIdAdduser);
						  			LNDTaskIdAdduser = TaskMasterLNDAdduser
						  					.getInt("tm.Task_ID");
						  			System.out.println("LNDTaskIdAdduser Add:: "
						  					+ LNDTaskIdAdduser);
						  %>
									<input type="checkbox" name="UUTADDLND<%=p%>"
										id="UUTADDLND<%=p%>" value="<%=LNDUTTMappingIdAdduser%>"
										title="Select Field" onclick="return chkBoxCHKLNDAdd(<%=p%>);"><%=LNDTaskDescriptionAdduser%><br />
									<div style="padding-left: 20px;">
										<%
 							 			int LNDUTTMappingIdAdduserChd = 0;
 							 					String LNDTaskDescriptionAdduserChd = null;
 							 					int LNDTaskIdAdduserChd = 0;
 							 					String QryTaskMasterLNDAdduserChd = "";
 							 					if (IsSAdmin.equalsIgnoreCase("Yes")) {
 							 						QryTaskMasterLNDAdduserChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id= 2 and tm.Pareent_Task_Id = '"
 							 								+ LNDTaskIdAdduser + "'";
 							 					} else {
 							 						QryTaskMasterLNDAdduserChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
 							 								+ USER_AUTOID
 							 								+ "' and umt.user_type_id= 2 and tm.Pareent_Task_Id = '"
 							 								+ LNDTaskIdAdduser + "'";
 							 					}
 							 					System.out.println("QryTaskMasterLNDAdduserChd:: "
 							 							+ QryTaskMasterLNDAdduserChd);
 							 					Statement stmtTaskMasterLNDAdduserChd = null;
 							 					ResultSet TaskMasterLNDAdduserChd = null;
 							 					stmtTaskMasterLNDAdduserChd = connection.createStatement();
 							 					TaskMasterLNDAdduserChd = stmtTaskMasterLNDAdduserChd
 							 							.executeQuery(QryTaskMasterLNDAdduserChd);
 							 					int pChd = 1;
 							 					while (TaskMasterLNDAdduserChd.next()) {
 							 						LNDTaskDescriptionAdduserChd = TaskMasterLNDAdduserChd
 							 								.getString("tm.Task_Description");
 							 						LNDUTTMappingIdAdduserChd = TaskMasterLNDAdduserChd
 							 								.getInt("umt.UTT_Mapping_Id");
 							 						LNDTaskIdAdduserChd = TaskMasterLNDAdduserChd
 							 								.getInt("tm.Task_ID");
 							 		%>
										<input type="checkbox" name="UUTADDLND<%=p%>Chd<%=pChd%>"
											id="UUTADDLND<%=p%>Chd<%=pChd%>"
											value="<%=LNDUTTMappingIdAdduserChd%>" title="Select Field"
											disabled="disabled"><%=LNDTaskDescriptionAdduserChd%><br />
										<%
											pChd++;
													}
													System.out.println("Value of pChd::::" + pChd);
										%>
										<input type="hidden" name="LNDCountValueAdduser<%=p%>"
											id="LNDCountValueAdduser<%=p%>" value="<%=pChd%>">
									</div>
									<%
							 	p++;
							 		}
							 		System.out.println("Value of p::::" + p);
							 %>
									<input type="hidden" name="LNDCountValueAdduser"
										id="LNDCountValueAdduser" value="<%=p%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End of Add user Check box field for LND part -->

					<!-- Add user Check box field for Recruiter part -->
					<td align="left" class="allBackColor" id="RECCHKDISPADDUser"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
									int UTTMappingIdAdduser = 0;
										String TaskDescriptionAdduser = null;
										int TaskIdAdduser = 0;
										String QryTaskMasterRecAdduser = "";
										if (IsSAdmin.equalsIgnoreCase("Yes")) {
											QryTaskMasterRecAdduser = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id=1 and tm.Pareent_Task_Id=0";
										} else {
											QryTaskMasterRecAdduser = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id  and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id= '"
													+ USER_AUTOID
													+ "'  and umt.user_type_id=1 and tm.Pareent_Task_Id=0";
										}
										System.out.println("Task master Query:: "
												+ QryTaskMasterRecAdduser);
										Statement stmtTaskMasterRecAdduser = null;
										ResultSet TaskMasterRecAdduser = null;
										stmtTaskMasterRecAdduser = connection.createStatement();
										TaskMasterRecAdduser = stmtTaskMasterRecAdduser
												.executeQuery(QryTaskMasterRecAdduser);
										int m = 1;
										while (TaskMasterRecAdduser.next()) {
											TaskDescriptionAdduser = TaskMasterRecAdduser
													.getString("tm.Task_Description");
											UTTMappingIdAdduser = TaskMasterRecAdduser
													.getInt("umt.UTT_Mapping_Id");
											TaskIdAdduser = TaskMasterRecAdduser.getInt("tm.Task_ID");
								%>
									<input type="checkbox" name="UUTADDRec<%=m%>"
										id="UUTADDRec<%=m%>" value="<%=UTTMappingIdAdduser%>"
										title="Select Field"
										onclick="return chkBoxCHKRecAdd('<%=m%>');"><%=TaskDescriptionAdduser%><br />
									<div style="padding-left: 20px;">
										<%
 								 	 		int UTTMappingIdAdduserChd = 0;
 								 	 				String TaskDescriptionAdduserChd = null;
 								 	 				int TaskIdAdduserChd = 0;
 								 	 				String QryTaskMasterRecAdduserChd = "";
 								 	 				if (IsSAdmin.equalsIgnoreCase("Yes")) {
 								 	 					QryTaskMasterRecAdduserChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id=1 and tm.Pareent_Task_Id= '"
 								 	 							+ TaskIdAdduser + "'";
 								 	 				} else {
 								 	 					QryTaskMasterRecAdduserChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id  and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
 								 	 							+ USER_AUTOID
 								 	 							+ "' and umt.user_type_id=1 and tm.Pareent_Task_Id= '"
 								 	 							+ TaskIdAdduser + "'";
 								 	 				}
 								 	 				System.out.println("Task master Query:: "
 								 	 						+ QryTaskMasterRecAdduserChd);
 								 	 				Statement stmtTaskMasterRecAdduserChd = null;
 								 	 				ResultSet TaskMasterRecAdduserChd = null;
 								 	 				stmtTaskMasterRecAdduserChd = connection.createStatement();
 								 	 				TaskMasterRecAdduserChd = stmtTaskMasterRecAdduserChd
 								 	 						.executeQuery(QryTaskMasterRecAdduserChd);
 								 	 				int mChd = 1;
 								 	 				while (TaskMasterRecAdduserChd.next()) {
 								 	 					TaskDescriptionAdduserChd = TaskMasterRecAdduserChd
 								 	 							.getString("tm.Task_Description");
 								 	 					UTTMappingIdAdduserChd = TaskMasterRecAdduserChd
 								 	 							.getInt("umt.UTT_Mapping_Id");
 								 	 					TaskIdAdduserChd = TaskMasterRecAdduserChd
 								 	 							.getInt("tm.Task_ID");
 								 	 	%>
										<input type="checkbox" name="UUTADDRec<%=m%>Chd<%=mChd%>"
											id="UUTADDRec<%=m%>Chd<%=mChd%>"
											value="<%=UTTMappingIdAdduserChd%>" title="Select Field"
											disabled="disabled"><%=TaskDescriptionAdduserChd%><br />
										<%
											 	mChd++;
											 			}
											 %>
										<input type="hidden" name="RecCountValueAdduser<%=m%>"
											id="RecCountValueAdduser<%=m%>" value="<%=mChd%>">
									</div>
									<%
								 	m++;
								 		}
								 		System.out.println("Value of m::::" + m);
								 %>
									<input type="hidden" name="RecCountValueAdduser"
										id="RecCountValueAdduser" value="<%=m%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- END OF Add user Check box field for Recruiter part -->

					<!--  Add user Check box field for HROPS part -->
					<td align="left" class="allBackColor" id="HROpsCHKDISPADDUser"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
									int HROps_UTTMappingIdAdduser = 0;
										String HROps_TaskDescriptionAdduser = null;
										int HROps_TaskIdAdduser = 0;
										String QryTaskMasterAdduserHROps = "";
										if (IsSAdmin.equalsIgnoreCase("Yes")) {
											QryTaskMasterAdduserHROps = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id=4 and tm.Pareent_Task_Id=0";
										} else {
											QryTaskMasterAdduserHROps = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
													+ USER_AUTOID
													+ "' and umt.user_type_id=4 and tm.Pareent_Task_Id=0";
										}
										System.out.println("QryTaskMasterAdduserHROps:: "
												+ QryTaskMasterAdduserHROps);
										Statement stmtTaskMasterHROpsAdduser = null;
										ResultSet TaskMasterHROpsAdduser = null;
										stmtTaskMasterHROpsAdduser = connection.createStatement();
										TaskMasterHROpsAdduser = stmtTaskMasterHROpsAdduser
												.executeQuery(QryTaskMasterAdduserHROps);
										int HROps_m = 1;
										while (TaskMasterHROpsAdduser.next()) {
											HROps_TaskDescriptionAdduser = TaskMasterHROpsAdduser
													.getString("tm.Task_Description");
											HROps_UTTMappingIdAdduser = TaskMasterHROpsAdduser
													.getInt("umt.UTT_Mapping_Id");
											HROps_TaskIdAdduser = TaskMasterHROpsAdduser
													.getInt("tm.Task_ID");
								%>
									<input type="checkbox" name="UUTADDHROps<%=HROps_m%>"
										id="UUTADDHROps<%=HROps_m%>"
										value="<%=HROps_UTTMappingIdAdduser%>" title="Select Field"
										onclick="return chkBoxCHKHROpsAdd(<%=HROps_m%>);"><%=HROps_TaskDescriptionAdduser%><br />
									<div style="padding-left: 20px;">
										<%
 								 			int HROps_UTTMappingIdAdduserChd = 0;
 								 					String HROps_TaskDescriptionAdduserChd = null;
 								 					int HROps_TaskIdAdduserChd = 0;
 								 					String QryTaskMasterAdduserHROpsChd = "";
 								 					if (IsSAdmin.equalsIgnoreCase("Yes")) {
 								 						QryTaskMasterAdduserHROpsChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id=4 and tm.Pareent_Task_Id= '"
 								 								+ HROps_TaskIdAdduser + "'";
 								 					} else {
 								 						QryTaskMasterAdduserHROpsChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
 								 								+ USER_AUTOID
 								 								+ "'  and umt.user_type_id=4 and tm.Pareent_Task_Id= '"
 								 								+ HROps_TaskIdAdduser + "'";
 								 					}
 								 					System.out.println("QryTaskMasterAdduserHROpsChd:: "
 								 							+ QryTaskMasterAdduserHROpsChd);
 								 					Statement stmtTaskMasterHROpsAdduserChd = null;
 								 					ResultSet TaskMasterHROpsAdduserChd = null;
 								 					stmtTaskMasterHROpsAdduserChd = connection
 								 							.createStatement();
 								 					TaskMasterHROpsAdduserChd = stmtTaskMasterHROpsAdduserChd
 								 							.executeQuery(QryTaskMasterAdduserHROpsChd);
 								 					int HROps_mChd = 1;
 								 					while (TaskMasterHROpsAdduserChd.next()) {
 								 						HROps_TaskDescriptionAdduserChd = TaskMasterHROpsAdduserChd
 								 								.getString("tm.Task_Description");
 								 						HROps_UTTMappingIdAdduserChd = TaskMasterHROpsAdduserChd
 								 								.getInt("umt.UTT_Mapping_Id");
 								 						HROps_TaskIdAdduserChd = TaskMasterHROpsAdduserChd
 								 								.getInt("tm.Task_ID");
 								 		%>
										<input type="checkbox"
											name="UUTADDHROps<%=HROps_m%>Chd<%=HROps_mChd%>"
											id="UUTADDHROps<%=HROps_m%>Chd<%=HROps_mChd%>"
											value="<%=HROps_UTTMappingIdAdduserChd%>"
											title="Select Field" disabled="disabled"><%=HROps_TaskDescriptionAdduserChd%><br />
										<%
											 	HROps_mChd++;
											 			}
											 %>
										<input type="hidden" name="HROpsCountValueAdduser<%=HROps_m%>"
											id="HROpsCountValueAdduser<%=HROps_m%>"
											value="<%=HROps_mChd%>">
									</div>
									<%
								 	HROps_m++;
								 		}
								 		System.out.println("Value of m::::" + m);
								 %>
									<input type="hidden" name="HROpsCountValueAdduser"
										id="HROpsCountValueAdduser" value="<%=HROps_m%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End OF Add user Check box field for HROPS part -->

					<!--  Add user Check box field for Operations part -->
					<td align="left" class="allBackColor" id="OpsCHKDISPADDUser"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
									int Ops_UTTMappingIdAdduser = 0;
										String Ops_TaskDescriptionAdduser = null;
										int Ops_TaskIdAdduser = 0;
										String QryTaskMasterAdduserOps = "";
										if (IsSAdmin.equalsIgnoreCase("Yes")) {
											QryTaskMasterAdduserOps = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id = 3 and tm.Pareent_Task_Id=0";
										} else {
											QryTaskMasterAdduserOps = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
													+ USER_AUTOID
													+ "' and umt.user_type_id = 3 and tm.Pareent_Task_Id=0";
										}
										System.out.println("QryTaskMasterAdduserOps:: "
												+ QryTaskMasterAdduserOps);
										Statement stmtTaskMasterOpsAdduser = null;
										ResultSet TaskMasterOpsAdduser = null;
										stmtTaskMasterOpsAdduser = connection.createStatement();
										TaskMasterOpsAdduser = stmtTaskMasterOpsAdduser
												.executeQuery(QryTaskMasterAdduserOps);
										int Ops_m = 1;
										while (TaskMasterOpsAdduser.next()) {
											Ops_TaskDescriptionAdduser = TaskMasterOpsAdduser
													.getString("tm.Task_Description");
											Ops_UTTMappingIdAdduser = TaskMasterOpsAdduser
													.getInt("umt.UTT_Mapping_Id");
											Ops_TaskIdAdduser = TaskMasterOpsAdduser
													.getInt("tm.Task_ID");
								%>
									<input type="checkbox" name="UUTADDOps<%=Ops_m%>"
										id="UUTADDOps<%=Ops_m%>" value="<%=Ops_UTTMappingIdAdduser%>"
										title="Select Field"
										onclick="return chkBoxCHKOpsAdd(<%=Ops_m%>);"><%=Ops_TaskDescriptionAdduser%><br />
									<div style="padding-left: 20px;">
										<%
 								 			int Ops_UTTMappingIdAdduserChd = 0;
 								 					String Ops_TaskDescriptionAdduserChd = null;
 								 					int Ops_TaskIdAdduserChd = 0;
 								 					String QryTaskMasterAdduserOpsChd = "";
 								 					if (IsSAdmin.equalsIgnoreCase("Yes")) {
 								 						QryTaskMasterAdduserOpsChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id = 3 and tm.Pareent_Task_Id= '"
 								 								+ Ops_TaskIdAdduser + "'";
 								 					} else {
 								 						QryTaskMasterAdduserOpsChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
 								 								+ USER_AUTOID
 								 								+ "'  and umt.user_type_id = 3 and tm.Pareent_Task_Id= '"
 								 								+ Ops_TaskIdAdduser + "'";
 								 					}
 								 					System.out.println("QryTaskMasterAdduserOpsChd:: "
 								 							+ QryTaskMasterAdduserOpsChd);
 								 					Statement stmtTaskMasterOpsAdduserChd = null;
 								 					ResultSet TaskMasterOpsAdduserChd = null;
 								 					stmtTaskMasterOpsAdduserChd = connection.createStatement();
 								 					TaskMasterOpsAdduserChd = stmtTaskMasterOpsAdduserChd
 								 							.executeQuery(QryTaskMasterAdduserOpsChd);
 								 					int Ops_mChd = 1;
 								 					while (TaskMasterOpsAdduserChd.next()) {
 								 						Ops_TaskDescriptionAdduserChd = TaskMasterOpsAdduserChd
 								 								.getString("tm.Task_Description");
 								 						Ops_UTTMappingIdAdduserChd = TaskMasterOpsAdduserChd
 								 								.getInt("umt.UTT_Mapping_Id");
 								 						Ops_TaskIdAdduserChd = TaskMasterOpsAdduserChd
 								 								.getInt("tm.Task_ID");
 								 		%>
										<input type="checkbox"
											name="UUTADDOps<%=Ops_m%>Chd<%=Ops_mChd%>"
											id="UUTADDOps<%=Ops_m%>Chd<%=Ops_mChd%>"
											value="<%=Ops_UTTMappingIdAdduserChd%>" title="Select Field"
											disabled="disabled"><%=Ops_TaskDescriptionAdduserChd%><br />
										<%
											 	Ops_mChd++;
											 			}
											 %>
										<input type="hidden" name="OpsCountValueAdduser<%=Ops_m%>"
											id="OpsCountValueAdduser<%=Ops_m%>" value="<%=Ops_mChd%>">
									</div>
									<%
								 	Ops_m++;
								 		}
								 		System.out.println("Value of m::::" + m);
								 %>
									<input type="hidden" name="OpsCountValueAdduser"
										id="OpsCountValueAdduser" value="<%=Ops_m%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End OF Add user Check box field for Operations part -->

					<!--  Add user Check box field for Viewer part -->
					<td align="left" class="allBackColor" id="ViewerCHKDISPADDUser"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
									int Viewer_UTTMappingIdAdduser = 0;
										String Viewer_TaskDescriptionAdduser = null;
										int Viewer_TaskIdAdduser = 0;
										String QryTaskMasterAdduserViewer = "";
										if (IsSAdmin.equalsIgnoreCase("Yes")) {
											QryTaskMasterAdduserViewer = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id=5 and tm.Pareent_Task_Id=0";
										} else {
											QryTaskMasterAdduserViewer = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
													+ USER_AUTOID
													+ "' and umt.user_type_id=5 and tm.Pareent_Task_Id=0";
										}
										System.out.println("QryTaskMasterAdduserViewer:: "
												+ QryTaskMasterAdduserViewer);
										Statement stmtTaskMasterViewerAdduser = null;
										ResultSet TaskMasterViewerAdduser = null;
										stmtTaskMasterViewerAdduser = connection.createStatement();
										TaskMasterViewerAdduser = stmtTaskMasterViewerAdduser
												.executeQuery(QryTaskMasterAdduserViewer);
										int Viewer_m = 1;
										while (TaskMasterViewerAdduser.next()) {
											Viewer_TaskDescriptionAdduser = TaskMasterViewerAdduser
													.getString("tm.Task_Description");
											Viewer_UTTMappingIdAdduser = TaskMasterViewerAdduser
													.getInt("umt.UTT_Mapping_Id");
											Viewer_TaskIdAdduser = TaskMasterViewerAdduser
													.getInt("tm.Task_ID");
								%>
									<input type="checkbox" name="UUTADDViewer<%=Viewer_m%>"
										id="UUTADDViewer<%=Viewer_m%>"
										value="<%=Viewer_UTTMappingIdAdduser%>" title="Select Field"
										onclick="return chkBoxCHKViewerAdd(<%=Viewer_m%>);"><%=Viewer_TaskDescriptionAdduser%><br />
									<div style="padding-left: 20px;">
										<%
 								 			int Viewer_UTTMappingIdAdduserChd = 0;
 								 					String Viewer_TaskDescriptionAdduserChd = null;
 								 					int Viewer_TaskIdAdduserChd = 0;
 								 					String QryTaskMasterAdduserViewerChd = "";
 								 					if (IsSAdmin.equalsIgnoreCase("Yes")) {
 								 						QryTaskMasterAdduserViewerChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt where umt.task_id=tm.task_id and umt.user_type_id=5 and tm.Pareent_Task_Id= '"
 								 								+ Viewer_TaskIdAdduser + "'";
 								 					} else {
 								 						QryTaskMasterAdduserViewerChd = "select tm.Task_ID,tm.Task_Description,umt.User_Type_Id,umt.UTT_Mapping_Id from task_master tm,user_type_task_mapping umt,user_utt_mapping uum where umt.task_id=tm.task_id and uum.UTT_Mapping_Id = umt.UTT_Mapping_Id and uum.user_id = '"
 								 								+ USER_AUTOID
 								 								+ "' and umt.user_type_id=5 and tm.Pareent_Task_Id= '"
 								 								+ Viewer_TaskIdAdduser + "'";
 								 					}
 								 					System.out.println("QryTaskMasterAdduserViewerChd:: "
 								 							+ QryTaskMasterAdduserViewerChd);
 								 					Statement stmtTaskMasterViewerAdduserChd = null;
 								 					ResultSet TaskMasterViewerAdduserChd = null;
 								 					stmtTaskMasterViewerAdduserChd = connection
 								 							.createStatement();
 								 					TaskMasterViewerAdduserChd = stmtTaskMasterViewerAdduserChd
 								 							.executeQuery(QryTaskMasterAdduserViewerChd);
 								 					int Viewer_mChd = 1;
 								 					while (TaskMasterViewerAdduserChd.next()) {
 								 						Viewer_TaskDescriptionAdduserChd = TaskMasterViewerAdduserChd
 								 								.getString("tm.Task_Description");
 								 						Viewer_UTTMappingIdAdduserChd = TaskMasterViewerAdduserChd
 								 								.getInt("umt.UTT_Mapping_Id");
 								 						Viewer_TaskIdAdduserChd = TaskMasterViewerAdduserChd
 								 								.getInt("tm.Task_ID");
 								 		%>
										<input type="checkbox"
											name="UUTADDViewer<%=Viewer_m%>Chd<%=Viewer_mChd%>"
											id="UUTADDViewer<%=Viewer_m%>Chd<%=Viewer_mChd%>"
											value="<%=Viewer_UTTMappingIdAdduserChd%>"
											title="Select Field" disabled="disabled"><%=Viewer_TaskDescriptionAdduserChd%><br />
										<%
											 	Viewer_mChd++;
											 			}
											 %>
										<input type="hidden"
											name="ViewerCountValueAdduser<%=Viewer_m%>"
											id="ViewerCountValueAdduser<%=Viewer_m%>"
											value="<%=Viewer_mChd%>">
									</div>
									<%
								 	Viewer_m++;
								 		}
								 		System.out.println("Value of m::::" + m);
								 %>
									<input type="hidden" name="ViewerCountValueAdduser"
										id="ViewerCountValueAdduser" value="<%=Viewer_m%>">
								</td>
							</tr>
						</table>
					</td>
					<!-- End of Add user Check box field for Viewer part -->
				</tr>
				<!--  ***********End of Check box For Add User Field*********8 -->

				<!-- ***************Add user Part::::Operations List Box selection:: -->
				<tr id="OpsListBoxAddDISP" style="display: none;">
					<td rowspan="2" colspan="1" class="allBackColor"
						align="left" style="background-color: #d8d8d8;">
						Program Access
					</td>
				</tr>
				<tr id="OpsListBoxAdd" style="display: none;">
					<td colspan="1">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<select multiple size="10" id="FromLB" name="FromLB"
										style="width: 180px;">
										<%
							   	    String QryListAdd = "";
							   		if (IsSAdmin.equalsIgnoreCase("Yes"))
							   		 {
							   			QryListAdd = "SELECT Program_Id,Program_Name FROM program_names_master where Is_Alive=1 order by Program_Name";
							   		 } 
							   		else
							   		 {
							   			if(User_AllPrgmsAccess == true)
							   			{
							   				QryListAdd = "SELECT Program_Id,Program_Name FROM program_names_master where Is_Alive=1 order by Program_Name";
							   			}
							   			else
							   			{
							   				QryListAdd = "  SELECT pnm.Program_Id AS Program_Id,Program_Name FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND upm.user_id = '"+ USER_AUTOID+ "' AND Is_Alive=1 ORDER BY Program_Name";
							   			}
							   		}
							   		//String QryListAdd = "SELECT Program_Id,Program_Name FROM program_names_master where Is_Alive=1 order by Program_Name";
							   		//String QryListAdd = "  SELECT pnm.Program_Id AS Program_Id,Program_Name FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND upm.user_id = '"+USER_AUTOID+"' AND Is_Alive=1 ORDER BY Program_Name";
							   		System.out.println("query " + secQsnQry);
							   		Statement stmtprogramListAdd = connection.createStatement();
							   		ResultSet rsprogramListAdd = stmtprogramListAdd
							   				.executeQuery(QryListAdd);
							   		while (rsprogramListAdd.next()) {
							   %>
										<option value="<%=rsprogramListAdd.getString("Program_Id")%>"><%=rsprogramListAdd.getString("Program_Name")%></option>
										<%
									}
								%>
									</select>
								</td>
								<td align="center" valign="middle">
									<input type="button" id="FromLeftRight"
										onClick="move(this.form.FromLB,this.form.ToLB)"
										value="<%=Forward%>" style="-moz-border-radius: none;">
									<br />
									<input type="button" id="FromRightLeft"
										onClick="move(this.form.ToLB,this.form.FromLB)"
										value="<%=Backward%>" style="-moz-border-radius: none;">
								</td>
								<td>
									<select multiple="multiple" size="10" name="ToLB" id="ToLB"
										style="width: 140px;">
									</select>
								</td>
							</tr>
							<%
		         	if (IsSAdmin.equalsIgnoreCase("Yes")) {
		         %>
							<tr>
								<td height="10">
								</td>
							</tr>
							<tr>
								<td class="allBackColor" colspan="3">
									<input type="checkbox" name="accessToProgramAdd"
										id="accessToProgramAdd" value="0"
										onclick="return adminChkProgramsAdd();">
									&nbsp;Access to all programs
								</td>
							</tr>
							<%
		         		}
		         	%>
						</table>
					</td>
				</tr>
				<!-- ***************End of Add user Part::::Operations List Box selection:: -->

				<!-- -***************Operations Initial display****** -->
				<%
        		if (UserTypeId.equalsIgnoreCase("3")) {
        	%>
				<tr id="OpsPrgmAcssDISP">
					<td align="left" colspan="1" class="allBackColor" align="left"
						style="background-color: #d8d8d8;">
						Program Access
					</td>
					<td align="left" colspan="1" class="allBackColor" align="left">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="left" class="allBackColor">
									<%
							  	String OpsProgramName = null;
							  			int kOps = 1;
							  			int countOpsDISP = 0;
							  			if (allprgmsState == true) {
							  %>
									All Programs
									<%
							  	} else {
							  				String QueryCountOPSDISP = "select count(Program_Name) as count from program_names_master where program_id in(select Program_id from user_program_mapping where User_id='"
							  						+ EmpUserAutoId
							  						+ "') and Is_Alive=1 order by Program_Name";
							  				System.out
							  						.println("Selection Query QueryCountOPSDISP:: "
							  								+ QueryCountOPSDISP);
							  				Statement stmtCountOpsISP = connection
							  						.createStatement();
							  				ResultSet rscountOps = stmtCountOpsISP
							  						.executeQuery(QueryCountOPSDISP);
							  				if (rscountOps.next()) {
							  					countOpsDISP = rscountOps.getInt("count");
							  					System.out
							  							.println("Selection Query countOpsDISP:: "
							  									+ countOpsDISP);
							  				}
							  				rscountOps.close();
							  				stmtCountOpsISP.close();

							  				String QueryOPSDISP = "";
							  				if (IsSAdmin.equalsIgnoreCase("Yes"))
							  				 {
							  					QueryOPSDISP = "select Program_Name from program_names_master where program_id in(select Program_id from user_program_mapping where User_id = '"+ EmpUserAutoId+ "') and Is_Alive=1 order by Program_Name";
							  				 } 
							  				 else 
							  				{
							  					if(User_AllPrgmsAccess == true)
							  					{
							  						QueryOPSDISP = "select Program_Name from program_names_master where program_id in(select Program_id from user_program_mapping where User_id='"+EmpUserAutoId+"') and Is_Alive=1 order by Program_Name";
							  					}
							  					else
							  					{
							  						QueryOPSDISP = "SELECT Program_Name FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+ USER_AUTOID+ "') logedin JOIN  (SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ EmpUserAutoId+ "') sel ON logedin.program_id = sel.program_id ORDER BY Program_Name";
							  					}
							  				}
							  				//String QueryOPSDISP = "select Program_Name from program_names_master where program_id in(select Program_id from user_program_mapping where User_id='"+EmpUserAutoId+"') and Is_Alive=1 order by Program_Name";
							  				//String QueryOPSDISP= "SELECT Program_Name FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+USER_AUTOID+"') logedin JOIN  (SELECT Program_id FROM user_program_mapping WHERE User_id = '"+EmpUserAutoId+"') sel ON logedin.program_id = sel.program_id ORDER BY Program_Name";
							  				System.out.println("Selection Query:: " + QueryOPSDISP);
							  				Statement stmtOpsISP = connection.createStatement();
							  				ResultSet OpsDISP = stmtOpsISP.executeQuery(QueryOPSDISP);
							  				while (OpsDISP.next()) {
							  					OpsProgramName = OpsDISP.getString("Program_Name");
							  %>
									<div>
										<%=kOps%>.
										<%=OpsProgramName%>
									</div>
									<%
							 	kOps++;
							 				}
							 				if (countOpsDISP == 0) {
							 %>
									No Programs mapped
									<%
							 	} else if (kOps == 1) {
							 %>
									None of your programs mapped
									<%
							 	}
							 			}
							 %>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<%
        	}
        %>
				<!-- -***************Operations Initial display****** -->
				<!-- ***************Edit user Part::::Operations List Box selection:: -->
				<tr id="OpsListBoxEditDISP" style="display: none;">
					<td align="left" rowspan="2" colspan="1" class="allBackColor"
						align="left" style="background-color: #d8d8d8;">
						Program Access
					</td>
				</tr>
				<tr id="OpsListBoxEdit" style="display: none;">
					<td colspan="1">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<select multiple size="10" id="FromLB1" name="FromLB1"
										style="width: 180px;">
										<%
								   	String QryListEdit = "";
								   		if (IsSAdmin.equalsIgnoreCase("Yes")) 
								   		{
								   			QryListEdit = "select Program_Name,Program_Id from program_names_master where program_id not in (select Program_id from user_program_mapping where User_id='"+ EmpUserAutoId+ "') and Is_Alive=1 order by Program_Name";
								   		} else 
								   		{
								   			if(User_AllPrgmsAccess == true)
								   			{
								   				QryListEdit = "select Program_Name,Program_Id from program_names_master where program_id not in (select Program_id from user_program_mapping where User_id='"+EmpUserAutoId+"') and Is_Alive=1 order by Program_Name";
								   			}
								   			else
								   			{
								   				QryListEdit = "SELECT logedin.Program_id AS Program_id,logedin.program_name AS Program_Name FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+ USER_AUTOID+ "') logedin LEFT JOIN (SELECT maspgm.Program_id,maspgm.Program_Name FROM user_program_mapping pgmmap JOIN program_names_master maspgm ON pgmmap.Program_id = maspgm.Program_id WHERE pgmmap.User_id = '"+ EmpUserAutoId+ "') sel ON logedin.program_id = sel.program_id WHERE  sel.program_id IS NULL ORDER BY logedin.Program_Name";
								   			}
								   		}
								   		//String QryListEdit = "select Program_Name,Program_Id from program_names_master where program_id not in (select Program_id from user_program_mapping where User_id='"+EmpUserAutoId+"') and Is_Alive=1 order by Program_Name";
								   		//String QryListEdit = "SELECT logedin.Program_id AS Program_id,logedin.program_name AS Program_Name FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+USER_AUTOID+"') logedin LEFT JOIN (SELECT maspgm.Program_id,maspgm.Program_Name FROM user_program_mapping pgmmap JOIN program_names_master maspgm ON pgmmap.Program_id = maspgm.Program_id WHERE pgmmap.User_id = '"+EmpUserAutoId+"') sel ON logedin.program_id = sel.program_id WHERE  sel.program_id IS NULL ORDER BY logedin.Program_Name";
								   		System.out.println("Edit Ops Query fo Progs::: " + QryListEdit);
								   		Statement stmtprogramListEdit = connection.createStatement();
								   		ResultSet rsprogramListEdit = stmtprogramListEdit
								   				.executeQuery(QryListEdit);
								   		while (rsprogramListEdit.next()) {
								   %>
										<option value="<%=rsprogramListEdit.getString("Program_Id")%>"><%=rsprogramListEdit.getString("Program_Name")%></option>
										<%
										}
									%>
									</select>
								</td>
								<td align="center" valign="middle">
									<input type="button" id="FromLeft2Right" name="FromLeft2Right"
										onClick="move(this.form.FromLB1,this.form.ToLB1)"
										value="<%=Forward%>" style="-moz-border-radius: none;">
									<br />
									<input type="button" id="FromRight2Left" name="FromRight2Left"
										onClick="move(this.form.ToLB1,this.form.FromLB1)"
										value="<%=Backward%>" style="-moz-border-radius: none;">
								</td>
								<td>
									<select multiple="multiple" size="10" name="ToLB1" id="ToLB1"
										style="width: 140px;">
										<%
								String QryListEditSelected = "";
									if (IsSAdmin.equalsIgnoreCase("Yes"))
									 {
										QryListEditSelected = "select Program_Name,Program_Id from program_names_master where program_id in (select Program_id from user_program_mapping where User_id='"+ EmpUserAutoId+ "') and Is_Alive=1 order by Program_Name";
									 }
								  	else
								  	{
										if(User_AllPrgmsAccess == true)
										{
											QryListEditSelected = "select Program_Name,Program_Id from program_names_master where program_id in (select Program_id from user_program_mapping where User_id='"+EmpUserAutoId+"') and Is_Alive=1 order by Program_Name";
										}
										else
										{
											QryListEditSelected = "SELECT Program_Name,logedin.Program_id AS Program_id FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+ USER_AUTOID+ "') logedin JOIN (SELECT Program_id FROM user_program_mapping WHERE User_id = '"+ EmpUserAutoId+ "') sel ON logedin.program_id = sel.program_id ORDER BY Program_Name";
										}
									}
									//String QryListEditSelected = "select Program_Name,Program_Id from program_names_master where program_id in (select Program_id from user_program_mapping where User_id='"+EmpUserAutoId+"') and Is_Alive=1 order by Program_Name";
									//String QryListEditSelected = "SELECT Program_Name,logedin.Program_id AS Program_id FROM (SELECT Program_Name,pnm.Program_id FROM program_names_master pnm,user_program_mapping upm WHERE upm.Program_id = pnm.Program_id AND Is_Alive=1 AND upm.user_id = '"+USER_AUTOID+"') logedin JOIN (SELECT Program_id FROM user_program_mapping WHERE User_id = '"+EmpUserAutoId+"') sel ON logedin.program_id = sel.program_id ORDER BY Program_Name";
									System.out.println("Edit Ops Query fo Progs::: "
											+ QryListEditSelected);
									Statement stmtprogramListEditSelected = connection
											.createStatement();
									ResultSet rsprogramListEditSelected = stmtprogramListEditSelected
											.executeQuery(QryListEditSelected);
									while (rsprogramListEditSelected.next()) {
							%>
										<option
											value="<%=rsprogramListEditSelected
											.getString("Program_Id")%>"
											selected="selected"><%=rsprogramListEditSelected
									.getString("Program_Name")%></option>
										<%
										}
									%>
									</select>
								</td>
							</tr>
							<%
		         		if (IsSAdmin.equalsIgnoreCase("Yes")) {
		         	%>
							<tr>
								<td height="10">
								</td>
							</tr>
							<tr>
								<td class="allBackColor" colspan="3">
									<%
		         				if (allprgmsState == true) {
		         			%>
									<input type="checkbox" name="accessToProgram"
										id="accessToProgram" value="0"
										onclick="return adminChkPrograms();" checked="checked">
									&nbsp;Access to all programs
									<%
		         				} else {
		         			%>
									<input type="checkbox" name="accessToProgram"
										id="accessToProgram" value="0"
										onclick="return adminChkPrograms();">
									&nbsp;Access to all programs
									<%
		         			 	}
		         			 %>
								</td>
							</tr>
							<%
		         		}
		         	%>
						</table>
					</td>
				</tr>
				<!-- ***************End of Edit user Part::::Operations List Box selection:: -->

				<tr id="AddEditDelete">
					<td colspan="2" align="center">
						<input type="button" name="submitadd" id="submitadd" value="Add"
							class="buttonSmall" onclick="javascript:AddUser();" />
						&nbsp;&nbsp;
						<input type="button" name="submitedit" id="submitedit"
							value="Edit" class="buttonSmall" onclick="javascript:edituser();" />
						&nbsp;&nbsp;
						<input type="button" name="submitdelete" id="submitdelete"
							value="Delete" class="buttonSmall"
							onclick="javascript:deleteuser();" />
						&nbsp;&nbsp;
					</td>
				</tr>
				<tr id="deleteCommentsDISP" style="display: none;">
					<td class="allBackColor" align="left"
						style="background-color: #d8d8d8;" colspan="1">
						Delete Reason
						<br>
					</td>
					<td colspan="1" class="allBackColor">
						<input type="text" size="40" id="deleteCommentstxt"
							name="deleteCommentstxt" title="Delete Reason" class="wmta"
							onblur="Blur(this.id,'Enter Delete Reason')"
							onfocus="Focus(this.id,'Enter Delete Reason')"
							value="Enter Delete Reason" maxlength="150" oncopy="return false"
							onpaste="return false" oncut="return false"
							onkeypress="return AllowChars(event);" />
						<input type="hidden" name="UserTypeIdInitial" id="UserTypeIdInitial" value="<%=UserTypeId%>" />
						<input type="hidden" name="Empid" id="Empid" value="<%=EmpUserId%>" />
						<input type="hidden" name="UserTypeIdInitial" id="UserTypeIdInitial" value="<%=UserTypeId%>" />
						<input type="hidden" name="Empid" id="Empid" value="<%=EmpUserId%>" />
						<input type="hidden" name="ActionType" id="ActionType" value="" />
						<input type="hidden" name="IsSAdmin" id="IsSAdmin" value="<%=IsSAdmin%>" />
						<input type="hidden" name="IsAllprograms" id="IsAllprograms" value="<%=allprgmsState%>" />
						<input type="hidden" name="User_AllPrgmsAccess" id="User_AllPrgmsAccess" value="<%=User_AllPrgmsAccess%>" />
						<br>
					</td>
				</tr>
				<tr id="editpartButtonDisp" style="display: none;">
					<td colspan="2" align="center">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="right">
									<input id="cancelbutton" class="buttonSmall" type="reset" onclick="return enableOldViewEdit();" value="Cancel" name="cancelbutton">
								</td>
								<td style="width: 15px;">
									&nbsp;
								</td>
								<td align="left">
									<input type="submit" name="submit" id="submit" value="Submit" class="buttonSmall" onclick="selectProgramsedit(this.form.ToLB1);return submitEditUser(this.form);" />
									&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="deletepartButtonDisp" style="display: none;">
					<td colspan="2" align="center">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="right">
									<input id="cancelbutton" class="buttonSmall" type="reset"
										onclick="return enableOldViewDelete();" value="Cancel"
										name="cancelbutton">
								</td>
								<td style="width: 15px;">
									&nbsp;
								</td>
								<td align="left">
									<input type="button" name="deletesubmit" id="deletesubmit"
										value="Submit" class="buttonSmall"
										onclick="javascript:submitdeleteUser();" />
									&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id="addpartButtonDisp" style="display: none;">
					<td colspan="2" align="center">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td align="right">
									<input id="cancelbutton" class="buttonSmall" type="reset"
										onclick="return enableOldViewAdd();" value="Cancel"
										name="cancelbutton">
								</td>
								<td style="width: 15px;">
									&nbsp;
								</td>
								<td align="left">
									<input type="submit" name="finalsubmit" id="finalsubmit"
										value="Submit" class="buttonSmall"
										onclick="selectPrograms(this.form.ToLB);return ValidationAddedUser(this.form);" />
									&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<span id="processing" style="display: none;"><b><font
								color="#000033"
								style="font-size: 12px; font-family: Arial, Helvetica, sans-serif;"
								class="taL">Processing, please wait...</font>
						</b>
						</span>
					</td>
				</tr>
			</table>
			<%
  			rs.close();
  				stmt.close();
  				connection.close();
  			}
  		%>
		</form>
	</body>
</html>
