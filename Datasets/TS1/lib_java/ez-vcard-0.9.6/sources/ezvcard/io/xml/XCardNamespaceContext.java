package ezvcard.io.xml;

import ezvcard.VCardVersion;
import java.util.Arrays;
import java.util.Iterator;
import javax.xml.namespace.NamespaceContext;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardNamespaceContext.class */
public class XCardNamespaceContext implements NamespaceContext {
    private final String ns;
    private final String prefix;

    public XCardNamespaceContext(VCardVersion version, String prefix) {
        this.ns = version.getXmlNamespace();
        this.prefix = prefix;
    }

    public String getPrefix() {
        return this.prefix;
    }

    @Override // javax.xml.namespace.NamespaceContext
    public String getNamespaceURI(String prefix) {
        if (this.prefix.equals(prefix)) {
            return this.ns;
        }
        return null;
    }

    @Override // javax.xml.namespace.NamespaceContext
    public String getPrefix(String ns) {
        if (this.ns.equals(ns)) {
            return this.prefix;
        }
        return null;
    }

    @Override // javax.xml.namespace.NamespaceContext
    public Iterator<String> getPrefixes(String ns) {
        if (this.ns.equals(ns)) {
            return Arrays.asList(this.prefix).iterator();
        }
        return null;
    }
}
