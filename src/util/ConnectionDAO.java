package util;

import java.sql.*;

public class ConnectionDAO 
{
	public static void closeConnection(Connection connection, Statement statement,ResultSet resultset) {
		if (resultset != null)
		{
			try
			{
				resultset.close();
			}
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
			finally
			{
				resultset = null;
			}
		}

		if (statement != null)
		{
			try
			{
				statement.close();
			}
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
			finally
			{
				statement = null;
			}
		}

		if (connection != null)
		{
			try
			{
				connection.close();	
			}
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
			finally
			{
				connection = null;
			}
		}
	}
}
