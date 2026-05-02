.class public Lorg/msgpack/util/json/JSON;
.super Lorg/msgpack/MessagePack;
.source "JSON.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/msgpack/MessagePack;-><init>()V

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 2
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/msgpack/MessagePack;-><init>(Lorg/msgpack/MessagePack;)V

    .line 36
    return-void
.end method


# virtual methods
.method public createBufferPacker()Lorg/msgpack/packer/BufferPacker;
    .registers 2

    .prologue
    .line 45
    new-instance v0, Lorg/msgpack/util/json/JSONBufferPacker;

    invoke-direct {v0, p0}, Lorg/msgpack/util/json/JSONBufferPacker;-><init>(Lorg/msgpack/MessagePack;)V

    return-object v0
.end method

.method public createBufferPacker(I)Lorg/msgpack/packer/BufferPacker;
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 50
    new-instance v0, Lorg/msgpack/util/json/JSONBufferPacker;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/util/json/JSONBufferPacker;-><init>(Lorg/msgpack/MessagePack;I)V

    return-object v0
.end method

.method public createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 2

    .prologue
    .line 60
    new-instance v0, Lorg/msgpack/util/json/JSONBufferUnpacker;

    invoke-direct {v0}, Lorg/msgpack/util/json/JSONBufferUnpacker;-><init>()V

    return-object v0
.end method

.method public createBufferUnpacker(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/msgpack/util/json/JSON;->createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/msgpack/unpacker/BufferUnpacker;->wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public createBufferUnpacker([B)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "b"    # [B

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/msgpack/util/json/JSON;->createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/msgpack/unpacker/BufferUnpacker;->wrap([B)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public createBufferUnpacker([BII)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/msgpack/util/json/JSON;->createBufferUnpacker()Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/msgpack/unpacker/BufferUnpacker;->wrap([BII)Lorg/msgpack/unpacker/BufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public createPacker(Ljava/io/OutputStream;)Lorg/msgpack/packer/Packer;
    .registers 3
    .param p1, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 40
    new-instance v0, Lorg/msgpack/util/json/JSONPacker;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/util/json/JSONPacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/OutputStream;)V

    return-object v0
.end method

.method public createUnpacker(Ljava/io/InputStream;)Lorg/msgpack/unpacker/Unpacker;
    .registers 3
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 55
    new-instance v0, Lorg/msgpack/util/json/JSONUnpacker;

    invoke-direct {v0, p0, p1}, Lorg/msgpack/util/json/JSONUnpacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;)V

    return-object v0
.end method
