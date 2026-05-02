package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/Pair.class */
public class Pair extends SocketBase {
    private Pipe pipe;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Pair.class.desiredAssertionStatus();
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Pair$PairSession.class */
    public static class PairSession extends SessionBase {
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

        public PairSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    public Pair(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.options.type = 0;
    }

    @Override // zmq.SocketBase
    protected void xattachPipe(Pipe pipe, boolean icanhasall) {
        if (!$assertionsDisabled && pipe == null) {
            throw new AssertionError();
        }
        if (this.pipe == null) {
            this.pipe = pipe;
        } else {
            pipe.terminate(false);
        }
    }

    @Override // zmq.SocketBase
    protected void xpipeTerminated(Pipe pipe) {
        if (this.pipe == pipe) {
            this.pipe = null;
        }
    }

    @Override // zmq.SocketBase
    protected void xreadActivated(Pipe pipe) {
    }

    @Override // zmq.SocketBase
    protected void xwriteActivated(Pipe pipe) {
    }

    @Override // zmq.SocketBase
    protected boolean xsend(Msg msg) {
        if (this.pipe == null || !this.pipe.write(msg)) {
            this.errno.set(35);
            return false;
        }
        if ((msg.flags() & 2) == 0) {
            this.pipe.flush();
            return true;
        }
        return true;
    }

    @Override // zmq.SocketBase
    protected Msg xrecv() {
        Msg msg = this.pipe == null ? null : this.pipe.read();
        if (msg == null) {
            this.errno.set(35);
            return null;
        }
        return msg;
    }

    @Override // zmq.SocketBase
    protected boolean xhasIn() {
        return this.pipe != null && this.pipe.checkRead();
    }

    @Override // zmq.SocketBase
    protected boolean xhasOut() {
        return this.pipe != null && this.pipe.checkWrite();
    }
}
