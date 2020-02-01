package util;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.swing.JFrame;

import util.ConnectDatabase;

public class ImageMakerSIM 
{  
      
        public static BufferedImage createImage(String canId, String EDKey, String EDKPass) 
        { 
        	
        	   	
            int imgH = 475;
			int imgW = 390;
		    Date newdate=new Date();
        	Connection con=null;
        	BufferedImage img = new BufferedImage(imgW, imgH, BufferedImage.TYPE_INT_RGB);  
            img.createGraphics();  
            Graphics2D g = (Graphics2D)img.getGraphics();  
            g.setColor(Color.BLACK);  
            g.fillRect(0, 0, imgW, imgH);
            g.setColor(Color.WHITE);  
            g.fillRect(5, 5, imgW - 10, imgH - 10);
            g.setColor(Color.BLACK);  
            g.setFont(new Font("Arial", Font.BOLD, 12));
            try {
            con= ConnectDatabase.getConnection();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat df2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
            String secQsnxQry7 = "SELECT * FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+ canId + "'";
			System.out.println("query " + secQsnxQry7);
			String nametitle = null;
			String firstname = null;
			String lastname = null;
			int candAutoId = 0;
			String doe = null;
			String dobfinal = null;
			int Init_Result= 0;
			int InitSelectedProgram=0;
			int programid=0;
			String InitStatus=null;
			String programnamemain=null;
			String recruiterdate=null;
			String recruiterdatefinal=null;
			String precisstatusfinal=null;
			String PrecisfinalDate=null;
			float totalscoreprecis=0;
            String Langstatusfinal=null;
			String LangfinalDate=null; 
			float totalscorelang=0;
			Statement stmts = con.createStatement();
			ResultSet rss = stmts.executeQuery(secQsnxQry7);
			if (rss.next())
			 {
				candAutoId = rss.getInt("AutoID");
				nametitle = rss.getString("Title");
				firstname = rss.getString("First_Name");
				lastname = rss.getString("Last_Sir_Name");
				Init_Result= rss.getInt("Init_Result");
				InitSelectedProgram= rss.getInt("Init_Selected_Program");
				doe = rss.getString("system_date_time");
				Date d = df.parse(doe); 
				dobfinal = df2.format(d);
				recruiterdate= rss.getString("Recruiter_Cand_Select_Date");
				Date d1 = df.parse(recruiterdate); 
				recruiterdatefinal = df2.format(d1);
			 }
			
			boolean languageAvailable = false;
	        languageAvailable=IsLanguageValidator.LanguageValidator(candAutoId);
			System.out.println("languageAvailable:::::"+languageAvailable);
			
			String secQsnMasterfinal = "select program_name from program_names_master where Program_id="+InitSelectedProgram+"";
		    System.out.println("query ============ "+secQsnMasterfinal);
		 	Statement stmtMastermain = con.createStatement();
		 	ResultSet rsMastermain = stmtMastermain.executeQuery(secQsnMasterfinal);
		 	if(rsMastermain.next())
		 	{
		 		programnamemain=rsMastermain.getString("program_name");
		 	}
			 if(Init_Result==1)
			{
				InitStatus="Select";
			}
			else if(Init_Result==2)
			{
				InitStatus="Hold";	
			}
			else if(Init_Result==3)
			{
				InitStatus="Reject";	
			}

			
/*          int w=200;
            int h=200;
            int w1=300;
            int h1=300;
            FontRenderContext frc = g.getFontRenderContext();
            FontRenderContext frc1 = g.getFontRenderContext();
            Font f = new Font("Arial", Font.BOLD, 12);
            Font f1 = new Font("Arial", Font.BOLD, 12);
*/          
/*          TextLayout textTl = new TextLayout(s, f, frc);
            TextLayout textT2 = new TextLayout(s1, f1, frc1);
            //AffineTransform transform = new AffineTransform();
            Shape outline = textTl.getOutline(null);
            Shape outline1 = textT2.getOutline(null);
            Rectangle r = outline.getBounds();
            Rectangle r1 = outline.getBounds();
            //transform = g.getTransform();
            //g.getTransform();
            g.translate(w/2-(r.width/2), h/2+(r.height/2));
            g.translate(w1/2-(r1.width/2), h1/2+(r1.height/2));
            //g.transform(transform);
            g.setColor(Color.BLACK);
            g.draw(outline);   
            g.draw(outline1);
*/           
			double accuracy=0.0;
			double speed=0.0;  
            String decspeed=null;
			String Startdatetyping=null;
			String typingfinalDate=null;
			String secqrytyping = "select ACCURACY,SPEED,START_DATE_ACTIVE  from bpo_user_typing_test_attempt where user_id="+ candAutoId + "";
			System.out.println("query " + secqrytyping);
			Statement stmttyping = con.createStatement();
			ResultSet rsstyping = stmttyping.executeQuery(secqrytyping);
			if (rsstyping.next()) 
			{
			accuracy=rsstyping.getDouble("ACCURACY");
			speed=rsstyping.getFloat("SPEED");
			DecimalFormat dv=new DecimalFormat("0.00");
            decspeed = dv.format(speed);
			System.out.println("decspeed " + decspeed);
			Startdatetyping=rsstyping.getString("START_DATE_ACTIVE");
			Date d2 = df.parse(Startdatetyping); 
			typingfinalDate = df2.format(d2);
			}
			
			    double readingdec=0;
			    String Startdatereading=null;
				String readingfinalDate=null; 
				String secqreading = "select START_DATE_ACTIVE  from bpo_user_reading_comp_test_attempt where user_id="+ candAutoId + "";
				System.out.println("query " + secqreading);
				Statement stmtsreading = con.createStatement();
				ResultSet rsssreading = stmtsreading.executeQuery(secqreading);
				if (rsssreading.next()) 
				{
					Startdatereading=rsssreading.getString("START_DATE_ACTIVE");
					Date d3 = df.parse(Startdatereading); 
					readingfinalDate = df2.format(d3);
				}
	            String secqryreading = "select count(status) as countvalue from bpo_user_reading_comp_test where status='Y' and user_id="+ candAutoId + "";
				System.out.println("query " + secqryreading);
				Statement stmtreading = con.createStatement();
				ResultSet rssreading = stmtreading.executeQuery(secqryreading);
				if (rssreading.next()) 
				{
					double readingper =rssreading.getInt("countvalue");
					System.out.println("readingper " + readingper);
					readingdec=((readingper)/5)*100;
					System.out.println("readingper " + readingdec);
				}
				
				String StartdateEnglish=null;
				String EnglishfinalDate=null; 
				String secqEnglish = "select START_DATE_ACTIVE  from bpo_user_reading_comp_test_attempt where user_id="+ candAutoId + "";
				System.out.println("query " + secqEnglish);
				Statement stmtsEnglish = con.createStatement();
				ResultSet rsssEnglish = stmtsEnglish.executeQuery(secqEnglish);
				if (rsssEnglish.next()) 
				{
					StartdateEnglish=rsssEnglish.getString("START_DATE_ACTIVE");
					Date d4 = df.parse(StartdateEnglish); 
					EnglishfinalDate = df2.format(d4);
				}
				double enggramdec=0;
                String enggramdecspeed=null;
                String secqryenggram = "select count(status) as countvalue from bpo_user_eng_comp_test where status='Y' and user_id="+ candAutoId + "";
				System.out.println("query " + secqryenggram);
				Statement stmtenggram = con.createStatement();
				ResultSet rssenggram= stmtenggram.executeQuery(secqryenggram);
				if (rssenggram.next()) 
				{
					double enggramper =rssenggram.getDouble("countvalue");
					System.out.println("enggramper " + enggramper);
					enggramdec=((enggramper)/15)*100;
					System.out.println("enggramdec " + enggramdec);
					DecimalFormat dv1=new DecimalFormat("0.00");
                    enggramdecspeed = dv1.format(enggramdec);
				    System.out.println("enggramdecspeed " + enggramdecspeed);
				}
				
			//*************Precis Writing Score*****************//
				if(!languageAvailable)
				{
				int precisstatus=0; 
                String StartdatePrecis=null;
				String secqryprecis = "select statusi,total_score,Last_scored_Date,Program_Id from candidate_precis_writing_score where  Cand_Id="+ candAutoId + "";
				System.out.println("Mok chatquery " + secqryprecis);
				Statement stmtprecis = con.createStatement();
				ResultSet rssprecis= stmtprecis.executeQuery(secqryprecis);
				if (rssprecis.next()) 
				{
					precisstatus =rssprecis.getInt("Statusi");
					programid =rssprecis.getInt("Program_Id");
					totalscoreprecis =rssprecis.getFloat("Total_score");
					StartdatePrecis=rssprecis.getString("Last_scored_Date");
					Date d5 = df.parse(StartdatePrecis); 
					PrecisfinalDate = df2.format(d5);
				}
				if(precisstatus==1)
				{
					precisstatusfinal="Select";
				}
				else if(precisstatus==2)
				{
					precisstatusfinal="Hold";	
				}
				else if(precisstatus==3)
				{
					precisstatusfinal="Reject";	
				}
			    }
				//*************End of Precis Writing Score*****************//
				
				//****Language Writing Score******//
				if(languageAvailable)
				{
				int Langstatus=0; 
                String StartdateLang=null;
				String secqryprecis = "select statusi,total_score,Last_scored_Date,Program_Id from candidate_language_testscore where  Cand_Id="+ candAutoId + "";
				System.out.println("Mok chatquery " + secqryprecis);
				Statement stmtprecis = con.createStatement();
				ResultSet rssprecis= stmtprecis.executeQuery(secqryprecis);
				if (rssprecis.next()) 
				{
					Langstatus =rssprecis.getInt("Statusi");
					programid =rssprecis.getInt("Program_Id");
					totalscorelang =rssprecis.getFloat("Total_score");
					StartdateLang=rssprecis.getString("Last_scored_Date");
					Date d5 = df.parse(StartdateLang); 
					LangfinalDate = df2.format(d5);
				}
				if(Langstatus==1)
				{
					Langstatusfinal="Select";
				}
				else if(Langstatus==2)
				{
					Langstatusfinal="Hold";	
				}
				else if(Langstatus==3)
				{
					Langstatusfinal="Reject";	
				}
				}
				//****Language Writing Score******//
				
				String programname=null;
				String secQsnMasterprogram = "select program_name from program_names_master where Program_id="+programid+"";
			    System.out.println("query ============ "+secQsnMasterprogram);
			 	Statement stmtMaster = con.createStatement();
			 	ResultSet rsMaster = stmtMaster.executeQuery(secQsnMasterprogram);
			 	if(rsMaster.next())
			 	{
			 		programname=rsMaster.getString("program_name");
			 	}
				
				float moktotalscore=0;
                int mokstatus=0; 
                String mokfinalstatus=null;
                String StartdateMok=null;
				String MokfinalDate=null;
				int mokprogid=0;
                String secqrymokchat = "select statusi,total_score,Last_Scored_Date,Program_Id from candidate_chat_score where  Cand_Id="+ candAutoId + "";
				System.out.println("Mok chatquery " + secqrymokchat);
				Statement stmtmokchat = con.createStatement();
				ResultSet rssmokchat= stmtmokchat.executeQuery(secqrymokchat);
				if (rssmokchat.next()) 
				{
					mokstatus =rssmokchat.getInt("Statusi");
					moktotalscore =rssmokchat.getInt("Total_score");
					mokprogid =rssmokchat.getInt("Program_Id");
					StartdateMok =rssmokchat.getString("Last_Scored_Date");
					Date d6 = df.parse(StartdateMok); 
					MokfinalDate = df2.format(d6);
				}
				String mokprogramname=null;
				String secQsnMastermokprogram = "select program_name from program_names_master where Program_id="+mokprogid+"";
			    System.out.println("query ============ "+secQsnMastermokprogram);
			 	Statement stmtmokMaster = con.createStatement();
			 	ResultSet rsmokMaster = stmtmokMaster.executeQuery(secQsnMastermokprogram);
			 	if(rsmokMaster.next())
			 	{
			 		mokprogramname=rsmokMaster.getString("program_name");
			 	}
				if(mokstatus==1)
				{
					mokfinalstatus="Select";
				}
				else if(mokstatus==2)
				{
					mokfinalstatus="Hold";	
				}
				else if(mokstatus==3)
				{
					mokfinalstatus="Reject";	
				}
				 int operationstotalscore=0;
	             int operationsstatus=0; 
	             int opsProgramid=0;
	             String scoredOpsdate=null;
	             String OpsDateFinal=null;
	             String opsfinalstatus=null;
	             String secqryoperations = "select Result_Status,Score,Program_Id,Start_Date from operations_interview_master where  Candidate_ID="+ candAutoId + "";
				 System.out.println("operations interview::: " + secqryoperations);
				 Statement stmtoperations = con.createStatement();
				 ResultSet rssoperations= stmtoperations.executeQuery(secqryoperations);
				 if (rssoperations.next()) 
					{
					operationsstatus =rssoperations.getInt("Result_Status");
					operationstotalscore =rssoperations.getInt("Score");
					opsProgramid =rssoperations.getInt("Program_Id");
					scoredOpsdate =rssoperations.getString("Start_Date");
					System.out.println("Ops Date::"+scoredOpsdate);
					Date d4 = df.parse(scoredOpsdate); 
					OpsDateFinal = df2.format(d4);
					}
				    String Opsprogramname=null;
					String secQsnOpsprogram = "select program_name from program_names_master where Program_id="+opsProgramid+"";
				    System.out.println("query ============ "+secQsnOpsprogram);
				 	Statement stmtOpsMaster = con.createStatement();
				 	ResultSet rsOpsMaster = stmtOpsMaster.executeQuery(secQsnOpsprogram);
				 	if(rsOpsMaster.next())
				 	{
				 		Opsprogramname=rsOpsMaster.getString("program_name");
				 	}
				 	if(operationsstatus==1)
					{
				 		opsfinalstatus="Select";
					}
					else if(operationsstatus==2)
					{
						opsfinalstatus="Hold";	
					}
					else if(operationsstatus==3)
					{
						opsfinalstatus="Reject";	
					}
			int xCt = 20;
			int yCt = 30;
			String Can_Id = "Candidate Id : " + canId;
 			String Can_Name = "Name : " + nametitle + ". " + firstname + " " + lastname ;
 			String DOR="Date of Registeration : "+dobfinal;
 			String TypingTestdetails1="Typing Test >> Date : " + typingfinalDate + ",";
 			String TypingTestdetails2="Accuracy : " + accuracy +", " + "Speed : "+decspeed;
 			String Readingdetails1="Reading Comprehension Test >> "+"Date : " + readingfinalDate;
 			String Readingdetails2="Score : " +readingdec+ " % ";
 			String Englishdetails1="English Grammar Test >> "+"Date : " + EnglishfinalDate;
 			String Englishdetails2="Score : " +enggramdecspeed+ " % ";
 			String precisdetails1="Precis Writing Test >> "+"Date : " + PrecisfinalDate + " , ";
 			String precisdetails2= "Score : " +totalscoreprecis+ ", " +"Status : "+precisstatusfinal+ ", Program : "+programname;
 			String langdetails1="Language Writing Test >> "+"Date : " + LangfinalDate + " , ";
 			String langdetails2= "Score : " +totalscorelang+ ", " +"Status : "+Langstatusfinal+ ", Program : "+programname;
 			String Mokdetails1="Mock Chat Test >> "+"Date : " + MokfinalDate + " , ";
 			String Mokdetails2= "Score : " +moktotalscore+ ", " +"Status :"+mokfinalstatus +", Program : "+mokprogramname;
 			String Operationsdetails1="Operation Interview :  >> Date : " + OpsDateFinal + ",";
 			String Operationsdetails2="Score : " +operationstotalscore +", " + "Status : "+opsfinalstatus+", Program : "+Opsprogramname;
 			String HrSelectionStatus="HR Selection:  >> Date : " + recruiterdatefinal + ","; 
 			String HrSelectedProg= "Status : "+InitStatus+", Program : "+programnamemain;
            g.setColor(Color.RED);  
            g.setFont(new Font("Arial", Font.BOLD, 15));
 			g.drawString("[24]7 Recruitment Summary", 95, yCt);
            g.setFont(new Font("Arial", Font.BOLD, 12));
 			yCt = yCt + 15;
            g.setColor(Color.BLACK);  
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
 			g.drawString(Can_Id, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(Can_Name, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(DOR, xCt, yCt);
 			yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(TypingTestdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(TypingTestdetails2, xCt, yCt);
            yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(Readingdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(Readingdetails2, xCt, yCt);
 			yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(Englishdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(Englishdetails2, xCt, yCt);
            if(!languageAvailable)
			{
            yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(precisdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(precisdetails2, xCt, yCt);
			}
            if(languageAvailable)
			{
            yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(langdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(langdetails2, xCt, yCt);
			}
            yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(Mokdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(Mokdetails2, xCt, yCt);
            yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(Operationsdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(Operationsdetails2, xCt, yCt);
            yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(HrSelectionStatus, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(HrSelectedProg, xCt, yCt);
            String TCV = "5.0";
			String PFP = "Program Files\\";
			
			/*System.out.println("img::::::::;"+img);
			byte[] imageInByte;
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(img, "jpg", baos);
			baos.flush();
			imageInByte = baos.toByteArray();
			System.out.println("imageInByte:::::::"+imageInByte);
			baos.close();*/
			File imgOutFile = null;
			FileInputStream fis = null;
			imgOutFile = new File(canId+"-"+newdate.getTime()+"vi.png");
			ImageIO.write(img, "jpg",imgOutFile);
			String psthLink=canId+"-RS"+newdate.getTime()+".jpg";
			System.out.println("DISPLAY THE PATH \t"+psthLink);
			fis = new FileInputStream(imgOutFile);
	    	System.out.println("FILE INPUT STRAEM DATA \t"+fis);
	    	
			//Procedure to store the Recruit Summary Image in Database//
	    	CallableStatement proc=null;
			con = ConnectDatabase.getConnection();
			proc = con.prepareCall("{call RecrtmntSummrySave_Encrypt_Proc(?,?,?,?)}");
			proc.setString(1,canId);
			proc.setBinaryStream(2, (InputStream)fis, (int)(imgOutFile.length()));
			proc.setString(3,EDKey);
			proc.setString(4,EDKPass);
			System.out.println(proc);
			proc.execute();
			proc.close();
			System.out.println("inserted sucessfully");
			fis.close();
			imgOutFile.delete();
			//End of Procedure to store the Recruit Summary Image in Database//
			
			}
            catch (Exception e) {
             e.printStackTrace();
			}

           for(int i = 1; i < 49; i++) {  
                g.setColor(new Color(5*i, 5*i, 4+1*2+i*3));  
                g.fillRect(2*i, 2*i, 3*i, 3*1);  
            }  
            return img;  

        }  
         /*public static void main(String[] args) {  
            JFrame frame = new JFrame("Image Maker");  
            frame.addWindowListener(new WindowAdapter() {  
                public void windowClosing(WindowEvent event) {  
                    System.exit(0);  
                }  
            });  
            //frame.setBounds(0, 0, 200, 200);  
            //JPanel panel = new JPanel();  
            //frame.add(panel);  
            //JLabel label = new JLabel("A Very Simple Text Label");
            //frame.getContentPane().add(label);
            //frame.setVisible(true);  
          createImage('IC00004451');
        }  */
      
    }  