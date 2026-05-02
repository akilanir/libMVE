package zmq;

import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* loaded from: jeromq-0.3.5.jar:zmq/Router.class */
public class Router extends SocketBase {
    private final FQ fq;
    private boolean prefetched;
    private boolean identitySent;
    private Msg prefetchedId;
    private Msg prefetchedMsg;
    private boolean moreIn;
    private final Set<Pipe> anonymousPipes;
    private final Map<Blob, Outpipe> outpipes;
    private Pipe currentOut;
    private boolean moreOut;
    private int nextPeerId;
    private boolean mandatory;
    private boolean handover;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Router.class.desiredAssertionStatus();
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Router$RouterSession.class */
    public static class RouterSession extends SessionBase {
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

        public RouterSession(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
            super(ioThread, connect, socket, options, addr);
        }
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Router$Outpipe.class */
    class Outpipe {
        private Pipe pipe;
        private boolean active;

        public Outpipe(Pipe pipe, boolean active) {
            this.pipe = pipe;
            this.active = active;
        }
    }

    public Router(Ctx parent, int tid, int sid) {
        super(parent, tid, sid);
        this.prefetched = false;
        this.identitySent = false;
        this.moreIn = false;
        this.currentOut = null;
        this.moreOut = false;
        this.nextPeerId = Utils.generateRandom();
        this.mandatory = false;
        this.handover = false;
        this.options.type = 6;
        this.fq = new FQ();
        this.prefetchedId = new Msg();
        this.prefetchedMsg = new Msg();
        this.anonymousPipes = new HashSet();
        this.outpipes = new HashMap();
        this.options.recvIdentity = true;
    }

    @Override // zmq.SocketBase
    public void xattachPipe(Pipe pipe, boolean icanhasall) {
        if (!$assertionsDisabled && pipe == null) {
            throw new AssertionError();
        }
        boolean identityOk = identifyPeer(pipe);
        if (identityOk) {
            this.fq.attach(pipe);
        } else {
            this.anonymousPipes.add(pipe);
        }
    }

    @Override // zmq.SocketBase
    public boolean xsetsockopt(int option, Object optval) {
        if (option == 33) {
            this.mandatory = ((Integer) optval).intValue() == 1;
            return true;
        }
        if (option == 56) {
            this.handover = ((Integer) optval).intValue() == 1;
            return true;
        }
        return false;
    }

    @Override // zmq.SocketBase
    public void xpipeTerminated(Pipe pipe) {
        if (!this.anonymousPipes.remove(pipe)) {
            Outpipe old = this.outpipes.remove(pipe.getIdentity());
            if (!$assertionsDisabled && old == null) {
                throw new AssertionError();
            }
            this.fq.terminated(pipe);
            if (pipe == this.currentOut) {
                this.currentOut = null;
            }
        }
    }

    @Override // zmq.SocketBase
    public void xreadActivated(Pipe pipe) {
        if (!this.anonymousPipes.contains(pipe)) {
            this.fq.activated(pipe);
            return;
        }
        boolean identityOk = identifyPeer(pipe);
        if (identityOk) {
            this.anonymousPipes.remove(pipe);
            this.fq.attach(pipe);
        }
    }

    @Override // zmq.SocketBase
    public void xwriteActivated(Pipe pipe) {
        for (Map.Entry<Blob, Outpipe> it : this.outpipes.entrySet()) {
            if (it.getValue().pipe == pipe) {
                if (!$assertionsDisabled && it.getValue().active) {
                    throw new AssertionError();
                }
                it.getValue().active = true;
                return;
            }
        }
        if (!$assertionsDisabled) {
            throw new AssertionError();
        }
    }

    @Override // zmq.SocketBase
    protected boolean xsend(Msg msg) {
        if (!this.moreOut) {
            if (!$assertionsDisabled && this.currentOut != null) {
                throw new AssertionError();
            }
            if (msg.hasMore()) {
                this.moreOut = true;
                Blob identity = Blob.createBlob(msg.data(), true);
                Outpipe op = this.outpipes.get(identity);
                if (op != null) {
                    this.currentOut = op.pipe;
                    if (!this.currentOut.checkWrite()) {
                        op.active = false;
                        this.currentOut = null;
                        if (this.mandatory) {
                            this.moreOut = false;
                            this.errno.set(35);
                            return false;
                        }
                        return true;
                    }
                    return true;
                }
                if (this.mandatory) {
                    this.moreOut = false;
                    this.errno.set(65);
                    return false;
                }
                return true;
            }
            return true;
        }
        this.moreOut = msg.hasMore();
        if (this.currentOut != null) {
            boolean ok = this.currentOut.write(msg);
            if (!ok) {
                this.currentOut = null;
                return true;
            }
            if (!this.moreOut) {
                this.currentOut.flush();
                this.currentOut = null;
                return true;
            }
            return true;
        }
        return true;
    }

