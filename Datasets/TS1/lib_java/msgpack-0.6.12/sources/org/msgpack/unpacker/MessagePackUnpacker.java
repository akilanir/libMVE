package org.msgpack.unpacker;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import org.msgpack.MessagePack;
import org.msgpack.MessageTypeException;
import org.msgpack.io.BufferReferer;
import org.msgpack.io.Input;
import org.msgpack.io.StreamInput;
import org.msgpack.packer.Unconverter;
import org.msgpack.type.ValueType;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/MessagePackUnpacker.class */
public class MessagePackUnpacker extends AbstractUnpacker {
    private static final byte REQUIRE_TO_READ_HEAD = -63;
    protected final Input in;
    private final UnpackerStack stack;
    private byte headByte;
    private byte[] raw;
    private int rawFilled;
    private final IntAccept intAccept;
    private final LongAccept longAccept;
    private final BigIntegerAccept bigIntegerAccept;
    private final DoubleAccept doubleAccept;
    private final ByteArrayAccept byteArrayAccept;
    private final StringAccept stringAccept;
    private final ArrayAccept arrayAccept;
    private final MapAccept mapAccept;
    private final ValueAccept valueAccept;
    private final SkipAccept skipAccept;

    public MessagePackUnpacker(MessagePack msgpack, InputStream stream) {
        this(msgpack, new StreamInput(stream));
    }

    protected MessagePackUnpacker(MessagePack msgpack, Input in) {
        super(msgpack);
        this.stack = new UnpackerStack();
        this.headByte = (byte) -63;
        this.intAccept = new IntAccept();
        this.longAccept = new LongAccept();
        this.bigIntegerAccept = new BigIntegerAccept();
        this.doubleAccept = new DoubleAccept();
        this.byteArrayAccept = new ByteArrayAccept();
        this.stringAccept = new StringAccept();
        this.arrayAccept = new ArrayAccept();
        this.mapAccept = new MapAccept();
        this.valueAccept = new ValueAccept();
        this.skipAccept = new SkipAccept();
        this.in = in;
    }

    private byte getHeadByte() throws IOException {
        byte b = this.headByte;
        if (b == REQUIRE_TO_READ_HEAD) {
            byte readByte = this.in.readByte();
            this.headByte = readByte;
            b = readByte;
        }
        return b;
    }

    final void readOne(Accept a) throws IOException {
        this.stack.checkCount();
        if (readOneWithoutStack(a)) {
            this.stack.reduceCount();
        }
    }

    final boolean readOneWithoutStack(Accept a) throws IOException {
        if (this.raw != null) {
            readRawBodyCont();
            a.acceptRaw(this.raw);
            this.raw = null;
            this.headByte = (byte) -63;
            return true;
        }
        int b = getHeadByte();
        if ((b & 128) == 0) {
            a.acceptInteger(b);
            this.headByte = (byte) -63;
            return true;
        }
        if ((b & 224) == 224) {
            a.acceptInteger(b);
            this.headByte = (byte) -63;
            return true;
        }
        if ((b & 224) == 160) {
            int count = b & 31;
            if (count == 0) {
                a.acceptEmptyRaw();
                this.headByte = (byte) -63;
                return true;
            }
            if (!tryReferRawBody(a, count)) {
                readRawBody(count);
                a.acceptRaw(this.raw);
                this.raw = null;
            }
            this.headByte = (byte) -63;
            return true;
        }
        if ((b & 240) == 144) {
            int count2 = b & 15;
            a.acceptArray(count2);
            this.stack.reduceCount();
            this.stack.pushArray(count2);
            this.headByte = (byte) -63;
            return false;
        }
        if ((b & 240) == 128) {
            int count3 = b & 15;
            a.acceptMap(count3);
            this.stack.reduceCount();
            this.stack.pushMap(count3);
            this.headByte = (byte) -63;
            return false;
        }
        return readOneWithoutStackLarge(a, b);
    }

