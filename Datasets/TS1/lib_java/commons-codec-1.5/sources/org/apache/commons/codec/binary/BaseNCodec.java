package org.apache.commons.codec.binary;

import org.apache.commons.codec.BinaryDecoder;
import org.apache.commons.codec.BinaryEncoder;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.EncoderException;

/* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/binary/BaseNCodec.class */
public abstract class BaseNCodec implements BinaryEncoder, BinaryDecoder {
    public static final int MIME_CHUNK_SIZE = 76;
    public static final int PEM_CHUNK_SIZE = 64;
    private static final int DEFAULT_BUFFER_RESIZE_FACTOR = 2;
    private static final int DEFAULT_BUFFER_SIZE = 8192;
    protected static final int MASK_8BITS = 255;
    protected static final byte PAD_DEFAULT = 61;
    protected final byte PAD = 61;
    private final int unencodedBlockSize;
    private final int encodedBlockSize;
    protected final int lineLength;
    private final int chunkSeparatorLength;
    protected byte[] buffer;
    protected int pos;
    private int readPos;
    protected boolean eof;
    protected int currentLinePos;
    protected int modulus;

    abstract void encode(byte[] bArr, int i, int i2);

    abstract void decode(byte[] bArr, int i, int i2);

    protected abstract boolean isInAlphabet(byte b);

    protected BaseNCodec(int unencodedBlockSize, int encodedBlockSize, int lineLength, int chunkSeparatorLength) {
        this.unencodedBlockSize = unencodedBlockSize;
        this.encodedBlockSize = encodedBlockSize;
        this.lineLength = (lineLength <= 0 || chunkSeparatorLength <= 0) ? 0 : (lineLength / encodedBlockSize) * encodedBlockSize;
        this.chunkSeparatorLength = chunkSeparatorLength;
    }

    boolean hasData() {
        return this.buffer != null;
    }

    int available() {
        if (this.buffer != null) {
            return this.pos - this.readPos;
        }
        return 0;
    }

    protected int getDefaultBufferSize() {
        return DEFAULT_BUFFER_SIZE;
    }

    private void resizeBuffer() {
        if (this.buffer == null) {
            this.buffer = new byte[getDefaultBufferSize()];
            this.pos = 0;
            this.readPos = 0;
        } else {
            byte[] b = new byte[this.buffer.length * DEFAULT_BUFFER_RESIZE_FACTOR];
            System.arraycopy(this.buffer, 0, b, 0, this.buffer.length);
            this.buffer = b;
        }
    }

    protected void ensureBufferSize(int size) {
        if (this.buffer == null || this.buffer.length < this.pos + size) {
            resizeBuffer();
        }
    }

    int readResults(byte[] b, int bPos, int bAvail) {
        if (this.buffer == null) {
            return this.eof ? -1 : 0;
        }
        int len = Math.min(available(), bAvail);
        System.arraycopy(this.buffer, this.readPos, b, bPos, len);
        this.readPos += len;
        if (this.readPos >= this.pos) {
            this.buffer = null;
        }
        return len;
    }

    protected static boolean isWhiteSpace(byte byteToCheck) {
        switch (byteToCheck) {
            case 9:
            case 10:
            case 13:
            case 32:
                return true;
            default:
                return false;
        }
    }

    private void reset() {
        this.buffer = null;
        this.pos = 0;
        this.readPos = 0;
        this.currentLinePos = 0;
        this.modulus = 0;
        this.eof = false;
    }

    @Override // org.apache.commons.codec.Encoder
    public Object encode(Object pObject) throws EncoderException {
        if (!(pObject instanceof byte[])) {
            throw new EncoderException("Parameter supplied to Base-N encode is not a byte[]");
        }
        return encode((byte[]) pObject);
    }

    public String encodeToString(byte[] pArray) {
        return StringUtils.newStringUtf8(encode(pArray));
    }

    @Override // org.apache.commons.codec.Decoder
    public Object decode(Object pObject) throws DecoderException {
        if (pObject instanceof byte[]) {
            return decode((byte[]) pObject);
        }
        if (pObject instanceof String) {
            return decode((String) pObject);
        }
        throw new DecoderException("Parameter supplied to Base-N decode is not a byte[] or a String");
    }

    public byte[] decode(String pArray) {
        return decode(StringUtils.getBytesUtf8(pArray));
    }

    @Override // org.apache.commons.codec.BinaryDecoder
    public byte[] decode(byte[] pArray) {
        reset();
        if (pArray == null || pArray.length == 0) {
            return pArray;
        }
        decode(pArray, 0, pArray.length);
        decode(pArray, 0, -1);
        byte[] result = new byte[this.pos];
        readResults(result, 0, result.length);
        return result;
    }

    @Override // org.apache.commons.codec.BinaryEncoder
    public byte[] encode(byte[] pArray) {
        reset();
        if (pArray == null || pArray.length == 0) {
            return pArray;
        }
        encode(pArray, 0, pArray.length);
        encode(pArray, 0, -1);
        byte[] buf = new byte[this.pos - this.readPos];
        readResults(buf, 0, buf.length);
        return buf;
    }

    public String encodeAsString(byte[] pArray) {
        return StringUtils.newStringUtf8(encode(pArray));
    }

    public boolean isInAlphabet(byte[] arrayOctet, boolean allowWSPad) {
        for (int i = 0; i < arrayOctet.length; i++) {
            if (!isInAlphabet(arrayOctet[i])) {
                if (!allowWSPad) {
                    return false;
                }
                if (arrayOctet[i] != PAD_DEFAULT && !isWhiteSpace(arrayOctet[i])) {
                    return false;
                }
            }
        }
        return true;
    }

    public boolean isInAlphabet(String basen) {
        return isInAlphabet(StringUtils.getBytesUtf8(basen), true);
    }

    protected boolean containsAlphabetOrPad(byte[] arrayOctet) {
        if (arrayOctet == null) {
            return false;
        }
        for (int i = 0; i < arrayOctet.length; i++) {
            if (PAD_DEFAULT == arrayOctet[i] || isInAlphabet(arrayOctet[i])) {
                return true;
            }
        }
        return false;
    }

    public long getEncodedLength(byte[] pArray) {
        long len = (((pArray.length + this.unencodedBlockSize) - 1) / this.unencodedBlockSize) * this.encodedBlockSize;
        if (this.lineLength > 0) {
            len += (((len + this.lineLength) - 1) / this.lineLength) * this.chunkSeparatorLength;
        }
        return len;
    }
}
