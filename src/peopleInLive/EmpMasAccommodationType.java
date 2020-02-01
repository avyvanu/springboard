package peopleInLive;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasAccommodationType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasAccommodationType&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;AccommodationTypeCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;AccommodationTypeName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasAccommodationType", propOrder = {
		"accommodationTypeCode", "accommodationTypeName" })
public class EmpMasAccommodationType {

	@XmlElement(name = "AccommodationTypeCode")
	protected int accommodationTypeCode;
	@XmlElement(name = "AccommodationTypeName")
	protected String accommodationTypeName;

	/**
	 * Gets the value of the accommodationTypeCode property.
	 * 
	 */
	public int getAccommodationTypeCode() {
		return accommodationTypeCode;
	}

	/**
	 * Sets the value of the accommodationTypeCode property.
	 * 
	 */
	public void setAccommodationTypeCode(int value) {
		this.accommodationTypeCode = value;
	}

	/**
	 * Gets the value of the accommodationTypeName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getAccommodationTypeName() {
		return accommodationTypeName;
	}

	/**
	 * Sets the value of the accommodationTypeName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setAccommodationTypeName(String value) {
		this.accommodationTypeName = value;
	}

}
