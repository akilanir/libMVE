package zmq;

import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import zmq.Command;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/Ctx.class */
public class Ctx {
    private static AtomicInteger maxSocketId;
    public static final int TERM_TID = 0;
    public static final int REAPER_TID = 1;
    static final /* synthetic */ boolean $assertionsDisabled;
    private AtomicBoolean starting = new AtomicBoolean(true);
    private int tag = -1414673666;
    private boolean terminating = false;
    private Reaper reaper = null;
    private int slotCount = 0;
    private Mailbox[] slots = null;
    private int maxSockets = 1024;
    private int ioThreadCount = 1;
    private boolean blocky = true;
    private final Lock slotSync = new ReentrantLock();
    private final Lock endpointsSync = new ReentrantLock();
    private final Lock optSync = new ReentrantLock();
    private final Mailbox termMailbox = new Mailbox("terminater");
    private final Deque<Integer> emptySlots = new ArrayDeque();
    private final List<IOThread> ioThreads = new ArrayList();
    private final List<SocketBase> sockets = new ArrayList();
    private final Map<String, Endpoint> endpoints = new HashMap();

    static {
        $assertionsDisabled = !Ctx.class.desiredAssertionStatus();
        maxSocketId = new AtomicInteger(0);
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/Ctx$Endpoint.class */
    static class Endpoint {
        public final SocketBase socket;
        public final Options options;

        public Endpoint(SocketBase socket, Options options) {
            this.socket = socket;
            this.options = options;
        }
    }

    private void destroy() throws IOException {
        for (IOThread it : this.ioThreads) {
            it.stop();
        }
        for (IOThread it2 : this.ioThreads) {
            it2.close();
        }
        if (this.reaper != null) {
            this.reaper.close();
        }
        this.termMailbox.close();
        this.tag = -559038737;
    }

    public boolean checkTag() {
        return this.tag == -1414673666;
    }

    public void terminate() {
        this.tag = -559038737;
        if (!this.starting.get()) {
            this.slotSync.lock();
            try {
                boolean restarted = this.terminating;
                this.terminating = true;
                if (!restarted) {
                    for (SocketBase socket : this.sockets) {
                        socket.stop();
                    }
                    if (this.sockets.isEmpty()) {
                        this.reaper.stop();
                    }
                }
                Command cmd = this.termMailbox.recv(-1L);
                if (cmd == null) {
                    throw new IllegalStateException();
                }
                if (!$assertionsDisabled && cmd.type() != Command.Type.DONE) {
                    throw new AssertionError();
                }
                this.slotSync.lock();
                try {
                    if (!$assertionsDisabled && !this.sockets.isEmpty()) {
                        throw new AssertionError();
                    }
                    this.slotSync.unlock();
                } finally {
                    this.slotSync.unlock();
                }
            } finally {
            }
        }
        try {
            destroy();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean set(int option, int optval) {
        if (option == 2 && optval >= 1) {
            this.optSync.lock();
            try {
                this.maxSockets = optval;
                this.optSync.unlock();
                return true;
            } finally {
            }
        }
        if (option == 1 && optval >= 0) {
            this.optSync.lock();
            try {
                this.ioThreadCount = optval;
                this.optSync.unlock();
                return true;
            } finally {
            }
        }
        if (option == 70 && optval >= 0) {
            this.optSync.lock();
            try {
                this.blocky = optval != 0;
                this.optSync.unlock();
                return true;
            } finally {
                this.optSync.unlock();
            }
        }
        return false;
    }

    public int get(int option) {
        int rc;
        if (option == 2) {
            rc = this.maxSockets;
        } else if (option == 1) {
            rc = this.ioThreadCount;
        } else if (option == 70) {
            rc = this.blocky ? 1 : 0;
        } else {
            throw new IllegalArgumentException("option = " + option);
        }
        return rc;
    }

    public SocketBase createSocket(int type) {
        this.slotSync.lock();
        try {
            if (this.starting.compareAndSet(true, false)) {
                this.optSync.lock();
                try {
                    int mazmq = this.maxSockets;
                    int ios = this.ioThreadCount;
                    this.optSync.unlock();
                    this.slotCount = mazmq + ios + 2;
                    this.slots = new Mailbox[this.slotCount];
                    this.slots[0] = this.termMailbox;
                    this.reaper = new Reaper(this, 1);
                    this.slots[1] = this.reaper.getMailbox();
                    this.reaper.start();
                    for (int i = 2; i != ios + 2; i++) {
                        IOThread ioThread = new IOThread(this, i);
                        this.ioThreads.add(ioThread);
                        this.slots[i] = ioThread.getMailbox();
                        ioThread.start();
                    }
                    for (int i2 = this.slotCount - 1; i2 >= ios + 2; i2--) {
                        this.emptySlots.add(Integer.valueOf(i2));
                        this.slots[i2] = null;
                    }
                } catch (Throwable th) {
                    this.optSync.unlock();
                    throw th;
                }
            }
            if (this.terminating) {
                throw new ZError.CtxTerminatedException();
            }
            if (this.emptySlots.isEmpty()) {
                throw new IllegalStateException("EMFILE");
            }
            int slot = this.emptySlots.pollLast().intValue();
            int sid = maxSocketId.incrementAndGet();
            SocketBase s = SocketBase.create(type, this, slot, sid);
            if (s == null) {
                this.emptySlots.addLast(Integer.valueOf(slot));
                this.slotSync.unlock();
                return null;
            }
            this.sockets.add(s);
            this.slots[slot] = s.getMailbox();
            this.slotSync.unlock();
            return s;
        } catch (Throwable th2) {
            this.slotSync.unlock();
            throw th2;
        }
    }

    public void destroySocket(SocketBase socket) {
        this.slotSync.lock();
        try {
            int tid = socket.getTid();
            this.emptySlots.add(Integer.valueOf(tid));
            this.slots[tid] = null;
            this.sockets.remove(socket);
            if (this.terminating && this.sockets.isEmpty()) {
                this.reaper.stop();
            }
        } finally {
            this.slotSync.unlock();
        }
    }

    ZObject getReaper() {
        return this.reaper;
    }

    void sendCommand(int tid, Command command) {
        this.slots[tid].send(command);
    }

    IOThread chooseIoThread(long affinity) {
        if (this.ioThreads.isEmpty()) {
            return null;
        }
        int minLoad = -1;
        IOThread selectedIoThread = null;
        for (int i = 0; i != this.ioThreads.size(); i++) {
            if (affinity == 0 || (affinity & (1 << i)) > 0) {
                int load = this.ioThreads.get(i).getLoad();
                if (selectedIoThread == null || load < minLoad) {
                    minLoad = load;
                    selectedIoThread = this.ioThreads.get(i);
                }
            }
        }
        return selectedIoThread;
    }

    boolean registerEndpoint(String addr, Endpoint endpoint) {
        this.endpointsSync.lock();
        try {
            Endpoint inserted = this.endpoints.put(addr, endpoint);
            this.endpointsSync.unlock();
            if (inserted != null) {
                return false;
            }
            return true;
        } catch (Throwable th) {
            this.endpointsSync.unlock();
            throw th;
        }
    }

    void unregisterEndpoints(SocketBase socket) {
        this.endpointsSync.lock();
        try {
            Iterator<Map.Entry<String, Endpoint>> it = this.endpoints.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, Endpoint> e = it.next();
                if (e.getValue().socket == socket) {
                    it.remove();
                }
            }
        } finally {
            this.endpointsSync.unlock();
        }
    }

    Endpoint findEndpoint(String addr) {
        this.endpointsSync.lock();
        try {
            Endpoint endpoint = this.endpoints.get(addr);
            if (endpoint == null) {
                Endpoint endpoint2 = new Endpoint(null, new Options());
                this.endpointsSync.unlock();
                return endpoint2;
            }
            endpoint.socket.incSeqnum();
            this.endpointsSync.unlock();
            return endpoint;
        } catch (Throwable th) {
            this.endpointsSync.unlock();
            throw th;
        }
    }
}