    @Override // zmq.SocketBase
    protected Msg xrecv() {
        Msg msg;
        Msg msg2;
        if (this.prefetched) {
            if (!this.identitySent) {
                msg2 = this.prefetchedId;
                this.prefetchedId = null;
                this.identitySent = true;
            } else {
                msg2 = this.prefetchedMsg;
                this.prefetchedMsg = null;
                this.prefetched = false;
            }
            this.moreIn = msg2.hasMore();
            return msg2;
        }
        ValueReference<Pipe> pipe = new ValueReference<>();
        Msg recvPipe = this.fq.recvPipe(this.errno, pipe);
        while (true) {
            msg = recvPipe;
            if (msg == null || !msg.isIdentity()) {
                break;
            }
            recvPipe = this.fq.recvPipe(this.errno, pipe);
        }
        if (msg == null) {
            return null;
        }
        if (!$assertionsDisabled && pipe.get() == null) {
            throw new AssertionError();
        }
        if (this.moreIn) {
            this.moreIn = msg.hasMore();
        } else {
            this.prefetchedMsg = msg;
            this.prefetched = true;
            Blob identity = pipe.get().getIdentity();
            msg = new Msg(identity.data());
            msg.setFlags(1);
            this.identitySent = true;
        }
        return msg;
    }

    protected void rollback() {
        if (this.currentOut != null) {
            this.currentOut.rollback();
            this.currentOut = null;
            this.moreOut = false;
        }
    }

    @Override // zmq.SocketBase
    protected boolean xhasIn() {
        if (this.moreIn || this.prefetched) {
            return true;
        }
        ValueReference<Pipe> pipe = new ValueReference<>();
        this.prefetchedMsg = this.fq.recvPipe(this.errno, pipe);
        while (this.prefetchedMsg != null && this.prefetchedMsg.isIdentity()) {
            this.prefetchedMsg = this.fq.recvPipe(this.errno, pipe);
        }
        if (this.prefetchedMsg == null) {
            return false;
        }
        if (!$assertionsDisabled && pipe.get() == null) {
            throw new AssertionError();
        }
        Blob identity = pipe.get().getIdentity();
        this.prefetchedId = new Msg(identity.data());
        this.prefetchedId.setFlags(1);
        this.prefetched = true;
        this.identitySent = false;
        return true;
    }

    @Override // zmq.SocketBase
    protected boolean xhasOut() {
        return true;
    }

    private boolean identifyPeer(Pipe pipe) {
        Blob identity;
        Msg msg = pipe.read();
        if (msg == null) {
            return false;
        }
        if (msg.size() == 0) {
            ByteBuffer buf = ByteBuffer.allocate(5);
            buf.put((byte) 0);
            int i = this.nextPeerId;
            this.nextPeerId = i + 1;
            buf.putInt(i);
            identity = Blob.createBlob(buf.array(), false);
        } else {
            identity = Blob.createBlob(msg.data(), true);
            if (this.outpipes.containsKey(identity)) {
                if (!this.handover) {
                    return false;
                }
                ByteBuffer buf2 = ByteBuffer.allocate(5);
                buf2.put((byte) 0);
                int i2 = this.nextPeerId;
                this.nextPeerId = i2 + 1;
                buf2.putInt(i2);
                Blob newIdentity = Blob.createBlob(buf2.array(), false);
                Outpipe existingOutpipe = this.outpipes.remove(identity);
                existingOutpipe.pipe.setIdentity(newIdentity);
                this.outpipes.put(newIdentity, existingOutpipe);
                existingOutpipe.pipe.terminate(true);
            }
        }
        pipe.setIdentity(identity);
        Outpipe outpipe = new Outpipe(pipe, true);
        this.outpipes.put(identity, outpipe);
        return true;
    }
}
