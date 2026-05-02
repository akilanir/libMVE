package zmq;

import java.io.IOException;
import java.net.ConnectException;
import java.net.SocketAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.nio.channels.SocketChannel;
import zmq.Address;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/TcpConnecter.class */
public class TcpConnecter extends Own implements IPollEvents {
    private static final int RECONNECT_TIMER_ID = 1;
    private final IOObject ioObject;
    private final Address addr;
    private SocketChannel handle;
    private boolean handleValid;
    private boolean delayedStart;
    private boolean timerStarted;
    private SessionBase session;
    private int currentReconnectIvl;
    private Address address;
    private SocketBase socket;
    static final /* synthetic */ boolean $assertionsDisabled;

    @Override // zmq.Own
    public /* bridge */ /* synthetic */ void unregisterTermAck() {
        super.unregisterTermAck();
    }

    @Override // zmq.Own
    public /* bridge */ /* synthetic */ void registerTermAcks(int x0) {
        super.registerTermAcks(x0);
    }

    static {
        $assertionsDisabled = !TcpConnecter.class.desiredAssertionStatus();
    }

    public TcpConnecter(IOThread ioThread, SessionBase session, Options options, Address addr, boolean delayedStart) {
        super(ioThread, options);
        this.ioObject = new IOObject(ioThread);
        this.addr = addr;
        this.handle = null;
        this.handleValid = false;
        this.delayedStart = delayedStart;
        this.timerStarted = false;
        this.session = session;
        this.currentReconnectIvl = this.options.reconnectIvl;
        if (!$assertionsDisabled && this.addr == null) {
            throw new AssertionError();
        }
        this.address = this.addr;
        this.socket = session.getSocket();
    }

    @Override // zmq.Own
    public void destroy() {
        if (!$assertionsDisabled && this.timerStarted) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && this.handleValid) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && this.handle != null) {
            throw new AssertionError();
        }
    }

    @Override // zmq.ZObject
    protected void processPlug() {
        this.ioObject.setHandler(this);
        if (this.delayedStart) {
            addreconnectTimer();
        } else {
            startConnecting();
        }
    }

    @Override // zmq.Own, zmq.ZObject
    public void processTerm(int linger) {
        if (this.timerStarted) {
            this.ioObject.cancelTimer(1);
            this.timerStarted = false;
        }
        if (this.handleValid) {
            this.ioObject.removeHandle(this.handle);
            this.handleValid = false;
        }
        if (this.handle != null) {
            close();
        }
        super.processTerm(linger);
    }

    @Override // zmq.IPollEvents
    public void inEvent() {
    }

    @Override // zmq.IPollEvents
    public void outEvent() {
    }

    @Override // zmq.IPollEvents
    public void acceptEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void connectEvent() {
        boolean err = false;
        SocketChannel fd = null;
        try {
            fd = connect();
        } catch (ConnectException e) {
            err = true;
        } catch (SocketException e2) {
            err = true;
        } catch (SocketTimeoutException e3) {
            err = true;
        } catch (IOException e4) {
            throw new ZError.IOException(e4);
        }
        this.ioObject.removeHandle(this.handle);
        this.handleValid = false;
        if (err) {
            close();
            addreconnectTimer();
            return;
        }
        this.handle = null;
        try {
            Utils.tuneTcpSocket(fd);
            Utils.tuneTcpKeepalives(fd, this.options.tcpKeepAlive, this.options.tcpKeepAliveCnt, this.options.tcpKeepAliveIdle, this.options.tcpKeepAliveIntvl);
            try {
                StreamEngine engine = new StreamEngine(fd, this.options, this.address.toString());
                sendAttach(this.session, engine);
                terminate();
                this.socket.eventConnected(this.address.toString(), fd);
            } catch (ZError.InstantiationException e5) {
                this.socket.eventConnectDelayed(this.address.toString(), -1);
            }
        } catch (SocketException e6) {
            throw new RuntimeException(e6);
        }
    }

    @Override // zmq.IPollEvents
    public void timerEvent(int id) {
        this.timerStarted = false;
        startConnecting();
    }

    private void startConnecting() {
        try {
            boolean rc = open();
            if (rc) {
                this.ioObject.addHandle(this.handle);
                this.handleValid = true;
                this.ioObject.connectEvent();
            } else {
                this.ioObject.addHandle(this.handle);
                this.handleValid = true;
                this.ioObject.setPollConnect(this.handle);
                this.socket.eventConnectDelayed(this.address.toString(), -1);
            }
        } catch (IOException e) {
            if (this.handle != null) {
                close();
            }
            addreconnectTimer();
        }
    }

    private void addreconnectTimer() {
        int rcIvl = getNewReconnectIvl();
        this.ioObject.addTimer(rcIvl, 1);
        try {
            this.address.resolve();
        } catch (Exception e) {
        }
        this.socket.eventConnectRetried(this.address.toString(), rcIvl);
        this.timerStarted = true;
    }

    private int getNewReconnectIvl() {
        int thisInterval = this.currentReconnectIvl + (Utils.generateRandom() % this.options.reconnectIvl);
        if (this.options.reconnectIvlMax > 0 && this.options.reconnectIvlMax > this.options.reconnectIvl) {
            this.currentReconnectIvl *= 2;
            if (this.currentReconnectIvl >= this.options.reconnectIvlMax) {
                this.currentReconnectIvl = this.options.reconnectIvlMax;
            }
        }
        return thisInterval;
    }

    private boolean open() throws IOException {
        if (!$assertionsDisabled && this.handle != null) {
            throw new AssertionError();
        }
        this.handle = SocketChannel.open();
        Utils.unblockSocket(this.handle);
        if (this.addr == null) {
            throw new IOException("Null address");
        }
        Address.IZAddress resolved = this.addr.resolved();
        if (resolved == null) {
            throw new IOException("Address not resolved");
        }
        SocketAddress sa = resolved.address();
        if (sa == null) {
            throw new IOException("Socket address not resolved");
        }
        try {
            boolean rc = this.handle.connect(sa);
            return rc;
        } catch (IllegalArgumentException e) {
            throw new IOException(e.getMessage(), e);
        }
    }

    private SocketChannel connect() throws IOException {
        boolean finished = this.handle.finishConnect();
        if (!$assertionsDisabled && !finished) {
            throw new AssertionError();
        }
        SocketChannel ret = this.handle;
        return ret;
    }

    private void close() {
        if (!$assertionsDisabled && this.handle == null) {
            throw new AssertionError();
        }
        try {
            this.handle.close();
            this.socket.eventClosed(this.address.toString(), this.handle);
        } catch (IOException e) {
            this.socket.eventCloseFailed(this.address.toString(), ZError.exccode(e));
        }
        this.handle = null;
    }
}
