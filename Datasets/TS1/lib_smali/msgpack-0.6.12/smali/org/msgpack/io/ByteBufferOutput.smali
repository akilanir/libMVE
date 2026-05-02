.class public Lorg/msgpack/io/ByteBufferOutput;
.super Ljava/lang/Object;
.source "ByteBufferOutput.java"

# interfaces
.implements Lorg/msgpack/io/Output;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;
    }
.end annotation


# instance fields
.field private buffer:Ljava/nio/ByteBuffer;

.field private callback:Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/io/ByteBufferOutput;-><init>(Ljava/nio/ByteBuffer;Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;)V
    .registers 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "callback"    # Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    .line 38
    iput-object p2, p0, Lorg/msgpack/io/ByteBufferOutput;->callback:Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;

    .line 39
    return-void
.end method

.method private reserve(I)V
    .registers 4
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-gt p1, v0, :cond_9

    .line 49
    :goto_8
    return-void

    .line 45
    :cond_9
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->callback:Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;

    if-nez v0, :cond_13

    .line 46
    new-instance v0, Ljava/nio/BufferOverflowException;

    invoke-direct {v0}, Ljava/nio/BufferOverflowException;-><init>()V

    throw v0

    .line 48
    :cond_13
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->callback:Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;

    iget-object v1, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-interface {v0, v1, p1}, Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;->call(Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    goto :goto_8
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 147
    return-void
.end method

.method public flush()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    return-void
.end method

.method public write(Ljava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 60
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 61
    return-void
.end method

.method public write([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0, p3}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 54
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 55
    return-void
.end method

.method public writeByte(B)V
    .registers 3
    .param p1, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 66
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 67
    return-void
.end method

.method public writeByteAndByte(BB)V
    .registers 4
    .param p1, "b"    # B
    .param p2, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 102
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 103
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 104
    return-void
.end method

.method public writeByteAndDouble(BD)V
    .registers 5
    .param p1, "b"    # B
    .param p2, "v"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 137
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 138
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2, p3}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 139
    return-void
.end method

.method public writeByteAndFloat(BF)V
    .registers 4
    .param p1, "b"    # B
    .param p2, "v"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 130
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 131
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 132
    return-void
.end method

.method public writeByteAndInt(BI)V
    .registers 4
    .param p1, "b"    # B
    .param p2, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 116
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 117
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 118
    return-void
.end method

.method public writeByteAndLong(BJ)V
    .registers 5
    .param p1, "b"    # B
    .param p2, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 123
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 124
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2, p3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 125
    return-void
.end method

.method public writeByteAndShort(BS)V
    .registers 4
    .param p1, "b"    # B
    .param p2, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 109
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 110
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 111
    return-void
.end method

.method public writeDouble(D)V
    .registers 4
    .param p1, "v"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 96
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 97
    return-void
.end method

.method public writeFloat(F)V
    .registers 3
    .param p1, "v"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 90
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    .line 91
    return-void
.end method

.method public writeInt(I)V
    .registers 3
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 78
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 79
    return-void
.end method

.method public writeLong(J)V
    .registers 4
    .param p1, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 84
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 85
    return-void
.end method

.method public writeShort(S)V
    .registers 3
    .param p1, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/msgpack/io/ByteBufferOutput;->reserve(I)V

    .line 72
    iget-object v0, p0, Lorg/msgpack/io/ByteBufferOutput;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 73
    return-void
.end method
