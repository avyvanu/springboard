package servlets.Users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bl.UserManager;

import util.ConnectDatabase;
import util.Dbconfiguration;
import util.MailXml;
import util.PasswordGenerate;
import util.SMSFunction;
import java.util.List;
import java.util.Iterator;
import java.io.File;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;


public class Registration extends HttpServlet
{
	static long userID=0;
	static long user_detail_id = 0;
	ServletContext sctx=null;
	 
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		sctx=this.getServletContext();
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		/**
		 * Input values from the user
		 */
		/*  My changes.................................................................   */
		
		String path="/emp_resume/";
		
		
		String absalutepath=getServletContext().getRealPath(path);
		
		System.out.println(absalutepath);
		
		
		
		String emailAddr = req.getParameter("emailAddr");
		String reEnterEmailAddr =req.getParameter("reEnterEmailAddr");
		String password=req.getParameter("password");
	//	String reEnterpassword=req.getParameter("reEnterpassword");
		String securityQsn=req.getParameter("securityQsn");
		String ansSecurityQsn=req.getParameter("ansSecurityQsn");
		String suffix = req.getParameter("suffix");
		String firstName=req.getParameter("firstName");
		String midleName=req.getParameter("midleName");
		String lastName=req.getParameter("lastName");
		String addr1=req.getParameter("addr1");
		String addr2=req.getParameter("addr2");
		String country=req.getParameter("country");
		String city=req.getParameter("cityGet");
		String state=req.getParameter("state");
		System.out.println("state"+state);
		String zipCode=req.getParameter("zipCode");
		String phoneNo=req.getParameter("phoneNo");
		String photoId=req.getParameter("photoId");
		String dob=req.getParameter("dob");
		String photoNum=req.getParameter("photoNum");
		/* --------------------------------------------*/
		
		String lang_1=req.getParameter("lang_1");
		String lang_2=req.getParameter("lang_2");
		String lang_3=req.getParameter("lang_3");
		String lang_4=req.getParameter("lang_4");
		String lang_5=req.getParameter("lang_5");
		String lang_6=req.getParameter("lang_6");
		String lang_7=req.getParameter("lang_7");
		String lang_8=req.getParameter("lang_8");
		String lang_9=req.getParameter("lang_9");
		String lang_10=req.getParameter("lang_10");
		String lang_11=req.getParameter("lang_11");
		String lang_12=req.getParameter("lang_12");
		
	
		       
		String SchoolName=req.getParameter("SchoolName");
		String SchoolMedium=req.getParameter("SchoolMedium");
		String SchoolMMJoin=req.getParameter("SchoolMMJoin");
		String SchoolYearJoin=req.getParameter("SchoolYearJoin");
		String SchoolMMCoplete=req.getParameter("SchoolMMCoplete");
		String SchoolYearCoplete=req.getParameter("SchoolYearCoplete");
		String SchoolInstitution=req.getParameter("SchoolInstitution");
		
		String ugName=req.getParameter("ugName");
		String ugMedium=req.getParameter("ugMedium");
		String ugMMJoin=req.getParameter("ugMMJoin");
		String ugYearJoin=req.getParameter("ugYearJoin");
		String ugMMCoplete=req.getParameter("ugMMCoplete");
		String ugYearCoplete=req.getParameter("ugYearCoplete");
		String ugInstitution=req.getParameter("ugInstitution");
		String itemName = "";
		String pgName=req.getParameter("pgName");    
		String pgMedium=req.getParameter("pgMedium");  
		String pgMMJoin=req.getParameter("pgMMJoin");
		String pgYearJoin=req.getParameter("pgYearJoin");
		String pgMMCoplete=req.getParameter("pgMMCoplete");
		String pgYearCoplete=req.getParameter("pgYearCoplete");
		String pgInstitution=req.getParameter("pgInstitution");
		String position=req.getParameter("position");
		String location=req.getParameter("location");
		String experience=req.getParameter("experience");
		String bpoexp=req.getParameter("bpoexp");
		String night_shift=req.getParameter("night_shift");
		String prefer_time=req.getParameter("prefer_time");
		String is_student=req.getParameter("is_student");
		String sub_option =req.getParameter("sub_option");
		String skill=req.getParameter("skill");
		String source_from=req.getParameter("source_from");
		List<String> listvalues=new ArrayList<String>();
		
		String lang=null;
		
