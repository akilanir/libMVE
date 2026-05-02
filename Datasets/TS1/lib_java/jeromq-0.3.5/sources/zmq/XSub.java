package zmq;

import zmq.Trie;

/* loaded from: jeromq-0.3.5.jar:zmq/XSub.class */
public class XSub extends SocketBase {
    private final FQ fq;
    private final Dist dist;
    private final Trie subscriptions;
    private boolean hashMessage;
    private Msg message;
    private boolean more;
    private static Trie.ITrieHandler sendSubscription;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !XSub.class.desiredAssertionStatus();
        sendSubscription = new Trie.ITrieHandler() { // from class: zmq.XSub.1
            @Override // zmq.Trie.ITrieHandler
            public void added(byte[] data, int size, Object arg) {
                Pipe pipe = (Pipe) arg;
                Msg msg = new Msg(size + 1);
                msg.put((byte) 1).put(data, 0, size);
                pipe.write(msg);
            }
        };
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/XSub$XSubSession.class */
    public static class XSubSession extends SessionBase {
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

        public XSubSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    public XSub(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.options.type = 10;
        this.hashMessage = false;
        this.more = false;
        this.options.linger = 0;
        this.fq = new FQ();
        this.dist = new Dist();
        this.subscriptions = new Trie();
    }

    @Override // zmq.SocketBase
    protected void xattachPipe(Pipe pipe, boolean icanhasall) {
        if (!$assertionsDisabled && pipe == null) {
            throw new AssertionError();
        }
        this.fq.attach(pipe);
        this.dist.attach(pipe);
        this.subscriptions.apply(sendSubscription, pipe);
        pipe.flush();
    }

    @Override // zmq.SocketBase
    protected void xreadActivated(Pipe pipe) {
        this.fq.activated(pipe);
    }

    @Override // zmq.SocketBase
    protected void xwriteActivated(Pipe pipe) {
        this.dist.activated(pipe);
    }

    @Override // zmq.SocketBase
    protected void xpipeTerminated(Pipe pipe) {
        this.fq.terminated(pipe);
        this.dist.terminated(pipe);
    }

    @Override // zmq.SocketBase
    protected void xhiccuped(Pipe pipe) {
        this.subscriptions.apply(sendSubscription, pipe);
        pipe.flush();
    }

    @Override // zmq.SocketBase
    protected boolean xsend(Msg msg) {
        byte[] data = msg.data();
        if (data.length < 1 || (data[0] != 0 && data[0] != 1)) {
            throw new IllegalArgumentException("subscription flag");
        }
        if (data[0] == 1) {
            this.subscriptions.add(data, 1);
            return this.dist.sendToAll(msg);
        }
        if (this.subscriptions.rm(data, 1)) {
            return this.dist.sendToAll(msg);
        }
        return true;
    }

    @Override // zmq.SocketBase
    protected boolean xhasOut() {
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0048, code lost:
    
        r3.more = r4.hasMore();
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0051, code lost:
    
        return r4;
     */
    @Override // zmq.SocketBase
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected zmq.Msg xrecv() {
        /*
            r3 = this;
            r0 = 0
            r4 = r0
            r0 = r3
            boolean r0 = r0.hashMessage
            if (r0 == 0) goto L1d
            r0 = r3
            zmq.Msg r0 = r0.message
            r4 = r0
            r0 = r3
            r1 = 0
            r0.hashMessage = r1
            r0 = r3
            r1 = r4
            boolean r1 = r1.hasMore()
            r0.more = r1
            r0 = r4
            return r0
        L1d:
            r0 = r3
            zmq.FQ r0 = r0.fq
            r1 = r3
            zmq.ValueReference<java.lang.Integer> r1 = r1.errno
            zmq.Msg r0 = r0.recv(r1)
            r4 = r0
            r0 = r4
            if (r0 != 0) goto L2f
            r0 = 0
            return r0
        L2f:
            r0 = r3
            boolean r0 = r0.more
            if (r0 != 0) goto L48
            r0 = r3
            zmq.Options r0 = r0.options
            boolean r0 = r0.filter
            if (r0 == 0) goto L48
            r0 = r3
            r1 = r4
            boolean r0 = r0.match(r1)
            if (r0 == 0) goto L52
        L48:
            r0 = r3
            r1 = r4
            boolean r1 = r1.hasMore()
            r0.more = r1
            r0 = r4
            return r0
        L52:
            r0 = r4
            boolean r0 = r0.hasMore()
            if (r0 == 0) goto L1d
            r0 = r3
            zmq.FQ r0 = r0.fq
            r1 = r3
            zmq.ValueReference<java.lang.Integer> r1 = r1.errno
            zmq.Msg r0 = r0.recv(r1)
            r4 = r0
            boolean r0 = zmq.XSub.$assertionsDisabled
            if (r0 != 0) goto L52
            r0 = r4
            if (r0 != 0) goto L52
            java.lang.AssertionError r0 = new java.lang.AssertionError
            r1 = r0
            r1.<init>()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: zmq.XSub.xrecv():zmq.Msg");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x003f, code lost:
    
        r4.hashMessage = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0045, code lost:
    
        return true;
     */
    @Override // zmq.SocketBase
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected boolean xhasIn() {
        /*
            r4 = this;
            r0 = r4
            boolean r0 = r0.more
            if (r0 == 0) goto L9
            r0 = 1
            return r0
        L9:
            r0 = r4
            boolean r0 = r0.hashMessage
            if (r0 == 0) goto L12
            r0 = 1
            return r0
        L12:
            r0 = r4
            r1 = r4
            zmq.FQ r1 = r1.fq
            r2 = r4
            zmq.ValueReference<java.lang.Integer> r2 = r2.errno
            zmq.Msg r1 = r1.recv(r2)
            r0.message = r1
            r0 = r4
            zmq.Msg r0 = r0.message
            if (r0 != 0) goto L2a
            r0 = 0
            return r0
        L2a:
            r0 = r4
            zmq.Options r0 = r0.options
            boolean r0 = r0.filter
            if (r0 == 0) goto L3f
            r0 = r4
            r1 = r4
            zmq.Msg r1 = r1.message
            boolean r0 = r0.match(r1)
            if (r0 == 0) goto L46
        L3f:
            r0 = r4
            r1 = 1
            r0.hashMessage = r1
            r0 = 1
            return r0
        L46:
            r0 = r4
            zmq.Msg r0 = r0.message
            boolean r0 = r0.hasMore()
            if (r0 == 0) goto L12
            r0 = r4
            r1 = r4
            zmq.FQ r1 = r1.fq
            r2 = r4
            zmq.ValueReference<java.lang.Integer> r2 = r2.errno
            zmq.Msg r1 = r1.recv(r2)
            r0.message = r1
            boolean r0 = zmq.XSub.$assertionsDisabled
            if (r0 != 0) goto L46
            r0 = r4
            zmq.Msg r0 = r0.message
            if (r0 != 0) goto L46
            java.lang.AssertionError r0 = new java.lang.AssertionError
            r1 = r0
            r1.<init>()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: zmq.XSub.xhasIn():boolean");
    }

    private boolean match(Msg msg) {
        return this.subscriptions.check(msg.data());
    }
}
