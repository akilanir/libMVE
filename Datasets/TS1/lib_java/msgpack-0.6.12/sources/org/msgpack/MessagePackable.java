package org.msgpack;

import java.io.IOException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/MessagePackable.class */
public interface MessagePackable {
    void writeTo(Packer packer) throws IOException;

    void readFrom(Unpacker unpacker) throws IOException;
}
