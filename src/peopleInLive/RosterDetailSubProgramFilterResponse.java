package peopleInLive;

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
 *         &lt;element name=&quot;RosterDetailSubProgramFilterResult&quot; type=&quot;{http://tempuri.org/}ArrayOfAMSRosterService&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "rosterDetailSubProgramFilterResult" })
@XmlRootElement(name = "RosterDetailSubProgramFilterResponse")
public class RosterDetailSubProgramFilterResponse {

	@XmlElement(name = "RosterDetailSubProgramFilterResult")
	protected ArrayOfAMSRosterService rosterDetailSubProgramFilterResult;

	/**
	 * Gets the value of the rosterDetailSubProgramFilterResult property.
	 * 
	 * @return possible object is {@link ArrayOfAMSRosterService }
	 * 
	 */
	public ArrayOfAMSRosterService getRosterDetailSubProgramFilterResult() {
		return rosterDetailSubProgramFilterResult;
	}

	/**
	 * Sets the value of the rosterDetailSubProgramFilterResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfAMSRosterService }
	 * 
	 */
	public void setRosterDetailSubProgramFilterResult(
			ArrayOfAMSRosterService value) {
		this.rosterDetailSubProgramFilterResult = value;
	}

}
