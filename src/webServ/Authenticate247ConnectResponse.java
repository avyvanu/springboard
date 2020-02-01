package webServ;

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
 *         &lt;element name=&quot;Authenticate247ConnectResult&quot; type=&quot;{http://www.w3.org/2001/XMLSchema}boolean&quot;/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "authenticate247ConnectResult" })
@XmlRootElement(name = "Authenticate247ConnectResponse")
public class Authenticate247ConnectResponse {

	@XmlElement(name = "Authenticate247ConnectResult")
	protected boolean authenticate247ConnectResult;

	/**
	 * Gets the value of the authenticate247ConnectResult property.
	 * 
	 */
	public boolean isAuthenticate247ConnectResult() {
		return authenticate247ConnectResult;
	}

	/**
	 * Sets the value of the authenticate247ConnectResult property.
	 * 
	 */
	public void setAuthenticate247ConnectResult(boolean value) {
		this.authenticate247ConnectResult = value;
	}

}
