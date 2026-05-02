package freemarker.debug;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/Debugger.class */
public interface Debugger extends Remote {
    public static final int DEFAULT_PORT = 7011;

    void addBreakpoint(Breakpoint breakpoint) throws RemoteException;

    void removeBreakpoint(Breakpoint breakpoint) throws RemoteException;

    void removeBreakpoints(String str) throws RemoteException;

    void removeBreakpoints() throws RemoteException;

    List getBreakpoints() throws RemoteException;

    List getBreakpoints(String str) throws RemoteException;

    Collection getSuspendedEnvironments() throws RemoteException;

    Object addDebuggerListener(DebuggerListener debuggerListener) throws RemoteException;

    void removeDebuggerListener(Object obj) throws RemoteException;
}
