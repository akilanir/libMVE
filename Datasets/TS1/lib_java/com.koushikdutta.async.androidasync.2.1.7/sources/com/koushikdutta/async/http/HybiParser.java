package com.koushikdutta.async.http;

import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataEmitterReader;
import com.koushikdutta.async.callback.DataCallback;
import com.koushikdutta.async.http.cache.ResponseCacheMiddleware;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/HybiParser.class */
abstract class HybiParser {
    private static final String TAG = "HybiParser";
    private int mStage;
    private boolean mFinal;
    private boolean mMasked;
    private boolean mDeflated;
    private int mOpcode;
    private int mLengthSize;
    private int mLength;
    private int mMode;
    private static final int BYTE = 255;
    private static final int FIN = 128;
    private static final int MASK = 128;
    private static final int RSV1 = 64;
    private static final int RSV2 = 32;
    private static final int RSV3 = 16;
    private static final int OPCODE = 15;
    private static final int LENGTH = 127;
    private static final int MODE_TEXT = 1;
    private static final int MODE_BINARY = 2;
    private static final int OP_CONTINUATION = 0;
    private static final int OP_TEXT = 1;
    private static final int OP_BINARY = 2;
    private static final int OP_CLOSE = 8;
    private static final int OP_PING = 9;
    private static final int OP_PONG = 10;
    private static final List<Integer> OPCODES = Arrays.asList(0, 1, 2, Integer.valueOf(OP_CLOSE), Integer.valueOf(OP_PING), Integer.valueOf(OP_PONG));
    private static final List<Integer> FRAGMENTED_OPCODES = Arrays.asList(0, 1, 2);
    private static final long BASE = 2;
    private static final long _2_TO_8_ = 256;
    private static final long _2_TO_16_ = 65536;
    private static final long _2_TO_24 = 16777216;
    private static final long _2_TO_32_ = 4294967296L;
    private static final long _2_TO_40_ = 1099511627776L;
    private static final long _2_TO_48_ = 281474976710656L;
    private static final long _2_TO_56_ = 72057594037927936L;
    private boolean mMasking = true;
    private boolean mDeflate = false;
    private byte[] mMask = new byte[0];
    private byte[] mPayload = new byte[0];
    private boolean mClosed = false;
    private ByteArrayOutputStream mBuffer = new ByteArrayOutputStream();
    private Inflater mInflater = new Inflater(true);
    private byte[] mInflateBuffer = new byte[4096];
    DataCallback mStage0 = new DataCallback() { // from class: com.koushikdutta.async.http.HybiParser.1
        @Override // com.koushikdutta.async.callback.DataCallback
        public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
            try {
                HybiParser.this.parseOpcode(bb.get());
            } catch (ProtocolError e) {
                HybiParser.this.report(e);
                e.printStackTrace();
            }
            HybiParser.this.parse();
        }
    };
    DataCallback mStage1 = new DataCallback() { // from class: com.koushikdutta.async.http.HybiParser.2
        @Override // com.koushikdutta.async.callback.DataCallback
        public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
            HybiParser.this.parseLength(bb.get());
            HybiParser.this.parse();
        }
    };
    DataCallback mStage2 = new DataCallback() { // from class: com.koushikdutta.async.http.HybiParser.3
        @Override // com.koushikdutta.async.callback.DataCallback
        public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
            byte[] bytes = new byte[HybiParser.this.mLengthSize];
            bb.get(bytes);
            try {
                HybiParser.this.parseExtendedLength(bytes);
            } catch (ProtocolError e) {
                HybiParser.this.report(e);
                e.printStackTrace();
            }
            HybiParser.this.parse();
        }
    };
    DataCallback mStage3 = new DataCallback() { // from class: com.koushikdutta.async.http.HybiParser.4
        @Override // com.koushikdutta.async.callback.DataCallback
        public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
            HybiParser.this.mMask = new byte[4];
            bb.get(HybiParser.this.mMask);
            HybiParser.this.mStage = 4;
            HybiParser.this.parse();
        }
    };
    DataCallback mStage4 = new DataCallback() { // from class: com.koushikdutta.async.http.HybiParser.5
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !HybiParser.class.desiredAssertionStatus();
        }

        @Override // com.koushikdutta.async.callback.DataCallback
        public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
            if (!$assertionsDisabled && bb.remaining() != HybiParser.this.mLength) {
                throw new AssertionError();
            }
            HybiParser.this.mPayload = new byte[HybiParser.this.mLength];
            bb.get(HybiParser.this.mPayload);
            try {
                HybiParser.this.emitFrame();
            } catch (IOException e) {
                HybiParser.this.report(e);
                e.printStackTrace();
            }
            HybiParser.this.mStage = 0;
            HybiParser.this.parse();
        }
    };
    private DataEmitterReader mReader = new DataEmitterReader();

    protected abstract void onMessage(byte[] bArr);

    protected abstract void onMessage(String str);

    protected abstract void onPong(String str);

    protected abstract void onPing(String str);

    protected abstract void onDisconnect(int i, String str);

    protected abstract void report(Exception exc);

    protected abstract void sendFrame(byte[] bArr);

    private static byte[] mask(byte[] payload, byte[] mask, int offset) {
        if (mask.length == 0) {
            return payload;
        }
        for (int i = 0; i < payload.length - offset; i++) {
            payload[offset + i] = (byte) (payload[offset + i] ^ mask[i % 4]);
        }
        return payload;
    }

    private byte[] inflate(byte[] payload) throws DataFormatException {
        ByteArrayOutputStream inflated = new ByteArrayOutputStream();
        this.mInflater.setInput(payload);
        while (!this.mInflater.needsInput()) {
            int chunkSize = this.mInflater.inflate(this.mInflateBuffer);
            inflated.write(this.mInflateBuffer, 0, chunkSize);
        }
        this.mInflater.setInput(new byte[]{0, 0, -1, -1});
        while (!this.mInflater.needsInput()) {
            int chunkSize2 = this.mInflater.inflate(this.mInflateBuffer);
            inflated.write(this.mInflateBuffer, 0, chunkSize2);
        }
        return inflated.toByteArray();
    }

    public void setMasking(boolean masking) {
        this.mMasking = masking;
    }

    public void setDeflate(boolean deflate) {
        this.mDeflate = deflate;
    }

    void parse() {
        switch (this.mStage) {
            case 0:
                this.mReader.read(1, this.mStage0);
                break;
            case ResponseCacheMiddleware.ENTRY_BODY /* 1 */:
                this.mReader.read(1, this.mStage1);
                break;
            case ResponseCacheMiddleware.ENTRY_COUNT /* 2 */:
                this.mReader.read(this.mLengthSize, this.mStage2);
                break;
            case 3:
                this.mReader.read(4, this.mStage3);
                break;
            case 4:
                this.mReader.read(this.mLength, this.mStage4);
                break;
        }
    }

    public HybiParser(DataEmitter socket) {
        socket.setDataCallback(this.mReader);
        parse();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void parseOpcode(byte data) throws ProtocolError {
        boolean rsv1 = (data & RSV1) == RSV1;
        boolean rsv2 = (data & RSV2) == RSV2;
        boolean rsv3 = (data & RSV3) == RSV3;
        if ((!this.mDeflate && rsv1) || rsv2 || rsv3) {
            throw new ProtocolError("RSV not zero");
        }
        this.mFinal = (data & 128) == 128;
        this.mOpcode = data & OPCODE;
        this.mDeflated = rsv1;
        this.mMask = new byte[0];
        this.mPayload = new byte[0];
        if (!OPCODES.contains(Integer.valueOf(this.mOpcode))) {
            throw new ProtocolError("Bad opcode");
        }
        if (!FRAGMENTED_OPCODES.contains(Integer.valueOf(this.mOpcode)) && !this.mFinal) {
            throw new ProtocolError("Expected non-final packet");
        }
        this.mStage = 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void parseLength(byte data) {
        this.mMasked = (data & 128) == 128;
        this.mLength = data & LENGTH;
        if (this.mLength >= 0 && this.mLength <= 125) {
            this.mStage = this.mMasked ? 3 : 4;
        } else {
            this.mLengthSize = this.mLength == 126 ? 2 : OP_CLOSE;
            this.mStage = 2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void parseExtendedLength(byte[] buffer) throws ProtocolError {
        this.mLength = getInteger(buffer);
        this.mStage = this.mMasked ? 3 : 4;
    }

    public byte[] frame(String data) {
        return frame(1, data, -1);
    }

    public byte[] frame(byte[] data) {
        return frame(2, data, -1);
    }

    public byte[] frame(byte[] data, int offset, int length) {
        return frame(2, data, -1, offset, length);
    }

    public byte[] pingFrame(String data) {
        return frame(OP_PING, data, -1);
    }

    private byte[] frame(int opcode, byte[] data, int errorCode) {
        return frame(opcode, data, errorCode, 0, data.length);
    }

    private byte[] frame(int opcode, String data, int errorCode) {
        return frame(opcode, decode(data), errorCode);
    }

    private byte[] frame(int opcode, byte[] data, int errorCode, int dataOffset, int dataLength) {
        if (this.mClosed) {
            return null;
        }
        int insert = errorCode > 0 ? 2 : 0;
        int length = (dataLength + insert) - dataOffset;
        int header = length <= 125 ? 2 : length <= 65535 ? 4 : OP_PONG;
        int offset = header + (this.mMasking ? 4 : 0);
        int masked = this.mMasking ? 128 : 0;
        byte[] frame = new byte[length + offset];
        frame[0] = (byte) (Byte.MIN_VALUE | ((byte) opcode));
        if (length <= 125) {
            frame[1] = (byte) (masked | length);
        } else if (length <= 65535) {
            frame[1] = (byte) (masked | 126);
            frame[2] = (byte) (length / 256);
            frame[3] = (byte) (length & BYTE);
        } else {
            frame[1] = (byte) (masked | LENGTH);
            frame[2] = (byte) ((length / _2_TO_56_) & 255);
            frame[3] = (byte) ((length / _2_TO_48_) & 255);
            frame[4] = (byte) ((length / _2_TO_40_) & 255);
            frame[5] = (byte) ((length / _2_TO_32_) & 255);
            frame[6] = (byte) ((length / _2_TO_24) & 255);
            frame[7] = (byte) ((length / _2_TO_16_) & 255);
            frame[OP_CLOSE] = (byte) ((length / _2_TO_8_) & 255);
            frame[OP_PING] = (byte) (length & BYTE);
        }
        if (errorCode > 0) {
            frame[offset] = (byte) ((errorCode / 256) & BYTE);
            frame[offset + 1] = (byte) (errorCode & BYTE);
        }
        System.arraycopy(data, dataOffset, frame, offset + insert, dataLength - dataOffset);
        if (this.mMasking) {
            byte[] mask = {(byte) Math.floor(Math.random() * 256.0d), (byte) Math.floor(Math.random() * 256.0d), (byte) Math.floor(Math.random() * 256.0d), (byte) Math.floor(Math.random() * 256.0d)};
            System.arraycopy(mask, 0, frame, header, mask.length);
            mask(frame, mask, offset);
        }
        return frame;
    }

    public void close(int code, String reason) {
        if (this.mClosed) {
            return;
        }
        sendFrame(frame(OP_CLOSE, reason, code));
        this.mClosed = true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void emitFrame() throws IOException {
        byte[] payload = mask(this.mPayload, this.mMask, 0);
        if (this.mDeflated) {
            try {
                payload = inflate(payload);
            } catch (DataFormatException e) {
                throw new IOException("Invalid deflated data");
            }
        }
        int opcode = this.mOpcode;
        if (opcode == 0) {
            if (this.mMode == 0) {
                throw new ProtocolError("Mode was not set.");
            }
            this.mBuffer.write(payload);
            if (this.mFinal) {
                byte[] message = this.mBuffer.toByteArray();
                if (this.mMode == 1) {
                    onMessage(encode(message));
                } else {
                    onMessage(message);
                }
                reset();
                return;
            }
            return;
        }
        if (opcode == 1) {
            if (this.mFinal) {
                String messageText = encode(payload);
                onMessage(messageText);
                return;
            } else {
                this.mMode = 1;
                this.mBuffer.write(payload);
                return;
            }
        }
        if (opcode == 2) {
            if (this.mFinal) {
                onMessage(payload);
                return;
            } else {
                this.mMode = 2;
                this.mBuffer.write(payload);
                return;
            }
        }
        if (opcode == OP_CLOSE) {
            int code = payload.length >= 2 ? (256 * (payload[0] & BYTE)) + (payload[1] & BYTE) : 0;
            String reason = payload.length > 2 ? encode(slice(payload, 2)) : null;
            onDisconnect(code, reason);
        } else {
            if (opcode != OP_PING) {
                if (opcode == OP_PONG) {
                    String message2 = encode(payload);
                    onPong(message2);
                    return;
                }
                return;
            }
            if (payload.length > 125) {
                throw new ProtocolError("Ping payload too large");
            }
            String message3 = encode(payload);
            sendFrame(frame(OP_PONG, payload, -1));
            onPing(message3);
        }
    }

    private void reset() {
        this.mMode = 0;
        this.mBuffer.reset();
    }

    private String encode(byte[] buffer) {
        try {
            return new String(buffer, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private byte[] decode(String string) {
        try {
            return string.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private int getInteger(byte[] bytes) throws ProtocolError {
        long i = byteArrayToLong(bytes, 0, bytes.length);
        if (i < 0 || i > 2147483647L) {
            throw new ProtocolError("Bad integer: " + i);
        }
        return (int) i;
    }

    private byte[] slice(byte[] array, int start) {
        byte[] copy = new byte[array.length - start];
        System.arraycopy(array, start, copy, 0, array.length - start);
        return copy;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/HybiParser$ProtocolError.class */
    public static class ProtocolError extends IOException {
        public ProtocolError(String detailMessage) {
            super(detailMessage);
        }
    }

    private static long byteArrayToLong(byte[] b, int offset, int length) {
        if (b.length < length) {
            throw new IllegalArgumentException("length must be less than or equal to b.length");
        }
        long value = 0;
        for (int i = 0; i < length; i++) {
            int shift = ((length - 1) - i) * OP_CLOSE;
            value += (b[i + offset] & BYTE) << shift;
        }
        return value;
    }
}
