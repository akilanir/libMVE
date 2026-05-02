package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/ByteTemplate.class */
public class ByteTemplate extends AbstractTemplate<Byte> {
    static final ByteTemplate instance = new ByteTemplate();

    private ByteTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Byte target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target.byteValue());
    }

    @Override // org.msgpack.template.Template
    public Byte read(Unpacker u, Byte to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Byte.valueOf(u.readByte());
    }

    public static ByteTemplate getInstance() {
        return instance;
    }
}
