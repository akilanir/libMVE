.class public Lorg/msgpack/io/StreamInput;
.super Lorg/msgpack/io/AbstractInput;
.source "StreamInput.java"


# instance fields
.field private castBuffer:[B

.field private castByteBuffer:Ljava/nio/ByteBuffer;

.field private filled:I

.field private final in:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/msgpack/io/AbstractInput;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/msgpack/io/StreamInput;->in:Ljava/io/InputStream;

    .line 34
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/msgpack/io/StreamInput;->castBuffer:[B

    .line 35
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->castBuffer:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/io/StreamInput;->castByteBuffer:Ljava/nio/ByteBuffer;

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/io/StreamInput;->filled:I

    .line 37
    return-void
.end method

.method private require(I)V
    .registers 7
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    :goto_0
    iget v1, p0, Lorg/msgpack/io/StreamInput;->filled:I

    if-ge v1, p1, :cond_20

    .line 73
    iget-object v1, p0, Lorg/msgpack/io/StreamInput;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lorg/msgpack/io/StreamInput;->castBuffer:[B

    iget v3, p0, Lorg/msgpack/io/StreamInput;->filled:I

    iget v4, p0, Lorg/msgpack/io/StreamInput;->filled:I

    sub-int v4, p1, v4

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 74
    .local v0, "n":I
    if-gez v0, :cond_1a

    .line 75
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 77
    :cond_1a
    iget v1, p0, Lorg/msgpack/io/StreamInput;->filled:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/msgpack/io/StreamInput;->filled:I

    goto :goto_0

    .line 79
    .end local v0    # "n":I
    :cond_20
    return-void
.end method


# virtual methods
.method public advance()V
    .registers 2

    .prologue
    .line 67
    iget v0, p0, Lorg/msgpack/io/StreamInput;->filled:I

    invoke-virtual {p0, v0}, Lorg/msgpack/io/StreamInput;->incrReadByteCount(I)V

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/io/StreamInput;->filled:I

    .line 69
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 113
    return-void
.end method

.method public getByte()B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/msgpack/io/StreamInput;->require(I)V

    .line 83
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->castBuffer:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    return v0
.end method

.method public getDouble()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/msgpack/io/StreamInput;->require(I)V

    .line 108
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->castByteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat()F
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/msgpack/io/StreamInput;->require(I)V

    .line 103
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->castByteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getFloat(I)F

    move-result v0

    return v0
.end method

.method public getInt()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/msgpack/io/StreamInput;->require(I)V

    .line 93
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->castByteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getLong()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/msgpack/io/StreamInput;->require(I)V

    .line 98
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->castByteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic getReadByteCount()I
    .registers 2

    .prologue
    .line 25
    invoke-super {p0}, Lorg/msgpack/io/AbstractInput;->getReadByteCount()I

    move-result v0

    return v0
.end method

.method public getShort()S
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/msgpack/io/StreamInput;->require(I)V

    .line 88
    iget-object v0, p0, Lorg/msgpack/io/StreamInput;->castByteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v0

    return v0
.end method

.method public read([BII)I
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
    .line 40
    move v1, p3

    .line 41
    .local v1, "remain":I
    :goto_1
    if-lez v1, :cond_17

    .line 42
    iget-object v2, p0, Lorg/msgpack/io/StreamInput;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 43
    .local v0, "n":I
    if-gtz v0, :cond_11

    .line 44
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 46
    :cond_11
    invoke-virtual {p0, v0}, Lorg/msgpack/io/StreamInput;->incrReadByteCount(I)V

    .line 47
    sub-int/2addr v1, v0

    .line 48
    add-int/2addr p2, v0

    .line 49
    goto :goto_1

    .line 50
    .end local v0    # "n":I
    :cond_17
    return p3
.end method

.method public readByte()B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    iget-object v1, p0, Lorg/msgpack/io/StreamInput;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 59
    .local v0, "n":I
    if-gez v0, :cond_e

    .line 60
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 62
    :cond_e
    invoke-virtual {p0}, Lorg/msgpack/io/StreamInput;->incrReadOneByteCount()V

    .line 63
    int-to-byte v1, v0

    return v1
.end method

.method public bridge synthetic resetReadByteCount()V
    .registers 1

    .prologue
    .line 25
    invoke-super {p0}, Lorg/msgpack/io/AbstractInput;->resetReadByteCount()V

    return-void
.end method

.method public tryRefer(Lorg/msgpack/io/BufferReferer;I)Z
    .registers 4
    .param p1, "ref"    # Lorg/msgpack/io/BufferReferer;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    const/4 v0, 0x0

    return v0
.end method
