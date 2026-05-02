package org.msgpack.template;

import java.io.IOException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/AbstractTemplate.class */
public abstract class AbstractTemplate<T> implements Template<T> {
    @Override // org.msgpack.template.Template
    public void write(Packer pk, T v) throws IOException {
        write(pk, v, false);
    }

    @Override // org.msgpack.template.Template
    public T read(Unpacker u, T to) throws IOException {
        return read(u, to, false);
    }
}
