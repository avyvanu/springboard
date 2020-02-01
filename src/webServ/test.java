package webServ;
public class test 
{

	public static void main(String[] args) {

		/*ConnectService ss=new ConnectService();
		ConnectServiceSoap service=ss.getConnectServiceSoap();
		System.out.println(service.authenticate247Connect("01046367", "123456@abc"));*/
	}
	public static boolean validUser(String UserName, String password)
	{
		boolean aaaa=false;
		ConnectService ss=new ConnectService();
		ConnectServiceSoap service=ss.getConnectServiceSoap();
		aaaa=service.authenticate247Connect(UserName, password);	
		System.out.println(" ********** CALL WEB SERVICES \t"+aaaa);
		return aaaa;
		
		
	}
}
