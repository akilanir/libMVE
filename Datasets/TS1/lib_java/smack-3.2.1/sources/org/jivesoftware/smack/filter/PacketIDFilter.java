package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/PacketIDFilter.class */
public class PacketIDFilter implements PacketFilter {
    private String packetID;

    public PacketIDFilter(String packetID) {
        if (packetID == null) {
            throw new IllegalArgumentException("Packet ID cannot be null.");
        }
        this.packetID = packetID;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return this.packetID.equals(packet.getPacketID());
    }

    public String toString() {
        return "PacketIDFilter by id: " + this.packetID;
    }
}
