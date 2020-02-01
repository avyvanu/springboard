package servelets;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
import java.util.Date;
import util.ConnectDatabase;
import util.ConnectionDAO;
public class CanvasServlet extends HttpServlet
{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		String EDKey="";
		String EDKPass="";
		try
		{
			if((String)session.getAttribute("EDKey") != "AD")
			{
				 EDKey = (String)session.getAttribute("EDKey");
				 EDKPass = (String)session.getAttribute("EDKPass");
			}
			else
			{
				response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(" GETTING KAY AND PASS EXCEPTION + "+e);
		}

		String USER_ID = (String)session.getAttribute("USER_ID");
		if(USER_ID == null)
		{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		String USER_Name =(String) session.getAttribute("USER_Name");
		if(USER_Name == null)
		{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		System.out.println("USER_Name:::"+USER_Name);
		int USER_AUTOID =(Integer)session.getAttribute("USER_AUTOID");
		if(USER_AUTOID == 0)
		{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
		}
		File imgOutFile = null;
		FileInputStream fis = null;
		String nesees = null;	
		if(USER_AUTOID !=0 || USER_Name!=null)   // checking the condition
		{
			int newImgSize = 0;
			try
			{
				Date newdate=new Date();
		        nesees=request.getParameter("hidenData");		        
		        newImgSize=nesees.length();
		        System.out.println("SIZE OF THE IMAGE\t"+newImgSize);
		        BASE64Decoder decoder = new BASE64Decoder();   // Converting the image data into BASE64 decoder
			    byte[] imgBytes = decoder.decodeBuffer(nesees);      
			    BufferedImage bufImg = ImageIO.read(new ByteArrayInputStream(imgBytes)); 
			    System.out.println(bufImg);
			    imgOutFile = new File(USER_ID+"-"+newdate.getTime()+"vi.png");
			  	String psthLink=USER_ID+"-"+newdate.getTime()+"vi.png";
			  	System.out.println("DISPLAY THE PATH \t"+psthLink);
			    ImageIO.write(bufImg, "png", imgOutFile); 
			}			// IC00008566 - vi.png
			catch(Exception e)
			{
				e.printStackTrace();
			}
			Connection con=null;
			PreparedStatement stmt=null;
			CallableStatement callSaveImg=null;
			try
			{
		    	fis = new FileInputStream(imgOutFile);
		    	System.out.println("FILE INPUT STRAEM DATA \t"+fis);
		    	con = ConnectDatabase.getConnection();
		    	callSaveImg=con.prepareCall("call cand_save_image(?,?,?,?,?)");		    	
		    	callSaveImg.setString(1, USER_ID);
		    	callSaveImg.setInt(2, USER_AUTOID);
		    	callSaveImg.setBinaryStream(3, (InputStream)fis, (int)(imgOutFile.length()));
		    	callSaveImg.setString(4, EDKey);
		    	callSaveImg.setString(5, EDKPass);
		    	int chkIMG = callSaveImg.executeUpdate();
		    	fis.close();
		    	imgOutFile.delete();
		    	
		    	if(chkIMG>0)
		    	{
		    		int ValidPhoto = 1;
			        if(newImgSize > 6000)
			        {	        
			        	ValidPhoto = 2;
			        }
		    		System.out.println("Candidate Images Updated Sucessfully into DATABSE !");
					PreparedStatement p17=con.prepareStatement("update bpo_candidatesreg_details set cand_Status=2, is_Valid_Photo = "+ValidPhoto+" WHERE AutoID="+USER_AUTOID+"");
				    System.out.println(" updated to canvas 2 data =="+p17);
			    	p17.executeUpdate();
			    	p17.close(); 			    	
					session.setAttribute("ImgSize", newImgSize);
					
					String photoCam=(String)session.getAttribute("photoCam");
					if(!photoCam.equals("0"))
					{
						RequestDispatcher rd= request.getRequestDispatcher("247Recruit/jsp/ApplyingFor.jsp");
						rd.forward(request, response);
					}
					else 
					{
						RequestDispatcher rd= request.getRequestDispatcher("247Recruit/jsp/Confirmation.jsp");
						rd.forward(request, response);
					}	
		    	}
			}
			catch(Exception ex)
			{
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
			finally
			{
				 ConnectionDAO.closeConnection(con, stmt, null);	
			}
		}
	}
}
