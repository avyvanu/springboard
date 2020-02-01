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
 *         &lt;element name=&quot;CandidateSaveIMGResult&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}boolean&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "candidateSaveIMGResult" })
@XmlRootElement(name = "CandidateSaveIMGResponse")
public class CandidateSaveIMGResponse {

	@XmlElement(name = "CandidateSaveIMGResult")
	protected boolean candidateSaveIMGResult;

	/**
	 * Gets the value of the candidateSaveIMGResult property.
	 * 
	 */
	public boolean isCandidateSaveIMGResult() {
		return candidateSaveIMGResult;
	}

	/**
	 * Sets the value of the candidateSaveIMGResult property.
	 * 
	 */
	public void setCandidateSaveIMGResult(boolean value) {
		this.candidateSaveIMGResult = value;
	}

}
