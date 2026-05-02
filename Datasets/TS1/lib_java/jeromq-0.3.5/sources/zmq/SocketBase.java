package zmq;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.channels.SelectableChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import zmq.Ctx;
import zmq.Pipe;
import zmq.ZError;
import zmq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:zmq/SocketBase.class */
public abstract class SocketBase extends Own implements IPollEvents, Pipe.IPipeEvents {
    private final Map<String, Own> endpoints;
    private final Map<String, Pipe> inprocs;
    private int tag;
    private boolean ctxTerminated;
    private boolean destroyed;
    private final Mailbox mailbox;
    private final List<Pipe> pipes;
    private Poller poller;
    private SelectableChannel handle;
    private long lastTsc;
    private int ticks;
    private boolean rcvmore;
    private SocketBase monitorSocket;
    private int monitorEvents;
    protected ValueReference<Integer> errno;
    static final /* synthetic */ boolean $assertionsDisabled;

    protected abstract void xattachPipe(Pipe pipe, boolean z);

    protected abstract void xpipeTerminated(Pipe pipe);

    @Override // zmq.Own
    public /* bridge */ /* synthetic */ void unregisterTermAck() {
        super.unregisterTermAck();
    }

    @Override // zmq.Own
    public /* bridge */ /* synthetic */ void registerTermAcks(int x0) {
        super.registerTermAcks(x0);
    }

    static {
        $assertionsDisabled = !SocketBase.class.desiredAssertionStatus();
    }

    protected SocketBase(Ctx parent, int tid, int sid) {
        super(parent, tid);
        this.tag = -1159861073;
        this.ctxTerminated = false;
        this.destroyed = false;
        this.lastTsc = 0L;
        this.ticks = 0;
        this.rcvmore = false;
        this.monitorSocket = null;
        this.monitorEvents = 0;
        this.options.socketId = sid;
        this.options.linger = parent.get(70) != 0 ? -1 : 0;
        this.endpoints = new MultiMap();
        this.inprocs = new MultiMap();
        this.pipes = new ArrayList();
        this.mailbox = new Mailbox("socket-" + sid);
        this.errno = new ValueReference<>(0);
    }

    public boolean checkTag() {
        return this.tag == -1159861073;
    }

    public static SocketBase create(int type, Ctx parent, int tid, int sid) {
        SocketBase s;
        switch (type) {
            case 0:
                s = new Pair(parent, tid, sid);
                break;
            case 1:
                s = new Pub(parent, tid, sid);
                break;
            case 2:
                s = new Sub(parent, tid, sid);
                break;
            case 3:
                s = new Req(parent, tid, sid);
                break;
            case 4:
                s = new Rep(parent, tid, sid);
                break;
            case 5:
                s = new Dealer(parent, tid, sid);
                break;
            case 6:
                s = new Router(parent, tid, sid);
                break;
            case 7:
                s = new Pull(parent, tid, sid);
                break;
            case 8:
                s = new Push(parent, tid, sid);
                break;
            case 9:
                s = new XPub(parent, tid, sid);
                break;
            case 10:
                s = new XSub(parent, tid, sid);
                break;
            default:
                throw new IllegalArgumentException("type=" + type);
        }
        return s;
    }

    @Override // zmq.Own
    public void destroy() {
        try {
            this.mailbox.close();
        } catch (IOException e) {
        }
        stopMonitor();
        if (!$assertionsDisabled && !this.destroyed) {
            throw new AssertionError();
        }
    }

    public Mailbox getMailbox() {
        return this.mailbox;
    }

    public void stop() {
        sendStop();
    }

    private void checkProtocol(String protocol) {
        if (!protocol.equals("inproc") && !protocol.equals("ipc") && !protocol.equals("tcp")) {
            throw new UnsupportedOperationException(protocol);
        }
        if ((protocol.equals("pgm") || protocol.equals("epgm")) && this.options.type != 1 && this.options.type != 2 && this.options.type != 9 && this.options.type != 10) {
            throw new UnsupportedOperationException(protocol + ",type=" + this.options.type);
        }
    }

