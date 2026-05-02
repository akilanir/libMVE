package zmq;

import zmq.XSub;

/* loaded from: jeromq-0.3.5.jar:zmq/Sub.class */
public class Sub extends XSub {

    /* loaded from: jeromq-0.3.5.jar:zmq/Sub$SubSession.class */
    public static class SubSession extends XSub.XSubSession {
        public SubSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    public Sub(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.options.type = 2;
        this.options.filter = true;
    }

    @Override // zmq.SocketBase
    public boolean xsetsockopt(int option, Object optval) {
        byte[] val;
        if (option != 6 && option != 7) {
            return false;
        }
        if (optval instanceof String) {
            val = ((String) optval).getBytes(ZMQ.CHARSET);
        } else if (optval instanceof byte[]) {
            val = (byte[]) optval;
        } else {
            throw new IllegalArgumentException();
        }
        Msg msg = new Msg(val.length + 1);
        if (option == 6) {
            msg.put((byte) 1);
        } else {
            msg.put((byte) 0);
        }
        msg.put(val);
        boolean rc = super.xsend(msg);
        if (!rc) {
            throw new IllegalStateException("Failed to send subscribe/unsubscribe message");
        }
        return true;
    }

    @Override // zmq.XSub, zmq.SocketBase
    protected boolean xsend(Msg msg) {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.XSub, zmq.SocketBase
    protected boolean xhasOut() {
        return false;
    }
}
