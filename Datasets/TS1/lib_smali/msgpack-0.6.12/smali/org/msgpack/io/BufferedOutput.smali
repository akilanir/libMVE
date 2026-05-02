.class abstract Lorg/msgpack/io/BufferedOutput;
.super Ljava/lang/Object;
.source "BufferedOutput.java"

# interfaces
.implements Lorg/msgpack/io/Output;


# instance fields
.field protected buffer:[B

.field protected final bufferSize:I

.field protected castByteBuffer:Ljava/nio/ByteBuffer;

.field protected filled:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/16 v0, 0x9

    if-ge p1, v0, :cond_9

    .line 31
    const/16 p1, 0x9

    .line 33
    :cond_9
    iput p1, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    .line 34
    return-void
.end method

.method private allocateNewBuffer()V
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    .line 38
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    .line 39
    return-void
.end method

.method private reserve(I)V
    .registers 5
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 42
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    if-nez v0, :cond_9

    .line 43
    invoke-direct {p0}, Lorg/msgpack/io/BufferedOutput;->allocateNewBuffer()V

    .line 53
    :cond_8
    :goto_8
    return-void

    .line 46
    :cond_9
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    sub-int/2addr v0, v1

    if-ge v0, p1, :cond_8

    .line 47
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {p0, v0, v2, v1}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    move-result v0

    if-nez v0, :cond_28

    .line 48
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    .line 49
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    .line 51
    :cond_28
    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    goto :goto_8
.end method


# virtual methods
.method public flush()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 196
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    if-lez v0, :cond_14

    .line 197
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {p0, v0, v2, v1}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    move-result v0

    if-nez v0, :cond_12

    .line 198
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    .line 200
    :cond_12
    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 202
    :cond_14
    return-void
.end method

.method protected abstract flushBuffer([BII)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected flushByteBuffer(Ljava/nio/ByteBuffer;)V
    .registers 7
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v3

    if-eqz v3, :cond_22

    .line 206
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 207
    .local v0, "array":[B
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    .line 208
    .local v2, "offset":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    .line 209
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 215
    .end local v0    # "array":[B
    .end local v2    # "offset":I
    :goto_21
    return-void

    .line 211
    :cond_22
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    new-array v1, v3, [B

    .line 212
    .local v1, "buf":[B
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 213
    const/4 v3, 0x0

    array-length v4, v1

    invoke-virtual {p0, v1, v3, v4}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    goto :goto_21
.end method

.method public write(Ljava/nio/ByteBuffer;)V
    .registers 6
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 82
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 83
    .local v0, "len":I
    iget-object v1, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    if-nez v1, :cond_14

    .line 84
    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    if-ge v1, v0, :cond_11

    .line 85
    invoke-virtual {p0, p1}, Lorg/msgpack/io/BufferedOutput;->flushByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 104
    :goto_10
    return-void

    .line 88
    :cond_11
    invoke-direct {p0}, Lorg/msgpack/io/BufferedOutput;->allocateNewBuffer()V

    .line 90
    :cond_14
    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    iget v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    sub-int/2addr v1, v2

    if-gt v0, v1, :cond_28

    .line 91
    iget-object v1, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 92
    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    goto :goto_10

    .line 93
    :cond_28
    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    if-gt v0, v1, :cond_43

    .line 94
    iget-object v1, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {p0, v1, v3, v2}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    move-result v1

    if-nez v1, :cond_39

    .line 95
    invoke-direct {p0}, Lorg/msgpack/io/BufferedOutput;->allocateNewBuffer()V

    .line 97
    :cond_39
    iput v3, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 98
    iget-object v1, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    invoke-virtual {p1, v1, v3, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 99
    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    goto :goto_10

    .line 101
    :cond_43
    invoke-virtual {p0}, Lorg/msgpack/io/BufferedOutput;->flush()V

    .line 102
    invoke-virtual {p0, p1}, Lorg/msgpack/io/BufferedOutput;->flushByteBuffer(Ljava/nio/ByteBuffer;)V

    goto :goto_10
.end method

.method public write([BII)V
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 57
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    if-nez v0, :cond_10

    .line 58
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    if-ge v0, p3, :cond_d

    .line 59
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    .line 78
    :goto_c
    return-void

    .line 62
    :cond_d
    invoke-direct {p0}, Lorg/msgpack/io/BufferedOutput;->allocateNewBuffer()V

    .line 64
    :cond_10
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    sub-int/2addr v0, v1

    if-gt p3, v0, :cond_24

    .line 65
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 66
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    goto :goto_c

    .line 67
    :cond_24
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->bufferSize:I

    if-gt p3, v0, :cond_3f

    .line 68
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {p0, v0, v2, v1}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    move-result v0

    if-nez v0, :cond_35

    .line 69
    invoke-direct {p0}, Lorg/msgpack/io/BufferedOutput;->allocateNewBuffer()V

    .line 71
    :cond_35
    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 72
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    invoke-static {p1, p2, v0, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    iput p3, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    goto :goto_c

    .line 75
    :cond_3f
    invoke-virtual {p0}, Lorg/msgpack/io/BufferedOutput;->flush()V

    .line 76
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/io/BufferedOutput;->flushBuffer([BII)Z

    goto :goto_c
.end method

.method public writeByte(B)V
    .registers 5
    .param p1, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 109
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p1, v0, v1

    .line 110
    return-void
.end method

.method public writeByteAndByte(BB)V
    .registers 6
    .param p1, "b"    # B
    .param p2, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 150
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p1, v0, v1

    .line 151
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p2, v0, v1

    .line 152
    return-void
.end method

.method public writeByteAndDouble(BD)V
    .registers 7
    .param p1, "b"    # B
    .param p2, "v"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 189
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p1, v0, v1

    .line 190
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p2, p3}, Ljava/nio/ByteBuffer;->putDouble(ID)Ljava/nio/ByteBuffer;

    .line 191
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 192
    return-void
.end method

.method public writeByteAndFloat(BF)V
    .registers 6
    .param p1, "b"    # B
    .param p2, "v"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 181
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p1, v0, v1

    .line 182
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p2}, Ljava/nio/ByteBuffer;->putFloat(IF)Ljava/nio/ByteBuffer;

    .line 183
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 184
    return-void
.end method

.method public writeByteAndInt(BI)V
    .registers 6
    .param p1, "b"    # B
    .param p2, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 165
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p1, v0, v1

    .line 166
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p2}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 167
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 168
    return-void
.end method

.method public writeByteAndLong(BJ)V
    .registers 7
    .param p1, "b"    # B
    .param p2, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 173
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p1, v0, v1

    .line 174
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p2, p3}, Ljava/nio/ByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    .line 175
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 176
    return-void
.end method

.method public writeByteAndShort(BS)V
    .registers 6
    .param p1, "b"    # B
    .param p2, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 157
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->buffer:[B

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    aput-byte p1, v0, v1

    .line 158
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p2}, Ljava/nio/ByteBuffer;->putShort(IS)Ljava/nio/ByteBuffer;

    .line 159
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 160
    return-void
.end method

.method public writeDouble(D)V
    .registers 5
    .param p1, "v"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 143
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p1, p2}, Ljava/nio/ByteBuffer;->putDouble(ID)Ljava/nio/ByteBuffer;

    .line 144
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 145
    return-void
.end method

.method public writeFloat(F)V
    .registers 4
    .param p1, "v"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 136
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p1}, Ljava/nio/ByteBuffer;->putFloat(IF)Ljava/nio/ByteBuffer;

    .line 137
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 138
    return-void
.end method

.method public writeInt(I)V
    .registers 4
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 122
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p1}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 123
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 124
    return-void
.end method

.method public writeLong(J)V
    .registers 5
    .param p1, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 129
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p1, p2}, Ljava/nio/ByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    .line 130
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 131
    return-void
.end method

.method public writeShort(S)V
    .registers 4
    .param p1, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/msgpack/io/BufferedOutput;->reserve(I)V

    .line 115
    iget-object v0, p0, Lorg/msgpack/io/BufferedOutput;->castByteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    invoke-virtual {v0, v1, p1}, Ljava/nio/ByteBuffer;->putShort(IS)Ljava/nio/ByteBuffer;

    .line 116
    iget v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/msgpack/io/BufferedOutput;->filled:I

    .line 117
    return-void
.end method
