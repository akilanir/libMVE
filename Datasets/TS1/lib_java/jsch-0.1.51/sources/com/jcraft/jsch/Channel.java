package com.jcraft.jsch;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.util.Vector;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Channel.class */
public abstract class Channel implements Runnable {
    static final int SSH_MSG_CHANNEL_OPEN_CONFIRMATION = 91;
    static final int SSH_MSG_CHANNEL_OPEN_FAILURE = 92;
    static final int SSH_MSG_CHANNEL_WINDOW_ADJUST = 93;
    static final int SSH_OPEN_ADMINISTRATIVELY_PROHIBITED = 1;
    static final int SSH_OPEN_CONNECT_FAILED = 2;
    static final int SSH_OPEN_UNKNOWN_CHANNEL_TYPE = 3;
    static final int SSH_OPEN_RESOURCE_SHORTAGE = 4;
    static int index = 0;
    private static Vector pool = new Vector();
    int id;
    private Session session;
    volatile int recipient = -1;
    protected byte[] type = Util.str2byte("foo");
    volatile int lwsize_max = 1048576;
    volatile int lwsize = this.lwsize_max;
    volatile int lmpsize = 16384;
    volatile long rwsize = 0;
    volatile int rmpsize = 0;
    IO io = null;
    Thread thread = null;
    volatile boolean eof_local = false;
    volatile boolean eof_remote = false;
    volatile boolean close = false;
    volatile boolean connected = false;
    volatile boolean open_confirmation = false;
    volatile int exitstatus = -1;
    volatile int reply = 0;
    volatile int connectTimeout = 0;
    int notifyme = 0;

    static Channel getChannel(String type) {
        if (type.equals("session")) {
            return new ChannelSession();
        }
        if (type.equals("shell")) {
            return new ChannelShell();
        }
        if (type.equals("exec")) {
            return new ChannelExec();
        }
        if (type.equals("x11")) {
            return new ChannelX11();
        }
        if (type.equals("auth-agent@openssh.com")) {
            return new ChannelAgentForwarding();
        }
        if (type.equals("direct-tcpip")) {
            return new ChannelDirectTCPIP();
        }
        if (type.equals("forwarded-tcpip")) {
            return new ChannelForwardedTCPIP();
        }
        if (type.equals("sftp")) {
            return new ChannelSftp();
        }
        if (type.equals("subsystem")) {
            return new ChannelSubsystem();
        }
        return null;
    }

    static Channel getChannel(int id, Session session) {
        synchronized (pool) {
            for (int i = 0; i < pool.size(); i++) {
                Channel c = (Channel) pool.elementAt(i);
                if (c.id == id && c.session == session) {
                    return c;
                }
            }
            return null;
        }
    }

    static void del(Channel c) {
        synchronized (pool) {
            pool.removeElement(c);
        }
    }

    Channel() {
        synchronized (pool) {
            int i = index;
            index = i + 1;
            this.id = i;
            pool.addElement(this);
        }
    }

    synchronized void setRecipient(int foo) {
        this.recipient = foo;
        if (this.notifyme > 0) {
            notifyAll();
        }
    }

    int getRecipient() {
        return this.recipient;
    }

    void init() throws JSchException {
    }

    public void connect() throws JSchException {
        connect(0);
    }

    public void connect(int connectTimeout) throws JSchException {
        this.connectTimeout = connectTimeout;
        try {
            sendChannelOpen();
            start();
        } catch (Exception e) {
            this.connected = false;
            disconnect();
            if (e instanceof JSchException) {
                throw ((JSchException) e);
            }
            throw new JSchException(e.toString(), e);
        }
    }

    public void setXForwarding(boolean foo) {
    }

    public void start() throws JSchException {
    }

    public boolean isEOF() {
        return this.eof_remote;
    }

    void getData(Buffer buf) {
        setRecipient(buf.getInt());
        setRemoteWindowSize(buf.getUInt());
        setRemotePacketSize(buf.getInt());
    }

    public void setInputStream(InputStream in) {
        this.io.setInputStream(in, false);
    }

    public void setInputStream(InputStream in, boolean dontclose) {
        this.io.setInputStream(in, dontclose);
    }

    public void setOutputStream(OutputStream out) {
        this.io.setOutputStream(out, false);
    }

    public void setOutputStream(OutputStream out, boolean dontclose) {
        this.io.setOutputStream(out, dontclose);
    }

    public void setExtOutputStream(OutputStream out) {
        this.io.setExtOutputStream(out, false);
    }

    public void setExtOutputStream(OutputStream out, boolean dontclose) {
        this.io.setExtOutputStream(out, dontclose);
    }

