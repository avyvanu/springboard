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
 *         &lt;element name=&quot;EmpMasReligionListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasReligion&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasReligionListResult" })
@XmlRootElement(name = "EmpMasReligionListResponse")
public class EmpMasReligionListResponse {

	@XmlElement(name = "EmpMasReligionListResult")
	protected ArrayOfEmpMasReligion empMasReligionListResult;

	/**
	 * Gets the value of the empMasReligionListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasReligion }
	 * 
	 */
	public ArrayOfEmpMasReligion getEmpMasReligionListResult() {
		return empMasReligionListResult;
	}

	/**
	 * Sets the value of the empMasReligionListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasReligion }
	 * 
	 */
	public void setEmpMasReligionListResult(ArrayOfEmpMasReligion value) {
		this.empMasReligionListResult = value;
	}

}
