package org.zeromq;

import java.io.Closeable;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.zeromq.ZMQ;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZContext.class */
public class ZContext implements Closeable {
    private volatile ZMQ.Context context;
    private List<ZMQ.Socket> sockets;
    private int ioThreads;
    private int linger;
    private int hwm;
    private boolean main;

    public ZContext() {
        this(1);
    }

    public ZContext(int ioThreads) {
        this.sockets = new CopyOnWriteArrayList();
        this.ioThreads = ioThreads;
        this.linger = 0;
        this.main = true;
    }

    public void destroy() {
        for (ZMQ.Socket socket : this.sockets) {
            try {
                socket.setLinger(this.linger);
            } catch (ZError.CtxTerminatedException e) {
            }
            socket.close();
        }
        this.sockets.clear();
        if (isMain() && this.context != null) {
            this.context.term();
        }
        this.context = null;
    }

    public ZMQ.Socket createSocket(int type) {
        ZMQ.Socket socket = getContext().socket(type);
        this.sockets.add(socket);
        return socket;
    }

    public void destroySocket(ZMQ.Socket s) {
        if (s != null && this.sockets.contains(s)) {
            try {
                s.setLinger(this.linger);
            } catch (ZError.CtxTerminatedException e) {
            }
            s.close();
            this.sockets.remove(s);
        }
    }

    public static ZContext shadow(ZContext ctx) {
        ZContext shadow = new ZContext();
        shadow.setContext(ctx.getContext());
        shadow.setMain(false);
        return shadow;
    }

    public int getIoThreads() {
        return this.ioThreads;
    }

    public void setIoThreads(int ioThreads) {
        this.ioThreads = ioThreads;
    }

    public int getLinger() {
        return this.linger;
    }

    public void setLinger(int linger) {
        this.linger = linger;
    }

    public int getHWM() {
        return this.hwm;
    }

    public void setHWM(int hwm) {
        this.hwm = hwm;
    }

    public boolean isMain() {
        return this.main;
    }

    public void setMain(boolean main) {
        this.main = main;
    }

    public ZMQ.Context getContext() {
        ZMQ.Context result = this.context;
        if (result == null) {
            synchronized (this) {
                result = this.context;
                if (result == null) {
                    result = ZMQ.context(this.ioThreads);
                    this.context = result;
                }
            }
        }
        return result;
    }

    public void setContext(ZMQ.Context ctx) {
        this.context = ctx;
    }

    public List<ZMQ.Socket> getSockets() {
        return this.sockets;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        destroy();
    }
}
