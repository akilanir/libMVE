package zmq;

import java.util.HashSet;
import java.util.Set;
import zmq.Dealer;
import zmq.Pair;
import zmq.Pipe;
import zmq.Pub;
import zmq.Pull;
import zmq.Push;
import zmq.Rep;
import zmq.Req;
import zmq.Router;
import zmq.Sub;
import zmq.XPub;
import zmq.XSub;

/* loaded from: jeromq-0.3.5.jar:zmq/SessionBase.class */
class SessionBase extends Own implements Pipe.IPipeEvents, IPollEvents, IMsgSink, IMsgSource {
    private boolean connect;
    private Pipe pipe;
    private final Set<Pipe> terminatingPipes;
    private boolean incompleteIn;
    private boolean pending;
    private IEngine engine;
    protected SocketBase socket;
    private IOThread ioThread;
    private static final int LINGER_TIMER_ID = 32;
    private boolean hasLingerTimer;
    private boolean identitySent;
    private boolean identityReceived;
    private final Address addr;
    private IOObject ioObject;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !SessionBase.class.desiredAssertionStatus();
    }

    public static SessionBase create(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
        SessionBase s;
        switch (options.type) {
            case 0:
                s = new Pair.PairSession(ioThread, connect, socket, options, addr);
                break;
            case 1:
                s = new Pub.PubSession(ioThread, connect, socket, options, addr);
                break;
            case 2:
                s = new Sub.SubSession(ioThread, connect, socket, options, addr);
                break;
            case 3:
                s = new Req.ReqSession(ioThread, connect, socket, options, addr);
                break;
            case 4:
                s = new Rep.RepSession(ioThread, connect, socket, options, addr);
                break;
            case 5:
                s = new Dealer.DealerSession(ioThread, connect, socket, options, addr);
                break;
            case 6:
                s = new Router.RouterSession(ioThread, connect, socket, options, addr);
                break;
            case 7:
                s = new Pull.PullSession(ioThread, connect, socket, options, addr);
                break;
            case 8:
                s = new Push.PushSession(ioThread, connect, socket, options, addr);
                break;
            case 9:
                s = new XPub.XPubSession(ioThread, connect, socket, options, addr);
                break;
            case 10:
                s = new XSub.XSubSession(ioThread, connect, socket, options, addr);
                break;
            default:
                throw new IllegalArgumentException("type=" + options.type);
        }
        return s;
    }

    public SessionBase(IOThread ioThread, boolean connect, SocketBase socket, Options options, Address addr) {
        super(ioThread, options);
        this.ioObject = new IOObject(ioThread);
        this.connect = connect;
        this.pipe = null;
        this.incompleteIn = false;
        this.pending = false;
        this.engine = null;
        this.socket = socket;
        this.ioThread = ioThread;
        this.hasLingerTimer = false;
        this.identitySent = false;
        this.identityReceived = false;
        this.addr = addr;
        this.terminatingPipes = new HashSet();
    }

    @Override // zmq.Own
    public void destroy() {
        if (!$assertionsDisabled && this.pipe != null) {
            throw new AssertionError();
        }
        if (this.hasLingerTimer) {
            this.ioObject.cancelTimer(32);
            this.hasLingerTimer = false;
        }
        if (this.engine != null) {
            this.engine.terminate();
        }
    }

    public void attachPipe(Pipe pipe) {
        if (!$assertionsDisabled && isTerminating()) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && this.pipe != null) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && pipe == null) {
            throw new AssertionError();
        }
        this.pipe = pipe;
        this.pipe.setEventSink(this);
    }

    public Msg pullMsg() {
        Msg msg;
        if (!this.identitySent) {
            Msg msg2 = new Msg(this.options.identitySize);
            msg2.put(this.options.identity, 0, this.options.identitySize);
            this.identitySent = true;
            this.incompleteIn = false;
            return msg2;
        }
        if (this.pipe == null || (msg = this.pipe.read()) == null) {
            return null;
        }
        this.incompleteIn = msg.hasMore();
        return msg;
    }

    public int pushMsg(Msg msg) {
        if (!this.identityReceived) {
            msg.setFlags(64);
            this.identityReceived = true;
            if (!this.options.recvIdentity) {
                return 0;
            }
        }
        if (this.pipe != null && this.pipe.write(msg)) {
            return 0;
        }
        return 35;
    }

    protected void reset() {
        this.identitySent = false;
        this.identityReceived = false;
    }

    public void flush() {
        if (this.pipe != null) {
            this.pipe.flush();
        }
    }

    private void cleanPipes() {
        if (this.pipe != null) {
            this.pipe.rollback();
            this.pipe.flush();
            while (this.incompleteIn) {
                Msg msg = pullMsg();
                if (msg == null) {
                    if (!$assertionsDisabled && this.incompleteIn) {
                        throw new AssertionError();
                    }
                    return;
                }
            }
        }
    }

    public void pipeTerminated(Pipe pipe) {
        if (!$assertionsDisabled && this.pipe != pipe && !this.terminatingPipes.contains(pipe)) {
            throw new AssertionError();
        }
        if (this.pipe == pipe) {
            this.pipe = null;
            if (this.hasLingerTimer) {
                this.ioObject.cancelTimer(32);
                this.hasLingerTimer = false;
            }
        } else {
            this.terminatingPipes.remove(pipe);
        }
        if (this.pending && this.pipe == null && this.terminatingPipes.isEmpty()) {
            this.pending = false;
            super.processTerm(0);
        }
    }

    public void readActivated(Pipe pipe) {
        if (this.pipe != pipe) {
            if (!$assertionsDisabled && !this.terminatingPipes.contains(pipe)) {
                throw new AssertionError();
            }
        } else if (this.engine != null) {
            this.engine.activateOut();
        } else {
            this.pipe.checkRead();
        }
    }

    public void writeActivated(Pipe pipe) {
        if (this.pipe != pipe) {
            if (!$assertionsDisabled && !this.terminatingPipes.contains(pipe)) {
                throw new AssertionError();
            }
        } else if (this.engine != null) {
            this.engine.activateIn();
        }
    }

    public void hiccuped(Pipe pipe) {
        throw new UnsupportedOperationException("Must Override");
    }

    public SocketBase getSocket() {
        return this.socket;
    }

    @Override // zmq.ZObject
    protected void processPlug() {
        this.ioObject.setHandler(this);
        if (this.connect) {
            startConnecting(false);
        }
    }

    @Override // zmq.ZObject
    protected void processAttach(IEngine engine) {
        if (!$assertionsDisabled && engine == null) {
            throw new AssertionError();
        }
        if (this.pipe == null && !isTerminating()) {
            ZObject[] parents = {this, this.socket};
            Pipe[] pipes = {null, null};
            int[] hwms = {this.options.recvHwm, this.options.sendHwm};
            boolean[] delays = {this.options.delayOnClose, this.options.delayOnDisconnect};
            Pipe.pipepair(parents, pipes, hwms, delays);
            pipes[0].setEventSink(this);
            if (!$assertionsDisabled && this.pipe != null) {
                throw new AssertionError();
            }
            this.pipe = pipes[0];
            sendBind(this.socket, pipes[1]);
        }
        if (!$assertionsDisabled && this.engine != null) {
            throw new AssertionError();
        }
        this.engine = engine;
        this.engine.plug(this.ioThread, this);
    }

    public void detach() {
        this.engine = null;
        cleanPipes();
        detached();
        if (this.pipe != null) {
            this.pipe.checkRead();
        }
    }

    @Override // zmq.Own, zmq.ZObject
    protected void processTerm(int linger) {
        if (!$assertionsDisabled && this.pending) {
            throw new AssertionError();
        }
        if (this.pipe == null && this.terminatingPipes.isEmpty()) {
            super.processTerm(0);
            return;
        }
        this.pending = true;
        if (linger > 0) {
            if (!$assertionsDisabled && this.hasLingerTimer) {
                throw new AssertionError();
            }
            this.ioObject.addTimer(linger, 32);
            this.hasLingerTimer = true;
        }
        if (this.pipe != null) {
            this.pipe.terminate(linger != 0);
            this.pipe.checkRead();
        }
    }

    public void timerEvent(int id) {
        if (!$assertionsDisabled && id != 32) {
            throw new AssertionError();
        }
        this.hasLingerTimer = false;
        if (!$assertionsDisabled && this.pipe == null) {
            throw new AssertionError();
        }
        this.pipe.terminate(false);
    }

    private void detached() {
        if (!this.connect) {
            terminate();
            return;
        }
        if (this.pipe != null && this.options.delayAttachOnConnect == 1 && !this.addr.protocol().equals("pgm") && !this.addr.protocol().equals("epgm")) {
            this.pipe.hiccup();
            this.pipe.terminate(false);
            this.terminatingPipes.add(this.pipe);
            this.pipe = null;
        }
        reset();
        if (this.options.reconnectIvl != -1) {
            startConnecting(true);
        }
        if (this.pipe != null) {
            if (this.options.type == 2 || this.options.type == 10) {
                this.pipe.hiccup();
            }
        }
    }

    private void startConnecting(boolean wait) {
        if (!$assertionsDisabled && !this.connect) {
            throw new AssertionError();
        }
        IOThread ioThread = chooseIoThread(this.options.affinity);
        if (!$assertionsDisabled && ioThread == null) {
            throw new AssertionError();
        }
        if (this.addr.protocol().equals("tcp")) {
            TcpConnecter connecter = new TcpConnecter(ioThread, this, this.options, this.addr, wait);
            launchChild(connecter);
        } else if (this.addr.protocol().equals("ipc")) {
            IpcConnecter connecter2 = new IpcConnecter(ioThread, this, this.options, this.addr, wait);
            launchChild(connecter2);
        } else if (!$assertionsDisabled) {
            throw new AssertionError();
        }
    }

    public String toString() {
        return super.toString() + "[" + this.options.socketId + "]";
    }

    public void inEvent() {
        throw new UnsupportedOperationException();
    }

    public void outEvent() {
        throw new UnsupportedOperationException();
    }

    public void connectEvent() {
        throw new UnsupportedOperationException();
    }

    public void acceptEvent() {
        throw new UnsupportedOperationException();
    }
}
