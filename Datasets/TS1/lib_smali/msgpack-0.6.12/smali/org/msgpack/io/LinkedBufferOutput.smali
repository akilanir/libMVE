.class public final Lorg/msgpack/io/LinkedBufferOutput;
.super Lorg/msgpack/io/BufferedOutput;
.source "LinkedBufferOutput.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/io/LinkedBufferOutput$Link;
    }
.end annotation


# instance fields
.field private link:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/msgpack/io/LinkedBufferOutput$Link;",
            ">;"
        }
    .end annotation
.end field

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/msgpack/io/BufferedOutput;-><init>(I)V

    .line 40
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/msgpack/io/LinkedBufferOutput;->link:Ljava/util/LinkedList;

    .line 41
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 68
    iget-object v0, p0, Lorg/msgpack/io/LinkedBufferOutput;->link:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 69
    iput v1, p0, Lorg/msgpack/io/LinkedBufferOutput;->size:I

    .line 70
    iput v1, p0, Lorg/msgpack/io/LinkedBufferOutput;->filled:I

    .line 71
    return-void
.end method

.method public close()V
    .registers 1

    .prologue
    .line 75
    return-void
.end method

.method public bridge synthetic flush()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0}, Lorg/msgpack/io/BufferedOutput;->flush()V

    return-void
.end method

.method protected flushBuffer([BII)Z
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 62
    iget-object v0, p0, Lorg/msgpack/io/LinkedBufferOutput;->link:Ljava/util/LinkedList;

    new-instance v1, Lorg/msgpack/io/LinkedBufferOutput$Link;

    invoke-direct {v1, p1, p2, p3}, Lorg/msgpack/io/LinkedBufferOutput$Link;-><init>([BII)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 63
    iget v0, p0, Lorg/msgpack/io/LinkedBufferOutput;->size:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/msgpack/io/LinkedBufferOutput;->size:I

    .line 64
    const/4 v0, 0x0

    return v0
.end method

.method public getSize()I
    .registers 3

    .prologue
    .line 57
    iget v0, p0, Lorg/msgpack/io/LinkedBufferOutput;->size:I

    iget v1, p0, Lorg/msgpack/io/LinkedBufferOutput;->filled:I

    add-int/2addr v0, v1

    return v0
.end method

.method public toByteArray()[B
    .registers 8

    .prologue
    .line 44
    iget v4, p0, Lorg/msgpack/io/LinkedBufferOutput;->size:I

    iget v5, p0, Lorg/msgpack/io/LinkedBufferOutput;->filled:I

    add-int/2addr v4, v5

    new-array v0, v4, [B

    .line 45
    .local v0, "bytes":[B
    const/4 v3, 0x0

    .line 46
    .local v3, "off":I
    iget-object v4, p0, Lorg/msgpack/io/LinkedBufferOutput;->link:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/msgpack/io/LinkedBufferOutput$Link;

    .line 47
    .local v2, "l":Lorg/msgpack/io/LinkedBufferOutput$Link;
    iget-object v4, v2, Lorg/msgpack/io/LinkedBufferOutput$Link;->buffer:[B

    iget v5, v2, Lorg/msgpack/io/LinkedBufferOutput$Link;->offset:I

    iget v6, v2, Lorg/msgpack/io/LinkedBufferOutput$Link;->size:I

    invoke-static {v4, v5, v0, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    iget v4, v2, Lorg/msgpack/io/LinkedBufferOutput$Link;->size:I

    add-int/2addr v3, v4

    .line 49
    goto :goto_e

    .line 50
    .end local v2    # "l":Lorg/msgpack/io/LinkedBufferOutput$Link;
    :cond_27
    iget v4, p0, Lorg/msgpack/io/LinkedBufferOutput;->filled:I

    if-lez v4, :cond_33

    .line 51
    iget-object v4, p0, Lorg/msgpack/io/LinkedBufferOutput;->buffer:[B

    const/4 v5, 0x0

    iget v6, p0, Lorg/msgpack/io/LinkedBufferOutput;->filled:I

    invoke-static {v4, v5, v0, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    :cond_33
    return-object v0
.end method

.method public bridge synthetic write(Ljava/nio/ByteBuffer;)V
    .registers 2
    .param p1, "x0"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/msgpack/io/BufferedOutput;->write(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public bridge synthetic write([BII)V
    .registers 4
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2, p3}, Lorg/msgpack/io/BufferedOutput;->write([BII)V

    return-void
.end method

.method public bridge synthetic writeByte(B)V
    .registers 2
    .param p1, "x0"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/msgpack/io/BufferedOutput;->writeByte(B)V

    return-void
.end method

.method public bridge synthetic writeByteAndByte(BB)V
    .registers 3
    .param p1, "x0"    # B
    .param p2, "x1"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lorg/msgpack/io/BufferedOutput;->writeByteAndByte(BB)V

    return-void
.end method

.method public bridge synthetic writeByteAndDouble(BD)V
    .registers 4
    .param p1, "x0"    # B
    .param p2, "x1"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2, p3}, Lorg/msgpack/io/BufferedOutput;->writeByteAndDouble(BD)V

    return-void
.end method

.method public bridge synthetic writeByteAndFloat(BF)V
    .registers 3
    .param p1, "x0"    # B
    .param p2, "x1"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lorg/msgpack/io/BufferedOutput;->writeByteAndFloat(BF)V

    return-void
.end method

.method public bridge synthetic writeByteAndInt(BI)V
    .registers 3
    .param p1, "x0"    # B
    .param p2, "x1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lorg/msgpack/io/BufferedOutput;->writeByteAndInt(BI)V

    return-void
.end method

.method public bridge synthetic writeByteAndLong(BJ)V
    .registers 4
    .param p1, "x0"    # B
    .param p2, "x1"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2, p3}, Lorg/msgpack/io/BufferedOutput;->writeByteAndLong(BJ)V

    return-void
.end method

.method public bridge synthetic writeByteAndShort(BS)V
    .registers 3
    .param p1, "x0"    # B
    .param p2, "x1"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lorg/msgpack/io/BufferedOutput;->writeByteAndShort(BS)V

    return-void
.end method

.method public bridge synthetic writeDouble(D)V
    .registers 3
    .param p1, "x0"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lorg/msgpack/io/BufferedOutput;->writeDouble(D)V

    return-void
.end method

.method public bridge synthetic writeFloat(F)V
    .registers 2
    .param p1, "x0"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/msgpack/io/BufferedOutput;->writeFloat(F)V

    return-void
.end method

.method public bridge synthetic writeInt(I)V
    .registers 2
    .param p1, "x0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/msgpack/io/BufferedOutput;->writeInt(I)V

    return-void
.end method

.method public bridge synthetic writeLong(J)V
    .registers 3
    .param p1, "x0"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lorg/msgpack/io/BufferedOutput;->writeLong(J)V

    return-void
.end method

.method public bridge synthetic writeShort(S)V
    .registers 2
    .param p1, "x0"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/msgpack/io/BufferedOutput;->writeShort(S)V

    return-void
.end method
