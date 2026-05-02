package freemarker.debug.impl;

import freemarker.debug.DebugModel;
import freemarker.debug.Debugger;
import freemarker.log.Logger;
import freemarker.template.utility.SecurityUtilities;
import freemarker.template.utility.UndeclaredThrowableException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.ServerSocket;
import java.net.Socket;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Random;

/* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/DebuggerServer.class */
class DebuggerServer {
    private static final Logger logger = Logger.getLogger("freemarker.debug.server");
    private static final Random R = new SecureRandom();
    private final byte[] password;
    private final Serializable debuggerStub;
    private ServerSocket serverSocket;
    private boolean stop = false;
    private final int port = SecurityUtilities.getSystemProperty("freemarker.debug.port", Debugger.DEFAULT_PORT).intValue();

    public DebuggerServer(Serializable debuggerStub) {
        try {
            this.password = SecurityUtilities.getSystemProperty("freemarker.debug.password", "").getBytes("UTF-8");
            this.debuggerStub = debuggerStub;
        } catch (UnsupportedEncodingException e) {
            throw new UndeclaredThrowableException(e);
        }
    }

    public void start() {
        new Thread(new Runnable(this) { // from class: freemarker.debug.impl.DebuggerServer.1
            private final DebuggerServer this$0;

            {
                this.this$0 = this;
            }

            @Override // java.lang.Runnable
            public void run() {
                this.this$0.startInternal();
            }
        }, "FreeMarker Debugger Server Acceptor").start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startInternal() {
        try {
            this.serverSocket = new ServerSocket(this.port);
            while (!this.stop) {
                Socket s = this.serverSocket.accept();
                new Thread(new DebuggerAuthProtocol(this, s)).start();
            }
        } catch (IOException e) {
            logger.error("Debugger server shut down.", e);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol.class */
    private class DebuggerAuthProtocol implements Runnable {
        private final Socket s;
        private final DebuggerServer this$0;

        DebuggerAuthProtocol(DebuggerServer debuggerServer, Socket s) {
            this.this$0 = debuggerServer;
            this.s = s;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                ObjectOutputStream out = new ObjectOutputStream(this.s.getOutputStream());
                ObjectInputStream in = new ObjectInputStream(this.s.getInputStream());
                byte[] challenge = new byte[DebugModel.TYPE_METHOD_EX];
                DebuggerServer.R.nextBytes(challenge);
                out.writeInt(220);
                out.writeObject(challenge);
                MessageDigest md = MessageDigest.getInstance("SHA");
                md.update(this.this$0.password);
                md.update(challenge);
                byte[] response = (byte[]) in.readObject();
                if (Arrays.equals(response, md.digest())) {
                    out.writeObject(this.this$0.debuggerStub);
                } else {
                    out.writeObject(null);
                }
            } catch (Exception e) {
                DebuggerServer.logger.warn(new StringBuffer().append("Connection to ").append(this.s.getInetAddress().getHostAddress()).append(" abruply broke").toString(), e);
            }
        }
    }

    public void stop() {
        this.stop = true;
        if (this.serverSocket != null) {
            try {
                this.serverSocket.close();
            } catch (IOException e) {
                logger.error("Unable to close server socket.", e);
            }
        }
    }
}