		/*---------------------------------------------*/
		boolean checkDuplicateforfirstnamelastnameDOB=false;
		//String list[]=req.getParameterValues("lang");
		
		String lang_o="";
		String lang_r="";
		String lang_w="";
		String lang_s="";
		String list[]=req.getParameterValues("lang");
		String total_box=req.getParameter("total_box");
		 boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		 if (!isMultipart) {
		 } else {
		   FileItemFactory factory = new DiskFileItemFactory();
		   ServletFileUpload upload = new ServletFileUpload(factory);
		   List items = null;
		   try {
		   items = upload.parseRequest(req);
		   } catch (FileUploadException e) {
		   e.printStackTrace();
		   }
		   Iterator itr = items.iterator();
		   while (itr.hasNext()) 
			   {
		   FileItem item = (FileItem) itr.next();
		   if (item.isFormField())
			   {
			      String name = item.getFieldName();
				  String value = item.getString();
				
				  if(name.equals("emailAddr"))
			           {
					  emailAddr=value;
					  System.out.println("emailAddr is ++++++++"+emailAddr);  		
					   }
					  if(name.equals("reEnterEmailAddr"))
			                  {  
						  reEnterEmailAddr=value;            		 
						  System.out.println("reEnterEmailAddr is ++++++++"+reEnterEmailAddr);         
							  }
					  if(name.equals("password"))
			                  {  
						  password=value;            		 
						  System.out.println("password is ++++++++"+password);                  
							  }
					  if(name.equals("securityQsn"))
			                  {
						  securityQsn=value;
						  System.out.println("securityQsn is ++++++++"+securityQsn);         
							  }
		            		 
					  if(name.equals("ansSecurityQsn"))
			             {
					      
						  ansSecurityQsn=value;
						  System.out.println("ansSecurityQsn is ++++++++"+ansSecurityQsn);  
						 }	 
					  
					  
					 
					  if(name.equals("dob"))
			           {
						  dob=value;
						  System.out.println("dob is ++++++++"+dob);   	
					   }
					  if(name.equals("phoneNo"))
			                  {  
						  phoneNo=value;            		 
						  System.out.println("phoneNo is ++++++++"+phoneNo);               
							  }
					 
					  if(name.equals("total_box"))
	                  {  
						  total_box=value;            		 
						System.out.println("total is ++++++++"+total_box);
						  }
					  
			
					  if(name.equals("suffix"))
	                  {  
						 // list=value;  
						  suffix=value;            		 
							System.out.println("suffix is ++++++++"+suffix);
                        
					  }
					  if(name.equals("firstName"))
	                  {  
						 // list=value;  
						  firstName=value;            		 
							System.out.println("firstName is ++++++++"+firstName);
                        
					  }
					  if(name.equals("midleName"))
	                  {  
						 // list=value;  
						  midleName=value;            		 
							System.out.println("midleName is ++++++++"+midleName);
                        
					  }
					  if(name.equals("lastName"))
	                  {  
						 // list=value;  
						  lastName=value;            		 
							System.out.println("lastName is ++++++++"+lastName);
                        
					  }
					  if(name.equals("addr1"))
	                  {  
						 // list=value;  
						  addr1=value;            		 
							System.out.println("addr1 is ++++++++"+addr1);
                        
					  }
					  if(name.equals("addr2"))
	                  {  
						 // list=value;  
						  addr2=value;            		 
							System.out.println("addr2 is ++++++++"+addr2);
                        
					  }
					  if(name.equals("country"))
	                  {  
						 // list=value;  
						  country=value;            		 
							System.out.println("country is ++++++++"+country);
                        
					  }
					  if(name.equals("cityGet"))
	                  {  
						 // list=value;  
						  city=value.trim();            		 
							System.out.println("city is ++++++++"+city);
                        
					  }
					  if(name.equals("state"))
	                  {  
						 // list=value;  
						  state=value.trim();            		 
							System.out.println("state is ++++++++"+state);
                        
					  }
					  if(name.equals("zipCode"))
	                  {  
						 // list=value;  
						  zipCode=value;            		 
							System.out.println("zipCode is ++++++++"+zipCode);
                        
					  }
					  if(name.equals("phoneNo"))
	                  {  
						 // list=value;  
						  phoneNo=value;            		 
							System.out.println("phoneNo is ++++++++"+phoneNo);
                        
					  }
					  if(name.equals("photoId"))
	                  {  
						 // list=value;  
						  photoId=value;            		 
							System.out.println("photoId is ++++++++"+photoId);
                        
					  }
					  if(name.equals("photoNum"))
	                  {  
						 // list=value;  
						  photoNum=value;            		 
							System.out.println("photoNum is ++++++++"+photoNum);
                        
					  }
					  
					  
					  
					  if(name.equals("lang_1"))
	                  {  
						 // list=value;  
						  lang_1=value;            		 
							System.out.println("lang_1 is ++++++++"+lang_1);
                        
					  }
					  if(name.equals("lang_2"))
	                  {  
						 // list=value;  
						  lang_2=value;            		 
							System.out.println("phoneNo is ++++++++"+lang_2);
                        
					  }
					  if(name.equals("lang_3"))
	                  {  
						 // list=value;  
						  lang_3=value;            		 
							System.out.println("lang_3 is ++++++++"+lang_3);
                        
					  }
					  if(name.equals("lang_4"))
	                  {  
						 // list=value;  
						  lang_4=value;            		 
							System.out.println("lang_4 is ++++++++"+lang_4);
                        
					  }
					  
					  
					  if(name.equals("lang_5"))
	                  {  
						 // list=value;  
						  lang_5=value;            		 
							System.out.println("lang_5 is ++++++++"+lang_5);
                        
					  }
					  if(name.equals("lang_6"))
	                  {  
						 // list=value;  
						  lang_6=value;            		 
							System.out.println("lang_6 is ++++++++"+lang_6);
                        
					  }
					  if(name.equals("lang_7"))
	                  {  
						 // list=value;  
						  lang_7=value;            		 
							System.out.println("lang_7 is ++++++++"+lang_7);
                        
					  }
					  if(name.equals("lang_8"))
	                  {  
						 // list=value;  
						  lang_8=value;            		 
							System.out.println("lang_8 is ++++++++"+lang_8);
                        
					  }
					  
					  if(name.equals("lang_9"))
	                  {  
						 // list=value;  
						  lang_9=value;            		 
							System.out.println("lang_9 is ++++++++"+lang_9);
                        
					  }
					  if(name.equals("lang_10"))
	                  {  
						 // list=value;  
						  lang_10=value;            		 
							System.out.println("lang_10 is ++++++++"+lang_10);
                        
					  }
					  if(name.equals("lang_11"))
	                  {  
						 // list=value;  
						  lang_11=value;            		 
							System.out.println("lang_11 is ++++++++"+lang_11);
                        
					  }
					  if(name.equals("lang_12"))
	                  {  
						 // list=value;  
						  lang_12=value;            		 
							System.out.println("lang_12 is ++++++++"+lang_12);
                        
					  }
					  
					  
					  
					  
					  
					  if(name.equals("SchoolName"))
	                  {  
						 // list=value;  
						  SchoolName=value;            		 
							System.out.println("SchoolName is ++++++++"+SchoolName);
                        
					  }
					  if(name.equals("SchoolMedium"))
	                  {  
						 // list=value;  
						  SchoolMedium=value;            		 
							System.out.println("SchoolMedium is ++++++++"+SchoolMedium);
                        
					  }
					  if(name.equals("SchoolMMJoin"))
	                  {  
						 // list=value;  
						  SchoolMMJoin=value;            		 
							System.out.println("SchoolMMJoin is ++++++++"+SchoolMMJoin);
                        
					  }
					  if(name.equals("SchoolYearJoin"))
	                  {  
						 // list=value;  
						  SchoolYearJoin=value;            		 
							System.out.println("SchoolYearJoin is ++++++++"+SchoolYearJoin);
                        
					  }
					  
					  
					  if(name.equals("SchoolMMCoplete"))
	                  {  
						 // list=value;  
						  SchoolMMCoplete=value;            		 
							System.out.println("SchoolMMCoplete is ++++++++"+SchoolMMCoplete);
                        
					  }
					  if(name.equals("SchoolYearCoplete"))
	                  {  
						 // list=value;  
						  SchoolYearCoplete=value;            		 
							System.out.println("SchoolYearCoplete is ++++++++"+SchoolYearCoplete);
                        
					  }
					  if(name.equals("SchoolInstitution"))
	                  {  
						 // list=value;  
						  SchoolInstitution=value;            		 
							System.out.println("SchoolInstitution is ++++++++"+SchoolInstitution);
                        
					  }
					  if(name.equals("ugName"))
	                  {  
						 // list=value;  
						  ugName=value;            		 
							System.out.println("ugName is ++++++++"+ugName);
                        
					  }
					  if(name.equals("ugMedium"))
	                  {  
						 // list=value;  
						  ugMedium=value;            		 
							System.out.println("ugMedium is ++++++++"+ugMedium);
                        
					  }
					  if(name.equals("ugMMJoin"))
	                  {  
						 // list=value;  
						  ugMMJoin=value;            		 
							System.out.println("ugMMJoin is ++++++++"+ugMMJoin);
                        
					  }
					  if(name.equals("ugYearJoin"))
	                  {  
						 // list=value;  
						  ugYearJoin=value;            		 
							System.out.println("ugYearJoin is ++++++++"+ugYearJoin);
                        
					  }
					  if(name.equals("ugMMCoplete"))
	                  {  
						 // list=value;  
						  ugMMCoplete=value;            		 
							System.out.println("ugMMCoplete is ++++++++"+ugMMCoplete);
                        
					  }
					  if(name.equals("ugYearCoplete"))
	                  {  
						 // list=value;  
						  ugYearCoplete=value;            		 
							System.out.println("ugYearCoplete is ++++++++"+ugYearCoplete);
                        
					  }
					  if(name.equals("ugInstitution"))
	                  {  
						 // list=value;  
						  ugInstitution=value;            		 
							System.out.println("ugInstitution is ++++++++"+ugInstitution);
                        
					  }
 
					  if(name.equals("pgName"))
	                  {  
						 // list=value;  
						  pgName=value;            		 
							System.out.println("pgName is ++++++++"+pgName);
                        
					  }
					  if(name.equals("pgMedium"))
	                  {  
						 // list=value;  
						  pgMedium=value;            		 
							System.out.println("pgMedium is ++++++++"+pgMedium);
                        
					  }	
					 
					  if(name.equals("pgMMJoin"))
	                  {  
						 // list=value;  
						  pgMMJoin=value;            		 
							System.out.println("pgMMJoin is ++++++++"+pgMMJoin);
                        
					  }
					  if(name.equals("pgYearJoin"))
	                  {  
						 // list=value;  
						  pgYearJoin=value;            		 
							System.out.println("pgYearJoin is ++++++++"+pgYearJoin);
                        
					  }
					  if(name.equals("pgMMCoplete"))
	                  {  
						 // list=value;  
						  pgMMCoplete=value;            		 
							System.out.println("pgMMCoplete is ++++++++"+pgMMCoplete);
                        
					  }
					  if(name.equals("pgYearCoplete"))
	                  {  
						 // list=value;  
						  pgYearCoplete=value;            		 
							System.out.println("pgYearCoplete is ++++++++"+pgYearCoplete);
                        
					  }
					  if(name.equals("pgInstitution"))
	                  {  
						 // list=value;  
						  pgInstitution=value;            		 
							System.out.println("pgInstitution is ++++++++"+pgInstitution);
                        
					  }
					  if(name.equals("position"))
	                  {  
						 // list=value;  
						  position=value;            		 
							System.out.println("position is ++++++++"+position);
                        
					  }
					  if(name.equals("location"))
	                  {  
						 // list=value;  
						  location=value;            		 
							System.out.println("location is ++++++++"+location);
                        
					  }
					  if(name.equals("experience"))
	                  {  
						 // list=value;  
						  experience=value;            		 
							System.out.println("experience is ++++++++"+experience);
                        
					  }
					  if(name.equals("bpoexp"))
	                  {  
						 // list=value;  
						  bpoexp=value;            		 
							System.out.println("bpoexp is ++++++++"+bpoexp);
                        
					  }
					  if(name.equals("night_shift"))
	                  {  
						 // list=value;  
						  night_shift=value;            		 
							System.out.println("night_shift is ++++++++"+night_shift);
                        
					  }
					  if(name.equals("prefer_time"))
	                  {  
						 // list=value;  
						  prefer_time=value;            		 
							System.out.println("prefer_time is ++++++++"+prefer_time);
                        
					  }
					  if(name.equals("is_student"))
	                  {  
						 // list=value;  
						  is_student=value;            		 
							System.out.println("is_student is ++++++++"+is_student);
                        
					  }
					  if(name.equals("sub_option"))
	                  {  
						 // list=value;  
						  sub_option=value;            		 
							System.out.println("sub_option is ++++++++"+sub_option);
                        
					  }
					  if(name.equals("skill"))
	                  {  
						 // list=value;  
						  skill=value;            		 
							System.out.println("skill is ++++++++"+skill);
                        
					  }
					  if(name.equals("source_from"))
	                  {  
						 // list=value;  
						  source_from=value;            		 
							System.out.println("source_from is ++++++++"+source_from);
                        
					  }
					  
					  
					  if(name.equals("lang"))
	                  {  
						 // list=value;  
						  lang=value; 
						  listvalues.add(lang);
						  System.out.println("source_from is ++++++++"+lang);
                        
					  }  
					  
 /*    	                    */					  
				    
		   } else
			   {
		    try {
			
		    itemName = item.getName();
		    if(itemName !=""){
		   java.util.Date date = new java.util.Date();
		   itemName =  date.getTime()+itemName;
		   System.out.println("printing documentname======"+ itemName);
		   File savedFile = new File(absalutepath+"/"+itemName);
		   item.write(savedFile);
		    }
		   
		     
		   
		    
		   } catch (Exception e) {
		   e.printStackTrace();
		   }
		   }
		   }
		   }
		
		
		
