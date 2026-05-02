package org.msgpack.template;

import java.io.IOException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/Template.class */
public interface Template<T> {
    void write(Packer packer, T t) throws IOException;

    void write(Packer packer, T t, boolean z) throws IOException;

    T read(Unpacker unpacker, T t) throws IOException;

    T read(Unpacker unpacker, T t, boolean z) throws IOException;
}
