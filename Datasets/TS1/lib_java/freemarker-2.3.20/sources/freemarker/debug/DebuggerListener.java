package freemarker.debug;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.EventListener;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/DebuggerListener.class */
public interface DebuggerListener extends Remote, EventListener {
    void environmentSuspended(EnvironmentSuspendedEvent environmentSuspendedEvent) throws RemoteException;
}
