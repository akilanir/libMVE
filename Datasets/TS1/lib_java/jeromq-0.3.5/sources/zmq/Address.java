package zmq;

import java.net.Inet6Address;
import java.net.InetSocketAddress;
import java.net.SocketAddress;

/* loaded from: jeromq-0.3.5.jar:zmq/Address.class */
public class Address {
    private final String protocol;
    private final String address;
    private final boolean ipv4only;
    private IZAddress resolved;

    /* loaded from: jeromq-0.3.5.jar:zmq/Address$IZAddress.class */
    public interface IZAddress {
        String toString();

        void resolve(String str, boolean z);

        SocketAddress address();
    }

    public Address(String protocol, String address, boolean ipv4only) {
        this.protocol = protocol;
        this.address = address;
        this.ipv4only = ipv4only;
        this.resolved = null;
    }

    public Address(SocketAddress socketAddress) {
        InetSocketAddress sockAddr = (InetSocketAddress) socketAddress;
        this.address = sockAddr.getAddress().getHostAddress() + ":" + sockAddr.getPort();
        this.protocol = "tcp";
        this.resolved = null;
        this.ipv4only = !(sockAddr.getAddress() instanceof Inet6Address);
    }

    public String toString() {
        if (this.protocol.equals("tcp") && isResolved()) {
            return this.resolved.toString();
        }
        if (this.protocol.equals("ipc") && isResolved()) {
            return this.resolved.toString();
        }
        if (!this.protocol.isEmpty() && !this.address.isEmpty()) {
            return this.protocol + "://" + this.address;
        }
        return "";
    }

    public String protocol() {
        return this.protocol;
    }

    public String address() {
        return this.address;
    }

    public IZAddress resolved() {
        return this.resolved;
    }

    public boolean isResolved() {
        return this.resolved != null;
    }

    public boolean resolve() {
        if (this.protocol.equals("tcp")) {
            this.resolved = new TcpAddress();
            this.resolved.resolve(this.address, this.ipv4only);
            return true;
        }
        if (this.protocol.equals("ipc")) {
            this.resolved = new IpcAddress();
            this.resolved.resolve(this.address, true);
            return true;
        }
        return false;
    }
}
