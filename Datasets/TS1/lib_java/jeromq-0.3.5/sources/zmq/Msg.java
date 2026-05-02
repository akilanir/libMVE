package zmq;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: jeromq-0.3.5.jar:zmq/Msg.class */
public class Msg {
    public static final int MORE = 1;
    public static final int COMMAND = 2;
    public static final int IDENTITY = 64;
    public static final int SHARED = 128;
    private int flags;
    private Type type;
    private int size;
    private byte[] data;
    private ByteBuffer buf;

    /* loaded from: jeromq-0.3.5.jar:zmq/Msg$Type.class */
    enum Type {
        DATA,
        DELIMITER
    }

    public Msg() {
        this.type = Type.DATA;
        this.flags = 0;
        this.size = 0;
        this.buf = ByteBuffer.wrap(new byte[0]).order(ByteOrder.BIG_ENDIAN);
        this.data = this.buf.array();
    }

    public Msg(int capacity) {
        this.type = Type.DATA;
        this.flags = 0;
        this.size = capacity;
        this.buf = ByteBuffer.wrap(new byte[capacity]).order(ByteOrder.BIG_ENDIAN);
        this.data = this.buf.array();
    }

    public Msg(byte[] src) {
        src = src == null ? new byte[0] : src;
        this.type = Type.DATA;
        this.flags = 0;
        this.size = src.length;
        this.data = src;
        this.buf = ByteBuffer.wrap(src).order(ByteOrder.BIG_ENDIAN);
    }

    public Msg(ByteBuffer src) {
        if (src == null) {
            throw new IllegalArgumentException("ByteBuffer cannot be null");
        }
        if (src.position() > 0) {
            throw new IllegalArgumentException("ByteBuffer position is not zero, did you forget to flip it?");
        }
        this.type = Type.DATA;
        this.flags = 0;
        this.buf = src.duplicate();
        if (this.buf.hasArray()) {
            this.data = this.buf.array();
        } else {
            this.data = null;
        }
        this.size = this.buf.remaining();
    }

    public Msg(Msg m) {
        if (m == null) {
            throw new IllegalArgumentException("Msg cannot be null");
        }
        this.type = m.type;
        this.flags = m.flags;
        this.size = m.size;
        this.buf = m.buf != null ? m.buf.duplicate() : null;
        this.data = new byte[this.size];
        System.arraycopy(m.data, 0, this.data, 0, m.size);
    }

    public boolean isIdentity() {
        return (this.flags & 64) == 64;
    }

    public boolean isDelimiter() {
        return this.type == Type.DELIMITER;
    }

    public boolean check() {
        return true;
    }

    public int flags() {
        return this.flags;
    }

    public boolean hasMore() {
        return (this.flags & 1) > 0;
    }

    public void setFlags(int flags) {
        this.flags |= flags;
    }

    public void initDelimiter() {
        this.type = Type.DELIMITER;
        this.flags = 0;
    }

    public byte[] data() {
        if (this.buf.isDirect()) {
            int length = this.buf.remaining();
            byte[] bytes = new byte[length];
            this.buf.duplicate().get(bytes);
            return bytes;
        }
        return this.data;
    }

    public ByteBuffer buf() {
        return this.buf.duplicate();
    }

    public int size() {
        return this.size;
    }

    public void resetFlags(int f) {
        this.flags &= f ^ (-1);
    }

    public byte get() {
        return this.buf.get();
    }

    public byte get(int index) {
        return this.buf.get(index);
    }

    public Msg put(byte b) {
        this.buf.put(b);
        return this;
    }

    public Msg put(int index, byte b) {
        this.buf.put(index, b);
        return this;
    }

    public Msg put(byte[] src) {
        return put(src, 0, src.length);
    }

    public Msg put(byte[] src, int off, int len) {
        if (src == null) {
            return this;
        }
        this.buf.put(src, off, len);
        return this;
    }

    public Msg put(ByteBuffer src) {
        this.buf.put(src);
        return this;
    }

    public int getBytes(int index, byte[] dst, int off, int len) {
        int count = Math.min(len, this.size);
        if (this.buf.isDirect()) {
            ByteBuffer dup = this.buf.duplicate();
            dup.position(index);
            dup.put(dst, off, count);
            return count;
        }
        System.arraycopy(this.data, index, dst, off, count);
        return count;
    }

    public int getBytes(int index, ByteBuffer bb, int len) {
        int count = Math.min(bb.remaining(), this.size - index);
        int count2 = Math.min(count, len);
        bb.put(this.buf);
        return count2;
    }

    public String toString() {
        return String.format("#zmq.Msg{type=%s, size=%s, flags=%s}", this.type, Integer.valueOf(this.size), Integer.valueOf(this.flags));
    }
}
