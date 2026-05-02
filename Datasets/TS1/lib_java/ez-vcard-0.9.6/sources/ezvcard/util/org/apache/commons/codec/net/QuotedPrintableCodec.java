package ezvcard.util.org.apache.commons.codec.net;

import ezvcard.util.org.apache.commons.codec.BinaryDecoder;
import ezvcard.util.org.apache.commons.codec.BinaryEncoder;
import ezvcard.util.org.apache.commons.codec.DecoderException;
import ezvcard.util.org.apache.commons.codec.EncoderException;
import ezvcard.util.org.apache.commons.codec.StringDecoder;
import ezvcard.util.org.apache.commons.codec.StringEncoder;
import ezvcard.util.org.apache.commons.codec.binary.StringUtils;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.BitSet;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec.class */
public class QuotedPrintableCodec implements BinaryEncoder, BinaryDecoder, StringEncoder, StringDecoder {
    private final String charset;
    private static final BitSet PRINTABLE_CHARS = new BitSet(256);
    private static final byte ESCAPE_CHAR = 61;
    private static final byte TAB = 9;
    private static final byte SPACE = 32;

    static {
        for (int i = 33; i <= 60; i++) {
            PRINTABLE_CHARS.set(i);
        }
        for (int i2 = 62; i2 <= 126; i2++) {
            PRINTABLE_CHARS.set(i2);
        }
        PRINTABLE_CHARS.set(TAB);
        PRINTABLE_CHARS.set(SPACE);
    }

    public QuotedPrintableCodec() {
        this("UTF-8");
    }

    public QuotedPrintableCodec(String charset) {
        this.charset = charset;
    }

    private static final void encodeQuotedPrintable(int b, ByteArrayOutputStream buffer) {
        buffer.write(ESCAPE_CHAR);
        char hex1 = Character.toUpperCase(Character.forDigit((b >> 4) & 15, 16));
        char hex2 = Character.toUpperCase(Character.forDigit(b & 15, 16));
        buffer.write(hex1);
        buffer.write(hex2);
    }

    public static final byte[] encodeQuotedPrintable(BitSet printable, byte[] bytes) {
        if (bytes == null) {
            return null;
        }
        if (printable == null) {
            printable = PRINTABLE_CHARS;
        }
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        for (byte c : bytes) {
            int b = c;
            if (b < 0) {
                b = 256 + b;
            }
            if (printable.get(b)) {
                buffer.write(b);
            } else {
                encodeQuotedPrintable(b, buffer);
            }
        }
        return buffer.toByteArray();
    }

    public static final byte[] decodeQuotedPrintable(byte[] bytes) throws DecoderException {
        if (bytes == null) {
            return null;
        }
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int i = 0;
        while (i < bytes.length) {
            byte b = bytes[i];
            if (b == ESCAPE_CHAR) {
                try {
                    int i2 = i + 1;
                    int u = Utils.digit16(bytes[i2]);
                    i = i2 + 1;
                    int l = Utils.digit16(bytes[i]);
                    buffer.write((char) ((u << 4) + l));
                } catch (ArrayIndexOutOfBoundsException e) {
                    throw new DecoderException("Invalid quoted-printable encoding", e);
                }
            } else {
                buffer.write(b);
            }
            i++;
        }
        return buffer.toByteArray();
    }

    @Override // ezvcard.util.org.apache.commons.codec.BinaryEncoder
    public byte[] encode(byte[] bytes) {
        return encodeQuotedPrintable(PRINTABLE_CHARS, bytes);
    }

    @Override // ezvcard.util.org.apache.commons.codec.BinaryDecoder
    public byte[] decode(byte[] bytes) throws DecoderException {
        return decodeQuotedPrintable(bytes);
    }

    @Override // ezvcard.util.org.apache.commons.codec.StringEncoder
    public String encode(String pString) throws EncoderException {
        if (pString == null) {
            return null;
        }
        try {
            return encode(pString, getDefaultCharset());
        } catch (UnsupportedEncodingException e) {
            throw new EncoderException(e.getMessage(), e);
        }
    }

    public String decode(String pString, String charset) throws DecoderException, UnsupportedEncodingException {
        if (pString == null) {
            return null;
        }
        return new String(decode(StringUtils.getBytesUsAscii(pString)), charset);
    }

    @Override // ezvcard.util.org.apache.commons.codec.StringDecoder
    public String decode(String pString) throws DecoderException {
        if (pString == null) {
            return null;
        }
        try {
            return decode(pString, getDefaultCharset());
        } catch (UnsupportedEncodingException e) {
            throw new DecoderException(e.getMessage(), e);
        }
    }

    @Override // ezvcard.util.org.apache.commons.codec.Encoder
    public Object encode(Object pObject) throws EncoderException {
        if (pObject == null) {
            return null;
        }
        if (pObject instanceof byte[]) {
            return encode((byte[]) pObject);
        }
        if (pObject instanceof String) {
            return encode((String) pObject);
        }
        throw new EncoderException("Objects of type " + pObject.getClass().getName() + " cannot be quoted-printable encoded");
    }

    @Override // ezvcard.util.org.apache.commons.codec.Decoder
    public Object decode(Object pObject) throws DecoderException {
        if (pObject == null) {
            return null;
        }
        if (pObject instanceof byte[]) {
            return decode((byte[]) pObject);
        }
        if (pObject instanceof String) {
            return decode((String) pObject);
        }
        throw new DecoderException("Objects of type " + pObject.getClass().getName() + " cannot be quoted-printable decoded");
    }

    public String getDefaultCharset() {
        return this.charset;
    }

    public String encode(String pString, String charset) throws UnsupportedEncodingException {
        if (pString == null) {
            return null;
        }
        return StringUtils.newStringUsAscii(encode(pString.getBytes(charset)));
    }
}
