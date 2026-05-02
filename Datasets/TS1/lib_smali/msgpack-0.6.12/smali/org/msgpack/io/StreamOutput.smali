.class public Lorg/msgpack/io/StreamOutput;
.super Ljava/lang/Object;
.source "StreamOutput.java"

# interfaces
.implements Lorg/msgpack/io/Output;


# instance fields
.field private out:Ljava/io/DataOutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    .line 30
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 125
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
    .line 120
    return-void
.end method

.method public write(Ljava/nio/ByteBuffer;)V
    .registers 7
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 40
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 41
    .local v0, "array":[B
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    .line 42
    .local v2, "offset":I
    iget-object v3, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-virtual {v3, v0, v2, v4}, Ljava/io/DataOutputStream;->write([BII)V

    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 50
    .end local v0    # "array":[B
    .end local v2    # "offset":I
    :goto_1e
    return-void

    .line 46
    :cond_1f
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v1, v3, [B

    .line 47
    .local v1, "buf":[B
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 48
    iget-object v3, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->write([B)V

    goto :goto_1e
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
    .line 34
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataOutputStream;->write([BII)V

    .line 35
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
    .line 54
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write(I)V

    .line 55
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
    .line 84
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write(I)V

    .line 85
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p2}, Ljava/io/DataOutputStream;->write(I)V

    .line 86
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
    .line 114
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write(I)V

    .line 115
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p2, p3}, Ljava/io/DataOutputStream;->writeDouble(D)V

    .line 116
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
    .line 108
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write(I)V

    .line 109
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p2}, Ljava/io/DataOutputStream;->writeFloat(F)V

    .line 110
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
    .line 96
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write(I)V

    .line 97
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 98
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
    .line 102
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write(I)V

    .line 103
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p2, p3}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 104
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
    .line 90
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->write(I)V

    .line 91
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p2}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 92
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
    .line 79
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/DataOutputStream;->writeDouble(D)V

    .line 80
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
    .line 74
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->writeFloat(F)V

    .line 75
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
    .line 64
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 65
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
    .line 69
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 70
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
    .line 59
    iget-object v0, p0, Lorg/msgpack/io/StreamOutput;->out:Ljava/io/DataOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 60
    return-void
.end method
