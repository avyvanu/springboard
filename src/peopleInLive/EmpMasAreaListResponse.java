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
 *         &lt;element name=&quot;EmpMasAreaListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasArea&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasAreaListResult" })
@XmlRootElement(name = "EmpMasAreaListResponse")
public class EmpMasAreaListResponse {

	@XmlElement(name = "EmpMasAreaListResult")
	protected ArrayOfEmpMasArea empMasAreaListResult;

	/**
	 * Gets the value of the empMasAreaListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasArea }
	 * 
	 */
	public ArrayOfEmpMasArea getEmpMasAreaListResult() {
		return empMasAreaListResult;
	}

	/**
	 * Sets the value of the empMasAreaListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasArea }
	 * 
	 */
	public void setEmpMasAreaListResult(ArrayOfEmpMasArea value) {
		this.empMasAreaListResult = value;
	}

}
