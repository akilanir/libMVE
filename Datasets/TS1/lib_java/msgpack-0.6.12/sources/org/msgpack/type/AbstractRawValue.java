package org.msgpack.type;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.util.Arrays;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/AbstractRawValue.class */
abstract class AbstractRawValue extends AbstractValue implements RawValue {
    static final String UTF8 = "UTF-8";
    private static final char[] HEX_TABLE = "0123456789ABCDEF".toCharArray();

    AbstractRawValue() {
    }

    @Override // org.msgpack.type.Value
    public ValueType getType() {
        return ValueType.RAW;
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public boolean isRawValue() {
        return true;
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public RawValue asRawValue() {
        return this;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        if (!v.isRawValue()) {
            return false;
        }
        return Arrays.equals(getByteArray(), v.asRawValue().getByteArray());
    }

    public int hashCode() {
        return Arrays.hashCode(getByteArray());
    }

    public String toString() {
        return toString(new StringBuilder()).toString();
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        String s;
        if (getClass() == StringRawValueImpl.class) {
            s = getString();
        } else {
            CharsetDecoder decoder = Charset.forName(UTF8).newDecoder().onMalformedInput(CodingErrorAction.IGNORE).onUnmappableCharacter(CodingErrorAction.IGNORE);
            try {
                s = decoder.decode(ByteBuffer.wrap(getByteArray())).toString();
            } catch (CharacterCodingException e) {
                s = new String(getByteArray());
            }
        }
        sb.append("\"");
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (ch < ' ') {
                switch (ch) {
                    case '\b':
                        sb.append("\\b");
                        break;
                    case '\t':
                        sb.append("\\t");
                        break;
                    case '\n':
                        sb.append("\\n");
                        break;
                    case 11:
                    default:
                        escapeChar(sb, ch);
                        break;
                    case '\f':
                        sb.append("\\f");
                        break;
                    case '\r':
                        sb.append("\\r");
                        break;
                }
            } else if (ch <= 127) {
                switch (ch) {
                    case '\"':
                        sb.append("\\\"");
                        break;
                    case '\\':
                        sb.append("\\\\");
                        break;
                    default:
                        sb.append(ch);
                        break;
                }
            } else if (ch >= 55296 && ch <= 57343) {
                escapeChar(sb, ch);
            } else {
                sb.append(ch);
            }
        }
        sb.append("\"");
        return sb;
    }

    private void escapeChar(StringBuilder sb, int ch) {
        sb.append("\\u");
        sb.append(HEX_TABLE[(ch >> 12) & 15]);
        sb.append(HEX_TABLE[(ch >> 8) & 15]);
        sb.append(HEX_TABLE[(ch >> 4) & 15]);
        sb.append(HEX_TABLE[ch & 15]);
    }
}
