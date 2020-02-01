<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
  	String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
	  if(USER_Name == null)
		{
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
	System.out.println("USER_Name in home page::::"+USER_Name);
  	String USER_ID = (String)session.getAttribute("USER_ID");
	 if(USER_ID == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	 System.out.println("USER_ID in home page::::"+USER_ID);
	String canId= (String) request.getParameter("candId");
	session.setAttribute( "Bpo_Cand_Id", canId );
	Statement stmts=null;
	ResultSet rs = null;
	CallableStatement cs=null;
	CallableStatement csDocs=null;
	Connection connection=ConnectDatabase.getConnection();	
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
	String IDProof="";
    String IDProofOtherDetails="";
	String AddressProof="";
	String AddressProofOtherDetails="";
	String BirthProof="";
	String BirthProofOtherDetails="";
	String EducationProof="";
	String EducationProofOtherDetails="";
	String EmploymentProof="";
	String EmploymentProofOtherDetails="";
	String EmploymentProof2="";
	String EmploymentProof2OtherDetails="";
	String EmploymentProof3="";
	String EmploymentProof3OtherDetails="";
	String SlipProof="";
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
	String queryFOR_getDOCS = "";
	ResultSet rsDocs  = null;
	Statement stDocs = null;
	
	
	try
	{
		connection=ConnectDatabase.getConnection();									
		stmts = connection.createStatement();
		String strProcedure="{call BpoCandDtls_Encrypt_Proc(?,?,?)}"; //your procedure name
		cs=connection.prepareCall(strProcedure);
		cs.setString(1,canId);
        cs.setString(2,EDKey);
        cs.setString(3,EDKPass);
		rs=cs.executeQuery();
		session.setAttribute( "page", "FinalCheckListRight.jsp" );	
	
	
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>[24]7 Final CheckList</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/247Recruit/css/Common.css">
	<% response.setContentType("text/html"); %>
	
	<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
		      // alert(charCode);
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
	
	
	<script type="text/javascript" language="javascript">
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

	function ShowDoc(docID)
	{
	  var urlDocs = "<%=request.getContextPath()%>/247Recruit/jsp/UploadedDocument.jsp?CIDrec=<%=canId%>&DocumentID="+docID;	
	  someWindow = window.open(urlDocs,'ReasonWindow','height=600,width=800,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
     function showAdditionalDocs()
   {
    var urlForDocs = "<%=request.getContextPath()%>/247Recruit/jsp/AdditionalDocumentsView.jsp?candidateId=<%=canId%>"
    someWindow = window.open(urlForDocs,'AdditionalDocsWindow','height=400,width=640,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
    }
     
    function ValidatePage(FinalCheckForm)
  	 {  
      if(FinalCheckForm.selResume.value == "select") 
   		{
   			alert ( "Please select Resume." ); 
   			FinalCheckForm.selResume.focus();
   			return false;
   		}
   		if ( FinalCheckForm.selResume.value == "Other" ) 
   		{
   		   if((FinalCheckForm.txtResume.value =='Other Details')||(FinalCheckForm.txtResume.value.trim ==""))
			 {
			    var appStr = 'Please Enter Other Details for Resume!';		
				alert(appStr);
				document.getElementById('txtResume').focus();
				return false;
			}
   		}
   		if(FinalCheckForm.selPassPhotos.value == "select") 
   		{
   			alert ( "Please select Passport Size Photos."); 
   			FinalCheckForm.selPassPhotos.focus();
   			return false; 
   		}
   		if (FinalCheckForm.selPassPhotos.value == "Other") 
   		{
   		   if(FinalCheckForm.txtPassPhotos.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Photo!';		
				alert(appStr);
				document.getElementById('txtPassPhotos').focus();
				return false;
			 }
   		}
   		if ( FinalCheckForm.selID.value == "select" ) 
   		{
   			alert ( "Please select ID Proof." ); 
   			FinalCheckForm.selID.focus();
   			return false; 
   			
   		}
   		if ( FinalCheckForm.selID.value == "Other" ) 
   		{
   		   if(FinalCheckForm.txtID.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for ID Proof!';		
				alert(appStr);
				document.getElementById('txtID').focus();
				return false;
				
			}
   		}
   		if ( FinalCheckForm.selAddress.value == "select" ) 
   		{
   			alert ( "Please select Address Proof." ); 
   			return false; 
   			FinalCheckForm.selAddresss.focus();
   			
   		}
   		if ( FinalCheckForm.selAddress.value == "Other" ) 
   		{
   		   if(FinalCheckForm.txtAddress.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Address Proof!';		
				alert(appStr);
				document.getElementById('txtAddress').focus();
				return false;
			}
   		}
   		if ( FinalCheckForm.selBirth.value == "select" ) 
   		{
   			alert ( "Please select Date of Birth Proof." ); 
   			FinalCheckForm.selBirth.focus();
   			return false; 
   			
   		}
   		if ( FinalCheckForm.selBirth.value == "Other" ) 
   		{
   		   if(FinalCheckForm.txtBirth.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Birth Proof!';		
				alert(appStr);
				document.getElementById('txtBirth').focus();
				return false;
			}
   		}
   		
   		if ( FinalCheckForm.selEducation.value == "select" ) 
   		{
   			alert ( "Please select Education." ); 
   			FinalCheckForm.selEducation.focus();
   			return false;
   		}
   		if ( FinalCheckForm.selEducation.value == "Other" ) 
   		{
   		   if(FinalCheckForm.txtEducation.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Education Proof!';		
				alert(appStr);
				document.getElementById('txtEducation').focus();
				return false;
			}
   		}
    if ( FinalCheckForm.hidExp.value == "N" )
   	{ 
   	if ( FinalCheckForm.selEmployment.value == "Other" ) 
   		{
   		   if(FinalCheckForm.txtEmployment.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Employement Proof!';		
				alert(appStr);
				document.getElementById('txtEmployment').focus();
				return false;
			}
   		}
   	} 		
   	if ( FinalCheckForm.hidExp.value == "Y" )
   	{
   		if ( FinalCheckForm.selEmployment.value == "select" ) 
   		{
   			alert ( "Please select Previous Employment." ); 
   			FinalCheckForm.selEmployment.focus();
   			return false; 
   		}
   		if ( FinalCheckForm.selEmployment.value == "Other" ) 
   		{
   		   if(FinalCheckForm.txtEmployment.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Employement Proof!';		
				alert(appStr);
				document.getElementById('txtEmployment').focus();
				return false;
			}
   		}
   		
   		if ( FinalCheckForm.selEmployment2.value == "Other" ) 
   		    {
   		   if(FinalCheckForm.txtEmployment2.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Previous Employment!';		
				alert(appStr);
				document.getElementById('txtEmployment2').focus();
				return false;
			 }
   	    	}
   		if ( FinalCheckForm.selEmployment3.value == "Other" ) 
   		    {
   		   if(FinalCheckForm.txtEmployment3.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Previous Employment!';		
				alert(appStr);
				document.getElementById('txtEmployment3').focus();
				return false;
			}
   	    	}
   		
   		if ( FinalCheckForm.selPaySlip.value == "select" ) 
   		{
   			alert ( "Please select Last Drawn Pay Slip/s." ); 
   			FinalCheckForm.selPaySlip.focus();
   			return false; 
   		}
   		if ( FinalCheckForm.selPaySlip.value == "Other" ) 
   		    {
   		   if(FinalCheckForm.txtPaySlip.value =='Other Details')
			 {
			    var appStr = 'Please Enter Other Details for Last Drawn Slip !';		
				alert(appStr);
				document.getElementById('txtPaySlip').focus();
				return false;
			}
   	    	}
   	}	
   		if (( FinalCheckForm.select[0].checked == false ) && ( FinalCheckForm.select[1].checked == false )) 
			{ 
				 alert ( "Please Select the action (Select/Hold) !" );
				 return false;
		    }
    	if( FinalCheckForm.select[1].checked == true) 
	       { 
	       if(document.getElementById("txtactioncommentsVal").value=='')
			{
			    var appStr = 'Please Enter The Reason for Hold !';		
				alert(appStr);
				document.getElementById('txtactioncommentsVal').focus();
				return false;
			}
		 }
	  	document.getElementById('submit').style.display="none";
        document.getElementById("processing").style.display="";
  	}

  function showOption(value)
	{
	 
		if (value == 2)
	   	{
	   	  document.getElementById('ActionCommentsDISP').style.display="";
		}
	   	else
	   	{
	   		document.getElementById('ActionCommentsDISP').style.display="none";
	    }
	}
  </script>
  
  	<!-- Start Java script for Test Fields Blur Data -->
	<script type="text/javascript">
		function ReFocus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmta"; } } function Focus(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "nta"; } } function Blur(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmta"; } else { obj.className = "nta"; } } function ReFocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; } if (obj.value == wmt) { obj.className = "wmtr"; } } function FocusR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == wmt) { obj.value = ""; obj.className = "ntr"; } } function BlurR(obn, wmt) { obj = document.getElementById(obn); if (obj.value == "") { obj.value = wmt; obj.className = "wmtr"; } else { obj.className = "ntr"; } }
	</script>
	
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
  </head>
  
  <body>
  <form name="FinalCheckForm" action="<%=recruitPath%>jsp/FinalCheckListSubmit.jsp" method="post" onsubmit="return ValidatePage(this);">
    <%
  	if(rs.next())
  	{
  		int RAG=rs.getInt("RAG");
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		int uploadDone = rs.getInt("Upload_Done");
  		System.out.println("Canidate Upload Status:::::"+uploadDone);
  		Date dateStr = rs.getDate("System_Date_Time");
  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
    	String DOR = formatter.format(dateStr);  
    	
    	String Work_Experience=rs.getString("Work_Experience");
		session.setAttribute("WorkExperience",Work_Experience);
		
		int docCount = 0;
		ResultSet rsAdditionaldtls = null;
		String getAdditionalDocDtls = "select Count(*) as Count from candidate_additional_docs_upload where CandidateID = '"+canId+"'";
		System.out.println("getAdditionalDocDtls:::::::"+getAdditionalDocDtls);
		rsAdditionaldtls = stmts.executeQuery(getAdditionalDocDtls);
		if(rsAdditionaldtls.next())
	  	{
	 		docCount = 	rsAdditionaldtls.getInt("Count");	
	 		System.out.println("docCount:::::"+docCount);
	  	}
		rsAdditionaldtls.close();
		

  		%>
	<table cellpadding="6" cellspacing="6" width="100%">
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
            	<a style="text-align: right;color: maroon;" onclick="showWindowYellow()"><img src="<%=recruitPath%>images/yellow.jpg" width="65" height="80" alt="image" /></a>
            	 	<%}
            		else if(RAG==3)
            		{
            	 %>
            	 <img src="<%=recruitPath%>images/green.jpg" width="65" height="80" alt="image" />
            	 <%}
            		else
            		{
            	 %>
            	<a style="text-align: right;color: maroon;" onclick="showWindow()"> <img src="<%=recruitPath%>images/red.jpg" width="65" height="80" alt="image" /></a>
            	 </td>
            	<%} %>
            <td colspan="3" class="allBackColor">
                <%=rs.getString("Bpo_Cand_Id")%>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="allBackColor">
                <%=canName %>
            </td>
        </tr>
        <tr>
         <td colspan="3" class="allBackColor">
                <%=DOR%>
            </td>
        </tr>
        <%
        if(uploadDone == 1)
         {
        	//******************Getting the Candidate Document Details**************//
        	stDocs= connection.createStatement();
		    queryFOR_getDOCS="{call BpoCandDocs_Encrypt_Proc(?,?,?)}"; //your procedure name
		    csDocs=connection.prepareCall(queryFOR_getDOCS);
		    csDocs.setString(1,canId);
            csDocs.setString(2,EDKey);
            csDocs.setString(3,EDKPass);
		    rsDocs=csDocs.executeQuery();
        	
        	if(rsDocs.next())
        	{
        		resumeID = rsDocs.getString("CanResume");
		      	resumeOtherDetails = rsDocs.getString("CanResume_OtherDetails");
		      	resumeD = rsDocs.getString("CanResume_FileName");
		      	CanResume_FileData   = rsDocs.getBlob("CanResume_FileData");
        		System.out.println("CanResume_FileData ::::"+CanResume_FileData );
		      	System.out.println("resumeD"+resumeD);
        		IDProof=(String)rsDocs.getString("IDProof");
        		if(IDProof == null)
        		{
        		IDProof = "";
        		}
        		System.out.println("IDProof::"+IDProof);
        		IDProofOtherDetails=(String)rsDocs.getString("IDProof_OtherDetails");
        		System.out.println("IDProofOtherDetails"+IDProofOtherDetails);
        		idProofD = rsDocs.getString("IDProof_FileName");
        		System.out.println("idProofD::::"+idProofD);
        		IDProof_DATA  = rsDocs.getBlob("IDProof_DATA");
        		System.out.println("IDProof_DATA::::"+IDProof_DATA);
        		AddressProof=(String)rsDocs.getString("AddressProof");
        		if(AddressProof == null)
        		{
        		AddressProof = "";
        		}
        		System.out.println("AddressProof"+AddressProof);
        		AddressProofOtherDetails=(String)rsDocs.getString("AddressProof_OtherDetails");
        		System.out.println("AddressProofOtherDetails"+AddressProofOtherDetails);
        		AddressProof_DATA   = rsDocs.getBlob("AddressProof_DATA");
        		System.out.println("AddressProof_DATA ::::"+AddressProof_DATA );
        		AddressProofD = rsDocs.getString("AddressProof_FileName");
        		BirthProof=(String)rsDocs.getString("BirthProof");
        		System.out.println("BirthProof"+BirthProof);
        		if(BirthProof == null)
        		{
        		BirthProof = "";
        		}
        		BirthProofOtherDetails=(String)rsDocs.getString("BirthProof_OtherDetails");
        		System.out.println("BirthProofOtherDetails"+BirthProofOtherDetails);
        		BirthProofFileNAME = rsDocs.getString("BirthProof_FileName");
        		BirthProof_DATA   = rsDocs.getBlob("BirthProof_DATA");
        		System.out.println("BirthProof_DATA ::::"+BirthProof_DATA );
        		EducationProof=(String)rsDocs.getString("EducationProof");
        		if(EducationProof == null)
        		{
        		EducationProof = "";
        		}
        		System.out.println("EducationProof"+EducationProof);
        		EducationProofOtherDetails=(String)rsDocs.getString("EducationProof_OtherDetails");
        		System.out.println("EducationProofOtherDetails"+EducationProofOtherDetails);
        		EducationProofD = rsDocs.getString("EducationProof_FileName");
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
        		EmploymentProof=(String)rsDocs.getString("EmploymentProof");
        		EmploymentProofD = rsDocs.getString("EmploymentProof_FileName");
				EmploymentProof2D = rsDocs.getString("EmploymentProof2_FileName");
				EmploymentProof3D = rsDocs.getString("EmploymentProof3_FileName");
				SlipProofD = rsDocs.getString("SlipProof_FileName");
        		if(EmploymentProof==null)
        		{
        		EmploymentProof="";
        		}
        		System.out.println("EmploymentProof"+EmploymentProof);
        		EmploymentProofOtherDetails=(String)rsDocs.getString("EmplymntPrf_OtherDetails");
        		if(EmploymentProofOtherDetails==null)
        		{
        		EmploymentProofOtherDetails="";
        		}
        		System.out.println("EmploymentProofOtherDetails"+EmploymentProofOtherDetails);
        		EmploymentProof2=(String)rsDocs.getString("EmploymentProof2");
        		if(EmploymentProof2==null)
        		{
        		EmploymentProof2="";
        		}
        		System.out.println("EmploymentProof2"+EmploymentProof2);
        		EmploymentProof2OtherDetails=(String)rsDocs.getString("EmplymntPrf2_OtherDetails");
        		if(EmploymentProof2OtherDetails==null)
        		{
        		EmploymentProof2OtherDetails="";
        		}
        		System.out.println("EmploymentProof2OtherDetails"+EmploymentProof2OtherDetails);
        		EmploymentProof3=(String)rsDocs.getString("EmploymentProof3");
        		if(EmploymentProof3==null)
        		{
        		EmploymentProof3="";
        		}
        		System.out.println("EmploymentProof3"+EmploymentProof3);
        		EmploymentProof3OtherDetails=(String)rsDocs.getString("EmplymntPrf3_OtherDetails");
        		if(EmploymentProof3OtherDetails==null)
        		{
        		EmploymentProof3OtherDetails="";
        		}
        		System.out.println("EmploymentProof3OtherDetails"+EmploymentProof3OtherDetails);
        		
        		
        		SlipProof=(String)rsDocs.getString("SlipProof");
        		if(SlipProof==null)
        		{
        		SlipProof="";
        		}
        		System.out.println("SlipProof"+SlipProof);
        		SlipProofOtherDetails=(String)rsDocs.getString("SlipProof_OtherDetails");
        		if(SlipProofOtherDetails==null)
        		{
        		SlipProofOtherDetails="";
        		}
        		System.out.println("SlipProofOtherDetails"+SlipProofOtherDetails);
        		System.out.println( resumeD+" >> "+idProofD+"  >>>  "+AddressProofD+" >>>>> "+BirthProofFileNAME+" >>>>>> "+EducationProofD+" >>>>> "+EmploymentProofD+" >>> "+EmploymentProof2D+" >>>> "+EmploymentProof3D+"  >>>>> "+ SlipProofD);
        	}
        }	
      %>
        <tr>
          <td colspan="2" align="left" style="width:175px;background-color: #d8d8d8;" class="allBackColor">
            	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
            		<tr>
            			<td align="left" style="background-color: #d8d8d8;" class="allBackColor">
			                Resume
            			</td>
            			<td align="right">
            				<%
            				if((CanResume_FileData!=null) && (uploadDone==1))
            				{
	            					
            				%>
            						<a onclick="return ShowDoc('0');" ><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
            				<% 	
            				}
            				%>
            			</td>
            		</tr>
            	</table>
            </td>
   			<td class="allBackColor">
   				<select name="selResume" id="selResume"  style="width: 150px;">
				<option value="select">--Select--</option>
		       <%    
		         try
		         {   	
       				String queryResume= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id=1)";			        
			  		System.out.println("queryResume:::::::"+queryResume);
			  		Statement smtResume = connection.createStatement();
					ResultSet rsResume = smtResume.executeQuery(queryResume);
					while(rsResume.next())
					{		
					if (resumeID.equals(rsResume.getString("Doc_Id"))) 
					{	        
					%>					
						<option value="<%=rsResume.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsResume.getString("Document_Name") %></option>
					<%
					}
					else
					{
					 %>	
						<option value="<%=rsResume.getString("Doc_Id")%>"><%=rsResume.getString("Document_Name") %></option>
					<%
					}
					}
					rsResume.close();
					smtResume.close();
				 }
		    	 catch(Exception e)
		   		 {
		   	  		e.printStackTrace();
		   		 }			            	  
           	     if(resumeID.equalsIgnoreCase("Other"))
           	     {
           	     %>
			       <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
				<%}else { %>
				 <option value="Other">Other</option>
				<%} %>
				</select>
   			</td>
   			
   			<td class="allBackColor">
   			<%
   			 if(resumeID.equalsIgnoreCase("Other"))
           	  {
           	 %>
   			<input type="text" size="15"  value="<%=resumeOtherDetails %>" id="txtResume" name="txtResume" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   			<%}else {%>
   			<input type="text" size="15"  id="txtResume" name="txtResume" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   			<%} %>
   			</td>
   			
   			<td class="allBackColor">
   				<input type="checkbox" name="chkResume" />
   			</td>
        </tr>
         
         
         
         
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Passport Size Photos
            </td>
   			<td class="allBackColor">
				<select name="selPassPhotos" id="selPassPhotos" style="width: 150px;">
	            	  <option value="select">--Select--</option>
							 <%    
			         try
			         {   	
        				String query_Photo= "select Cand_photo_AutoId from candidate_photo_details where Is_Active=1";			        
				  		Statement smt_Photo = connection.createStatement();
						ResultSet rs_Photo1 = smt_Photo.executeQuery(query_Photo);
						while(rs_Photo1.next())
						{			        
						%>					
							<option value="<%=rs_Photo1.getInt("Cand_photo_AutoId")%>"><%=rs_Photo1.getInt("Cand_photo_AutoId") %></option>
						<%
						}
						rs_Photo1.close();
						smt_Photo.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
				 %>
					  <option value="Other">Other</option>
				</select>
   			</td>
   			<td class="allBackColor">
   				<input type="text" size="15"  id="txtPassPhotos" name="txtPassPhotos" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkPassPhotos" />
   			</td>
        </tr>
       <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
               <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                 <tr>
                   <td align="left" style="background-color: #d8d8d8;" class="allBackColor">
                     ID Proof
                  </td>
                  <td align="right" style="width:22px;">
                     <%
            			System.out.println("  ID PROOF ");
      					if((IDProof_DATA!=null) && (uploadDone==1))
            				{
            		 %>
            	<a onclick="return ShowDoc('1')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
            	<%}%>
                 </td>
               </tr>
            </table>    
            </td>
       			<td class="allBackColor">
       				<select name="selID" id="selID" style="width: 150px;">
			            <option value="select">--Select--</option>	  
							 <%    
			         try
			         {   	
        				String queryid_proof= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id=2)and Is_Alive = 1";			        
				  		System.out.println("queryid_proof:::::"+queryid_proof);
				  		Statement smtid_proof = connection.createStatement();
						ResultSet rsid_proof = smtid_proof.executeQuery(queryid_proof);
						while(rsid_proof.next())
						{
						if (IDProof.equals(rsid_proof.getString("Doc_Id"))) 
						{
						System.out.println("queryid_proof:::::if:;::"+queryid_proof);			        
						%>					
						<option value="<%=rsid_proof.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsid_proof.getString("Document_Name") %></option>
						<%
						}
						else
						{
						%>
						<option value="<%=rsid_proof.getString("Doc_Id")%>"><%=rsid_proof.getString("Document_Name") %></option>
						<%
						}
						}
						rsid_proof.close();
						smtid_proof.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         if(IDProof.equalsIgnoreCase("Other"))	  
			            {
			            %>
					<option value="Other" selected="selected" style="font-weight: bold;" >Other</option>	 
					<%}else{ %>
					 <option value="Other">Other</option>
					<%} %>
				</select>
   			</td>
  			<td class="allBackColor">
  			 <% if(IDProof.equalsIgnoreCase("Other")){ %>
  			 <input type="text" size="15" value="<%=IDProofOtherDetails %>" id="txtID" name="txtID" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
  			 <%}else{ %>
  			  <input type="text" size="15" id="txtID" name="txtID" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
  			  <%} %>
  			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkID" />
   			</td>
        </tr>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
            	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
            		<tr>
            			<td align="left" style="background-color: #d8d8d8;" class="allBackColor">
			               Address Proof 
            			</td>
            			<td align="right" style="width:22px;">
            		       <%
            				System.out.println(" ADDREDD PROOF ");
      					    if((AddressProof_DATA!=null) && (uploadDone==1))
            				{
           				  %>
            				<a onclick="return ShowDoc('2')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
                           <% } %>
                         </td>
            		</tr>
            	</table>
            </td>
   			<td class="allBackColor">
   				 <select name="selAddress" id="selAddress" style="width: 150px;">
	            	  <option value="select">--Select--</option>
							 <%    
			         try
			         {   	
        				String queryaddress_proof= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id=3)and Is_Alive = 1";			        
				  		System.out.println("queryaddress_proof"+queryaddress_proof);
				  		Statement smtaddress_proof = connection.createStatement();
						ResultSet rsaddress_proof = smtaddress_proof.executeQuery(queryaddress_proof);
						while(rsaddress_proof.next())
						{
						if (AddressProof.equals(rsaddress_proof.getString("Doc_Id"))) 
						{			        
						%>	
						<option value="<%=rsaddress_proof.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsaddress_proof.getString("Document_Name") %></option>
						<%}
						else
						{ %>
						<option value="<%=rsaddress_proof.getString("Doc_Id")%>"><%=rsaddress_proof.getString("Document_Name") %></option>
						<%
						}
						}
						rsaddress_proof.close();
						smtaddress_proof.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			           if (AddressProof.equalsIgnoreCase("Other")){ %>
			          <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
			          <% }else{%>
			          <option value="Other">Other</option>
			          <%} %>
				</select>
   			</td>
   			<td class="allBackColor">
   			  <% if(AddressProof.equalsIgnoreCase("Other")){ %>
   			     <input type="text" size="15" value="<%=AddressProofOtherDetails %>" id="txtAddress" name="txtAddress" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   			   <% } else { %>
   			    <input type="text" size="15"  id="txtAddress" name="txtAddress" style="display: none;"class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   			  <% } %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkAddress" />
   			</td>
        </tr>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
            		<tr>
            			<td align="left" style="background-color: #d8d8d8;" class="allBackColor">
			                Date of Birth Proof
            			</td>
            			<td align="right" style="width:22px;">
            		      <%
           					    System.out.println(" Date of Birth Proof ");
     							if((BirthProof_DATA!=null) && (uploadDone==1))
           				       {       
            				%>
            				<a onclick="return ShowDoc('3')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
                        <%} %>
                        </td>
            		</tr>
            	</table>
            </td>
   			<td class="allBackColor">
   				<select name="selBirth" id="selBirth" style="width: 150px;">
	            	  <option value="select">--Select--</option>
							  <%    
			         try
			         {   	
        				String queryDOB_Proof= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id=4)and Is_Alive = 1";			        
				  		Statement smtDOB_Proof = connection.createStatement();
						ResultSet rsDOB_Proof = smtDOB_Proof.executeQuery(queryDOB_Proof);
						while(rsDOB_Proof.next())
						{
						if(BirthProof.equals(rsDOB_Proof.getString("Doc_Id"))) 
						{			        
						%>					
							<option value="<%=rsDOB_Proof.getString("Doc_Id") %>" selected="selected" style="font-weight: bold;"><%=rsDOB_Proof.getString("Document_Name") %></option>
						<%}
						else {
						 %>	
							<option value="<%=rsDOB_Proof.getString("Doc_Id") %>"><%=rsDOB_Proof.getString("Document_Name") %></option>
						<%
						}
						}
						rsDOB_Proof.close();
						smtDOB_Proof.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
				     if(BirthProof.equalsIgnoreCase("Other"))
				     {
				     %>
					  <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
					  <%} else { %>
					  <option value="Other">Other</option>
					  <%} %>
				</select>
   			</td>
   			<td class="allBackColor">
   			 <%if(BirthProof.equalsIgnoreCase("Other")) { %>
   				<input type="text" size="15" value="<%=BirthProofOtherDetails %>" id="txtBirth" name="txtBirth" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} else { %>
   				<input type="text" size="15" id="txtBirth" name="txtBirth" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkBirth" />
   			</td>
        </tr>
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
            	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
            		<tr>
            			<td align="left" style="background-color: #d8d8d8;" class="allBackColor">
			              Education  
            			</td>
            			<td align="right" style="width:22px;">
            		      <%
            				    System.out.println(" Education ");
 								if((EducationProof_DATA!=null) && (uploadDone==1))
      				            {
            				  %>
            				<a onclick="return ShowDoc('4')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
            				<%} %>
                         </td>
            		</tr>
            	</table>
            </td>
   			<td class="allBackColor">
   				<select name="selEducation" id="selEducation" style="width: 150px;">
	            	  <option value="select">--Select--</option>
							  <%    
			         try
			         {   	
        				String queryEduProof= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id=5)and Is_Alive = 1";			        
				  		Statement smtEduProof = connection.createStatement();
						ResultSet rsEduProof = smtEduProof.executeQuery(queryEduProof);
						while(rsEduProof.next())
						{	
						if(EducationProof.equals(rsEduProof.getString("Doc_Id"))) 	
						{	        
						%>					
							<option value="<%=rsEduProof.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsEduProof.getString("Document_Name") %></option>
						<%}
						else
						{
						 %>	
							<option value="<%=rsEduProof.getString("Doc_Id")%>"><%=rsEduProof.getString("Document_Name") %></option>
						<%
						}
						}
						rsEduProof.close();
						smtEduProof.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }	
			   		 if(EducationProof.equalsIgnoreCase("Other"))
			   		 {		            	  
				    %> 
				       <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
				       <%} else { %>
					  <option value="Other">Other</option>
					  <%} %>
				</select>
   			</td>
   			<td class="allBackColor">
   			<% if(EducationProof.equalsIgnoreCase("Other")) { %>
   				<input type="text" size="15" value="<%=EducationProofOtherDetails %>" id="txtEducation" name="txtEducation" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} else { %>
   				<input type="text" size="15" id="txtEducation" name="txtEducation" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkEducation" />
   			</td>
        </tr>
        
      <!-- Employment part for Freshers -->
      <%
      if (Work_Experience.equalsIgnoreCase("N"))
	  	{
	  	 %>
      <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
            	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
            		<tr>
            			<td align="left" style="background-color: #d8d8d8;" class="allBackColor">
			              Experience 
            			</td>
            			<td align="right" style="width:22px;">
            		      <%
            				    System.out.println(" Education ");
 								if((EmploymentProof_Data!=null) && (uploadDone==1))
      				            {
            				  %>
            				<a onclick="return ShowDoc('5')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
            				<%} %>
                         </td>
            		</tr>
            	</table>
            </td>
            <td class="allBackColor">
   				 <select name="selEmployment" id="selEmployment" style="width: 150px;">
	            	  <option value="select">--Select--</option>
								   <%    
			         try
			         {   	
        				String queryPrev_Emp= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id=6)and Is_Alive = 1";			        
				  		Statement smtPrev_Emp = connection.createStatement();
						ResultSet rsPrev_Emp = smtPrev_Emp.executeQuery(queryPrev_Emp);
						while(rsPrev_Emp.next())
						{	
						if (EmploymentProof.equals(rsPrev_Emp.getString("Doc_Id")))
						{ 		        
						%>
						<option value="<%=rsPrev_Emp.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsPrev_Emp.getString("Document_Name") %></option>
						<%}
						else
						{
						 %>					
						<option value="<%=rsPrev_Emp.getString("Doc_Id")%>"><%=rsPrev_Emp.getString("Document_Name") %></option>
						<%
						}
						}
						rsPrev_Emp.close();
						smtPrev_Emp.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			
			   		 if (EmploymentProof.equalsIgnoreCase("Other"))
			   		 {            	  
				     %>
					  <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
					  <%} else { %>
					  <option value="Other">Other</option>
					  <%} %>
				</select>
   			</td>
   			<td class="allBackColor">
   			<% if (EmploymentProof.equalsIgnoreCase("Other")) {  %>
   				<input type="text" size="15" value="<%=EmploymentProofOtherDetails %>" id="txtEmployment" name="txtEmployment"  oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} else { %>
   				<input type="text" size="15"  id="txtEmployment" name="txtEmployment" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   			    <%} %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkEmployment" />
   			</td>
        </tr>
      <%} %>   
      <!-- End of Employment part for Freshers -->
        
        <%
	  	if (Work_Experience.equalsIgnoreCase("Y"))
	  	{
	  %>
	  	<tr>
            <td colspan="2" rowspan="3" align="left" class="allBackColor" style="background-color: #d8d8d8;">
            	<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;height: 102px;">
            		<tr>
            			<td rowspan="3" align="left" style="background-color: #d8d8d8;" class="allBackColor">
			             Experience 
            			</td>
            			<td align="right" valign="top">
            			      <%
            				    System.out.println("Previous Employment ");
      							if((EmploymentProof_Data!=null) && (uploadDone==1))
      				            {
            				%>
            				<a onclick="return ShowDoc('5')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
            				<%} else {%>
            				&nbsp;
            				<%} %>
			            </td>
            		</tr>
          			<tr>
          			      <td align="right" valign="middle">
          			       <%
							System.out.println(" Previous Employment 2 ");
    						if((EmploymentProof2_Data!=null) && (uploadDone==1))
      				            {
          				   %>
          				<a onclick="return ShowDoc('6')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
	                  		<%}else {%>
            				&nbsp;
            				<%} %>
	                  </td>
          			</tr>
          			<tr>
          			      <td align="right" valign="bottom">
          			      <%
          					System.out.println(" Previous Employment 3  ");
    						if((EmploymentProof3_Data!=null) && (uploadDone==1))
      				            {
          				  %>
          				<a onclick="return ShowDoc('7')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
	                  <%} else {%>
            				&nbsp;
            				<%} %>
	                  </td>
          			</tr>
            	</table>
            </td>
   			<td class="allBackColor">
   				 <select name="selEmployment" id="selEmployment" style="width: 150px;">
	            	  <option value="select">--Select--</option>
								   <%    
			         try
			         {   	
        				String queryPrev_Emp= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id = 6)and Is_Alive = 1";			        
				  		Statement smtPrev_Emp = connection.createStatement();
						ResultSet rsPrev_Emp = smtPrev_Emp.executeQuery(queryPrev_Emp);
						while(rsPrev_Emp.next())
						{	
						if (EmploymentProof.equals(rsPrev_Emp.getString("Doc_Id")))
						{ 		        
						%>
						<option value="<%=rsPrev_Emp.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsPrev_Emp.getString("Document_Name") %></option>
						<%}
						else
						{
						 %>					
						<option value="<%=rsPrev_Emp.getString("Doc_Id")%>"><%=rsPrev_Emp.getString("Document_Name") %></option>
						<%
						}
						}
						rsPrev_Emp.close();
						smtPrev_Emp.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			
			   		 if (EmploymentProof.equalsIgnoreCase("Other"))
			   		 {            	  
				     %>
					  <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
					  <%} else { %>
					  <option value="Other">Other</option>
					  <%} %>
				</select>
   			</td>
   			<td class="allBackColor">
   			<% if (EmploymentProof.equalsIgnoreCase("Other")) {  %>
   				<input type="text" size="15" value="<%=EmploymentProofOtherDetails %>" id="txtEmployment" name="txtEmployment"  oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} else { %>
   				<input type="text" size="15"  id="txtEmployment" name="txtEmployment" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   			    <%} %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkEmployment" />
   			</td>
        </tr>
        <tr>
   			<td class="allBackColor">
   				 <select name="selEmployment2" id="selEmployment2" style="width: 150px;">
	            	  <option value="select">--Select--</option>
								  <%    
			         try
			         {   	
        				String queryPrev_Emp1= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id = 7)and Is_Alive = 1";			        
				  		Statement smtPrev_Emp1 = connection.createStatement();
						ResultSet rsPrev_Emp1 = smtPrev_Emp1.executeQuery(queryPrev_Emp1);
						while(rsPrev_Emp1.next())
						{	
						if (EmploymentProof2.equals(rsPrev_Emp1.getString("Doc_Id")))
						{		        
						%>	
						<option value="<%=rsPrev_Emp1.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsPrev_Emp1.getString("Document_Name") %></option>
						<%}
						else
						{ 
						%>				
							<option value="<%=rsPrev_Emp1.getString("Doc_Id")%>"><%=rsPrev_Emp1.getString("Document_Name") %></option>
						<%
						}
						}
						rsPrev_Emp1.close();
						smtPrev_Emp1.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }	
			   		 if (EmploymentProof2.equalsIgnoreCase("Other"))
			   		 {		            	  
				     %>
					  <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
					  <%} else { %>
					  <option value="Other">Other</option>
					  <%} %>
				</select>
   			</td>
   			<td class="allBackColor">
   			<%if (EmploymentProof2.equalsIgnoreCase("Other")) { %>
   				<input type="text" size="15" value="<%=EmploymentProof2OtherDetails %>" id="txtEmployment2" name="txtEmployment2" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} else { %>
   				<input type="text" size="15" id="txtEmployment2" name="txtEmployment2" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkEmployment2" />
   			</td>
        </tr>
        <tr>
   			<td class="allBackColor">
   				 <select name="selEmployment3" id="selEmployment3" style="width: 150px;">
	            	  <option value="select">--Select--</option>
								   <%    
			         try
			         {   	
        				String queryPrev_Emp2= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id = 8)and Is_Alive = 1";			        
				  		Statement smtPrev_Emp2 = connection.createStatement();
						ResultSet rsPrev_Emp2 = smtPrev_Emp2.executeQuery(queryPrev_Emp2);
						while(rsPrev_Emp2.next())
						{	
						if(EmploymentProof3.equals(rsPrev_Emp2.getString("Doc_Id"))) 
						{		        
						%>					
							<option value="<%=rsPrev_Emp2.getString("Doc_Id")%>" selected="selected" style="font-weight: bold;"><%=rsPrev_Emp2.getString("Document_Name") %></option>
						<%
						}
						else
						{
						 %>	
							<option value="<%=rsPrev_Emp2.getString("Doc_Id")%>"><%=rsPrev_Emp2.getString("Document_Name") %></option>
						<%
						}
						}
						rsPrev_Emp2.close();
						smtPrev_Emp2.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }
			   		 if(EmploymentProof3.equalsIgnoreCase("Other")){			            	  
				      %>
					  <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
					  <%} else { %>
					  <option value="Other">Other</option>
					  <%} %>
				</select>
   			</td>
   			<td class="allBackColor">
   			<%if(EmploymentProof3.equalsIgnoreCase("Other")){ %>
   				<input type="text" size="15" value="<%=EmploymentProof3OtherDetails %>" id="txtEmployment3" name="txtEmployment3" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} else { %>
   				<input type="text" size="15"  id="txtEmployment3" name="txtEmployment3" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkEmployment3" />
   			</td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
               <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
            		<tr>
            			<td align="left" style="background-color: #d8d8d8;" class="allBackColor">
			                Last Drawn Pay Slip/s
            			</td>
            			<td align="right" style="width:22px;">
            		      <%
          					System.out.println(" Last Drawn Pay Slip/s ");
    						if((SlipProof_Data!=null) && (uploadDone==1))
      				            {
            				%>
            				<a onclick="return ShowDoc('8')"><img src="<%=recruitPath%>images/View.png" width="20px" height="20px"></a>
                       		<%
                       		}
                       		%>
                       </td>
            		</tr>
            	</table>
            </td>
   			<td class="allBackColor">
   				<select name="selPaySlip" id="selPaySlip" style="width: 150px;">
	            	  <option value="select">--Select--</option>
							   <%    
			         try
			         {   	
        				String queryPay_Slip= "select Doc_Id,Document_Name from documents_master where Doc_Id in(Select Doc_id from document_type_mapping where Type_Id = 9)and Is_Alive = 1";			        
				  		Statement smtPay_Slip = connection.createStatement();
						ResultSet rsPay_Slip = smtPay_Slip.executeQuery(queryPay_Slip);
						while(rsPay_Slip.next())
						{
						if (SlipProof.equals(rsPay_Slip.getString("Doc_Id"))) 
						{			        
						%>					
							<option value="<%=rsPay_Slip.getString("Doc_Id") %>" selected="selected" style="font-weight: bold;"><%=rsPay_Slip.getString("Document_Name") %></option>
						<%
						}
						else
						{
						 %>	
							<option value="<%=rsPay_Slip.getString("Doc_Id") %>"><%=rsPay_Slip.getString("Document_Name") %></option>
						<%
						}
						}
						rsPay_Slip.close();
						smtPay_Slip.close();
					 }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }
			   		 if (SlipProof.equalsIgnoreCase("Other")){			            	  
				 %>
				  <option value="Other" selected="selected" style="font-weight: bold;">Other</option>
				  <%} else { %>
				   <option value="Other">Other</option>
				   <%} %>
				</select>
  			</td>
   			<td class="allBackColor">
   			<%if (SlipProof.equalsIgnoreCase("Other")){	%>
   				<input type="text" size="15" value="<%=SlipProofOtherDetails %>" id="txtPaySlip" name="txtPaySlip" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} else { %>
   				<input type="text" size="15"  id="txtPaySlip" name="txtPaySlip" style="display: none;" class="wmta" onblur="Blur(this.id,'Other Details')" onfocus="Focus(this.id,'Other Details')" value="Other Details" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);"/>
   				<%} %>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkPaySlip" />
   			</td>
        </tr>
	   <%} %>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Transport Signoff
            </td>
   			<td class="allBackColor">
   				<input type="text" style="width: 150px;" readonly="readonly" value="Hard Copy" id="txtTransport" name="txtTransport" />
   			</td>
   			<td class="allBackColor">
   				<input type="text" size="15"  id="txtTransportVal" name="txtTransportVal" class="wmta" onblur="Blur(this.id,'Comments')" onfocus="Focus(this.id,'Comments')" value="Comments" oncopy="return false" onpaste="return false" oncut="return false"  onkeypress="return AllowChars(event);"/>
   			</td>
   			<td class="allBackColor">
   				<input type="checkbox" name="chkTransport" />
   			</td>
        </tr>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Documents Upload
            </td>
            
            <%  
                 
                String secqryfinalReg = "SELECT Bpo_Cand_Id FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+canId+"' and Upload_Done=1";
                System.out.println("secqryfinalReg"+secqryfinalReg);
                Statement stmtfinalReg = connection.createStatement();
				ResultSet rssfinalReg= stmtfinalReg.executeQuery(secqryfinalReg);
				boolean state=rssfinalReg.next();
				System.out.println("state"+state);
				%>
            <td colspan="3" align="left" style="width:150px;" class="allBackColor">
               <b>
					<%if(state==true) {%>
					<label style="color: green;" id="finalstate" > Done</label>
					<%}else { %>
					<label style="color: red;"> Not Done</label>
					<%} %>
			   </b>
			   <input type="hidden" id="hidExp" name="hidExp" value="<%=Work_Experience%>"/>
            </td>
         </tr>
          <tr>
	         <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
	          	Additional Documents Upload
	         </td>
	         <td  class="allBackColor" colspan="3">
	           <%
	           if(docCount == 0)
	           {
	           %>
	            <b><label style="color: red;"> Not Done </label></b>
	           <%
	           }
	           else if(docCount > 0 ) 
	           {
	           %> 
	          <b> <label style="color: green;" id="additionalDocstate" > Done</label></b>
	           , Total Documents :<%=docCount %>,&nbsp;&nbsp;&nbsp;<b><a style="text-align: right;color: maroon;" onclick="showAdditionalDocs()">View</a></b>
	           <%
	           }
	            %>
	         </td>
	     </tr>
         <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Action
            </td>
   			<td nowrap="nowrap" style="font-family: Arial;font-size: 13px;color: #41383C;">
				<input type="radio" NAME="select" VALUE="1" id="select" onclick="showOption(this.value);">
				Accept
			   <input type="radio" NAME="select" VALUE="2" id="select"  onclick="showOption(this.value);">
				Hold
			</td>
       		<td colspan="2" class="allBackColor" id="ActionCommentsDISP" style="display: none;">
   				<input type="text" size="20" value="" id="txtactioncommentsVal" name="txtactioncommentsVal" title="Hold Reason" oncopy="return false" onpaste="return false" oncut="return false"/>
   			</td>
        </tr>
        <tr>
            <td colspan="5" align="center">   
            	<input type="submit" name="submit" id="submit" value="Submit" class="buttonMedium"  />&nbsp;&nbsp;
				<span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, Please Wait...</font></b></span>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hidIDProof" value="<%=IDProof %>" />
         <input type="hidden" id="hidAddressProof" value="<%=AddressProof %>" />
         <input type="hidden" id="hidBirthProof" value="<%=BirthProof %>" />
         <input type="hidden" id="hidEducationProof" value="<%=EducationProof %>" />
         <input type="hidden" id="hidEmploymentProof" value="<%=EmploymentProof %>" />
         <input type="hidden" id="hidEmploymentProof2" value="<%=EmploymentProof2 %>" />
         <input type="hidden" id="hidEmploymentProof3" value="<%=EmploymentProof3 %>" />
         <input type="hidden" id="hidSlipProof" value="<%=SlipProof %>" />
  		<%
  	}
  
   %>
   <script type="text/javascript">
   
   	if(document.FinalCheckForm.hidEmploymentProof.value=="")
   	{
   		
	}
	else if(document.FinalCheckForm.hidEmploymentProof.value=="Fresher")
   	{
   		//document.FinalCheckForm.selID.value = document.FinalCheckForm.hidIDProof.value; 
		///document.FinalCheckForm.selAddress.value = document.FinalCheckForm.hidAddressProof.value;
		//document.FinalCheckForm.selBirth.value = document.FinalCheckForm.hidBirthProof.value;
		//document.FinalCheckForm.selEducation.value = document.FinalCheckForm.hidEducationProof.value; 
		//document.FinalCheckForm.selEmployment.value = document.FinalCheckForm.hidEmploymentProof.value; 
		//document.FinalCheckForm.selPaySlip.value = document.FinalCheckForm.hidSlipProof.value;
		
		//document.FinalCheckForm.txtID.value = document.FinalCheckForm.hidIDProof.value; 
		//document.FinalCheckForm.txtAddress.value = document.FinalCheckForm.hidAddressProof.value;
		//document.FinalCheckForm.txtBirth.value = document.FinalCheckForm.hidBirthProof.value;
		//document.FinalCheckForm.txtEducation.value = document.FinalCheckForm.hidEducationProof.value; 
		//document.FinalCheckForm.txtEmployment.value = document.FinalCheckForm.hidEmploymentProof.value; 
		//document.FinalCheckForm.txtPaySlip.value = document.FinalCheckForm.hidSlipProof.value;
		
		//document.FinalCheckForm.chkID.checked=true; 
		//document.FinalCheckForm.chkAddress.checked=true;
		//document.FinalCheckForm.chkBirth.checked=true;
		//document.FinalCheckForm.chkEducation.checked=true; 
		//document.FinalCheckForm.chkEmployment.checked=true; 
		//document.FinalCheckForm.chkPaySlip.checked=true;
   	}
   	else
   	{
   		
   		//document.FinalCheckForm.selID.value = document.FinalCheckForm.hidIDProof.value; 
		//document.FinalCheckForm.selAddress.value = document.FinalCheckForm.hidAddressProof.value;
		//document.FinalCheckForm.selBirth.value = document.FinalCheckForm.hidBirthProof.value;
		//document.FinalCheckForm.selEducation.value = document.FinalCheckForm.hidEducationProof.value; 
		//document.FinalCheckForm.selEmployment.value = document.FinalCheckForm.hidEmploymentProof.value; 
		//document.FinalCheckForm.selEmployment2.value = document.FinalCheckForm.hidEmploymentProof2.value;
		//document.FinalCheckForm.selEmployment3.value = document.FinalCheckForm.hidEmploymentProof3.value;
		//document.FinalCheckForm.selPaySlip.value = document.FinalCheckForm.hidSlipProof.value;
		
		//document.FinalCheckForm.txtID.value = document.FinalCheckForm.hidIDProof.value; 
		//document.FinalCheckForm.txtAddress.value = document.FinalCheckForm.hidAddressProof.value;
		//document.FinalCheckForm.txtBirth.value = document.FinalCheckForm.hidBirthProof.value;
		//document.FinalCheckForm.txtEducation.value = document.FinalCheckForm.hidEducationProof.value; 
		//document.FinalCheckForm.txtEmployment.value = document.FinalCheckForm.hidEmploymentProof.value;
		if(document.FinalCheckForm.hidEmploymentProof2.value==null)
		{
			document.FinalCheckForm.txtEmployment2.value ="";
		}
		else
		{
			//document.FinalCheckForm.txtEmployment2.value = document.FinalCheckForm.hidEmploymentProof2.value;
		} 
		if(document.FinalCheckForm.hidEmploymentProof3.value==null)
		{
			document.FinalCheckForm.txtEmployment3.value = "";
		}
		else
		{
			//document.FinalCheckForm.txtEmployment3.value = document.FinalCheckForm.hidEmploymentProof3.value;
		} 
		
		
		//document.FinalCheckForm.txtPaySlip.value = document.FinalCheckForm.hidSlipProof.value;
		//document.FinalCheckForm.chkID.checked=true; 
		//document.FinalCheckForm.chkAddress.checked=true;
		//document.FinalCheckForm.chkBirth.checked=true;
		//document.FinalCheckForm.chkEducation.checked=true; 
		//document.FinalCheckForm.chkEmployment.checked=true;
		//document.FinalCheckForm.chkEmployment2.checked=true; 
		//document.FinalCheckForm.chkEmployment3.checked=true;  
		//document.FinalCheckForm.chkPaySlip.checked=true;
   	}
   		
        document.FinalCheckForm.selResume.onchange = updateResume;
        document.FinalCheckForm.selPassPhotos.onchange = updatePhotos;
		document.FinalCheckForm.selID.onchange = updateID; 
		document.FinalCheckForm.selAddress.onchange = updateAddress; 
		document.FinalCheckForm.selBirth.onchange = updateBirth; 
		document.FinalCheckForm.selEducation.onchange = updateEducation; 
		if (document.FinalCheckForm.hidExp.value == "N" )
   		{
		document.FinalCheckForm.selEmployment.onchange = updateEmployment; 
		}
		if (document.FinalCheckForm.hidExp.value == "Y" )
   		{
		document.FinalCheckForm.selEmployment.onchange = updateEmployment; 
		document.FinalCheckForm.selEmployment2.onchange = updateEmployment2;
		document.FinalCheckForm.selEmployment3.onchange = updateEmployment3;
		document.FinalCheckForm.selPaySlip.onchange = updatePaySlip;  
		}
		function updateResume()
		{
		var obj_sel = document.FinalCheckForm.selResume.value; 
		if(obj_sel=="Other")
		{
		document.getElementById('txtResume').style.display="";
		}
		else
		{
		document.getElementById('txtResume').style.display="none";
		}
		}
		
		function updatePhotos() 
		{ 
		 
			var obj_sel = document.FinalCheckForm.selPassPhotos.value; 
			if(obj_sel=="Other")
			{
			document.getElementById('txtPassPhotos').style.display="";	
			} 
			else
			{
				document.getElementById('txtPassPhotos').style.display="none";	
			}
		} 
		
		function updateID() 
		{ 
			var obj_sel = document.FinalCheckForm.selID.value; 
			if(obj_sel=="Other")
			{
				document.getElementById('txtID').style.display="";	
			} 
			else
			{
				document.getElementById('txtID').style.display="none";	
			}
		} 
		
		function updateAddress() 
		{ 
			var obj_sel = document.FinalCheckForm.selAddress.value; 
			if(obj_sel=="Other")
			{
			document.getElementById('txtAddress').style.display="";		
			} 
			else
			{
				document.getElementById('txtAddress').style.display="none";
			}
		} 
		
		function updateBirth() 
		{ 
			var obj_sel = document.FinalCheckForm.selBirth.value; 
			if(obj_sel=="Other")
			{
				document.getElementById('txtBirth').style.display="";
			} 
			else
			{
				document.getElementById('txtBirth').style.display="none";
			}
		} 
		
		function updateEducation() 
		{ 
			var obj_sel = document.FinalCheckForm.selEducation.value; 
			if(obj_sel=="Other")
			{
				document.getElementById('txtEducation').style.display="";
			} 
			else
			{
				document.getElementById('txtEducation').style.display="none";
			}
		} 
		
		function updateEmployment() 
		{ 
			var obj_sel = document.FinalCheckForm.selEmployment.value; 
			if(obj_sel=="Other")
			{
				document.getElementById('txtEmployment').style.display="";
			} 
			else
			{
				document.getElementById('txtEmployment').style.display="none";
			}
		} 
		
		function updateEmployment2() 
		{ 
			var obj_sel = document.FinalCheckForm.selEmployment2.value; 
			if(obj_sel=="Other")
			{
			document.getElementById('txtEmployment2').style.display="";	
			} 
			else
			{
			document.getElementById('txtEmployment2').style.display="none";
			}
		} 
		
		function updateEmployment3() 
		{ 
			var obj_sel = document.FinalCheckForm.selEmployment3.value; 
			if(obj_sel=="Other")
			{
				document.getElementById('txtEmployment3').style.display="";
			} 
			else
			{
				document.getElementById('txtEmployment3').style.display="none";
			}
		} 
		
		function updatePaySlip() 
		{ 
			var obj_sel = document.FinalCheckForm.selPaySlip.value; 
			if(obj_sel=="Other")
			{
				document.getElementById('txtPaySlip').style.display="";
			} 
			else
			{
				document.getElementById('txtPaySlip').style.display="none";
			}
		} 
		
	</script>
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
