package org.msgpack.unpacker;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import org.msgpack.MessageTypeException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/StringAccept.class */
final class StringAccept extends Accept {
    String value;
    private CharsetDecoder decoder;

    public StringAccept() {
        super("raw value");
        this.decoder = Charset.forName("UTF-8").newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptRaw(byte[] raw) {
        try {
            this.value = this.decoder.decode(ByteBuffer.wrap(raw)).toString();
        } catch (CharacterCodingException ex) {
            throw new MessageTypeException(ex);
        }
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptEmptyRaw() {
        this.value = "";
    }

    @Override // org.msgpack.unpacker.Accept, org.msgpack.io.BufferReferer
    public void refer(ByteBuffer bb, boolean gift) throws IOException {
        try {
            this.value = this.decoder.decode(bb).toString();
        } catch (CharacterCodingException ex) {
            throw new MessageTypeException(ex);
        }
    }
}
