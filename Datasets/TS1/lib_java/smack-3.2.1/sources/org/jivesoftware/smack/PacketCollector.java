package org.jivesoftware.smack;

import java.util.LinkedList;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/PacketCollector.class */
public class PacketCollector {
    private int maxPackets;
    private PacketFilter packetFilter;
    private LinkedList<Packet> resultQueue;
    private Connection conection;
    private boolean cancelled;

    protected PacketCollector(Connection conection, PacketFilter packetFilter) {
        this.maxPackets = SmackConfiguration.getPacketCollectorSize();
        this.cancelled = false;
        this.conection = conection;
        this.packetFilter = packetFilter;
        this.resultQueue = new LinkedList<>();
    }

    protected PacketCollector(Connection conection, PacketFilter packetFilter, int maxSize) {
        this(conection, packetFilter);
        this.maxPackets = maxSize;
    }

    public void cancel() {
        if (!this.cancelled) {
            this.cancelled = true;
            this.conection.removePacketCollector(this);
        }
    }

    public PacketFilter getPacketFilter() {
        return this.packetFilter;
    }

    public synchronized Packet pollResult() {
        if (this.resultQueue.isEmpty()) {
            return null;
        }
        return this.resultQueue.removeLast();
    }

    public synchronized Packet nextResult() {
        while (this.resultQueue.isEmpty()) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
        return this.resultQueue.removeLast();
    }

    public synchronized Packet nextResult(long timeout) {
        if (this.resultQueue.isEmpty()) {
            long waitTime = timeout;
            long start = System.currentTimeMillis();
            while (this.resultQueue.isEmpty() && waitTime > 0) {
                try {
                    wait(waitTime);
                    long now = System.currentTimeMillis();
                    waitTime -= now - start;
                    start = now;
                } catch (InterruptedException e) {
                }
            }
            if (this.resultQueue.isEmpty()) {
                return null;
            }
            return this.resultQueue.removeLast();
        }
        return this.resultQueue.removeLast();
    }

    protected synchronized void processPacket(Packet packet) {
        if (packet == null) {
            return;
        }
        if (this.packetFilter == null || this.packetFilter.accept(packet)) {
            if (this.resultQueue.size() == this.maxPackets) {
                this.resultQueue.removeLast();
            }
            this.resultQueue.addFirst(packet);
            notifyAll();
        }
    }
}
