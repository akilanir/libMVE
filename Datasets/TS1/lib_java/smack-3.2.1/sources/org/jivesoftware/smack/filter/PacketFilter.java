package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/PacketFilter.class */
public interface PacketFilter {
    boolean accept(Packet packet);
}