    private void attachPipe(Pipe pipe) {
        attachPipe(pipe, false);
    }

    private void attachPipe(Pipe pipe, boolean icanhasall) {
        pipe.setEventSink(this);
        this.pipes.add(pipe);
        xattachPipe(pipe, icanhasall);
        if (isTerminating()) {
            registerTermAcks(1);
            pipe.terminate(false);
        }
    }

    public void setSocketOpt(int option, Object optval) {
        if (this.ctxTerminated) {
            throw new ZError.CtxTerminatedException();
        }
        if (xsetsockopt(option, optval)) {
            return;
        }
        this.options.setSocketOpt(option, optval);
    }

    public int getSocketOpt(int option) {
        if (option != 15 && this.ctxTerminated) {
            throw new ZError.CtxTerminatedException();
        }
        if (option == 13) {
            return this.rcvmore ? 1 : 0;
        }
        if (option == 15) {
            boolean rc = processCommands(0, false);
            if (!rc && this.errno.get().intValue() == 156384765) {
                return -1;
            }
            if (!$assertionsDisabled && !rc) {
                throw new AssertionError();
            }
            int val = 0;
            if (hasOut()) {
                val = 0 | 2;
            }
            if (hasIn()) {
                val |= 1;
            }
            return val;
        }
        return ((Integer) getsockoptx(option)).intValue();
    }

    public Object getsockoptx(int option) {
        if (this.ctxTerminated) {
            throw new ZError.CtxTerminatedException();
        }
        if (option == 13) {
            return Integer.valueOf(this.rcvmore ? 1 : 0);
        }
        if (option == 14) {
            return this.mailbox.getFd();
        }
        if (option == 15) {
            boolean rc = processCommands(0, false);
            if (!rc && this.errno.get().intValue() == 156384765) {
                return -1;
            }
            if (!$assertionsDisabled && !rc) {
                throw new AssertionError();
            }
            int val = 0;
            if (hasOut()) {
                val = 0 | 2;
            }
            if (hasIn()) {
                val |= 1;
            }
            return Integer.valueOf(val);
        }
        return this.options.getsockopt(option);
    }

