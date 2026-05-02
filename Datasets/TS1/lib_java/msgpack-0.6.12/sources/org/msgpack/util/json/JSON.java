package org.msgpack.util.json;

import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import org.msgpack.MessagePack;
import org.msgpack.packer.BufferPacker;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.BufferUnpacker;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/json/JSON.class */
public class JSON extends MessagePack {
    public JSON() {
    }

    public JSON(MessagePack msgpack) {
        super(msgpack);
    }

    @Override // org.msgpack.MessagePack
    public Packer createPacker(OutputStream stream) {
        return new JSONPacker(this, stream);
    }

    @Override // org.msgpack.MessagePack
    public BufferPacker createBufferPacker() {
        return new JSONBufferPacker(this);
    }

    @Override // org.msgpack.MessagePack
    public BufferPacker createBufferPacker(int bufferSize) {
        return new JSONBufferPacker(this, bufferSize);
    }

    @Override // org.msgpack.MessagePack
    public Unpacker createUnpacker(InputStream stream) {
        return new JSONUnpacker(this, stream);
    }

    @Override // org.msgpack.MessagePack
    public BufferUnpacker createBufferUnpacker() {
        return new JSONBufferUnpacker();
    }

    @Override // org.msgpack.MessagePack
    public BufferUnpacker createBufferUnpacker(byte[] b) {
        return createBufferUnpacker().wrap(b);
    }

    @Override // org.msgpack.MessagePack
    public BufferUnpacker createBufferUnpacker(byte[] b, int off, int len) {
        return createBufferUnpacker().wrap(b, off, len);
    }

    @Override // org.msgpack.MessagePack
    public BufferUnpacker createBufferUnpacker(ByteBuffer bb) {
        return createBufferUnpacker().wrap(bb);
    }
}
