package org.zeromq;

import java.io.Closeable;
import java.nio.ByteBuffer;
import java.nio.channels.SelectableChannel;
import java.nio.charset.Charset;
import java.util.concurrent.atomic.AtomicBoolean;
import zmq.Ctx;
import zmq.DecoderBase;
import zmq.EncoderBase;
import zmq.Msg;
import zmq.SocketBase;
import zmq.ZError;
import zmq.ZMQ;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQ.class */
public class ZMQ {
    public static final int SNDMORE = 2;
    public static final int DONTWAIT = 1;
    public static final int NOBLOCK = 1;
    public static final int PAIR = 0;
    public static final int PUB = 1;
    public static final int SUB = 2;
    public static final int REQ = 3;
    public static final int REP = 4;
    public static final int DEALER = 5;
    public static final int XREQ = 5;
    public static final int ROUTER = 6;
    public static final int XREP = 6;
    public static final int PULL = 7;
    public static final int PUSH = 8;
    public static final int XPUB = 9;
    public static final int XSUB = 10;
    public static final int STREAMER = 1;
    public static final int FORWARDER = 2;
    public static final int QUEUE = 3;

    @Deprecated
    public static final int UPSTREAM = 7;

    @Deprecated
    public static final int DOWNSTREAM = 8;
    public static final int EVENT_CONNECTED = 1;
    public static final int EVENT_CONNECT_DELAYED = 2;

    @Deprecated
    public static final int EVENT_DELAYED = 2;
    public static final int EVENT_CONNECT_RETRIED = 4;

    @Deprecated
    public static final int EVENT_RETRIED = 4;
    public static final int EVENT_LISTENING = 8;
    public static final int EVENT_BIND_FAILED = 16;
    public static final int EVENT_ACCEPTED = 32;
    public static final int EVENT_ACCEPT_FAILED = 64;
    public static final int EVENT_CLOSED = 128;
    public static final int EVENT_CLOSE_FAILED = 256;
    public static final int EVENT_DISCONNECTED = 512;
    public static final int EVENT_MONITOR_STOPPED = 1024;
    public static final int EVENT_ALL = 2047;
    public static final byte[] MESSAGE_SEPARATOR = new byte[0];
    public static final byte[] SUBSCRIPTION_ALL = new byte[0];
    public static final Charset CHARSET = Charset.forName("UTF-8");

    private ZMQ() {
    }

