package org.msgpack;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Type;
import java.nio.ByteBuffer;
import org.msgpack.packer.BufferPacker;
import org.msgpack.packer.MessagePackBufferPacker;
import org.msgpack.packer.MessagePackPacker;
import org.msgpack.packer.Packer;
import org.msgpack.packer.Unconverter;
import org.msgpack.template.Template;
import org.msgpack.template.TemplateRegistry;
import org.msgpack.type.Value;
import org.msgpack.unpacker.BufferUnpacker;
import org.msgpack.unpacker.Converter;
import org.msgpack.unpacker.MessagePackBufferUnpacker;
import org.msgpack.unpacker.MessagePackUnpacker;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/MessagePack.class */
public class MessagePack {
    private TemplateRegistry registry;
    private static final MessagePack globalMessagePack = new MessagePack();

    public MessagePack() {
        this.registry = new TemplateRegistry(null);
    }

    public MessagePack(MessagePack msgpack) {
        this.registry = new TemplateRegistry(msgpack.registry);
    }

    protected MessagePack(TemplateRegistry registry) {
        this.registry = registry;
    }

    public void setClassLoader(ClassLoader cl) {
        this.registry.setClassLoader(cl);
    }

    public Packer createPacker(OutputStream out) {
        return new MessagePackPacker(this, out);
    }

    public BufferPacker createBufferPacker() {
        return new MessagePackBufferPacker(this);
    }

    public BufferPacker createBufferPacker(int bufferSize) {
        return new MessagePackBufferPacker(this, bufferSize);
    }

    public Unpacker createUnpacker(InputStream in) {
        return new MessagePackUnpacker(this, in);
    }

    public BufferUnpacker createBufferUnpacker() {
        return new MessagePackBufferUnpacker(this);
    }

    public BufferUnpacker createBufferUnpacker(byte[] bytes) {
        return createBufferUnpacker().wrap(bytes);
    }

    public BufferUnpacker createBufferUnpacker(byte[] bytes, int off, int len) {
        return createBufferUnpacker().wrap(bytes, off, len);
    }

    public BufferUnpacker createBufferUnpacker(ByteBuffer buffer) {
        return createBufferUnpacker().wrap(buffer);
    }

    public <T> byte[] write(T v) throws IOException {
        BufferPacker pk = createBufferPacker();
        if (v == null) {
            pk.writeNil();
        } else {
            Template<T> tmpl = this.registry.lookup(v.getClass());
            tmpl.write(pk, v);
        }
        return pk.toByteArray();
    }

    public <T> byte[] write(T v, Template<T> template) throws IOException {
        BufferPacker pk = createBufferPacker();
        template.write(pk, v);
        return pk.toByteArray();
    }

    public <T> void write(OutputStream out, T v) throws IOException {
        Packer pk = createPacker(out);
        if (v == null) {
            pk.writeNil();
        } else {
            Template<T> tmpl = this.registry.lookup(v.getClass());
            tmpl.write(pk, v);
        }
    }

    public <T> void write(OutputStream out, T v, Template<T> template) throws IOException {
        Packer pk = createPacker(out);
        template.write(pk, v);
    }

    public byte[] write(Value v) throws IOException {
        BufferPacker pk = createBufferPacker();
        pk.write(v);
        return pk.toByteArray();
    }

    public Value read(byte[] bytes) throws IOException {
        return read(bytes, 0, bytes.length);
    }

    public Value read(byte[] bytes, int off, int len) throws IOException {
        return createBufferUnpacker(bytes, off, len).readValue();
    }

    public Value read(ByteBuffer buffer) throws IOException {
        return createBufferUnpacker(buffer).readValue();
    }

    public Value read(InputStream in) throws IOException {
        return createUnpacker(in).readValue();
    }

    public <T> T read(byte[] bArr, T t) throws IOException {
        return (T) read(bArr, (byte[]) t, (Template<byte[]>) this.registry.lookup(t.getClass()));
    }

    public <T> T read(byte[] bArr, Template<T> template) throws IOException {
        return (T) read(bArr, (byte[]) null, (Template<byte[]>) template);
    }

    public <T> T read(byte[] bArr, Class<T> cls) throws IOException {
        return (T) read(bArr, (byte[]) null, (Template<byte[]>) this.registry.lookup(cls));
    }

    public <T> T read(byte[] bytes, T v, Template<T> tmpl) throws IOException {
        BufferUnpacker u = createBufferUnpacker(bytes);
        return tmpl.read(u, v);
    }

    public <T> T read(byte[] bytes, int off, int len, Class<T> c) throws IOException {
        Template<T> tmpl = this.registry.lookup(c);
        BufferUnpacker u = createBufferUnpacker(bytes, off, len);
        return tmpl.read(u, null);
    }

    public <T> T read(ByteBuffer byteBuffer, T t) throws IOException {
        return (T) read(byteBuffer, (ByteBuffer) t, (Template<ByteBuffer>) this.registry.lookup(t.getClass()));
    }

    public <T> T read(ByteBuffer byteBuffer, Template<T> template) throws IOException {
        return (T) read(byteBuffer, (ByteBuffer) null, (Template<ByteBuffer>) template);
    }

