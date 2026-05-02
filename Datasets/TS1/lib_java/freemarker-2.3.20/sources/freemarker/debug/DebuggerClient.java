package freemarker.debug;

import freemarker.debug.impl.RmiDebuggerListenerImpl;
import freemarker.template.utility.UndeclaredThrowableException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.rmi.RemoteException;
import java.rmi.server.RemoteObject;
import java.security.MessageDigest;
import java.util.Collection;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/DebuggerClient.class */
public class DebuggerClient {
    private DebuggerClient() {
    }

    public static Debugger getDebugger(InetAddress host, int port, String password) throws IOException {
        try {
            Socket s = new Socket(host, port);
            try {
                ObjectOutputStream out = new ObjectOutputStream(s.getOutputStream());
                ObjectInputStream in = new ObjectInputStream(s.getInputStream());
                int protocolVersion = in.readInt();
                if (protocolVersion > 220) {
                    throw new IOException(new StringBuffer().append("Incompatible protocol version ").append(protocolVersion).append(". At most 220 was expected.").toString());
                }
                byte[] challenge = (byte[]) in.readObject();
                MessageDigest md = MessageDigest.getInstance("SHA");
                md.update(password.getBytes("UTF-8"));
                md.update(challenge);
                out.writeObject(md.digest());
                LocalDebuggerProxy localDebuggerProxy = new LocalDebuggerProxy((Debugger) in.readObject());
                s.close();
                return localDebuggerProxy;
            } catch (Throwable th) {
                s.close();
                throw th;
            }
        } catch (IOException e) {
            throw e;
        } catch (Exception e2) {
            throw new UndeclaredThrowableException(e2);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/DebuggerClient$LocalDebuggerProxy.class */
    private static class LocalDebuggerProxy implements Debugger {
        private final Debugger remoteDebugger;

        LocalDebuggerProxy(Debugger remoteDebugger) {
            this.remoteDebugger = remoteDebugger;
        }

        @Override // freemarker.debug.Debugger
        public void addBreakpoint(Breakpoint breakpoint) throws RemoteException {
            this.remoteDebugger.addBreakpoint(breakpoint);
        }

        @Override // freemarker.debug.Debugger
        public Object addDebuggerListener(DebuggerListener listener) throws RemoteException {
            if (listener instanceof RemoteObject) {
                return this.remoteDebugger.addDebuggerListener(listener);
            }
            RmiDebuggerListenerImpl remotableListener = new RmiDebuggerListenerImpl(listener);
            return this.remoteDebugger.addDebuggerListener(remotableListener);
        }

        @Override // freemarker.debug.Debugger
        public List getBreakpoints() throws RemoteException {
            return this.remoteDebugger.getBreakpoints();
        }

        @Override // freemarker.debug.Debugger
        public List getBreakpoints(String templateName) throws RemoteException {
            return this.remoteDebugger.getBreakpoints(templateName);
        }

        @Override // freemarker.debug.Debugger
        public Collection getSuspendedEnvironments() throws RemoteException {
            return this.remoteDebugger.getSuspendedEnvironments();
        }

        @Override // freemarker.debug.Debugger
        public void removeBreakpoint(Breakpoint breakpoint) throws RemoteException {
            this.remoteDebugger.removeBreakpoint(breakpoint);
        }

        @Override // freemarker.debug.Debugger
        public void removeBreakpoints(String templateName) throws RemoteException {
            this.remoteDebugger.removeBreakpoints(templateName);
        }

        @Override // freemarker.debug.Debugger
        public void removeBreakpoints() throws RemoteException {
            this.remoteDebugger.removeBreakpoints();
        }

        @Override // freemarker.debug.Debugger
        public void removeDebuggerListener(Object id) throws RemoteException {
            this.remoteDebugger.removeDebuggerListener(id);
        }
    }
}
