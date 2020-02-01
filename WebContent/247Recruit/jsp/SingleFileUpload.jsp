<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.io.*" pageEncoding="utf-8"%>
<%@page import="java.util.Date"%>
<%@ include file="GlobalDeclare.jsp" %>
<%		
		String UserTypeId = (String)session.getAttribute("User_Type_Id");
		System.out.println("UserTypeId in DocumentUpload page:::::::"+UserTypeId);
	    String UpdatedBy = "";
	    PreparedStatement insertQuery = null;
	    String candId = null;
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
		System.out.println("candId in DocumentUpload page:::::::"+candId);
		String proofName = (String)session.getAttribute("proofName");
		if(proofName==null)
		{
			proofName="";
		}
		int proof = 1;
		System.out.println("SingleFileUpload::::Proof Name:::::"+proofName);
		String OtherDetails="";
		  		
	  		
// ***************************************************************************************************
		String itemName = "";
		String itemNameSize = "";
		File savedFile = null;
		Connection con = null;
		FileInputStream fis = null;
	    int imagelength = 0;
	    int imagelengthKB = 0;
	    try
		{   
			con = ConnectDatabase.getConnection();	 
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);		 
			if (isMultipart) 
			{
			   List  items= null;
			   FileItemFactory factory = new DiskFileItemFactory();
			   ServletFileUpload upload = new ServletFileUpload(factory);			  
			   try 
			   {
				   items = upload.parseRequest(request);  // required jara files 
				   System.out.println(" -- parseRequest -- "+items.size());
			   } 
			   catch (Exception e) 
			   {
				   e.printStackTrace();
				   System.out.println(e.getMessage());
			   }
			   Iterator itr = items.iterator();
			   if(itr.hasNext()) 
			   {
				   FileItem item = (FileItem) itr.next();
				   if (item.isFormField())
				   {
				      String name = item.getFieldName();
				      System.out.println(name);
				   }
				   else 
				   {
					   try 
					   {
						   itemName = item.getName();
						   if(itemName !="")
						   {
							   System.out.println(" printing documentname ======"+ itemName);  // 
							   savedFile = new File(itemName);
							   System.out.println(savedFile);
							   item.write(savedFile);
							   fis = new FileInputStream(savedFile);
							   imagelength = (int)savedFile.length();
							   System.out.println(" imagelength  ======"+ imagelength);
							   System.out.println(" FILE INPUT STRAEM  ======"+ fis);  // 
						   }
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }
				   }
				   if(imagelength > 10485760)
					{
					%>
					<script type="text/javascript" language="javascript">
					    alert("Please Upload file less than 1Mb in size!"); 
					    <%
					    if(UserTypeId == null)
	  					{
	  					%>
						  parent.location.href= "<%=recruitPath%>jsp/Cand_Resume_Upload.jsp";
						<%
						}
						else
						{
						%>  
						parent.parent.location.href= "<%=recruitPath%>jsp/Cand_Resume_Update.jsp";
						<%
						}
						%>
					</script>
			       <%
					}
					else 
					{
						try 
					   {
						   imagelengthKB = imagelength/1024;
						   System.out.println(" imagelengthKB  ======"+ imagelengthKB);
						   System.out.println(" itemName  ======"+ itemName);
						   itemNameSize = itemName + " " + "(" + imagelength + ")" ;
						   System.out.println(" itemNameSize  ======"+ itemNameSize);
						   CallableStatement call = con.prepareCall("call ENCRYPT_SingleResumeINSERT_Proc(?,?,?,?,?,?,?,?,?)");
						   System.out.println(call);
						   call.setString(1,candId);
						   call.setInt(2,proof);
						   call.setString(3,itemName);
						   call.setString(4,itemNameSize);
						   call.setBinaryStream(5, fis, (int) savedFile.length());
						   call.setString(6,OtherDetails);
						   call.setInt(7,imagelengthKB);
						   call.setString(8,EDKey);
						   call.setString(9,EDKPass);
						   System.out.println("PROOF UPLOAD DATA INSERT Resume proof >> \t"+((int)(savedFile.length())));
						   call.executeUpdate(); 
						   fis.close();
						   savedFile.delete();
						}
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }
					}
				}
					   
				insertQuery  = con.prepareStatement("INSERT INTO candidate_resumeupdatehistory(CandidateID,MaxCopyNo,FileName,Resume_Proof,Proof_OtherDetails,Uploaded_By,Uploaded_On) VALUES(?,?,?,?,?,?,NOW())");
				insertQuery.setString(1,candId);
				insertQuery.setInt(2,imagelengthKB);
				insertQuery.setString(3,itemName);
				insertQuery.setString(4,proofName);
				insertQuery.setString(5,OtherDetails);
				insertQuery.setString(6,UpdatedBy);
						   	
			   }
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	    
// ***************************************************************************************************         
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	<%
	try
	{
	String queryResupload = "select IsResumeUpload from bpo_candidatesreg_details where Bpo_Cand_Id='" + candId + "'";
	System.out.println("query IsResumeUpload:::"+queryResupload);
	con = ConnectDatabase.getConnection();	 
	Statement stmt = con.createStatement();
	ResultSet rsResupload = stmt.executeQuery(queryResupload);
	int resUploaddone = 0;
		if(rsResupload.next())
		{
			resUploaddone=rsResupload.getInt("IsResumeUpload");
			System.out.println("resUploaddone:::"+resUploaddone);
		}
	rsResupload.close();
	stmt.close();
	con.close();
	if(resUploaddone == 1)
	 {
		insertQuery.executeUpdate();
		insertQuery.close();
		con.close();
	  	if(UserTypeId == null)
	  	{
	  	%>
		  	alert("Uploaded Successfully.  !"); 
			parent.location.href= "<%=recruitPath%>jsp/Home_Page.jsp";
		<%
		}
		else
	  	{
		%>
			alert("Uploaded Successfully.  !"); 
			parent.parent.location.href= "<%=recruitPath%>jsp/Cand_Resume_Update.jsp";
		<%
		}
	  }
	  }
	  
	  catch(Exception ex)
	  {
	  	ex.printStackTrace();
	  }
		%>
	</script>
	</head>
</html>