    public <T> T read(ByteBuffer byteBuffer, Class<T> cls) throws IOException {
        return (T) read(byteBuffer, (ByteBuffer) null, (Template<ByteBuffer>) this.registry.lookup(cls));
    }

    public <T> T read(ByteBuffer b, T v, Template<T> tmpl) throws IOException {
        BufferUnpacker u = createBufferUnpacker(b);
        return tmpl.read(u, v);
    }

    public <T> T read(InputStream inputStream, T t) throws IOException {
        return (T) read(inputStream, (InputStream) t, (Template<InputStream>) this.registry.lookup(t.getClass()));
    }

    public <T> T read(InputStream inputStream, Template<T> template) throws IOException {
        return (T) read(inputStream, (InputStream) null, (Template<InputStream>) template);
    }

    public <T> T read(InputStream inputStream, Class<T> cls) throws IOException {
        return (T) read(inputStream, (InputStream) null, (Template<InputStream>) this.registry.lookup(cls));
    }

    public <T> T read(InputStream in, T v, Template<T> tmpl) throws IOException {
        Unpacker u = createUnpacker(in);
        return tmpl.read(u, v);
    }

    public <T> T convert(Value v, T to) throws IOException {
        Template<T> tmpl = this.registry.lookup(to.getClass());
        return tmpl.read(new Converter(this, v), to);
    }

    public <T> T convert(Value v, Class<T> c) throws IOException {
        Template<T> tmpl = this.registry.lookup(c);
        return tmpl.read(new Converter(this, v), null);
    }

    public <T> T convert(Value v, Template<T> tmpl) throws IOException {
        return tmpl.read(new Converter(this, v), null);
    }

    public <T> Value unconvert(T v) throws IOException {
        Unconverter pk = new Unconverter(this);
        if (v == null) {
            pk.writeNil();
        } else {
            Template<T> tmpl = this.registry.lookup(v.getClass());
            tmpl.write(pk, v);
        }
        return pk.getResult();
    }

    public void register(Class<?> type) {
        this.registry.register(type);
    }

    public <T> void register(Class<T> type, Template<T> template) {
        this.registry.register(type, template);
    }

    public boolean unregister(Class<?> type) {
        return this.registry.unregister(type);
    }

    public void unregister() {
        this.registry.unregister();
    }

    public <T> Template<T> lookup(Class<T> type) {
        return this.registry.lookup(type);
    }

    public Template<?> lookup(Type type) {
        return this.registry.lookup(type);
    }

    @Deprecated
    public static byte[] pack(Object v) throws IOException {
        return globalMessagePack.write((MessagePack) v);
    }

    @Deprecated
    public static void pack(OutputStream out, Object v) throws IOException {
        globalMessagePack.write(out, (OutputStream) v);
    }

    @Deprecated
    public static <T> byte[] pack(T v, Template<T> template) throws IOException {
        return globalMessagePack.write((MessagePack) v, (Template<MessagePack>) template);
    }

    @Deprecated
    public static <T> void pack(OutputStream out, T v, Template<T> template) throws IOException {
        globalMessagePack.write(out, v, template);
    }

    @Deprecated
    public static Value unpack(byte[] bytes) throws IOException {
        return globalMessagePack.read(bytes);
    }

    @Deprecated
    public static <T> T unpack(byte[] bytes, Template<T> template) throws IOException {
        BufferUnpacker u = new MessagePackBufferUnpacker(globalMessagePack).wrap(bytes);
        return template.read(u, null);
    }

    @Deprecated
    public static <T> T unpack(byte[] bytes, Template<T> template, T to) throws IOException {
        BufferUnpacker u = new MessagePackBufferUnpacker(globalMessagePack).wrap(bytes);
        return template.read(u, to);
    }

    @Deprecated
    public static <T> T unpack(byte[] bArr, Class<T> cls) throws IOException {
        return (T) globalMessagePack.read(bArr, (Class) cls);
    }

    @Deprecated
    public static <T> T unpack(byte[] bArr, T t) throws IOException {
        return (T) globalMessagePack.read(bArr, (byte[]) t);
    }

    @Deprecated
    public static Value unpack(InputStream in) throws IOException {
        return globalMessagePack.read(in);
    }

    @Deprecated
    public static <T> T unpack(InputStream in, Template<T> tmpl) throws IOException, MessageTypeException {
        return tmpl.read(new MessagePackUnpacker(globalMessagePack, in), null);
    }

    @Deprecated
    public static <T> T unpack(InputStream in, Template<T> tmpl, T to) throws IOException, MessageTypeException {
        return tmpl.read(new MessagePackUnpacker(globalMessagePack, in), to);
    }

    @Deprecated
    public static <T> T unpack(InputStream inputStream, Class<T> cls) throws IOException {
        return (T) globalMessagePack.read(inputStream, (Class) cls);
    }

    @Deprecated
    public static <T> T unpack(InputStream inputStream, T t) throws IOException {
        return (T) globalMessagePack.read(inputStream, (InputStream) t);
    }
}
