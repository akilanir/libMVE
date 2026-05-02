package freemarker.debug.impl;

import freemarker.debug.DebuggerListener;
import freemarker.debug.EnvironmentSuspendedEvent;
import java.lang.reflect.Method;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.rmi.UnexpectedException;
import java.rmi.server.RemoteObject;
import java.rmi.server.RemoteRef;
import java.rmi.server.RemoteStub;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/RmiDebuggerListenerImpl_Stub.class */
public final class RmiDebuggerListenerImpl_Stub extends RemoteStub implements DebuggerListener, Remote {
    private static final long serialVersionUID = 2;
    private static Method $method_environmentSuspended_0;
    static Class class$freemarker$debug$DebuggerListener;
    static Class class$freemarker$debug$EnvironmentSuspendedEvent;

    static {
        Class class$;
        Class<?> class$2;
        try {
            if (class$freemarker$debug$DebuggerListener != null) {
                class$ = class$freemarker$debug$DebuggerListener;
            } else {
                class$ = class$("freemarker.debug.DebuggerListener");
                class$freemarker$debug$DebuggerListener = class$;
            }
            Class<?>[] clsArr = new Class[1];
            if (class$freemarker$debug$EnvironmentSuspendedEvent != null) {
                class$2 = class$freemarker$debug$EnvironmentSuspendedEvent;
            } else {
                class$2 = class$("freemarker.debug.EnvironmentSuspendedEvent");
                class$freemarker$debug$EnvironmentSuspendedEvent = class$2;
            }
            clsArr[0] = class$2;
            $method_environmentSuspended_0 = class$.getMethod("environmentSuspended", clsArr);
        } catch (NoSuchMethodException unused) {
            throw new NoSuchMethodError("stub class initialization failed");
        }
    }

    public RmiDebuggerListenerImpl_Stub(RemoteRef remoteRef) {
        super(remoteRef);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    @Override // freemarker.debug.DebuggerListener
    public void environmentSuspended(EnvironmentSuspendedEvent environmentSuspendedEvent) throws RemoteException {
        try {
            ((RemoteObject) this).ref.invoke(this, $method_environmentSuspended_0, new Object[]{environmentSuspendedEvent}, -2541155567719209082L);
        } catch (RuntimeException e) {
            throw e;
        } catch (RemoteException e2) {
            throw e2;
        } catch (Exception e3) {
            throw new UnexpectedException("undeclared checked exception", e3);
        }
    }
}
