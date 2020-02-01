<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.io.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<%
	
    // String EDKey = "[24]7";
   	//  String EDKPass = "247Cust0m3r";
	int ProofType = 0;
	String candId = null;
	String proofName= (String) request.getParameter("proofName");	
	if(proofName==null)
	{
		proofName="";
	}
	System.out.println("Proof Upload Page:::proofname:::: \t"+proofName);
	try
	{
		ProofType = Integer.parseInt(request.getParameter("proofType"));
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	System.out.println("Proof Upload Page:::ProofType Value::::"+ProofType);
	String proof= (String) request.getParameter("selectedDocId"); 
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
	System.out.println("candId in DocumentUpload page:::::::"+candId);
	PreparedStatement insertQuery= null;
	int MaxNumber=0;
	Connection connection=ConnectDatabase.getConnection();		
	Statement stmt=connection.createStatement();
	String query="select count(*) MaxNumber from candidate_docuploads where CandidateID='" + candId + "'";
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
	 if(MaxNumber==0)
	{
		MaxNumber=0;
	} 
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
			%>
			<script type="text/javascript" language="javascript">
			    alert("Please Upload file less than 1Mb in size!"); 
			  parent.location.href= "<%=redURL%>";
			</script>
	       <%
			}
			else
			{
			
			  if(proofName.equalsIgnoreCase("Resume"))
				  {
					if(MaxNumber==0)
					{
					   try 
					   {
						   CallableStatement call = con.prepareCall("call ENCRYPT_SingleFileUpload_ResumeINSERT_Proc(?,?,?,?,?,?,?)");
						   System.out.println(call);
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setString(3,itemName);
						   call.setBinaryStream(4, fis, (int) savedFile.length());
						   call.setString(5,OtherDetails);
						   call.setString(6,EDKey);
						   call.setString(7,EDKPass);
						   System.out.println("PROOF UPLOAD DATA INSERT id proof >> \t"+((int)(savedFile.length())));
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
					else
					{					
					   try 
					   {
						   CallableStatement call = con.prepareCall("call ENCRYPT_SingleFileUpload_ResumeUPDATE_Proc(?,?,?,?,?,?,?)");
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setString(3,itemName);
						   call.setBinaryStream(4, fis, (int) savedFile.length());
						   call.setString(5,OtherDetails);
						   call.setString(6,EDKey);
						   call.setString(7,EDKPass);
						   call.executeUpdate(); 
						   fis.close();
						   savedFile.delete();
						   System.out.println("PROOF INSERT DATA Resume update data proof>> \t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }
					}
				}
				if(proofName.equalsIgnoreCase("ID Proof"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						   //updateQuery="INSERT INTO candidate_docuploads(CandidateID,IDProof,IDProof_OtherDetails,IsID,IDUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						   // System.out.println("Insert Query::::::Proof Upload::"+updateQuery);
						   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insertIDFROOF(?,?,?,?,?,?,?)");
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setString(3,itemName);
						   call.setBinaryStream(4, fis, (int) savedFile.length());
						   call.setString(5,OtherDetails);
						   call.setString(6,EDKey);
						   call.setString(7,EDKPass);
						   call.executeUpdate(); 
						   fis.close();
						   savedFile.delete();
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
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_Update_IDFROOF(?,?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setString(3,itemName);
					   call.setBinaryStream(4, fis, (int) savedFile.length());
					   call.setString(5,OtherDetails);
					   call.setString(6,EDKey);
					   call.setString(7,EDKPass);
					   call.executeUpdate();
					   fis.close();
					   savedFile.delete(); 				   	
					   System.out.println("PROOF UPLOAD DATA INSERT id proof >> \t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					   
					   
					}
				}
				
				
				if(proofName.equalsIgnoreCase("Address Proof"))
				{
					if(MaxNumber==0)
					{
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,AddressProof,AddressProof_OtherDetails,IsAddress,AddressUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
					   try 
					   {
					   
						   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_ADDPROOF(?,?,?,?,?,?,?)");
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setString(3,itemName);
						   call.setBinaryStream(4, fis, (int) savedFile.length());
						   call.setString(5,OtherDetails);
						   call.setString(6,EDKey);
						   call.setString(7,EDKPass);
						   call.executeUpdate(); 
						   fis.close();
						   savedFile.delete();
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
						   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_ADDPROOF(?,?,?,?,?,?,?)");
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setString(3,itemName);
						   call.setBinaryStream(4, fis, (int) savedFile.length());
						   call.setString(5,OtherDetails);
						   call.setString(6,EDKey);
						   call.setString(7,EDKPass);
						   call.executeUpdate(); 
						   fis.close();
						   savedFile.delete();				   	
						   System.out.println("PROOF UPLOAD DATA INSERT >> update add proof\t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   
					   						
					}
				}
				
				if(proofName.equalsIgnoreCase("Date of Birth Proof"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,BirthProof,BirthProof_OtherDetails,IsBirth,BirthUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_BIRTHPROOF(?,?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setString(3,itemName);
					    call.setBinaryStream(4, fis, (int) savedFile.length());
					    call.setString(5,OtherDetails);
					    call.setString(6,EDKey);
					    call.setString(7,EDKPass);
					    call.executeUpdate(); 
					    fis.close();
						savedFile.delete();
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
						   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_BIRTHPROOF(?,?,?,?,?,?,?)");
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setString(3,itemName);
						   call.setBinaryStream(4, fis, (int) savedFile.length());
						   call.setString(5,OtherDetails);
						   call.setString(6,EDKey);
						   call.setString(7,EDKPass);
						   call.executeUpdate(); 		
						   fis.close();
						   savedFile.delete();		   	
						   System.out.println("PROOF UPLOAD DATA INSERT >> update add proof\t"+((int)(savedFile.length())));
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }
					}
				}				
				if(proofName.equalsIgnoreCase("Education"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,EducationProof,EducationProof_OtherDetails,IsEducation,EducationUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
							CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EDUCATIONPROOF(?,?,?,?,?,?,?)");
						    call.setString(1,candId);
						    call.setString(2,proof);
						    call.setString(3,itemName);
						    call.setBinaryStream(4, fis, (int) savedFile.length());
						    call.setString(5,OtherDetails);
						    call.setString(6,EDKey);
						    call.setString(7,EDKPass);
						    call.executeUpdate(); 
						    fis.close();
						    savedFile.delete();
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
						   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EDUCATIONPROOF(?,?,?,?,?,?,?)");
						   call.setString(1,candId);
						   call.setString(2,proof);
						   call.setString(3,itemName);
						   call.setBinaryStream(4, fis, (int) savedFile.length());
						   call.setString(5,OtherDetails);
						   call.setString(6,EDKey);
						   call.setString(7,EDKPass);
						   call.executeUpdate(); 
						   fis.close();
						   savedFile.delete();				   	
						   System.out.println("PROOF UPLOAD DATA INSERT >> update add proof\t"+((int)(savedFile.length())));						
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}
				if(proofName.equalsIgnoreCase("Experience 1"))
				{
					if(MaxNumber==0)
					{
						//updateQuery="INSERT INTO candidate_docuploads(CandidateID,EmploymentProof,EmplymntPrf_OtherDetails,IsEmployment,EmploymentUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
					   try 
					   {
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EmploymentProof(?,?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setString(3,itemName);
					    call.setBinaryStream(4, fis, (int) savedFile.length());
					    call.setString(5,OtherDetails);
					    call.setString(6,EDKey);
					    call.setString(7,EDKPass);
					    call.executeUpdate(); 
					    fis.close();
						savedFile.delete();
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
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EmploymentProof(?,?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setString(3,itemName);
					   call.setBinaryStream(4, fis, (int) savedFile.length());
					   call.setString(5,OtherDetails);
					   call.setString(6,EDKey);
					   call.setString(7,EDKPass);
					   call.executeUpdate(); 
					   fis.close();
					   savedFile.delete();				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement proof\t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}
				
				if(proofName.equalsIgnoreCase("Experience 2"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,EmploymentProof2,EmplymntPrf2_OtherDetails,IsEmployment2,EmploymentUpdatedOn2) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EmploymentProof_2(?,?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setString(3,itemName);
					    call.setBinaryStream(4, fis, (int) savedFile.length());
					    call.setString(5,OtherDetails);
					    call.setString(6,EDKey);
					    call.setString(7,EDKPass);
					    call.executeUpdate(); 
					    fis.close();
						savedFile.delete();
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
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EmploymentProof_2(?,?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setString(3,itemName);
					   call.setBinaryStream(4, fis, (int) savedFile.length());
					   call.setString(5,OtherDetails);
					   call.setString(6,EDKey);
					   call.setString(7,EDKPass);
					   call.executeUpdate(); 
					   fis.close();
					   savedFile.delete();				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement 2 proof\t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}				
				if(proofName.equalsIgnoreCase("Experience 3"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,EmploymentProof3,EmplymntPrf3_OtherDetails,IsEmployment3,EmploymentUpdatedOn3) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_EmploymentProof_3(?,?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setString(3,itemName);
					    call.setBinaryStream(4, fis, (int) savedFile.length());
					    call.setString(5,OtherDetails);
					    call.setString(6,EDKey);
					    call.setString(7,EDKPass);
					    call.executeUpdate(); 
					    fis.close();
						savedFile.delete();
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
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_EmploymentProof_3(?,?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setString(3,itemName);
					   call.setBinaryStream(4, fis, (int) savedFile.length());
					   call.setString(5,OtherDetails);
					   call.setString(6,EDKey);
					   call.setString(7,EDKPass);
					   call.executeUpdate(); 
					   fis.close();
					   savedFile.delete();				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement 3 proof\t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}				
				if(proofName.equalsIgnoreCase("Last Drawn Pay Slip/s"))
				{
					if(MaxNumber==0)
					{
					   try 
					   {
						// updateQuery="INSERT INTO candidate_docuploads(CandidateID,SlipProof,SlipProof_OtherDetails,IsSlip,SlipUpdatedOn) VALUES('" + candId + "','" + proof + "','"+OtherDetails+"',1,NOW())";
						CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_insert_Slip(?,?,?,?,?,?,?)");
					    call.setString(1,candId);
					    call.setString(2,proof);
					    call.setString(3,itemName);
					    call.setBinaryStream(4, fis, (int) savedFile.length());
					    call.setString(5,OtherDetails);
					    call.setString(6,EDKey);
					    call.setString(7,EDKPass);
					    call.executeUpdate(); 
                        fis.close();
						savedFile.delete();
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
					   CallableStatement call = con.prepareCall("call ENCRYPT_candidate_docuploads_update_Slip(?,?,?,?,?,?,?)");
					   call.setString(1,candId);
					   call.setString(2,proof);
					   call.setString(3,itemName);
					   call.setBinaryStream(4, fis, (int) savedFile.length());
					   call.setString(5,OtherDetails);
					   call.setString(6,EDKey);
					   call.setString(7,EDKPass);
					   call.executeUpdate(); 
					   fis.close();
					   savedFile.delete();				   	
					   System.out.println("PROOF UPLOAD DATA INSERT >> update employement 3 proof\t"+((int)(savedFile.length())));							
					   }
					   catch (Exception e) 
					   {
						   e.printStackTrace();
						   System.out.println(e.getMessage());
					   }					   

					}
				}
				
				insertQuery =connection.prepareStatement("INSERT INTO candidate_docuploads_hist(CandidateID,ProofName,Proof,Proof_OtherDetails,FileName,Uploaded_By,Uploaded_On) VALUES(?,?,?,?,?,?,NOW())");
				insertQuery.setString(1,candId);
				insertQuery.setString(2,proofName);
				insertQuery.setString(3,proof);
				insertQuery.setString(4,OtherDetails);
				insertQuery.setString(5,itemName);
				insertQuery.setString(6,UpdatedBy);
				insertQuery.executeUpdate();
				insertQuery.close();
				System.out.println("Final insert:::candidate_docuploads_hist"+insertQuery);
			  }		   	
		    }
		   }
		  }
		  catch(Exception e)
		  {
			e.printStackTrace();
		  }
		 
		  
		//}
		//else
		//{
			//session.setAttribute("ProofStatus"+ProofType, "0");
		//}
   
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
