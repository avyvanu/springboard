package servlets.Comprehension;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.*;

public class ReadComp extends HttpServlet 
{
	ServletContext sctx=null;
	
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		sctx=this.getServletContext();
	}
	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
  
		String methodName = req.getParameter("methodName");
		HttpSession session = req.getSession();
		
		int attempID=-1;
		int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
		if(methodName!=null)
		{
			ArrayList arr = new ArrayList();			
			if(methodName.trim().equalsIgnoreCase("storeRes"))
			{
				String readComp=req.getParameter("readComp");
				for(int readCom=0;readCom<Integer.parseInt(readComp);readCom++)
				{
					String opVar = req.getParameter("opAns"+readCom);
					
					if(opVar!=null)
					{
						arr.add(opVar);
					}
					System.out.println("  Reading option value  ============"+opVar);
				}
			}
			insertDataCompTest(arr);	
			
// **************** START Calculation for the READING COMPREHENSION **********************  ///
	        String quryForGet_Y ="SELECT  DISTINCT(READING_COMP_MASTER_ID) as IDs_Master, COUNT(STATUS) as answer  FROM bpo_user_reading_comp_test WHERE  STATUS='Y'AND  User_ID="+USER_AUTOID;
	        System.out.println("Display no of currect answer and distinct(READING_COMP_MASTER_ID)\t"+quryForGet_Y);
	        Connection conVA = null;
	        Statement stmt_Y=null;
	        String getID_of_RCMID=null;
	        String total_ans_get=null;
	        int no_Of_Question=0;
	        try
	        {	
	        	conVA = ConnectDatabase.getConnection();
	        	stmt_Y=conVA.createStatement();
	          	ResultSet rsGet_Y = stmt_Y.executeQuery(quryForGet_Y);													
				if (rsGet_Y.next()) 
				{
					getID_of_RCMID=rsGet_Y.getString("IDs_Master");
					total_ans_get=rsGet_Y.getString("answer");
					String quryforRCQM ="SELECT count(*) FROM bpo_reading_comp_question_master  where READING_COMP_MASTER_ID="+getID_of_RCMID;
					System.out.println("Display the reading com qs master ids \t"+quryforRCQM);
					stmt_Y=conVA.createStatement();;
					ResultSet rs_IDS = stmt_Y.executeQuery(quryforRCQM);
					if (rs_IDS.next()) 
					{
						no_Of_Question=Integer.parseInt(rs_IDS.getString("count(*)"));
						System.out.println("Dispaly Tatal no of question \t"+no_Of_Question);
					}
					
					String quryFor_GET_total_Maxscore="SELECT Pass_percentage FROM maximum_read_assement_no WHERE Maximum_read_assement_ID=1";
					stmt_Y=conVA.createStatement();
					ResultSet rs_maxScore=stmt_Y.executeQuery(quryFor_GET_total_Maxscore);
					double get_PassPERCENT=0.0;
					if(rs_maxScore.next())
					{
						get_PassPERCENT=Double.parseDouble(rs_maxScore.getString("Pass_percentage"));
						System.out.println("Display The Percentage given by the ADMINISTRATOR\t"+get_PassPERCENT);
					}
					double can_marks=0.0;
					can_marks =(double)((Integer.parseInt(total_ans_get)/no_Of_Question)*100);									
					System.out.println("Display the value of the Each Question of marks : \t"+can_marks);									
					String result_status="";					
					if(can_marks<get_PassPERCENT)
					{
						result_status="Fail";
					}
					else
					{
						result_status="Pass";
					}	
					PreparedStatement upd_score_read=conVA.prepareStatement("update bpo_user_reading_comp_test_attempt set Final_Score=? , Final_Status=? where user_id="+USER_AUTOID+"");
					upd_score_read.setDouble(1, can_marks);
					upd_score_read.setString(2, result_status);
					upd_score_read.executeUpdate();
				}											
			}
			catch(Exception e)
			{
				e.getStackTrace();
				System.out.println(e.getCause());
				System.out.println(e.getMessage());				
			}			
// **************** ENDS Calculation for the READING COMPREHENSION **********************  ///				
			
			RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/ReadingComprehensionSucess.jsp?message=compTestComplete");
			System.out.println(" Forwarding to Comprehension sucess test Page ");
			rd.forward(req,resp);
		}
		else
		{
			Statement drStmt=null;
			ResultSet drRs=null;
			Connection con = null;
			try
    		{
				// create connection establish 
    			con = ConnectDatabase.getConnection();
    			try
    			{
    				//boolean chkAvilable=ClasForTheREadingChk.chkForEntry(userID);
    				
    				String drRegQry = "select READING_TEST_ATTEMPT_ID from bpo_user_reading_comp_test_attempt order by READING_TEST_ATTEMPT_ID DESC";
    				System.out.println("bpo_user_reading_comp_test_attempt : "+drRegQry);
    				drStmt = con.createStatement();
    				drRs = drStmt.executeQuery(drRegQry);
    				if(drRs.next())
    				{
    					System.out.println("Step 4 READING_TEST_ATTEMPT_ID"+drRs.getInt("READING_TEST_ATTEMPT_ID"));
    					attempID = drRs.getInt("READING_TEST_ATTEMPT_ID");
    					attempID++;
    					System.out.println("TOtal count display\t"+attempID);
    				}
    				else
    				{
    					attempID=1;
    				}
    			}
    			catch (Exception e) 
    			{
    				e.printStackTrace();
    			}
    			PreparedStatement oPst = con.prepareStatement("INSERT INTO bpo_user_reading_comp_test_attempt(READING_TEST_ATTEMPT_ID, USER_ID, START_DATE_ACTIVE) VALUES(?,?,sysdate())");
    			oPst.setLong(1,attempID);
    			oPst.setLong(2,USER_AUTOID);
    			
    			int k = oPst.executeUpdate();
    			System.out.println("bpo_user_reading_comp_test_attempt is inserting sucessfully or not \t"+k);
    			if(k!=0)
    			{
    				System.out.println("inserted");
    			}
    		}
			catch (Exception e) 
			{
				e.printStackTrace();
				System.out.println(e.getMessage());
				System.out.println(e.getCause());
			}
			finally
			{
				ConnectionDAO.closeConnection(con, drStmt, drRs);
			}
			
			System.out.println("This is Comprehension");
			int ranNum = RandomNumber.doRawRandomNumber();
			RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/ReadingComprehensionTest.jsp");
			System.out.println("Forwarding to Compr test Page");
			req.setAttribute("RANNUM",ranNum);
			rd.forward(req,resp);
		}
		
	}
	void insertDataCompTest(ArrayList arr)
	{
		System.out.println("op1"+arr.size());
		int readCompID=-1;
		Statement stmt = null;
		ResultSet rs =null;
		Connection con = null;		

		for(int i =0;i<arr.size();i++)
		{
			String arrStr = (String)arr.get(i);
			System.out.println("Arrstr " +arrStr);
			String[] valStr = arrStr.split(":");
			System.out.println("Ln: "+valStr.length);
			String userStrId = null;
			String qsnStrId = null;
			String compStrId = null;
			String opStrId = null;
			Long userId = null;
			Long qsnId = null;
			Long compId = null;
			Long opId = null;
			String status=null;
			System.out.println("ValStr Length: " + valStr.length);
			for(int k=0;k<valStr.length;k++)
			{
				userStrId = valStr[0];
				userId = Long.parseLong(userStrId);
				//System.out.println("userId : "+userId);
				
				compStrId = valStr[1];
				compId=Long.parseLong(compStrId);
				//System.out.println("compId : "+compId);
				
				qsnStrId =  valStr[2];
				qsnId= Long.parseLong(qsnStrId);
				//System.out.println("qsnId : "+qsnId);
				
				opStrId =   valStr[3];	
				opId= Long.parseLong(opStrId);
				//System.out.println("opStrId : "+opStrId);
				
				status=valStr[4];
				//System.out.println("status : "+status);
			}
			System.out.println("user Id : "+userId+" comprehension Id : "+compId+" Question Id : "+qsnId+" Option Id : "+opId);
			
			try
			{
				con = ConnectDatabase.getConnection();
				String regQry = "select READING_TEST_ID from bpo_user_reading_comp_test order by READING_TEST_ID DESC";
				System.out.println("query "+regQry);
				stmt = con.createStatement();
				rs = stmt.executeQuery(regQry);
				if(rs.next())
				{
					System.out.println("READING_TEST_ID"+rs.getInt("READING_TEST_ID"));
					readCompID = rs.getInt("READING_TEST_ID");
					readCompID++;
				}
				else
				{
					readCompID=1;
				}
				System.out.println("user id"+userId);
				PreparedStatement pst = con.prepareStatement("INSERT INTO bpo_user_reading_comp_test VALUES(?,?,?,?,?,?)");
				pst.setLong(1,readCompID);
				pst.setLong(2,userId);
				pst.setLong(3,compId);
				pst.setLong(4,qsnId);
				pst.setLong(5,opId);
				pst.setString(6,status);
				int il = pst.executeUpdate();
				System.out.println(il);
				if(il!=0)
				{
					System.out.println("inserted");
					String fg="Y";					
					String stausrrr="SELECT count(status) FROM bpo_user_reading_comp_test where user_id="+userId+" and status like '"+fg+"'";
					System.out.println("status+....."+stausrrr);
					Statement st=con.createStatement();
					int totalerror=0;
					ResultSet rs2=st.executeQuery(stausrrr);
					boolean bs=false;
					 bs=rs2.next();
					if(bs==true)
					{
						totalerror=rs2.getInt(1);
						PreparedStatement pstss=con.prepareStatement("update result_total set Common_error=? where user_id="+userId+"");
						pstss.setInt(1, totalerror);
						pstss.executeUpdate();						
					}
					else
					{
						totalerror=0;
						PreparedStatement pstssss=con.prepareStatement("update result_total set Common_error=? where user_id="+userId+"");
						pstssss.setInt(1, totalerror);
						pstssss.executeUpdate();
					}
			
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			finally
			{
				ConnectionDAO.closeConnection(con, stmt, rs);
			}
		}
	}
}































