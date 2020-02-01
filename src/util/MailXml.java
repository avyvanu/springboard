package util;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import util.Dbconfiguration;

public class MailXml {
	public static void CallXMLMailConfig(){
	    try {
	Dbconfiguration dbconfiguration=new Dbconfiguration();

    DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
    System.out.println("docBuilder : "+docBuilder);
    Document doc = docBuilder.parse (new File("Mail.xml"));

	//loop started for email
    
    NodeList listOfMail = doc.getElementsByTagName("emailconfig");
    int listOfMailLength = listOfMail.getLength();
  
    
    for(int s=0; s<listOfMail.getLength() ; s++)
    {
        Node firstPersonNode = listOfMail.item(s);
        if(firstPersonNode.getNodeType() == Node.ELEMENT_NODE)
        {
            Element firstPersonElement = (Element)firstPersonNode;

            //-------
            NodeList smtphost = firstPersonElement.getElementsByTagName("smtphost");
            Element smtphostelement = (Element)smtphost.item(0);

            NodeList smtphostList = smtphostelement.getChildNodes();
          
            String smtpHostString=smtphostList.item(0).getNodeValue().trim();
            Dbconfiguration.setSmtphost(smtpHostString);
           
           //System.out.println("ipadress"+ipaddress);
           
          //  Dbconfiguration.setURl();
           /* System.out.println("First Name : " + 
                   ((Node)textFNList.item(0)).getNodeValue().trim());*/

            //-------
            NodeList smtpport = firstPersonElement.getElementsByTagName("smtpport");
            
            Element smtpportElement = (Element)smtpport.item(0);

            NodeList smtpportNList = smtpportElement.getChildNodes();
            String smtpportData=smtpportNList.item(0).getNodeValue().trim();
            
            Dbconfiguration.setSmtpport(smtpportData);
            //System.out.println("shemac"+schema);
            /*System.out.println("Last Name : " + 
                   ((Node)textLNList.item(0)).getNodeValue().trim());*/

            //----
            NodeList emailfrom = firstPersonElement.getElementsByTagName("emailfrom");
            Element emailfromElement = (Element)emailfrom.item(0);

            NodeList emailfromList = emailfromElement.getChildNodes();
            String emailfromdata=emailfromList.item(0).getNodeValue().trim();
            dbconfiguration.setEmailfrom(emailfromdata);
           // System.out.println("username"+username);
            /*System.out.println("Age : " + 
                   ((Node)textAgeList.item(0)).getNodeValue().trim());*/
            NodeList emailpassword = firstPersonElement.getElementsByTagName("emailpassword");
            Element emailpasswordList = (Element)emailpassword.item(0);

            NodeList emailpasswordNode = emailpasswordList.getChildNodes();
            String emailpasswordString=emailpasswordNode.item(0).getNodeValue().trim();
            dbconfiguration.setEmailpassword(emailpasswordString);
           
            NodeList emailsubject = firstPersonElement.getElementsByTagName("emailsubject");
            Element emailsubject2 = (Element)emailsubject.item(0);

            NodeList emailsubjectext = emailsubject2.getChildNodes();
            String emailsubjectMessage=emailsubjectext.item(0).getNodeValue().trim();
            dbconfiguration.setEmailsubject(emailsubjectMessage);
          
            NodeList emailmessage = firstPersonElement.getElementsByTagName("emailmessage");
            Element emailmessage2 = (Element)emailmessage.item(0);

            NodeList emailmessageText = emailmessage2.getChildNodes();
            String message=emailmessageText.item(0).getNodeValue().trim();
            dbconfiguration.setEmailmessage(message);
         //  System.out.println("password"+passwordstr);
            /*System.out.println("Age : " + 
                   ((Node)textAgeList.item(0)).getNodeValue().trim());*/
            //------


        }//end of if clause


    }
    
    
    
}

		catch (Exception e) {
			// TODO: handle exception
		}
	
	
	
	}
	
}
