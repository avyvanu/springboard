<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.sql.*,java.util.*,util.ConnectDatabase,java.io.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>

<%


String USER_Name = ((String)session.getAttribute("USER_Name")).trim();
 if(USER_Name == null)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	}
 System.out.println("USER_Name in file upload  page::::"+USER_Name);
String USER_ID = (String)session.getAttribute("USER_ID");
if(USER_ID == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
System.out.println("USER_ID in home page::::"+USER_ID);
String canId= (String) session.getAttribute("Bpo_Cand_Id");
System.out.println("canId"+canId);
String query="select FirstRoundUploadPath,FirstRoundUploadLastCount from bpo_candidatesreg_details where Bpo_Cand_Id='" + canId + "'"; 
System.out.println("query:::Test File:Upload"+query);
Connection connection=ConnectDatabase.getConnection();		
Statement stmt=connection.createStatement();
ResultSet rs=stmt.executeQuery(query);

String redPage=(String)session.getAttribute("page");
String redURL=recruitPath+ "jsp/FirstRound_Audio.jsp";

    	
    	if(rs.next())
	  	{
	  		
	  		int FirstRoundUploadLastCount=rs.getInt("FirstRoundUploadLastCount");
	  		FirstRoundUploadLastCount=FirstRoundUploadLastCount+1;
    	
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
				saveFile = saveFile.substring(saveFile.lastIndexOf("."));
				saveFile = canId + "(" + FirstRoundUploadLastCount + ")" + saveFile;
				
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
				saveFile=candVoicePath+saveFile;
				// creating a new file with the same name and writing the content in new file
				try
				{
					FileOutputStream fileOut = new FileOutputStream(saveFile);
					fileOut.write(dataBytes, startPos, (endPos - startPos));
					fileOut.flush();
					fileOut.close();
					saveFile = saveFile.replace("\\","//");
				}
				catch(Exception e)
				{
				e.printStackTrace();
				}
				String query1="update bpo_candidatesreg_details set IsFirstRoundUpload=1,FirstRoundUploadLastCount=" + FirstRoundUploadLastCount + ",FirstRoundUploadPath='" + dbFileName + "',FirstRoundUploadOn=NOW() where Bpo_Cand_Id='" + canId + "'";
			   	System.out.println("query1:::Update in Test Upload File"+query1); 
			   	String query2="INSERT INTO candidate_voicetestupdate_history(CandidateID,MaxCopyNo,FileName,RecID,UpdatedDate) VALUES('" + canId + "'," + FirstRoundUploadLastCount + ",'" + dbFileName + "','" + USER_ID + "',NOW())";
			    System.out.println("query2:::Update in Test Upload File"+query2); 
				stmt.executeUpdate(query1);
				stmt.executeUpdate(query2);
			}
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
   		alert("Uploaded Successfully.");
   		parent.parent.location.href= "<%=redURL%>";
  
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