    public boolean bind(String addr) {
        if (this.ctxTerminated) {
            throw new ZError.CtxTerminatedException();
        }
        boolean brc = processCommands(0, false);
        if (!brc) {
            return false;
        }
        try {
            URI uri = new URI(addr);
            String protocol = uri.getScheme();
            String address = uri.getAuthority();
            String path = uri.getPath();
            if (address == null) {
                address = path;
            }
            checkProtocol(protocol);
            if (protocol.equals("inproc")) {
                Ctx.Endpoint endpoint = new Ctx.Endpoint(this, this.options);
                boolean rc = registerEndpoint(addr, endpoint);
                if (rc) {
                    this.options.lastEndpoint = addr;
                } else {
                    this.errno.set(48);
                }
                return rc;
            }
            if (protocol.equals("pgm") || protocol.equals("epgm")) {
                return connect(addr);
            }
            IOThread ioThread = chooseIoThread(this.options.affinity);
            if (ioThread == null) {
                throw new IllegalStateException("EMTHREAD");
            }
            if (protocol.equals("tcp")) {
                TcpListener listener = new TcpListener(ioThread, this, this.options);
                int rc2 = listener.setAddress(address);
                if (rc2 != 0) {
                    listener.destroy();
                    eventBindFailed(address, rc2);
                    this.errno.set(Integer.valueOf(rc2));
                    return false;
                }
                this.options.lastEndpoint = listener.getAddress();
                addEndpoint(this.options.lastEndpoint, listener);
                return true;
            }
            if (protocol.equals("ipc")) {
                IpcListener listener2 = new IpcListener(ioThread, this, this.options);
                int rc3 = listener2.setAddress(address);
                if (rc3 != 0) {
                    listener2.destroy();
                    eventBindFailed(address, rc3);
                    this.errno.set(Integer.valueOf(rc3));
                    return false;
                }
                this.options.lastEndpoint = listener2.getAddress();
                addEndpoint(addr, listener2);
                return true;
            }
            throw new IllegalArgumentException(addr);
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public boolean connect(String addr) {
        if (this.ctxTerminated) {
            throw new ZError.CtxTerminatedException();
        }
        boolean brc = processCommands(0, false);
        if (!brc) {
            return false;
        }
        try {
            URI uri = new URI(addr);
            String protocol = uri.getScheme();
            String address = uri.getAuthority();
            String path = uri.getPath();
            if (address == null) {
                address = path;
            }
            checkProtocol(protocol);
            if (protocol.equals("inproc")) {
                Ctx.Endpoint peer = findEndpoint(addr);
                if (peer.socket == null) {
                    return false;
                }
                int sndhwm = 0;
                if (this.options.sendHwm != 0 && peer.options.recvHwm != 0) {
                    sndhwm = this.options.sendHwm + peer.options.recvHwm;
                }
                int rcvhwm = 0;
                if (this.options.recvHwm != 0 && peer.options.sendHwm != 0) {
                    rcvhwm = this.options.recvHwm + peer.options.sendHwm;
                }
                ZObject[] parents = {this, peer.socket};
                Pipe[] pipes = {null, null};
                int[] hwms = {sndhwm, rcvhwm};
                boolean[] delays = {this.options.delayOnDisconnect, this.options.delayOnClose};
                Pipe.pipepair(parents, pipes, hwms, delays);
                attachPipe(pipes[0]);
                if (peer.options.recvIdentity) {
                    Msg id = new Msg(this.options.identitySize);
                    id.put(this.options.identity, 0, this.options.identitySize);
                    id.setFlags(64);
                    boolean written = pipes[0].write(id);
                    if (!$assertionsDisabled && !written) {
                        throw new AssertionError();
                    }
                    pipes[0].flush();
                }
                if (this.options.recvIdentity) {
                    Msg id2 = new Msg(peer.options.identitySize);
                    id2.put(peer.options.identity, 0, peer.options.identitySize);
                    id2.setFlags(64);
                    boolean written2 = pipes[1].write(id2);
                    if (!$assertionsDisabled && !written2) {
                        throw new AssertionError();
                    }
                    pipes[1].flush();
                }
                sendBind(peer.socket, pipes[1], false);
                this.options.lastEndpoint = addr;
                this.inprocs.put(addr, pipes[0]);
                return true;
            }
            IOThread ioThread = chooseIoThread(this.options.affinity);
            if (ioThread == null) {
                throw new IllegalStateException("Empty IO Thread");
            }
            boolean ipv4only = this.options.ipv4only != 0;
            Address paddr = new Address(protocol, address, ipv4only);
            paddr.resolve();
            SessionBase session = SessionBase.create(ioThread, true, this, this.options, paddr);
            if (!$assertionsDisabled && session == null) {
                throw new AssertionError();
            }
            boolean icanhasall = false;
            if (protocol.equals("pgm") || protocol.equals("epgm")) {
                icanhasall = true;
            }
            if (this.options.delayAttachOnConnect != 1 || icanhasall) {
                ZObject[] parents2 = {this, session};
                Pipe[] pipes2 = {null, null};
                int[] hwms2 = {this.options.sendHwm, this.options.recvHwm};
                boolean[] delays2 = {this.options.delayOnDisconnect, this.options.delayOnClose};
                Pipe.pipepair(parents2, pipes2, hwms2, delays2);
                attachPipe(pipes2[0], icanhasall);
                session.attachPipe(pipes2[1]);
            }
            this.options.lastEndpoint = paddr.toString();
            addEndpoint(addr, session);
            return true;
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException(e);
        }
    }

    private void addEndpoint(String addr, Own endpoint) {
        launchChild(endpoint);
        this.endpoints.put(addr, endpoint);
    }

    public boolean termEndpoint(String addr) {
        if (this.ctxTerminated) {
            throw new ZError.CtxTerminatedException();
        }
        if (addr == null) {
            throw new IllegalArgumentException();
        }
        boolean rc = processCommands(0, false);
        if (!rc) {
            return false;
        }
        try {
            URI uri = new URI(addr);
            String protocol = uri.getScheme();
            if (protocol.equals("inproc")) {
                if (!this.inprocs.containsKey(addr)) {
                    return false;
                }
                Iterator<Map.Entry<String, Pipe>> it = this.inprocs.entrySet().iterator();
                while (it.hasNext()) {
                    it.next().getValue().terminate(true);
                    it.remove();
                }
                return true;
            }
            if (!this.endpoints.containsKey(addr)) {
                return false;
            }
            Iterator<Map.Entry<String, Own>> it2 = this.endpoints.entrySet().iterator();
            while (it2.hasNext()) {
                Map.Entry<String, Own> e = it2.next();
                if (e.getKey().equals(addr)) {
                    termChild(e.getValue());
                    it2.remove();
                }
            }
            return true;
        } catch (URISyntaxException e2) {
            throw new IllegalArgumentException(e2);
        }
    }

    public boolean send(Msg msg, int flags) {
        if (this.ctxTerminated) {
            this.errno.set(Integer.valueOf(ZError.ETERM));
            return false;
        }
        if (msg == null) {
            throw new IllegalArgumentException();
        }
        boolean brc = processCommands(0, true);
        if (!brc) {
            return false;
        }
        msg.resetFlags(1);
        if ((flags & 2) > 0) {
            msg.setFlags(1);
        }
        boolean rc = xsend(msg);
        if (rc) {
            return true;
        }
        if (this.errno.get().intValue() != 35 || (flags & 1) > 0 || this.options.sendTimeout == 0) {
            return false;
        }
        int timeout = this.options.sendTimeout;
        long end = timeout < 0 ? 0L : Clock.nowMS() + timeout;
        while (processCommands(timeout, false)) {
            boolean rc2 = xsend(msg);
            if (!rc2) {
                if (this.errno.get().intValue() != 35) {
                    return false;
                }
                if (timeout > 0) {
                    timeout = (int) (end - Clock.nowMS());
                    if (timeout <= 0) {
                        this.errno.set(35);
                        return false;
                    }
                }
            } else {
                return true;
            }
        }
        return false;
    }

    public Msg recv(int flags) {
        if (this.ctxTerminated) {
            this.errno.set(Integer.valueOf(ZError.ETERM));
            return null;
        }
        int i = this.ticks + 1;
        this.ticks = i;
        if (i == Config.INBOUND_POLL_RATE.getValue()) {
            if (!processCommands(0, false)) {
                return null;
            }
            this.ticks = 0;
        }
        Msg msg = xrecv();
        if (msg == null && this.errno.get().intValue() != 35) {
            return null;
        }
        if (msg != null) {
            extractFlags(msg);
            return msg;
        }
        if ((flags & 1) > 0 || this.options.recvTimeout == 0) {
            if (!processCommands(0, false)) {
                return null;
            }
            this.ticks = 0;
            Msg msg2 = xrecv();
            if (msg2 == null) {
                return null;
            }
            extractFlags(msg2);
            return msg2;
        }
        int timeout = this.options.recvTimeout;
        long end = timeout < 0 ? 0L : Clock.nowMS() + timeout;
        boolean block = this.ticks != 0;
        while (true) {
            if (!processCommands(block ? timeout : 0, false)) {
                return null;
            }
            Msg msg3 = xrecv();
            if (msg3 != null) {
                this.ticks = 0;
                extractFlags(msg3);
                return msg3;
            }
            if (this.errno.get().intValue() != 35) {
                return null;
            }
            block = true;
            if (timeout > 0) {
                timeout = (int) (end - Clock.nowMS());
                if (timeout <= 0) {
                    this.errno.set(35);
                    return null;
                }
            }
        }
    }

    public void close() {
        this.tag = -559038737;
        sendReap(this);
    }

    boolean hasIn() {
        return xhasIn();
    }

    boolean hasOut() {
        return xhasOut();
    }

    public void startReaping(Poller poller) {
        this.poller = poller;
        this.handle = this.mailbox.getFd();
        this.poller.addHandle(this.handle, this);
        this.poller.setPollIn(this.handle);
        terminate();
        checkDestroy();
    }

    private boolean processCommands(int timeout, boolean throttle) {
        Command recv;
        if (timeout != 0) {
            recv = this.mailbox.recv(timeout);
        } else {
            if (0 != 0 && throttle) {
                if (0 >= this.lastTsc && 0 - this.lastTsc <= Config.MAX_COMMAND_DELAY.getValue()) {
                    return true;
                }
                this.lastTsc = 0L;
            }
            recv = this.mailbox.recv(0L);
        }
        while (true) {
            Command cmd = recv;
            if (cmd == null) {
                break;
            }
            cmd.destination().processCommand(cmd);
            recv = this.mailbox.recv(0L);
        }
        if (this.ctxTerminated) {
            this.errno.set(Integer.valueOf(ZError.ETERM));
            return false;
        }
        return true;
    }

    @Override // zmq.ZObject
    protected void processStop() {
        stopMonitor();
        this.ctxTerminated = true;
    }

    @Override // zmq.ZObject
    protected void processBind(Pipe pipe) {
        attachPipe(pipe);
    }

    @Override // zmq.Own, zmq.ZObject
    protected void processTerm(int linger) {
        unregisterEndpoints(this);
        for (int i = 0; i != this.pipes.size(); i++) {
            this.pipes.get(i).terminate(false);
        }
        registerTermAcks(this.pipes.size());
        super.processTerm(linger);
    }

    @Override // zmq.Own
    protected void processDestroy() {
        this.destroyed = true;
    }

    protected boolean xsetsockopt(int option, Object optval) {
        return false;
    }

    protected boolean xhasOut() {
        return false;
    }

    protected boolean xsend(Msg msg) {
        throw new UnsupportedOperationException("Must Override");
    }

    protected boolean xhasIn() {
        return false;
    }

    protected Msg xrecv() {
        throw new UnsupportedOperationException("Must Override");
    }

    protected void xreadActivated(Pipe pipe) {
        throw new UnsupportedOperationException("Must Override");
    }

    protected void xwriteActivated(Pipe pipe) {
        throw new UnsupportedOperationException("Must Override");
    }

    protected void xhiccuped(Pipe pipe) {
        throw new UnsupportedOperationException("Must override");
    }

    @Override // zmq.IPollEvents
    public void inEvent() {
        try {
            processCommands(0, false);
        } catch (ZError.CtxTerminatedException e) {
        }
        checkDestroy();
    }

    @Override // zmq.IPollEvents
    public void outEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void connectEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void acceptEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void timerEvent(int id) {
        throw new UnsupportedOperationException();
    }

    private void checkDestroy() {
        if (this.destroyed) {
            this.poller.removeHandle(this.handle);
            destroySocket(this);
            sendReaped();
            super.processDestroy();
        }
    }

    @Override // zmq.Pipe.IPipeEvents
    public void readActivated(Pipe pipe) {
        xreadActivated(pipe);
    }

    @Override // zmq.Pipe.IPipeEvents
    public void writeActivated(Pipe pipe) {
        xwriteActivated(pipe);
    }

    @Override // zmq.Pipe.IPipeEvents
    public void hiccuped(Pipe pipe) {
        if (this.options.delayAttachOnConnect == 1) {
            pipe.terminate(false);
        } else {
            xhiccuped(pipe);
        }
    }

    @Override // zmq.Pipe.IPipeEvents
    public void pipeTerminated(Pipe pipe) {
        xpipeTerminated(pipe);
        Iterator<Map.Entry<String, Pipe>> it = this.inprocs.entrySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            } else if (it.next().getValue() == pipe) {
                it.remove();
                break;
            }
        }
        this.pipes.remove(pipe);
        if (isTerminating()) {
            unregisterTermAck();
        }
    }

