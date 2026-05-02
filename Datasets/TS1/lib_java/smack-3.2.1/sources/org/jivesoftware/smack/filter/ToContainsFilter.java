package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/ToContainsFilter.class */
public class ToContainsFilter implements PacketFilter {
    private String to;

    public ToContainsFilter(String to) {
        if (to == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.to = to.toLowerCase();
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return (packet.getTo() == null || packet.getTo().toLowerCase().indexOf(this.to) == -1) ? false : true;
    }
}
