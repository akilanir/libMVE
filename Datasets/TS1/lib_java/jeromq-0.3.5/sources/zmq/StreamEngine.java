package zmq;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.SocketChannel;
import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:zmq/StreamEngine.class */
public class StreamEngine implements IEngine, IPollEvents, IMsgSink {
    private static final int GREETING_SIZE = 12;
    private SocketChannel handle;
    private Options options;
    private String endpoint;
    private IOObject ioObject;
    static final /* synthetic */ boolean $assertionsDisabled;
    private ByteBuffer inbuf = null;
    private int insize = 0;
    private boolean ioEnabled = false;
    private Transfer outbuf = null;
    private int outsize = 0;
    private boolean handshaking = true;
    private SessionBase session = null;
    private boolean plugged = false;
    private SocketBase socket = null;
    private final ByteBuffer greeting = ByteBuffer.allocate(12).order(ByteOrder.BIG_ENDIAN);
    private final ByteBuffer greetingOutputBuffer = ByteBuffer.allocate(12).order(ByteOrder.BIG_ENDIAN);
    private EncoderBase encoder = null;
    private DecoderBase decoder = null;

    static {
        $assertionsDisabled = !StreamEngine.class.desiredAssertionStatus();
    }

    public StreamEngine(SocketChannel handle, Options options, String endpoint) {
        this.handle = handle;
        this.options = options;
        this.endpoint = endpoint;
        try {
            Utils.unblockSocket(this.handle);
            if (this.options.sndbuf != 0) {
                this.handle.socket().setSendBufferSize(this.options.sndbuf);
            }
            if (this.options.rcvbuf != 0) {
                this.handle.socket().setReceiveBufferSize(this.options.rcvbuf);
            }
        } catch (IOException e) {
            throw new ZError.IOException(e);
        }
    }

    private DecoderBase newDecoder(int size, long max, SessionBase session, int version) {
        if (this.options.decoder == null) {
            if (version == 1) {
                return new V1Decoder(size, max, session);
            }
            return new Decoder(size, max);
        }
        try {
            if (version == 0) {
                Constructor<? extends DecoderBase> dcon = this.options.decoder.getConstructor(Integer.TYPE, Long.TYPE);
                return dcon.newInstance(Integer.valueOf(size), Long.valueOf(max));
            }
            Constructor<? extends DecoderBase> dcon2 = this.options.decoder.getConstructor(Integer.TYPE, Long.TYPE, IMsgSink.class, Integer.TYPE);
            return dcon2.newInstance(Integer.valueOf(size), Long.valueOf(max), session, Integer.valueOf(version));
        } catch (IllegalAccessException e) {
            throw new ZError.InstantiationException(e);
        } catch (InstantiationException e2) {
            throw new ZError.InstantiationException(e2);
        } catch (NoSuchMethodException e3) {
            throw new ZError.InstantiationException(e3);
        } catch (SecurityException e4) {
            throw new ZError.InstantiationException(e4);
        } catch (InvocationTargetException e5) {
            throw new ZError.InstantiationException(e5);
        }
    }

    private EncoderBase newEncoder(int size, SessionBase session, int version) {
        if (this.options.encoder == null) {
            if (version == 1) {
                return new V1Encoder(size, session);
            }
            return new Encoder(size);
        }
        try {
            if (version == 0) {
                Constructor<? extends EncoderBase> econ = this.options.encoder.getConstructor(Integer.TYPE);
                return econ.newInstance(Integer.valueOf(size));
            }
            Constructor<? extends EncoderBase> econ2 = this.options.encoder.getConstructor(Integer.TYPE, IMsgSource.class, Integer.TYPE);
            return econ2.newInstance(Integer.valueOf(size), session, Integer.valueOf(version));
        } catch (IllegalAccessException e) {
            throw new ZError.InstantiationException(e);
        } catch (InstantiationException e2) {
            throw new ZError.InstantiationException(e2);
        } catch (NoSuchMethodException e3) {
            throw new ZError.InstantiationException(e3);
        } catch (SecurityException e4) {
            throw new ZError.InstantiationException(e4);
        } catch (InvocationTargetException e5) {
            throw new ZError.InstantiationException(e5);
        }
    }

