<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase" pageEncoding="utf-8"%>
<%@page import="java.sql.Blob"%>
<%@ include file="GlobalDeclare.jsp" %>
<%

String candId = null;
System.out.println("candId in Docupload submit page::::"+candId);
String UserTypeId = (String)session.getAttribute("User_Type_Id");
System.out.println("UserTypeId in SubmitUpdate page:::::::"+UserTypeId);
String UpdatedBy = "";
if(UserTypeId == null)
  	{
	  	candId = (String) session.getAttribute("USER_ID");
	  	UpdatedBy = candId;
	  	System.out.println("UpdatedBy"+UpdatedBy);
  	}
  	else
  	{
	  	String USER_ID = ((String)session.getAttribute("USER_ID")).trim();
	  	candId = (String) session.getAttribute("Bpo_Cand_Id");
	  	if(USER_ID == null)
		 {
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		 }
	  	UpdatedBy = USER_ID;
	  	System.out.println("UpdatedBy"+UpdatedBy);
	}
String WorkExperience= (String) session.getAttribute("WorkExperience");
	if(WorkExperience==null)
	{
		WorkExperience="";
	}
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
String query;
PreparedStatement updateQuery = null;
String queryFOR_getDOCS = "";
ResultSet rsDocs  = null;
Statement stDocs = null;
CallableStatement csDocs=null;
Blob CanResume_FileData = null;
Blob IDProof_DATA = null;
Blob AddressProof_DATA = null;
Blob BirthProof_DATA = null;
Blob EducationProof_DATA = null;
Blob EmploymentProof_Data = null;
Blob EmploymentProof2_Data = null;
Blob EmploymentProof3_Data = null;
Blob SlipProof_Data = null;

