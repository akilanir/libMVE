package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/ByteArrayTemplate.class */
public class ByteArrayTemplate extends AbstractTemplate<byte[]> {
    static final ByteArrayTemplate instance = new ByteArrayTemplate();

    private ByteArrayTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, byte[] target, boolean required) throws IOException {
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
    public byte[] read(Unpacker u, byte[] to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return u.readByteArray();
    }

    public static ByteArrayTemplate getInstance() {
        return instance;
    }
}
