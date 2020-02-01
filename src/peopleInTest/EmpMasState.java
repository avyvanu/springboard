package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasState complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasState&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;StateCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;StateName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasState", propOrder = { "stateCode", "stateName" })
public class EmpMasState {

	@XmlElement(name = "StateCode")
	protected int stateCode;
	@XmlElement(name = "StateName")
	protected String stateName;

	/**
	 * Gets the value of the stateCode property.
	 * 
	 */
	public int getStateCode() {
		return stateCode;
	}

	/**
	 * Sets the value of the stateCode property.
	 * 
	 */
	public void setStateCode(int value) {
		this.stateCode = value;
	}

	/**
	 * Gets the value of the stateName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getStateName() {
		return stateName;
	}

	/**
	 * Sets the value of the stateName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setStateName(String value) {
		this.stateName = value;
	}

}
