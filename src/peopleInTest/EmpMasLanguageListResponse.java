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
 *         &lt;element name=&quot;EmpMasLanguageListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasLanguage&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasLanguageListResult" })
@XmlRootElement(name = "EmpMasLanguageListResponse")
public class EmpMasLanguageListResponse {

	@XmlElement(name = "EmpMasLanguageListResult")
	protected ArrayOfEmpMasLanguage empMasLanguageListResult;

	/**
	 * Gets the value of the empMasLanguageListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasLanguage }
	 * 
	 */
	public ArrayOfEmpMasLanguage getEmpMasLanguageListResult() {
		return empMasLanguageListResult;
	}

	/**
	 * Sets the value of the empMasLanguageListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasLanguage }
	 * 
	 */
	public void setEmpMasLanguageListResult(ArrayOfEmpMasLanguage value) {
		this.empMasLanguageListResult = value;
	}

}
