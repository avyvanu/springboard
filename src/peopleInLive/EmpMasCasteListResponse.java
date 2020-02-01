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
 *         &lt;element name=&quot;EmpMasCasteListResult&quot; type=&quot;{http://tempuri.org/}ArrayOfEmpMasCaste&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "empMasCasteListResult" })
@XmlRootElement(name = "EmpMasCasteListResponse")
public class EmpMasCasteListResponse {

	@XmlElement(name = "EmpMasCasteListResult")
	protected ArrayOfEmpMasCaste empMasCasteListResult;

	/**
	 * Gets the value of the empMasCasteListResult property.
	 * 
	 * @return possible object is {@link ArrayOfEmpMasCaste }
	 * 
	 */
	public ArrayOfEmpMasCaste getEmpMasCasteListResult() {
		return empMasCasteListResult;
	}

	/**
	 * Sets the value of the empMasCasteListResult property.
	 * 
	 * @param value
	 *            allowed object is {@link ArrayOfEmpMasCaste }
	 * 
	 */
	public void setEmpMasCasteListResult(ArrayOfEmpMasCaste value) {
		this.empMasCasteListResult = value;
	}

}
