package org.apache.james.mime4j.stream;

import java.util.BitSet;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.io.MaxHeaderLengthLimitException;
import org.apache.james.mime4j.util.ByteArrayBuffer;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/DefaultFieldBuilder.class */
public class DefaultFieldBuilder implements FieldBuilder {
    private static final BitSet FIELD_CHARS = new BitSet();
    private final ByteArrayBuffer buf = new ByteArrayBuffer(1024);
    private final int maxlen;

    static {
        for (int i = 33; i <= 57; i++) {
            FIELD_CHARS.set(i);
        }
        for (int i2 = 59; i2 <= 126; i2++) {
            FIELD_CHARS.set(i2);
        }
    }

    public DefaultFieldBuilder(int maxlen) {
        this.maxlen = maxlen;
    }

    @Override // org.apache.james.mime4j.stream.FieldBuilder
    public void reset() {
        this.buf.clear();
    }

    @Override // org.apache.james.mime4j.stream.FieldBuilder
    public void append(ByteArrayBuffer line) throws MaxHeaderLengthLimitException {
        if (line == null) {
            return;
        }
        int len = line.length();
        if (this.maxlen > 0 && this.buf.length() + len >= this.maxlen) {
            throw new MaxHeaderLengthLimitException("Maximum header length limit exceeded");
        }
        this.buf.append(line.buffer(), 0, line.length());
    }

    @Override // org.apache.james.mime4j.stream.FieldBuilder
    public RawField build() throws MimeException {
        int len = this.buf.length();
        if (len > 0) {
            if (this.buf.byteAt(len - 1) == 10) {
                len--;
            }
            if (this.buf.byteAt(len - 1) == 13) {
                len--;
            }
        }
        ByteArrayBuffer copy = new ByteArrayBuffer(this.buf.buffer(), len, false);
        RawField field = RawFieldParser.DEFAULT.parseField(copy);
        String name = field.getName();
        for (int i = 0; i < name.length(); i++) {
            char ch = name.charAt(i);
            if (!FIELD_CHARS.get(ch)) {
                throw new MimeException("MIME field name contains illegal characters: " + field.getName());
            }
        }
        return field;
    }

    @Override // org.apache.james.mime4j.stream.FieldBuilder
    public ByteArrayBuffer getRaw() {
        return this.buf;
    }
}
