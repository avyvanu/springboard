package util;

import java.io.PrintStream;
import java.sql.*;

// Referenced classes of package util:
// ConnectDatabase

public class CountQ
{

public CountQ()
{
}

public static int returnRan()
{
int ran = 0;
try
{
Connection con = ConnectDatabase.getConnection();
String Query = "select count(distinct(*) from bpo_chat_master";
Statement stmt = con.createStatement();
for(ResultSet rs = stmt.executeQuery(Query); rs.next();)
ran = rs.getInt(1);

}
catch(Exception e)
{
System.out.println(e);
}
return ran;
}

public static int CompRandumNumber()
{
int Comprandumran = 0;
try
{
Connection con = ConnectDatabase.getConnection();
String Query = "select count(*) from bpo_reading_comp_master where Is_Alive = 1 and Is_Deleted = 0";
System.out.println("Query::::::::"+Query);
Statement stmt = con.createStatement();
for(ResultSet rs = stmt.executeQuery(Query); rs.next();)
Comprandumran = rs.getInt(1);

}
catch(Exception e)
{
System.out.println(e);
}
return Comprandumran;
}

public static int englishRandumNumber()
{
int Comprandumran = 0;
try
{
Connection con = ConnectDatabase.getConnection();
String Query = "select count(distinct reading_comp_master_id) from bpo_eng_comp_master";
Statement stmt = con.createStatement();
for(ResultSet rs = stmt.executeQuery(Query); rs.next(); System.out.println((new StringBuilder("EnglishRandumNumber ")).append(Comprandumran).toString()))
Comprandumran = rs.getInt(1);

}
catch(Exception e)
{
System.out.println(e);
}
return Comprandumran;
}

public static int randumselectfirsttime()
{
int Comprandumranss = 0;
try
{
Connection con = ConnectDatabase.getConnection();
String Query = "select max(CHAT_MASTER_ID) from bpo_chat_master ";
Statement stmt = con.createStatement();
for(ResultSet rs = stmt.executeQuery(Query); rs.next();)
Comprandumranss = rs.getInt(1);

}
catch(Exception e)
{
System.out.println(e);
}
return Comprandumranss;
}

public static int correctsentence()
{
int Comprandumranssddddd = 0;
try
{
Connection con = ConnectDatabase.getConnection();
String Query = "select max(CHAT_MASTER_ID) from bpo_chat_master where QuType='Correct the sentences given below (if required):-'";
Statement stmt = con.createStatement();
for(ResultSet rs = stmt.executeQuery(Query); rs.next();)
Comprandumranssddddd = rs.getInt(1);

}
catch(Exception e)
{
System.out.println(e);
}
return Comprandumranssddddd;
}
}
