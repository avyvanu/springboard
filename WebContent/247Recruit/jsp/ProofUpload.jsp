<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.io.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	
  //  String EDKey = "[24]7";
  // 	String EDKPass = "247Cust0m3r";
	
	String proofName= (String) request.getParameter("proofName");
	if(proofName==null)
	{
		proofName="";
	}
	System.out.println("Proof Upload Page:::proofname::::"+proofName);
	int ProofType = Integer.parseInt(request.getParameter("proofType"));
	System.out.println("Proof Upload Page:::ProofType Value::::"+ProofType);
	
	String proof= (String) session.getAttribute("proof");
	if(proof==null)
	{
		proof="";
	}
	System.out.println("Proof Upload page proof:::"+proof);
	String OtherDetails="";
	if(proof.equalsIgnoreCase("Other"))
	{
	OtherDetails= (String) session.getAttribute("OtherDetails"+ProofType);
	if((OtherDetails==null)||(OtherDetails.equalsIgnoreCase("Other Details")))
	{
		OtherDetails="";
	}
	System.out.println("Proof Upload Page:::Session OtherDetails:: otherDetails"+OtherDetails);
	}
	String redURL= (String) session.getAttribute("redURL"+ProofType);
	String candId= (String) session.getAttribute("candId");
	String updateQuery="";
	String insertQuery="";
	int MaxNumber=0;
	
	Connection connection=ConnectDatabase.getConnection();		
	Statement stmt=connection.createStatement();
	String query="select count(*) MaxNumber from candidate_docuploads_hist where CandidateID='" + candId + "'";
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
	  
	String ProofStatus = (String)session.getAttribute("ProofStatus"+ProofType);
	System.out.println("Proof Status:::--+++++"+ProofStatus);
	System.out.println("ProofUpload Page:::PROOFSTATUS::::::"+ProofType+" - "+ProofStatus);  
	
	if(MaxNumber==0)
	{
		MaxNumber=0;
	}
	
    if(ProofStatus.equalsIgnoreCase("0"))
    {
    	//to get the content type information from JSP Request Header
		String itemName = "";
		File savedFile = null;
	    Connection con = null;
	     FileInputStream fis = null;
	    try
	    {
			con = ConnectDatabase.getConnection();	 
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);			 
			if (!isMultipart) 
			{
			} 
			else 
			{
			   List  items= null;
			   FileItemFactory factory = new DiskFileItemFactory();
			   ServletFileUpload upload = new ServletFileUpload(factory);			  
			   try 
			   {
				   items = upload.parseRequest(request);  // required jara files 
				   System.out.println(" -- parseRequest -- "+items);
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
							   session.setAttribute( "FileName"+ProofType, itemName );							   
							   System.out.println(savedFile);
							   item.write(savedFile);
							   fis = new FileInputStream(savedFile);
							   System.out.println(" FILE INPUT STRAEM  ======"+ fis);  // 
						   }
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }
				  }
				if(proofName.equalsIgnoreCase("IDProof"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						   //updateQuery="INSERT INTO candidate_docuploads(CandidateID,IDProof,IDProof_OtherDetails,IsID,IDUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						   // System.out.println("Insert Query::::::Proof Upload::"+updateQuery);
						   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insertIDFROOF(?,?,?,?,?,?)");
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setBinaryStream(3, fis, (int) savedFile.length());
						   call.setString(4,OtherDetails);
						   call.setString(5,EDKey);
						   call.setString(6,EDKPass);
						   call.executeUpdate(); 
						   System.out.println("PROOF INSERT DATA INSERT ID proof>> \t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					}
					else
					{					
					   try 
					   {
					 // updateQuery="update candidate_docuploads set IsID=1,IDProof='" + proof + "',IDProof_OtherDetails='"+OtherDetails+"',IDUpdatedOn=NOW() where CandidateID='" + candId + "'";
					  //   System.out.println("updateQuery Query::::::Proof Upload::"+updateQuery);
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_Update_IDFROOF(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT id proof >> \t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					   
					   
					}
				}
				
				if(proofName.equalsIgnoreCase("AddressProof"))
				{
					if(MaxNumber==0)
					{
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,AddressProof,AddressProof_OtherDetails,IsAddress,AddressUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
					   try 
					   {
					   
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_ADDPROOF(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 
					   System.out.println("PROOF INSERT DATA INSERT insert proof>> \t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					   							
					}
					else
					{					
					 // 	updateQuery="update candidate_docuploads set IsAddress=1,AddressProof='" + proof + "',AddressProof_OtherDetails='"+OtherDetails+"',AddressUpdatedOn=NOW() where CandidateID='" + candId + "'";
					   try 
					   {
						
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_ADDPROOF(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update add proof\t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					   						
					}
				}
				
				if(proofName.equalsIgnoreCase("BirthProof"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,BirthProof,BirthProof_OtherDetails,IsBirth,BirthUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_BIRTHPROOF(?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setBinaryStream(3, fis, (int) savedFile.length());
					    call.setString(4,OtherDetails);
					    call.setString(5,EDKey);
					    call.setString(6,EDKPass);
					    call.executeUpdate(); 
					    System.out.println("PROOF INSERT DATA INSERT insert proof>> \t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					    	
						
					}
					else
					{					
					   try 
					   {
					   // updateQuery="update candidate_docuploads set IsBirth=1,BirthProof='" + proof + "',BirthProof_OtherDetails='"+OtherDetails+"',BirthUpdatedOn=NOW() where CandidateID='" + candId + "'";
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_BIRTHPROOF(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update add proof\t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					   
					}
				}
				
				if(proofName.equalsIgnoreCase("EducationProof"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,EducationProof,EducationProof_OtherDetails,IsEducation,EducationUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EDUCATIONPROOF(?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setBinaryStream(3, fis, (int) savedFile.length());
					    call.setString(4,OtherDetails);
					    call.setString(5,EDKey);
					    call.setString(6,EDKPass);
					    call.executeUpdate(); 
					    System.out.println("PROOF INSERT DATA INSERT insert Edu proof>> \t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
						
					}
					else
					{					
						// updateQuery="update candidate_docuploads set IsEducation=1,EducationProof='" + proof + "',EducationProof_OtherDetails='"+OtherDetails+"',EducationUpdatedOn=NOW() where CandidateID='" + candId + "'";
					   try 
					   {
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EDUCATIONPROOF(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update add proof\t"+((int)(savedFile.length())));						
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}
				if(proofName.equalsIgnoreCase("EmploymentProof"))
				{
					if(MaxNumber==0)
					{
						//updateQuery="INSERT INTO candidate_docuploads(CandidateID,EmploymentProof,EmplymntPrf_OtherDetails,IsEmployment,EmploymentUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
					   try 
					   {

						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EmploymentProof(?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setBinaryStream(3, fis, (int) savedFile.length());
					    call.setString(4,OtherDetails);
					    call.setString(5,EDKey);
					    call.setString(6,EDKPass);
					    call.executeUpdate(); 
					    System.out.println("PROOF INSERT DATA INSERT insert employe,ment proof>> \t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
					else
					{					
						
					   try 
					   {
						//updateQuery="update candidate_docuploads set IsEmployment=1,EmploymentProof='" + proof + "',EmplymntPrf_OtherDetails='"+OtherDetails+"',EmploymentUpdatedOn=NOW() where CandidateID='" + candId + "'";
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EmploymentProof(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement proof\t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}
				
				if(proofName.equalsIgnoreCase("EmploymentProof2"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,EmploymentProof2,EmplymntPrf2_OtherDetails,IsEmployment2,EmploymentUpdatedOn2) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EmploymentProof_2(?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setBinaryStream(3, fis, (int) savedFile.length());
					    call.setString(4,OtherDetails);
					    call.setString(5,EDKey);
					    call.setString(6,EDKPass);
					    call.executeUpdate(); 
					    System.out.println("PROOF INSERT DATA INSERT insert employe,ment 2 proof>> \t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
					else
					{					
					   try 
					   {
						// updateQuery="update candidate_docuploads set IsEmployment2=1,EmploymentProof2='" + proof + "',EmplymntPrf2_OtherDetails='"+OtherDetails+"',EmploymentUpdatedOn2=NOW() where CandidateID='" + candId + "'";
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EmploymentProof_2(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement 2 proof\t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}				
				if(proofName.equalsIgnoreCase("EmploymentProof3"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,EmploymentProof3,EmplymntPrf3_OtherDetails,IsEmployment3,EmploymentUpdatedOn3) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EmploymentProof_3(?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setBinaryStream(3, fis, (int) savedFile.length());
					    call.setString(4,OtherDetails);
					    call.setString(5,EDKey);
					    call.setString(6,EDKPass);
					    call.executeUpdate(); 
					    System.out.println("PROOF INSERT DATA INSERT insert employe,ment 3 proof >> \t"+((int)(savedFile.length())));						
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
					else
					{				// ENCRYPT_candidate_docuploads_update_EmploymentProof_3	
					   try 
					   {
						// updateQuery="update candidate_docuploads set IsEmployment3=1,EmploymentProof3='" + proof + "',EmplymntPrf3_OtherDetails='"+OtherDetails+"',EmploymentUpdatedOn3=NOW() where CandidateID='" + candId + "'";
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EmploymentProof_3(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement 3 proof\t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}				
				if(proofName.equalsIgnoreCase("SlipProof"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,SlipProof,SlipProof_OtherDetails,IsSlip,SlipUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_Slip(?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setBinaryStream(3, fis, (int) savedFile.length());
					    call.setString(4,OtherDetails);
					    call.setString(5,EDKey);
					    call.setString(6,EDKPass);
					    call.executeUpdate(); 

					    System.out.println("PROOF INSERT DATA INSERT insert employe,ment 3 proof >> \t"+((int)(savedFile.length())));						
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
					else
					{					
					   try 
					   {
						//updateQuery="update candidate_docuploads set IsSlip=1,SlipProof='" + proof + "',SlipProof_OtherDetails='"+OtherDetails+"',SlipUpdatedOn=NOW() where CandidateID='" + candId + "'";
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_Slip(?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setBinaryStream(3, fis, (int) savedFile.length());
					   call.setString(4,OtherDetails);
					   call.setString(5,EDKey);
					   call.setString(6,EDKPass);
					   call.executeUpdate(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement 3 proof\t"+((int)(savedFile.length())));							
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
			   	insertQuery="INSERT INTO candidate_docuploads_hist(CandidateID,ProofName,Proof,Proof_OtherDetails,FileName,UpdatedOn) VALUES('" + candId + "','" + proofName + "','" + proof + "','" +OtherDetails+ " ','" + itemName + "',NOW())";
			    System.out.println("Final insert:::insertQuery"+insertQuery);
				// stmt.executeUpdate(updateQuery);
				stmt.executeUpdate(insertQuery);
				session.setAttribute("ProofStatus"+ProofType, "1");
		  }
		  catch(Exception e)
		  {
			e.printStackTrace();
		  }
		}
		else
		{
			session.setAttribute("ProofStatus"+ProofType, "0");
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
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProofUpload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" language="javascript">
   		location.href= "<%=redURL%>";
  
  </script>
  </head>
  
  <body>
    
  </body>
</html>
