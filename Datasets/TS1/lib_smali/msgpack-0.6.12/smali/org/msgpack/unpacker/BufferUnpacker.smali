.class public interface abstract Lorg/msgpack/unpacker/BufferUnpacker;
.super Ljava/lang/Object;
.source "BufferUnpacker.java"

# interfaces
.implements Lorg/msgpack/unpacker/Unpacker;


# virtual methods
.method public abstract clear()V
.end method

.method public abstract copyReferencedBuffer()V
.end method

.method public abstract feed(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract feed(Ljava/nio/ByteBuffer;Z)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract feed([B)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract feed([BII)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract feed([BIIZ)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract feed([BZ)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract getBufferSize()I
.end method

.method public abstract wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract wrap([B)Lorg/msgpack/unpacker/BufferUnpacker;
.end method

.method public abstract wrap([BII)Lorg/msgpack/unpacker/BufferUnpacker;
.end method
