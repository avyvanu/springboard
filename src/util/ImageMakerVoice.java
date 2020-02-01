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
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;
import util.ConnectDatabase;
    public class ImageMakerVoice {  
    	
    	public static BufferedImage createImage(String canId,String EDKey,String EDKPass) {  
        
			int imgH = 325;
			int imgW = 390;
        	Date newdate=new Date();
        	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat df2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
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
  //          String EDKey="[24]7";
  //      	String EDKPass="247Cust0m3r";
            String secQsnxQry7 = "SELECT * FROM bpo_candidatesreg_details where Bpo_Cand_Id='"+ canId + "'";
			System.out.println("query " + secQsnxQry7);
			String nametitle = null;
			String firstname = null;
			String lastname = null;
			String id = null;
			String doe = null;
			String dobfinal = null;
			int Init_Result= 0;
			int InitSelectedProgram=0;
			String InitStatus=null;
			String programnamemain=null;
			String recruiterdate=null;
			String recruiterdatefinal=null;
			Statement stmts = con.createStatement();
			ResultSet rss = stmts.executeQuery(secQsnxQry7);
			while (rss.next())
			 {
				id = rss.getString("AutoID");
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
*/          int stabilitytotalscore=0;
			int stabilitystatus=0; 
			String Status=null;
			String StartdateStability=null;
			String stabilityfinalDate=null;
			String secqrystability = "select Result_Status,Score,Start_Date from stability_chk_master where  Candidate_ID="+ id + "";
			System.out.println("Mok chatquery " + secqrystability);
			Statement stmtstability = con.createStatement();
			ResultSet rssstability= stmtstability.executeQuery(secqrystability);
			while (rssstability.next()) 
			{
				stabilitystatus =rssstability.getInt("Result_Status");
				System.out.println("Statusi " + stabilitystatus);
				stabilitytotalscore =rssstability.getInt("Score");
				System.out.println("Total_score " + stabilitytotalscore);
				StartdateStability =rssstability.getString("Start_Date");
				Date d2 = df.parse(StartdateStability); 
				stabilityfinalDate = df2.format(d2);
			}
			if(stabilitystatus==1)
			{
				Status="Select";
			}
			else if(stabilitystatus==2)
			{
				Status="Hold";	
			}
			else if(stabilitystatus==3)
			{
				Status="Reject";	
			}
			
            int totalscorevoice=0;
            int voicestatus=0; 
            int programid=0;
            String StatusVoice=null;
            String scoredvoicedate=null;
            String dosVoice=null;
            String secqryvoice = "select Statusi,Total_score,Program_Id,Last_Scored_Date from candidate_voice_score where  Cand_Id="+ id + "";
			System.out.println("Voice chatquery " + secqryvoice);
			Statement stmtvoice = con.createStatement();
			ResultSet rssvoice= stmtvoice.executeQuery(secqryvoice);
			while (rssvoice.next()) 
			{
				voicestatus =rssvoice.getInt("Statusi");
				totalscorevoice =rssvoice.getInt("Total_score");
				programid =rssvoice.getInt("Program_Id");
				scoredvoicedate =rssvoice.getString("Last_Scored_Date");
				System.out.println(scoredvoicedate);
				Date d3 = df.parse(scoredvoicedate); 
				dosVoice = df2.format(d3);
				
			}
			String programname=null;
			String secQsnMasterprogram = "select program_name from program_names_master where Program_id="+programid+"";
		    System.out.println("query ============ "+secQsnMasterprogram);
		 	Statement stmtMaster = con.createStatement();
		 	ResultSet rsMaster = stmtMaster.executeQuery(secQsnMasterprogram);
		 	if(rsMaster.next())
		 	{
		 		programname=rsMaster.getString("program_name");
		 	}
			if(voicestatus==1)
			{
				StatusVoice="Select";
			}
			else if(voicestatus==2)
			{
				StatusVoice="Hold";	
			}
			else if(voicestatus==3)
			{
				StatusVoice="Reject";	
			}
			 int operationstotalscore=0;
             int operationsstatus=0; 
             int opsProgramid=0;
             String scoredOpsdate=null;
             String OpsDateFinal=null;
             String opsfinalstatus=null;
             String secqryoperations = "select Result_Status,Score,Program_Id,Start_Date from operations_interview_master where  Candidate_ID="+ id + "";
			 System.out.println("operations interview::: " + secqryoperations);
			 Statement stmtoperations = con.createStatement();
			 ResultSet rssoperations= stmtoperations.executeQuery(secqryoperations);
			 while (rssoperations.next()) 
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
 			String stabilitydetails1="Stability Check >> Date : " + stabilityfinalDate + ",";
 			String stabilitydetails2="Score : " + stabilitytotalscore +", " + "Status : "+Status;
 			String VAtestdetails1="V&A Test :  >> Date : " + dosVoice + ",";
 			String VAtestdetails2="Score : " +totalscorevoice +", " + "Status : "+StatusVoice+", Program : "+programname;
 			String Operationsdetails1="Operation Interview :  >> Date : " + OpsDateFinal + ",";
 			String Operationsdetails2="Score : " +operationstotalscore +", " + "Status : "+opsfinalstatus+", Program : "+Opsprogramname;
 			String HrSelectionStatus="HR Selection:  >>Date : " + recruiterdatefinal + ","; 
 			String HrSelectedProg= "Status : "+InitStatus+", Program :"+programnamemain;
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
            g.drawString(stabilitydetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(stabilitydetails2, xCt, yCt);
            yCt = yCt + 10;
            g.drawLine(0, yCt, imgW, yCt);  
 			yCt = yCt + 20;
            g.drawString(VAtestdetails1, xCt, yCt);
 			yCt = yCt + 20;
            g.drawString(VAtestdetails2, xCt, yCt);
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
          createImage();
        }  */
      
    }  