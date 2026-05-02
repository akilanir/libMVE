package ch.qos.logback.classic.net;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.spi.JoranException;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import javax.net.ServerSocketFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SimpleSocketServer.class */
public class SimpleSocketServer extends Thread {
    private final int port;
    private final LoggerContext lc;
    private ServerSocket serverSocket;
    private CountDownLatch latch;
    Logger logger = LoggerFactory.getLogger(SimpleSocketServer.class);
    private boolean closed = false;
    private List<SocketNode> socketNodeList = new ArrayList();

    public static void main(String[] strArr) throws Exception {
        doMain(SimpleSocketServer.class, strArr);
    }

    protected static void doMain(Class<? extends SimpleSocketServer> cls, String[] strArr) throws Exception {
        int i = -1;
        if (strArr.length == 2) {
            i = parsePortNumber(strArr[0]);
        } else {
            usage("Wrong number of arguments.");
        }
        String str = strArr[1];
        LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
        configureLC(loggerContext, str);
        new SimpleSocketServer(loggerContext, i).start();
    }

    public SimpleSocketServer(LoggerContext loggerContext, int i) {
        this.lc = loggerContext;
        this.port = i;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        String name = Thread.currentThread().getName();
        try {
            try {
                Thread.currentThread().setName(getServerThreadName());
                this.logger.info("Listening on port " + this.port);
                this.serverSocket = getServerSocketFactory().createServerSocket(this.port);
                while (!this.closed) {
                    this.logger.info("Waiting to accept a new client.");
                    signalAlmostReadiness();
                    Socket accept = this.serverSocket.accept();
                    this.logger.info("Connected to client at " + accept.getInetAddress());
                    this.logger.info("Starting new socket node.");
                    SocketNode socketNode = new SocketNode(this, accept, this.lc);
                    synchronized (this.socketNodeList) {
                        this.socketNodeList.add(socketNode);
                    }
                    new Thread(socketNode, getClientThreadName(accept)).start();
                }
                Thread.currentThread().setName(name);
            } catch (Exception e) {
                if (this.closed) {
                    this.logger.info("Exception in run method for a closed server. This is normal.");
                } else {
                    this.logger.error("Unexpected failure in run method", e);
                }
                Thread.currentThread().setName(name);
            }
        } catch (Throwable th) {
            Thread.currentThread().setName(name);
            throw th;
        }
    }

    protected String getServerThreadName() {
        return String.format("Logback %s (port %d)", getClass().getSimpleName(), Integer.valueOf(this.port));
    }

    protected String getClientThreadName(Socket socket) {
        return String.format("Logback SocketNode (client: %s)", socket.getRemoteSocketAddress());
    }

    protected ServerSocketFactory getServerSocketFactory() {
        return ServerSocketFactory.getDefault();
    }

    void signalAlmostReadiness() {
        if (this.latch == null || this.latch.getCount() == 0) {
            return;
        }
        this.latch.countDown();
    }

    void setLatch(CountDownLatch countDownLatch) {
        this.latch = countDownLatch;
    }

    public CountDownLatch getLatch() {
        return this.latch;
    }

    public boolean isClosed() {
        return this.closed;
    }

    public void close() {
        this.closed = true;
        try {
        } catch (IOException e) {
            this.logger.error("Failed to close serverSocket", e);
        } finally {
            this.serverSocket = null;
        }
        if (this.serverSocket != null) {
            this.serverSocket.close();
        }
        this.logger.info("closing this server");
        synchronized (this.socketNodeList) {
            Iterator<SocketNode> it = this.socketNodeList.iterator();
            while (it.hasNext()) {
                it.next().close();
            }
        }
        if (this.socketNodeList.size() != 0) {
            this.logger.warn("Was expecting a 0-sized socketNodeList after server shutdown");
        }
    }

    public void socketNodeClosing(SocketNode socketNode) {
        this.logger.debug("Removing {}", socketNode);
        synchronized (this.socketNodeList) {
            this.socketNodeList.remove(socketNode);
        }
    }

    static void usage(String str) {
        System.err.println(str);
        System.err.println("Usage: java " + SimpleSocketServer.class.getName() + " port configFile");
        System.exit(1);
    }

    static int parsePortNumber(String str) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            usage("Could not interpret port number [" + str + "].");
            return -1;
        }
    }

    public static void configureLC(LoggerContext loggerContext, String str) throws JoranException {
        JoranConfigurator joranConfigurator = new JoranConfigurator();
        loggerContext.reset();
        joranConfigurator.setContext(loggerContext);
        joranConfigurator.doConfigure(str);
    }
}