    private void extractFlags(Msg msg) {
        if ((msg.flags() & 64) > 0 && !$assertionsDisabled && !this.options.recvIdentity) {
            throw new AssertionError();
        }
        this.rcvmore = msg.hasMore();
    }

    public boolean monitor(String addr, int events) {
        if (this.ctxTerminated) {
            throw new ZError.CtxTerminatedException();
        }
        if (addr == null) {
            stopMonitor();
            return true;
        }
        try {
            URI uri = new URI(addr);
            String protocol = uri.getScheme();
            String address = uri.getAuthority();
            uri.getPath();
            if (address == null) {
            }
            checkProtocol(protocol);
            if (!protocol.equals("inproc")) {
                stopMonitor();
                throw new IllegalArgumentException("inproc socket required");
            }
            this.monitorEvents = events;
            this.monitorSocket = getCtx().createSocket(0);
            if (this.monitorSocket == null) {
                return false;
            }
            try {
                this.monitorSocket.setSocketOpt(17, 0);
                boolean rc = this.monitorSocket.bind(addr);
                if (!rc) {
                    stopMonitor();
                }
                return rc;
            } catch (IllegalArgumentException e) {
                stopMonitor();
                throw e;
            }
        } catch (URISyntaxException e2) {
            throw new IllegalArgumentException(e2);
        }
    }

