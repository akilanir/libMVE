package org.msgpack.template;

import java.io.IOException;
import java.nio.ByteBuffer;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/ByteBufferTemplate.class */
public class ByteBufferTemplate extends AbstractTemplate<ByteBuffer> {
    static final ByteBufferTemplate instance = new ByteBufferTemplate();

    private ByteBufferTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, ByteBuffer target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target);
    }

    @Override // org.msgpack.template.Template
    public ByteBuffer read(Unpacker u, ByteBuffer to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return u.readByteBuffer();
    }

    public static ByteBufferTemplate getInstance() {
        return instance;
    }
}
