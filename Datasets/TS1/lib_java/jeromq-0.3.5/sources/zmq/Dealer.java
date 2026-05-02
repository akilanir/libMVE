package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/Dealer.class */
public class Dealer extends SocketBase {
    private final FQ fq;
    private final LB lb;
    private boolean prefetched;
    private Msg prefetchedMsg;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Dealer.class.desiredAssertionStatus();
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Dealer$DealerSession.class */
    public static class DealerSession extends SessionBase {
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

        public DealerSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    public Dealer(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.prefetched = false;
        this.options.type = 5;
        this.fq = new FQ();
        this.lb = new LB();
        this.options.recvIdentity = true;
    }

    @Override // zmq.SocketBase
    protected void xattachPipe(Pipe pipe, boolean icanhasall) {
        if (!$assertionsDisabled && pipe == null) {
            throw new AssertionError();
        }
        this.fq.attach(pipe);
        this.lb.attach(pipe);
    }

    @Override // zmq.SocketBase
    protected boolean xsend(Msg msg) {
        return this.lb.send(msg, this.errno);
    }

    @Override // zmq.SocketBase
    protected Msg xrecv() {
        return xxrecv();
    }

    private Msg xxrecv() {
        Msg msg;
        if (this.prefetched) {
            Msg msg2 = this.prefetchedMsg;
            this.prefetched = false;
            this.prefetchedMsg = null;
            return msg2;
        }
        do {
            msg = this.fq.recv(this.errno);
            if (msg == null) {
                return null;
            }
        } while ((msg.flags() & 64) != 0);
        return msg;
    }

    @Override // zmq.SocketBase
    protected boolean xhasIn() {
        if (this.prefetched) {
            return true;
        }
        this.prefetchedMsg = xxrecv();
        if (this.prefetchedMsg == null) {
            return false;
        }
        this.prefetched = true;
        return true;
    }

    @Override // zmq.SocketBase
    protected boolean xhasOut() {
        return this.lb.hasOut();
    }

    @Override // zmq.SocketBase
    protected void xreadActivated(Pipe pipe) {
        this.fq.activated(pipe);
    }

    @Override // zmq.SocketBase
    protected void xwriteActivated(Pipe pipe) {
        this.lb.activated(pipe);
    }

    @Override // zmq.SocketBase
    protected void xpipeTerminated(Pipe pipe) {
        this.fq.terminated(pipe);
        this.lb.terminated(pipe);
    }
}
