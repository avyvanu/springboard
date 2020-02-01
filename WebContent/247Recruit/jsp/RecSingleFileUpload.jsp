<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.io.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%

String RecEmployeeId=(String)session.getAttribute("USER_ID");
System.out.println("RecEmployeeId:::::"+RecEmployeeId);
String canId= (String) session.getAttribute("bioCanID");
if(canId==null)
{
	canId= (String) session.getAttribute("candId");
}

String proofName=(String)session.getAttribute("proofName");
if(proofName==null)
{
proofName="";
}
System.out.println("SingleFileUpload::::Proof Name:::::"+proofName);
String OtherDetails="";


String query="select ResumeUploadPath,ResumeLastCount from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'"; 
System.out.println("Query::"+query);
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query);

String redPage=(String)session.getAttribute("page");
System.out.println("redPage"+redPage);
String ProofStatus = (String)session.getAttribute("ProofStatusFile");
System.out.println("RecSingleUpload Page:::PROOFSTATUS::::::"+ProofStatus);  
String redURL=recruitPath+ "jsp/" + redPage + "?candId=" + canId;

    	if(ProofStatus.equalsIgnoreCase("0"))
    	{
    	if(rs.next())
	  	{
	  		
	  		int resLastCount=rs.getInt("ResumeLastCount");
	  		resLastCount=resLastCount+1;
    	
			//to get the content type information from JSP Request Header
			String contentType = request.getContentType();
			//here we are checking the content type is not equal to Null and as well as the passed data from mulitpart/form-data is greater than or equal to 0
			if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
			{
				DataInputStream in = new DataInputStream(request.
				getInputStream());
				System.out.println("Initila data:::"+in);
				//we are taking the length of Content type data
				int formDataLength = request.getContentLength();
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;
				//this loop converting the uploaded file into byte code
				while (totalBytesRead < formDataLength) {
				byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
				totalBytesRead += byteRead;
				}
				System.out.println("totalBytesRead"+totalBytesRead);
				String file = new String(dataBytes);
				//for saving the file name
				String saveFile = file.substring(file.indexOf("filename=\"") + 10);
				String dbFileName = "";
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
				session.setAttribute( "FileName", saveFile );
				saveFile = saveFile.substring(saveFile.lastIndexOf("."));
				saveFile = canId + "(" + resLastCount + ")" + saveFile;
				
				int lastIndex = contentType.lastIndexOf("=");
				String boundary = contentType.substring(lastIndex + 1,
				contentType.length());
				int pos;
				//extracting the index of file 
				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				int boundaryLocation = file.indexOf(boundary, pos) - 4;
				int startPos = ((file.substring(0, pos)).getBytes()).length;
				int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
				dbFileName = saveFile;
				saveFile=candResumePath+saveFile;
				
				
				
				// creating a new file with the same name and writing the content in new file
				FileOutputStream fileOut = new FileOutputStream(saveFile);
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.flush();
				fileOut.close();
				
				
				
				
				
				
			   	String query1="update bpo_candidatesreg_details set IsResumeUpload=1,ResumeLastCount=" + resLastCount + ",ResumeUploadPath='" + dbFileName + "' where Bpo_Cand_Id='" + canId + "'"; 
			   	String query2="INSERT INTO candidate_resumeupdatehistory(CandidateID,MaxCopyNo,FileName,Resume_Proof,Proof_OtherDetails,RecID,UpdatedDate) VALUES('" + canId + "'," + resLastCount + ",'" + dbFileName + "','"+proofName+"', '"+OtherDetails+"','" + RecEmployeeId + "',NOW())";
			
				
				stmt.executeUpdate(query1);
				stmt.executeUpdate(query2);
				session.setAttribute( "resLastCount", "" );
				session.setAttribute("ProofStatusFile", "1");
			}
         }
      }
       else
		{
			session.setAttribute("ProofStatusFile", "0");
		}
     %>
     <% stmt.close();
		rs.close();
		connection.close();
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
	<script type="text/javascript" language="javascript">
   <%
   		if(redPage.equalsIgnoreCase("RecFileUploadUI.jsp"))
   		{
   %>
 		location.href= "<%=redURL%>";
 	<%
 		}
 		else
 		{
 	%>
 		parent.parent.location.href= "<%=redURL%>";
 	<%}%>
  
  </script>
  </head>
  
  <body>
    
  </body>
  <%
					rs.close();
					stmt.close();
					connection.close();
				 %>
</html>