    public static Context context(int ioThreads) {
        return new Context(ioThreads);
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQ$Context.class */
    public static class Context implements Closeable {
        private final Ctx ctx;

        protected Context(int ioThreads) {
            this.ctx = zmq.ZMQ.init(ioThreads);
        }

        public int getIOThreads() {
            return this.ctx.get(1);
        }

        public boolean setIOThreads(int ioThreads) {
            return this.ctx.set(1, ioThreads);
        }

        public int getMaxSockets() {
            return this.ctx.get(2);
        }

        public boolean setMaxSockets(int maxSockets) {
            return this.ctx.set(2, maxSockets);
        }

        public boolean getBlocky() {
            return this.ctx.get(70) != 0;
        }

        public boolean setBlocky(boolean block) {
            return this.ctx.set(70, block ? 1 : 0);
        }

        public void term() {
            this.ctx.terminate();
        }

        public Socket socket(int type) {
            return new Socket(this, type);
        }

        public Poller poller() {
            return new Poller(this);
        }

        public Poller poller(int size) {
            return new Poller(this, size);
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            this.ctx.terminate();
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQ$Socket.class */
    public static class Socket implements Closeable {
        private static final int DYNFROM = 49152;
        private static final int DYNTO = 65535;
        private final Ctx ctx;
        private final SocketBase base;
        private final AtomicBoolean isClosed;

        protected Socket(Context context, int type) {
            this.isClosed = new AtomicBoolean(false);
            this.ctx = context.ctx;
            this.base = this.ctx.createSocket(type);
        }

        protected Socket(SocketBase base) {
            this.isClosed = new AtomicBoolean(false);
            this.ctx = null;
            this.base = base;
        }

        public SocketBase base() {
            return this.base;
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            if (this.isClosed.compareAndSet(false, true)) {
                this.base.close();
            }
        }

        public final int getType() {
            return this.base.getSocketOpt(16);
        }

        public final long getLinger() {
            return this.base.getSocketOpt(17);
        }

        private void setsockopt(int option, Object value) {
            try {
                this.base.setSocketOpt(option, value);
            } catch (ZError.CtxTerminatedException e) {
            }
        }

        public final void setLinger(long value) {
            this.base.setSocketOpt(17, Integer.valueOf((int) value));
        }

        public final long getReconnectIVL() {
            return this.base.getSocketOpt(18);
        }

        public final void setReconnectIVL(long value) {
            this.base.setSocketOpt(18, Integer.valueOf((int) value));
        }

        public final long getBacklog() {
            return this.base.getSocketOpt(19);
        }

        public final void setBacklog(long value) {
            setsockopt(19, Integer.valueOf((int) value));
        }

        public final long getReconnectIVLMax() {
            return this.base.getSocketOpt(21);
        }

        public final void setReconnectIVLMax(long value) {
            setsockopt(21, Integer.valueOf((int) value));
        }

        public final long getMaxMsgSize() {
            return ((Long) this.base.getsockoptx(22)).longValue();
        }

        public final void setMaxMsgSize(long value) {
            setsockopt(22, Long.valueOf(value));
        }

        public final long getSndHWM() {
            return this.base.getSocketOpt(23);
        }

        public final void setSndHWM(long value) {
            setsockopt(23, Integer.valueOf((int) value));
        }

        public final long getRcvHWM() {
            return this.base.getSocketOpt(24);
        }

        public final void setRcvHWM(long value) {
            setsockopt(24, Integer.valueOf((int) value));
        }

        @Deprecated
        public final long getHWM() {
            return -1L;
        }

        public final void setHWM(long hwm) {
            setSndHWM(hwm);
            setRcvHWM(hwm);
        }

        @Deprecated
        public final long getSwap() {
            return -1L;
        }

        @Deprecated
        public final void setSwap(long value) {
            throw new UnsupportedOperationException();
        }

        public final long getAffinity() {
            return ((Long) this.base.getsockoptx(4)).longValue();
        }

        public final void setAffinity(long value) {
            setsockopt(4, Long.valueOf(value));
        }

        public final byte[] getIdentity() {
            return (byte[]) this.base.getsockoptx(5);
        }

        public final void setIdentity(byte[] identity) {
            setsockopt(5, identity);
        }

        public final long getRate() {
            return this.base.getSocketOpt(8);
        }

        public final void setRate(long value) {
            throw new UnsupportedOperationException();
        }

        public final long getRecoveryInterval() {
            return this.base.getSocketOpt(9);
        }

        public final void setRecoveryInterval(long value) {
            throw new UnsupportedOperationException();
        }

        @Deprecated
        public final boolean hasMulticastLoop() {
            return false;
        }

        @Deprecated
        public final void setMulticastLoop(boolean multicastLoop) {
            throw new UnsupportedOperationException();
        }

        public final long getMulticastHops() {
            return this.base.getSocketOpt(25);
        }

        public final void setMulticastHops(long value) {
            throw new UnsupportedOperationException();
        }

        public final int getReceiveTimeOut() {
            return this.base.getSocketOpt(27);
        }

        public final void setReceiveTimeOut(int value) {
            setsockopt(27, Integer.valueOf(value));
        }

        public final int getSendTimeOut() {
            return this.base.getSocketOpt(28);
        }

        public final void setSendTimeOut(int value) {
            setsockopt(28, Integer.valueOf(value));
        }

        public void setTCPKeepAlive(long value) {
            setsockopt(34, Long.valueOf(value));
        }

        public long getTCPKeepAliveSetting() {
            return this.base.getSocketOpt(34);
        }

        public void setTCPKeepAliveCount(long value) {
            setsockopt(35, Long.valueOf(value));
        }

        public long getTCPKeepAliveCount() {
            return this.base.getSocketOpt(35);
        }

        public void setTCPKeepAliveInterval(long value) {
            setsockopt(37, Long.valueOf(value));
        }

        public long getTCPKeepAliveInterval() {
            return this.base.getSocketOpt(37);
        }

        public void setTCPKeepAliveIdle(long value) {
            setsockopt(36, Long.valueOf(value));
        }

        public long getTCPKeepAliveIdle() {
            return this.base.getSocketOpt(36);
        }

        public final long getSendBufferSize() {
            return this.base.getSocketOpt(11);
        }

        public final void setSendBufferSize(long value) {
            setsockopt(11, Integer.valueOf((int) value));
        }

        public final long getReceiveBufferSize() {
            return this.base.getSocketOpt(12);
        }

        public final void setReceiveBufferSize(long value) {
            setsockopt(12, Integer.valueOf((int) value));
        }

        public final boolean hasReceiveMore() {
            return this.base.getSocketOpt(13) == 1;
        }

        public final SelectableChannel getFD() {
            return (SelectableChannel) this.base.getsockoptx(14);
        }

        public final int getEvents() {
            return this.base.getSocketOpt(15);
        }

        public final void subscribe(byte[] topic) {
            setsockopt(6, topic);
        }

        public final void unsubscribe(byte[] topic) {
            setsockopt(7, topic);
        }

        public final void setEncoder(Class<? extends EncoderBase> cls) {
            this.base.setSocketOpt(zmq.ZMQ.ZMQ_ENCODER, cls);
        }

        public final void setDecoder(Class<? extends DecoderBase> cls) {
            this.base.setSocketOpt(zmq.ZMQ.ZMQ_DECODER, cls);
        }

        public final void setRouterMandatory(boolean mandatory) {
            setsockopt(33, Integer.valueOf(mandatory ? 1 : 0));
        }

        public final void setRouterHandlover(boolean handlover) {
            setsockopt(56, Integer.valueOf(handlover ? 1 : 0));
        }

        public final void setXpubVerbose(boolean verbose) {
            setsockopt(40, Integer.valueOf(verbose ? 1 : 0));
        }

        public final boolean getIPv4Only() {
            return this.base.getSocketOpt(31) == 1;
        }

        public void setIPv4Only(boolean v4only) {
            setsockopt(31, Integer.valueOf(v4only ? 1 : 0));
        }

        public int getTCPKeepAlive() {
            return this.base.getSocketOpt(34);
        }

        public void setTCPKeepAlive(int optVal) {
            setsockopt(34, Integer.valueOf(optVal));
        }

        public boolean getDelayAttachOnConnect() {
            return this.base.getSocketOpt(39) == 1;
        }

        public void setDelayAttachOnConnect(boolean value) {
            setsockopt(39, Integer.valueOf(value ? 1 : 0));
        }

        public final void bind(String addr) {
            bind(addr, DYNFROM, DYNTO);
        }

        private int bind(String addr, int min, int max) {
            if (addr.endsWith(":*")) {
                String prefix = addr.substring(0, addr.lastIndexOf(58) + 1);
                for (int port = min; port <= max; port++) {
                    if (this.base.bind(prefix + port)) {
                        return port;
                    }
                }
            } else if (this.base.bind(addr)) {
                int port2 = 0;
                try {
                    port2 = Integer.parseInt(addr.substring(addr.lastIndexOf(58) + 1));
                } catch (NumberFormatException e) {
                }
                return port2;
            }
            mayRaise();
            return -1;
        }

        public int bindToRandomPort(String addr) {
            return bind(addr + ":*", DYNFROM, DYNTO);
        }

        public int bindToRandomPort(String addr, int min, int max) {
            return bind(addr + ":*", min, max);
        }

        public final void connect(String addr) {
            this.base.connect(addr);
            mayRaise();
        }

        public final boolean disconnect(String addr) {
            return this.base.termEndpoint(addr);
        }

        public final boolean unbind(String addr) {
            return this.base.termEndpoint(addr);
        }

        public final boolean send(String data) {
            return send(data.getBytes(ZMQ.CHARSET), 0);
        }

        public final boolean sendMore(String data) {
            return send(data.getBytes(ZMQ.CHARSET), 2);
        }

        public final boolean send(String data, int flags) {
            return send(data.getBytes(ZMQ.CHARSET), flags);
        }

        public final boolean send(byte[] data) {
            return send(data, 0);
        }

        public final boolean sendMore(byte[] data) {
            return send(data, 2);
        }

        public final boolean send(byte[] data, int flags) {
            Msg msg = new Msg(data);
            if (this.base.send(msg, flags)) {
                return true;
            }
            mayRaise();
            return false;
        }

        public final boolean send(byte[] data, int off, int length, int flags) {
            byte[] copy = new byte[length];
            System.arraycopy(data, off, copy, 0, length);
            Msg msg = new Msg(copy);
            if (this.base.send(msg, flags)) {
                return true;
            }
            mayRaise();
            return false;
        }

        public final int sendByteBuffer(ByteBuffer data, int flags) {
            Msg msg = new Msg(data);
            if (this.base.send(msg, flags)) {
                return msg.size();
            }
            mayRaise();
            return -1;
        }

        public final byte[] recv() {
            return recv(0);
        }

        public final byte[] recv(int flags) {
            Msg msg = this.base.recv(flags);
            if (msg != null) {
                return msg.data();
            }
            mayRaise();
            return null;
        }

        public final int recv(byte[] buffer, int offset, int len, int flags) {
            Msg msg = this.base.recv(flags);
            if (msg != null) {
                return msg.getBytes(0, buffer, offset, len);
            }
            return -1;
        }

        public final int recvByteBuffer(ByteBuffer buffer, int flags) {
            Msg msg = this.base.recv(flags);
            if (msg != null) {
                buffer.put(msg.data());
                return msg.size();
            }
            mayRaise();
            return -1;
        }

        public final String recvStr() {
            return recvStr(0);
        }

        public final String recvStr(int flags) {
            byte[] msg = recv(flags);
            if (msg != null) {
                return new String(msg, ZMQ.CHARSET);
            }
            return null;
        }

        public boolean monitor(String addr, int events) {
            return this.base.monitor(addr, events);
        }

        private void mayRaise() {
            int errno = this.base.errno();
            if (errno != 0 && errno != 35) {
                throw new ZMQException(errno);
            }
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQ$Poller.class */
    public static class Poller {
        public static final int POLLIN = 1;
        public static final int POLLOUT = 2;
        public static final int POLLERR = 4;
        private static final int SIZE_DEFAULT = 32;
        private static final int SIZE_INCREMENT = 16;
        private PollItem[] items;
        private long timeout;
        private int next;

        public Poller(int size) {
            this(null, size);
        }

        protected Poller(Context context, int size) {
            this.items = new PollItem[size];
            this.timeout = -1L;
            this.next = 0;
        }

        protected Poller(Context context) {
            this(context, 32);
        }

        public int register(Socket socket) {
            return register(socket, 7);
        }

        public int register(Socket socket, int events) {
            return insert(new PollItem(socket, events));
        }

        public int register(SelectableChannel channel, int events) {
            return insert(new PollItem(channel, events));
        }

        public int register(PollItem item) {
            return insert(item);
        }

        private int insert(PollItem item) {
            int pos = this.next;
            this.next = pos + 1;
            if (pos == this.items.length) {
                PollItem[] nitems = new PollItem[this.items.length + 16];
                System.arraycopy(this.items, 0, nitems, 0, this.items.length);
                this.items = nitems;
            }
            this.items[pos] = item;
            return pos;
        }

        public void unregister(Socket socket) {
            for (int pos = 0; pos < this.items.length; pos++) {
                PollItem item = this.items[pos];
                if (item.getSocket() == socket) {
                    remove(pos);
                    return;
                }
            }
        }

        public void unregister(SelectableChannel channel) {
            for (int pos = 0; pos < this.items.length; pos++) {
                PollItem item = this.items[pos];
                if (item.getRawSocket() == channel) {
                    remove(pos);
                    return;
                }
            }
        }

        private void remove(int pos) {
            this.next--;
            if (pos != this.next) {
                this.items[pos] = this.items[this.next];
            }
            this.items[this.next] = null;
        }

        public PollItem getItem(int index) {
            if (index < 0 || index >= this.next) {
                return null;
            }
            return this.items[index];
        }

        public Socket getSocket(int index) {
            if (index < 0 || index >= this.next) {
                return null;
            }
            return this.items[index].getSocket();
        }

        public long getTimeout() {
            return this.timeout;
        }

        public void setTimeout(long timeout) {
            if (timeout < -1) {
                return;
            }
            this.timeout = timeout;
        }

        public int getSize() {
            return this.items.length;
        }

        public int getNext() {
            return this.next;
        }

        public int poll() {
            long tout = -1;
            if (this.timeout > -1) {
                tout = this.timeout;
            }
            return poll(tout);
        }

        public int poll(long tout) {
            zmq.PollItem[] pollItems = new zmq.PollItem[this.next];
            for (int i = 0; i < this.next; i++) {
                pollItems[i] = this.items[i].base();
            }
            return zmq.ZMQ.poll(pollItems, this.next, tout);
        }

        public boolean pollin(int index) {
            if (index < 0 || index >= this.next) {
                return false;
            }
            return this.items[index].isReadable();
        }

        public boolean pollout(int index) {
            if (index < 0 || index >= this.next) {
                return false;
            }
            return this.items[index].isWritable();
        }

        public boolean pollerr(int index) {
            if (index < 0 || index >= this.next) {
                return false;
            }
            return this.items[index].isError();
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQ$PollItem.class */
    public static class PollItem {
        private final zmq.PollItem base;
        private final Socket socket;

        public PollItem(Socket socket, int ops) {
            this.socket = socket;
            this.base = new zmq.PollItem(socket.base, ops);
        }

        public PollItem(SelectableChannel channel, int ops) {
            this.base = new zmq.PollItem(channel, ops);
            this.socket = null;
        }

        protected final zmq.PollItem base() {
            return this.base;
        }

        public final SelectableChannel getRawSocket() {
            return this.base.getRawSocket();
        }

        public final Socket getSocket() {
            return this.socket;
        }

        public final boolean isReadable() {
            return this.base.isReadable();
        }

        public final boolean isWritable() {
            return this.base.isWritable();
        }

        public final boolean isError() {
            return this.base.isError();
        }

        public final int readyOps() {
            return this.base.readyOps();
        }

        public int hashCode() {
            return this.base.hashCode();
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof PollItem)) {
                return false;
            }
            PollItem target = (PollItem) obj;
            if (this.socket != null && this.socket == target.socket) {
                return true;
            }
            if (getRawSocket() != null && getRawSocket() == target.getRawSocket()) {
                return true;
            }
            return false;
        }
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQ$Error.class */
    public enum Error {
        ENOTSUP(45),
        EPROTONOSUPPORT(43),
        ENOBUFS(55),
        ENETDOWN(50),
        EADDRINUSE(48),
        EADDRNOTAVAIL(49),
        ECONNREFUSED(61),
        EINPROGRESS(36),
        EMTHREAD(ZError.EMTHREAD),
        EFSM(ZError.EFSM),
        ENOCOMPATPROTO(ZError.ENOCOMPATPROTO),
        ETERM(ZError.ETERM),
        ENOTSOCK(ZError.ENOTSOCK),
        EAGAIN(35);

        private final int code;

        Error(int code) {
            this.code = code;
        }

        public int getCode() {
            return this.code;
        }

        public static Error findByCode(int code) {
            Error[] arr$ = (Error[]) Error.class.getEnumConstants();
            for (Error e : arr$) {
                if (e.getCode() == code) {
                    return e;
                }
            }
            throw new IllegalArgumentException("Unknown " + Error.class.getName() + " enum code:" + code);
        }
    }

    @Deprecated
    public static boolean device(int type, Socket frontend, Socket backend) {
        return zmq.ZMQ.proxy(frontend.base, backend.base, null);
    }

    public static boolean proxy(Socket frontend, Socket backend, Socket capture) {
        return zmq.ZMQ.proxy(frontend.base, backend.base, capture != null ? capture.base : null);
    }

    public static int poll(PollItem[] items, long timeout) {
        return poll(items, items.length, timeout);
    }

    public static int poll(PollItem[] items, int count, long timeout) {
        zmq.PollItem[] pollItems = new zmq.PollItem[count];
        for (int i = 0; i < count; i++) {
            pollItems[i] = items[i].base;
        }
        return zmq.ZMQ.poll(pollItems, count, timeout);
    }

    public static int getMajorVersion() {
        return 3;
    }

    public static int getMinorVersion() {
        return 2;
    }

    public static int getPatchVersion() {
        return 5;
    }

    public static int getFullVersion() {
        return zmq.ZMQ.makeVersion(3, 2, 5);
    }

    public static int makeVersion(int major, int minor, int patch) {
        return zmq.ZMQ.makeVersion(major, minor, patch);
    }

    public static String getVersionString() {
        return "3.2.5";
    }

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQ$Event.class */
    public static class Event {
        private final int event;
        private final Object value;
        private final String address;

        public Event(int event, Object value, String address) {
            this.event = event;
            this.value = value;
            this.address = address;
        }

        public int getEvent() {
            return this.event;
        }

        public Object getValue() {
            return this.value;
        }

        public String getAddress() {
            return this.address;
        }

        public static Event recv(Socket socket, int flags) {
            ZMQ.Event e = ZMQ.Event.read(socket.base, flags);
            if (e != null) {
                return new Event(e.event, e.arg, e.addr);
            }
            return null;
        }

        public static Event recv(Socket socket) {
            return recv(socket, 0);
        }
    }
}
