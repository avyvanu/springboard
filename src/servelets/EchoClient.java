package servelets;

import java.io.*;
import java.net.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.StringTokenizer;

import util.ConnectDatabase;

public class EchoClient {

	public static void Gramerchek(String userid)
			throws IOException, SQLException {
		String passage=null;
		ConnectDatabase conection=new ConnectDatabase();
		Connection con=conection.getConnection();
		Statement statement=con.createStatement();
		
		System.out.println(userid);
		int error = 0;
		int gramer = 0;
		int spell = 0;
		Socket echoSocket = null;
		PrintWriter out = null;
		BufferedReader in = null;

		try {
			echoSocket = new Socket("localhost", 1049);
			out = new PrintWriter(echoSocket.getOutputStream(), true);
			in = new BufferedReader(new InputStreamReader(echoSocket
					.getInputStream()));
		} catch (UnknownHostException e) {
			System.err.println("Don't know about host: 192.168.1.59.");
			//System.exit(1);
		} catch (IOException e) {
			System.err.println("Couldn't get I/O for "
					+ "the connection to: 192.168.1.43");
			//System.exit(1);
		}

		BufferedReader stdIn = new BufferedReader(new InputStreamReader(
				System.in));
		
		//connect database//
		if(userid !=null || userid.length()!=0)
		{
			
			String questionid=null;
			
			String sql="select replays,question_id from chatsavetable where USER_ID='"+userid+"' and status='0' and replays is not null ";
			
			ResultSet rs=statement.executeQuery(sql);
			while(rs.next())
			{
				
			
				passage=rs.getString("replays");
				//System.out.println("*****passage****"+passage);
			questionid=rs.getString("question_id");
			
			
			
			
			
			
			
			
	
		
		
		
		

		// String request="this iss ann test and be exem";

		StringBuffer sb = new StringBuffer();
		sb.append("POST /checkDocument HTTP/1.0\r\n");
		sb.append("Host: localhost\r\n");
		sb.append("Content-Type: application/x-www-form-urlencoded\r\n");
		sb.append("Content-Length: " + passage.length() + "\r\n");
		sb.append("User-Agent: AtD/0.1\r\n");
		sb.append("\r\n");
		sb.append("data=" + passage);

		if (sb != null) {
			out.println(sb.toString());
		}

		String str = null;

		String test = null;

		StringBuffer buffer = new StringBuffer();
		while ((str = in.readLine()) != null)

		{

			buffer.append(str);

		 System.out.println("echo: " + str);
		}
		test = buffer.toString();

		 //System.out.println(test);
		StringTokenizer stringTokenizer = new StringTokenizer(test);
		while (stringTokenizer.hasMoreTokens()) {

			String ts = (String) stringTokenizer.nextElement();
			//System.out.println("datat>>" + ts);

			if (ts.equals("<error>")) {
				error++;

			}

			else if (ts.equals("<type>spelling</type>")) {
				spell++;

			}
			
			else if(ts.equals("<type>grammar</type>")) {
				 gramer++;
				   }
			
			
			/*else if(stringTokenizer.nextToken().equals("<type>grammar</type>")) {
				 gramer++;
				   }*/

			/*
			 * if(stringTokenizer.nextToken().equals("<error>")) { error++;
			 *  } else if(stringTokenizer.nextToken().equals("<type>spelling</type>")) {
			 * spell++;
			 *  }
			 */
			/*
			 * else if(stringTokenizer.nextToken().equals("<type>spelling</type>")) {
			 * spell++;
			 *  } else if(stringTokenizer.nextToken().equals("<type>grammar</type>")) {
			 * gramer++;
			 *  }
			 */
			// System.out.println(stringTokenizer.nextToken());
			// //<type>spelling</type> <type>spelling</type>

		}
Statement stmt2=con.createStatement();

String sql3="update chatsavetable set Totalerror='"+error+"' , gramererror='"+gramer+"' , spelleror='"+spell+"',status='1' where question_id='"+questionid+"' and USER_ID='"+userid+"' ";
//System.out.println("sql3***"+sql3);
int status=stmt2.executeUpdate(sql3);

String upQry="UPDATE bpo_user_chat_test_attempt set END_DATE_ACTIVE=sysdate(),NUM_OF_GRAMMAR_ERRORS=?,NUM_OF_SPELL_ERRORS=?,TOTAL_NUM_OF_ERRORS=? where USER_ID="+userid;
//System.out.println("Qry :"+upQry);
try
{
	  con = ConnectDatabase.getConnection();
	  PreparedStatement enPst = con.prepareStatement(upQry);
	  enPst.setInt(1,gramer);
	  enPst.setInt(2,spell);
	   enPst.setInt(3,error);
	  int l = enPst.executeUpdate();
}
catch (Exception e) 
{
	e.printStackTrace();
}


	/*	System.out.println("Total number of errors>>>" + error);
		System.out.println("Total number of spelling errors>>>" + spell);
		System.out.println("Total number of grammar errors>>>" + gramer);*/
			}
			
		out.close();
		in.close();
		stdIn.close();
		echoSocket.close();
	}
	}
/*public static void main(String[] args) throws Exception {
		EchoClient client=new EchoClient();
		
		client.Gramerchek("54");
		
		
		

	}*/
	
}