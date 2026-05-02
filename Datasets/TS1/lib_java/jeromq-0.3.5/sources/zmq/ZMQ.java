package zmq;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.ClosedChannelException;
import java.nio.channels.SelectableChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.charset.Charset;
import java.util.HashMap;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/ZMQ.class */
public class ZMQ {
    public static final int ZMQ_VERSION_MAJOR = 3;
    public static final int ZMQ_VERSION_MINOR = 2;
    public static final int ZMQ_VERSION_PATCH = 5;
    public static final int ZMQ_IO_THREADS = 1;
    public static final int ZMQ_MAX_SOCKETS = 2;
    public static final int ZMQ_IO_THREADS_DFLT = 1;
    public static final int ZMQ_MAX_SOCKETS_DFLT = 1024;
    public static final int ZMQ_PAIR = 0;
    public static final int ZMQ_PUB = 1;
    public static final int ZMQ_SUB = 2;
    public static final int ZMQ_REQ = 3;
    public static final int ZMQ_REP = 4;
    public static final int ZMQ_DEALER = 5;
    public static final int ZMQ_ROUTER = 6;
    public static final int ZMQ_PULL = 7;
    public static final int ZMQ_PUSH = 8;
    public static final int ZMQ_XPUB = 9;
    public static final int ZMQ_XSUB = 10;

    @Deprecated
    public static final int ZMQ_XREQ = 5;

    @Deprecated
    public static final int ZMQ_XREP = 6;
    public static final int ZMQ_AFFINITY = 4;
    public static final int ZMQ_IDENTITY = 5;
    public static final int ZMQ_SUBSCRIBE = 6;
    public static final int ZMQ_UNSUBSCRIBE = 7;
    public static final int ZMQ_RATE = 8;
    public static final int ZMQ_RECOVERY_IVL = 9;
    public static final int ZMQ_SNDBUF = 11;
    public static final int ZMQ_RCVBUF = 12;
    public static final int ZMQ_RCVMORE = 13;
    public static final int ZMQ_FD = 14;
    public static final int ZMQ_EVENTS = 15;
    public static final int ZMQ_TYPE = 16;
    public static final int ZMQ_LINGER = 17;
    public static final int ZMQ_RECONNECT_IVL = 18;
    public static final int ZMQ_BACKLOG = 19;
    public static final int ZMQ_RECONNECT_IVL_MAX = 21;
    public static final int ZMQ_MAXMSGSIZE = 22;
    public static final int ZMQ_SNDHWM = 23;
    public static final int ZMQ_RCVHWM = 24;
    public static final int ZMQ_MULTICAST_HOPS = 25;
    public static final int ZMQ_RCVTIMEO = 27;
    public static final int ZMQ_SNDTIMEO = 28;
    public static final int ZMQ_IPV4ONLY = 31;
    public static final int ZMQ_LAST_ENDPOINT = 32;
    public static final int ZMQ_ROUTER_MANDATORY = 33;
    public static final int ZMQ_TCP_KEEPALIVE = 34;
    public static final int ZMQ_TCP_KEEPALIVE_CNT = 35;
    public static final int ZMQ_TCP_KEEPALIVE_IDLE = 36;
    public static final int ZMQ_TCP_KEEPALIVE_INTVL = 37;
    public static final int ZMQ_TCP_ACCEPT_FILTER = 38;
    public static final int ZMQ_DELAY_ATTACH_ON_CONNECT = 39;
    public static final int ZMQ_XPUB_VERBOSE = 40;
    public static final int ZMQ_ROUTER_HANDOVER = 56;
    public static final int ZMQ_BLOCKY = 70;
    public static final int ZMQ_ENCODER = 1001;
    public static final int ZMQ_DECODER = 1002;
    public static final int ZMQ_MORE = 1;
    public static final int ZMQ_DONTWAIT = 1;
    public static final int ZMQ_SNDMORE = 2;
    public static final int ZMQ_NOBLOCK = 1;
    public static final int ZMQ_FAIL_UNROUTABLE = 33;
    public static final int ZMQ_ROUTER_BEHAVIOR = 33;
    public static final int ZMQ_EVENT_CONNECTED = 1;
    public static final int ZMQ_EVENT_CONNECT_DELAYED = 2;
    public static final int ZMQ_EVENT_CONNECT_RETRIED = 4;
    public static final int ZMQ_EVENT_LISTENING = 8;
    public static final int ZMQ_EVENT_BIND_FAILED = 16;
    public static final int ZMQ_EVENT_ACCEPTED = 32;
    public static final int ZMQ_EVENT_ACCEPT_FAILED = 64;
    public static final int ZMQ_EVENT_CLOSED = 128;
    public static final int ZMQ_EVENT_CLOSE_FAILED = 256;
    public static final int ZMQ_EVENT_DISCONNECTED = 512;
    public static final int ZMQ_EVENT_MONITOR_STOPPED = 1024;
    public static final int ZMQ_EVENT_ALL = 2047;
    public static final int ZMQ_POLLIN = 1;
    public static final int ZMQ_POLLOUT = 2;
    public static final int ZMQ_POLLERR = 4;
    public static final int ZMQ_STREAMER = 1;
    public static final int ZMQ_FORWARDER = 2;
    public static final int ZMQ_QUEUE = 3;
    public static final byte[] MESSAGE_SEPARATOR = new byte[0];
    public static final byte[] SUBSCRIPTION_ALL = new byte[0];
    public static final Charset CHARSET = Charset.forName("UTF-8");
    private static final ThreadLocal<PollSelector> POLL_SELECTOR = new ThreadLocal<>();

