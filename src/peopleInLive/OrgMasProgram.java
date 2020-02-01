package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for OrgMasProgram complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;OrgMasProgram&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;ProgramCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;ProgramName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *         &lt;element name=&quot;Active&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "OrgMasProgram", propOrder = { "programCode", "programName",
		"active" })
public class OrgMasProgram {

	@XmlElement(name = "ProgramCode")
	protected int programCode;
	@XmlElement(name = "ProgramName")
	protected String programName;
	@XmlElement(name = "Active")
	protected String active;

	/**
	 * Gets the value of the programCode property.
	 * 
	 */
	public int getProgramCode() {
		return programCode;
	}

	/**
	 * Sets the value of the programCode property.
	 * 
	 */
	public void setProgramCode(int value) {
		this.programCode = value;
	}

	/**
	 * Gets the value of the programName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getProgramName() {
		return programName;
	}

	/**
	 * Sets the value of the programName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setProgramName(String value) {
		this.programName = value;
	}

	/**
	 * Gets the value of the active property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getActive() {
		return active;
	}

	/**
	 * Sets the value of the active property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setActive(String value) {
		this.active = value;
	}

}
