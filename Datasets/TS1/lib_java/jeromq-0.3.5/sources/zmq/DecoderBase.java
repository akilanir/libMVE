package zmq;

import java.nio.ByteBuffer;

/* loaded from: jeromq-0.3.5.jar:zmq/DecoderBase.class */
public abstract class DecoderBase implements IDecoder {
    private byte[] readBuf;
    private int readPos;
    private int bufsize;
    private ByteBuffer buf;
    boolean zeroCopy;
    private int state = -1;
    protected int toRead = 0;

    protected abstract boolean next();

    public DecoderBase(int bufsize) {
        this.bufsize = bufsize;
        if (bufsize > 0) {
            this.buf = ByteBuffer.allocateDirect(bufsize);
        }
        this.readBuf = null;
        this.zeroCopy = false;
    }

    @Override // zmq.IDecoder
    public ByteBuffer getBuffer() {
        ByteBuffer b;
        if (this.toRead >= this.bufsize) {
            this.zeroCopy = true;
            b = ByteBuffer.wrap(this.readBuf);
            b.position(this.readPos);
        } else {
            this.zeroCopy = false;
            b = this.buf;
            b.clear();
        }
        return b;
    }

    @Override // zmq.IDecoder
    public int processBuffer(ByteBuffer buf, int size) {
        if (state() < 0) {
            return -1;
        }
        if (this.zeroCopy) {
            this.readPos += size;
            this.toRead -= size;
            while (this.toRead == 0) {
                if (!next()) {
                    if (state() < 0) {
                        return -1;
                    }
                    return size;
                }
            }
            return size;
        }
        int pos = 0;
        while (true) {
            if (this.toRead == 0) {
                if (!next()) {
                    if (state() < 0) {
                        return -1;
                    }
                    return pos;
                }
            } else {
                if (pos == size) {
                    return pos;
                }
                int toCopy = Math.min(this.toRead, size - pos);
                buf.get(this.readBuf, this.readPos, toCopy);
                this.readPos += toCopy;
                pos += toCopy;
                this.toRead -= toCopy;
            }
        }
    }

    protected void nextStep(Msg msg, int state) {
        nextStep(msg.data(), msg.size(), state);
    }

    protected void nextStep(byte[] buf, int toRead, int state) {
        this.readBuf = buf;
        this.readPos = 0;
        this.toRead = toRead;
        this.state = state;
    }

    protected int state() {
        return this.state;
    }

    protected void state(int state) {
        this.state = state;
    }

    protected void decodingError() {
        state(-1);
    }

    @Override // zmq.IDecoder
    public boolean stalled() {
        if (!next()) {
            return false;
        }
        while (this.toRead == 0) {
            if (!next()) {
                return next();
            }
        }
        return false;
    }
}
