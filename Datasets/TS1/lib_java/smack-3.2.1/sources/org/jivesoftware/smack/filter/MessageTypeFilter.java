package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/MessageTypeFilter.class */
public class MessageTypeFilter implements PacketFilter {
    private final Message.Type type;

    public MessageTypeFilter(Message.Type type) {
        this.type = type;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        if (!(packet instanceof Message)) {
            return false;
        }
        return ((Message) packet).getType().equals(this.type);
    }
}
