package org.jivesoftware.smack.packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/PacketExtension.class */
public interface PacketExtension {
    String getElementName();

    String getNamespace();

    String toXML();
}
