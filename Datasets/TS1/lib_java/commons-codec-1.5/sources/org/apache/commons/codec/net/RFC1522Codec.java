package org.apache.commons.codec.net;

import java.io.UnsupportedEncodingException;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.binary.StringUtils;

/* loaded from: commons-codec-1.5.jar:org/apache/commons/codec/net/RFC1522Codec.class */
abstract class RFC1522Codec {
    protected static final char SEP = '?';
    protected static final String POSTFIX = "?=";
    protected static final String PREFIX = "=?";

    protected abstract String getEncoding();

    protected abstract byte[] doEncoding(byte[] bArr) throws EncoderException;

    protected abstract byte[] doDecoding(byte[] bArr) throws DecoderException;

    RFC1522Codec() {
    }

    protected String encodeText(String text, String charset) throws EncoderException, UnsupportedEncodingException {
        if (text == null) {
            return null;
        }
        StringBuffer buffer = new StringBuffer();
        buffer.append(PREFIX);
        buffer.append(charset);
        buffer.append('?');
        buffer.append(getEncoding());
        buffer.append('?');
        byte[] rawdata = doEncoding(text.getBytes(charset));
        buffer.append(StringUtils.newStringUsAscii(rawdata));
        buffer.append(POSTFIX);
        return buffer.toString();
    }

    protected String decodeText(String text) throws DecoderException, UnsupportedEncodingException {
        if (text == null) {
            return null;
        }
        if (!text.startsWith(PREFIX) || !text.endsWith(POSTFIX)) {
            throw new DecoderException("RFC 1522 violation: malformed encoded content");
        }
        int terminator = text.length() - 2;
        int to = text.indexOf(SEP, 2);
        if (to == terminator) {
            throw new DecoderException("RFC 1522 violation: charset token not found");
        }
        String charset = text.substring(2, to);
        if (charset.equals("")) {
            throw new DecoderException("RFC 1522 violation: charset not specified");
        }
        int from = to + 1;
        int to2 = text.indexOf(SEP, from);
        if (to2 == terminator) {
            throw new DecoderException("RFC 1522 violation: encoding token not found");
        }
        String encoding = text.substring(from, to2);
        if (!getEncoding().equalsIgnoreCase(encoding)) {
            throw new DecoderException(new StringBuffer().append("This codec cannot decode ").append(encoding).append(" encoded content").toString());
        }
        int from2 = to2 + 1;
        byte[] data = StringUtils.getBytesUsAscii(text.substring(from2, text.indexOf(SEP, from2)));
        return new String(doDecoding(data), charset);
    }
}