    public InputStream getInputStream() throws IOException {
        int max_input_buffer_size = 32768;
        try {
            max_input_buffer_size = Integer.parseInt(getSession().getConfig("max_input_buffer_size"));
        } catch (Exception e) {
        }
        PipedInputStream in = new MyPipedInputStream(this, 32768, max_input_buffer_size);
        boolean resizable = 32768 < max_input_buffer_size;
        this.io.setOutputStream(new PassiveOutputStream(in, resizable), false);
        return in;
    }

    public InputStream getExtInputStream() throws IOException {
        int max_input_buffer_size = 32768;
        try {
            max_input_buffer_size = Integer.parseInt(getSession().getConfig("max_input_buffer_size"));
        } catch (Exception e) {
        }
        PipedInputStream in = new MyPipedInputStream(this, 32768, max_input_buffer_size);
        boolean resizable = 32768 < max_input_buffer_size;
        this.io.setExtOutputStream(new PassiveOutputStream(in, resizable), false);
        return in;
    }

    public OutputStream getOutputStream() throws IOException {
        OutputStream out = new OutputStream() { // from class: com.jcraft.jsch.Channel.1
            private int dataLen = 0;
            private Buffer buffer = null;
            private Packet packet = null;
            private boolean closed = false;
            byte[] b = new byte[1];

            private synchronized void init() throws IOException {
                this.buffer = new Buffer(Channel.this.rmpsize);
                this.packet = new Packet(this.buffer);
                byte[] _buf = this.buffer.buffer;
                if ((_buf.length - 14) - 84 <= 0) {
                    this.buffer = null;
                    this.packet = null;
                    throw new IOException("failed to initialize the channel.");
                }
            }

            @Override // java.io.OutputStream
            public void write(int w) throws IOException {
                this.b[0] = (byte) w;
                write(this.b, 0, 1);
            }

            @Override // java.io.OutputStream
            public void write(byte[] buf, int s, int l) throws IOException {
                if (this.packet == null) {
                    init();
                }
                if (this.closed) {
                    throw new IOException("Already closed");
                }
                byte[] _buf = this.buffer.buffer;
                int _bufl = _buf.length;
                while (l > 0) {
                    int _l = l;
                    if (l > (_bufl - (14 + this.dataLen)) - 84) {
                        _l = (_bufl - (14 + this.dataLen)) - 84;
                    }
                    if (_l <= 0) {
                        flush();
                    } else {
                        System.arraycopy(buf, s, _buf, 14 + this.dataLen, _l);
                        this.dataLen += _l;
                        s += _l;
                        l -= _l;
                    }
                }
            }

            @Override // java.io.OutputStream, java.io.Flushable
            public void flush() throws IOException {
                if (this.closed) {
                    throw new IOException("Already closed");
                }
                if (this.dataLen == 0) {
                    return;
                }
                this.packet.reset();
                this.buffer.putByte((byte) 94);
                this.buffer.putInt(Channel.this.recipient);
                this.buffer.putInt(this.dataLen);
                this.buffer.skip(this.dataLen);
                try {
                    int foo = this.dataLen;
                    this.dataLen = 0;
                    synchronized (this) {
                        if (!this.close) {
                            Channel.this.getSession().write(this.packet, this, foo);
                        }
                    }
                } catch (Exception e) {
                    close();
                    throw new IOException(e.toString());
                }
            }

            @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                if (this.packet == null) {
                    try {
                        init();
                    } catch (IOException e) {
                        return;
                    }
                }
                if (this.closed) {
                    return;
                }
                if (this.dataLen > 0) {
                    flush();
                }
                this.eof();
                this.closed = true;
            }
        };
        return out;
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Channel$MyPipedInputStream.class */
    class MyPipedInputStream extends PipedInputStream {
        private int BUFFER_SIZE;
        private int max_buffer_size;

        MyPipedInputStream() throws IOException {
            this.BUFFER_SIZE = 1024;
            this.max_buffer_size = this.BUFFER_SIZE;
        }

        MyPipedInputStream(int size) throws IOException {
            this.BUFFER_SIZE = 1024;
            this.max_buffer_size = this.BUFFER_SIZE;
            this.buffer = new byte[size];
            this.BUFFER_SIZE = size;
            this.max_buffer_size = size;
        }

        MyPipedInputStream(Channel channel, int size, int max_buffer_size) throws IOException {
            this(size);
            this.max_buffer_size = max_buffer_size;
        }

        MyPipedInputStream(PipedOutputStream out) throws IOException {
            super(out);
            this.BUFFER_SIZE = 1024;
            this.max_buffer_size = this.BUFFER_SIZE;
        }

        MyPipedInputStream(PipedOutputStream out, int size) throws IOException {
            super(out);
            this.BUFFER_SIZE = 1024;
            this.max_buffer_size = this.BUFFER_SIZE;
            this.buffer = new byte[size];
            this.BUFFER_SIZE = size;
        }

