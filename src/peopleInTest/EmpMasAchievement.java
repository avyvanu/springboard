package peopleInTest;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for EmpMasAchievement complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name=&quot;EmpMasAchievement&quot;&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base=&quot;{http://www.w3.org/2001/XMLSchema}anyType&quot;&gt;
 *       &lt;sequence&gt;
 *         &lt;element name=&quot;AchievementCode&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}int&quot;/&gt;
 *         &lt;element name=&quot;AchievementName&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}string&quot; minOccurs=&quot;0&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EmpMasAchievement", propOrder = { "achievementCode",
		"achievementName" })
public class EmpMasAchievement {

	@XmlElement(name = "AchievementCode")
	protected int achievementCode;
	@XmlElement(name = "AchievementName")
	protected String achievementName;

	/**
	 * Gets the value of the achievementCode property.
	 * 
	 */
	public int getAchievementCode() {
		return achievementCode;
	}

	/**
	 * Sets the value of the achievementCode property.
	 * 
	 */
	public void setAchievementCode(int value) {
		this.achievementCode = value;
	}

	/**
	 * Gets the value of the achievementName property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getAchievementName() {
		return achievementName;
	}

	/**
	 * Sets the value of the achievementName property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setAchievementName(String value) {
		this.achievementName = value;
	}

}
