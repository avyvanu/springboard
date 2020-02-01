package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for OrgMasSubProgram complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;OrgMasSubProgram&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;ProgramCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;SubProgramCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;SubProgramName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
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
@XmlType(name = "OrgMasSubProgram", propOrder = { "programCode",
		"subProgramCode", "subProgramName", "active" })
public class OrgMasSubProgram {

	@XmlElement(name = "ProgramCode")
	protected int programCode;
	@XmlElement(name = "SubProgramCode")
	protected int subProgramCode;
	@XmlElement(name = "SubProgramName")
	protected String subProgramName;
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
	 * Gets the value of the subProgramCode property.
	 * 
	 */
	public int getSubProgramCode() {
		return subProgramCode;
	}

	/**
	 * Sets the value of the subProgramCode property.
	 * 
	 */
	public void setSubProgramCode(int value) {
		this.subProgramCode = value;
	}

	/**
	 * Gets the value of the subProgramName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSubProgramName() {
		return subProgramName;
	}

	/**
	 * Sets the value of the subProgramName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSubProgramName(String value) {
		this.subProgramName = value;
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
