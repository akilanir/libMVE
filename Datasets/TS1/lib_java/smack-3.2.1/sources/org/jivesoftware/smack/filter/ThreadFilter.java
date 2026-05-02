package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/ThreadFilter.class */
public class ThreadFilter implements PacketFilter {
    private String thread;

    public ThreadFilter(String thread) {
        if (thread == null) {
            throw new IllegalArgumentException("Thread cannot be null.");
        }
        this.thread = thread;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return (packet instanceof Message) && this.thread.equals(((Message) packet).getThread());
    }
}
