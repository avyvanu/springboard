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

public class EditTest extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
		{
			HttpSession session = request.getSession();
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt1 =null;
			PreparedStatement pstmt2 =null;
			int updateQuery = 0;
			int updateQuery1 = 0;
			int updateQuery2= 0;
			boolean chkAcStatus = false;
			
			String ctquery = null;
			
			String USER_ID = (String)session.getAttribute("USER_ID");
			System.out.println("USER_ID ::::"+USER_ID);
			String testId = (String)session.getAttribute("TestID");
			System.out.println("testId ::::"+testId);
			String editStatus = request.getParameter("test_status");
			System.out.println("editStatus ::::"+editStatus);
			String editTimeMins = request.getParameter("timeMins");
			System.out.println("editTimeMins ::::"+editTimeMins);
			String editTimeSec = request.getParameter("timeSec");
			System.out.println("editTimeSec ::::"+editTimeSec);
			
			String buttonID = request.getParameter("buttons");
			System.out.println("buttonID:::::"+buttonID);
			String newtestDesc = request.getParameter("addName");
			System.out.println("New Test Description :::::"+newtestDesc);
			String newtestURL = request.getParameter("addURL");
			System.out.println("New Test URL:::::"+newtestURL);
			String newtimeMin = request.getParameter("addtimeMins");
			System.out.println("New Time_limit_min:::::"+newtimeMin);
			String newtimeSec = request.getParameter("addtimeSec");
			System.out.println("New Time_limit_sec :::::"+newtimeSec);
			String newstatus = request.getParameter("addtest_status");
			System.out.println("New Status :::::"+newstatus);
			
			try
			{
				con = ConnectDatabase.getConnection();
				
				if(buttonID.equalsIgnoreCase("Submit"))
				{
					pstmt2 = con.prepareStatement("INSERT INTO test_master(Test_Name, Test_Description, Test_URL, Time_limit_min, Time_limit_sec, updated_by, updated_on, is_active, is_deleted) VALUES(?, ?, ?, ?, ?, ?, NOW(), ?, ?)");
					pstmt2.setString(1, newtestDesc);
					pstmt2.setString(2, newtestDesc);
					pstmt2.setString(3, newtestURL);
					pstmt2.setString(4, newtimeMin);
					pstmt2.setString(5, newtimeSec);
					pstmt2.setString(6, USER_ID);
					pstmt2.setString(7, newstatus);
					pstmt2.setInt(8, 0);
					updateQuery2 = pstmt2.executeUpdate();
					System.out.println("updateQuery2 :"+updateQuery2);
					
				}
				else if(buttonID.equalsIgnoreCase("Update"))
				{
					if(editStatus.equals("1"))
					{
						chkAcStatus = true;
					}
					
					int countActive = 0;
					if(chkAcStatus)
					{
						ctquery = "SELECT COUNT(*) AS ActiveCount FROM test_master WHERE Is_Deleted = 0";
					}
					else
					{
						ctquery = "SELECT COUNT(*) AS ActiveCount FROM test_master WHERE Is_Deleted = 0 AND is_active = 1";
					}
					Statement st = con.createStatement();
					ResultSet rst = st.executeQuery(ctquery);
					if(rst.next())
					{
						countActive = rst.getInt("ActiveCount");
						System.out.println("countActive : "+countActive);
						if(countActive == 1)
						{
							System.out.println("Can't deactivate all typing tests! At least one must be active.");
							session.setAttribute("alert", "1");
						}
						else
						{
							String query = "SELECT Test_id, Test_Name, Test_Description, Test_URL, Time_limit_min, Time_limit_sec, updated_by, updated_on, is_active, is_deleted FROM test_master WHERE Test_id = '"+ testId + "'";
							stmt = con.createStatement();
							rs = stmt.executeQuery(query); 
							if(rs.next())
							{
								String testName = rs.getString("Test_Name");
								System.out.println("Test Name :::::"+testName);
								String testDesc = rs.getString("Test_Description");
								System.out.println("Test Description :::::"+testDesc);
								String testURL = rs.getString("Test_URL");
								System.out.println("Test URL:::::"+testURL);
								String timeMin = rs.getString("Time_limit_min");
								System.out.println("Time_limit_min:::::"+timeMin);
								String timeSec = rs.getString("Time_limit_sec");
								System.out.println("Time_limit_sec :::::"+timeSec);
								String updatedBy = rs.getString("updated_by");
								System.out.println("updated_by :::::"+updatedBy);
								String updatedOn = rs.getString("updated_on");
								System.out.println("updated_on :::::"+updatedOn);
								String status = rs.getString("is_active");
								System.out.println("Status :::::"+status);
								String isDeleted = rs.getString("is_deleted");
								System.out.println("is_deleted :::::"+isDeleted);
								
								pstmt = con.prepareStatement("INSERT INTO test_master_history(Test_id, Test_Name, Test_Description, Test_URL, Time_limit_min, Time_limit_sec, Updated_by, Updated_on, Is_Active, Is_Deleted) VALUES(?,?,?,?,?,?,?,?,?,?)");
								pstmt.setString(1, testId);
								pstmt.setString(2, testName);
								pstmt.setString(3, testDesc);
								pstmt.setString(4, testURL);
								pstmt.setString(5, timeMin);
								pstmt.setString(6, timeSec);
								pstmt.setString(7, updatedBy);
								pstmt.setString(8, updatedOn);
								pstmt.setString(9, status);
								pstmt.setString(10, isDeleted);
								updateQuery = pstmt.executeUpdate();
								
								pstmt1 = con.prepareStatement("UPDATE test_master SET Time_limit_min = ?, Time_limit_sec = ?, updated_by = ?, updated_on = NOW(), is_active = ?  WHERE Test_id = ?");
								pstmt1.setString(1, editTimeMins);
								pstmt1.setString(2, editTimeSec);
								pstmt1.setString(3, USER_ID);
								pstmt1.setString(4, editStatus);
								pstmt1.setString(5, testId);
								updateQuery1 = pstmt1.executeUpdate();	
							}
						}
					}	
				}
				if(updateQuery2 != 0)
				{
					session.setAttribute("alert","Inserted_Successfully");
				}
				else
				{
					session.setAttribute("alert","Not_Inserted");
				}
				if(updateQuery != 0)
				{
					if(updateQuery1 != 0)
					{
						session.setAttribute("alert","update_Successfull");				
					}
					else
					{
						session.setAttribute("alert","Not_Update");				
					}
				}
				
			request.getRequestDispatcher("/247Recruit/jsp/EditTest.jsp").forward(request, response);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}

}
