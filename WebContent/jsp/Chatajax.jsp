<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page import="util.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.RandomNumber"%>

  
  <body>
   <%
  String userid=(String)session.getAttribute("USERID2");
  
  System.out.println(userid);
  String questionid=null;
  int totalreplay=0;
  HttpSession session12 = request.getSession();
   ConnectDatabase connectDatabase=new  ConnectDatabase();
  Connection con=connectDatabase.getConnection();
   int attempID=0;
  //code changes started
   //if(session12.getAttribute("LoggingOut")!=null)
  // {
  	String rdf="select count(question) from chatsavetable  where USER_ID='"+userid+"' ";
  	
  	Statement stdf=con.createStatement();
  	ResultSet rs6=stdf.executeQuery(rdf);
  	
  	if(rs6.next())
  	{
  	totalreplay=rs6.getInt(1);
  	}
  
  				try
    			{
    				String drRegQry = "select count(CHAT_TEST_ATTEMPT_ID) from bpo_user_chat_test_attempt where  USER_ID='"+userid+"' order by CHAT_TEST_ATTEMPT_ID DESC ";
    				System.out.println("Step 3 Query "+drRegQry);
    				Statement drStmt = con.createStatement();
    				ResultSet drRs = drStmt.executeQuery(drRegQry);
    				if(drRs.next())
    				{
    				
    					attempID = drRs.getInt(1);
    					
    					
    					
    					
    					
    					
    				}
    				
    				
    			}
    			catch (Exception e) 
    			{
    				e.printStackTrace();
    			}
    			if(attempID<=9)
    			{
    			
    			int ik = Integer.parseInt(userid);
    			PreparedStatement oPst = con.prepareStatement("INSERT INTO bpo_user_chat_test_attempt( USER_ID, START_DATE_ACTIVE) VALUES(?,sysdate())");
    		//	oPst.setInt(1,attempID);
    			oPst.setInt(1,ik);
    			int k = oPst.executeUpdate();
    			System.out.println(k);
    			if(k!=0)
    			{
    				System.out.println("inserted");
    			}
    			
    			}
    		//	session12.setAttribute("LoggingOut","LogOut");
 // }
  
  if(userid !=null)
  {
   String userdata=null;
   userdata=request.getParameter("ans");
 
  
if(userdata !=null)

{
String sql3="update  chatsavetable set replays='"+userdata+"'  where  replays is null  and USER_ID='"+userid+"'  ";
 Statement stmt3=con.createStatement();
int s=stmt3.executeUpdate(sql3);

}
System.out.println("user>>>"+userdata);
  
  Statement stmt=con.createStatement();
  int ranNum = RandomNumber.doRawRandomNumber();
 
  String sql="select * from bpo_chat_master where QUESTION is not null and  CHAT_MASTER_ID="+ranNum ;
  ResultSet rs=stmt.executeQuery(sql);
  
  List list=new ArrayList();
  String quest=null;
  if(rs.next())
  {
  	quest=rs.getString("QUESTION");
  }
  rs.close();
  if(totalreplay<=9){
  System.out.println("totalreplay>>>>>"+totalreplay);
  String sql2="insert into chatsavetable (question,USER_ID) values('"+quest+"','"+userid+"')  ";
   Statement stmt2=con.createStatement();
int as=stmt2.executeUpdate(sql2);

}


  String sql4="select * from chatsavetable  where USER_ID='"+userid+"' ";
   Statement stmt4=con.createStatement();
  ResultSet rs2=stmt4.executeQuery(sql4);
  
   String qustions=null;
   String answers=null;
   while(rs2.next())
  {
 qustions=rs2.getString("question");
  answers=rs2.getString("replays");
  
  if(answers==null)
  {
  answers="";
  
  
  }
 
 }rs2.close();
    out.println(qustions+":"+answers);
  }
  
 
   %>
  </body>

