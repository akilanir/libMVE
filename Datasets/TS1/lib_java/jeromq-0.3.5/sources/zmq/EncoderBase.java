package zmq;

import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import zmq.Transfer;

/* loaded from: jeromq-0.3.5.jar:zmq/EncoderBase.class */
public abstract class EncoderBase implements IEncoder {
    private byte[] writeBuf;
    private FileChannel writeChannel;
    private int writePos;
    private int next;
    private boolean beginning;
    private int toWrite;
    private ByteBuffer buffer;
    private int bufferSize;
    private boolean error = false;

    protected abstract boolean next();

    protected EncoderBase(int bufferSize) {
        this.bufferSize = bufferSize;
        this.buffer = ByteBuffer.allocateDirect(bufferSize);
    }

    @Override // zmq.IEncoder
    public Transfer getData(ByteBuffer buffer) {
        if (buffer == null) {
            buffer = this.buffer;
        }
        buffer.clear();
        while (buffer.hasRemaining() && (this.toWrite != 0 || next())) {
            if (this.writeChannel != null) {
                buffer.flip();
                Transfer t = new Transfer.FileChannelTransfer(buffer, this.writeChannel, this.writePos, this.toWrite);
                this.writePos = 0;
                this.toWrite = 0;
                return t;
            }
            if (this.buffer.position() == 0 && this.toWrite >= this.bufferSize) {
                ByteBuffer b = ByteBuffer.wrap(this.writeBuf);
                b.position(this.writePos);
                Transfer t2 = new Transfer.ByteBufferTransfer(b);
                this.writePos = 0;
                this.toWrite = 0;
                return t2;
            }
            int toCopy = Math.min(this.toWrite, buffer.remaining());
            if (toCopy > 0) {
                buffer.put(this.writeBuf, this.writePos, toCopy);
                this.writePos += toCopy;
                this.toWrite -= toCopy;
            }
        }
        buffer.flip();
        return new Transfer.ByteBufferTransfer(buffer);
    }

    @Override // zmq.IEncoder
    public boolean hasData() {
        return this.toWrite > 0;
    }

    protected int state() {
        return this.next;
    }

    protected void state(int state) {
        this.next = state;
    }

    protected void encodingError() {
        this.error = true;
    }

    public final boolean isError() {
        return this.error;
    }

    protected void nextStep(Msg msg, int state, boolean beginning) {
        if (msg == null) {
            nextStep(null, 0, state, beginning);
        } else {
            nextStep(msg.data(), msg.size(), state, beginning);
        }
    }

    protected void nextStep(byte[] buf, int toWrite, int next, boolean beginning) {
        this.writeBuf = buf;
        this.writeChannel = null;
        this.writePos = 0;
        this.toWrite = toWrite;
        this.next = next;
        this.beginning = beginning;
    }

    protected void nextStep(FileChannel ch, long pos, long toWrite, int next, boolean beginning) {
        this.writeBuf = null;
        this.writeChannel = ch;
        this.writePos = (int) pos;
        this.toWrite = (int) toWrite;
        this.next = next;
        this.beginning = beginning;
    }
}
