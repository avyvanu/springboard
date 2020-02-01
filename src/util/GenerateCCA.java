package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GenerateCCA 
{
	public static String getCCAUserId(){
		String userId="";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		PreparedStatement psid=null;
		ResultSet rsid=null;
		try{
			con=ConnectDatabase.getConnection();
			ps=con.prepareStatement("select max(Emp_Id) as Emp_Id from user_master where Emp_ID like 'CCA%'");
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				String st=rs.getString("Emp_Id");
				if(st!=null)
				{
					int id=Integer.parseInt(st.substring(3));
					System.out.println("id:::::::"+id);
					psid=con.prepareStatement("select CONCAT(RPAD('CCA',8-LENGTH("+id+"),'00'),"+id+" + 1) as CCAID");
					rsid=psid.executeQuery();
					if(rsid.next())
					{
						userId = rsid.getString("CCAID");
						System.out.println("userId class:::::::"+userId);
					}
				}
				else
				{
					userId="CCA00001";
				}
			}else
			{
				userId="CCA00001";
			}
			
	}catch(Exception e){
		e.printStackTrace();
		
	}finally{
		ConnectionDAO.closeConnection(con, ps, rs);
	}
	return userId;
	}
}