    /* loaded from: jeromq-0.3.5.jar:zmq/ZMQ$Event.class */
    public static class Event {
        private static final int VALUE_INTEGER = 1;
        private static final int VALUE_CHANNEL = 2;
        public final int event;
        public final String addr;
        public final Object arg;
        private final int flag;

        public Event(int event, String addr, Object arg) {
            this.event = event;
            this.addr = addr;
            this.arg = arg;
            if (arg instanceof Integer) {
                this.flag = 1;
            } else if (arg instanceof SelectableChannel) {
                this.flag = 2;
            } else {
                this.flag = 0;
            }
        }

        public boolean write(SocketBase s) {
            int size = 5 + this.addr.length() + 1;
            if (this.flag == 1) {
                size += 4;
            }
            ByteBuffer buffer = ByteBuffer.allocate(size).order(ByteOrder.BIG_ENDIAN);
            buffer.putInt(this.event);
            buffer.put((byte) this.addr.length());
            buffer.put(this.addr.getBytes(ZMQ.CHARSET));
            buffer.put((byte) this.flag);
            if (this.flag == 1) {
                buffer.putInt(((Integer) this.arg).intValue());
            }
            buffer.flip();
            Msg msg = new Msg(buffer);
            return s.send(msg, 0);
        }

        public static Event read(SocketBase s, int flags) {
            Msg msg = s.recv(flags);
            if (msg == null) {
                return null;
            }
            ByteBuffer buffer = msg.buf();
            int event = buffer.getInt();
            int len = buffer.get();
            byte[] addr = new byte[len];
            buffer.get(addr);
            int flag = buffer.get();
            Object arg = null;
            if (flag == 1) {
                arg = Integer.valueOf(buffer.getInt());
            }
            return new Event(event, new String(addr, ZMQ.CHARSET), arg);
        }

        public static Event read(SocketBase s) {
            return read(s, 0);
        }
    }

    public static Ctx createContext() {
        Ctx ctx = new Ctx();
        return ctx;
    }

    private static void destroyContext(Ctx ctx) {
        if (ctx == null || !ctx.checkTag()) {
            throw new IllegalStateException();
        }
        ctx.terminate();
    }

    public static void setContextOption(Ctx ctx, int option, int optval) {
        if (ctx == null || !ctx.checkTag()) {
            throw new IllegalStateException();
        }
        ctx.set(option, optval);
    }

    public static int getContextOption(Ctx ctx, int option) {
        if (ctx == null || !ctx.checkTag()) {
            throw new IllegalStateException();
        }
        return ctx.get(option);
    }

    public static Ctx init(int ioThreads) {
        if (ioThreads >= 0) {
            Ctx ctx = createContext();
            setContextOption(ctx, 1, ioThreads);
            return ctx;
        }
        throw new IllegalArgumentException("io_threds must not be negative");
    }

    public static void term(Ctx ctx) {
        destroyContext(ctx);
    }

    public static SocketBase socket(Ctx ctx, int type) {
        if (ctx == null || !ctx.checkTag()) {
            throw new IllegalStateException();
        }
        SocketBase s = ctx.createSocket(type);
        return s;
    }

