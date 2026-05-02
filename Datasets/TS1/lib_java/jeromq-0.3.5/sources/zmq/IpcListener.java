package zmq;

import java.net.InetSocketAddress;

/* loaded from: jeromq-0.3.5.jar:zmq/IpcListener.class */
public class IpcListener extends TcpListener {
    private final IpcAddress address;

    public IpcListener(IOThread ioThread, SocketBase socket, Options options) {
        super(ioThread, socket, options);
        this.address = new IpcAddress();
    }

    @Override // zmq.TcpListener
    public String getAddress() {
        return this.address.toString();
    }

    @Override // zmq.TcpListener
    public int setAddress(String addr) {
        this.address.resolve(addr, false);
        InetSocketAddress sock = (InetSocketAddress) this.address.address();
        String fake = sock.getAddress().getHostAddress() + ":" + sock.getPort();
        return super.setAddress(fake);
    }
}
