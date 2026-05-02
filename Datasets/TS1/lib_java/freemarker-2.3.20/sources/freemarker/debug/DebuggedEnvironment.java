package freemarker.debug;

import java.rmi.RemoteException;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/DebuggedEnvironment.class */
public interface DebuggedEnvironment extends DebugModel {
    void resume() throws RemoteException;

    void stop() throws RemoteException;

    long getId() throws RemoteException;
}
