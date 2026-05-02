package javassist.tools.rmi;

/* loaded from: javassist-3.18.1-GA.jar:javassist/tools/rmi/RemoteException.class */
public class RemoteException extends RuntimeException {
    public RemoteException(String msg) {
        super(msg);
    }

    public RemoteException(Exception e) {
        super("by " + e.toString());
    }
}
