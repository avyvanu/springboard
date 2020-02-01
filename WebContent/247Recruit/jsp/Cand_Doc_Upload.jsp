<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
  	Connection connection = null;
  	String USER_ID = null;
  	String UserTypeId = (String)session.getAttribute("User_Type_Id");
  	System.out.println("UserTypeId:::::::"+UserTypeId);
  	if(UserTypeId == null)
  	{
	  	USER_ID = (String)session.getAttribute("USER_ID");
  	}
  	else
  	{
	  	USER_ID = (String)session.getAttribute("Bpo_Cand_Id");
  	}
  	System.out.println("USER_ID:::::::cand_doc_upload"+USER_ID);
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
  	System.out.println("USER_Name:::::::cand_doc_upload"+USER_Name);
  	if(USER_ID == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
  	if(USER_Name == null)
  	{
  		USER_Name = "";
  	}
  	int IsResumeUpload = 0;
  	String query="select * from bpo_candidatesreg_details where Bpo_Cand_Id='" + USER_ID + "'"; 
    connection=ConnectDatabase.getConnection();		
	Statement stmt=connection.createStatement();
	ResultSet rs=stmt.executeQuery(query);
	if(rs.next())
  	{
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		Date dateStr = rs.getDate("System_Date_Time");
  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
    	String DOR = formatter.format(dateStr);  
		String canId=rs.getString("Bpo_Cand_Id");
		session.setAttribute("Bpo_Cand_Id",canId);
		IsResumeUpload = rs.getInt("IsResumeUpload");
		System.out.println("IsResumeUpload::::"+IsResumeUpload);
		String Work_Experience=rs.getString("Work_Experience");
		System.out.println("Work_Experience::::"+Work_Experience);
		session.setAttribute("WorkExperience",Work_Experience);
		String queryFOR_getDOCS = "";
		ResultSet rsDocs  = null;
		Statement stDocs = null;
		CallableStatement csDocs=null;
	    session.setAttribute( "page", "FileUploadUI.jsp" );	
	    //******************Getting the Candidate Document Details**************//
  		    String resumeD = "";
			String resumeID = "";
			String resumeOtherDetails = "";
			String idProofD = "";
			String AddressProofD = "";
			String BirthProofFileNAME = "";	
			String EducationProofD = "";
			String EmploymentProofD = "";
			String EmploymentProof2D = "";
			String EmploymentProof3D = "";
			String SlipProofD = "";
			String IDProofID="";
		    String IDProofOtherDetails="";
			String AddressProofID="";
			String AddressProofOtherDetails="";
			String BirthProofID="";
			String BirthProofOtherDetails="";
			String EducationProofID="";
			String EducationProofOtherDetails="";
			String EmploymentProofID="";
			String EmploymentProofOtherDetails="";
			String EmploymentProof2ID="";
			String EmploymentProof2OtherDetails="";
			String EmploymentProof3ID="";
			String EmploymentProof3OtherDetails="";
			String SlipProofID="";
			String SlipProofOtherDetails="";
			Blob CanResume_FileData = null;
			Blob IDProof_DATA = null;
			Blob AddressProof_DATA = null;
			Blob BirthProof_DATA = null;
			Blob EducationProof_DATA = null;
			Blob EmploymentProof_Data = null;
			Blob EmploymentProof2_Data = null;
			Blob EmploymentProof3_Data = null;
			Blob SlipProof_Data = null;
  		    
  		    String IsCanResume = "0";
  		    String IsID = "0";
  		    String IsAddress = "0";
  		    String IsBirth = "0";
  		    String IsEducation = "0";
  		    String IsEmployment = "0";
  		    String IsEmployment2 = "0";
  		    String IsEmployment3 = "0";
  		    String IsSlip = "0";
  		    stDocs= connection.createStatement();
		    queryFOR_getDOCS="{call BpoCandDocs_Encrypt_Proc(?,?,?)}"; //your procedure name
		    csDocs=connection.prepareCall(queryFOR_getDOCS);
		    csDocs.setString(1,canId);
            csDocs.setString(2,EDKey);
            csDocs.setString(3,EDKPass);
		    rsDocs=csDocs.executeQuery();
        	if(rsDocs.next())
        	{
	       		IsCanResume = rsDocs.getString("IsCanResume");
	       		System.out.println("IsCanResume"+IsCanResume);
	       		if(IsCanResume == null)
	       		{
	       		IsCanResume = "0";
	       		}
	       		IsID = rsDocs.getString("IsID");
	       		if(IsID == null)
	       		{
	       		IsID = "0";
	       		}
	  		    IsAddress = rsDocs.getString("IsAddress");
	  		    if(IsAddress == null)
	       		{
	       		IsAddress = "0";
	       		}
	  		    IsBirth = rsDocs.getString("IsBirth");
	  		    if(IsBirth == null)
	       		{
	       		IsBirth = "0";
	       		}
	  		    IsEducation = rsDocs.getString("IsEducation");
	  		    if(IsEducation == null)
	       		{
	       		IsEducation = "0";
	       		}
	  		    IsEmployment = rsDocs.getString("IsEmployment");
	  		    if(IsEmployment == null)
	       		{
	       		IsEmployment = "0";
	       		}
	  		    IsEmployment2 = rsDocs.getString("IsEmployment2");
	  		    if(IsEmployment2 == null)
	       		{
	       		IsEmployment2 = "0";
	       		}
	  		    IsEmployment3 = rsDocs.getString("IsEmployment3");
	  		     if(IsEmployment3 == null)
	       		{
	       		IsEmployment3 = "0";
	       		}
	  		    IsSlip = rsDocs.getString("IsSlip");
	  		    if(IsSlip == null)
	       		{
	       		IsSlip = "0";
	       		}
        		resumeID = rsDocs.getString("CanResume");
        		System.out.println("resumeID"+resumeID);
        		if(resumeID == null)
        		{
        		resumeID = "";
        		}
		      	resumeOtherDetails = rsDocs.getString("CanResume_OtherDetails");
		      	resumeD = rsDocs.getString("CanResume_FileName");
		      	if(resumeD == null)
		      	{
		      	resumeD = "Not Uploaded";
		      	}
		      	System.out.println("resumeD"+resumeD);
		      	CanResume_FileData   = rsDocs.getBlob("CanResume_FileData");
        		System.out.println("CanResume_FileData ::::"+CanResume_FileData );
		      	IDProofID=(String)rsDocs.getString("IDProof");
        		if(IDProofID == null)
        		{
        		IDProofID = "";
        		}
        		System.out.println("IDProofID::"+IDProofID);
        		IDProofOtherDetails=(String)rsDocs.getString("IDProof_OtherDetails");
        		System.out.println("IDProofOtherDetails"+IDProofOtherDetails);
        		idProofD = rsDocs.getString("IDProof_FileName");
        		if(idProofD == null)
		      	{
		      	idProofD = "Not Uploaded";
		      	}
        		System.out.println("idProofD::::"+idProofD);
        		IDProof_DATA  = rsDocs.getBlob("IDProof_DATA");
        		System.out.println("IDProof_DATA::::"+IDProof_DATA);
        		AddressProofID=(String)rsDocs.getString("AddressProof");
        		if(AddressProofID == null)
        		{
        		AddressProofID = "";
        		}
        		System.out.println("AddressProofID"+AddressProofID);
        		AddressProofOtherDetails=(String)rsDocs.getString("AddressProof_OtherDetails");
        		System.out.println("AddressProofOtherDetails"+AddressProofOtherDetails);
        		AddressProof_DATA   = rsDocs.getBlob("AddressProof_DATA");
        		System.out.println("AddressProof_DATA ::::"+AddressProof_DATA );
        		AddressProofD = rsDocs.getString("AddressProof_FileName");
        		if(AddressProofD == null)
		      	{
		      	AddressProofD = "Not Uploaded";
		      	}
        		BirthProofID=(String)rsDocs.getString("BirthProof");
        		System.out.println("BirthProofID"+BirthProofID);
        		if(BirthProofID == null)
        		{
        		BirthProofID = "";
        		}
        		BirthProofOtherDetails=(String)rsDocs.getString("BirthProof_OtherDetails");
        		System.out.println("BirthProofOtherDetails"+BirthProofOtherDetails);
        		BirthProofFileNAME = rsDocs.getString("BirthProof_FileName");
        		if(BirthProofFileNAME == null)
		      	{
		      	BirthProofFileNAME = "Not Uploaded";
		      	}
        		BirthProof_DATA   = rsDocs.getBlob("BirthProof_DATA");
        		System.out.println("BirthProof_DATA ::::"+BirthProof_DATA );
        		EducationProofID=(String)rsDocs.getString("EducationProof");
        		if(EducationProofID == null)
        		{
        		EducationProofID = "";
        		}
        		System.out.println("EducationProofID"+EducationProofID);
        		EducationProofOtherDetails=(String)rsDocs.getString("EducationProof_OtherDetails");
        		System.out.println("EducationProofOtherDetails"+EducationProofOtherDetails);
        		EducationProofD = rsDocs.getString("EducationProof_FileName");
        		if(EducationProofD == null)
		      	{
		      	EducationProofD = "Not Uploaded";
		      	}
        		EducationProof_DATA  = rsDocs.getBlob("EducationProof_DATA");
        		System.out.println("EducationProof_DATA ::::"+EducationProof_DATA );
        		EmploymentProof_Data  = rsDocs.getBlob("EmploymentProof_Data");
        		System.out.println("EmploymentProof_Data ::::"+EmploymentProof_Data );
        		EmploymentProof2_Data  = rsDocs.getBlob("EmploymentProof2_Data");
        		System.out.println("EmploymentProof2_Data ::::"+EmploymentProof2_Data );
        		EmploymentProof3_Data  = rsDocs.getBlob("EmploymentProof3_Data");
        		System.out.println("EmploymentProof3_Data ::::"+EmploymentProof3_Data );
        		SlipProof_Data  = rsDocs.getBlob("SlipProof_Data");
        		System.out.println("SlipProof_Data ::::"+SlipProof_Data );
        		EmploymentProofID=(String)rsDocs.getString("EmploymentProof");
        		EmploymentProofD = rsDocs.getString("EmploymentProof_FileName");
        		if(EmploymentProofD == null)
		      	{
		      	EmploymentProofD = "Not Uploaded";
		      	}
				EmploymentProof2D = rsDocs.getString("EmploymentProof2_FileName");
				if(EmploymentProof2D == null)
		      	{
		      	EmploymentProof2D = "Not Uploaded";
		      	}
				EmploymentProof3D = rsDocs.getString("EmploymentProof3_FileName");
				if(EmploymentProof3D == null)
		      	{
		      	EmploymentProof3D = "Not Uploaded";
		      	}
				SlipProofD = rsDocs.getString("SlipProof_FileName");
        		if(SlipProofD == null)
		      	{
		      	SlipProofD = "Not Uploaded";
		      	}
        		if(EmploymentProofID==null)
        		{
        		EmploymentProofID="";
        		}
        		System.out.println("EmploymentProofID"+EmploymentProofID);
        		EmploymentProofOtherDetails=(String)rsDocs.getString("EmplymntPrf_OtherDetails");
        		if(EmploymentProofOtherDetails==null)
        		{
        		EmploymentProofOtherDetails="";
        		}
        		System.out.println("EmploymentProofOtherDetails"+EmploymentProofOtherDetails);
        		EmploymentProof2ID=(String)rsDocs.getString("EmploymentProof2");
        		if(EmploymentProof2ID==null)
        		{
        		EmploymentProof2ID="";
        		}
        		System.out.println("EmploymentProof2ID"+EmploymentProof2ID);
        		EmploymentProof2OtherDetails=(String)rsDocs.getString("EmplymntPrf2_OtherDetails");
        		if(EmploymentProof2OtherDetails==null)
        		{
        		EmploymentProof2OtherDetails="";
        		}
        		System.out.println("EmploymentProof2OtherDetails"+EmploymentProof2OtherDetails);
        		EmploymentProof3ID=(String)rsDocs.getString("EmploymentProof3");
        		if(EmploymentProof3ID==null)
        		{
        		EmploymentProof3ID="";
        		}
        		System.out.println("EmploymentProof3ID"+EmploymentProof3ID);
        		EmploymentProof3OtherDetails=(String)rsDocs.getString("EmplymntPrf3_OtherDetails");
        		if(EmploymentProof3OtherDetails==null)
        		{
        		EmploymentProof3OtherDetails="";
        		}
        		System.out.println("EmploymentProof3OtherDetails"+EmploymentProof3OtherDetails);
        		SlipProofID=(String)rsDocs.getString("SlipProof");
        		if(SlipProofID==null)
        		{
        		SlipProofID="";
        		}
        		System.out.println("SlipProofID"+SlipProofID);
        		SlipProofOtherDetails=(String)rsDocs.getString("SlipProof_OtherDetails");
        		if(SlipProofOtherDetails==null)
        		{
        		SlipProofOtherDetails="";
        		}
        		System.out.println("SlipProofOtherDetails"+SlipProofOtherDetails);
        		System.out.println( resumeD+" >> "+idProofD+"  >>>  "+AddressProofD+" >>>>> "+BirthProofFileNAME+" >>>>>> "+EducationProofD+" >>>>> "+EmploymentProofD+" >>> "+EmploymentProof2D+" >>>> "+EmploymentProof3D+"  >>>>> "+ SlipProofD);
        	}
  		//******************End of Getting the Candidate Document Details**************//
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
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<style type="text/css">
	.resizeSelect
	{
		width:150px;
	}
	
	</style>
	
	<!-- Start Java script for Test Fields Blur Data -->
	<script type="text/javascript">
		function ReFocus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmta"; } } function Focus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "nta"; } } function Blur(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmta"; } else { obj.className = "nta"; } } function ReFocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmtr"; } } function FocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "ntr"; } } function BlurR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmtr"; } else { obj.className = "ntr"; } }
	</script>
	
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

	<!-- Script For document selection Change -->
	<script type="text/javascript">
	function ShowDoc(docID)
	{
	  docID = docID - 1;
	  var urlDocs = "<%=request.getContextPath()%>/247Recruit/jsp/UploadedDocument.jsp?CIDrec=<%=canId%>&DocumentID="+docID;	
	  someWindow = window.open(urlDocs,'ReasonWindow','height=600,width=800,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>
	
	<!-- Changing the Selected Row color in table -->
	<script type="text/javascript" language="javascript">
	 
	  function docUploadDone(TypeId)
	  {
	      var uploadDone = document.getElementById('docUpload'+6).value
		  if(uploadDone == 0)
		  {
			  alert("Please Check/Re upload the Experience 1 proof File !"); 
			  ChangeColor(document.getElementById(6), 6)
			  return false;
		  }
		  else if(TypeId == 8)
		  {
	      uploadDone = document.getElementById('docUpload'+7).value
			  if(uploadDone == 0)
			  {
				  alert("Please Check/Re upload the Experience 2 proof File !"); 
				  ChangeColor(document.getElementById(7), 7)
				  return false;
			  }
	      }
	  }
	  
	  function checkResumeUpload(TypeId)
	  {
	  	if(TypeId == 1)
	  	{
	  		if(document.getElementById("IsResumeUpload").value == 1)
	  		{
	  			alert("Already uploaded using resume upload option !");
	  			return false;
	  		} 
	  		else
	  		{
	  			ChangeColor(document.getElementById(TypeId),TypeId);
	  		}
	  	}
	  	else
	  	{
	  		ChangeColor(document.getElementById(TypeId),TypeId);
	  	}
	  }
	  
	  function checkResumeUploadDD()
	  {
	  	var TypeId = document.getElementById("documentsTypesId").value;
	  	if(TypeId == 1)
	  	{
	  		if(document.getElementById("IsResumeUpload").value == 1)
	  		{
	  			alert("Already uploaded using resume upload option !");
	  			document.getElementById("documentsTypesId").selectedIndex = 0;
	  			return false;
	  		} 
	  		else
	  		{
	  			getDocsListDD();
	  		}
	  	}
	  	else
	  	{
	  		getDocsListDD();
	  	}
	  }
	  
	  function ChangeColor(tableRow, TypeId)
	    {
	    	//alert("vaule into change color");
	    	document.getElementById('documentsTypesId').value = TypeId;
	    	document.getElementById("docTypeId").value = TypeId; 
	    	document.getElementById('txtIDLDISP').style.display="none";
	    	var iVal = document.getElementById("iValHid").value;
	    	var trRow;
	    	var i=1;
	    	for (i=1; i<iVal;i++)
	    	{
	    		trRow = document.getElementById(i);
	    		trRow.style.backgroundColor = '#F2F2F2';
	    	}
	    	tableRow.style.backgroundColor = '#C7C3DD';
		    if((TypeId == 7) || (TypeId == 8))
		    {
		    docUploadDone(TypeId);
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
		 function getDocsList()
         {
          document.getElementById("selDocument").disabled=false;
		  getDocs();
         }
        function getDocsListDD()
         {
          document.getElementById("selDocument").disabled=false;
		  getDocsDD();
         }
		function getDocs()	
		{	
			var cp=document.getElementById("docTypeId").value;
			if (cp != "")
			{
			    var url="<%=request.getContextPath()%>/247Recruit/jsp/DocumentList.jsp";	    
				url=url+"?sid="+Math.random();
				url=url+"&TypeId="+cp; 
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
			 document.getElementById('selDocument').options.length = 0;	
		     arry[0] = document.createElement('option');  
			 arry[0].text = '-- Select Document --';
			 arry[0].value ='0';
			 document.getElementById('selDocument').options[0]= arry[0];	
			}        
		}
    function getDocsDD()	
		{	
			
			var docTypeSelectedIndex = document.getElementById("documentsTypesId").selectedIndex;
			var docTpId = document.getElementById("documentsTypesId").value;
			document.getElementById("docTypeId").value = docTpId;
			var cp=document.getElementById("documentsTypesId").value;
			if (cp != "")
			{
			    
			    var url="<%=request.getContextPath()%>/247Recruit/jsp/DocumentList.jsp";	    
				url=url+"?sid="+Math.random();
				url=url+"&TypeId="+cp; 
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
			 document.getElementById('selDocument').options.length = 0;	
		     arry[0] = document.createElement('option');  
			 arry[0].text = '-- Select Document --';
			 arry[0].value ='0';
			 document.getElementById('selDocument').options[0]= arry[0];	
			} 
			ChangeColor(document.getElementById(docTypeSelectedIndex), docTpId);       
		}
    
	function chargeCodeSelected(request)
	{	
	  if(request.readyState==4 && request.status==200)
		{
			var data = request.responseText;
			idata=data.split(",");
			var arry = new Array(idata.length+1);
			var i = 0;
			document.getElementById('selDocument').options.length = 0;
			arry[i] = document.createElement('option');  
			arry[i].text = '-- Select Document --';
			arry[i].value ='select';
			document.getElementById('selDocument').options[i]= arry[i];	
			for(i=1;i<idata.length;i++)
			{
				fenName = idata[i-1].split(":");
				arry[i] = document.createElement('option');  
				arry[i].text = fenName[1].trim();
				arry[i].value = fenName[0].trim();
				document.getElementById('selDocument').options[i]= arry[i];	
			}
			arry[i] = document.createElement('option');  
			arry[i].text = 'Other';
			arry[i].value ='Other';
			document.getElementById('selDocument').options[i]= arry[i];	
		}
	}
   </script>
		<!-- End of Script For document selection Change -->
	
<style type="text/css">
	.wmta
	{       		 
		color:gray;       		
	}
	.wmtr
	{       		 
		color:black;       		
	}
	.nta
	{
		color: black;
	}	
</style>
	<!-- End Javascript for Test Fiels Blur Data -->
	
	<script type="text/javascript" language="JavaScript">
	function check(FinalCheckForm) 
	{
	  
       	  <%if(CanResume_FileData == null) 
       	    {
       	  %>
	       	   alert("Please Check/Re upload the Resume File !"); 
	       	   ChangeColor(document.getElementById(1), 1);
	       	   getDocsList();
	       	   return false;
	       	   
       	   <%
       	    }
       	   if(IDProof_DATA == null) 
       	    {
       	   %>
	       	   alert("Please Check/Re upload the Id proof File !"); 
	       	   ChangeColor(document.getElementById(2), 2);
	       	   getDocsList();
	       	   return false; 
       	   <%
       	    }
       	   if(AddressProof_DATA == null)
       	   {
       	   %>
	       	   alert("Please Check/Re upload the Address proof File !"); 
	       	   ChangeColor(document.getElementById(3), 3);
	       	   getDocsList();
	       	   return false;
       	    <%
       	    }
       	    if(BirthProof_DATA == null)
       	    {
       	    %>
	       	    alert("Please Check/Re upload the Birth proof File !"); 
	       	     ChangeColor(document.getElementById(4), 4);
	       	     getDocsList();
	       	    return false;
       	    <%
       	    }
       	    if(EducationProof_DATA == null)
       	    {
       	    %>
       	    alert("Please Check/Re upload the Education proof File !");
       	    ChangeColor(document.getElementById(5), 5);
       	    getDocsList();
       	    return false;
       	    <%
       	    }
       	    %>
       	    if ( FinalCheckForm.hidExp.value == "Y" )
   		     {
	   		     <%
	   		     if(EmploymentProof_Data == null)
	   		     {
	   		     %>
	   		      alert("Please Check/Re upload  Experience 1 proof File !");
	   		      ChangeColor(document.getElementById(6), 6);
	   		      getDocsList();
	   		      return false;
	   			 <%
	   			 }
	   			 if(SlipProof_Data == null)
	   			 {
	   			 %>
	   			  alert("Please Check/Re-upload the Slip proof File !"); 
	   			   ChangeColor(document.getElementById(9), 9);
	   			   getDocsList();
	   			  return false;
	   			 <%
	   			 }
	   			 %>
	   		 }	 
   			<%
		  	if(UserTypeId == null)
		  	{
			%>
		   		if ( FinalCheckForm.chkPhotos.checked == false ) 
		   		{
		   			alert ( "Please check Agree to furnish 7 copies of passport photographs." ); 
		   			return false; 
		   		}
			<%
		  	}
			%>
     document.getElementById("submit").style.display="none";
     document.getElementById("processing").style.display="";
   	}	  
	 
	</script>
	
	<script type="text/javascript" language="javascript">
	
	function logout()
	{
		location.href = "<%=logoutPage%>";
	}
   </script>
  </head>
  
  <body style="margin:0px;">
   <form name="FinalCheckForm" action="<%=recruitPath%>jsp/CandDocUploadSubmit.jsp" method="post" onsubmit="return check(this);" >
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
	        <%
			  	if(UserTypeId == null)
			  	{
			%>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Documents Upload</font>
			<%
			  	}
			  	else
			  	{
			%>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Cand_Docs_Upload.jsp">Candidate Documents Upload</a> > </font>
	            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Upload Documents</font>
			<%
			  	}
			%>
	        </td>
	        <td align="right" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;">&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="logout();" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
  	 <input type="hidden" id="hidExp" name="hidExp" value="<%=Work_Experience%>"/>
  	 <input type="hidden" id="IsResumeUpload" name="IsResumeUpload" value="<%=IsResumeUpload%>"/> 
	  	<table cellpadding="6" cellspacing="6" border="0" width="900">
	        <tr>
	            <td style="height: 1px;"></td>
	            <td style="height: 1px;"></td>
	            <td style="height: 1px;"></td>
	            <td style="height: 1px;"></td>
	            <td style="height: 1px;"></td>
	        </tr>
	        <tr>
            	<td rowspan="3" style="width:120px; padding: 0px;" align="center">
		           <%
	           			if(rs.getString("ImagePath")==null)
	            		{
	               %>
			            	<img src="<%=recruitPath%>images/default_person.jpg" width="120" height="90" alt="image" />
	               <%
	               		}
	           			else
	            		{
	               %>
			            	<img src="<%=recruitPath%>/jsp/displayImageView.jsp?CID=<%=canId%>" width="120" height="90" alt="image" />
	               <%
	               		}
	               %>    
	            </td>
	            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">Candidate ID</td>
	            <td colspan="2" align="left" class="allBackColor"><%=rs.getString("Bpo_Cand_Id")%></td>
	        </tr>
	        <tr>
	            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">Full Name</td>
	            <td colspan="2" align="left" class="allBackColor"><%=canName%></td>
	        </tr>
	        <tr>
	            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">Date of Registration</td>
	            <td colspan="2" align="left" class="allBackColor"><%=DOR%></td>
	        </tr>
	        <tr>
	            <td colspan="5" align="center" style="padding: 0px;"> 
	               <table width="100%" rules="all" style="border:1px solid black;background-color:#F2F2F2;margin:0;">
	                   <tr>
			       	 	  <td style="border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="10%">Sl No.</td>
						  <td style="border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="25%">Document Type</td>
						  <td style="border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="45%">Document Info</td>
				          <td style="border-left:1px solid black;border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="20%">Document</td>
				       </tr>
				              <%
						       int i=1;
						       String Document_Name = "";
						       String queryForDocs="select * from document_type_master where Is_Alive = 1 and (type_exp='0' or type_exp='"+Work_Experience+"')"; 
						       System.out.println("queryForDocs"+queryForDocs);
						       Statement stmtForDocs=connection.createStatement();
						       ResultSet rsForDocs=stmtForDocs.executeQuery(queryForDocs);
						       while(rsForDocs.next())
							   {
							   		String DocId = "";
							   		String DocOtherInfo = "";
							   		String candDocInfo = "";
							   		String IsuploadDone = null;
							   		int DocType = rsForDocs.getInt("Type_Id");
							   		System.out.println("DocType::::"+DocType);
							   		Document_Name =  rsForDocs.getString("Document_Name");
							   		System.out.println("Document_Name::::"+Document_Name);
							   		String FileName = "";
							   		Blob FileData = null;
							   		if(DocType==1)
							   		{
							   			if(resumeID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = resumeID + "(" + resumeOtherDetails + ")" ; 
							   			}
							   			DocId = resumeID;
							   			IsuploadDone = IsCanResume;
							   			FileName = resumeD;
							   			FileData = CanResume_FileData;
							   		}
							   		 if(DocType==2)
							   		{
							   			System.out.println("DocType::::"+DocType);
							   			if(IDProofID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = IDProofID + "(" + IDProofOtherDetails + ")" ; 
							   			}
							   			DocId = IDProofID;
							   			IsuploadDone = IsID;
							   			FileName = idProofD;
							   			FileData = IDProof_DATA;
							   		}
							   		 if(DocType==3)
							   		{
							   			if(AddressProofID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = AddressProofID + "(" + AddressProofOtherDetails + ")" ; 
							   			}
							   			DocId = AddressProofID;
							   			IsuploadDone = IsAddress;
							   			FileName = AddressProofD;
							   			FileData = AddressProof_DATA;
							   		}
							   		 if(DocType==4)
							   		{
							   			if(BirthProofID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = BirthProofID + "(" + BirthProofOtherDetails + ")" ; 
							   			}
							   			DocId = BirthProofID;
							   			IsuploadDone = IsBirth;
							   			FileName = BirthProofFileNAME;
							   			FileData = BirthProof_DATA;
							   		}
							   		 if(DocType==5)
							   		{
							   			if(EducationProofID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = EducationProofID + "(" + EducationProofOtherDetails + ")" ; 
							   			}
							   			DocId = EducationProofID;
							   			IsuploadDone = IsEducation;
							   			FileName = EducationProofD;
							   			FileData = EducationProof_DATA;
							   		}
							   		 if(DocType==6)
							   		{
							   			if(EmploymentProofID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = EmploymentProofID + "(" + EmploymentProofOtherDetails + ")" ; 
							   			}
							   			DocId = EmploymentProofID;
							   			IsuploadDone = IsEmployment;
							   			FileName = EmploymentProofD;
							   			FileData = EmploymentProof_Data;
							   		}
							   		 if(DocType==7)
							   		{
							   			if(EmploymentProof2ID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = EmploymentProof2ID + "(" + EmploymentProof2OtherDetails + ")" ; 
							   			}
							   			DocId = EmploymentProof2ID;
							   			IsuploadDone = IsEmployment2;
							   			FileName = EmploymentProof2D;
							   			FileData = EmploymentProof2_Data;
							   		}
							   		 if(DocType==8)
							   		{
							   			if(EmploymentProof3ID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = EmploymentProof3ID + "(" + EmploymentProof3OtherDetails + ")" ; 
							   			}
							   			DocId = EmploymentProof3ID;
							   			IsuploadDone = IsEmployment3;
							   			FileName = EmploymentProof3D;
							   			FileData = EmploymentProof3_Data;
							   		}
							   		 if(DocType==9)
							   		{
							   			if(SlipProofID.equalsIgnoreCase("Other"))
							   			{
							   			DocOtherInfo = SlipProofID + "(" + SlipProofOtherDetails + ")" ; 
							   			}
							   			DocId = SlipProofID;
							   			IsuploadDone = IsSlip;
							   			FileName = SlipProofD;
							   			FileData = SlipProof_Data;
							   		}
						      System.out.println("DocId::::"+DocId);
						      if((!DocId.equalsIgnoreCase("Other")) && (!DocId.equalsIgnoreCase("")))
						      {
						      Statement stDocInfo=null;
			                  ResultSet rsDocInfo=null;
			                  String qryForDocInfo = "select Document_Name  from documents_master where Doc_Id = '"+DocId+"'";
						      System.out.println("qryForDocInfo::::::"+qryForDocInfo);
						      stDocInfo=connection.createStatement();
						      rsDocInfo=stDocInfo.executeQuery(qryForDocInfo);
						      if(rsDocInfo.next())
						      {
						      candDocInfo = rsDocInfo.getString("Document_Name");
						      } 
						      }
						      else
						      {
						      candDocInfo = DocOtherInfo;
						      }
						      %>
				     <tr id="<%=i%>" onclick="javascript:checkResumeUpload('<%=DocType%>');getDocsList();">
						 <td align="center" style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;cursor: pointer;">
								<%=i%>
						 </td>
						 <td style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;text-align: left;cursor: pointer;">
							  <%if(i < 6)
							   {
							   %>
								  <%=Document_Name%>
								  <span class="redTxt" id="mrs1">*</span>
							  <%
							  } 
							  if(i == 6) 
							  {
								  if(Work_Experience.equalsIgnoreCase("Y"))
								  {
								  %>
								  <%=Document_Name%>
								  <span class="redTxt" id="mrs1">*</span>
								  <%
								  }
								  else
								  {
								   %>
								   <%=Document_Name%>
								  <%
								  } 
							  }
							  if(i > 6 && i < 9)
							  {
							  %>
							  	 <%=Document_Name%>
							  <%
							 }
							  if(i == 9)
							  {
							  %> 
							  <%=Document_Name%>
							 <span class="redTxt" id="mrs1">*</span>
							 <%
							  }
							  %>
						</td>
						<td align="left" style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;cursor: pointer;">
							<%if(!candDocInfo.equalsIgnoreCase("")) 
							{ 
							%>
							 <b><%=candDocInfo %> :</b>  <%=FileName%>
							<%
							} 
							else
							{
							%>
							   <%=FileName%>
							<%
							} 
							%>
						</td>
						<td align="center" style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;cursor: pointer;">
						    <%if(FileData != null) {%>
						      <a onclick="return ShowDoc('<%=DocType%>')" style="color: maroon;">View</a>
						   <%} %>
						<input type="hidden" name="docUpload<%= i%>" id="docUpload<%= i%>" value="<%=IsuploadDone %>">
						</td>
					 </tr>
					       <%
					       i = i + 1;
					       } 
					       %>
	               </table> 
	               <input type="hidden" id="iValHid" value="<%=i%>" />
	               <input type="hidden" id="docTypeId" name="docTypeId" value="" />
	            </td>
	        </tr>    
	        <tr>
	            <td colspan="2" align="left" class="allBackColor">
	              <select name="documentsTypesId" id="documentsTypesId" size="1"   class="resizeSelect" onChange="checkResumeUploadDD();" onkeyup="checkResumeUploadDD()">
					<option value="select">
						-- Document Type --
					</option>
						<%
						    String secQsnQrytypes = "select * from document_type_master where Is_Alive = 1 and (type_exp='0' or type_exp='"+Work_Experience+"')";
							System.out.println("query " + secQsnQrytypes);
							Statement stmttypes = connection.createStatement();
							ResultSet rstypes = stmttypes.executeQuery(secQsnQrytypes);
							while (rstypes.next())
							 {
				    	 %>
                      <option value="<%=rstypes.getString("Type_ID")%>" ><%=rstypes.getString("Document_Name")%></option>
                     <%} %>
	            </td>
   			    <td style="width:100px;" class="allBackColor">
					<select name="selDocument" id="selDocument" class="resizeSelect">
					
					<option value="select">-- Select Document --</option>
			        
			        </select>
				 <input type="hidden" name="ResumeHiddenFld" id="ResumeHiddenFld" value="0">
			  </td>
			<td align="left" class="allBackColor">
				<iframe src="<%=recruitPath%>jsp/FileUploadUI.jsp" name="uploadResume" width="470" height="41" scrolling="no" frameborder="0" ></iframe>
			</td>
			<td align="center" class="allBackColor" id="txtIDLDISP" style="display: none;width: 100%;">
				<input type="text"  id="txtIDL" name="txtIDL" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" maxlength="150" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
			</td>

    </tr>
	        <%
	        if(UserTypeId == null)
			  	{
				%>
	        <tr>
	            <td colspan="5" align="center" class="allBackColor">   
	                <input type="checkbox" id="chkPhotos" name="chkPhotos" />
	                I agree to furnish 7 copies of my passport size photograph to collect my offer letter.
	            </td>
	        </tr>
				<%
			  	}
				%>    
	        <tr>
	            <td colspan="5" align="center">   
	                <input type="submit" id="submit" name="submit" value="Submit" class="buttonMedium" onClick="return check(this);"/>
	                <span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, please wait...</font></b></span>
	            </td>
	        </tr>
	    </table>
  		<%
  	  }
   %>
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
    <script type="text/javascript"> 
		document.FinalCheckForm.selDocument.onchange = updateDocs;
		document.FinalCheckForm.txtIDL.onchange = updateDocs; 
		function updateDocs()
		{
			
			var obj_sel = document.FinalCheckForm.selDocument.value; 		
			if(obj_sel=="Other")
			{
				document.getElementById('txtIDLDISP').style.display="";
			    if(FinalCheckForm.txtIDL.value =='Other Details')
			      {
			    var appStr = 'Please Enter Other Details !';		
				alert(appStr);
			 	document.getElementById('txtIDL').focus();
			   }
			}
			else
			{
				document.getElementById('txtIDLDISP').style.display="none";
			}
			obj_sel = document.FinalCheckForm.selDocument.value;
			OtherDetails=document.FinalCheckForm.txtIDL.value;
			var typeId = document.FinalCheckForm.docTypeId.value;
			var DocNameSel = document.getElementById("documentsTypesId");
			DocName = DocNameSel.options[DocNameSel.selectedIndex].text;
			parent.uploadResume.location.href= "<%=recruitPath%>jsp/FileUploadUI.jsp?proofName="+DocName+"&OtherDetails="+OtherDetails+"&docTypeId="+typeId+"&selectedDocId="+obj_sel;
		}
		
	   </script>
	<%
		rs.close();
		stmt.close();
		connection.close();
	%>
    </form>
  </body>
</html>
