package util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimestampDiff {
	
/*public String getDateTimeDiff(String prev, String curr){
		
		float oneHr = 1000 * 60 * 60;
		double total = 0;    
	    try{
	    	
		    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		    DateFormat time = new SimpleDateFormat("HH:mm:ss");
		    String[] prevDate = prev.split(" ");
			String[] currDate = curr.split(" ");
			
		    Date first = df.parse(prevDate[0]);
		    Date two = df.parse(currDate[0]);
		    long dateDiff = two.getTime() - first.getTime();
		    double dateDiffHr = (dateDiff/oneHr);
		    System.out.println("Date Diffence: "+dateDiffHr);	    
		    
		    Date timefirst = time.parse(prevDate[1]);
		    Date timetwo = time.parse(currDate[1]);
		    long timeDiff = timetwo.getTime() - timefirst.getTime();
		    double timeDiffHr = (timeDiff/oneHr);
		    System.out.println("Time Diffence: "+timeDiffHr);
		    
		    String timehr = String.valueOf(timeDiffHr);
		    int index = timehr.indexOf(".");
		    String hour = timehr.substring(0, index);
		    System.out.println("Hour: "+hour);
		    
		    String min = timehr.substring(index+1,index+4);
		    min = "0."+min;
		    System.out.println("Min: "+min);
		    
		    double minute = Double.parseDouble(min);
		    
		    if(minute > 0.59){
		    	 System.out.println("inside");
		    	//For calculating minutes
		    	 minute =  (60 * minute)/100;			   
		    }
		    double concatHrMin  = Double.parseDouble(hour) + minute;
		    System.out.println("Time Diffence: "+concatHrMin);
		    
		    total = dateDiffHr + concatHrMin;		    
		    System.out.println("Total Date/Time Diffence: "+total);
		   
	    }catch(Exception e){} 
	    
	    String strTotal = String.valueOf(total);
	    if(strTotal.length()>5)
	    	strTotal = strTotal.substring(0, strTotal.indexOf(".")+3);
	    
	    return strTotal;
	}*/
	public String getDateTimeDiff(String prev, String curr){
		float oneHr = 1000 * 60 * 60;
		double concatHrMin = 0;
		try{
		    DateFormat complate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    Date p1 = complate.parse(prev);
		    Date c1 = complate.parse(curr);
		    long a1 = c1.getTime() - p1.getTime();
		    double dthr = (a1/oneHr);
		    //System.out.println(dthr);
		    String timehr = String.valueOf(dthr);
		    int index = timehr.indexOf(".");
		    String hour = timehr.substring(0, index);
		    System.out.println("Hour: "+hour);
		    
		    String min = timehr.substring(index,index+2);
		    min = "0"+min;
		    System.out.println("Min: "+min);
		    double minute = Double.parseDouble(min);
		    
		    if(minute > 0.59)
		    {		    	
		    	//For calculating minutes
		    	 minute =  (60 * minute)/100;			   
		    }
		    concatHrMin  = Double.parseDouble(hour) + minute;
		    System.out.println("Time Diffence: "+concatHrMin);		   
		}
		catch(Exception e){} 
		return String.valueOf(concatHrMin);
	}
	public static void main(String[] args) {
		String prev = "2010-02-15 23:00:13";
		String curr = "2010-02-15 23:41:38";
		TimestampDiff dif = new TimestampDiff();
		String  concatHrMin = dif.getDateTimeDiff(prev, curr);
		System.out.println("Time Diffence: "+concatHrMin);
	}
}
