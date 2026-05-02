package zmq;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.net.UnknownHostException;
import zmq.Address;

/* loaded from: jeromq-0.3.5.jar:zmq/IpcAddress.class */
public class IpcAddress implements Address.IZAddress {
    private String name;
    private InetSocketAddress address;

    @Override // zmq.Address.IZAddress
    public String toString() {
        if (this.name == null) {
            return "";
        }
        return "ipc://" + this.name;
    }

    @Override // zmq.Address.IZAddress
    public void resolve(String name, boolean ip4only) {
        this.name = name;
        int hash = name.hashCode();
        if (hash < 0) {
            hash = -hash;
        }
        try {
            this.address = new InetSocketAddress(InetAddress.getByName(null), (hash % 55536) + 10000);
        } catch (UnknownHostException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override // zmq.Address.IZAddress
    public SocketAddress address() {
        return this.address;
    }
}
