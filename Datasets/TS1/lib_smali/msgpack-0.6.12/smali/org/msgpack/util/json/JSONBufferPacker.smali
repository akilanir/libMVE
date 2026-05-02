.class public Lorg/msgpack/util/json/JSONBufferPacker;
.super Lorg/msgpack/util/json/JSONPacker;
.source "JSONBufferPacker.java"

# interfaces
.implements Lorg/msgpack/packer/BufferPacker;


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x200


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    const/16 v0, 0x200

    invoke-direct {p0, v0}, Lorg/msgpack/util/json/JSONBufferPacker;-><init>(I)V

    .line 29
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 32
    new-instance v0, Lorg/msgpack/MessagePack;

    invoke-direct {v0}, Lorg/msgpack/MessagePack;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/msgpack/util/json/JSONBufferPacker;-><init>(Lorg/msgpack/MessagePack;I)V

    .line 33
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 3
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 36
    const/16 v0, 0x200

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONBufferPacker;-><init>(Lorg/msgpack/MessagePack;I)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;I)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "bufferSize"    # I

    .prologue
    .line 40
    new-instance v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-direct {v0, p2}, Lorg/msgpack/io/LinkedBufferOutput;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONPacker;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Output;)V

    .line 41
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/msgpack/util/json/JSONBufferPacker;->reset()V

    .line 53
    iget-object v0, p0, Lorg/msgpack/util/json/JSONBufferPacker;->out:Lorg/msgpack/io/Output;

    check-cast v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferOutput;->clear()V

    .line 54
    return-void
.end method

.method public getBufferSize()I
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lorg/msgpack/util/json/JSONBufferPacker;->out:Lorg/msgpack/io/Output;

    check-cast v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferOutput;->getSize()I

    move-result v0

    return v0
.end method

.method public toByteArray()[B
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lorg/msgpack/util/json/JSONBufferPacker;->out:Lorg/msgpack/io/Output;

    check-cast v0, Lorg/msgpack/io/LinkedBufferOutput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferOutput;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method