    public static void close(SocketBase s) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        s.close();
    }

    public static void setSocketOption(SocketBase s, int option, Object optval) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        s.setSocketOpt(option, optval);
    }

    public static Object getSocketOptionExt(SocketBase s, int option) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        return s.getsockoptx(option);
    }

    public static int getSocketOption(SocketBase s, int opt) {
        return s.getSocketOpt(opt);
    }

    public static boolean monitorSocket(SocketBase s, String addr, int events) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        return s.monitor(addr, events);
    }

    public static boolean bind(SocketBase s, String addr) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        return s.bind(addr);
    }

    public static boolean connect(SocketBase s, String addr) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        return s.connect(addr);
    }

    public static boolean unbind(SocketBase s, String addr) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        return s.termEndpoint(addr);
    }

    public static boolean disconnect(SocketBase s, String addr) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        return s.termEndpoint(addr);
    }

    public static int send(SocketBase s, String str, int flags) {
        byte[] data = str.getBytes(CHARSET);
        return send(s, data, data.length, flags);
    }

    public static int send(SocketBase s, Msg msg, int flags) {
        int rc = sendMsg(s, msg, flags);
        if (rc < 0) {
            return -1;
        }
        return rc;
    }

    public static int send(SocketBase s, byte[] buf, int len, int flags) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        Msg msg = new Msg(len);
        msg.put(buf, 0, len);
        int rc = sendMsg(s, msg, flags);
        if (rc < 0) {
            return -1;
        }
        return rc;
    }

    public int sendiov(SocketBase s, byte[][] a, int count, int flags) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        int rc = 0;
        int i = 0;
        while (true) {
            if (i >= count) {
                break;
            }
            Msg msg = new Msg(a[i]);
            if (i == count - 1) {
                flags &= -3;
            }
            rc = sendMsg(s, msg, flags);
            if (rc >= 0) {
                i++;
            } else {
                rc = -1;
                break;
            }
        }
        return rc;
    }

    public static int sendMsg(SocketBase s, Msg msg, int flags) {
        int sz = msgSize(msg);
        boolean rc = s.send(msg, flags);
        if (!rc) {
            return -1;
        }
        return sz;
    }

    public static Msg recv(SocketBase s, int flags) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        Msg msg = recvMsg(s, flags);
        if (msg == null) {
            return null;
        }
        return msg;
    }

    public int recviov(SocketBase s, byte[][] a, int count, int flags) {
        if (s == null || !s.checkTag()) {
            throw new IllegalStateException();
        }
        int nread = 0;
        boolean recvmore = true;
        int i = 0;
        while (true) {
            if (!recvmore || i >= count) {
                break;
            }
            Msg msg = recvMsg(s, flags);
            if (msg == null) {
                nread = -1;
                break;
            }
            a[i] = msg.data();
            recvmore = msg.hasMore();
            i++;
        }
        return nread;
    }

    public static Msg recvMsg(SocketBase s, int flags) {
        return s.recv(flags);
    }

    public static Msg msgInit() {
        return new Msg();
    }

    public static Msg msgInitWithSize(int messageSize) {
        return new Msg(messageSize);
    }

    public static int msgSize(Msg msg) {
        return msg.size();
    }

    public static int getMessageOption(Msg msg, int option) {
        switch (option) {
            case 1:
                return msg.hasMore() ? 1 : 0;
            default:
                throw new IllegalArgumentException();
        }
    }

    public static void sleep(int s) {
        try {
            Thread.sleep(s * 1000);
        } catch (InterruptedException e) {
        }
    }

    public static boolean proxy(SocketBase frontend, SocketBase backend, SocketBase control) {
        if (frontend == null || backend == null) {
            throw new IllegalArgumentException();
        }
        return Proxy.proxy(frontend, backend, control);
    }

    @Deprecated
    public static boolean device(int device, SocketBase insocket, SocketBase outsocket) {
        return Proxy.proxy(insocket, outsocket, null);
    }

    public static int poll(PollItem[] items, long timeout) {
        return poll(items, items.length, timeout);
    }

    public static int poll(PollItem[] items, int count, long timeout) {
        try {
            Selector selector = PollSelector.open();
            int ret = poll(selector, items, count, timeout);
            return ret;
        } catch (IOException e) {
            throw new ZError.IOException(e);
        }
    }

    public static int poll(Selector selector, PollItem[] items, long timeout) {
        return poll(selector, items, items.length, timeout);
    }

    public static int poll(Selector selector, PollItem[] items, int count, long timeout) {
        long waitMillis;
        int rc;
        if (items == null) {
            throw new IllegalArgumentException();
        }
        if (count == 0) {
            if (timeout <= 0) {
                return 0;
            }
            try {
                Thread.sleep(timeout);
                return 0;
            } catch (InterruptedException e) {
                return 0;
            }
        }
        long now = 0;
        long end = 0;
        HashMap<SelectableChannel, SelectionKey> saved = new HashMap<>();
        for (SelectionKey key : selector.keys()) {
            if (key.isValid()) {
                saved.put(key.channel(), key);
            }
        }
        for (int i = 0; i < count; i++) {
            PollItem item = items[i];
            if (item != null) {
                SelectableChannel ch = item.getChannel();
                SelectionKey key2 = saved.remove(ch);
                if (key2 != null) {
                    if (key2.interestOps() != item.interestOps()) {
                        key2.interestOps(item.interestOps());
                    }
                    key2.attach(item);
                } else {
                    try {
                        ch.register(selector, item.interestOps(), item);
                    } catch (ClosedChannelException e2) {
                        throw new ZError.IOException(e2);
                    }
                }
            }
        }
        if (!saved.isEmpty()) {
            for (SelectionKey deprecated : saved.values()) {
                deprecated.cancel();
            }
        }
        boolean firstPass = true;
        int nevents = 0;
        while (true) {
            if (firstPass) {
                waitMillis = 0;
            } else if (timeout < 0) {
                waitMillis = -1;
            } else {
                waitMillis = end - now;
            }
            if (waitMillis < 0) {
                try {
                    rc = selector.select(0L);
                } catch (IOException e3) {
                    throw new ZError.IOException(e3);
                }
            } else if (waitMillis == 0) {
                rc = selector.selectNow();
            } else {
                rc = selector.select(waitMillis);
            }
            for (SelectionKey key3 : selector.keys()) {
                int ready = ((PollItem) key3.attachment()).readyOps(key3, rc);
                if (ready < 0) {
                    return -1;
                }
                if (ready > 0) {
                    nevents++;
                }
            }
            selector.selectedKeys().clear();
            if (timeout == 0 || nevents > 0) {
                break;
            }
            if (timeout < 0) {
                if (firstPass) {
                    firstPass = false;
                }
            } else if (firstPass) {
                now = Clock.nowMS();
                end = now + timeout;
                if (now == end) {
                    break;
                }
                firstPass = false;
            } else {
                now = Clock.nowMS();
                if (now >= end) {
                    break;
                }
            }
        }
        return nevents;
    }

    public static long startStopwatch() {
        return System.nanoTime();
    }

    public static long stopStopwatch(long watch) {
        return (System.nanoTime() - watch) / 1000;
    }

    public static int makeVersion(int major, int minor, int patch) {
        return (major * 10000) + (minor * 100) + patch;
    }

    public static String strerror(int errno) {
        return "Errno = " + errno;
    }

    /* loaded from: jeromq-0.3.5.jar:zmq/ZMQ$PollSelector.class */
    private static class PollSelector {
        private Selector selector;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !ZMQ.class.desiredAssertionStatus();
        }

        private PollSelector(Selector selector) {
            this.selector = selector;
        }

        public static Selector open() throws IOException {
            PollSelector polls = (PollSelector) ZMQ.POLL_SELECTOR.get();
            if (polls == null) {
                synchronized (ZMQ.POLL_SELECTOR) {
                    polls = (PollSelector) ZMQ.POLL_SELECTOR.get();
                    if (polls == null) {
                        try {
                            polls = new PollSelector(Selector.open());
                            ZMQ.POLL_SELECTOR.set(polls);
                        } catch (IOException e) {
                            throw new ZError.IOException(e);
                        }
                    }
                }
            }
            return polls.get();
        }

        public Selector get() {
            if (!$assertionsDisabled && this.selector == null) {
                throw new AssertionError();
            }
            if ($assertionsDisabled || this.selector.isOpen()) {
                return this.selector;
            }
            throw new AssertionError();
        }

        public void finalize() {
            try {
                this.selector.close();
            } catch (IOException e) {
            }
            try {
                super.finalize();
            } catch (Throwable th) {
            }
        }
    }
}
