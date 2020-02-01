<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%
  	
  	Connection connection = null;
  	Statement stmt = null;
  	String USER_ID = null;
  	int docCount = 0;
  	try
  	{
  	connection=ConnectDatabase.getConnection();	
  	stmt=connection.createStatement();
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
  	System.out.println("USER_ID:::::::cand_Additional_doc_upload"+USER_ID);
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
  	System.out.println("docCount:::::::"+docCount);
  	String queryforDocCount = "select Count(*) as Count from candidate_additional_docs_upload where CandidateID = '"+USER_ID+"'"; 
  	System.out.println("queryforDocCount:::::::"+queryforDocCount);
  	ResultSet rscount = stmt.executeQuery(queryforDocCount);
   if(rscount.next())
  	{
 		docCount = 	rscount.getInt("Count");	
 		System.out.println("docCount:::::"+docCount);
  	}
  	rscount.close();
  	String query="select * from bpo_candidatesreg_details where Bpo_Cand_Id='" + USER_ID + "'"; 
    ResultSet rs=stmt.executeQuery(query);
	if(rs.next())
	  	{
	  		String canName=rs.getString("First_Name")+ " " +rs.getString("Middle_Name")+ " " +rs.getString("Last_Sir_Name");
	  		Date dateStr = rs.getDate("System_Date_Time");
	  		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
	    	String DOR = formatter.format(dateStr);  
			String canId=rs.getString("Bpo_Cand_Id");
			session.setAttribute("candId",canId);
			String Work_Experience=rs.getString("Work_Experience");
			System.out.println("Work_Experience::::"+Work_Experience);
			session.setAttribute("WorkExperience",Work_Experience);
			String queryFOR_getDOCS = "";
			ResultSet rsDocs  = null;
			CallableStatement csDocs=null;
		    session.setAttribute( "page", "AdditionalFileUploadUI.jsp" );	
		    //******************Getting the Candidate Document Details**************//
	  		    
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
		function ShowDoc(docAutoID)
		{
		  var urlDocs = "<%=request.getContextPath()%>/247Recruit/jsp/AdditionalUploadedDocument.jsp?docAutoID="+docAutoID+"";
		  someWindow = window.open(urlDocs,'ReasonWindow','height=600,width=800,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
		}
		</script>
		
		<!-- Changing the Selected Row color in table -->
		<script type="text/javascript" language="javascript">
		 
		 function ChangeColor(tableRow)
		    {
		    	//alert("vaule into change color");
		    	var iVal = document.getElementById("iValHid").value;
		    	var trRow;
		    	var i=1;
		    	for (i=1; i<iVal;i++)
		    	{
		    		trRow = document.getElementById(i);
		    		trRow.style.backgroundColor = '#F2F2F2';
		    	}
		    	tableRow.style.backgroundColor = '#C7C3DD';
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
		
		<script type="text/javascript" language="javascript">
		 function logout()
		 {
			location.href = "<%=logoutPage%>";
		 }
	   </script>
	  </head>
	  <body style="margin:0px;">
	   <form name="FinalCheckForm" action="" method="post" onsubmit="return check(this);" >
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
		            <font style="color:#000000; font-weight:bold; font-size:12px; font-family:Arial; ">Additional Documents Upload</font>
				<%
				  	}
				  	else
				  	{
				%>
		            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
		            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Cand_Additional_Docs_Upload.jsp">Additional Documents Upload</a> > </font>
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
		    	<table cellpadding="6" cellspacing="6" border="0" width="900">
		        <tr>
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
		            <td colspan="4" align="center" style="padding: 0px;"> 
		              <%if(docCount > 0)
		              {
		               %>
		               <table width="100%" rules="all" style="border:1px solid black;background-color:#F2F2F2;margin:0;">
		                    <tr>
				       	 	  <td style="border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="10%">Sl No.</td>
							  <td style="border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="25%">Document Type</td>
							  <td style="border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="45%">Document Info</td>
					          <td style="border-left:1px solid black;border-bottom:1px solid black;margin:0;background-color: #d8d8d8;" align="center" class="allBackColor" width="20%">Document</td>
					        </tr>
					              <%
							        int i = 1;
							        String candidateId= "";
							        int candDocAutoId = 0;
							        int documentTypeId = 0;
						  		    String documentType_Name = "";
						  		    String documentTitle = "";
						  		    Blob documentData = null;
						  		    String Document_FileName = "";
						  		    queryFOR_getDOCS="{call BpoCandAdditionalDocs_Encrypt_Proc(?,?,?)}"; //your procedure name
								    csDocs=connection.prepareCall(queryFOR_getDOCS);
								    csDocs.setString(1,canId);
						            csDocs.setString(2,EDKey);
						            csDocs.setString(3,EDKPass);
								    rsDocs=csDocs.executeQuery();
						        	while(rsDocs.next())
						        	{
							       		candDocAutoId = rsDocs.getInt("AddDocID");
							       		candidateId = rsDocs.getString("CandidateID");
							       		System.out.println("CandidateID::::"+candidateId);
							       		documentTypeId = rsDocs.getInt("DocumentType");
							       		System.out.println("documentTypeId::::"+documentTypeId);
					       		        String queryForDocs="select Document_Name from document_type_master where Type_Id ='"+documentTypeId+"'"; 
										System.out.println("queryForDocs"+queryForDocs);
										ResultSet rsForDocs=stmt.executeQuery(queryForDocs);
										if(rsForDocs.next())
										{
										documentType_Name = rsForDocs.getString("Document_Name");
										System.out.println("documentType_Name::::"+documentType_Name);
										}
							       		documentTitle = rsDocs.getString("DocumentTitle");
								      	System.out.println("documentTitle::::"+documentTitle);
								      	if(documentTitle == null)
								      	{
								      	documentTitle = "";
								      	}
								      	documentData   = rsDocs.getBlob("Document");
						        		System.out.println("documentData ::::"+documentData );
						        		Document_FileName = rsDocs.getString("Document_FileName");
						        		System.out.println("Document_FileName ::::"+Document_FileName );
						         %>
					      <tr id="<%=i%>"  onclick="javascript:ChangeColor(this);">
							  <td align="center" style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;cursor: pointer;">
									<%=i%>
							  </td>
							  <td style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;text-align: left;cursor: pointer;">
								  <%= documentType_Name%>
							 </td>
							 <td align="left" style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;cursor: pointer;">
								 <b>Description :</b><%=documentTitle %><b>,&nbsp;File Name :</b> <%=Document_FileName%>
							 </td>
							 <td align="center" style="color: #41383C;font-family: Arial,Helvetica,sans-serif;font-size: 12px;cursor: pointer;">
							    <%if(documentData != null) {%>
							      <a onclick="return ShowDoc('<%=candDocAutoId%>')" style="color: maroon;">View</a>
							   <%} %>
							    <input type="hidden" name="docUpload<%= i%>" id="docUpload<%= i%>" value="<%=documentTypeId %>">
							 </td>
						  </tr>
						       <%
						       i = i + 1;
						       } 
						       %>
					  </table> 
		              <input type="hidden" id="iValHid" value="<%=i%>" />
		              <%
		              }
		              else
		              { 
		               %> 
		               <div align="center" style="color: red;font-family: Arial,Helvetica,sans-serif;font-size: 14px;"> No additional documents upload done yet
		               </div>
		              <%
		               }
		                %>
		            </td>
		        </tr>    
		        <tr>
		            <td colspan="2" align="left" class="allBackColor">
		             <select name="documentsTypesId" id="documentsTypesId" size="1"   class="resizeSelect">
						<option value="select">
							-- Document Type --
						</option>
							<%
							    String secQsnQrytypes = "select * from document_type_master where Is_Alive = 1 and (type_exp='0' or type_exp='"+Work_Experience+"')";
								System.out.println("query " + secQsnQrytypes);
								ResultSet rstypes = stmt.executeQuery(secQsnQrytypes);
								while (rstypes.next())
								 {
					    	 %>
	                      <option value="<%=rstypes.getString("Type_ID")%>" ><%=rstypes.getString("Document_Name")%></option>
	                     <%} %>
	                     </select>
		            </td>
	   			   <td align="center" class="allBackColor" id="txtIDLDISP" style="width: 100%;">
					<input type="text"  id="txtIDL" name="txtIDL" class="wmta" onblur="Blur(this.id,'Document Description')" onfocus="Focus(this.id,'Document Description')" value="Document Description" maxlength="50" oncopy="return false" onpaste="return false" oncut="return false" onkeypress="return AllowChars(event);" style="width: 100%"/>
				 </td>
				<td align="left" class="allBackColor" colspan="2">
					<iframe src="<%=recruitPath%>jsp/AdditionalFileUploadUI.jsp" name="uploadResume" width="470" height="41" scrolling="no" frameborder="0" ></iframe>
				</td>
		       </tr>
		        <tr>
		            <td colspan="4" align="center">   
		                <%if(UserTypeId == null)
		                {
		                 %>
		                <input type="button" name="submit" id="submit" value="Done" class="buttonSmall" onclick="javascript:location.href='<%=recruitPath%>jsp/Home_Page.jsp'"/>
		                <%
		                }
		                else
		                {
		                 %>
		                  <input type="button" name="submit" id="submit" value="Done" class="buttonSmall" onclick="javascript:parent.location.href='<%=recruitPath%>jsp/Cand_Additional_Docs_Upload.jsp'"/>
		                <%
		                }
		                 %>
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
	        <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="2">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
	    </tr>
	</table>
	       <script type="text/javascript"> 
			 document.FinalCheckForm.documentsTypesId.onchange = updateDocs;
			 document.FinalCheckForm.txtIDL.onchange = updateDocs; 
		    function updateDocs()
			 {
				var docTypeId = document.FinalCheckForm.documentsTypesId.value; 	
				var documentDescription = document.FinalCheckForm.txtIDL.value;
				var DocNameSel = document.getElementById("documentsTypesId");
				DocName = DocNameSel.options[DocNameSel.selectedIndex].text;
				parent.uploadResume.location.href= "<%=recruitPath%>jsp/AdditionalFileUploadUI.jsp?proofName="+DocName+"&documentDescription="+documentDescription+"&docTypeId="+docTypeId+"";
			 }
			 </script>
	<%
	    rs.close();
		stmt.close();
		connection.close();
	}
	catch(Exception ee)
	{
	ee.printStackTrace();
	}
		
	%>
    </form>
    <!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->
  </body>
</html>
