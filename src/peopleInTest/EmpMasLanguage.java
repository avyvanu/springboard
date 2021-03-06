package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasLanguage complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasLanguage&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;LanguageCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;LanguageName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasLanguage", propOrder = { "languageCode", "languageName" })
public class EmpMasLanguage {

	@XmlElement(name = "LanguageCode")
	protected int languageCode;
	@XmlElement(name = "LanguageName")
	protected String languageName;

	/**
	 * Gets the value of the languageCode property.
	 * 
	 */
	public int getLanguageCode() {
		return languageCode;
	}

	/**
	 * Sets the value of the languageCode property.
	 * 
	 */
	public void setLanguageCode(int value) {
		this.languageCode = value;
	}

	/**
	 * Gets the value of the languageName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getLanguageName() {
		return languageName;
	}

	/**
	 * Sets the value of the languageName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setLanguageName(String value) {
		this.languageName = value;
	}

}
