package org.jivesoftware.smack;

import java.io.IOException;
import java.io.Writer;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/PacketWriter.class */
class PacketWriter {
    private Thread writerThread;
    private Thread keepAliveThread;
    private Writer writer;
    private XMPPConnection connection;
    private boolean done;
    private long lastActive = System.currentTimeMillis();
    private final BlockingQueue<Packet> queue = new ArrayBlockingQueue(500, true);

    protected PacketWriter(XMPPConnection connection) {
        this.connection = connection;
        init();
    }

    protected void init() {
        this.writer = this.connection.writer;
        this.done = false;
        this.writerThread = new Thread() { // from class: org.jivesoftware.smack.PacketWriter.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                PacketWriter.this.writePackets(this);
            }
        };
        this.writerThread.setName("Smack Packet Writer (" + this.connection.connectionCounterValue + ")");
        this.writerThread.setDaemon(true);
    }

    public void sendPacket(Packet packet) {
        if (!this.done) {
            this.connection.firePacketInterceptors(packet);
            try {
                this.queue.put(packet);
                synchronized (this.queue) {
                    this.queue.notifyAll();
                }
                this.connection.firePacketSendingListeners(packet);
            } catch (InterruptedException ie) {
                ie.printStackTrace();
            }
        }
    }

    public void startup() {
        this.writerThread.start();
    }

    void startKeepAliveProcess() {
        int keepAliveInterval = SmackConfiguration.getKeepAliveInterval();
        if (keepAliveInterval > 0) {
            KeepAliveTask task = new KeepAliveTask(keepAliveInterval);
            this.keepAliveThread = new Thread(task);
            task.setThread(this.keepAliveThread);
            this.keepAliveThread.setDaemon(true);
            this.keepAliveThread.setName("Smack Keep Alive (" + this.connection.connectionCounterValue + ")");
            this.keepAliveThread.start();
        }
    }

    void setWriter(Writer writer) {
        this.writer = writer;
    }

    public void shutdown() {
        this.done = true;
        synchronized (this.queue) {
            this.queue.notifyAll();
        }
    }

    void cleanup() {
        this.connection.interceptors.clear();
        this.connection.sendListeners.clear();
    }

    private Packet nextPacket() {
        Packet packet = null;
        while (!this.done) {
            Packet poll = this.queue.poll();
            packet = poll;
            if (poll != null) {
                break;
            }
            try {
                synchronized (this.queue) {
                    this.queue.wait();
                }
            } catch (InterruptedException e) {
            }
        }
        return packet;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writePackets(Thread thisThread) {
        try {
            openStream();
            while (!this.done && this.writerThread == thisThread) {
                Packet packet = nextPacket();
                if (packet != null) {
                    synchronized (this.writer) {
                        this.writer.write(packet.toXML());
                        this.writer.flush();
                        this.lastActive = System.currentTimeMillis();
                    }
                }
            }
            try {
                synchronized (this.writer) {
                    while (!this.queue.isEmpty()) {
                        this.writer.write(this.queue.remove().toXML());
                    }
                    this.writer.flush();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.queue.clear();
            try {
                this.writer.write("</stream:stream>");
                this.writer.flush();
                try {
                    this.writer.close();
                } catch (Exception e2) {
                }
            } catch (Exception e3) {
                try {
                    this.writer.close();
                } catch (Exception e4) {
                }
            } catch (Throwable th) {
                try {
                    this.writer.close();
                } catch (Exception e5) {
                }
                throw th;
            }
        } catch (IOException ioe) {
            if (this.done) {
                return;
            }
            this.done = true;
            this.connection.packetReader.notifyConnectionError(ioe);
        }
    }

    void openStream() throws IOException {
        StringBuilder stream = new StringBuilder();
        stream.append("<stream:stream");
        stream.append(" to=\"").append(this.connection.getServiceName()).append("\"");
        stream.append(" xmlns=\"jabber:client\"");
        stream.append(" xmlns:stream=\"http://etherx.jabber.org/streams\"");
        stream.append(" version=\"1.0\">");
        this.writer.write(stream.toString());
        this.writer.flush();
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/PacketWriter$KeepAliveTask.class */
    private class KeepAliveTask implements Runnable {
        private int delay;
        private Thread thread;

        public KeepAliveTask(int delay) {
            this.delay = delay;
        }

        protected void setThread(Thread thread) {
            this.thread = thread;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                Thread.sleep(15000L);
            } catch (InterruptedException e) {
            }
            while (!PacketWriter.this.done && PacketWriter.this.keepAliveThread == this.thread) {
                synchronized (PacketWriter.this.writer) {
                    if (System.currentTimeMillis() - PacketWriter.this.lastActive >= this.delay) {
                        try {
                            PacketWriter.this.writer.write(" ");
                            PacketWriter.this.writer.flush();
                        } catch (Exception e2) {
                        }
                    }
                }
                try {
                    Thread.sleep(this.delay);
                } catch (InterruptedException e3) {
                }
            }
        }
    }
}
