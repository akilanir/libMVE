package zmq;

import zmq.Router;

/* loaded from: jeromq-0.3.5.jar:zmq/Rep.class */
public class Rep extends Router {
    private boolean sendingReply;
    private boolean requestBegins;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Rep.class.desiredAssertionStatus();
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Rep$RepSession.class */
    public static class RepSession extends Router.RouterSession {
        public RepSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    public Rep(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.sendingReply = false;
        this.requestBegins = true;
        this.options.type = 4;
    }

    @Override // zmq.Router, zmq.SocketBase
    protected boolean xsend(Msg msg) {
        if (!this.sendingReply) {
            throw new IllegalStateException("Cannot send another reply");
        }
        boolean more = msg.hasMore();
        boolean rc = super.xsend(msg);
        if (!rc) {
            return rc;
        }
        if (!more) {
            this.sendingReply = false;
            return true;
        }
        return true;
    }

    @Override // zmq.Router, zmq.SocketBase
    protected Msg xrecv() {
        if (this.sendingReply) {
            throw new IllegalStateException("Cannot receive another request");
        }
        if (this.requestBegins) {
            while (true) {
                Msg msg = super.xrecv();
                if (msg == null) {
                    return null;
                }
                if (msg.hasMore()) {
                    boolean bottom = msg.size() == 0;
                    boolean rc = super.xsend(msg);
                    if (!$assertionsDisabled && !rc) {
                        throw new AssertionError();
                    }
                    if (bottom) {
                        this.requestBegins = false;
                        break;
                    }
                } else {
                    super.rollback();
                }
            }
        }
        Msg msg2 = super.xrecv();
        if (msg2 == null) {
            return null;
        }
        if (!msg2.hasMore()) {
            this.sendingReply = true;
            this.requestBegins = true;
        }
        return msg2;
    }

    @Override // zmq.Router, zmq.SocketBase
    protected boolean xhasIn() {
        return !this.sendingReply && super.xhasIn();
    }

    @Override // zmq.Router, zmq.SocketBase
    protected boolean xhasOut() {
        return this.sendingReply && super.xhasOut();
    }
}
