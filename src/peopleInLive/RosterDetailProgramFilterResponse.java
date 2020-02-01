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
 *         &lt;element name=&quot;RosterDetailProgramFilterResult&quot; type=&quot;{http://tempuri.org/}ArrayOfAMSRosterService&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "rosterDetailProgramFilterResult" })
@XmlRootElement(name = "RosterDetailProgramFilterResponse")
public class RosterDetailProgramFilterResponse {

	@XmlElement(name = "RosterDetailProgramFilterResult")
	protected ArrayOfAMSRosterService rosterDetailProgramFilterResult;

	/**
	 * Gets the value of the rosterDetailProgramFilterResult property.
	 * 
	 * @return possible object is {@link ArrayOfAMSRosterService }
	 * 
	 */
	public ArrayOfAMSRosterService getRosterDetailProgramFilterResult() {
		return rosterDetailProgramFilterResult;
	}

	/**
	 * Sets the value of the rosterDetailProgramFilterResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfAMSRosterService }
	 * 
	 */
	public void setRosterDetailProgramFilterResult(ArrayOfAMSRosterService value) {
		this.rosterDetailProgramFilterResult = value;
	}

}