		/*  My changes.................................................................   */
		System.out.println("User Registration");
		

		
		
		
		System.out.println("email addr"+emailAddr);
		String pwGen = PasswordGenerate.getPassword(8);
		System.out.println("password"+pwGen);
	
		
		Connection con= null;
		UserManager userManager = new UserManager();
		boolean checkDuplicate=false;
		boolean checkDuplicateCode=false;
		System.out.println("emailARR"+emailAddr);
		System.out.println("Re----emailARR"+reEnterEmailAddr);
		String methodName="register";
		System.out.println("Method NAme:"+methodName);
		if(methodName!=null)
		{
			if(methodName.trim().equalsIgnoreCase("email"))
			{
				System.out.println("Method NAme ==="+methodName);
				if(!(emailAddr.trim().equalsIgnoreCase(reEnterEmailAddr)))
				{
					req.setAttribute("LoginStatus","EmailNotMatching");
				}
				RequestDispatcher rd1=sctx.getRequestDispatcher("/jsp/Registration.jsp");
				rd1.forward(req,resp);
			}
			if(methodName.trim().equalsIgnoreCase("register"))
			{
				if((emailAddr!=null)&&(dob!=null)&&(photoId!=null))
				{
					System.out.println("Check for duplicate user");
					System.out.println("photoId...photoId......photoId........."+photoId);
					checkDuplicate = userManager.validateUser(emailAddr);
					if(!photoId.equals("NOT"))
					{
						System.out.println("......yes......yes......yes......yes......yes......yes.....");
						checkDuplicateCode = userManager.validateIdentificationCode(photoNum);
						if(checkDuplicateCode)
						{
							RequestDispatcher rd1=sctx.getRequestDispatcher("/jsp/Registration.jsp");
							req.setAttribute("LoginStatus","invalidcode");
							req.setAttribute("emailAddr",emailAddr);
							req.setAttribute("reEnterEmailAddr",reEnterEmailAddr);
							req.setAttribute("ansSecurityQsn",ansSecurityQsn);
							req.setAttribute("midleName",midleName); 
							req.setAttribute("lastName",lastName);
							
							req.setAttribute("addr1",addr1);
							req.setAttribute("addr2",addr2);
							req.setAttribute("city",city);
							req.setAttribute("dob",dob);
							
							req.setAttribute("zipCode",zipCode);
							req.setAttribute("phoneNo",phoneNo);
							
							req.setAttribute("photoNum",photoNum);
							
							req.setAttribute("SchoolName",SchoolName);
							    
							req.setAttribute("SchoolInstitution",SchoolInstitution);
							req.setAttribute("ugInstitution",ugInstitution);
							req.setAttribute("pgInstitution",pgInstitution);
							
							req.setAttribute("skill",skill);
							req.setAttribute("lang_9",lang_9);
							
							req.setAttribute("firstName",firstName);
							
							rd1.forward(req,resp);
							resp.sendRedirect("/jsp/Registration.jsp");
							
						}
						
					}
					
					if(checkDuplicate)
					{
						RequestDispatcher rd1=sctx.getRequestDispatcher("/jsp/Registration.jsp");
						req.setAttribute("LoginStatus","RegisteredNotSuccessfully");
						req.setAttribute("emailAddr",emailAddr);
						req.setAttribute("reEnterEmailAddr",reEnterEmailAddr);
						req.setAttribute("ansSecurityQsn",ansSecurityQsn);
						req.setAttribute("midleName",midleName); 
						req.setAttribute("lastName",lastName);
						
						req.setAttribute("addr1",addr1);
						req.setAttribute("addr2",addr2);
						req.setAttribute("city",city);
						req.setAttribute("dob",dob);
						
						req.setAttribute("zipCode",zipCode);
						req.setAttribute("phoneNo",phoneNo);
						
						req.setAttribute("photoNum",photoNum);
						
						req.setAttribute("SchoolName",SchoolName);
						    
						req.setAttribute("SchoolInstitution",SchoolInstitution);
						req.setAttribute("ugInstitution",ugInstitution);
						req.setAttribute("pgInstitution",pgInstitution);
						
						req.setAttribute("skill",skill);
						req.setAttribute("lang_9",lang_9);
						
						req.setAttribute("firstName",firstName);
						
						rd1.forward(req,resp);
						resp.sendRedirect("/jsp/Registration.jsp");
						
					}
					
				}
				
				
				//validation for first name last name and date of birth of date..
						
						if((firstName!=null)&&(lastName!=null)&&(dob!=null))
						{
							System.out.println("Check for duplicate first last name and DOB");
							checkDuplicateforfirstnamelastnameDOB = userManager.validateFirstNameLastNameDob(firstName,lastName,dob);
							if(checkDuplicateforfirstnamelastnameDOB)
							{
								RequestDispatcher rd1=sctx.getRequestDispatcher("/jsp/Registration.jsp");
								req.setAttribute("LoginStatus","RegisteredNotSuccessfully22");
								
								req.setAttribute("emailAddr",emailAddr);
								req.setAttribute("reEnterEmailAddr",reEnterEmailAddr);
								req.setAttribute("ansSecurityQsn",ansSecurityQsn);
								req.setAttribute("midleName",midleName); 
								req.setAttribute("lastName",lastName);
								
								req.setAttribute("addr1",addr1);
								req.setAttribute("addr2",addr2);
								req.setAttribute("city",city);
								req.setAttribute("dob",dob);
								
								req.setAttribute("zipCode",zipCode);
								req.setAttribute("phoneNo",phoneNo);
								
								req.setAttribute("photoNum",photoNum);
								
								req.setAttribute("SchoolName",SchoolName);
								    
								req.setAttribute("SchoolInstitution",SchoolInstitution);
								req.setAttribute("ugInstitution",ugInstitution);
								req.setAttribute("pgInstitution",pgInstitution);
								
								req.setAttribute("skill",skill);
								req.setAttribute("lang_9",lang_9);
								
								req.setAttribute("firstName",firstName);
								rd1.forward(req,resp);
								resp.sendRedirect("/jsp/Registration.jsp");
								
							}
						}
						
				
				
				try
				{
					//establish the connecion
					con = ConnectDatabase.getConnection();
					
					//insert into DB
					try
					{
						String regQry = "select USER_ID from bpo_user order by USER_ID DESC";
						System.out.println("query "+regQry);
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(regQry);
						if(rs.next())
						{
							System.out.println("user id"+rs.getInt("USER_ID"));
							userID = rs.getInt("USER_ID");
							userID++;
							System.out.println("user id"+userID);
						}
						else
						{
							userID=1;
						}
					}
					catch (Exception e) 
					{
						e.printStackTrace();
					}
					PreparedStatement pst = con.prepareStatement("INSERT INTO bpo_user VALUES(?,?,?,?,?,?,?,?)");
					pst.setLong(1,userID);
					pst.setString(2,emailAddr);
					pst.setString(3,pwGen);
					pst.setString(4,securityQsn);
					pst.setString(5,ansSecurityQsn);
					pst.setString(6,null);
					pst.setString(7,null);
					pst.setString(8,null);
					int i = pst.executeUpdate();
					System.out.println(i);
					if(i!=0)
					{
						try
						{
							String regBlock2Qry = "select USER_DETAIL_ID from bpo_user_details order by USER_DETAIL_ID DESC";
							Statement regBlock2QryStmt = con.createStatement();
							ResultSet regBlock2QryStmtRs = regBlock2QryStmt.executeQuery(regBlock2Qry);
							
							
							MailXml.CallXMLMailConfig();
							
							
							//String host = "smtp.wifinitytech.com";
							String host = Dbconfiguration.getSmtphost();
                            //String from = "WifinityAlert@wifinitytech.com";
							
							String from = Dbconfiguration.getEmailfrom();
                            String to = emailAddr;
                            String passwordss=Dbconfiguration.getEmailpassword();

                            // Get system properties
                            Properties props = System.getProperties();


                            // Setup mail server
                            props.put("mail.smtp.host", host);
                           // props.put("mail.smtp.port", "2525");
                            props.put("mail.smtp.port", Dbconfiguration.getSmtpport());

                            // Get session
                            Session session = Session.getDefaultInstance(props, null);

                            // Define message
                            MimeMessage message = new MimeMessage(session);

                            // Set the from address
                            message.setFrom(new InternetAddress(from));

                            // Set the to address
                            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                            // Set the subject
                          //  message.setSubject("[24]7 Online Exam Login Details");
                            message.setSubject(Dbconfiguration.getEmailsubject());

                            // Set the content
                            String Mailmessage="User ID:-"+" "+emailAddr+" "+"password:-"+" "+pwGen;                         
                            message.setText(Dbconfiguration.getEmailmessage()+ Mailmessage);

                            Transport tr = session.getTransport("smtp");
                            tr.connect(host,from, passwordss);
                            message.saveChanges();      // don't forget this
                            tr.sendMessage(message, message.getAllRecipients());
                            System.out.println("Message Sent");
                            tr.close();
							
							
							
							if(regBlock2QryStmtRs.next())
							{
								user_detail_id = regBlock2QryStmtRs.getInt("USER_DETAIL_ID")+1;
								
							//mail fuction started	
													
								
							}
							else
							{
								user_detail_id=1;
							}
						}
						catch (Exception e) 
						{
							e.printStackTrace();
						}
						
						String dobfinal=null;
						try
						{
							SimpleDateFormat dateFormat=new SimpleDateFormat("dd-mm-yyyy");
							SimpleDateFormat dateFormat2=new SimpleDateFormat("yyyy-mm-dd");
							
							Date date=dateFormat.parse(dob);
							dobfinal=dateFormat2.format(date);
							
							
						}
						catch (Exception e) 
						{
							
						}
						//PreparedStatement language_detail = con.prepareStatement("INSERT INTO user_language_details VALUES(?,?,?,?,?,?,?)");
						//language_detail.setLong(1,userID);
						//language_detail.setString(2,emailAddr);
						//language_detail.setString(3,pwGen);
						//language_detail.setString(4,securityQsn);
						//language_detail.setString(5,ansSecurityQsn);
						//int x = pst.executeUpdate();
						//System.out.println("value of list is ----"+list.length);
						
                        // System.out.println("value of list is ----"+list.length);
					  String[] list_n = {lang_1,lang_2,lang_3,lang_4,lang_5,lang_6,lang_7,lang_8,lang_9,lang_10,lang_11,lang_12};	
					  for(int t=0;t<list_n.length;t=t+4)
					  {
						PreparedStatement regBlock2Pstt1 = con.prepareStatement("INSERT INTO user_language_details (USER_ID, language_known, language_read, language_write, language_speak) VALUES(?,?,?,?,?)");
						regBlock2Pstt1.setLong(1,userID);
						regBlock2Pstt1.setString(2,list_n[t]);
						regBlock2Pstt1.setString(3,list_n[t+1]);  
						regBlock2Pstt1.setString(4,list_n[t+2]);
						regBlock2Pstt1.setString(5,list_n[t+3]);
						int t1 = regBlock2Pstt1.executeUpdate();
						System.out.println("value of t is ----"+t1);
					
					  }
						
					  
						 for(int j=0;j<listvalues.size();j=j+4)
						  {
							PreparedStatement regBlock2Pst1 = con.prepareStatement("INSERT INTO user_language_details (USER_ID, language_known, language_read, language_write, language_speak) VALUES(?,?,?,?,?)");
							regBlock2Pst1.setLong(1,userID);
							regBlock2Pst1.setString(2,listvalues.get(j));
							regBlock2Pst1.setString(3,listvalues.get(j+1));  
							regBlock2Pst1.setString(4,listvalues.get(j+2));
							regBlock2Pst1.setString(5,listvalues.get(j+3));
							int k1 = regBlock2Pst1.executeUpdate();
							System.out.println("value of k is ----"+k1);
						
						  }
						
						PreparedStatement regBlock2Pst1 = con.prepareStatement("INSERT INTO user_education_detail  VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
						regBlock2Pst1.setLong(1,userID);
						regBlock2Pst1.setString(2,SchoolName);
						regBlock2Pst1.setString(3,SchoolMedium);    
						regBlock2Pst1.setString(4,SchoolMMJoin+'-'+SchoolYearJoin);
						regBlock2Pst1.setString(5,SchoolMMCoplete+'-'+SchoolYearCoplete);
						regBlock2Pst1.setString(6,SchoolInstitution);
						regBlock2Pst1.setString(7,ugName);
						regBlock2Pst1.setString(8,ugMedium);
						regBlock2Pst1.setString(9,ugMMJoin+'-'+ugYearJoin);       
						regBlock2Pst1.setString(10,ugMMCoplete+'-'+ugYearCoplete);       
						regBlock2Pst1.setString(11,ugInstitution);
						regBlock2Pst1.setString(12,pgName );
						regBlock2Pst1.setString(13,pgMedium);
						regBlock2Pst1.setString(14,pgMMJoin+'-'+pgYearJoin);
					
						regBlock2Pst1.setString(15,pgMMCoplete+'-'+pgYearCoplete);                         
						regBlock2Pst1.setString(16,pgInstitution);
						
						//int a=Integer.parseInt(position);
						regBlock2Pst1.setString(17,position);
						regBlock2Pst1.setString(18,location);
						regBlock2Pst1.setString(19,experience);    
						regBlock2Pst1.setString(20,bpoexp);
						regBlock2Pst1.setString(21,night_shift);
						regBlock2Pst1.setString(22,prefer_time);
						regBlock2Pst1.setString(23,is_student);
						regBlock2Pst1.setString(24,skill);
						regBlock2Pst1.setString(25,source_from); 
						//int jobType=Integer.parseInt(sub_option);
						//regBlock2Pst1.setString(25,source_from); 
						regBlock2Pst1.setString(26,sub_option);
					  
						int k1 = regBlock2Pst1.executeUpdate();
						System.out.println("value of k is ----"+k1);
						
						
						
						PreparedStatement regBlock2Pst = con.prepareStatement("INSERT INTO bpo_user_details(USER_ID,SUFFIX,FIRST_NAME, MIDDLE_NAME, LAST_NAME,ADDRESS1, ADDRESS2,COUNTRY, CITY, STATE, POSTAL_CODE, CONTACT_NUMBER, PHOTO_ID_NO, DOB, RE_ENTER_EMAIL_ADDRESS, PHOTO_NUMBER,resume_path) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
						//regBlock2Pst.setLong(1,user_detail_id);
						regBlock2Pst.setLong(1,userID);
						regBlock2Pst.setString(2,suffix);
						regBlock2Pst.setString(3,firstName);
						regBlock2Pst.setString(4,midleName);
						regBlock2Pst.setString(5,lastName);
						regBlock2Pst.setString(6,addr1);
						regBlock2Pst.setString(7,addr2);
						regBlock2Pst.setString(8,country);
						regBlock2Pst.setString(9,city);
						regBlock2Pst.setString(10,state);
						regBlock2Pst.setString(11,zipCode );
						regBlock2Pst.setString(12,phoneNo);
						regBlock2Pst.setString(13,photoId);
					
						regBlock2Pst.setString(14,dobfinal);
						regBlock2Pst.setString(15,reEnterEmailAddr);
						regBlock2Pst.setString(16,photoNum);
						regBlock2Pst.setString(17,itemName);
						int k = regBlock2Pst.executeUpdate();
						System.out.println("value of k is ----"+k);
						if(k!=0)
						{ 
							SMSFunction.sendSMS(phoneNo,pwGen,emailAddr);
							RequestDispatcher rd=sctx.getRequestDispatcher("/jsp/Login_n.jsp");
							req.setAttribute("LoginStatus","RegisteredSuccessfully");
							req.setAttribute("password",pwGen);
							rd.forward(req,resp);
						}
					}
				}
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
			}
			}
		}
		
	
}