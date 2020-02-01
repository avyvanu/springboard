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
 *         &lt;element name=&quot;CandidateSaveResult&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}boolean&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "candidateSaveResult" })
@XmlRootElement(name = "CandidateSaveResponse")
public class CandidateSaveResponse {

	@XmlElement(name = "CandidateSaveResult")
	protected boolean candidateSaveResult;

	/**
	 * Gets the value of the candidateSaveResult property.
	 * 
	 */
	public boolean isCandidateSaveResult() {
		return candidateSaveResult;
	}

	/**
	 * Sets the value of the candidateSaveResult property.
	 * 
	 */
	public void setCandidateSaveResult(boolean value) {
		this.candidateSaveResult = value;
	}

}
