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
  	System.out.println("USER_Name"+USER_Name);
  	String USER_ID = (String)session.getAttribute("USER_ID");
	 if(USER_ID == null)
	  	{
	  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	String canId= (String) request.getParameter("candId");
	session.setAttribute( "Bpo_Cand_Id", canId );
	SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
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
	
	String fcl_photoID = "";
	String fcl_photoOtherDetails = "";
	String fcl_ResumeID = "";
	String fcl_resumeOtherDetails = "";
	String fcl_ID = "";
	String fcl_IDOtherDetails = "";
	String fcl_AddressID = "";
	String fcl_addressOtherDetails = "";
	String fcl_BirthID = "";
	String fcl_birthOtherDetails = "";
	String fcl_EducationID = "";
	String fcl_educationOtherDetails = "";
	String fcl_EmploymentID = "";
	String fcl_EmploymentOtherDetails = "";
	String fcl_EmploymentID2 = "";
	String fcl_EmploymentOtherDetails2 = "";
	String fcl_EmploymentID3 = "";
	String fcl_EmploymentOtherDetails3 = "";
	String fcl_PaySlipID = "";
	String fcl_PaySlipOtherDetails = "";
	String fcl_TransportID = "";
	String fcl_TransportOtherDetails2 = "";
	int fcl_Action = 0;
	String fcl_Action_Disp = "";
	String fcl_Hold_Reason = "";
	Date fcl_UpdatedOn = null;
	String fcl_UpdatedOn_Disp = "";
	
	ResultSet rsFinalChkdtls  = null;
	Statement stFinalChkdtls = null;
	String getFinalChkDtls = "select * from recruiter_finalchecklist where CandidateID = '"+canId+"'";
	System.out.println("getFinalChkDtls:::"+getFinalChkDtls);
	stFinalChkdtls = connection.createStatement();
	rsFinalChkdtls = stFinalChkdtls.executeQuery(getFinalChkDtls);
	if(rsFinalChkdtls.next())
	{
		fcl_photoID = rsFinalChkdtls.getString("Photos");
		if(fcl_photoID == null)
		{
		fcl_photoID = "";
		}
		System.out.println("fcl_photoID:::"+fcl_photoID);
		fcl_photoOtherDetails = rsFinalChkdtls.getString("PhotosOther");
		if(fcl_photoOtherDetails == null)
		{
		fcl_photoOtherDetails = "NA";
		}
		fcl_ID = rsFinalChkdtls.getString("ID");
		if(fcl_ID == null)
		{
		fcl_ID = "";
		}
		fcl_IDOtherDetails = rsFinalChkdtls.getString("IDOther");
		if(fcl_IDOtherDetails == null)
		{
		fcl_IDOtherDetails = "NA";
		}
		fcl_AddressID = rsFinalChkdtls.getString("Address");
		if(fcl_AddressID == null)
		{
		fcl_AddressID = "";
		}
		fcl_addressOtherDetails = rsFinalChkdtls.getString("AddressOther");
		if(fcl_addressOtherDetails == null)
		{
		fcl_addressOtherDetails = "NA";
		}
		fcl_BirthID = rsFinalChkdtls.getString("Birth");
		if(fcl_BirthID == null)
		{
		fcl_BirthID = "";
		}
		fcl_birthOtherDetails = rsFinalChkdtls.getString("BirthOther");
		if(fcl_birthOtherDetails == null)
		{
		fcl_birthOtherDetails = "NA";
		}
		fcl_EducationID = rsFinalChkdtls.getString("Education");
		if(fcl_EducationID == null)
		{
		fcl_EducationID = "";
		}
		fcl_educationOtherDetails = rsFinalChkdtls.getString("EducationOther");
		if(fcl_educationOtherDetails == null)
		{
		fcl_educationOtherDetails = "NA";
		}
		
		fcl_EmploymentID = rsFinalChkdtls.getString("Employment");
		if(fcl_EmploymentID == null)
		{
		fcl_EmploymentID = "";
		}
		fcl_EmploymentOtherDetails = rsFinalChkdtls.getString("EmploymentOther");
		if(fcl_EmploymentOtherDetails == null)
		{
		fcl_EmploymentOtherDetails = "NA";
		}
		
		fcl_EmploymentID2 = rsFinalChkdtls.getString("Employment2");
		if(fcl_EmploymentID2 == null)
		{
		fcl_EmploymentID2 = "";
		}
		fcl_EmploymentOtherDetails2 = rsFinalChkdtls.getString("EmploymentOther2");
		if(fcl_EmploymentOtherDetails2 == null)
		{
		fcl_EmploymentOtherDetails2 = "NA";
		}
		fcl_EmploymentID3 = rsFinalChkdtls.getString("Employment3");
		if(fcl_EmploymentID3 == null)
		{
		fcl_EmploymentID3 = "";
		}
		fcl_EmploymentOtherDetails3 = rsFinalChkdtls.getString("EmploymentOther3");
		if(fcl_EmploymentOtherDetails3 == null)
		{
		fcl_EmploymentOtherDetails3 = "NA";
		}
		fcl_PaySlipID = rsFinalChkdtls.getString("PaySlip");
		if(fcl_PaySlipID == null)
		{
		fcl_PaySlipID = "";
		}
		fcl_PaySlipOtherDetails = rsFinalChkdtls.getString("PaySlipOther");
		if(fcl_PaySlipOtherDetails == null)
		{
		fcl_PaySlipOtherDetails = "NA";
		}
		fcl_ResumeID = rsFinalChkdtls.getString("Resume");
		if(fcl_ResumeID == null)
		{
		fcl_ResumeID = "";
		}
		System.out.println("fcl_ResumeID::::"+fcl_ResumeID);
		fcl_resumeOtherDetails = rsFinalChkdtls.getString("ResumeComm");
		if(fcl_resumeOtherDetails == null)
		{
		fcl_resumeOtherDetails = "NA";
		}
		fcl_TransportID =  rsFinalChkdtls.getString("Transport");
	    if(fcl_TransportID == null)
		{
		fcl_TransportID = "";
		}
		fcl_TransportOtherDetails2 =  rsFinalChkdtls.getString("TransportComm");
		System.out.println("fcl_TransportOtherDetails2::::"+fcl_TransportOtherDetails2);
		if((fcl_TransportOtherDetails2 == null) || (fcl_TransportOtherDetails2.equalsIgnoreCase("")))
		{
		fcl_TransportOtherDetails2 = "NA";
		}
		fcl_UpdatedOn = rsFinalChkdtls.getDate("UpdatedOn");
		fcl_UpdatedOn_Disp = formatter.format(fcl_UpdatedOn); 
		fcl_Action =  rsFinalChkdtls.getInt("CheckList_Action");
		 if(fcl_Action == 1)
		 {
		 fcl_Action_Disp = "Accept";
		 }
		 else
		 {
		 fcl_Action_Disp = "Hold";
		 }
		 fcl_Hold_Reason = rsFinalChkdtls.getString("Hold_Reason");
		 if(fcl_Hold_Reason == null)
		 {
		 fcl_Hold_Reason = "NA";
		 }
	}
	rsFinalChkdtls.close();
	int docCount = 0;
	String getAdditionalDocDtls = "select Count(*) as Count from candidate_additional_docs_upload where CandidateID = '"+canId+"'";
	System.out.println("getAdditionalDocDtls:::::::"+getAdditionalDocDtls);
	rsFinalChkdtls = stFinalChkdtls.executeQuery(getAdditionalDocDtls);
	if(rsFinalChkdtls.next())
  	{
 		docCount = 	rsFinalChkdtls.getInt("Count");	
 		System.out.println("docCount:::::"+docCount);
  	}
	rsFinalChkdtls.close();
	
	ResultSet rsValidatedInfo  = null;
	Statement stValidatedInfo = null;
	String ValidatedOn = null;
	int ResumeChk = 0;
	int PhotosChk = 0;
	int IdProofChk = 0;
	int AddressProofChk = 0;
	int DOBchk = 0; 
	int EducationChk = 0; 
	int Experience1Chk = 0; 
	int Experience2Chk = 0; 
	int Experience3Chk = 0; 
	int PaySlipChk = 0; 
	int TransportChk = 0; 
	String getValidatedInfo = "select * from validate_candidate_offer_master where CandidateID = '"+canId+"'";
	System.out.println("getValidatedInfo:::"+getValidatedInfo);
	stValidatedInfo = connection.createStatement();
	rsValidatedInfo = stValidatedInfo.executeQuery(getValidatedInfo);
	if(rsValidatedInfo.next())
	{
	Date Validated_On = rsValidatedInfo.getDate("Validate_On"); 
	ValidatedOn = formatter.format(Validated_On); 
	ResumeChk = rsValidatedInfo.getInt("ResumeChk");
	PhotosChk = rsValidatedInfo.getInt("PhotosChk");
	IdProofChk = rsValidatedInfo.getInt("IdProofChk");
	AddressProofChk = rsValidatedInfo.getInt("AddressProofChk");
	DOBchk = rsValidatedInfo.getInt("DOBchk"); 
	EducationChk = rsValidatedInfo.getInt("EducationChk"); 
	Experience1Chk = rsValidatedInfo.getInt("Experience1Chk"); 
	Experience2Chk = rsValidatedInfo.getInt("Experience2Chk"); 
	Experience3Chk = rsValidatedInfo.getInt("Experience3Chk"); 
	PaySlipChk = rsValidatedInfo.getInt("PaySlipChk"); 
	TransportChk = rsValidatedInfo.getInt("TransportChk"); 
	}
	rsValidatedInfo.close();
	stValidatedInfo.close();
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
		session.setAttribute( "page", "Print_Validated_OfferRight.jsp" );	
	
	
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
    someWindow = window.open(urlForDocs,'ReasonWindow','height=400,width=640,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
    }
    function validateCandInfo()
	{
		if(confirm('Please click "OK" to Print, else "cancel".'))
		{
		var url = "<%=request.getContextPath()%>/247Recruit/jsp/Candidate_Complete_Info.jsp?CandidateId=<%=canId%>"
		someWindow = window.open(url,'ReasonWindow','height=600,width=900,scrollbars=yes,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
		return true;
		}
		else
		{
		return false;
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
  <form name="ValidateCheckForm" action="" method="post">
    <%
  	if(rs.next())
  	{
  		int RAG=rs.getInt("RAG");
  		System.out.println("RAG:::::"+RAG);
  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
  		int uploadDone = rs.getInt("Upload_Done");
  		System.out.println("Canidate Upload Status:::::"+uploadDone);
  		Date dateStr = rs.getDate("System_Date_Time");
  		String DOR = formatter.format(dateStr);  
    	
    	String Work_Experience=rs.getString("Work_Experience");
		session.setAttribute("WorkExperience",Work_Experience);
		%>
	<table cellpadding="6" cellspacing="6" width="500">
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
            <td colspan="2" class="allBackColor">
                <%=rs.getString("Bpo_Cand_Id")%>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="allBackColor">
                <%=canName %>
            </td>
        </tr>
        <tr>
         <td colspan="2" class="allBackColor">
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
        		if(resumeID == null)
        		{
        		resumeID = "";
        		}
		      	System.out.println("resumeID::"+resumeID);
		      	resumeOtherDetails = rsDocs.getString("CanResume_OtherDetails");
		      	if(resumeOtherDetails == null)
		      	{
		      	resumeOtherDetails = "NA";
		      	}
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
          <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
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
   			<td class="allBackColor" width="170">
   				<%    
		         String resumeDocument_Name = "";
		         try
		          {   	
	       			   if(!fcl_ResumeID.equalsIgnoreCase("Other"))
	       				{
		       				String queryResume= "select Document_Name from documents_master where Doc_Id = '"+fcl_ResumeID+"'";			        
					  		System.out.println("queryResume:::::::"+queryResume);
					  		Statement smtResume = connection.createStatement();
							ResultSet rsResume = smtResume.executeQuery(queryResume);
							System.out.println("resumeDocument_Name:::::::"+resumeDocument_Name);
							if(rsResume.next())
							{		
							resumeDocument_Name = rsResume.getString("Document_Name");	 
							  if(resumeDocument_Name == null)
							   {
							     resumeDocument_Name = "NA";
							   }       
							%>
							  <%=resumeDocument_Name %>
						    <%
						    }
						    else
						    {
						    %>
						    NA
						    <%
						    }
						    rsResume.close();
							smtResume.close();
						 }   
					   else if(fcl_ResumeID.equalsIgnoreCase("Other"))
					    {
					    %>
					    <%=fcl_ResumeID%>,&nbsp;<label class="allBackColor" style="width: 170px;">(<%=resumeOtherDetails %>) </label>
					    <%
				 	    }
				}
    	 	  catch(Exception e)
	   		    {
	   	  		e.printStackTrace();
	   		    }
	   		    %>
			</td>
   			
   			<td class="allBackColor" width="165">
   			           <%
   			           String ResumechkDISP = "";
   			           if(ResumeChk == 1)
   			           {
   			           	ResumechkDISP = "Valid";
   			           }
   			           if(ResumeChk == 2)
   			           {
   			           	ResumechkDISP = "Invalid";
   			           }
   			           if(ResumeChk == 0)
   			           {
   			           	ResumechkDISP = "NA";
   			           }
   			           %>
   			          <%=ResumechkDISP %>
   			</td>
   		</tr>
         
         
         
         
        <tr>
            <td colspan="2" align="left" class="allBackColor" style="background-color: #d8d8d8;">
                Passport Size Photos
            </td>
   			<td class="allBackColor">
				 <%
				 if(!fcl_photoID.equalsIgnoreCase("Other"))
				{
				%>
				 <%=fcl_photoID%>
				<%
				 }
				else if(fcl_photoID.equalsIgnoreCase("Other"))
				{
				%>
				<%=fcl_photoID%>,&nbsp;<label class="allBackColor">(<%=fcl_photoOtherDetails %>) </label>
			   <%} %>
			</td>
   			<td class="allBackColor">
   					<%
   			           String PhotochkDISP = "";
   			           if(PhotosChk == 1)
   			           {
   			           	PhotochkDISP = "Valid";
   			           }
   			           if(PhotosChk == 2)
   			           {
   			           	PhotochkDISP = "Invalid";
   			           }
   			           if(PhotosChk == 0)
   			           {
   			           	PhotochkDISP = "NA";
   			           }
   			           %>
   			          <%=PhotochkDISP %>
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
       			<td class="allBackColor" colspan="1">
       			  <%   
					String idDocument_Name = "";
				     try
				       {   	
	        		     if(!fcl_ID.equalsIgnoreCase("Other"))
		       			    {
		        				String queryid_proof= "select Document_Name from documents_master where Doc_Id = '"+fcl_ID+"'";			        
						  		System.out.println("queryid_proof:::::"+queryid_proof);
						  		Statement smtid_proof = connection.createStatement();
								ResultSet rsid_proof = smtid_proof.executeQuery(queryid_proof);
								if(rsid_proof.next())
								 {
								 idDocument_Name = 	rsid_proof.getString("Document_Name");	 
								   if(idDocument_Name == null)
								    {
									 idDocument_Name = "NA";
								    }
								  %>
									  <%=idDocument_Name %>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsid_proof.close();
								smtid_proof.close();
						   }
						else if(fcl_ID.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_ID%>,&nbsp;<label class="allBackColor" >(<%=fcl_IDOtherDetails %>) </label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
				</td>
  			<td class="allBackColor" colspan="1">
  					<%
   			           String IDchkDISP = "";
   			           if(IdProofChk == 1)
   			           {
   			           	IDchkDISP = "Valid";
   			           }
   			           if(IdProofChk == 2)
   			           {
   			           	IDchkDISP = "Invalid";
   			           }
   			           if(IdProofChk == 0)
   			           {
   			           	IDchkDISP = "NA";
   			           }
   			           %>
   			          <%=IDchkDISP %>
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
   			<td class="allBackColor" colspan="1">
   				<%   
					String addressDocument_Name = "";
				     try
				       {   	
	        		     if(!fcl_AddressID.equalsIgnoreCase("Other"))
		       			    {
		        				String queryaddress_proof= "select Document_Name from documents_master where Doc_Id = '"+fcl_AddressID+"'";			        
						  		System.out.println("queryaddress_proof"+queryaddress_proof);
						  		Statement smtaddress_proof = connection.createStatement();
								ResultSet rsaddress_proof = smtaddress_proof.executeQuery(queryaddress_proof);
								if(rsaddress_proof.next())
								 {
								 addressDocument_Name= 	rsaddress_proof.getString("Document_Name");	 
								   if(addressDocument_Name == null)
								    {
									 addressDocument_Name = "NA";
								    }
								  %>
									  <%=addressDocument_Name %>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsaddress_proof.close();
								smtaddress_proof.close();
						   }
						else if(fcl_AddressID.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_AddressID%>,&nbsp;<label class="allBackColor" >(<%=fcl_addressOtherDetails %>) </label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
   			</td>
   			<td class="allBackColor" colspan="1">
   			    <%
		           String AddresschkDISP = "";
		           if(AddressProofChk == 1)
		           {
		           	AddresschkDISP = "Valid";
		           }
		           if(AddressProofChk == 2)
		           {
		           	AddresschkDISP = "Invalid";
		           }
	              if(AddressProofChk == 0)
		           {
		           	AddresschkDISP = "NA";
		           }
		           %>
   			          <%=AddresschkDISP %>
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
   				<%   
					String birthDocument_Name = "";
				     try
				       {   	
	        		     if(!fcl_BirthID.equalsIgnoreCase("Other"))
		       			    {
		        				String queryDOB_Proof= "select Document_Name from documents_master where Doc_Id = '"+fcl_BirthID+"'";			        
						  		System.out.println("queryaddress_proof"+queryDOB_Proof);
						     	Statement smtDOB_Proof = connection.createStatement();
						        ResultSet rsDOB_Proof = smtDOB_Proof.executeQuery(queryDOB_Proof);
								if(rsDOB_Proof.next())
								 {
								 birthDocument_Name = 	rsDOB_Proof.getString("Document_Name");	 
								   if(birthDocument_Name == null)
								    {
									 birthDocument_Name = "NA";
								    }
								  %>
									  <%=birthDocument_Name %>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsDOB_Proof.close();
								smtDOB_Proof.close();
						   }
						else if(fcl_BirthID.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_BirthID%>,&nbsp;<label class="allBackColor" >(<%=fcl_birthOtherDetails %>) </label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
   			</td>
   			<td class="allBackColor">
   				 <%
		           String DOBchkDISP = "";
		           if(DOBchk == 1)
		           {
		           	DOBchkDISP = "Valid";
		           }
		           if(DOBchk == 2)
		           {
		           	DOBchkDISP = "Invalid";
		           }
	              if(DOBchk == 0)
		           {
		           	DOBchkDISP = "NA";
		           }
		           %>
   			          <%=DOBchkDISP %>
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
   			<td class="allBackColor" colspan="1">
   				<%   
					String educationDocument_Name = "";
				     try
				       {   	
	        		     if(!fcl_EducationID.equalsIgnoreCase("Other"))
		       			    {
		        				String queryEduProof= "select Document_Name from documents_master where Doc_Id = '"+fcl_EducationID+"'";			        
						  		System.out.println("queryaddress_proof"+queryEduProof);
						     	Statement smtEduProof = connection.createStatement();
						        ResultSet rsEduProof = smtEduProof.executeQuery(queryEduProof);
								if(rsEduProof.next())
								 {
								 educationDocument_Name = rsEduProof.getString("Document_Name");	 
								   if(educationDocument_Name == null)
								    {
									 educationDocument_Name = "NA";
								    }
								  %>
									  <%=educationDocument_Name %>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsEduProof.close();
								smtEduProof.close();
						   }
						else if(fcl_EducationID.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_EducationID%>,&nbsp;<label class="allBackColor" >(<%=fcl_educationOtherDetails %>)</label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
   			</td>
   			<td class="allBackColor" colspan="1">
   				 <%
		           String EducationchkDISP = "";
		           if(EducationChk == 1)
		           {
		           	EducationchkDISP = "Valid";
		           }
		           if(EducationChk == 2)
		           {
		           	EducationchkDISP = "Invalid";
		           }
	              if(EducationChk == 0)
		           {
		           	EducationchkDISP = "NA";
		           }
		           %>
   			          <%=EducationchkDISP %>
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
            <td class="allBackColor" colspan="1">
   				 <%   
					String employement1Document_Name = "";
				     try
				       {   	
	        		     if(!fcl_EmploymentID.equalsIgnoreCase("Other") && !fcl_EmploymentID.equalsIgnoreCase("Fresher"))
		       			    {
		        				String queryPrev_Emp= "select Document_Name from documents_master where Doc_Id = '"+fcl_EmploymentID+"'";			        
						  		System.out.println("queryPrev_Emp"+queryPrev_Emp);
						     	Statement smtPrev_Emp = connection.createStatement();
						        ResultSet rsPrev_Emp = smtPrev_Emp.executeQuery(queryPrev_Emp);
								if(rsPrev_Emp.next())
								 {
								 employement1Document_Name = rsPrev_Emp.getString("Document_Name");	 
								   if(employement1Document_Name == null)
								    {
									 employement1Document_Name = "NA";
								    }
								  %>
									  <%=employement1Document_Name%>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsPrev_Emp.close();
								smtPrev_Emp.close();
						   }
						   
						else if(fcl_EmploymentID.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_EmploymentID%>,&nbsp;<label class="allBackColor" >(<%=fcl_EmploymentOtherDetails %>) </label>
					    <%
				 	      }
				 	    else if(fcl_EmploymentID.equalsIgnoreCase("Fresher")) 
				 	    {
				 	    %>
				 	    <%=fcl_EmploymentID%>
				 	    <%
				 	    }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
   			</td>
   			<td class="allBackColor" colspan="1">
   				 <%
		           String EmployementchkDISP = "";
		           if(Experience1Chk == 1)
		           {
		           	EmployementchkDISP = "Valid";
		           }
		           if(Experience1Chk == 2)
		           {
		           	EmployementchkDISP = "Invalid";
		           }
	              if(Experience1Chk == 0)
		           {
		           	EmployementchkDISP = "NA";
		           }
		           %>
   			          <%=EmployementchkDISP %>
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
   				<%   
					String employement1Document_Name = "";
				     try
				       {   	
	        		     if(!fcl_EmploymentID.equalsIgnoreCase("Other"))
		       			    {
		        				String queryPrev_Emp= "select Document_Name from documents_master where Doc_Id = '"+fcl_EmploymentID+"'";			        
						  		System.out.println("queryPrev_Emp"+queryPrev_Emp);
						     	Statement smtPrev_Emp = connection.createStatement();
						        ResultSet rsPrev_Emp = smtPrev_Emp.executeQuery(queryPrev_Emp);
								if(rsPrev_Emp.next())
								 {
								 employement1Document_Name = rsPrev_Emp.getString("Document_Name");	 
								   if(employement1Document_Name == null)
								    {
									 employement1Document_Name = "NA";
								    }
								  %>
									  <%=employement1Document_Name%>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsPrev_Emp.close();
								smtPrev_Emp.close();
						   }
						else if(fcl_EmploymentID.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_EmploymentID%>,&nbsp;<label class="allBackColor" >(<%=fcl_EmploymentOtherDetails %>) </label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
   			</td>
   			<td class="allBackColor">
   			  	<%
		           String EmployementchkDISP = "";
		           if(Experience1Chk == 1)
		           {
		           	EmployementchkDISP = "Valid";
		           }
		           if(Experience1Chk == 2)
		           {
		           	EmployementchkDISP = "Invalid";
		           }
	              if(Experience1Chk == 0)
		           {
		           	EmployementchkDISP = "NA";
		           }
		           %>
   			          <%=EmployementchkDISP %>
   			</td>
   		 </tr>
        <tr>
   			<td class="allBackColor">
   				 <%   
					String employement2Document_Name = "";
				     try
				       {   	
	        		     if(!fcl_EmploymentID2.equalsIgnoreCase("Other"))
		       			    {
		        				String queryPrev_Emp2= "select Document_Name from documents_master where Doc_Id = '"+fcl_EmploymentID2+"'";			        
						  		System.out.println("queryPrev_Emp2"+queryPrev_Emp2);
						     	Statement smtPrev_Emp2 = connection.createStatement();
						        ResultSet rsPrev_Emp2 = smtPrev_Emp2.executeQuery(queryPrev_Emp2);
								if(rsPrev_Emp2.next())
								 {
								 employement2Document_Name = rsPrev_Emp2.getString("Document_Name");	 
								   if(employement2Document_Name == null)
								    {
									 employement2Document_Name = "NA";
								    }
								  %>
									  <%=employement2Document_Name%>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsPrev_Emp2.close();
								smtPrev_Emp2.close();
						   }
						else if(fcl_EmploymentID2.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_EmploymentID2%>,&nbsp;<label class="allBackColor" >(<%=fcl_EmploymentOtherDetails2 %>) </label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
   			</td>
   			<td class="allBackColor">
   			  	<%
		           String Employement2chkDISP = "";
		           if(Experience2Chk == 1)
		           {
		           	Employement2chkDISP = "Valid";
		           }
		           if(Experience2Chk == 2)
		           {
		           	Employement2chkDISP = "Invalid";
		           }
	              if(Experience2Chk == 0)
		           {
		           	Employement2chkDISP = "NA";
		           }
		           %>
   			          <%=Employement2chkDISP %>
   			</td>
   		 </tr>
        <tr>
   			<td class="allBackColor">
   				 <%   
					String employement3Document_Name = "";
				     try
				       {   	
	        		     if(!fcl_EmploymentID3.equalsIgnoreCase("Other"))
		       			    {
		        				String queryPrev_Emp3= "select Document_Name from documents_master where Doc_Id = '"+fcl_EmploymentID3+"'";			        
						  		System.out.println("queryPrev_Emp3"+queryPrev_Emp3);
						     	Statement smtPrev_Emp3 = connection.createStatement();
						        ResultSet rsPrev_Emp3 = smtPrev_Emp3.executeQuery(queryPrev_Emp3);
								if(rsPrev_Emp3.next())
								 {
								 employement3Document_Name = rsPrev_Emp3.getString("Document_Name");	 
								   if(employement3Document_Name == null)
								    {
									 employement3Document_Name = "NA";
								    }
								  %>
									  <%=employement3Document_Name%>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsPrev_Emp3.close();
								smtPrev_Emp3.close();
						   }
						else if(fcl_EmploymentID3.equalsIgnoreCase("Other"))
					      {
					    %>
					    <%=fcl_EmploymentID3%>,&nbsp;<label class="allBackColor" >(<%=fcl_EmploymentOtherDetails3 %>) </label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>
   			</td>
   			<td class="allBackColor">
   				<%
		           String Employement3chkDISP = "";
		           if(Experience3Chk == 1)
		           {
		           	Employement3chkDISP = "Valid";
		           }
		           if(Experience3Chk == 2)
		           {
		           	Employement3chkDISP = "Invalid";
		           }
	              if(Experience3Chk == 0)
		           {
		           	Employement3chkDISP = "NA";
		           }
		           %>
   			          <%=Employement3chkDISP %>
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
   			<td class="allBackColor" colspan="1">
   				<%   
					String paySlipDocument_Name = "";
				     try
				       {   	
	        		     if(!fcl_PaySlipID.equalsIgnoreCase("Other") && !fcl_PaySlipID.equalsIgnoreCase("Fresher"))
		       			    {
		        				String queryPay_Slip= "select Document_Name from documents_master where Doc_Id = '"+fcl_PaySlipID+"'";			        
						  		System.out.println("queryPay_Slip"+queryPay_Slip);
						     	Statement smtPay_Slip = connection.createStatement();
						        ResultSet rsPay_Slip = smtPay_Slip.executeQuery(queryPay_Slip);
								if(rsPay_Slip.next())
								 {
								 paySlipDocument_Name = rsPay_Slip.getString("Document_Name");	 
								   if(paySlipDocument_Name == null)
								    {
									 paySlipDocument_Name = "NA";
								    }
								  %>
									  <%=paySlipDocument_Name%>
								    <%
								 }
								else
								{
								%>
								NA
								<%
								}
								rsPay_Slip.close();
								smtPay_Slip.close();
						   }
						 else if(fcl_PaySlipID.equalsIgnoreCase("Other") || fcl_PaySlipID.equalsIgnoreCase("Fresher"))
					      {
					    %>
					    <%=fcl_PaySlipID%>,&nbsp;<label class="allBackColor" >(<%=fcl_PaySlipOtherDetails %>) </label>
					    <%
				 	      }
				      }
			    	 catch(Exception e)
			   		 {
			   	  		e.printStackTrace();
			   		 }			            	  
			         %>

  			</td>
   			<td class="allBackColor" colspan="1">
   				<%
		           String paySlipchkDISP = "";
		           if(PaySlipChk == 1)
		           {
		           	paySlipchkDISP = "Valid";
		           }
		           if(PaySlipChk == 2)
		           {
		           	paySlipchkDISP = "Invalid";
		           }
	              if(PaySlipChk == 0)
		           {
		           	paySlipchkDISP = "NA";
		           }
		           %>
   			          <%=paySlipchkDISP %>
   			</td>
   		</tr>
	   <%} %>
        <tr>
            <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
                Transport Signoff
            </td>
   			<td class="allBackColor">
   				<%=fcl_TransportID %>,&nbsp;<label class="allBackColor" >(<%=fcl_TransportOtherDetails2 %>) </label>
   			</td>
   			<td class="allBackColor">
   				<%
		           String transportchkDISP = "";
		           if(TransportChk == 1)
		           {
		           	transportchkDISP = "Valid";
		           }
		           if(TransportChk == 2)
		           {
		           	transportchkDISP = "Invalid";
		           }
	              if(TransportChk == 0)
		           {
		           	transportchkDISP = "NA";
		           }
		           %>
   			          <%=transportchkDISP %>
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
            <td colspan="2" align="left"  class="allBackColor">
               <b>
					<%if(state==true) {%>
					<label style="color: green;" id="finalstate" > Done</label>
					<%}else { %>
					<label style="color: red;"> Not Done</label>
					<%} %>
			   </b>
			   <input type="hidden" id="hidExp" name="hidExp" value="<%=Work_Experience%>"/>
			   <input type="hidden" id="CandidateId" name="CandidateId" value="<%=canId%>"/>
			</td>
         </tr>
           <tr>
	         <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
	          	Additional Documents Upload
	         </td>
	         <td  class="allBackColor" colspan="2">
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
	          Final-CheckList Completed On 
	         </td>
	         <td  class="allBackColor" colspan="2">
	          <%=fcl_UpdatedOn_Disp %>
	         </td>
	     </tr>
	     <tr>
	         <td colspan="2" align="left" style="background-color: #d8d8d8;" class="allBackColor">
	          	Offer Validated On
	         </td>
	         <td  class="allBackColor" colspan="2">
	          <%=ValidatedOn %>
	         </td>
	     </tr>
	    <tr>
            <td colspan="4" align="center">   
            	<input type="button" name="submit" id="submit" value="Print" class="buttonLarge" onclick="validateCandInfo()"  />&nbsp;&nbsp;
				<span id="processing" style="display:none;"><b><font color="#000033" style="font-size: 12px;font-family: Arial,Helvetica,sans-serif;" class="taL" >Processing, Please Wait...</font></b></span>
            </td>
        </tr>
    </table>
  <%
  	}
  }
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             