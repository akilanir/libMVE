package org.msgpack.util.json;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import org.msgpack.MessagePack;
import org.msgpack.MessageTypeException;
import org.msgpack.io.Output;
import org.msgpack.io.StreamOutput;
import org.msgpack.packer.AbstractPacker;
import org.msgpack.packer.Packer;
import org.msgpack.packer.PackerStack;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/json/JSONPacker.class */
public class JSONPacker extends AbstractPacker {
    private static final byte COMMA = 44;
    private static final byte COLON = 58;
    private static final byte QUOTE = 34;
    private static final byte LEFT_BR = 91;
    private static final byte RIGHT_BR = 93;
    private static final byte LEFT_WN = 123;
    private static final byte RIGHT_WN = 125;
    private static final byte BACKSLASH = 92;
    private static final byte ZERO = 48;
    private static final int FLAG_FIRST_ELEMENT = 1;
    private static final int FLAG_MAP_KEY = 2;
    private static final int FLAG_MAP_VALUE = 4;
    protected final Output out;
    private int[] flags;
    private PackerStack stack;
    private CharsetDecoder decoder;
    private static final byte[] HEX_TABLE;
    private static final byte[] NULL = {110, 117, 108, 108};
    private static final byte[] TRUE = {116, 114, 117, 101};
    private static final byte[] FALSE = {102, 97, 108, 115, 101};
    private static final int[] ESCAPE_TABLE = new int[128];

    static {
        for (int i = 0; i < 32; i++) {
            ESCAPE_TABLE[i] = -1;
        }
        ESCAPE_TABLE[QUOTE] = QUOTE;
        ESCAPE_TABLE[BACKSLASH] = BACKSLASH;
        ESCAPE_TABLE[8] = 98;
        ESCAPE_TABLE[9] = 116;
        ESCAPE_TABLE[12] = 102;
        ESCAPE_TABLE[10] = 110;
        ESCAPE_TABLE[13] = 114;
        char[] hex = "0123456789ABCDEF".toCharArray();
        HEX_TABLE = new byte[hex.length];
        for (int i2 = 0; i2 < hex.length; i2++) {
            HEX_TABLE[i2] = (byte) hex[i2];
        }
    }

    public JSONPacker(OutputStream stream) {
        this(new MessagePack(), stream);
    }

    public JSONPacker(MessagePack msgpack, OutputStream stream) {
        this(msgpack, new StreamOutput(stream));
    }

