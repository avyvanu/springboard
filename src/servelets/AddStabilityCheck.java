package servelets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ConnectDatabase;

public class AddStabilityCheck extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
			{
				HttpSession session = request.getSession();
				Connection con = null;
				Statement stmt = null;
				ResultSet rs = null;
				PreparedStatement pstmt= null;
				PreparedStatement pstmt1= null;
				PreparedStatement pstmt2= null;
				int updateQuery = 0;
				int insertPartMstr = 0;
				int insertQnsMstr = 0;
				int partId = 0;
				String USER_ID = (String)session.getAttribute("USER_ID");
				try
				{
					con = ConnectDatabase.getConnection();
					pstmt = con.prepareStatement("UPDATE stability_part_master SET IsAlive = ? WHERE IsAlive = 1");
					pstmt.setInt(1, 0);
					updateQuery = pstmt.executeUpdate();
					
					int total_Parts = Integer.parseInt(request.getParameter("total_box"));
					System.out.println("total_Parts : "+total_Parts);
					for(int i = 1; i <= total_Parts; i++)
					{
						int total_ques = Integer.parseInt(request.getParameter("total_box_Qns"+i));
						System.out.println("total_ques-"+i+" : "+total_ques);
						String partVal = request.getParameter("partHeader"+i);
						System.out.println("partVal-"+i+" : "+partVal);
						
						pstmt1 = con.prepareStatement("INSERT INTO stability_part_master (Part_Description, IsAlive, Order_No, Updated_By, Updated_On) VALUES(?, ?, ?, ?, NOW())");
						pstmt1.setString(1, partVal );
						pstmt1.setInt(2, 1);
						pstmt1.setInt(3, i);
						pstmt1.setString(4, USER_ID);
						insertPartMstr = pstmt1.executeUpdate();
						
						String query = "SELECT max(Part_id) as Part_id FROM stability_part_master WHERE IsAlive = 1";
						stmt = con.createStatement();
						rs = stmt.executeQuery(query);
						if(rs.next())
						{
							partId = rs.getInt("Part_id");
							System.out.println("partId : "+ partId);
						}	
						for(int j = 1; j <= total_ques; j++ )
						{
							String quesValue = request.getParameter("part"+ i +"addQues"+ j);
							String quesVal = quesValue.replace("…","...");
							System.out.println("quesVal-"+j+" : "+quesVal);
							
							pstmt2 = con.prepareStatement("INSERT INTO stability_check_question_master (Part_id, Question, IsAlive, Order_No) VALUES(?, ?, ?, ?)");
							pstmt2.setInt(1, partId);
							pstmt2.setString(2, quesVal.trim());
							pstmt2.setInt(3, 1);
							pstmt2.setInt(4, j);
							insertQnsMstr = pstmt2.executeUpdate();
						}
					}	
					if(updateQuery != 0)
					{
						if(insertPartMstr != 0)
						{
							if(insertQnsMstr != 0)
							{
								session.setAttribute("InsertState","Successfully_Inserted");				
								response.sendRedirect("247Recruit/jsp/Admin_Home_Page.jsp");
							}
						}
					}
					else
					{
						session.setAttribute("InsertState","Not_Inserted");				
						response.sendRedirect("247Recruit/jsp/Admin_Home_Page.jsp");
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
			}

}
