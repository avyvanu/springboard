package util;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

public class readMEFILE 
{
	public class readMEFILEvariableoF
	{

	    public  void ReadMeCallXML()
	    {
	    	try 
	    	{
	    	    Dbconfiguration dbconfiguration=new Dbconfiguration();

	            DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
	            DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
	            Document doc = docBuilder.parse (new File("ReadMeCallXML"));

	            // normalize text representation
	            doc.getDocumentElement ().normalize ();
	           // System.out.println ("Root element of the doc is " +      doc.getDocumentElement().getNodeName());


	            NodeList listOfPersons = doc.getElementsByTagName("totalchaerror");
	            int totalPersons = listOfPersons.getLength();
	          
	            
	            for(int s=0; s<listOfPersons.getLength() ; s++)
	            {

                Node firstPersonNode = listOfPersons.item(s);
                if(firstPersonNode.getNodeType() == Node.ELEMENT_NODE)
                {
                    Element firstPersonElement = (Element)firstPersonNode;
         
                    NodeList firstNameList = firstPersonElement.getElementsByTagName("comp");
                    Element firstNameElement = (Element)firstNameList.item(0);
                    NodeList textFNList = firstNameElement.getChildNodes();
                 
                    String ipaddress=textFNList.item(0).getNodeValue().trim();
	             
                    NodeList lastNameList = firstPersonElement.getElementsByTagName("engresult");
	                    
                    Element lastNameElement = (Element)lastNameList.item(0);

                    NodeList textLNList = lastNameElement.getChildNodes();
                    String schema=textLNList.item(0).getNodeValue().trim();
                    String finalurl=ipaddress+"/"+schema;
                    Dbconfiguration.setURl(finalurl);
	          

	         }
	        }
	    	}
	         catch (SAXParseException err) {
	        System.out.println ("** Parsing error" + ", line " 
	             + err.getLineNumber () + ", uri " + err.getSystemId ());
	        System.out.println(" " + err.getMessage ());
	        

	        }catch (SAXException e) {
	        Exception x = e.getException ();
	        ((x == null) ? e : x).printStackTrace ();

	        }catch (Throwable t) {
	        t.printStackTrace ();
	        }
	        //System.exit (0);

	    }
	}
}//end of main
	