        public synchronized void updateReadSide() throws IOException {
            if (available() != 0) {
                return;
            }
            this.in = 0;
            this.out = 0;
            byte[] bArr = this.buffer;
            int i = this.in;
            this.in = i + 1;
            bArr[i] = 0;
            read();
        }

        private int freeSpace() {
            int size = 0;
            if (this.out < this.in) {
                size = this.buffer.length - this.in;
            } else if (this.in < this.out) {
                size = this.in == -1 ? this.buffer.length : this.out - this.in;
            }
            return size;
        }

        synchronized void checkSpace(int len) throws IOException {
            int foo;
            int size = freeSpace();
            if (size < len) {
                int datasize = this.buffer.length - size;
                int length = this.buffer.length;
                while (true) {
                    foo = length;
                    if (foo - datasize >= len) {
                        break;
                    } else {
                        length = foo * 2;
                    }
                }
                if (foo > this.max_buffer_size) {
                    foo = this.max_buffer_size;
                }
                if (foo - datasize < len) {
                    return;
                }
                byte[] tmp = new byte[foo];
                if (this.out < this.in) {
                    System.arraycopy(this.buffer, 0, tmp, 0, this.buffer.length);
                } else if (this.in < this.out) {
                    if (this.in != -1) {
                        System.arraycopy(this.buffer, 0, tmp, 0, this.in);
                        System.arraycopy(this.buffer, this.out, tmp, tmp.length - (this.buffer.length - this.out), this.buffer.length - this.out);
                        this.out = tmp.length - (this.buffer.length - this.out);
                    }
                } else if (this.in == this.out) {
                    System.arraycopy(this.buffer, 0, tmp, 0, this.buffer.length);
                    this.in = this.buffer.length;
                }
                this.buffer = tmp;
                return;
            }
            if (this.buffer.length == size && size > this.BUFFER_SIZE) {
                int i = size / 2;
                if (i < this.BUFFER_SIZE) {
                    i = this.BUFFER_SIZE;
                }
                this.buffer = new byte[i];
            }
        }
    }

    void setLocalWindowSizeMax(int foo) {
        this.lwsize_max = foo;
    }

    void setLocalWindowSize(int foo) {
        this.lwsize = foo;
    }

    void setLocalPacketSize(int foo) {
        this.lmpsize = foo;
    }

    synchronized void setRemoteWindowSize(long foo) {
        this.rwsize = foo;
    }

    synchronized void addRemoteWindowSize(long foo) {
        this.rwsize += foo;
        if (this.notifyme > 0) {
            notifyAll();
        }
    }

    void setRemotePacketSize(int foo) {
        this.rmpsize = foo;
    }

    @Override // java.lang.Runnable
    public void run() {
    }

    void write(byte[] foo) throws IOException {
        write(foo, 0, foo.length);
    }

    void write(byte[] foo, int s, int l) throws IOException {
        try {
            this.io.put(foo, s, l);
        } catch (NullPointerException e) {
        }
    }

    void write_ext(byte[] foo, int s, int l) throws IOException {
        try {
            this.io.put_ext(foo, s, l);
        } catch (NullPointerException e) {
        }
    }

    void eof_remote() {
        this.eof_remote = true;
        try {
            this.io.out_close();
        } catch (NullPointerException e) {
        }
    }

    void eof() {
        if (this.eof_local) {
            return;
        }
        this.eof_local = true;
        int i = getRecipient();
        if (i == -1) {
            return;
        }
        try {
            Buffer buf = new Buffer(100);
            Packet packet = new Packet(buf);
            packet.reset();
            buf.putByte((byte) 96);
            buf.putInt(i);
            synchronized (this) {
                if (!this.close) {
                    getSession().write(packet);
                }
            }
        } catch (Exception e) {
        }
    }

    void close() {
        if (this.close) {
            return;
        }
        this.close = true;
        this.eof_remote = true;
        this.eof_local = true;
        int i = getRecipient();
        if (i == -1) {
            return;
        }
        try {
            Buffer buf = new Buffer(100);
            Packet packet = new Packet(buf);
            packet.reset();
            buf.putByte((byte) 97);
            buf.putInt(i);
            synchronized (this) {
                getSession().write(packet);
            }
        } catch (Exception e) {
        }
    }

    public boolean isClosed() {
        return this.close;
    }

    static void disconnect(Session session) {
        Channel[] channels;
        int count = 0;
        synchronized (pool) {
            channels = new Channel[pool.size()];
            for (int i = 0; i < pool.size(); i++) {
                try {
                    Channel c = (Channel) pool.elementAt(i);
                    if (c.session == session) {
                        int i2 = count;
                        count++;
                        channels[i2] = c;
                    }
                } catch (Exception e) {
                }
            }
        }
        for (int i3 = 0; i3 < count; i3++) {
            channels[i3].disconnect();
        }
    }

