package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for anonymous complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;OrgMasProgramListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfOrgMasProgram&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "orgMasProgramListResult" })
@XmlRootElement(name = "OrgMasProgramListResponse")
public class OrgMasProgramListResponse {

	@XmlElement(name = "OrgMasProgramListResult")
	protected ArrayOfOrgMasProgram orgMasProgramListResult;

	/**
	 * Gets the value of the orgMasProgramListResult property.
	 * 
	 * @return possible object is {@link ArrayOfOrgMasProgram }
	 * 
	 */
	public ArrayOfOrgMasProgram getOrgMasProgramListResult() {
		return orgMasProgramListResult;
	}

	/**
	 * Sets the value of the orgMasProgramListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfOrgMasProgram }
	 * 
	 */
	public void setOrgMasProgramListResult(ArrayOfOrgMasProgram value) {
		this.orgMasProgramListResult = value;
	}

}
