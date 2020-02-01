package util;

public class DataValidator 
{

	public static boolean CommonValidator(String value) 
	{
		boolean chkFields = true;
		System.out.println("INSIDE CommonValidator JAVA Page");		
		if(value != null)
		{
			if(value.equals("") || value.length() == 0)
			{
				chkFields = false;
			}		
		}
		else
		{
			chkFields = false;
		}
		return chkFields;
	}
}
