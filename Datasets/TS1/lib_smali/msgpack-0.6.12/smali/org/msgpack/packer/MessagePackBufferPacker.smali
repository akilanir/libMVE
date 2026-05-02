.class public Lorg/msgpack/packer/MessagePackBufferPacker;
.super Lorg/msgpack/packer/MessagePackPacker;
.source "MessagePackBufferPacker.java"

# interfaces
.implements Lorg/msgpack/packer/BufferPacker;


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x200


# direct methods
.method public constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 3
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 27
    const/16 v0, 0x200

    invoke-direct {p0, p1, v0}, Lorg/msgpack/packer/MessagePackBufferPacker;-><init>(Lorg/msgpack/MessagePack;I)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;I)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "bufferSize"    # I

    .prologue
    .line 31
    new-instance v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-direct {v0, p2}, Lorg/msgpack/io/LinkedBufferOutput;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/packer/MessagePackPacker;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Output;)V

    .line 32
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lorg/msgpack/packer/MessagePackBufferPacker;->reset()V

    .line 44
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackBufferPacker;->out:Lorg/msgpack/io/Output;

    check-cast v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferOutput;->clear()V

    .line 45
    return-void
.end method

.method public getBufferSize()I
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackBufferPacker;->out:Lorg/msgpack/io/Output;

    check-cast v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferOutput;->getSize()I

    move-result v0

    return v0
.end method

.method public toByteArray()[B
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/msgpack/packer/MessagePackBufferPacker;->out:Lorg/msgpack/io/Output;

    check-cast v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferOutput;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method
