package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/StringTemplate.class */
public class StringTemplate extends AbstractTemplate<String> {
    static final StringTemplate instance = new StringTemplate();

    private StringTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, String target, boolean required) throws IOException {
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
    public String read(Unpacker u, String to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return u.readString();
    }

    public static StringTemplate getInstance() {
        return instance;
    }
}