    public void disconnect() {
        try {
            synchronized (this) {
                if (this.connected) {
                    this.connected = false;
                    close();
                    this.eof_local = true;
                    this.eof_remote = true;
                    this.thread = null;
                    try {
                        if (this.io != null) {
                            this.io.close();
                        }
                    } catch (Exception e) {
                    }
                    del(this);
                }
            }
        } finally {
            del(this);
        }
    }

    public boolean isConnected() {
        Session _session = this.session;
        return _session != null && _session.isConnected() && this.connected;
    }

    public void sendSignal(String signal) throws Exception {
        RequestSignal request = new RequestSignal();
        request.setSignal(signal);
        request.request(getSession(), this);
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Channel$PassiveInputStream.class */
    class PassiveInputStream extends MyPipedInputStream {
        PipedOutputStream out;

        PassiveInputStream(PipedOutputStream out, int size) throws IOException {
            super(out, size);
            this.out = out;
        }

        PassiveInputStream(PipedOutputStream out) throws IOException {
            super(out);
            this.out = out;
        }

        @Override // java.io.PipedInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.out != null) {
                this.out.close();
            }
            this.out = null;
        }
    }

    /* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Channel$PassiveOutputStream.class */
    class PassiveOutputStream extends PipedOutputStream {
        private MyPipedInputStream _sink;

        PassiveOutputStream(PipedInputStream in, boolean resizable_buffer) throws IOException {
            super(in);
            this._sink = null;
            if (resizable_buffer && (in instanceof MyPipedInputStream)) {
                this._sink = (MyPipedInputStream) in;
            }
        }

        @Override // java.io.PipedOutputStream, java.io.OutputStream
        public void write(int b) throws IOException {
            if (this._sink != null) {
                this._sink.checkSpace(1);
            }
            super.write(b);
        }

        @Override // java.io.PipedOutputStream, java.io.OutputStream
        public void write(byte[] b, int off, int len) throws IOException {
            if (this._sink != null) {
                this._sink.checkSpace(len);
            }
            super.write(b, off, len);
        }
    }

    void setExitStatus(int status) {
        this.exitstatus = status;
    }

    public int getExitStatus() {
        return this.exitstatus;
    }

    void setSession(Session session) {
        this.session = session;
    }

    public Session getSession() throws JSchException {
        Session _session = this.session;
        if (_session == null) {
            throw new JSchException("session is not available");
        }
        return _session;
    }

    public int getId() {
        return this.id;
    }

    protected void sendOpenConfirmation() throws Exception {
        Buffer buf = new Buffer(100);
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 91);
        buf.putInt(getRecipient());
        buf.putInt(this.id);
        buf.putInt(this.lwsize);
        buf.putInt(this.lmpsize);
        getSession().write(packet);
    }

    protected void sendOpenFailure(int reasoncode) {
        try {
            Buffer buf = new Buffer(100);
            Packet packet = new Packet(buf);
            packet.reset();
            buf.putByte((byte) 92);
            buf.putInt(getRecipient());
            buf.putInt(reasoncode);
            buf.putString(Util.str2byte("open failed"));
            buf.putString(Util.empty);
            getSession().write(packet);
        } catch (Exception e) {
        }
    }

    protected Packet genChannelOpenPacket() {
        Buffer buf = new Buffer(100);
        Packet packet = new Packet(buf);
        packet.reset();
        buf.putByte((byte) 90);
        buf.putString(this.type);
        buf.putInt(this.id);
        buf.putInt(this.lwsize);
        buf.putInt(this.lmpsize);
        return packet;
    }

    protected void sendChannelOpen() throws Exception {
        Session _session = getSession();
        if (!_session.isConnected()) {
            throw new JSchException("session is down");
        }
        Packet packet = genChannelOpenPacket();
        _session.write(packet);
        int retry = 2000;
        long start = System.currentTimeMillis();
        long timeout = this.connectTimeout;
        if (timeout != 0) {
            retry = 1;
        }
        synchronized (this) {
            while (getRecipient() == -1 && _session.isConnected() && retry > 0) {
                if (timeout > 0 && System.currentTimeMillis() - start > timeout) {
                    retry = 0;
                } else {
                    try {
                        long t = timeout == 0 ? 10L : timeout;
                        this.notifyme = 1;
                        wait(t);
                        this.notifyme = 0;
                    } catch (InterruptedException e) {
                        this.notifyme = 0;
                    } catch (Throwable th) {
                        this.notifyme = 0;
                        throw th;
                    }
                    retry--;
                }
            }
        }
        if (!_session.isConnected()) {
            throw new JSchException("session is down");
        }
        if (getRecipient() == -1) {
            throw new JSchException("channel is not opened.");
        }
        if (!this.open_confirmation) {
            throw new JSchException("channel is not opened.");
        }
        this.connected = true;
    }
}
