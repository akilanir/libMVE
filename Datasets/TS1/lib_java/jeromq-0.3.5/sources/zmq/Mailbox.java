package zmq;

import java.io.Closeable;
import java.io.IOException;
import java.nio.channels.SelectableChannel;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: jeromq-0.3.5.jar:zmq/Mailbox.class */
public class Mailbox implements Closeable {
    private boolean active;
    private final String name;
    static final /* synthetic */ boolean $assertionsDisabled;
    private final YPipe<Command> cpipe = new YPipe<>(Config.COMMAND_PIPE_GRANULARITY.getValue());
    private final Lock sync = new ReentrantLock();
    private final Signaler signaler = new Signaler();

    static {
        $assertionsDisabled = !Mailbox.class.desiredAssertionStatus();
    }

    public Mailbox(String name) {
        Command cmd = this.cpipe.read();
        if (!$assertionsDisabled && cmd != null) {
            throw new AssertionError();
        }
        this.active = false;
        this.name = name;
    }

    public SelectableChannel getFd() {
        return this.signaler.getFd();
    }

    public void send(Command cmd) {
        this.sync.lock();
        try {
            this.cpipe.write(cmd, false);
            boolean ok = this.cpipe.flush();
            this.sync.unlock();
            if (!ok) {
                this.signaler.send();
            }
        } catch (Throwable th) {
            this.sync.unlock();
            throw th;
        }
    }

    public Command recv(long timeout) {
        if (this.active) {
            Command cmd = this.cpipe.read();
            if (cmd != null) {
                return cmd;
            }
            this.active = false;
            this.signaler.recv();
        }
        boolean rc = this.signaler.waitEvent(timeout);
        if (!rc) {
            return null;
        }
        this.active = true;
        Command cmd2 = this.cpipe.read();
        if ($assertionsDisabled || cmd2 != null) {
            return cmd2;
        }
        throw new AssertionError();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.sync.lock();
        this.sync.unlock();
        this.signaler.close();
    }

    public String toString() {
        return super.toString() + "[" + this.name + "]";
    }
}
