package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/PacketExtensionFilter.class */
public class PacketExtensionFilter implements PacketFilter {
    private String elementName;
    private String namespace;

    public PacketExtensionFilter(String elementName, String namespace) {
        this.elementName = elementName;
        this.namespace = namespace;
    }

    public PacketExtensionFilter(String namespace) {
        this(null, namespace);
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return packet.getExtension(this.elementName, this.namespace) != null;
    }
}
