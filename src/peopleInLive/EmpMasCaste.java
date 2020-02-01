package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasCaste complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasCaste&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;CasteCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CasteName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasCaste", propOrder = { "casteCode", "casteName" })
public class EmpMasCaste {

	@XmlElement(name = "CasteCode")
	protected int casteCode;
	@XmlElement(name = "CasteName")
	protected String casteName;

	/**
	 * Gets the value of the casteCode property.
	 * 
	 */
	public int getCasteCode() {
		return casteCode;
	}

	/**
	 * Sets the value of the casteCode property.
	 * 
	 */
	public void setCasteCode(int value) {
		this.casteCode = value;
	}

	/**
	 * Gets the value of the casteName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCasteName() {
		return casteName;
	}

	/**
	 * Sets the value of the casteName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCasteName(String value) {
		this.casteName = value;
	}

}
