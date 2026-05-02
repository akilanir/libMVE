package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/NotFilter.class */
public class NotFilter implements PacketFilter {
    private PacketFilter filter;

    public NotFilter(PacketFilter filter) {
        if (filter == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.filter = filter;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return !this.filter.accept(packet);
    }
}