    private boolean readOneWithoutStackLarge(Accept a, int b) throws IOException {
        switch (b & 255) {
            case 192:
                a.acceptNil();
                this.headByte = (byte) -63;
                return true;
            case 193:
            case 199:
            case 200:
            case 201:
            case 212:
            case 213:
            case 214:
            case 215:
            case 216:
            default:
                this.headByte = (byte) -63;
                throw new IOException("Invalid byte: " + b);
            case 194:
                a.acceptBoolean(false);
                this.headByte = (byte) -63;
                return true;
            case 195:
                a.acceptBoolean(true);
                this.headByte = (byte) -63;
                return true;
            case 196:
            case 217:
                int count = this.in.getByte() & 255;
                if (count == 0) {
                    a.acceptEmptyRaw();
                    this.in.advance();
                    this.headByte = (byte) -63;
                    return true;
                }
                if (count >= this.rawSizeLimit) {
                    String reason = String.format("Size of raw (%d) over limit at %d", Integer.valueOf(count), Integer.valueOf(this.rawSizeLimit));
                    throw new SizeLimitException(reason);
                }
                this.in.advance();
                if (!tryReferRawBody(a, count)) {
                    readRawBody(count);
                    a.acceptRaw(this.raw);
                    this.raw = null;
                }
                this.headByte = (byte) -63;
                return true;
            case 197:
            case 218:
                int count2 = this.in.getShort() & 65535;
                if (count2 == 0) {
                    a.acceptEmptyRaw();
                    this.in.advance();
                    this.headByte = (byte) -63;
                    return true;
                }
                if (count2 >= this.rawSizeLimit) {
                    String reason2 = String.format("Size of raw (%d) over limit at %d", Integer.valueOf(count2), Integer.valueOf(this.rawSizeLimit));
                    throw new SizeLimitException(reason2);
                }
                this.in.advance();
                if (!tryReferRawBody(a, count2)) {
                    readRawBody(count2);
                    a.acceptRaw(this.raw);
                    this.raw = null;
                }
                this.headByte = (byte) -63;
                return true;
            case 198:
            case 219:
                int count3 = this.in.getInt();
                if (count3 == 0) {
                    a.acceptEmptyRaw();
                    this.in.advance();
                    this.headByte = (byte) -63;
                    return true;
                }
                if (count3 < 0 || count3 >= this.rawSizeLimit) {
                    String reason3 = String.format("Size of raw (%d) over limit at %d", Integer.valueOf(count3), Integer.valueOf(this.rawSizeLimit));
                    throw new SizeLimitException(reason3);
                }
                this.in.advance();
                if (!tryReferRawBody(a, count3)) {
                    readRawBody(count3);
                    a.acceptRaw(this.raw);
                    this.raw = null;
                }
                this.headByte = (byte) -63;
                return true;
            case 202:
                a.acceptFloat(this.in.getFloat());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 203:
                a.acceptDouble(this.in.getDouble());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 204:
                a.acceptUnsignedInteger(this.in.getByte());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 205:
                a.acceptUnsignedInteger(this.in.getShort());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 206:
                a.acceptUnsignedInteger(this.in.getInt());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 207:
                a.acceptUnsignedInteger(this.in.getLong());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 208:
                a.acceptInteger(this.in.getByte());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 209:
                a.acceptInteger(this.in.getShort());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 210:
                a.acceptInteger(this.in.getInt());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 211:
                a.acceptInteger(this.in.getLong());
                this.in.advance();
                this.headByte = (byte) -63;
                return true;
            case 220:
                int count4 = this.in.getShort() & 65535;
                if (count4 >= this.arraySizeLimit) {
                    String reason4 = String.format("Size of array (%d) over limit at %d", Integer.valueOf(count4), Integer.valueOf(this.arraySizeLimit));
                    throw new SizeLimitException(reason4);
                }
                a.acceptArray(count4);
                this.stack.reduceCount();
                this.stack.pushArray(count4);
                this.in.advance();
                this.headByte = (byte) -63;
                return false;
            case 221:
                int count5 = this.in.getInt();
                if (count5 < 0 || count5 >= this.arraySizeLimit) {
                    String reason5 = String.format("Size of array (%d) over limit at %d", Integer.valueOf(count5), Integer.valueOf(this.arraySizeLimit));
                    throw new SizeLimitException(reason5);
                }
                a.acceptArray(count5);
                this.stack.reduceCount();
                this.stack.pushArray(count5);
                this.in.advance();
                this.headByte = (byte) -63;
                return false;
            case 222:
                int count6 = this.in.getShort() & 65535;
                if (count6 >= this.mapSizeLimit) {
                    String reason6 = String.format("Size of map (%d) over limit at %d", Integer.valueOf(count6), Integer.valueOf(this.mapSizeLimit));
                    throw new SizeLimitException(reason6);
                }
                a.acceptMap(count6);
                this.stack.reduceCount();
                this.stack.pushMap(count6);
                this.in.advance();
                this.headByte = (byte) -63;
                return false;
            case 223:
                int count7 = this.in.getInt();
                if (count7 < 0 || count7 >= this.mapSizeLimit) {
                    String reason7 = String.format("Size of map (%d) over limit at %d", Integer.valueOf(count7), Integer.valueOf(this.mapSizeLimit));
                    throw new SizeLimitException(reason7);
                }
                a.acceptMap(count7);
                this.stack.reduceCount();
                this.stack.pushMap(count7);
                this.in.advance();
                this.headByte = (byte) -63;
                return false;
        }
    }

