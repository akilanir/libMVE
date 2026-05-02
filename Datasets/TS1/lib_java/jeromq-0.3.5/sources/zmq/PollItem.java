package zmq;

import java.nio.channels.SelectableChannel;
import java.nio.channels.SelectionKey;

/* loaded from: jeromq-0.3.5.jar:zmq/PollItem.class */
public class PollItem {
    private SocketBase socket;
    private SelectableChannel channel;
    private int zinterest;
    private int interest;
    private int ready;

    public PollItem(SocketBase socket) {
        this.socket = socket;
        this.channel = null;
        this.zinterest = -1;
        this.interest = -1;
    }

    public PollItem(SocketBase socket, int ops) {
        this.socket = socket;
        this.channel = null;
        init(ops);
    }

    public PollItem(SelectableChannel channel, int ops) {
        this.socket = null;
        this.channel = channel;
        init(ops);
    }

    private void init(int ops) {
        this.zinterest = ops;
        int interest = 0;
        if ((ops & 1) > 0) {
            interest = 0 | 1;
        }
        if ((ops & 2) > 0) {
            if (this.socket != null) {
                interest |= 1;
            } else {
                interest |= 4;
            }
        }
        this.interest = interest;
        this.ready = 0;
    }

    public final boolean isReadable() {
        return (this.ready & 1) > 0;
    }

    public final boolean isWritable() {
        return (this.ready & 2) > 0;
    }

    public final boolean isError() {
        return (this.ready & 4) > 0;
    }

    public final SocketBase getSocket() {
        return this.socket;
    }

    public final SelectableChannel getRawSocket() {
        return this.channel;
    }

    protected final SelectableChannel getChannel() {
        if (this.socket != null) {
            return this.socket.getFD();
        }
        return this.channel;
    }

    public final int interestOps() {
        return this.interest;
    }

    public final int interestOps(int ops) {
        init(ops);
        return this.interest;
    }

    public final int readyOps(SelectionKey key, int nevents) {
        this.ready = 0;
        if (this.socket != null) {
            int events = this.socket.getSocketOpt(15);
            if (events < 0) {
                return -1;
            }
            if ((this.zinterest & 2) > 0 && (events & 2) > 0) {
                this.ready |= 2;
            }
            if ((this.zinterest & 1) > 0 && (events & 1) > 0) {
                this.ready |= 1;
            }
        } else if (nevents > 0) {
            if (key.isReadable()) {
                this.ready |= 1;
            }
            if (key.isWritable()) {
                this.ready |= 2;
            }
            if (!key.isValid() || key.isAcceptable() || key.isConnectable()) {
                this.ready |= 4;
            }
        }
        return this.ready;
    }

    public final int readyOps() {
        return this.ready;
    }
}