    public void destroy() {
        if (!$assertionsDisabled && this.plugged) {
            throw new AssertionError();
        }
        if (this.handle != null) {
            try {
                this.handle.close();
            } catch (IOException e) {
            }
            this.handle = null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x00cc  */
    @Override // zmq.IEngine
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void plug(zmq.IOThread r6, zmq.SessionBase r7) {
        /*
            Method dump skipped, instructions count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: zmq.StreamEngine.plug(zmq.IOThread, zmq.SessionBase):void");
    }

    private void unplug() {
        if (!$assertionsDisabled && !this.plugged) {
            throw new AssertionError();
        }
        this.plugged = false;
        if (this.ioEnabled) {
            this.ioObject.removeHandle(this.handle);
            this.ioEnabled = false;
        }
        this.ioObject.unplug();
        if (this.encoder != null) {
            this.encoder.setMsgSource(null);
        }
        if (this.decoder != null) {
            this.decoder.setMsgSink(null);
        }
        this.session = null;
    }

    @Override // zmq.IEngine
    public void terminate() {
        unplug();
        destroy();
    }

    @Override // zmq.IPollEvents
    public void inEvent() {
        if (this.handshaking && !handshake()) {
            return;
        }
        if (!$assertionsDisabled && this.decoder == null) {
            throw new AssertionError();
        }
        boolean disconnection = false;
        if (this.insize == 0) {
            this.inbuf = this.decoder.getBuffer();
            this.insize = read(this.inbuf);
            this.inbuf.flip();
            if (this.insize == -1) {
                this.insize = 0;
                disconnection = true;
            }
        }
        int processed = this.decoder.processBuffer(this.inbuf, this.insize);
        if (processed == -1) {
            disconnection = true;
        } else {
            if (processed < this.insize) {
                this.ioObject.resetPollIn(this.handle);
            }
            this.insize -= processed;
        }
        this.session.flush();
        if (disconnection) {
            if (this.decoder.stalled()) {
                this.ioObject.removeHandle(this.handle);
                this.ioEnabled = false;
            } else {
                error();
            }
        }
    }

    @Override // zmq.IPollEvents
    public void outEvent() {
        if (this.outsize == 0) {
            if (this.encoder == null) {
                if (!$assertionsDisabled && !this.handshaking) {
                    throw new AssertionError();
                }
                return;
            }
            this.outbuf = this.encoder.getData(null);
            this.outsize = this.outbuf.remaining();
            if (this.outbuf.remaining() == 0) {
                this.ioObject.resetPollOut(this.handle);
                if (this.encoder.isError()) {
                    error();
                    return;
                }
                return;
            }
        }
        int nbytes = write(this.outbuf);
        if (nbytes == -1) {
            this.ioObject.resetPollOut(this.handle);
            return;
        }
        this.outsize -= nbytes;
        if (this.handshaking && this.outsize == 0) {
            this.ioObject.resetPollOut(this.handle);
        }
        if (this.outsize == 0 && this.encoder != null && this.encoder.isError()) {
            error();
        }
    }

    @Override // zmq.IPollEvents
    public void connectEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void acceptEvent() {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IPollEvents
    public void timerEvent(int id) {
        throw new UnsupportedOperationException();
    }

    @Override // zmq.IEngine
    public void activateOut() {
        this.ioObject.setPollOut(this.handle);
        outEvent();
    }

    @Override // zmq.IEngine
    public void activateIn() {
        if (!this.ioEnabled) {
            this.decoder.processBuffer(this.inbuf, 0);
            if (!$assertionsDisabled && this.decoder.stalled()) {
                throw new AssertionError();
            }
            this.session.flush();
            error();
            return;
        }
        this.ioObject.setPollIn(this.handle);
        this.ioObject.inEvent();
    }

    private boolean handshake() {
        if (!$assertionsDisabled && !this.handshaking) {
            throw new AssertionError();
        }
        while (this.greeting.position() < 12) {
            int n = read(this.greeting);
            if (n == -1) {
                error();
                return false;
            }
            if (n == 0) {
                return false;
            }
            if ((this.greeting.get(0) & 255) != 255) {
                break;
            }
            if (this.greeting.position() >= 10) {
                if ((this.greeting.get(9) & 1) == 0) {
                    break;
                }
                if (this.greetingOutputBuffer.limit() < 12) {
                    if (this.outsize == 0) {
                        this.ioObject.setPollOut(this.handle);
                    }
                    int pos = this.greetingOutputBuffer.position();
                    this.greetingOutputBuffer.position(10).limit(12);
                    this.greetingOutputBuffer.put((byte) 1);
                    this.greetingOutputBuffer.put((byte) this.options.type);
                    this.greetingOutputBuffer.position(pos);
                    this.outsize += 2;
                }
            }
        }
        if ((this.greeting.get(0) & 255) != 255 || (this.greeting.get(9) & 1) == 0) {
            this.encoder = newEncoder(Config.OUT_BATCH_SIZE.getValue(), null, 0);
            this.encoder.setMsgSource(this.session);
            this.decoder = newDecoder(Config.IN_BATCH_SIZE.getValue(), this.options.maxMsgSize, null, 0);
            this.decoder.setMsgSink(this.session);
            int headerSize = this.options.identitySize + 1 >= 255 ? 10 : 2;
            ByteBuffer tmp = ByteBuffer.allocate(headerSize);
            this.encoder.getData(tmp);
            if (tmp.remaining() != headerSize) {
                return false;
            }
            this.inbuf = this.greeting;
            this.greeting.flip();
            this.insize = this.greeting.remaining();
            if (this.options.type == 1 || this.options.type == 9) {
                this.decoder.setMsgSink(this);
            }
        } else if (this.greeting.get(10) == 0) {
            this.encoder = newEncoder(Config.OUT_BATCH_SIZE.getValue(), null, 0);
            this.encoder.setMsgSource(this.session);
            this.decoder = newDecoder(Config.IN_BATCH_SIZE.getValue(), this.options.maxMsgSize, null, 0);
            this.decoder.setMsgSink(this.session);
        } else {
            this.encoder = newEncoder(Config.OUT_BATCH_SIZE.getValue(), this.session, 1);
            this.decoder = newDecoder(Config.IN_BATCH_SIZE.getValue(), this.options.maxMsgSize, this.session, 1);
        }
        if (this.outsize == 0) {
            this.ioObject.setPollOut(this.handle);
        }
        this.handshaking = false;
        return true;
    }

    @Override // zmq.IMsgSink
    public int pushMsg(Msg msg) {
        if (!$assertionsDisabled && this.options.type != 1 && this.options.type != 9) {
            throw new AssertionError();
        }
        int rc = this.session.pushMsg(msg);
        if (!$assertionsDisabled && rc != 0) {
            throw new AssertionError();
        }
        Msg msg2 = new Msg(new byte[]{1});
        int rc2 = this.session.pushMsg(msg2);
        this.session.flush();
        if (!$assertionsDisabled && this.decoder == null) {
            throw new AssertionError();
        }
        this.decoder.setMsgSink(this.session);
        return rc2;
    }

    private void error() {
        if (!$assertionsDisabled && this.session == null) {
            throw new AssertionError();
        }
        this.socket.eventDisconnected(this.endpoint, this.handle);
        this.session.detach();
        unplug();
        destroy();
    }

    private int write(Transfer buf) {
        try {
            int nbytes = buf.transferTo(this.handle);
            return nbytes;
        } catch (IOException e) {
            return -1;
        }
    }

    private int read(ByteBuffer buf) {
        try {
            int nbytes = this.handle.read(buf);
            return nbytes;
        } catch (IOException e) {
            return -1;
        }
    }
}
