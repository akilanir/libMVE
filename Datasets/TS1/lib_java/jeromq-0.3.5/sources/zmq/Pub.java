package zmq;

import zmq.XPub;

/* loaded from: jeromq-0.3.5.jar:zmq/Pub.class */
public class Pub extends XPub {
    @Override // zmq.XPub, zmq.SocketBase
    public /* bridge */ /* synthetic */ boolean xsetsockopt(int x0, Object x1) {
        return super.xsetsockopt(x0, x1);
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Pub$PubSession.class */
    public static class PubSession extends XPub.XPubSession {
        public PubSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    public Pub(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.options.type = 1;
    }

    @Override // zmq.XPub, zmq.SocketBase
    protected Msg xrecv() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.XPub, zmq.SocketBase
    protected boolean xhasIn() {
        return false;
    }
}