int IsPhotos=1;
String chkPhotos=(String) request.getParameter("chkPhotos");
	if(chkPhotos==null)
	{
		IsPhotos=0;
    }
	
 try
  {
  stDocs= connection.createStatement();
  queryFOR_getDOCS="{call BpoCandDocs_Encrypt_Proc(?,?,?)}"; //your procedure name
  csDocs=connection.prepareCall(queryFOR_getDOCS);
  csDocs.setString(1,candId);
  csDocs.setString(2,EDKey);
  csDocs.setString(3,EDKPass);
  rsDocs=csDocs.executeQuery();
	  if(rsDocs.next())
		{
		CanResume_FileData = rsDocs.getBlob("CanResume_FileData");
        System.out.println("CanResume_FileData ::::"+CanResume_FileData );
        IDProof_DATA  = rsDocs.getBlob("IDProof_DATA");
        System.out.println("IDProof_DATA::::"+IDProof_DATA);
        AddressProof_DATA = rsDocs.getBlob("AddressProof_DATA");
        System.out.println("AddressProof_DATA ::::"+AddressProof_DATA );
        BirthProof_DATA = rsDocs.getBlob("BirthProof_DATA");
        System.out.println("BirthProof_DATA ::::"+BirthProof_DATA );
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
	    }
		if(WorkExperience.equalsIgnoreCase("Y"))
		{
		   if((CanResume_FileData != null) && (IDProof_DATA != null) && (AddressProof_DATA != null) && (BirthProof_DATA != null) && (EducationProof_DATA != null) && (EmploymentProof_Data != null) && (SlipProof_Data != null))
		   {
			PreparedStatement Pupdatebpo=connection.prepareStatement("update bpo_candidatesreg_details set Upload_Done=? where Bpo_Cand_Id=?");
			Pupdatebpo.setInt(1,1);
			Pupdatebpo.setString(2,candId);
			System.out.println("Upload DOne of Doc::: updated in bpo_candidatesreg_details to 1  for Documents Upload::"+Pupdatebpo);
			Pupdatebpo.executeUpdate();
			Pupdatebpo.close(); 
			}
			else if(CanResume_FileData == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			    alert("Please Check/Re upload the Resume File !"); 
			    parent.location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	       }
			else if(IDProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			    alert("Please Check/Re upload the Id proof File !"); 
			    location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	        }
			else if(AddressProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re upload the Address proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	       }
			else if(BirthProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re upload the Birth proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	       }
			else if(EducationProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re upload the Education proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	       }
			else if((EmploymentProof_Data == null))
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re upload atleast one Experience proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	       }
			else if(SlipProof_Data == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re-upload the Slip proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	       }
			//updateQuery="update candidate_docuploads set IsPhotos="+IsPhotos+",SubmitDate=NOW() where CandidateID='" + candId + "'";
			updateQuery =connection.prepareStatement("update candidate_docuploads set IsPhotos =?,Uploaded_By = ?,Uploaded_On=NOW() where CandidateID =?");
			updateQuery.setInt(1,IsPhotos);
			updateQuery.setString(2,UpdatedBy);
			updateQuery.setString(3,candId);
			System.out.println("Upload DOne of Doc::: updated in bpo_candidatesreg_details to 1  for Documents Upload::"+updateQuery);
		}
		else
		{
		    if((CanResume_FileData!=null) && (IDProof_DATA!=null) && (AddressProof_DATA!=null) && (BirthProof_DATA!=null) && (EducationProof_DATA!=null))
		    {
			PreparedStatement Pupdatebpo=connection.prepareStatement("update bpo_candidatesreg_details set Upload_Done=? where Bpo_Cand_Id=?");
			Pupdatebpo.setInt(1,1);
			Pupdatebpo.setString(2,candId);
			System.out.println("Upload DOne of Doc::: updated in bpo_candidatesreg_details to 1  for Documents Upload::"+Pupdatebpo);
			Pupdatebpo.executeUpdate();
			Pupdatebpo.close(); 
			}
			else if(CanResume_FileData == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			    alert("Please Check/Re upload the Resume File !"); 
			    location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	        }
			else if(IDProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			    alert("Please Check/Re upload the Id proof File !"); 
			    location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	        }
			else if(AddressProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re upload the Address proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			 </script>
	       <%
	       }
			else if(BirthProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re upload the Birth proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	        }
			else if(EducationProof_DATA == null)
			{
			%>
			<script type="text/javascript" language="javascript">
			  alert("Please Check/Re upload the Education proof File !"); 
			  location.href= "<%=recruitPath%>jsp/Cand_Doc_Upload.jsp";
			</script>
	       <%
	        }
			//updateQuery="update candidate_docuploads set IsPhotos="+IsPhotos+",EmploymentProof2='Fresher',EmploymentProof3='Fresher',SlipProof='Fresher',SubmitDate=NOW() where CandidateID='" + candId + "'";
			updateQuery =connection.prepareStatement("update candidate_docuploads set IsPhotos =?,EmploymentProof2=?,EmploymentProof3=?,SlipProof=?,Uploaded_By = ?,Uploaded_On=NOW() where CandidateID =?");
			updateQuery.setInt(1,IsPhotos);
			updateQuery.setString(2,"Fresher");
			updateQuery.setString(3,"Fresher");
			updateQuery.setString(4,"Fresher");
			updateQuery.setString(5,UpdatedBy);
			updateQuery.setString(6,candId);
			System.out.println("Upload DOne of Doc::: updated in bpo_candidatesreg_details to 1  for Documents Upload::"+updateQuery);
			
		}
    }
	catch(Exception ex)
	{
	 ex.getStackTrace();
	 ex.printStackTrace();
	}
query="select Upload_Done from bpo_candidatesreg_details where Bpo_Cand_Id='" + candId + "'";
System.out.println("query Without experience:::"+query);
ResultSet rs=stmt.executeQuery(query);
int Uploaddone = 0;
if(rs.next())
{
	Uploaddone=rs.getInt("Upload_Done");
	System.out.println("Uploaddone:::"+Uploaddone);
}
if(Uploaddone == 1)
{
	updateQuery.executeUpdate();
	updateQuery.close();
	connection.close();
  	if(UserTypeId == null)
  	{
		response.sendRedirect(recruitPath+"jsp/Home_Page.jsp");
		session.setAttribute("Cand_DocUpload_Done",1);
		
  	}
  	else
  	{
		response.sendRedirect(recruitPath+"jsp/CanDocsUploadSuccess.jsp");
		session.setAttribute("Cand_DocUpload_Done",1);
		
  	}
}

%>

<html>
  <head>
    <title>[24]7</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    </head>
  <body>
  </body>
</html>
