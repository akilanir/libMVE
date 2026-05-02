package zmq;

import java.util.ArrayDeque;
import java.util.Deque;
import zmq.Mtrie;

/* loaded from: jeromq-0.3.5.jar:zmq/XPub.class */
class XPub extends SocketBase {
    private final Mtrie subscriptions;
    private final Dist dist;
    boolean verbose;
    private boolean more;
    private final Deque<Blob> pendingData;
    private final Deque<Integer> pendingFlags;
    private static Mtrie.IMtrieHandler markAsMatching;
    private static Mtrie.IMtrieHandler sendUnsubscription;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !XPub.class.desiredAssertionStatus();
        markAsMatching = new Mtrie.IMtrieHandler() { // from class: zmq.XPub.1
            @Override // zmq.Mtrie.IMtrieHandler
            public void invoke(Pipe pipe, byte[] data, int size, Object arg) {
                XPub self = (XPub) arg;
                self.dist.match(pipe);
            }
        };
        sendUnsubscription = new Mtrie.IMtrieHandler() { // from class: zmq.XPub.2
            @Override // zmq.Mtrie.IMtrieHandler
            public void invoke(Pipe pipe, byte[] data, int size, Object arg) {
                XPub self = (XPub) arg;
                if (self.options.type != 1) {
                    byte[] unsub = new byte[size + 1];
                    unsub[0] = 0;
                    System.arraycopy(data, 0, unsub, 1, size);
                    self.pendingData.add(Blob.createBlob(unsub, false));
                    self.pendingFlags.add(0);
                }
            }
        };
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/XPub$XPubSession.class */
    public static class XPubSession extends SessionBase {
        @Override // zmq.SessionBase, zmq.IPollEvents
        public /* bridge */ /* synthetic */ void acceptEvent() {
            super.acceptEvent();
        }

        @Override // zmq.SessionBase, zmq.IPollEvents
        public /* bridge */ /* synthetic */ void connectEvent() {
            super.connectEvent();
        }

        @Override // zmq.SessionBase, zmq.IPollEvents
        public /* bridge */ /* synthetic */ void outEvent() {
            super.outEvent();
        }

        @Override // zmq.SessionBase, zmq.IPollEvents
        public /* bridge */ /* synthetic */ void inEvent() {
            super.inEvent();
        }

        @Override // zmq.SessionBase
        public /* bridge */ /* synthetic */ String toString() {
            return super.toString();
        }

        @Override // zmq.SessionBase, zmq.IPollEvents
        public /* bridge */ /* synthetic */ void timerEvent(int x0) {
            super.timerEvent(x0);
        }

        @Override // zmq.SessionBase
        public /* bridge */ /* synthetic */ void detach() {
            super.detach();
        }

        @Override // zmq.SessionBase
        public /* bridge */ /* synthetic */ SocketBase getSocket() {
            return super.getSocket();
        }

        @Override // zmq.SessionBase, zmq.Pipe.IPipeEvents
        public /* bridge */ /* synthetic */ void hiccuped(Pipe x0) {
            super.hiccuped(x0);
        }

        @Override // zmq.SessionBase, zmq.Pipe.IPipeEvents
        public /* bridge */ /* synthetic */ void writeActivated(Pipe x0) {
            super.writeActivated(x0);
        }

        @Override // zmq.SessionBase, zmq.Pipe.IPipeEvents
        public /* bridge */ /* synthetic */ void readActivated(Pipe x0) {
            super.readActivated(x0);
        }

        @Override // zmq.SessionBase, zmq.Pipe.IPipeEvents
        public /* bridge */ /* synthetic */ void pipeTerminated(Pipe x0) {
            super.pipeTerminated(x0);
        }

        @Override // zmq.SessionBase
        public /* bridge */ /* synthetic */ void flush() {
            super.flush();
        }

        @Override // zmq.SessionBase, zmq.IMsgSink
        public /* bridge */ /* synthetic */ int pushMsg(Msg x0) {
            return super.pushMsg(x0);
        }

