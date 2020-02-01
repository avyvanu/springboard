package util;

import java.util.StringTokenizer;
import java.lang.Math.*;
import java.util.ArrayList;
import java.util.List;

public class CompareData
{
	public static void main(String[] args) 
	{
		System.out.println("Compare two strings");
		String s1 = "hi this is babu, what is happend fg fg fg\n sfwerr";
		String s2 = "hi this is babu, happend asd asda asd asd asdas asdsad asd";
		System.out.println("S1:"+s1);
		System.out.println("S2:"+s2);
		String scomp = callCompare(s1,s2);
		
		
		//StringTokenizer strToken = new StringTokenizer(s1," ");
		/*int count=0;
		for(int i = 0;i<k.length;i++)
		{
			try
			{
				if(k[i].equals(m[count]))
				{
					System.out.println("EQUAL");
					correct++;
				}
				else
				{
					System.out.println("Not EQual");
					error++;
				}
				count++;
			}
			catch (Exception e) 
			{
				e.printStackTrace();
				error++;
			}
		}
		System.out.println("Correct: "+correct);
		System.out.println("In Correct: "+error);*/
	/*	int n = 0;
		System.out.println("len:"+m.length);
		int sVal = m.length;
		int i=0;
		for(;i<k.length;i++)
		{
			System.out.println("String 1: "+k[i]);
			//System.out.println("String 2: "+m[n]);
			if(k[i].equals(m[n]))
			{
				System.out.println("equal");
			}
			else
			{
				System.out.println("not equal");
				
			}
			n++;
		}
		for(;i<k.length;i++)
		{
			System.out.println("---"+k[i]);
		}*/
	}
	public static String callCompare(String s1,String s2)
	{
		String kl=s1;
		
		//String hjp=kl.replaceAll(".", " ");
		
		
		//System.out.println(hjp);
		
		String hj=s2;
		
		
		StringTokenizer hjs= new StringTokenizer(kl," "+"."+","+";"+":"+"'");
		StringTokenizer hjsd= new StringTokenizer(hj," "+"."+","+";"+":"+"'");
		List list2=new ArrayList();
		
		List list1=new ArrayList();
		
		while(hjs.hasMoreTokens())
		{
			String t =(String) hjs.nextToken();

			list1.add(t);
			System.out.println(t);
			
		}
		
	
		while(hjsd.hasMoreTokens())
		{
			String tss =(String) hjsd.nextToken();

			list2.add(tss);
			System.out.println(tss);
			
		}
		int counter = 0;
		int miscount=0;
		int correct=0;
		int matchnode=0;
		for (int i=0;i<list2.size();i++) {
			boolean status=list2.get(i).equals(list1.get(i+matchnode));
			if(status==true)
			{
				//matchnode=list1.get(i);
				counter++;
				
			}
			else{
				miscount++;
				
			}

			
			
			
			
			
						if(status==false &&list2.get(i).equals(list1.get(i+1+matchnode)))
			{
				matchnode++;
				counter++;
				System.out.println("Counter>>>   "+counter);
				
				
				
				}
			
			if(status==false )
				
			{
				
				if(i>0 && list2.get(i).equals(list1.get(i-1+matchnode))){
					
					//if(matchnode >0){
					matchnode--;
					//}
					counter++;
					System.out.println("Counter>>>   "+counter);
						
					
				}
				
				
				
				}
		
		
		
		
		}
		
		//System.out.println("sisze 44"+gh.size());
		//System.out.println("sisze 44"+gh2.size());
		
		
		
		
		System.out.println("mismatch>>>"+miscount);
		
		System.out.println("matc>>>"+counter);
		
		
		
		
			Integer error = 0;
			error = miscount+Math.abs(s1.length()-s2.length());
			System.out.println("Correct: "+counter);
			System.out.println("Error: "+error);
			String cor = Integer.toString(counter);
			String err = Integer.toString(miscount);
			
			System.out.println("correct"+cor);
			System.out.println("miscount"+err);
			return cor+":"+err+":"+list2.size();
		}
}
