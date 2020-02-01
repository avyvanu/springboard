package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GenerateCCAPassword 
{
	public static String getCCAPassword(){
		String password="";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try{
			con=ConnectDatabase.getConnection();
			con.setAutoCommit(false);
			ps=con.prepareStatement("SELECT UPPER(CONVERT(SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(MD5(RAND()),'1',''),'0',''),'a',''),'e',''),'i',''),'o',''),'u','')FROM 1 FOR 8) USING latin1)) AS password");
			rs=ps.executeQuery();
			if(rs.next())
			{
				password = rs.getString("PASSWORD");
				System.out.println("password::::"+password);
				
			}
			
	}catch(Exception e){
		e.printStackTrace();
		
	}finally{
		ConnectionDAO.closeConnection(con, ps, rs);
	}
	return password;
	}
}
