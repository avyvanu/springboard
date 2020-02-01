<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.io.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	
	String proofName = request.getParameter("proofName");
	String candId = null;
	System.out.println("proofName:::"+proofName);
	String proofType = request.getParameter("proofType");
	System.out.println("proofType::::"+proofType);
	String documentDescription = request.getParameter("documentDescription");
	System.out.println("documentDescription::::"+documentDescription);
	String redURL= (String) session.getAttribute("redAdditionalURL"+proofType);
	System.out.println("redURL::::"+redURL);
	String UserTypeId = (String)session.getAttribute("User_Type_Id");
	System.out.println("UserTypeId in DocumentUpload page:::::::"+UserTypeId);
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
	System.out.println("candId in AdditionalDocumentUpload page:::::::"+candId);
	int MaxNumber=0;
	Connection connection=ConnectDatabase.getConnection();		
	Statement stmt=connection.createStatement();
	String query="select count(*) MaxNumber from candidate_additional_docs_upload where CandidateID='" + candId + "'";
	ResultSet rs=stmt.executeQuery(query);
		if(rs.next())
		{
			MaxNumber=(int)rs.getInt("MaxNumber");
			System.out.println("Max Number::::"+MaxNumber+" queryqueryquery  \t"+query);
		}
		else
		{
			MaxNumber=0;
		}
		if(MaxNumber > 15)
		{
			session.setAttribute("docCheck","maxDocsExceeds");
			response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Cand_Additional_Doc_Upload_Check.jsp");
		} 
	    
	    
	  else
	  {
	  //to get the content type information from JSP Request Header
		String itemName = "";
		File savedFile = null;
	    Connection con = null;
	    FileInputStream fis = null;
	    int imagelength = 0;
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
				   session.setAttribute("docCheck","maxDocSize");
				   response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Cand_Additional_Doc_Upload_Check.jsp");
				}
				else
				 {
				  try 
					 {
					   CallableStatement call = con.prepareCall("call candidate_additional_docUpload(?,?,?,?,?,?,?,?)");
					   System.out.println(call);
					   call.setString(1,candId);
					   call.setString(2,proofType);
					   call.setString(3,documentDescription);
					   call.setString(4,itemName);
					   call.setBinaryStream(5, fis, (int) savedFile.length());
					   call.setString(6,UpdatedBy);
					   call.setString(7,EDKey);
					   call.setString(8,EDKPass);
					   System.out.println("PROOF UPLOAD DATA \t"+((int)(savedFile.length())));
					   call.executeUpdate(); 
					   fis.close();
					   savedFile.delete();
					   System.out.println("PROOF INSERT DATA Resume insert data proof>> \t"+((int)(savedFile.length())));
				      }
			   catch (Exception e) 
			     {
				   e.printStackTrace();
				   System.out.println(e.getMessage());
			     }					   
						
			 }		   	
		   }
	     }
	   }
	  catch(Exception e)
	  {
		e.printStackTrace();
	  }
	 } 
	%>
	<%
		stmt.close();
		rs.close();
		connection.close();
	%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>[24]7 SPRINGBOARD</title>
    
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" language="javascript">
   		parent.location.href= "<%=redURL%>";
  </script>
  </head>
  
  <body>
    
  </body>
</html>
