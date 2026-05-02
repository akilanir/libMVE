package org.jivesoftware.smack.packet;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/DefaultPacketExtension.class */
public class DefaultPacketExtension implements PacketExtension {
    private String elementName;
    private String namespace;
    private Map<String, String> map;

    public DefaultPacketExtension(String elementName, String namespace) {
        this.elementName = elementName;
        this.namespace = namespace;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return this.elementName;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return this.namespace;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder buf = new StringBuilder();
        buf.append("<").append(this.elementName).append(" xmlns=\"").append(this.namespace).append("\">");
        for (String name : getNames()) {
            String value = getValue(name);
            buf.append("<").append(name).append(">");
            buf.append(value);
            buf.append("</").append(name).append(">");
        }
        buf.append("</").append(this.elementName).append(">");
        return buf.toString();
    }

    public synchronized Collection<String> getNames() {
        if (this.map == null) {
            return Collections.emptySet();
        }
        return Collections.unmodifiableSet(new HashMap(this.map).keySet());
    }

    public synchronized String getValue(String name) {
        if (this.map == null) {
            return null;
        }
        return this.map.get(name);
    }

    public synchronized void setValue(String name, String value) {
        if (this.map == null) {
            this.map = new HashMap();
        }
        this.map.put(name, value);
    }
}
