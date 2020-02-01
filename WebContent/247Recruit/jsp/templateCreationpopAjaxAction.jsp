<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page import="java.io.Writer"%>

<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

  
<%
		String candiSessionData=(String)session.getValue("mainCandiID");
		System.out.println(candiSessionData);
        String nesees=request.getParameter("hidenData");
        int newImgSize=nesees.length();
        System.out.println("newImgSize   "+newImgSize);
        String img="";
        String divePath="/canImage";
        
        String absalutepath=getServletContext().getRealPath(divePath);
        System.out.println("Display Real Path : "+absalutepath);
	    Date date = new Date();	      
	  	BASE64Decoder decoder = new BASE64Decoder();  
	    byte[] imgBytes = decoder.decodeBuffer(nesees);      
	    BufferedImage bufImg = ImageIO.read(new ByteArrayInputStream(imgBytes));  
	    System.out.println("absalutepath : "+absalutepath);
	    File imgOutFile = new File(absalutepath+"\\"+ date.getTime()+"vi.png");
	    System.out.println("imgOutFile  +"+imgOutFile);  
	  	String psthLink=date.getTime()+"vi.png";
	    ImageIO.write(bufImg, "png", imgOutFile);  
	    int aq=5;
	   	String pathIm="C:/Program Files/Apache Software Foundation/Tomcat 6.0/webappswebCam/canImage";
	  	
	  	
		Connection con=null;
		PreparedStatement psmt=null;
		Statement stmt=null;
		
	     try
		 {	
		 	String chatQuery="UPDATE bpo_candidatesreg_details SET ImagePath = '"+psthLink+"' WHERE Bpo_Cand_Id='"+candiSessionData+"'";
		 	System.out.println("chatQuery : "+chatQuery);			
			con= ConnectDatabase.getConnection();
			stmt=con.createStatement();
			int a=stmt.executeUpdate(chatQuery);
			System.out.println("a : "+a);
			if(a>0)
			{
				System.out.println("Candidate Images Updated Sucessfully !");				
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
			
			System.out.println("vishnu");
		
		
%>

	 
<html>
<body>
<div>
Image Display on Browser !
<%

String imgPath=getServletContext().getRealPath(divePath);

 %>
<img src="<%=imgPath%>\\canImage\\<%=psthLink%>" > 

</div>

<br>
<br><br><br></body>
</html>
	