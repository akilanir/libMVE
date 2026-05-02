package zmq;

import zmq.Dealer;

/* loaded from: jeromq-0.3.5.jar:zmq/Req.class */
public class Req extends Dealer {
    private boolean receivingReply;
    private boolean messageBegins;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Req.class.desiredAssertionStatus();
    }

    public Req(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.receivingReply = false;
        this.messageBegins = true;
        this.options.type = 3;
    }

    @Override // zmq.Dealer, zmq.SocketBase
    public boolean xsend(Msg msg) {
        if (this.receivingReply) {
            this.errno.set(Integer.valueOf(ZError.EFSM));
            return false;
        }
        if (this.messageBegins) {
            Msg bottom = new Msg();
            bottom.setFlags(1);
            boolean rc = super.xsend(bottom);
            if (!rc) {
                return rc;
            }
            this.messageBegins = false;
        }
        boolean more = msg.hasMore();
        boolean rc2 = super.xsend(msg);
        if (!rc2) {
            return rc2;
        }
        if (!more) {
            this.receivingReply = true;
            this.messageBegins = true;
            return true;
        }
        return true;
    }

    @Override // zmq.Dealer, zmq.SocketBase
    protected Msg xrecv() {
        Msg msg;
        if (!this.receivingReply) {
            this.errno.set(Integer.valueOf(ZError.EFSM));
            return null;
        }
        if (this.messageBegins) {
            Msg msg2 = super.xrecv();
            if (msg2 == null) {
                return null;
            }
            if (!msg2.hasMore() || msg2.size() != 0) {
                do {
                    msg = super.xrecv();
                    if (!$assertionsDisabled && msg == null) {
                        throw new AssertionError();
                    }
                } while (msg.hasMore());
                this.errno.set(35);
                return null;
            }
            this.messageBegins = false;
        }
        Msg msg3 = super.xrecv();
        if (msg3 == null) {
            return null;
        }
        if (!msg3.hasMore()) {
            this.receivingReply = false;
            this.messageBegins = true;
        }
        return msg3;
    }

    @Override // zmq.Dealer, zmq.SocketBase
    public boolean xhasIn() {
        return this.receivingReply && super.xhasIn();
    }

    @Override // zmq.Dealer, zmq.SocketBase
    public boolean xhasOut() {
        return !this.receivingReply && super.xhasOut();
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Req$ReqSession.class */
    public static class ReqSession extends Dealer.DealerSession {
        private State state;

        /* loaded from: jeromq-0.3.5.jar:zmq/Req$ReqSession$State.class */
        enum State {
            IDENTITY,
            BOTTOM,
            BODY
        }

        public ReqSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
            this.state = State.IDENTITY;
        }

        @Override // zmq.Dealer.DealerSession, zmq.SessionBase, zmq.IMsgSink
        public int pushMsg(Msg msg) {
            switch (this.state) {
                case BOTTOM:
                    if (msg.hasMore() && msg.size() == 0) {
                        this.state = State.BODY;
                        return super.pushMsg(msg);
                    }
                    break;
                case BODY:
                    if (msg.hasMore()) {
                        return super.pushMsg(msg);
                    }
                    if (msg.flags() == 0) {
                        this.state = State.BOTTOM;
                        return super.pushMsg(msg);
                    }
                    break;
                case IDENTITY:
                    if (msg.flags() == 0) {
                        this.state = State.BOTTOM;
                        return super.pushMsg(msg);
                    }
                    break;
            }
            this.socket.errno.set(14);
            return -1;
        }

        @Override // zmq.SessionBase
        public void reset() {
            super.reset();
            this.state = State.IDENTITY;
        }
    }
}