    public void eventConnected(String addr, SelectableChannel ch) {
        if ((this.monitorEvents & 1) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(1, addr, ch));
    }

    public void eventConnectDelayed(String addr, int errno) {
        if ((this.monitorEvents & 2) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(2, addr, Integer.valueOf(errno)));
    }

    public void eventConnectRetried(String addr, int interval) {
        if ((this.monitorEvents & 4) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(4, addr, Integer.valueOf(interval)));
    }

    public void eventListening(String addr, SelectableChannel ch) {
        if ((this.monitorEvents & 8) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(8, addr, ch));
    }

    public void eventBindFailed(String addr, int errno) {
        if ((this.monitorEvents & 16) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(16, addr, Integer.valueOf(errno)));
    }

    public void eventAccepted(String addr, SelectableChannel ch) {
        if ((this.monitorEvents & 32) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(32, addr, ch));
    }

    public void eventAcceptFailed(String addr, int errno) {
        if ((this.monitorEvents & 64) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(64, addr, Integer.valueOf(errno)));
    }

    public void eventClosed(String addr, SelectableChannel ch) {
        if ((this.monitorEvents & 128) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(128, addr, ch));
    }

    public void eventCloseFailed(String addr, int errno) {
        if ((this.monitorEvents & 256) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(256, addr, Integer.valueOf(errno)));
    }