    protected JSONPacker(MessagePack msgpack, Output out) {
        super(msgpack);
        this.stack = new PackerStack();
        this.out = out;
        this.stack = new PackerStack();
        this.flags = new int[128];
        this.decoder = Charset.forName("UTF-8").newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT);
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeBoolean(boolean v) throws IOException {
        beginElement();
        if (v) {
            this.out.write(TRUE, 0, TRUE.length);
        } else {
            this.out.write(FALSE, 0, FALSE.length);
        }
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeByte(byte v) throws IOException {
        beginElement();
        byte[] b = Byte.toString(v).getBytes();
        this.out.write(b, 0, b.length);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeShort(short v) throws IOException {
        beginElement();
        byte[] b = Short.toString(v).getBytes();
        this.out.write(b, 0, b.length);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeInt(int v) throws IOException {
        beginElement();
        byte[] b = Integer.toString(v).getBytes();
        this.out.write(b, 0, b.length);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeLong(long v) throws IOException {
        beginElement();
        byte[] b = Long.toString(v).getBytes();
        this.out.write(b, 0, b.length);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeBigInteger(BigInteger v) throws IOException {
        beginElement();
        byte[] b = v.toString().getBytes();
        this.out.write(b, 0, b.length);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeFloat(float v) throws IOException {
        beginElement();
        Float r = Float.valueOf(v);
        if (r.isInfinite() || r.isNaN()) {
            throw new IOException("JSONPacker doesn't support NaN and infinite float value");
        }
        byte[] b = Float.toString(v).getBytes();
        this.out.write(b, 0, b.length);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeDouble(double v) throws IOException {
        beginElement();
        Double r = Double.valueOf(v);
        if (r.isInfinite() || r.isNaN()) {
            throw new IOException("JSONPacker doesn't support NaN and infinite float value");
        }
        byte[] b = Double.toString(v).getBytes();
        this.out.write(b, 0, b.length);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeByteArray(byte[] b, int off, int len) throws IOException {
        beginStringElement();
        this.out.writeByte((byte) 34);
        escape(this.out, b, off, len);
        this.out.writeByte((byte) 34);
        endElement();
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeByteBuffer(ByteBuffer bb) throws IOException {
        beginStringElement();
        this.out.writeByte((byte) 34);
        int pos = bb.position();
        try {
            escape(this.out, bb);
            bb.position(pos);
            this.out.writeByte((byte) 34);
            endElement();
        } catch (Throwable th) {
            bb.position(pos);
            throw th;
        }
    }

    @Override // org.msgpack.packer.AbstractPacker
    protected void writeString(String s) throws IOException {
        beginStringElement();
        this.out.writeByte((byte) 34);
        escape(this.out, s);
        this.out.writeByte((byte) 34);
        endElement();
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeNil() throws IOException {
        beginElement();
        this.out.write(NULL, 0, NULL.length);
        endElement();
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeArrayBegin(int size) throws IOException {
        beginElement();
        this.out.writeByte((byte) 91);
        endElement();
        this.stack.pushArray(size);
        this.flags[this.stack.getDepth()] = 1;
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeArrayEnd(boolean check) throws IOException {
        if (!this.stack.topIsArray()) {
            throw new MessageTypeException("writeArrayEnd() is called but writeArrayBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("writeArrayEnd(check=true) is called but the array is not end: " + remain);
            }
            for (int i = 0; i < remain; i++) {
                writeNil();
            }
        }
        this.stack.pop();
        this.out.writeByte((byte) 93);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeMapBegin(int size) throws IOException {
        beginElement();
        this.out.writeByte((byte) 123);
        endElement();
        this.stack.pushMap(size);
        this.flags[this.stack.getDepth()] = 3;
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeMapEnd(boolean check) throws IOException {
        if (!this.stack.topIsMap()) {
            throw new MessageTypeException("writeMapEnd() is called but writeMapBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("writeMapEnd(check=true) is called but the map is not end: " + remain);
            }
            for (int i = 0; i < remain; i++) {
                writeNil();
            }
        }
        this.stack.pop();
        this.out.writeByte((byte) 125);
        return this;
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    @Override // org.msgpack.packer.AbstractPacker, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
    }

    public void reset() {
        this.stack.clear();
    }

    private void beginElement() throws IOException {
        int flag = this.flags[this.stack.getDepth()];
        if ((flag & 2) != 0) {
            throw new IOException("Key of a map must be a string in JSON");
        }
        beginStringElement();
    }

    private void beginStringElement() throws IOException {
        int flag = this.flags[this.stack.getDepth()];
        if ((flag & FLAG_MAP_VALUE) != 0) {
            this.out.writeByte((byte) 58);
        } else if (this.stack.getDepth() > 0 && (flag & 1) == 0) {
            this.out.writeByte((byte) 44);
        }
    }

    private void endElement() throws IOException {
        int flag = this.flags[this.stack.getDepth()];
        if ((flag & 2) != 0) {
            flag = (flag & (-3)) | FLAG_MAP_VALUE;
        } else if ((flag & FLAG_MAP_VALUE) != 0) {
            flag = (flag & (-5)) | 2;
        }
        this.flags[this.stack.getDepth()] = flag & (-2);
        this.stack.reduceCount();
    }

    private void escape(Output out, byte[] b, int off, int len) throws IOException {
        escape(out, ByteBuffer.wrap(b, off, len));
    }

    private void escape(Output out, ByteBuffer bb) throws IOException {
        String str = this.decoder.decode(bb).toString();
        escape(out, str);
    }

    private static void escape(Output out, String s) throws IOException {
        byte[] tmp = {BACKSLASH, 117, 0, 0, 0, 0};
        char[] chars = s.toCharArray();
        for (char c : chars) {
            if (c <= 127) {
                int e = ESCAPE_TABLE[c];
                if (e == 0) {
                    tmp[2] = (byte) c;
                    out.write(tmp, 2, 1);
                } else if (e > 0) {
                    tmp[2] = BACKSLASH;
                    tmp[3] = (byte) e;
                    out.write(tmp, 2, 2);
                } else {
                    tmp[2] = ZERO;
                    tmp[3] = ZERO;
                    tmp[FLAG_MAP_VALUE] = HEX_TABLE[c >> FLAG_MAP_VALUE];
                    tmp[5] = HEX_TABLE[c & 15];
                    out.write(tmp, 0, 6);
                }
            } else if (c <= 2047) {
                tmp[2] = (byte) (192 | (c >> 6));
                tmp[3] = (byte) (128 | (c & '?'));
                out.write(tmp, 2, 2);
            } else if (c >= 55296 && c <= 57343) {
                tmp[2] = HEX_TABLE[(c >> '\f') & 15];
                tmp[3] = HEX_TABLE[(c >> '\b') & 15];
                tmp[FLAG_MAP_VALUE] = HEX_TABLE[(c >> FLAG_MAP_VALUE) & 15];
                tmp[5] = HEX_TABLE[c & 15];
                out.write(tmp, 0, 6);
            } else {
                tmp[2] = (byte) (224 | (c >> '\f'));
                tmp[3] = (byte) (128 | ((c >> 6) & 63));
                tmp[FLAG_MAP_VALUE] = (byte) (128 | (c & '?'));
                out.write(tmp, 2, 3);
            }
        }
    }
}
