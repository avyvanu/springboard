package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasCity complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasCity&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;StateCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CityCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;CityName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasCity", propOrder = { "stateCode", "cityCode", "cityName" })
public class EmpMasCity {

	@XmlElement(name = "StateCode")
	protected int stateCode;
	@XmlElement(name = "CityCode")
	protected int cityCode;
	@XmlElement(name = "CityName")
	protected String cityName;

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
	 * Gets the value of the cityCode property.
	 * 
	 */
	public int getCityCode() {
		return cityCode;
	}

	/**
	 * Sets the value of the cityCode property.
	 * 
	 */
	public void setCityCode(int value) {
		this.cityCode = value;
	}

	/**
	 * Gets the value of the cityName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCityName() {
		return cityName;
	}

	/**
	 * Sets the value of the cityName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCityName(String value) {
		this.cityName = value;
	}

}
