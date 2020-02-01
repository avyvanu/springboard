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
 *         &lt;element name=&quot;OrgMasSubProgramListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfOrgMasSubProgram&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "orgMasSubProgramListResult" })
@XmlRootElement(name = "OrgMasSubProgramListResponse")
public class OrgMasSubProgramListResponse {

	@XmlElement(name = "OrgMasSubProgramListResult")
	protected ArrayOfOrgMasSubProgram orgMasSubProgramListResult;

	/**
	 * Gets the value of the orgMasSubProgramListResult property.
	 * 
	 * @return possible object is {@link ArrayOfOrgMasSubProgram }
	 * 
	 */
	public ArrayOfOrgMasSubProgram getOrgMasSubProgramListResult() {
		return orgMasSubProgramListResult;
	}

	/**
	 * Sets the value of the orgMasSubProgramListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfOrgMasSubProgram }
	 * 
	 */
	public void setOrgMasSubProgramListResult(ArrayOfOrgMasSubProgram value) {
		this.orgMasSubProgramListResult = value;
	}

}
