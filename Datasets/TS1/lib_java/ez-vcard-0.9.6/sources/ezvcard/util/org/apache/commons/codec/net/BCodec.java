package ezvcard.util.org.apache.commons.codec.net;

import ezvcard.util.org.apache.commons.codec.DecoderException;
import ezvcard.util.org.apache.commons.codec.EncoderException;
import ezvcard.util.org.apache.commons.codec.StringDecoder;
import ezvcard.util.org.apache.commons.codec.StringEncoder;
import ezvcard.util.org.apache.commons.codec.binary.Base64;
import java.io.UnsupportedEncodingException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/org/apache/commons/codec/net/BCodec.class */
public class BCodec extends RFC1522Codec implements StringEncoder, StringDecoder {
    private final String charset;

    public BCodec() {
        this("UTF-8");
    }

    public BCodec(String charset) {
        this.charset = charset;
    }

    @Override // ezvcard.util.org.apache.commons.codec.net.RFC1522Codec
    protected String getEncoding() {
        return "B";
    }

    @Override // ezvcard.util.org.apache.commons.codec.net.RFC1522Codec
    protected byte[] doEncoding(byte[] bytes) {
        if (bytes == null) {
            return null;
        }
        return Base64.encodeBase64(bytes);
    }

    @Override // ezvcard.util.org.apache.commons.codec.net.RFC1522Codec
    protected byte[] doDecoding(byte[] bytes) {
        if (bytes == null) {
            return null;
        }
        return Base64.decodeBase64(bytes);
    }

    public String encode(String value, String charset) throws EncoderException {
        if (value == null) {
            return null;
        }
        try {
            return encodeText(value, charset);
        } catch (UnsupportedEncodingException e) {
            throw new EncoderException(e.getMessage(), e);
        }
    }

    @Override // ezvcard.util.org.apache.commons.codec.StringEncoder
    public String encode(String value) throws EncoderException {
        if (value == null) {
            return null;
        }
        return encode(value, getDefaultCharset());
    }

    @Override // ezvcard.util.org.apache.commons.codec.StringDecoder
    public String decode(String value) throws DecoderException {
        if (value == null) {
            return null;
        }
        try {
            return decodeText(value);
        } catch (UnsupportedEncodingException e) {
            throw new DecoderException(e.getMessage(), e);
        }
    }

    @Override // ezvcard.util.org.apache.commons.codec.Encoder
    public Object encode(Object value) throws EncoderException {
        if (value == null) {
            return null;
        }
        if (value instanceof String) {
            return encode((String) value);
        }
        throw new EncoderException("Objects of type " + value.getClass().getName() + " cannot be encoded using BCodec");
    }

    @Override // ezvcard.util.org.apache.commons.codec.Decoder
    public Object decode(Object value) throws DecoderException {
        if (value == null) {
            return null;
        }
        if (value instanceof String) {
            return decode((String) value);
        }
        throw new DecoderException("Objects of type " + value.getClass().getName() + " cannot be decoded using BCodec");
    }

    public String getDefaultCharset() {
        return this.charset;
    }
}
