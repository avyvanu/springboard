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
 *         &lt;element name=&quot;GetNewJoineeDetailsResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpNewJoinee&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "getNewJoineeDetailsResult" })
@XmlRootElement(name = "GetNewJoineeDetailsResponse")
public class GetNewJoineeDetailsResponse {

	@XmlElement(name = "GetNewJoineeDetailsResult")
	protected ArrayOfEmpNewJoinee getNewJoineeDetailsResult;

	/**
	 * Gets the value of the getNewJoineeDetailsResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpNewJoinee }
	 * 
	 */
	public ArrayOfEmpNewJoinee getGetNewJoineeDetailsResult() {
		return getNewJoineeDetailsResult;
	}

	/**
	 * Sets the value of the getNewJoineeDetailsResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpNewJoinee }
	 * 
	 */
	public void setGetNewJoineeDetailsResult(ArrayOfEmpNewJoinee value) {
		this.getNewJoineeDetailsResult = value;
	}

}
