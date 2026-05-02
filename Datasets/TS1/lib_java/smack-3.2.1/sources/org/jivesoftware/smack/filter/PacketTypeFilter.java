package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/PacketTypeFilter.class */
public class PacketTypeFilter implements PacketFilter {
    Class packetType;

    public PacketTypeFilter(Class packetType) {
        if (!Packet.class.isAssignableFrom(packetType)) {
            throw new IllegalArgumentException("Packet type must be a sub-class of Packet.");
        }
        this.packetType = packetType;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return this.packetType.isInstance(packet);
    }

    public String toString() {
        return "PacketTypeFilter: " + this.packetType.getName();
    }
}
