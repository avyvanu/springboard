<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.io.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%


String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
 if(USER_Name == null)
{
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
String canId= (String) session.getAttribute("Bpo_Cand_Id");
 if(canId == null)
{
	response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
}
String query="select VAUploadPath,VAAudioUploadLastCount from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'"; 
System.out.println("VAFILEUpload Page:::query::::::"+query); 
String USER_ID= (String) session.getAttribute("USER_ID");
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query);
String ProofStatus = (String)session.getAttribute("ProofStatusVAFile");
System.out.println("VAFILEUpload Page:::PROOFSTATUS::::::"+ProofStatus);  

String redURL=recruitPath+ "jsp/VAUploadUI.jsp";

    	if(ProofStatus.equalsIgnoreCase("0"))
    	{
    	if(rs.next())
	  	{
	  		
	  		int VAAudioUploadLastCount=rs.getInt("VAAudioUploadLastCount");
	  		VAAudioUploadLastCount=VAAudioUploadLastCount+1;
    	
			//to get the content type information from JSP Request Header
			String contentType = request.getContentType();
			
			//here we are checking the content type is not equal to Null and as well as the passed data from mulitpart/form-data is greater than or equal to 0
			if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
			{
				DataInputStream in = new DataInputStream(request.
				getInputStream());
				//we are taking the length of Content type data
				int formDataLength = request.getContentLength();
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;
				//this loop converting the uploaded file into byte code
				while (totalBytesRead < formDataLength) {
				byteRead = in.read(dataBytes, totalBytesRead, 
				formDataLength);
				totalBytesRead += byteRead;
				}
				String file = new String(dataBytes);
				//for saving the file name
				String saveFile = file.substring(file.indexOf("filename=\"") + 10);
				String dbFileName = "";
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
				System.out.println("File name in VAFileUpload Page:::"+saveFile);
				session.setAttribute( "VAFileName", saveFile );
				saveFile = saveFile.substring(saveFile.lastIndexOf("."));
				saveFile = canId + "(" + VAAudioUploadLastCount + ")" + saveFile;
				
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
				int endPos = ((file.substring(0, boundaryLocation))
				.getBytes()).length;
				dbFileName= saveFile;
				saveFile= candVoicePath+saveFile;
				
				try
				{
				// creating a new file with the same name and writing the content in new file
				FileOutputStream fileOut = new FileOutputStream(saveFile);
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.flush();
				fileOut.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
				
				saveFile = saveFile.replace("\\","//");
				
				
			   	String query1="update bpo_candidatesreg_details set IsVAAudioUpload=1,VAAudioUploadLastCount=" + VAAudioUploadLastCount + ",VAUploadPath='" + dbFileName + "',VAAudioUploadOn=NOW() where Bpo_Cand_Id='" + canId + "'"; 
			   	String query2="INSERT INTO candidate_vaupdate_history(CandidateID,MaxCopyNo,FileName,RecID,UpdatedDate) VALUES('" + canId + "'," + VAAudioUploadLastCount + ",'" + dbFileName + "','" + USER_ID + "',NOW())";
			    stmt.executeUpdate(query1);
				stmt.executeUpdate(query2);
				session.setAttribute("ProofStatusVAFile", "1");
				
			}

		}
    } 
      else
		{
			session.setAttribute("ProofStatusVAFile", "0");
		}
     %>
     <%
					
					stmt.close();
					rs.close();
					connection.close();
					
					
					
				 %>

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
   		<%if(ProofStatus.equalsIgnoreCase("0")) {%>
   		alert("Uploaded Successfully.");
   		<%}%>
   		location.href= "<%=redURL%>";
  
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