    private boolean tryReferRawBody(BufferReferer referer, int size) throws IOException {
        return this.in.tryRefer(referer, size);
    }

    private void readRawBody(int size) throws IOException {
        this.raw = new byte[size];
        this.rawFilled = 0;
        readRawBodyCont();
    }

    private void readRawBodyCont() throws IOException {
        int len = this.in.read(this.raw, this.rawFilled, this.raw.length - this.rawFilled);
        this.rawFilled += len;
        if (this.rawFilled < this.raw.length) {
            throw new EOFException();
        }
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker
    protected boolean tryReadNil() throws IOException {
        this.stack.checkCount();
        int b = getHeadByte() & 255;
        if (b == 192) {
            this.stack.reduceCount();
            this.headByte = (byte) -63;
            return true;
        }
        return false;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public boolean trySkipNil() throws IOException {
        if (this.stack.getDepth() > 0 && this.stack.getTopCount() <= 0) {
            return true;
        }
        int b = getHeadByte() & 255;
        if (b == 192) {
            this.stack.reduceCount();
            this.headByte = (byte) -63;
            return true;
        }
        return false;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readNil() throws IOException {
        this.stack.checkCount();
        int b = getHeadByte() & 255;
        if (b == 192) {
            this.stack.reduceCount();
            this.headByte = (byte) -63;
            return;
        }
        throw new MessageTypeException("Expected nil but got not nil value");
    }

    @Override // org.msgpack.unpacker.Unpacker
    public boolean readBoolean() throws IOException {
        this.stack.checkCount();
        int b = getHeadByte() & 255;
        if (b == 194) {
            this.stack.reduceCount();
            this.headByte = (byte) -63;
            return false;
        }
        if (b == 195) {
            this.stack.reduceCount();
            this.headByte = (byte) -63;
            return true;
        }
        throw new MessageTypeException("Expected Boolean but got not boolean value");
    }

    @Override // org.msgpack.unpacker.Unpacker
    public byte readByte() throws IOException {
        this.stack.checkCount();
        readOneWithoutStack(this.intAccept);
        int value = this.intAccept.value;
        if (value < -128 || value > 127) {
            throw new MessageTypeException();
        }
        this.stack.reduceCount();
        return (byte) value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public short readShort() throws IOException {
        this.stack.checkCount();
        readOneWithoutStack(this.intAccept);
        int value = this.intAccept.value;
        if (value < -32768 || value > 32767) {
            throw new MessageTypeException();
        }
        this.stack.reduceCount();
        return (short) value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public int readInt() throws IOException {
        readOne(this.intAccept);
        return this.intAccept.value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public long readLong() throws IOException {
        readOne(this.longAccept);
        return this.longAccept.value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public BigInteger readBigInteger() throws IOException {
        readOne(this.bigIntegerAccept);
        return this.bigIntegerAccept.value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public float readFloat() throws IOException {
        readOne(this.doubleAccept);
        return (float) this.doubleAccept.value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public double readDouble() throws IOException {
        readOne(this.doubleAccept);
        return this.doubleAccept.value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public byte[] readByteArray() throws IOException {
        readOne(this.byteArrayAccept);
        return this.byteArrayAccept.value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public String readString() throws IOException {
        readOne(this.stringAccept);
        return this.stringAccept.value;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public int readArrayBegin() throws IOException {
        readOne(this.arrayAccept);
        return this.arrayAccept.size;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readArrayEnd(boolean check) throws IOException {
        if (!this.stack.topIsArray()) {
            throw new MessageTypeException("readArrayEnd() is called but readArrayBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("readArrayEnd(check=true) is called but the array is not end");
            }
            for (int i = 0; i < remain; i++) {
                skip();
            }
        }
        this.stack.pop();
    }

    @Override // org.msgpack.unpacker.Unpacker
    public int readMapBegin() throws IOException {
        readOne(this.mapAccept);
        return this.mapAccept.size;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readMapEnd(boolean check) throws IOException {
        if (!this.stack.topIsMap()) {
            throw new MessageTypeException("readMapEnd() is called but readMapBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("readMapEnd(check=true) is called but the map is not end");
            }
            for (int i = 0; i < remain; i++) {
                skip();
            }
        }
        this.stack.pop();
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker
    protected void readValue(Unconverter uc) throws IOException {
        if (uc.getResult() != null) {
            uc.resetResult();
        }
        this.valueAccept.setUnconverter(uc);
        this.stack.checkCount();
        if (readOneWithoutStack(this.valueAccept)) {
            this.stack.reduceCount();
            if (uc.getResult() != null) {
                return;
            }
        }
        while (true) {
            if (this.stack.getTopCount() == 0) {
                if (this.stack.topIsArray()) {
                    uc.writeArrayEnd(true);
                    this.stack.pop();
                } else if (this.stack.topIsMap()) {
                    uc.writeMapEnd(true);
                    this.stack.pop();
                } else {
                    throw new RuntimeException("invalid stack");
                }
                if (uc.getResult() != null) {
                    return;
                }
            } else {
                readOne(this.valueAccept);
            }
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void skip() throws IOException {
        this.stack.checkCount();
        if (readOneWithoutStack(this.skipAccept)) {
            this.stack.reduceCount();
            return;
        }
        int targetDepth = this.stack.getDepth() - 1;
        while (true) {
            if (this.stack.getTopCount() == 0) {
                this.stack.pop();
                if (this.stack.getDepth() <= targetDepth) {
                    return;
                }
            } else {
                readOne(this.skipAccept);
            }
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public ValueType getNextType() throws IOException {
        int b = getHeadByte();
        if ((b & 128) == 0) {
            return ValueType.INTEGER;
        }
        if ((b & 224) == 224) {
            return ValueType.INTEGER;
        }
        if ((b & 224) == 160) {
            return ValueType.RAW;
        }
        if ((b & 240) == 144) {
            return ValueType.ARRAY;
        }
        if ((b & 240) == 128) {
            return ValueType.MAP;
        }
        switch (b & 255) {
            case 192:
                return ValueType.NIL;
            case 193:
            case 199:
            case 200:
            case 201:
            case 212:
            case 213:
            case 214:
            case 215:
            case 216:
            default:
                throw new IOException("Invalid byte: " + b);
            case 194:
            case 195:
                return ValueType.BOOLEAN;
            case 196:
            case 197:
            case 198:
            case 217:
            case 218:
            case 219:
                return ValueType.RAW;
            case 202:
            case 203:
                return ValueType.FLOAT;
            case 204:
            case 205:
            case 206:
            case 207:
            case 208:
            case 209:
            case 210:
            case 211:
                return ValueType.INTEGER;
            case 220:
            case 221:
                return ValueType.ARRAY;
            case 222:
            case 223:
                return ValueType.MAP;
        }
    }

    public void reset() {
        this.raw = null;
        this.stack.clear();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public int getReadByteCount() {
        return this.in.getReadByteCount();
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public void resetReadByteCount() {
        this.in.resetReadByteCount();
    }
}
