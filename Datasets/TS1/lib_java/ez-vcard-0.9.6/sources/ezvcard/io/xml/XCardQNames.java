package ezvcard.io.xml;

import ezvcard.VCardVersion;
import ezvcard.property.Kind;
import javax.xml.namespace.QName;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardQNames.class */
public interface XCardQNames {
    public static final String NAMESPACE = VCardVersion.V4_0.getXmlNamespace();
    public static final QName VCARDS = new QName(NAMESPACE, "vcards");
    public static final QName VCARD = new QName(NAMESPACE, "vcard");
    public static final QName GROUP = new QName(NAMESPACE, Kind.GROUP);
    public static final QName PARAMETERS = new QName(NAMESPACE, "parameters");
}
