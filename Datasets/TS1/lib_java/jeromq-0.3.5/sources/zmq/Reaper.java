package zmq;

import java.io.Closeable;
import java.io.IOException;
import java.nio.channels.SelectableChannel;

/* loaded from: jeromq-0.3.5.jar:zmq/Reaper.class */
public class Reaper extends ZObject implements IPollEvents, Closeable {
    private final Mailbox mailbox;
    private SelectableChannel mailboxHandle;
    private final Poller poller;
    private int sockets;
    private volatile boolean terminating;
    private String name;

    public Reaper(Ctx ctx, int tid) {
        super(ctx, tid);
        this.sockets = 0;
        this.terminating = false;
        this.name = "reaper-" + tid;
        this.poller = new Poller(this.name);
        this.mailbox = new Mailbox(this.name);
        this.mailboxHandle = this.mailbox.getFd();
        this.poller.addHandle(this.mailboxHandle, this);
        this.poller.setPollIn(this.mailboxHandle);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.poller.destroy();
        this.mailbox.close();
    }

    public Mailbox getMailbox() {
        return this.mailbox;
    }

    public void start() {
        this.poller.start();
    }

    public void stop() {
        if (!this.terminating) {
            sendStop();
        }
    }

    @Override // zmq.IPollEvents
    public void inEvent() {
        while (true) {
            Command cmd = this.mailbox.recv(0L);
            if (cmd != null) {
                cmd.destination().processCommand(cmd);
            } else {
                return;
            }
        }
    }

    @Override // zmq.IPollEvents
    public void outEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void connectEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void acceptEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void timerEvent(int id) {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.ZObject
    protected void processStop() {
        this.terminating = true;
        if (this.sockets == 0) {
            sendDone();
            this.poller.removeHandle(this.mailboxHandle);
            this.poller.stop();
        }
    }

    @Override // zmq.ZObject
    protected void processReap(SocketBase socket) {
        socket.startReaping(this.poller);
        this.sockets++;
    }

    @Override // zmq.ZObject
    protected void processReaped() {
        this.sockets--;
        if (this.sockets == 0 && this.terminating) {
            sendDone();
            this.poller.removeHandle(this.mailboxHandle);
            this.poller.stop();
        }
    }
}
