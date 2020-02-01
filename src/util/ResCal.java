package util;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/

import java.sql.Connection;


public class ResCal
{
	static int reading_com_marks_result=0;
	static int english_grammer_marks_result=0;
	static int mockchat_marks_result=0;
	
	public static ArrayList<Integer> validateDataFromDataBase( )
	{
		
		boolean status=false;
		Statement stmt=null,stmt2=null,stmt3=null;
		ResultSet rs=null,rs2=null,rs3=null;
		
		ArrayList<Integer> results=new ArrayList<Integer>();
		
		String reading_com_marks=null;
		String  english_grammer_marks=null;
		String mockchat_marks=null;
		
		
		try
		{
			Connection con=ConnectDatabase.getConnection();
			
			reading_com_marks="select MaxScoreMarks FROM maximum_read_assement_no where Maximum_read_assement_ID=1";
			System.out.println(reading_com_marks);
		    english_grammer_marks="SELECT Max_Score_Marks FROM maximum_english_grammar where MaxiMum_EnglishGrammar_ID=1";
		    System.out.println(english_grammer_marks);
			mockchat_marks="SELECT Max_Score_Marks FROM maximum_language_assessment where Maximum_Language_Assessment_ID=1";
			System.out.println(mockchat_marks);
			
			System.out.println(reading_com_marks);
			System.out.println("query "+reading_com_marks);
			
			
			 stmt = con.createStatement();
			 rs = stmt.executeQuery(reading_com_marks);
			 
			 stmt2 = con.createStatement();
			 rs2 = stmt2.executeQuery(english_grammer_marks);
			 
			 stmt3 = con.createStatement();
			 rs3 = stmt3.executeQuery(mockchat_marks);
			
			System.out.println(rs);
			if(rs.next())
			{
				status=true;
				reading_com_marks_result=rs.getInt(1);
				
			}
			if(rs2.next())
			{
				status=true;
				english_grammer_marks_result=rs2.getInt(1);
			}
			if(rs3.next())
			{
				status=true;
				mockchat_marks_result=rs3.getInt(1);
			}
			
		
			results.add(reading_com_marks_result);
			results.add(english_grammer_marks_result);
			results.add(mockchat_marks_result);
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return results;
	}
	//
	
	
		
	   public static ArrayList<String> Resultcal(String accuracy,String speed,String matchingcase,String mismatching,String compreroor,String chaterror,String engError)
	   {
		      Integer comperror=0;
			  String Speed=null;
			  String Accuracy=null;
			  String matching=null;
			  String Mismatching=null;
			  String Chaterror=null;
			  
			  Double speedConverted=0.0;
			  Double AccuracyConverted=0.0;
			  Double matchingConverted=0.0;
			  Double mismatchingConverted=0.0;
			  Double chaterrorConverted=0.0;
			  Double compreroorConverted=0.0;
			  Double enggconverted=0.0;
			  
			  //vishnu
			 
			   
			  
			   ArrayList<String> array=new ArrayList<String>();
	
			   
			   
	if(compreroor!=null && speed!=null && accuracy!=null && matchingcase!=null && mismatching!=null && chaterror!=null && enggconverted!=null)
	{
		
		//totalmaxiMumMarks xx=new totalmaxiMumMarks();
		
		
		
		
		
	  System.out.println("accuracy"+accuracy);
	  System.out.println("Speed"+Speed);
	  System.out.println("matchingcase"+matchingcase);
	  System.out.println("mismatching"+mismatching);
	  System.out.println("compreroor"+compreroor);
	  System.out.println("chaterror"+chaterror);
	speedConverted=Double.parseDouble(speed);
	AccuracyConverted=Double.parseDouble(accuracy);
	matchingConverted=Double.parseDouble(matchingcase);
	mismatchingConverted=Double.parseDouble(mismatching);
	chaterrorConverted=Double.parseDouble(chaterror);
	compreroorConverted=Double.parseDouble(compreroor);
	enggconverted=Double.parseDouble(engError);
	System.out.println("compreroorConverted"+compreroorConverted);
	
	double totaleerror=mismatchingConverted+matchingConverted;
	
	double totalchaerror=(chaterrorConverted/mockchat_marks_result)*100;
	totalchaerror=Math.round(totalchaerror);
	double totalcompreeeror=(matchingConverted/totaleerror)*100;
	totalcompreeeror=Math.round(totalcompreeeror);
	double comp=(compreroorConverted/reading_com_marks_result)*100;
	comp=Math.round(comp);
	double engresult=(enggconverted/english_grammer_marks_result)*100;
	engresult=Math.round(engresult);
	 System.out.println("comp"+comp);
	 
	 
	 
	 //vishnu
	// double final_result_for_Comp_EngResult=(comp+engresult);
	 //final_result_for_Comp_EngResult=Math.round(final_result_for_Comp_EngResult);
	 
	// double final_result_for_total_Comp_EngResult=(final_result_for_Comp_EngResult/((reading_com_marks_result)+(english_grammer_marks_result)))*100;
	// final_result_for_total_Comp_EngResult=Math.round(final_result_for_total_Comp_EngResult);
	 
	 
	 
	 
	
	System.out.println("matchingConverted="+matchingConverted);
	System.out.println("totaleerror="+totaleerror);
	System.out.println("Compreeeeor="+totalcompreeeror);

	String speedConverted1=Double.toString(speedConverted);
	String AccuracyConverted1=Double.toString(AccuracyConverted);
	String totalchaerror1=Double.toString(totalchaerror);
	String totalcompreeeror1=Double.toString(comp);
	
	//vishnu
//	String totalcompreeeror1_22=Double.toString(final_result_for_total_Comp_EngResult);
	//System.out.println(totalcompreeeror1_22);
	
	String totalengresult=Double.toString(engresult);
	System.out.println(speedConverted1);
	System.out.println(AccuracyConverted1);
	System.out.println(totalchaerror1);
	System.out.println(totalcompreeeror1);
	
	 array.add(speedConverted1);
	 array.add(AccuracyConverted1);
	 array.add(totalchaerror1);
	 array.add(totalcompreeeror1);
	 
	 //vishnu
	// array.add(totalcompreeeror1_22);
	 
	 array.add(totalengresult);
	 return array;
	 

	}
	
	
	
	 array.add("0");
	 array.add("0");
	 array.add("0");
	 array.add("0");
	 array.add("0");
	return array;
	}
	   public static void main(String[] args) {
		   ResCal cal=new ResCal();
		   cal.validateDataFromDataBase();
		
	}
	   
	   
	  }

		
		
			
	