    public void eventDisconnected(String addr, SelectableChannel ch) {
        if ((this.monitorEvents & 512) == 0) {
            return;
        }
        monitorEvent(new ZMQ.Event(512, addr, ch));
    }

    protected void monitorEvent(ZMQ.Event event) {
        if (this.monitorSocket == null) {
            return;
        }
        event.write(this.monitorSocket);
    }

    protected void stopMonitor() {
        if (this.monitorSocket != null) {
            if ((this.monitorEvents & 1024) != 0) {
                monitorEvent(new ZMQ.Event(1024, "", 0));
            }
            this.monitorSocket.close();
            this.monitorSocket = null;
            this.monitorEvents = 0;
        }
    }

    public String toString() {
        return super.toString() + "[" + this.options.socketId + "]";
    }

    public SelectableChannel getFD() {
        return this.mailbox.getFd();
    }

    public String typeString() {
        switch (this.options.type) {
            case 0:
                return "PAIR";
            case 1:
                return "PUB";
            case 2:
                return "SUB";
            case 3:
                return "REQ";
            case 4:
                return "REP";
            case 5:
                return "DEALER";
            case 6:
                return "ROUTER";
            case 7:
                return "PULL";
            case 8:
                return "PUSH";
            default:
                return "UNKOWN";
        }
    }

    public int errno() {
        return this.errno.get().intValue();
    }
}
