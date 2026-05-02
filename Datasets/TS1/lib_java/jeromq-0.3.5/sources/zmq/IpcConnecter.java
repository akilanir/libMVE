package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/IpcConnecter.class */
public class IpcConnecter extends TcpConnecter {
    public IpcConnecter(IOThread ioThread, SessionBase session, Options options, Address addr, boolean wait) {
        super(ioThread, session, options, addr, wait);
    }
}
