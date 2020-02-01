package util;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class MatchCandDetails 
{	
	public static int VerifyCandNameEmailPhone(String candFName, String candLName, String candPhone, String candEmail, String  EDKey, String EDKPass) 
	{
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		int ragValue=0;
		String queryFor="";
		int countDateRow=0;
		try
		{
			con=ConnectDatabase.getConnection();
			st=con.createStatement();
			CallableStatement callist = con.prepareCall("call Encrypt_Get_RAG_Value_Ist(?,?,?,?,?,?)");
			callist.setString(1, candFName);
			callist.setString(2, candLName);
			callist.setString(3, candEmail);
			callist.setString(4, candPhone);
			callist.setString(5, EDKey);
			callist.setString(6, EDKPass);
			rs=callist.executeQuery();
			System.out.println("Call RAG Value - START ===> '"+candFName+"','"+candLName+"','"+candEmail+"','"+candPhone+"' <=== END");
    	    if(rs.next())
    	    {
				countDateRow=rs.getInt("countRAG_ist");
				if(countDateRow>0)
				{
					ragValue=1;
				}
				else
				{
					CallableStatement call = con.prepareCall("Call Encrypt_Get_RAG_Value_2nd(?,?,?,?,?,?)");
					call.setString(1, candFName);
					call.setString(2, candLName);
					call.setString(3, candEmail);
					call.setString(4, candPhone);
					call.setString(5, EDKey);
					call.setString(6, EDKPass);
					ResultSet rs1=call.executeQuery();
					if(rs1.next())
					{
						countDateRow=rs1.getInt("countRAG_2nd");
						if(countDateRow>0)
						{
							ragValue=2;		
						}
						else
						{
							ragValue=3;
						}					
					}
					rs1.close();
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			ConnectionDAO.closeConnection(con, null, rs);
		}
		return ragValue;
	}
}
