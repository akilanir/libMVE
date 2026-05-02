package org.msgpack.type;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.util.Arrays;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/ByteArrayRawValueImpl.class */
class ByteArrayRawValueImpl extends AbstractRawValue {
    private static ByteArrayRawValueImpl emptyInstance = new ByteArrayRawValueImpl(new byte[0], true);
    private static final ThreadLocal<CharsetDecoder> decoderStore = new ThreadLocal<CharsetDecoder>() { // from class: org.msgpack.type.ByteArrayRawValueImpl.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public CharsetDecoder initialValue() {
            return Charset.forName("UTF-8").newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT);
        }
    };
    private byte[] bytes;

    public static RawValue getEmptyInstance() {
        return emptyInstance;
    }

    ByteArrayRawValueImpl(byte[] bytes, boolean gift) {
        if (gift) {
            this.bytes = bytes;
        } else {
            this.bytes = new byte[bytes.length];
            System.arraycopy(bytes, 0, this.bytes, 0, bytes.length);
        }
    }

    ByteArrayRawValueImpl(byte[] b, int off, int len) {
        this.bytes = new byte[len];
        System.arraycopy(b, off, this.bytes, 0, len);
    }

    @Override // org.msgpack.type.RawValue
    public byte[] getByteArray() {
        return this.bytes;
    }

    @Override // org.msgpack.type.RawValue
    public String getString() {
        CharsetDecoder decoder = decoderStore.get();
        try {
            return decoder.decode(ByteBuffer.wrap(this.bytes)).toString();
        } catch (CharacterCodingException ex) {
            throw new MessageTypeException(ex);
        }
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.write(this.bytes);
    }

    @Override // org.msgpack.type.AbstractRawValue
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
        return Arrays.equals(this.bytes, v.asRawValue().getByteArray());
    }

    @Override // org.msgpack.type.AbstractRawValue
    public int hashCode() {
        return Arrays.hashCode(this.bytes);
    }
}
