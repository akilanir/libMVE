package zmq;

import java.io.Closeable;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.Pipe;
import java.nio.channels.SelectableChannel;
import java.nio.channels.Selector;
import java.util.concurrent.atomic.AtomicInteger;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/Signaler.class */
public class Signaler implements Closeable {
    private final Pipe.SinkChannel w;
    private final Pipe.SourceChannel r;
    private final Selector selector;
    private final AtomicInteger wcursor = new AtomicInteger(0);
    private int rcursor = 0;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Signaler.class.desiredAssertionStatus();
    }

    public Signaler() {
        try {
            java.nio.channels.Pipe pipe = java.nio.channels.Pipe.open();
            this.r = pipe.source();
            this.w = pipe.sink();
            try {
                Utils.unblockSocket(this.w);
                Utils.unblockSocket(this.r);
                try {
                    this.selector = Selector.open();
                    this.r.register(this.selector, 1);
                } catch (IOException e) {
                    throw new ZError.IOException(e);
                }
            } catch (IOException e2) {
                throw new ZError.IOException(e2);
            }
        } catch (IOException e3) {
            throw new ZError.IOException(e3);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        IOException exception = null;
        try {
            this.r.close();
        } catch (IOException e) {
            exception = e;
        }
        try {
            this.w.close();
        } catch (IOException e2) {
            exception = e2;
        }
        try {
            this.selector.close();
        } catch (IOException e3) {
            exception = e3;
        }
        if (exception != null) {
            throw exception;
        }
    }

    public SelectableChannel getFd() {
        return this.r;
    }

    public void send() {
        int nbytes;
        ByteBuffer dummy = ByteBuffer.allocate(1);
        do {
            try {
                Thread.interrupted();
                nbytes = this.w.write(dummy);
            } catch (IOException e) {
                throw new ZError.IOException(e);
            }
        } while (nbytes == 0);
        if (!$assertionsDisabled && nbytes != 1) {
            throw new AssertionError();
        }
        this.wcursor.incrementAndGet();
    }

    public boolean waitEvent(long timeout) {
        int rc;
        try {
            if (timeout == 0) {
                return this.rcursor < this.wcursor.get();
            }
            if (timeout < 0) {
                rc = this.selector.select(0L);
            } else {
                rc = this.selector.select(timeout);
            }
            if (rc == 0) {
                return false;
            }
            this.selector.selectedKeys().clear();
            return true;
        } catch (IOException e) {
            throw new ZError.IOException(e);
        }
    }

    public void recv() {
        try {
            ByteBuffer dummy = ByteBuffer.allocate(1);
            int nbytes = this.r.read(dummy);
            if (!$assertionsDisabled && nbytes != 1) {
                throw new AssertionError();
            }
            this.rcursor++;
        } catch (IOException e) {
            throw new ZError.IOException(e);
        }
    }
}
