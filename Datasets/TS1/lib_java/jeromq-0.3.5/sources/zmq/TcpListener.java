package zmq;

import java.io.IOException;
import java.net.Socket;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Iterator;
import zmq.TcpAddress;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/TcpListener.class */
public class TcpListener extends Own implements IPollEvents {
    private static boolean isWindows;
    private final TcpAddress address;
    private ServerSocketChannel handle;
    private SocketBase socket;
    private String endpoint;
    private final IOObject ioObject;
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
        $assertionsDisabled = !TcpListener.class.desiredAssertionStatus();
        String os = System.getProperty("os.name").toLowerCase();
        isWindows = os.indexOf("win") >= 0;
    }

    public TcpListener(IOThread ioThread, SocketBase socket, Options options) {
        super(ioThread, options);
        this.ioObject = new IOObject(ioThread);
        this.address = new TcpAddress();
        this.handle = null;
        this.socket = socket;
    }

    @Override // zmq.Own
    public void destroy() {
        if (!$assertionsDisabled && this.handle != null) {
            throw new AssertionError();
        }
    }

    @Override // zmq.ZObject
    protected void processPlug() {
        this.ioObject.setHandler(this);
        this.ioObject.addHandle(this.handle);
        this.ioObject.setPollAccept(this.handle);
    }

    @Override // zmq.Own, zmq.ZObject
    protected void processTerm(int linger) {
        this.ioObject.setHandler(this);
        this.ioObject.removeHandle(this.handle);
        close();
        super.processTerm(linger);
    }

    @Override // zmq.IPollEvents
    public void acceptEvent() {
        try {
            SocketChannel fd = accept();
            Utils.tuneTcpSocket(fd);
            Utils.tuneTcpKeepalives(fd, this.options.tcpKeepAlive, this.options.tcpKeepAliveCnt, this.options.tcpKeepAliveIdle, this.options.tcpKeepAliveIntvl);
            try {
                StreamEngine engine = new StreamEngine(fd, this.options, this.endpoint);
                IOThread ioThread = chooseIoThread(this.options.affinity);
                SessionBase session = SessionBase.create(ioThread, false, this.socket, this.options, new Address(fd.socket().getRemoteSocketAddress()));
                session.incSeqnum();
                launchChild(session);
                sendAttach(session, engine, false);
                this.socket.eventAccepted(this.endpoint, fd);
            } catch (ZError.InstantiationException e) {
                this.socket.eventAcceptFailed(this.endpoint, 22);
            }
        } catch (IOException e2) {
            this.socket.eventAcceptFailed(this.endpoint, ZError.exccode(e2));
        }
    }

    private void close() {
        if (this.handle == null) {
            return;
        }
        try {
            this.handle.close();
            this.socket.eventClosed(this.endpoint, this.handle);
        } catch (IOException e) {
            this.socket.eventCloseFailed(this.endpoint, ZError.exccode(e));
        }
        this.handle = null;
    }

    public String getAddress() {
        return this.address.toString();
    }

    public int setAddress(String addr) {
        this.address.resolve(addr, this.options.ipv4only > 0);
        try {
            this.handle = ServerSocketChannel.open();
            this.handle.configureBlocking(false);
            if (!isWindows) {
                this.handle.socket().setReuseAddress(true);
            }
            this.handle.socket().bind(this.address.address(), this.options.backlog);
            if (this.address.getPort() == 0) {
                this.address.updatePort(this.handle.socket().getLocalPort());
            }
            this.endpoint = this.address.toString();
            this.socket.eventListening(this.endpoint, this.handle);
            return 0;
        } catch (IOException e) {
            close();
            return 48;
        }
    }

    private SocketChannel accept() {
        try {
            Socket sock = this.handle.socket().accept();
            if (!this.options.tcpAcceptFilters.isEmpty()) {
                boolean matched = false;
                Iterator i$ = this.options.tcpAcceptFilters.iterator();
                while (true) {
                    if (!i$.hasNext()) {
                        break;
                    }
                    TcpAddress.TcpAddressMask am = i$.next();
                    if (am.matchAddress(this.address.address())) {
                        matched = true;
                        break;
                    }
                }
                if (!matched) {
                    try {
                        sock.close();
                        return null;
                    } catch (IOException e) {
                        return null;
                    }
                }
            }
            return sock.getChannel();
        } catch (IOException e2) {
            return null;
        }
    }

    @Override // zmq.IPollEvents
    public void inEvent() {
        throw new UnsupportedOperationException();
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
    public void timerEvent(int id) {
        throw new UnsupportedOperationException();
    }
}