        @Override // zmq.SessionBase, zmq.IMsgSource
        public /* bridge */ /* synthetic */ Msg pullMsg() {
            return super.pullMsg();
        }

        @Override // zmq.SessionBase
        public /* bridge */ /* synthetic */ void attachPipe(Pipe x0) {
            super.attachPipe(x0);
        }

        @Override // zmq.SessionBase, zmq.Own
        public /* bridge */ /* synthetic */ void destroy() {
            super.destroy();
        }

        @Override // zmq.Own
        public /* bridge */ /* synthetic */ void unregisterTermAck() {
            super.unregisterTermAck();
        }

        @Override // zmq.Own
        public /* bridge */ /* synthetic */ void registerTermAcks(int x0) {
            super.registerTermAcks(x0);
        }

        public XPubSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    public XPub(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.options.type = 9;
        this.verbose = false;
        this.more = false;
        this.subscriptions = new Mtrie();
        this.dist = new Dist();
        this.pendingData = new ArrayDeque();
        this.pendingFlags = new ArrayDeque();
    }

    @Override // zmq.SocketBase
    protected void xattachPipe(Pipe pipe, boolean icanhasall) {
        if (!$assertionsDisabled && pipe == null) {
            throw new AssertionError();
        }
        this.dist.attach(pipe);
        if (icanhasall) {
            this.subscriptions.add(null, pipe);
        }
        xreadActivated(pipe);
    }

    @Override // zmq.SocketBase
    protected void xreadActivated(Pipe pipe) {
        boolean unique;
        while (true) {
            Msg sub = pipe.read();
            if (sub != null) {
                byte[] data = sub.data();
                int size = sub.size();
                if (size > 0 && (data[0] == 0 || data[0] == 1)) {
                    if (data[0] == 0) {
                        unique = this.subscriptions.rm(data, 1, pipe);
                    } else {
                        unique = this.subscriptions.add(data, 1, pipe);
                    }
                    if (this.options.type == 9 && (unique || (data[0] == 1 && this.verbose))) {
                        this.pendingData.add(Blob.createBlob(data, true));
                        this.pendingFlags.add(0);
                    }
                } else {
                    this.pendingData.add(Blob.createBlob(data, true));
                    this.pendingFlags.add(Integer.valueOf(sub.flags()));
                }
            } else {
                return;
            }
        }
    }

    @Override // zmq.SocketBase
    protected void xwriteActivated(Pipe pipe) {
        this.dist.activated(pipe);
    }

    @Override // zmq.SocketBase
    public boolean xsetsockopt(int option, Object optval) {
        if (option != 40) {
            return false;
        }
        this.verbose = ((Integer) optval).intValue() == 1;
        return true;
    }

    @Override // zmq.SocketBase
    protected void xpipeTerminated(Pipe pipe) {
        this.subscriptions.rm(pipe, sendUnsubscription, this);
        this.dist.terminated(pipe);
    }

    @Override // zmq.SocketBase
    protected boolean xsend(Msg msg) {
        boolean msgMore = msg.hasMore();
        if (!this.more) {
            this.subscriptions.match(msg.data(), msg.size(), markAsMatching, this);
        }
        boolean rc = this.dist.sendToMatching(msg);
        if (!rc) {
            return false;
        }
        if (!msgMore) {
            this.dist.unmatch();
        }
        this.more = msgMore;
        return true;
    }

    @Override // zmq.SocketBase
    protected boolean xhasOut() {
        return this.dist.hasOut();
    }

    @Override // zmq.SocketBase
    protected Msg xrecv() {
        if (this.pendingData.isEmpty()) {
            this.errno.set(35);
            return null;
        }
        Blob first = this.pendingData.pollFirst();
        Msg msg = new Msg(first.data());
        int flags = this.pendingFlags.pollFirst().intValue();
        msg.setFlags(flags);
        return msg;
    }

    @Override // zmq.SocketBase
    protected boolean xhasIn() {
        return !this.pendingData.isEmpty();
    }
}
