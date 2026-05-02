.class public Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
.super Lorg/msgpack/unpacker/MessagePackUnpacker;
.source "MessagePackBufferUnpacker.java"

# interfaces
.implements Lorg/msgpack/unpacker/BufferUnpacker;


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x200


# direct methods
.method public constructor <init>(Lorg/msgpack/MessagePack;)V
    .registers 3
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;

    .prologue
    .line 30
    const/16 v0, 0x200

    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;-><init>(Lorg/msgpack/MessagePack;I)V

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;I)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "bufferSize"    # I

    .prologue
    .line 34
    new-instance v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-direct {v0, p2}, Lorg/msgpack/io/LinkedBufferInput;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Input;)V

    .line 35
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferInput;->clear()V

    .line 105
    invoke-virtual {p0}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->reset()V

    .line 106
    return-void
.end method

.method public copyReferencedBuffer()V
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferInput;->copyReferencedBuffer()V

    .line 100
    return-void
.end method

.method public bridge synthetic feed(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->feed(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed(Ljava/nio/ByteBuffer;Z)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 4
    .param p1, "x0"    # Ljava/nio/ByteBuffer;
    .param p2, "x1"    # Z

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->feed(Ljava/nio/ByteBuffer;Z)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([B)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # [B

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->feed([B)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([BII)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 5
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->feed([BII)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([BIIZ)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 6
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Z

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->feed([BIIZ)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic feed([BZ)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 4
    .param p1, "x0"    # [B
    .param p2, "x1"    # Z

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->feed([BZ)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public feed(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 3
    .param p1, "b"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0, p1}, Lorg/msgpack/io/LinkedBufferInput;->feed(Ljava/nio/ByteBuffer;)V

    .line 83
    return-object p0
.end method

.method public feed(Ljava/nio/ByteBuffer;Z)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 4
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
    .param p2, "reference"    # Z

    .prologue
    .line 88
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0, p1, p2}, Lorg/msgpack/io/LinkedBufferInput;->feed(Ljava/nio/ByteBuffer;Z)V

    .line 89
    return-object p0
.end method

.method public feed([B)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 3
    .param p1, "b"    # [B

    .prologue
    .line 58
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0, p1}, Lorg/msgpack/io/LinkedBufferInput;->feed([B)V

    .line 59
    return-object p0
.end method

.method public feed([BII)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 70
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0, p1, p2, p3}, Lorg/msgpack/io/LinkedBufferInput;->feed([BII)V

    .line 71
    return-object p0
.end method

.method public feed([BIIZ)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "reference"    # Z

    .prologue
    .line 76
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/msgpack/io/LinkedBufferInput;->feed([BIIZ)V

    .line 77
    return-object p0
.end method

.method public feed([BZ)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 4
    .param p1, "b"    # [B
    .param p2, "reference"    # Z

    .prologue
    .line 64
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0, p1, p2}, Lorg/msgpack/io/LinkedBufferInput;->feed([BZ)V

    .line 65
    return-object p0
.end method

.method public getBufferSize()I
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferInput;->getSize()I

    move-result v0

    return v0
.end method

.method public bridge synthetic wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic wrap([B)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 3
    .param p1, "x0"    # [B

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->wrap([B)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic wrap([BII)Lorg/msgpack/unpacker/BufferUnpacker;
    .registers 5
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->wrap([BII)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public wrap(Ljava/nio/ByteBuffer;)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 4
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 51
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferInput;->clear()V

    .line 52
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lorg/msgpack/io/LinkedBufferInput;->feed(Ljava/nio/ByteBuffer;Z)V

    .line 53
    return-object p0
.end method

.method public wrap([B)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 4
    .param p1, "b"    # [B

    .prologue
    .line 39
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->wrap([BII)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;

    move-result-object v0

    return-object v0
.end method

.method public wrap([BII)Lorg/msgpack/unpacker/MessagePackBufferUnpacker;
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 44
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    invoke-virtual {v0}, Lorg/msgpack/io/LinkedBufferInput;->clear()V

    .line 45
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackBufferUnpacker;->in:Lorg/msgpack/io/Input;

    check-cast v0, Lorg/msgpack/io/LinkedBufferInput;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, p3, v1}, Lorg/msgpack/io/LinkedBufferInput;->feed([BIIZ)V

    .line 46
    return-object p0
.end method
