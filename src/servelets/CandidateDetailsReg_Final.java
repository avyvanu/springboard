package servelets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.ConnectDatabase;


public class CandidateDetailsReg_Final extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println(" ********* Inside the Candidtate Final Registration Details Page ******** ");
		HttpSession session = request.getSession();
		int USER_AUTOID = (Integer) session.getAttribute("USER_AUTOID");
		
		System.out.println("USER_AUTOID:::::"+USER_AUTOID);
		Connection con = null;
		String EDKey="";
		String EDKPass="";

		try
		{
			if((String)session.getAttribute("EDKey") != "AD")
			{
				 EDKey = (String)session.getAttribute("EDKey");
				 EDKPass = (String)session.getAttribute("EDKPass");
			}
			else
			{
				response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/Index.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(" GETTING KAY AND PASS EXCEPTION + "+e);
		}
		
		
		try 
		{			
			try
			{
				// ************ Start for Personal Details :*******************//	
				String title = request.getParameter("title");
				String F_HusbandName = request.getParameter("F_HusbandName");
				String M_HusbandName = request.getParameter("M_HusbandName");
				String L_HusbandName = request.getParameter("L_HusbandName");
				String gen = request.getParameter("gen");
				String Fathre_HusbandName = request.getParameter("Fathre_HusbandName");	
				//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String dateww = request.getParameter("dob");
				String birth_City = request.getParameter("birth_City");
				String Blood_Group = request.getParameter("Blood_Group");
				String Domicile_State = request.getParameter("Domicile_State");
				String Nationality = request.getParameter("Nationality");	
				String Email_Id = request.getParameter("emailID");
				String Marial_Status = request.getParameter("Marial_Status");	
				String wedding_Date = "";	
				String Cand_FName_Hname=null;
				String splitMethodWedding[] =null;
				String datewedding_Date = null;	
				if(gen.equals("F"))
				{
					if(Marial_Status.equals("Y"))
					{
						Cand_FName_Hname="H";
						try
						{
							wedding_Date = request.getParameter("wedding_Date");
							splitMethodWedding = wedding_Date.split("-");
							datewedding_Date = splitMethodWedding[2] + "-"+ splitMethodWedding[1] + "-" + splitMethodWedding[0];
							System.out.println("Inside Wedding Dates For Female -- "+datewedding_Date);
						}
						catch(ArrayIndexOutOfBoundsException ar)
						{
							System.out.println(ar.getMessage());
							ar.printStackTrace();
							System.out.println("U dont have provided data value ArrayIndexOutOfBoundsException wedding_Date");
						}
						catch(Exception e)
						{
							System.out.println("U dont have provided data value Exception wedding_Date");
						}
					}

				}
				else
				{
					if(Marial_Status.equals("Y"))
					{
						Cand_FName_Hname="F";
						try
						{
							wedding_Date = request.getParameter("wedding_Date");
							splitMethodWedding = wedding_Date.split("-");
							datewedding_Date = splitMethodWedding[2] + "-"+ splitMethodWedding[1] + "-" + splitMethodWedding[0];
							System.out.println("Inside Wedding Dates For Female -- "+datewedding_Date);
						}
						catch(ArrayIndexOutOfBoundsException ar)
						{
							System.out.println(ar.getMessage());
							ar.printStackTrace();
							System.out.println("U dont have provided data value ArrayIndexOutOfBoundsException wedding_Date");
						}
						catch(Exception e)
						{
							System.out.println("U dont have provided data value Exception wedding_Date");
						}
					}

				}
				System.out.println(" Female or Male guardian Name -- "+Cand_FName_Hname);
				System.out.println(" Female or Male Fathre_HusbandName -- "+Fathre_HusbandName);
				System.out.println("Out side Wedding Dates For Female -- "+datewedding_Date);			
				
				String Pan_no = request.getParameter("Pan_no");
				String MotherTongue = request.getParameter("MotherTongue");
				String CountryBirth = request.getParameter("CountryBirth");
				String Religion = request.getParameter("Religion");				
				con = ConnectDatabase.getConnection();
/*				pst = con.prepareStatement(""+ "insert into cand_personal_details_final(Cand_Passed_Auto_Id, Cand_Tital, Cand_F_Name, Cand_M_Name, Cand_L_Name, Cand_Gender, Cand_FName_HName, Cand_Father_Name, Cand_DOB, Cand_City_Birth, Cand_B_Group, Cand_Domicile_State, Cand_IsINDIAN, Cand_Email_ID, Cand_Marriege, Cand_Wedding_Date, Cand_pan_no, Cand_Mother_Toung, Cand_Country_Birth, Cand_Religin)"
								+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
*/				
				CallableStatement pst=con.prepareCall("call cand_personal_details_final_ENCRYPT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				System.out.println(" FOR THE cand_personal_details_final_ENCRYPT \t"+pst);
				pst.setInt(1, USER_AUTOID);
				pst.setString(2, title);
				pst.setString(3, F_HusbandName);
				pst.setString(4, M_HusbandName);
				pst.setString(5, L_HusbandName);
				pst.setString(6, gen);
				pst.setString(7, Cand_FName_Hname);
				pst.setString(8, Fathre_HusbandName);
				pst.setString(9, dateww);
				pst.setString(10, birth_City);
				
				if(!Blood_Group.equals(""))
				{ 
					pst.setInt(11, Integer.parseInt((Blood_Group)));
				}else
				{
					pst.setNull(11,java.sql.Types.INTEGER);
				}
				//pst.setInt(11, Blood_Group);
				
				if(!Domicile_State.equals(""))
				{ 
					pst.setInt(12, Integer.parseInt((Domicile_State)));
				}else
				{
					pst.setNull(12,java.sql.Types.INTEGER);
				}
				//pst.setInt(12, Domicile_State);
				
				if(!Nationality.equals("")){ 
					pst.setInt(13, Integer.parseInt((Nationality)));
				}else{
					pst.setNull(13,java.sql.Types.INTEGER);
				}
				//pst.setInt(13, Nationality);
				
				pst.setString(14, Email_Id);
				pst.setString(15, Marial_Status);
				pst.setString(16, datewedding_Date);
				pst.setString(17, Pan_no);
				
				if(!MotherTongue.equals("")){ 
					pst.setInt(18, Integer.parseInt((MotherTongue)));
				}else{
					pst.setNull(18,java.sql.Types.INTEGER);
				}
				//pst.setInt(18, MotherTongue);
				
				if(!CountryBirth.equals("")){ 
					pst.setInt(19, Integer.parseInt((CountryBirth)));
				}else{
					pst.setNull(19,java.sql.Types.INTEGER);
				}
				//pst.setInt(19, CountryBirth);
				
				if(!Religion.equals("")){ 
					pst.setInt(20, Integer.parseInt((Religion)));
				}else{
					pst.setNull(20,java.sql.Types.INTEGER);
				}
				//pst.setInt(20, Religion);
				
				pst.setString(21, EDKey);
				pst.setString(22, EDKPass);
				
				int chkPersonalDetails = pst.executeUpdate();
				if (chkPersonalDetails > 0) 
				{
					System.out.println("Inserted Sucessfully --- 1");
				}
			}
			catch(Exception ne)
			{
				System.out.println(" null number given by user  ====  1");				
				System.out.println(ne.getMessage());
				System.out.println(ne.getCause());
				ne.printStackTrace();
			}			
			// ************ Ending for Personal Details :*******************//
			
			// ************ Start for Current Address :*******************//			
			try
			{
				String address = request.getParameter("address");
				String city = request.getParameter("city").trim();
				System.out.println("cityAjax---" + city);
				String CityOtherList =request.getParameter("CityOtherList");
				String State = request.getParameter("State");
			//	int area = Integer.parseInt(request.getParameter("area"));
				
				//int zone = Integer.parseInt(request.getParameter("zoneID"));
				String landMark = null;
				String area="";
				String zone="";
				String Pin_Code = request.getParameter("Pin_Code");
				String transport_Required = request.getParameter("trans");	
				if(transport_Required.equalsIgnoreCase("Y"))
				{
					landMark = request.getParameter("landMark");
					String areadata=request.getParameter("area");
					System.out.println("areadata \t"+areadata);
					try
					{
						String areaSplit[]=areadata.split(",");
						area=areaSplit[0];
						zone=areaSplit[1];						
					}
					catch(ArrayIndexOutOfBoundsException arr)
					{
						arr.printStackTrace();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}					
				}
				String Phone = request.getParameter("Phone").trim();	
				String Mobile_extra = request.getParameter("Mobile_extra");
				String addressOrg = request.getParameter("addressOrg");
				String City_org = request.getParameter("City_org").trim();
				System.out.println("City_org===================="+City_org);
				String stateOrg = request.getParameter("State_Org");
				String  Pin_Code_Org = request.getParameter("Pin_Code_Org");
				
				String Phone_org = request.getParameter("Phone_org");
				String parmanentAdd=request.getParameter("parmanentAdd");
				if(parmanentAdd == null || parmanentAdd.equals(""))
				{
					parmanentAdd = "N";
				}
				// ************ End for Current Address : :*******************//
				
/*				pst = con
						.prepareStatement(""
								+ "insert into cand_address_details(Cand_Passed_Auto_Id, Cand_Current_address, Cand_Current_city,Cand_Current_city_Other, Cand_Current_State, Cand_Current_Area,Cand_Current_Zone, Cand_Current_LandMark, Cand_Current_Pin_Code, Cand_Trans_Requir, Cand_Current_Phone, Cand_Current_Mobile, Cand_Permanent_address, Cand_Permanent_city, Cand_Permanent_State, Cand_Permanent_Pin_Code, Cand_Permanent_Phone, Is_Both_Add_Same)"
								+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
*/				
				CallableStatement pst=con.prepareCall("call cand_address_details_ENCRYPT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				System.out.println(pst);
				
				pst.setInt(1, USER_AUTOID);
				pst.setString(2, address);
				pst.setString(3, city);
				pst.setString(4, CityOtherList);
				
				if(!State.equals("") && State != null )
				{
					pst.setInt(5, Integer.parseInt((State)));
				}
				else
				{
					pst.setNull(5,java.sql.Types.INTEGER);
				}
				
				if(!area.equals("") && area != null )
				{
					pst.setInt(6, Integer.parseInt((area)));
				}
				else
				{
					pst.setNull(6,java.sql.Types.INTEGER);
				}
				
				if(!zone.equals("") && zone != null )
				{
					pst.setInt(7, Integer.parseInt((zone)));
				}
				else
				{
					pst.setNull(7,java.sql.Types.INTEGER);
				}
				
				pst.setString(8, landMark);
				
				if(!Pin_Code.equals("") && Pin_Code != null )
				{
					pst.setInt(9, Integer.parseInt((Pin_Code)));
				}
				else
				{
					pst.setNull(9,java.sql.Types.INTEGER);
				}				
				pst.setString(10, transport_Required);
				pst.setString(11, Phone);
				pst.setString(12, Mobile_extra);
				pst.setString(13, addressOrg);
				pst.setString(14, City_org);
				
				if(!stateOrg.equals("") && stateOrg != null )
				{
					pst.setInt(15, Integer.parseInt((stateOrg)));
				}
				else
				{
					pst.setNull(15,java.sql.Types.INTEGER);
				}
				
				
				if(!Pin_Code_Org.equals("") && Pin_Code_Org != null)
				{
					pst.setInt(16, Integer.parseInt((Pin_Code_Org)));
				}
				else
				{
					pst.setNull(16,java.sql.Types.INTEGER);
				}
				
				
				pst.setString(17, Phone_org);	
				pst.setString(18, parmanentAdd);
				
				pst.setString(19,  EDKey);	
				pst.setString(20, EDKPass);
				
				int chkCurrentAddress = pst.executeUpdate();
				if (chkCurrentAddress > 0) 
				{
					System.out.println("inserted Sucessfully --- 2  ");				
				}
			}
			catch(Exception ne)
			{
				System.out.println(" null number given by user  ====  2");
				System.out.println(ne.getMessage());
				System.out.println(ne.getCause());
				ne.printStackTrace();
			}			
			// **********Start Emergency Contact Details*********//
			try
			{
				String ECDName[] = request.getParameterValues("ECDName");
				String ECDRelationship[] = request.getParameterValues("ECDRelationship");
				String ECDAddress[] = request.getParameterValues("ECDAddress");
				String ECDHomePhone1[] = request.getParameterValues("ECDHomePhone1");
				String ECDHomePhone2[] = request.getParameterValues("ECDHomePhone2");
				String ECDCity[] = request.getParameterValues("ECDCity");
				String ECDWorkPhone[] = request.getParameterValues("ECDWorkPhone");
				//int ECDCityNotList = Integer.parseInt(request.getParameter("ECDCityNotList"));
				String ECDMobile[] = request.getParameterValues("ECDMobile");
				String ECDState[] = request.getParameterValues("ECDState");
				String ECDEmail[] = request.getParameterValues("ECDEmail");
				String ECDPinCode[] = request.getParameterValues("ECDPinCode");
				String ECDCountry[] = request.getParameterValues("ECDCountry");	
				for(int i=0;i<ECDName.length;i++)
				{
					if((!ECDName[i].isEmpty() || !ECDName[i].equals("") ) && (!ECDRelationship[i].isEmpty() || !ECDRelationship[i].equals("")))
					{
/*						pst = con
								.prepareStatement(""
										+ "insert into cand_emergency_contact_details(Cand_Em_CandID, Cand_Em_Con_Name, Cand_Em_Con_Relationship, Cand_Em_Con_Address, Cand_Em_Con_Home_Phone_1, Cand_Em_Con_Home_Phone_2, Cand_Em_Con_Home_City, Cand_Em_Con_WorkPhone, Cand_Em_Con_Mobile, Cand_Em_Con_State, Cand_Em_Con_Email, Cand_Em_Con_PinCode, Cand_Em_Con_Country)"
										+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
*/						
						CallableStatement pst=con.prepareCall("call cand_emergency_contact_details_ENCRYPT(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
						pst.setInt(1, USER_AUTOID);
						pst.setString(2, ECDName[i]);
						
						if(!ECDRelationship[i].equals("")){ 
							pst.setInt(3, Integer.parseInt((ECDRelationship[i])));
						}else{
							pst.setNull(3,java.sql.Types.INTEGER);
						}
						//pst.setInt(3, Integer.parseInt(ECDRelationship[i]));
						
						pst.setString(4, ECDAddress[i]);
						pst.setString(5, ECDHomePhone1[i]);
						pst.setString(6, ECDHomePhone2[i]);
						
						if(!ECDCity[i].equals("")){ 
							pst.setInt(7, Integer.parseInt((ECDCity[i])));
						}else{
							pst.setNull(7,java.sql.Types.INTEGER);
						}
						//pst.setInt(7, Integer.parseInt(ECDCity[i]));
						
						pst.setString(8, ECDWorkPhone[i]);				
						pst.setString(9, ECDMobile[i]);
						
						if(!ECDState[i].equals("")){ 
							pst.setInt(10, Integer.parseInt((ECDState[i])));
						}else{
							pst.setNull(10,java.sql.Types.INTEGER);
						}
						//pst.setInt(10, Integer.parseInt(ECDState[i]));
						
						pst.setString(11, ECDEmail[i]);
						pst.setString(12, ECDPinCode[i]);
						
						if(!ECDCountry[i].equals("")){ 
							pst.setInt(13, Integer.parseInt((ECDCountry[i])));
						}else{
							pst.setNull(13,java.sql.Types.INTEGER);
						}
						//pst.setInt(13, Integer.parseInt(ECDCountry[i]));

						pst.setString(14,  EDKey);	
						pst.setString(15, EDKPass);

						
						int chkEmc = pst.executeUpdate();
						if (chkEmc > 0) 
						{
							System.out.println("inserted Sucessfully --- 3");
						}
					}
				}
			}
			catch(Exception ne)
			{
				System.out.println(" null number given by user  ====  3");
				System.out.println(ne.getMessage());
				System.out.println(ne.getCause());
				ne.printStackTrace();
			}

			// **********End Emergency Contact Details*********//
			
			// **********Start Experience details Details*********//
		String candExprience=request.getParameter("candExprience");
		if(candExprience.equalsIgnoreCase("Y"))
		{
			try
			{
					String company[] = request.getParameterValues("company");
					String fromDate[] = request.getParameterValues("from");
					String toDate[] = request.getParameterValues("to");
					
					String Initial_Desig[] = request.getParameterValues("Initial_Desig");
					String Final_Desig[] = request.getParameterValues("Final_Desig");
					String Reason_For_Leaving[] = request.getParameterValues("Reason_For_Leaving");
					String last_sal[] = request.getParameterValues("last_sal");
					
					
					for(int i=0;i<company.length;i++)
					{
						
						String BPO_Expas = request.getParameter("BPO_Exp"+(i+1));
						if(!company[i].isEmpty())
						{
							
							String from = "";
							String to = "";
							try
							{
								String fromArr[] = fromDate[i].split("-");
								from = fromArr[2]+"-"+fromArr[1]+"-"+fromArr[0];
								String toArr[] = toDate[i].split("-");
								to = toArr[2]+"-"+toArr[1]+"-"+toArr[0];
							}
							catch(Exception e)
							{
								e.printStackTrace();
							}	
							
							CallableStatement pst=con.prepareCall("call cand_work_exp_details_ENCRYPT(?,?,?,?,?,?,?,?,?,?,?)");
							pst.setInt(1, USER_AUTOID);
							pst.setString(2, company[i]);
							pst.setString(3, from);
							pst.setString(4, to);
							pst.setString(5, Initial_Desig[i]);
							pst.setString(6, Final_Desig[i]);
							pst.setString(7, Reason_For_Leaving[i]);
							 
							if(!last_sal.equals("")){ 
									pst.setDouble(8, Double.parseDouble((last_sal[i])));
							}else{
									pst.setNull(8,java.sql.Types.DOUBLE);
							}
							pst.setString(9, BPO_Expas);
							 
							pst.setString(10,  EDKey);	
							pst.setString(11, EDKPass);
							 
							int chkWorkExpriece = pst.executeUpdate();
							if (chkWorkExpriece > 0) 
							{
								System.out.println("inserted Sucessfully --- 4 ");
							}
						}
					}

				
			}
			catch(Exception ne)
			{
				System.out.println(" null number given by user  ====  4");
				System.out.println(ne.getMessage());
				System.out.println(ne.getCause());
				ne.printStackTrace();
			}
		}
			// **********End Experience details Details*********//
			
			// ******************* Start From Recommended for BPO JOBS ************************   //		
			try
			{
				int z = 1;
				if (z == 1)
				{
					for (int j = 1; j < 5; j++)
					{	
						String name = request.getParameter("name" + j);
						if (name != null && !name.equals(""))
						{
							String phone_No = request.getParameter("phone_No"+ j);
							String Email_Id_BPO = request.getParameter("Email_Id" + j);
							String BPO_exp = request.getParameter("RFJ_exp" + j);
							PreparedStatement pst = con.prepareStatement(""+ "insert into cand_friend_bpo_job_details(Cand_Passed_Auto_Id, Cand_BPO_JOB_name, Cand_BPO_JOB_phone_No, Cand_BPO_JOB_Email_Id, Cand_BPO_JOB_BPO_exp)"+ "values(?,?,?,?,?)");
							pst.setInt(1, USER_AUTOID);
							pst.setString(2, name);
							pst.setString(3, phone_No);
							pst.setString(4, Email_Id_BPO);
							pst.setString(5, BPO_exp);
	
							int chkBPOjob = pst.executeUpdate();
							if (chkBPOjob > 0) 
							{
								System.out.println("inserted sucessfully BPO --- 5");
							}
						}
					}
				}
				
			}
			catch(Exception ne)
			{
				System.out.println(" null number given by user  ====  5");
				System.out.println(ne.getMessage());
				System.out.println(ne.getCause());
				ne.printStackTrace();
				
			}
			// ****************** ends from BPO Jobs
			
     		// **************** Start Family background Details ***************//
			try
			{
				int zx = 1;
				if (zx == 1)
				{
					// ******************* Start From Family Background
					String FBdobwq[] =null;
					String frm[]=null;
					String FBdob=null;
					String family_Name[] = request.getParameterValues("FBMemberName");				
					String RelarionShip[] =request.getParameterValues("FBRelationship");					
					FBdobwq = request.getParameterValues("FBdob");
					
					String FBAgeget[] =request.getParameterValues("FBAge");
					System.out.println("FBAgeget:::::::"+FBAgeget);
					String family_Occupation[] = request.getParameterValues("FBOccupation");
					String family_Income[] = request.getParameterValues("FBOIncome");
					
					System.out.println(family_Name.length);
					for(int i=0;i<family_Name.length;i++)
					{
						System.out.println(FBAgeget[i]);
						System.out.println(family_Occupation[i]);
						System.out.println(family_Occupation[i]);
						try
						{							
							if(!FBdobwq[i].isEmpty())
							{
								try
								{
									frm=FBdobwq[i].split("-");
									FBdob=frm[2]+"-"+frm[1]+"-"+frm[0];
								}
								catch(ArrayIndexOutOfBoundsException arri)
								{
									arri.printStackTrace();
									System.out.println("you didnt provided the date value  == "+i);
									FBdob="null";
								}								
							}
							else
							{
								FBdob = "null";
							}
						}
						catch(Exception e)
						{
							System.out.println(e);
							e.printStackTrace();
						}
						try
						{							
						
						if(!family_Name[i].isEmpty() && !RelarionShip[i].isEmpty())
						{
							CallableStatement pst=con.prepareCall("call cand_family_background_details_ENCRYPT(?,?,?,?,?,?,?,?,?)");
							pst.setInt(1, USER_AUTOID);
							pst.setString(2, family_Name[i]);
							
							if(!RelarionShip[i].equals("") && RelarionShip[i]!= null){ 
								pst.setInt(3, Integer.parseInt((RelarionShip[i])));
							}else{
								pst.setNull(3,java.sql.Types.INTEGER);
							}							
							//pst.setInt(3, Integer.parseInt(RelarionShip[i]));
							
							if(FBdob.equals("null"))
							{
								pst.setNull(4,java.sql.Types.DATE);
							}
							else
							{
								pst.setString(4, FBdob);
							}
							
							if(!FBAgeget[i].equals("") && FBAgeget[i] != null){ 
								pst.setInt(5, Integer.parseInt((FBAgeget[i])));
							}else{
								pst.setNull(5,java.sql.Types.INTEGER);
							}
							//pst.setInt(5, Integer.parseInt(FBAgeget[i]));
							pst.setString(6, family_Occupation[i]);
							pst.setString(7,family_Income[i]);
							pst.setString(8,  EDKey);	
							pst.setString(9, EDKPass);

							
							int chkfamily = pst.executeUpdate();
							if (chkfamily > 0)
							{
								System.out.println("inserted sucessfully chk family background --- 6");
							}
						}
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
						System.out.println(" chking the faimly Details Data");
					}
				}
			}
			catch (ArrayIndexOutOfBoundsException e) 
			{
				e.printStackTrace();
				System.out.println("Array format exception ");
			}
			catch(Exception ne)
			{
				System.out.println(" null number given by user  ====  6");
				System.out.println(ne.getMessage());
				System.out.println(ne.getCause());
				ne.printStackTrace();
			}
			// **************** End Family background Details ***************//	
			
			// ******************* Start Language Skills ******************* //
			
				int zxy = 1;
				if (zxy == 1)
				{
					for (int L = 1; L < 5; L++)
					{
						String Language = request.getParameter("Language" + L);
						if(Language == null)
						{
							Language = "null";
						}
						System.out.println(Language);
						String ReadChk = request.getParameter("ReadChk" + L);
						String WriteChk = request.getParameter("WriteChk"+ L);
						String SpeakChk = request.getParameter("SpeakChk"+ L);
						String ProficiencyRWS = "";	
						if(ReadChk==null)
							ReadChk="";
						if(WriteChk==null)
							WriteChk="";
						if(SpeakChk==null)
							SpeakChk="";
							
						if (!Language.equalsIgnoreCase("") || Language.length() !=0 ) 
						{
							try
							{
								ProficiencyRWS = ReadChk + "-" + WriteChk+ "-" + SpeakChk;
								PreparedStatement pst = con
										.prepareStatement(""
												+ "insert into cand_language_skills_details(Cand_Passed_Auto_Id, Cand_Language_Skills_Language, Cand_Language_Skills_ReadWriteSpeak)"
												+ "values(?,?,?)");
								pst.setInt(1, USER_AUTOID);
								pst.setString(2, Language);
								pst.setString(3, ProficiencyRWS);
								int chkLangaugeSkill = pst.executeUpdate();
								if (chkLangaugeSkill > 0) 
								{
									System.out
											.println("inserted sucessfully family --- 7");
								}
							}
							catch(Exception ne)
							{
								System.out.println(" null number given by user  ====  7");
								System.out.println(ne.getMessage());
								System.out.println(ne.getCause());
								ne.printStackTrace();				
							}
						}
					}
				}
			
			// ******************* End Language Skills ******************* //
					
					
			// ******************* Start Education Details ******************* //
				int zssx = 1;
				if (zssx == 1)
				{
					// ******************* Start From Education SSC ******************* //
					try
					{
						String SSCQualification = request.getParameter("SSCQualification");
						String EQmediumOfEduSSC = request.getParameter("EQmediumOfEduSSC");
						String EQInstituteSSC = request.getParameter("EQInstituteSSC");
						String EQyearOfJoinSSC = request.getParameter("EQyearOfJoinSSC");
						String monthNameSSC = request.getParameter("monthNameSSC");
						String EQMyearOfJoinMSSC = request.getParameter("EQMyearOfJoinMSSC");
						String EQCitySSC = request.getParameter("EQCitySSC");
						String EQStateSSC = request.getParameter("EQStateSSC");
						String EQBoardSSC = request.getParameter("EQBoardSSC");
						String GradeEQSSC = request.getParameter("GradeEQSSC");
						String ScoreEQSSC = request.getParameter("ScoreEQSSC");
						
						String CourseEQSSC = request.getParameter("CourseEQSSC");		
/*						PreparedStatement pst = con
								.prepareStatement(""
										+ "insert into cand_education_qualification_details(Candidate_Id_Auto_Id, Edu_Institue_Name, Edu_Medium, Edu_Qualification_Course, Edu_Year_Of_Joining, Edu_Month_Of_Completion, Edu_Year_Of_Completion, Edu_City, Edu_State, Edu_Board_University, Edu_Gread, Edu_Score, Edu_Course_Appraisal)"
										+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
*/
						CallableStatement pst=con.prepareCall("call cand_education_qualification_details_ENCRYPT_ssc(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
						pst.setInt(1, USER_AUTOID);
						pst.setString(2, EQInstituteSSC);
						
						if(!EQmediumOfEduSSC.equals("") && EQmediumOfEduSSC != null){ 
							pst.setInt(3, Integer.parseInt((EQmediumOfEduSSC)));
						}else{
							pst.setNull(3,java.sql.Types.INTEGER);
						}
						//pst.setInt(3, EQmediumOfEduSSC);
						
						if(!SSCQualification.equals("") && SSCQualification!= null){ 
							pst.setInt(4, Integer.parseInt((SSCQualification)));
						}else{
							pst.setNull(4,java.sql.Types.INTEGER);
						}
						//pst.setInt(4, SSCQualification);
						
						
						if(!EQyearOfJoinSSC.equals("") && EQyearOfJoinSSC != null){ 
							pst.setInt(5, Integer.parseInt((EQyearOfJoinSSC)));
						}else{
							pst.setNull(5,java.sql.Types.INTEGER);
						}
						//pst.setInt(5, EQyearOfJoinSSC);
						
						if(!monthNameSSC.equals("") && monthNameSSC != null){ 
							pst.setInt(6, Integer.parseInt((monthNameSSC)));
						}else{
							pst.setNull(6,java.sql.Types.INTEGER);
						}
						//pst.setInt(6, monthNameSSC);
						
						if(!EQMyearOfJoinMSSC.equals("") && EQMyearOfJoinMSSC!= null){ 
							pst.setInt(7, Integer.parseInt((EQMyearOfJoinMSSC)));
						}else{
							pst.setNull(7,java.sql.Types.INTEGER);
						}
						//pst.setInt(7, EQMyearOfJoinMSSC);
						
						pst.setString(8, EQCitySSC);
						
						if(!EQStateSSC.equals("") && EQStateSSC != null){ 
							pst.setInt(9, Integer.parseInt((EQStateSSC)));
						}else{
							pst.setNull(9,java.sql.Types.INTEGER);
						}
						//pst.setInt(9, EQStateSSC);
						
						pst.setString(10, EQBoardSSC);
						pst.setString(11, GradeEQSSC);
						
						if(!ScoreEQSSC.equals("") && ScoreEQSSC != null){ 
							pst.setDouble(12, Double.parseDouble(ScoreEQSSC));
						}else{
							pst.setNull(12,java.sql.Types.DOUBLE);
						}
						//pst.setDouble(12, Double.parseDouble(ScoreEQSSC));
						
						pst.setString(13, CourseEQSSC);
						pst.setString(14,  EDKey);	
						pst.setString(15, EDKPass);

						
						int chkfamily = pst.executeUpdate();
						if (chkfamily > 0)
						{
							System.out
									.println("inserted sucessfully chk family background --- 8");
						}
					}
					catch(Exception ne)
					{
						System.out.println(" null number given by user  ====  8");
						System.out.println(ne.getMessage());
						System.out.println(ne.getCause());
						ne.printStackTrace();				
					}
					// ******************* End From Education SSC ******************* //
				}
			int zszsda = 1;
			if (zszsda == 1)
			{
				// ******************* Start From Education HSC******************* //
				try
				{
					String HSCQualification = request.getParameter("HSCQualification");				
					String EQmediumOfEduHSC = request.getParameter("EQmediumOfEduHSC");				
					String EQInstituteHSC = request.getParameter("EQInstituteHSC");
					String EQyearOfJoinHSC = request.getParameter("EQyearOfJoinHSC");
					String monthNameHSC = request.getParameter("monthNameHSC");
					String EQyearOfJoinMHSC = request.getParameter("EQyearOfJoinMHSC");
					String EQCityHSC = request.getParameter("EQCityHSC");
					String EQStateHSC = request.getParameter("EQStateHSC");
					String EQBoardHSC = request.getParameter("EQBoardHSC");
					String GradeEQHSC = request.getParameter("GradeEQHSC");
					String ScoreEQHSC = request.getParameter("ScoreEQHSC");
					String CourseEQHSC = request.getParameter("CourseEQHSC");
					String SpecializationHSC = request.getParameter("SpecializationHSC");
					
/*					PreparedStatement pst = con
							.prepareStatement(""
									+ "insert into cand_education_qualification_details(Candidate_Id_Auto_Id, Edu_Institue_Name, Edu_Medium,Edu_Qualification_Course, Edu_Year_Of_Joining, Edu_Month_Of_Completion, Edu_Year_Of_Completion, Edu_City, Edu_State, Edu_Board_University, Edu_Gread, Edu_Score, Edu_Course_Appraisal, Edu_Specialization_1)"
									+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
*/
					
					CallableStatement pst=con.prepareCall("call cand_education_qualification_details_ENCRYPT_hsc(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					pst.setInt(1, USER_AUTOID);
					pst.setString(2, EQInstituteHSC);
					
					if(!EQmediumOfEduHSC.equals("") && EQmediumOfEduHSC != null){ 
						pst.setInt(3, Integer.parseInt(EQmediumOfEduHSC));
					}else{
						pst.setNull(3,java.sql.Types.INTEGER);
					}
					//pst.setInt(3, EQmediumOfEduHSC);
					
					if(!HSCQualification.equals("") && HSCQualification != null){ 
						pst.setInt(4, Integer.parseInt(HSCQualification));
					}else{
						pst.setNull(4,java.sql.Types.INTEGER);
					}
					//pst.setInt(4, HSCQualification);
					
					if(!EQyearOfJoinHSC.equals("") && EQyearOfJoinHSC != null){ 
						pst.setInt(5, Integer.parseInt(EQyearOfJoinHSC));
					}else{
						pst.setNull(5,java.sql.Types.INTEGER);
					}
					//pst.setInt(5, EQyearOfJoinHSC);
					
					if(!monthNameHSC.equals("") && monthNameHSC != null){ 
						pst.setInt(6, Integer.parseInt(monthNameHSC));
					}else{
						pst.setNull(6,java.sql.Types.INTEGER);
					}
					//pst.setInt(6, monthNameHSC);
					
					if(!EQyearOfJoinMHSC.equals("") && EQyearOfJoinMHSC != null){ 
						pst.setInt(7, Integer.parseInt(EQyearOfJoinMHSC));
					}else{
						pst.setNull(7,java.sql.Types.INTEGER);
					}
					//pst.setInt(7, EQyearOfJoinMHSC);
					pst.setString(8, EQCityHSC);
					
					if(!EQStateHSC.equals("") && EQStateHSC != null){ 
						pst.setInt(9, Integer.parseInt(EQStateHSC));
					}else{
						pst.setNull(9,java.sql.Types.INTEGER);
					}
					//pst.setInt(9, EQStateHSC);
					
					pst.setString(10, EQBoardHSC);
					pst.setString(11, GradeEQHSC);
					
					if(!ScoreEQHSC.equals("") && ScoreEQHSC != null){ 
						pst.setDouble(12, Double.parseDouble(ScoreEQHSC));
					}else{
						pst.setNull(12,java.sql.Types.DOUBLE);
					}
					//pst.setDouble(12, Double.parseDouble(ScoreEQHSC));
					pst.setString(13, CourseEQHSC);
					
					if(!SpecializationHSC.equals("") && SpecializationHSC != null){ 
						pst.setInt(14, Integer.parseInt(SpecializationHSC));
					}else{
						pst.setNull(14,java.sql.Types.INTEGER);
					}
					//pst.setInt(14, SpecializationHSC);
					
					pst.setString(15,  EDKey);	
					pst.setString(16, EDKPass);
					
					int chkfamily = pst.executeUpdate();
					if (chkfamily > 0)
					{
						System.out
								.println("inserted sucessfully chk family background ------ 9");
					}
				}
				catch(Exception ne)
				{
					System.out.println(" null number given by user  ====  5");
					System.out.println(ne.getMessage());
					System.out.println(ne.getCause());
					ne.printStackTrace();					
				}
				// ****************** ends From Education Details HSC *******************//
			}			
			int EducationDetails = 1;
			if (EducationDetails == 1) 
			{
				// ******************* Start From Education Details Higher ******************* //
				try
				{					
					String QualificationEQHigher[] =request.getParameterValues("QualificationEQHigher");  // its int
					String EQmediumOfEduHiger[] = request.getParameterValues("EQmediumOfEduHiger");  // its int
					String EQInstituteHiger[] = request.getParameterValues("EQInstituteHiger");
					String EQyearOfJoinHiger[] = request.getParameterValues("EQyearOfJoinHiger");  // its int
					String monthNameHiger[] = request.getParameterValues("monthNameHiger");  // its int
					String EQyearOfJoinMHiger[] = request.getParameterValues("EQyearOfJoinMHiger");  // its int
					String EQCityHiger[] = request.getParameterValues("EQCityHiger");
					String EQStateHiger[] = request.getParameterValues("EQStateHiger");   // its int
					String EQBoardHiger[] = request.getParameterValues("EQBoardHiger");
					String GradeEQHiger[] = request.getParameterValues("GradeEQHiger");
					String ScoreEQHiger[] = request.getParameterValues("ScoreEQHiger");

					String CourseEQHiger[] = request.getParameterValues("CourseEQHiger");
					String SpecializationHiger1[] = request.getParameterValues("SpecializationHiger1");   // its int
					String SpecializationHiger2[] = request.getParameterValues("SpecializationHiger2");    // its int
					String EQCourse_CategoryHiger[] = request.getParameterValues("EQCourse_CategoryHiger");   // its int
					String CourseType[] = request.getParameterValues("CourseType");    // its int
					String EQDCYear[]=request.getParameterValues("EQDCYear");
					String EQDCMonth[]=request.getParameterValues("EQDCMonth");
					for(int i=0; i<EQInstituteHiger.length; i++)
					{
						
						if((!EQInstituteHiger[i].isEmpty() || !EQInstituteHiger[i].equals("")) && (!QualificationEQHigher[i].isEmpty() || !QualificationEQHigher[i].equals("")) && (!SpecializationHiger1[i].isEmpty() || !SpecializationHiger1.equals("")))
						{							
/*							PreparedStatement pst = con.prepareStatement(""
											+ "insert into cand_education_qualification_details(Candidate_Id_Auto_Id, Edu_Institue_Name, Edu_Medium,Edu_Qualification_Course, Edu_Year_Of_Joining, Edu_Month_Of_Completion, Edu_Year_Of_Completion, Edu_City, Edu_State, Edu_Board_University, Edu_Gread, Edu_Score, Edu_Course_Appraisal, Edu_Specialization_1,Edu_Specialization_2,Edu_Course_Category, Edu_Course_Type, Edu_Course_Duration_Years, Edu_Course_Duration_Months)"
											+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			//  cand_education_qualification_details_ENCRYPT_higher
							
*/							
							CallableStatement pst=con.prepareCall("call cand_education_qualification_details_ENCRYPT_higher(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
							System.out.println("FOR THE HIGHER QULAFICATION DETAILS \t "+pst);
							pst.setInt(1, USER_AUTOID);
							pst.setString(2, EQInstituteHiger[i]);
							
							if(!EQmediumOfEduHiger[i].equals("") && EQmediumOfEduHiger[i]!= null){ 
								pst.setInt(3, Integer.parseInt(EQmediumOfEduHiger[i]));
							}else{
								pst.setNull(3,java.sql.Types.INTEGER);
							}
							//pst.setInt(3, Integer.parseInt(EQmediumOfEduHiger[i]));
							
							if(!QualificationEQHigher[i].equals("") && QualificationEQHigher[i] != null){ 
								pst.setInt(4, Integer.parseInt(QualificationEQHigher[i]));
							}else{
								pst.setNull(4,java.sql.Types.INTEGER);
							}
							//pst.setInt(4, Integer.parseInt(QualificationEQHigher[i]));
							
							if(!EQyearOfJoinHiger[i].equals("") && EQyearOfJoinHiger[i] != null){ 
								pst.setInt(5, Integer.parseInt(EQyearOfJoinHiger[i]));
							}else{
								pst.setNull(5,java.sql.Types.INTEGER);
							}							
							//pst.setInt(5, Integer.parseInt(EQyearOfJoinHiger[i]));
							
							if(!monthNameHiger[i].equals("") && monthNameHiger[i] != null){ 
								pst.setInt(6, Integer.parseInt(monthNameHiger[i]));
							}else{
								pst.setNull(6,java.sql.Types.INTEGER);
							}
							//pst.setInt(6, Integer.parseInt(monthNameHiger[i]));
							
							if(!EQyearOfJoinMHiger[i].equals("") && EQyearOfJoinMHiger[i] != null){ 
								pst.setInt(7, Integer.parseInt(EQyearOfJoinMHiger[i]));
							}else{
								pst.setNull(7,java.sql.Types.INTEGER);
							}
							//pst.setInt(7, Integer.parseInt(EQyearOfJoinMHiger[i]));
							pst.setString(8, EQCityHiger[i]);
							
							if(!EQStateHiger[i].equals("") && EQStateHiger[i] != null){ 
								pst.setInt(9, Integer.parseInt(EQStateHiger[i]));
							}else{
								pst.setNull(9,java.sql.Types.INTEGER);
							}
							//pst.setInt(9, Integer.parseInt(EQStateHiger[i]));
							
							pst.setString(10, EQBoardHiger[i]);
							pst.setString(11, GradeEQHiger[i]);
							
							if(!ScoreEQHiger[i].equals("") && ScoreEQHiger[i] != null){ 
								pst.setDouble(12, Double.parseDouble(ScoreEQHiger[i]));
							}else{
								pst.setNull(12,java.sql.Types.DOUBLE);
							}
							//pst.setDouble(12, Double.parseDouble(ScoreEQHiger[i]));
							
							pst.setString(13, CourseEQHiger[i]);
							
							
							if(!SpecializationHiger1[i].equals("") && SpecializationHiger1[i] != null){ 
								pst.setInt(14, Integer.parseInt(SpecializationHiger1[i]));
							}else{
								pst.setNull(14,java.sql.Types.INTEGER);
							}
							//pst.setInt(14, Integer.parseInt(SpecializationHiger1[i]));
							
							if(!SpecializationHiger2[i].equals("") && SpecializationHiger2[i] != null){ 
								pst.setInt(15, Integer.parseInt(SpecializationHiger2[i]));
							}else{
								pst.setNull(15,java.sql.Types.INTEGER);
							}
							//pst.setInt(15, Integer.parseInt(SpecializationHiger2[i]));
							
							if(!EQCourse_CategoryHiger[i].equals("") && EQCourse_CategoryHiger[i] != null){ 
								pst.setInt(16, Integer.parseInt(EQCourse_CategoryHiger[i]));
							}else{
								pst.setNull(16,java.sql.Types.INTEGER);
							}
							//pst.setInt(16, Integer.parseInt(EQCourse_CategoryHiger[i]));
							
							if(!CourseType[i].equals("") && CourseType[i] != null){ 
								pst.setInt(17, Integer.parseInt(CourseType[i]));
							}else{
								pst.setNull(17,java.sql.Types.INTEGER);
							}
							//pst.setInt(17, Integer.parseInt(CourseType[i]));
							
							if(!EQDCYear[i].equals("") && EQDCYear[i]!= null){ 
								pst.setInt(18, Integer.parseInt(EQDCYear[i]));
							}else{
								pst.setNull(18,java.sql.Types.INTEGER);
							}
							//pst.setInt(18, Integer.parseInt(EQDCYear[i]));
							
							if(!EQDCMonth[i].equals("") && EQDCMonth[i] != null){ 
								pst.setInt(19, Integer.parseInt(EQDCMonth[i]));
							}else{
								pst.setNull(19,java.sql.Types.INTEGER);
							}
							//pst.setInt(19, Integer.parseInt(EQDCMonth[i]));
							
							pst.setString(20,  EDKey);	
							pst.setString(21, EDKPass);
							
							int chkfamily = pst.executeUpdate();
							if (chkfamily > 0) 
							{
								System.out
										.println("inserted sucessfully Higher Qualification background --- 10");
							}
						}
					}
				}
				catch(Exception ne)
				{
					System.out.println(" null number given by user  ====  10");
					System.out.println(ne.getMessage());
					System.out.println(ne.getCause());
					ne.printStackTrace();					
				}
				// ****************** ends From Education Details Higher *******************//
			}
			
			// ******************* Start Reference ******************* //
		
			int zxycb = 1;
			if (zxycb == 1)
			{
				try
				{
					String refName1 = request.getParameter("refName1");
					String Address1 = request.getParameter("Address1");
					String Phone1 = request.getParameter("Phone1");
					String refName2 = request.getParameter("refName2");
					String Address2 = request.getParameter("Address2");
					String Phone2 = request.getParameter("Phone2");	
/*					PreparedStatement pst = con
							.prepareStatement(""
									+ "insert into cand_references_details(Cand_Passed_Auto_Id, Cand_refName, Cand_Address, Cand_Phone, Cand_refName_Org, Cand_Address_Org, Cand_Phone_Org)"
									+ "values(?,?,?,?,?,?,?)");
									cand_references_details_ENCRYPT
*/
				
					if ( (refName1.equals("") || refName1 ==null) && (Address1.equals("") || Address1 ==null) && (Phone1.equals("") || Phone1 ==null) || (refName2.equals("") || refName2 ==null) && (Address2.equals("") || Address2 ==null) && (Phone2.equals("") || Phone2 ==null)) 
					{
						System.out.println("  --- CANDIDATE REFERANCE DATA WAS BLANK --- ");
					}
					else
					{
						CallableStatement pst=con.prepareCall("call cand_references_details_ENCRYPT(?,?,?,?,?,?,?,?,?)");
						pst.setInt(1, USER_AUTOID);
						pst.setString(2, refName1);
						pst.setString(3, Address1);
						pst.setString(4, Phone1);
						pst.setString(5, refName2);
						pst.setString(6, Address2);
						pst.setString(7, Phone2);
						
						pst.setString(8,  EDKey);	
						pst.setString(9, EDKPass);
						
						int chkeReference = pst.executeUpdate();
						if (chkeReference > 0) 
						{
							System.out
									.println("inserted sucessfully chkeducatio_qualificationss --- 11");
						}
					}
				}
				catch(Exception ne)
				{
					System.out.println(" null number given by user  ====  11");
					System.out.println(ne.getMessage());
					System.out.println(ne.getCause());
					ne.printStackTrace();					
				}
			}
			// ******************* End Reference ******************* //
			//Cand_Dec_Auto_Id, Cand_Dec_CandID, Cand_Dec_1, Cand_Dec_2, Cand_Dec_3, Cand_Dec_4
			int zxDeclare = 1;
			if (zxDeclare == 1)
			{
				try
				{
					String Dec_1 = request.getParameter("Dec_1");
					if(Dec_1==null)
					{
						Dec_1="N";
					}
					String Dec_2 = request.getParameter("Dec_2");
					if(Dec_2==null)
					{
						Dec_2="N";
					}
					String Dec_3 = request.getParameter("Dec_3");
					if(Dec_3==null)
					{
						Dec_3="N";
					}
					String Dec_4 = request.getParameter("Dec_4");
					if(Dec_4==null)
					{
						Dec_4="N";
					}	
					PreparedStatement pst = con.prepareStatement(""+ "insert into cand_declare_details(Cand_Dec_CandID, Cand_Dec_1, Cand_Dec_2, Cand_Dec_3, Cand_Dec_4)" + "values(?,?,?,?,?)");
					pst.setInt(1, USER_AUTOID);
					pst.setString(2, Dec_1);
					pst.setString(3, Dec_2);
					pst.setString(4, Dec_3);
					pst.setString(5, Dec_4);
					int chkeReference = pst.executeUpdate();
					if (chkeReference > 0) 
					{
						System.out.println("inserted sucessfully Declare --- 12");
					}
				}
				catch(Exception ne)
				{
					System.out.println(" null number given by user  ====  12");
					System.out.println(ne.getMessage());
					System.out.println(ne.getCause());
					ne.printStackTrace();					
				}
			}
			
			// ******************* End Reference ******************* //
			
			// ******************* Start FeedBack ******************* //
			
			String feed_txtarea1 = request.getParameter("feed_txtarea1");
			String feed_txtarea2 = request.getParameter("feed_txtarea2");
			String feed_radio1 = request.getParameter("feed_radio1");
			
			String consult_towards = null;
			if(feed_radio1.equalsIgnoreCase("Yes"))
			{
				consult_towards = request.getParameter("consult_towards");
			}
			else
			{
				consult_towards = "";
			}
			
			String offCampus = request.getParameter("offCampus");
			
			String rec_Polite = request.getParameter("rec_Polite");
			String rec_247 = request.getParameter("rec_247");
			String int_process = request.getParameter("int_process");
			String voice_acent = request.getParameter("voice_acent");
			String rec_process = request.getParameter("rec_process");
			String ops_process = request.getParameter("ops_process");
			
			String feed_247 = request.getParameter("feed_247");
			String feed_txtarea3 = request.getParameter("feed_txtarea3");
			String feed_txtarea4 = request.getParameter("feed_txtarea4");
			String dateinerted_finalReg = request.getParameter("dateinerted_finalReg");
			try
			{
				PreparedStatement psFeedback = con.prepareStatement("INSERT INTO cand_feedback_details (Cand_AutoID, qus_ans_1, qus_ans_2, qus_ans_3, qus_ans_4, qus_ans_5, qus_ans_6, qus_ans_7, qus_ans_8, qus_ans_9, qus_ans_10, qus_ans_11, qus_ans_12, qus_ans_13, qus_ans_14, Start_DateTime,End_DateTime) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())");
				psFeedback.setInt(1, USER_AUTOID);
				psFeedback.setString(2, feed_txtarea1);
				psFeedback.setString(3, feed_txtarea2);
				psFeedback.setString(4, feed_radio1);
				
				if(!offCampus.equals("") && offCampus != null){ 
					psFeedback.setInt(5, Integer.parseInt(offCampus));
				}else{
					psFeedback.setNull(5,java.sql.Types.INTEGER);
				}
				
				if(!consult_towards.equals("") && consult_towards != null){ 
					psFeedback.setInt(6, Integer.parseInt(consult_towards));
				}else{
					psFeedback.setNull(6,java.sql.Types.INTEGER);
				}
				
				if(!rec_Polite.equals("") && rec_Polite != null){ 
					psFeedback.setInt(7, Integer.parseInt(rec_Polite));
				}else{
					psFeedback.setNull(7,java.sql.Types.INTEGER);
				}
				
				if(!rec_247.equals("") && rec_247 != null){ 
					psFeedback.setInt(8, Integer.parseInt(rec_247));
				}else{
					psFeedback.setNull(8,java.sql.Types.INTEGER);
				}
				
				if(!int_process.equals("") && int_process != null){ 
					psFeedback.setInt(9, Integer.parseInt(int_process));
				}else{
					psFeedback.setNull(9,java.sql.Types.INTEGER);
				}
				
				if(!voice_acent.equals("") && voice_acent != null){ 
					psFeedback.setInt(10, Integer.parseInt(voice_acent));
				}else{
					psFeedback.setNull(10,java.sql.Types.INTEGER);
				}
				
				if(!rec_process.equals("") && rec_process != null){ 
					psFeedback.setInt(11, Integer.parseInt(rec_process));
				}else{
					psFeedback.setNull(11,java.sql.Types.INTEGER);
				}
				
				if(!ops_process.equals("") && ops_process != null){ 
					psFeedback.setInt(12, Integer.parseInt(ops_process));
				}else{
					psFeedback.setNull(12,java.sql.Types.INTEGER);
				}
				
				psFeedback.setString(13, feed_247);
				psFeedback.setString(14, feed_txtarea3);
				psFeedback.setString(15, feed_txtarea4);
				psFeedback.setString(16, dateinerted_finalReg);
				int feed = psFeedback.executeUpdate();
				if(feed > 0)
				{
					System.out.println("FEED BACK DATA INSERTED ");
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			// ******************* End FeedBack ******************* //
			RequestDispatcher rddFinal = request.getRequestDispatcher("247Recruit/jsp/Candidate_Home_Page.jsp");
			rddFinal.forward(request, response);

		}
		catch (Exception ex) 
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			System.out.println(ex.getCause());
		}
	}
}
