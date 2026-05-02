package zmq;

import java.io.Closeable;
import java.io.IOException;
import java.nio.channels.SelectableChannel;

/* loaded from: jeromq-0.3.5.jar:zmq/IOThread.class */
public class IOThread extends ZObject implements IPollEvents, Closeable {
    private final Mailbox mailbox;
    private final SelectableChannel mailboxHandle;
    private final Poller poller;
    final String name;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !IOThread.class.desiredAssertionStatus();
    }

    public IOThread(Ctx ctx, int tid) {
        super(ctx, tid);
        this.name = "iothread-" + tid;
        this.poller = new Poller(this.name);
        this.mailbox = new Mailbox(this.name);
        this.mailboxHandle = this.mailbox.getFd();
        this.poller.addHandle(this.mailboxHandle, this);
        this.poller.setPollIn(this.mailboxHandle);
    }

    public void start() {
        this.poller.start();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.poller.destroy();
        this.mailbox.close();
    }

    public void stop() {
        sendStop();
    }

    public Mailbox getMailbox() {
        return this.mailbox;
    }

    public int getLoad() {
        return this.poller.getLoad();
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

    public Poller getPoller() {
        if ($assertionsDisabled || this.poller != null) {
            return this.poller;
        }
        throw new AssertionError();
    }

    @Override // zmq.ZObject
    protected void processStop() {
        this.poller.removeHandle(this.mailboxHandle);
        this.poller.stop();
    }
}
