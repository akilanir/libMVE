package zmq;

import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.net.UnknownHostException;
import zmq.Address;

/* loaded from: jeromq-0.3.5.jar:zmq/TcpAddress.class */
public class TcpAddress implements Address.IZAddress {
    protected InetSocketAddress address;

    /* loaded from: jeromq-0.3.5.jar:zmq/TcpAddress$TcpAddressMask.class */
    public static class TcpAddressMask extends TcpAddress {
        public boolean matchAddress(SocketAddress addr) {
            return this.address.equals(addr);
        }
    }

    public TcpAddress(String addr) {
        resolve(addr, false);
    }

    public TcpAddress() {
    }

    @Override // zmq.Address.IZAddress
    public String toString() {
        if (this.address == null) {
            return "";
        }
        if (this.address.getAddress() instanceof Inet6Address) {
            return "tcp://[" + this.address.getAddress().getHostAddress() + "]:" + this.address.getPort();
        }
        return "tcp://" + this.address.getAddress().getHostAddress() + ":" + this.address.getPort();
    }

    public int getPort() {
        if (this.address != null) {
            return this.address.getPort();
        }
        return -1;
    }

    protected void updatePort(int port) {
        this.address = new InetSocketAddress(this.address.getAddress(), port);
    }

    @Override // zmq.Address.IZAddress
    public void resolve(String name, boolean ipv4only) {
        int port;
        int delimiter = name.lastIndexOf(58);
        if (delimiter < 0) {
            throw new IllegalArgumentException(name);
        }
        String addrStr = name.substring(0, delimiter);
        String portStr = name.substring(delimiter + 1);
        if (addrStr.length() >= 2 && addrStr.charAt(0) == '[' && addrStr.charAt(addrStr.length() - 1) == ']') {
            addrStr = addrStr.substring(1, addrStr.length() - 1);
        }
        if (portStr.equals("*") || portStr.equals("0")) {
            port = 0;
        } else {
            port = Integer.parseInt(portStr);
            if (port == 0) {
                throw new IllegalArgumentException(name);
            }
        }
        InetAddress addrNet = null;
        if (addrStr.equals("*")) {
            addrStr = "0.0.0.0";
        }
        try {
            InetAddress[] arr$ = InetAddress.getAllByName(addrStr);
            for (InetAddress ia : arr$) {
                if (!ipv4only || !(ia instanceof Inet6Address)) {
                    addrNet = ia;
                    break;
                }
            }
            if (addrNet == null) {
                throw new IllegalArgumentException(name);
            }
            this.address = new InetSocketAddress(addrNet, port);
        } catch (UnknownHostException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override // zmq.Address.IZAddress
    public SocketAddress address() {
        return this.address;
    }
}
