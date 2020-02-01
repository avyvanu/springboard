package servlets.TypingTest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Timer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import bl.UserManager;
import util.*;
public class TypingTest extends HttpServlet
{
	
	ServletContext sctx=null;
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		sctx=this.getServletContext();
	}
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		System.out.println("Inside Typing test page");
		HttpSession session = req.getSession();
		String methodName = req.getParameter("methodName");
		System.out.println("methodName : "+methodName);
		
		HttpSession httpSession=req.getSession(true);
		
		String  typess=(String)httpSession.getAttribute("ErrorCheck");
		
		if(typess!=null && typess.length()!=0)
		{
			methodName=typess;			
		}
		System.out.println("Method name in Java"+methodName);
		int ranNum = RandomNumber.doRawRandomNumber();
		int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
		ArrayList compList = new ArrayList();
		Connection con=null;
		long attempTypeID=-1;
		if(methodName!=null)
		{
			if(methodName.trim().equalsIgnoreCase("loadTypingPage"))
			{
				System.out.println(" inside load typing page data");
				long attempID=-1;
				UserManager userManager = new UserManager();
				Statement drStmt=null;
				ResultSet drRs=null;
				try
	    		{
	    			con = ConnectDatabase.getConnection();
	    			try
	    			{
	    				String drRegQry = "select TYPING_TEST_ATTEMPT_ID from bpo_user_typing_test_attempt order by TYPING_TEST_ATTEMPT_ID DESC";
	    				System.out.println("query "+drRegQry);
	    				drStmt = con.createStatement();
	    				drRs = drStmt.executeQuery(drRegQry);
	    				if(drRs.next())
	    				{
	    					System.out.println("TYPING_TEST_ATTEMPT_ID  V: "+drRs.getInt("TYPING_TEST_ATTEMPT_ID"));
	    					attempID = drRs.getInt("TYPING_TEST_ATTEMPT_ID");
	    					attempID++;
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
	    			PreparedStatement oPst = con.prepareStatement("INSERT INTO bpo_user_typing_test_attempt(TYPING_TEST_ATTEMPT_ID, USER_ID, START_DATE_ACTIVE, END_DATE_ACTIVE, Num_Of_Matches, Num_Of_Mismatches, ACCURACY, SPEED) VALUES(?,?,sysdate(),?,?,?,?,?)");
	    			oPst.setLong(1,attempID);
	    			oPst.setLong(2,USER_AUTOID);
	    			oPst.setString(3,null);
	    			oPst.setLong(4,0);
	    			oPst.setLong(5,0);
	    			oPst.setString(6,null);
	    			oPst.setString(7,null);
	    			int k = oPst.executeUpdate();
	    			System.out.println(k);
	    			if(k!=0)
	    			{
	    				PreparedStatement stmts=con.prepareStatement("update  result_total set Speed=?,Accuracy=?,matching=?,mismatching=? where user_id='"+USER_AUTOID+"'");
	    				stmts.setInt(1, USER_AUTOID);
	    				stmts.setInt(1, USER_AUTOID);
	    				System.out.println("inserted");
	    			}
	    		}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				finally
				{
					ConnectionDAO.closeConnection(con, drStmt, drRs);	
				}
				compList = userManager.typingTestList();
				if(!compList.isEmpty())
				{
					System.out.println("Array is not empty");
					System.out.println("Array Size:"+compList.size());
					RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/TypingTest.jsp");
					System.out.println("Forwarding to Compr test Page");
					req.setAttribute("ArrListData",compList);
					rd.forward(req,resp);
				}
			}
		}
		
		// **************************************************************  AFTER TYPING TEST ************************************ //
		if(methodName.trim().equalsIgnoreCase("ErrorCheck"))
		{
			System.out.println(" Inside After typing submit button  Error Check Method");
			float noOfWords=0;
			String s1 = (String)session.getAttribute("PASSDATA");
			String s2 = req.getParameter("reply");
			if(s2==null)
			{
				s2=" ";				
			}
			String typeId = req.getParameter("typeID");
			String  typeID=(String)httpSession.getAttribute("typeID");			
			if(typeID!=null && typeID.length()!=0)
			{
				typeId=typeID;				
			}
		
			int typeTestId=Integer.parseInt(typeId);
			String correctAError = CompareData.callCompare(s1,s2);
			System.out.println("CORRECT and ERROR count  : "+correctAError);
			String[] verifyAns = correctAError.split(":");
			System.out.println("Correct Word: "+verifyAns[0]);
			System.out.println("Error Word: "+verifyAns[1]);
			System.out.println("No. Of Words Typed: "+verifyAns[2]);
			Statement drStmt=null;
			ResultSet drRs=null;
			try
    		{
    			con = ConnectDatabase.getConnection();
    			try
    			{
    				String drRegQry = "select TYPING_TEST_ID from bpo_user_typing_test order by TYPING_TEST_ID DESC";
    				System.out.println("query "+drRegQry);
    				drStmt = con.createStatement();
    				drRs = drStmt.executeQuery(drRegQry);
    				if(drRs.next())
    				{
    					System.out.println("TYPING_TEST_ID"+drRs.getInt("TYPING_TEST_ID"));
    					attempTypeID = drRs.getInt("TYPING_TEST_ID");
    					attempTypeID++;
    				}
    				else
    				{
    					attempTypeID=1;
    				}
    			}
    			catch (Exception e) 
    			{
    				e.printStackTrace();
    			}
    			
    			PreparedStatement oPst = con.prepareStatement("INSERT INTO bpo_user_typing_test VALUES(?,?,?,?)");
    			oPst.setLong(1,attempTypeID);
    			oPst.setLong(2,USER_AUTOID);
    			oPst.setLong(3,typeTestId);
    			oPst.setString(4,s2);
    			int k = oPst.executeUpdate();
    			System.out.println(k);
    			if(k!=0)
    			{
    				System.out.println(" Typing datat inserted sucessfully ");    				
     			}
    		}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			finally
			{
				ConnectionDAO.closeConnection(con, drStmt, drRs);	
			}
			if(correctAError!=null)
			{
				System.out.println("End Exam");
				DateFormat complate = new SimpleDateFormat("HH:mm:ss");
				TimestampDiff timestampDiff = new TimestampDiff();
				String upQry="UPDATE bpo_user_typing_test_attempt set END_DATE_ACTIVE=sysdate(),Num_Of_Matches=?,Num_Of_Mismatches=?,ACCURACY=? where USER_ID="+USER_AUTOID;
				System.out.println("Qry :"+upQry);
				float correctAns = Float.parseFloat(verifyAns[0]);
				System.out.println("Correct ans:"+correctAns);
			
				noOfWords = Float.parseFloat(verifyAns[2]);
				
				System.out.println("no words ans:"+noOfWords);
				
			//	float accuracy = (correctAns/noOfWords)*100;
				float errMatch = Float.parseFloat(verifyAns[1]);
				float fd=correctAns/(correctAns+errMatch);
				System.out.println("fd is"+fd);
				float pp = fd*100;
				System.out.println("PP is"+pp);
				System.out.println("accuracy: "+fd);
				String accur = Float.toString(pp);
				System.out.println("accuracy wth Str: "+accur);
				try
				{
				  con = ConnectDatabase.getConnection();
				  PreparedStatement enPst = con.prepareStatement(upQry);
				  enPst.setString(1,verifyAns[0]);
				  enPst.setString(2,verifyAns[1]);
				  enPst.setString(3,accur);
				  int l = enPst.executeUpdate();
				  if(l>0)
	    		  {
	    				System.out.println("Sucess Fully UpDated the Typing Test Table");

	    				
	    		  }				
			 	  PreparedStatement stmts=con.prepareStatement("update  result_total set Accuracy=?,matching=?,mismatching=? where user_id='"+USER_AUTOID+"'");
				  stmts.setString(1, accur);
				  stmts.setString(2,verifyAns[0]);
				  stmts.setString(3, verifyAns[1]);
				  int status=stmts.executeUpdate();
				}
				
				catch (Exception e) 
				{
					e.printStackTrace();
				}
				Statement drStmt12=null;
				ResultSet drRs12=null;
				try
    			{
    				String drRegQry12 = "select START_DATE_ACTIVE, END_DATE_ACTIVE,(TIMEDIFF(END_DATE_ACTIVE, START_DATE_ACTIVE)) as DIFFTIME, ACCURACY, SPEED from bpo_user_typing_test_attempt where USER_ID="+USER_AUTOID;
    				System.out.println("query of attemp"+drRegQry12);
    				drStmt12 = con.createStatement();
    				drRs12 = drStmt12.executeQuery(drRegQry12);
    				if(drRs12.next())
    				{
    					System.out.println("Time of 1st is:"+drRs12.getString(3));
    					String[] totStr = drRs12.getString("DIFFTIME").split(":");
    					float min =Float.parseFloat(totStr[1]);
    					float sec1 =Float.parseFloat(totStr[2]);
    					float axsec =sec1/60;
    					float timeIn = min + axsec;
    					System.out.println("Time is:"+timeIn); 
    					float spped = noOfWords/timeIn;
    					System.out.println("speed is "+spped);

    					String upQry12="UPDATE bpo_user_typing_test_attempt set SPEED='"+spped+"' where USER_ID='"+USER_AUTOID+"'";
    					System.out.println("Qry :"+upQry12);
    					PreparedStatement enPst12 = con.prepareStatement(upQry12);
    					int chk=enPst12.executeUpdate();
    					if(chk>0)
    					{
    	    				String chkData = "select ACCURACY, SPEED from bpo_user_typing_test_attempt where USER_ID="+USER_AUTOID;
    	    				System.out.println(" chkData "+chkData);
    	    				drStmt12 = con.createStatement();
    	    				drRs12 = drStmt12.executeQuery(chkData);
    	    				if(drRs12.next())
    	    				{	
    	    					Statement SpeedNo=con.createStatement();
    	    					double sppedDATA=0.0;
    	    					ResultSet rs=SpeedNo.executeQuery("SELECT Typing_Speed_Data FROM bpo_user_typing_speed_data");
    	    					if(rs.next())
    	    					{
    	    						sppedDATA=rs.getDouble("Typing_Speed_Data");
    	    					}
    	    					
	          					String ACCURACY=drRs12.getString("ACCURACY");
	        					String SPEED=drRs12.getString("SPEED");
	        					float NewAccuR = new Float(ACCURACY);
	    	    				float newSpeed = new Float(SPEED);
	    	    				double	speed_into_acc_divby_hundred = Math.round(((double)((newSpeed) * (NewAccuR))/100));		
	    	    				System.out.println("speed_into_acc_divby_hundred\t"+speed_into_acc_divby_hundred);
	    	    				String statusTyping=null;
	    	    				if(speed_into_acc_divby_hundred>sppedDATA)
	    	    				{
	    	    					statusTyping="Pass";
	    	    				}
	    	    				else
	    	    				{
	    	    					statusTyping="Fail";
	    	    				}
	        					String upQry12Final="UPDATE bpo_user_typing_test_attempt set Final_Score="+speed_into_acc_divby_hundred+", Final_Status='"+statusTyping+"' where USER_ID='"+USER_AUTOID+"'";
	        					System.out.println("upQry12Final :"+upQry12Final);
	        					PreparedStatement enPst12Final = con.prepareStatement(upQry12Final);
	        					enPst12Final.executeUpdate();
    	    				}
    					}
    				}
    			}
    			catch (Exception e)
    			{
    				e.printStackTrace();
    			}
    			finally
    			{
    				ConnectionDAO.closeConnection(con, drStmt12, drRs12);
    			}
				RequestDispatcher rd=sctx.getRequestDispatcher("/247Recruit/jsp/TypingTestSucessPage.jsp");
				req.setAttribute("TypingStatus","typeSuccess");
				rd.forward(req,resp);
				
			}
		}
	}

}