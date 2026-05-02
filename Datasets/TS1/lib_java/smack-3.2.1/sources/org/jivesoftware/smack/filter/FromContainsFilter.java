package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/FromContainsFilter.class */
public class FromContainsFilter implements PacketFilter {
    private String from;

    public FromContainsFilter(String from) {
        if (from == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.from = from.toLowerCase();
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return (packet.getFrom() == null || packet.getFrom().toLowerCase().indexOf(this.from) == -1) ? false : true;
    }
}
