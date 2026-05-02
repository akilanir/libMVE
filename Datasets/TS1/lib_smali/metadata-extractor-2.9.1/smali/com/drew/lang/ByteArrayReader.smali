.class public Lcom/drew/lang/ByteArrayReader;
.super Lcom/drew/lang/RandomAccessReader;
.source "ByteArrayReader.java"


# instance fields
.field private final _buffer:[B
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>([B)V
    .registers 3
    .param p1, "buffer"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/SuppressWarnings;
        justification = "Design intent"
        value = "EI_EXPOSE_REP2"
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/drew/lang/RandomAccessReader;-><init>()V

    .line 46
    if-nez p1, :cond_b

    .line 47
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 49
    :cond_b
    iput-object p1, p0, Lcom/drew/lang/ByteArrayReader;->_buffer:[B

    .line 50
    return-void
.end method


# virtual methods
.method protected getByte(I)B
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lcom/drew/lang/ByteArrayReader;->_buffer:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public getBytes(II)[B
    .registers 6
    .param p1, "index"    # I
    .param p2, "count"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-virtual {p0, p1, p2}, Lcom/drew/lang/ByteArrayReader;->validateIndex(II)V

    .line 85
    new-array v0, p2, [B

    .line 86
    .local v0, "bytes":[B
    iget-object v1, p0, Lcom/drew/lang/ByteArrayReader;->_buffer:[B

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    return-object v0
.end method

.method public getLength()J
    .registers 3

    .prologue
    .line 55
    iget-object v0, p0, Lcom/drew/lang/ByteArrayReader;->_buffer:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method protected isValidIndex(II)Z
    .registers 7
    .param p1, "index"    # I
    .param p2, "bytesRequested"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    if-ltz p2, :cond_14

    if-ltz p1, :cond_14

    int-to-long v0, p1

    int-to-long v2, p2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iget-object v2, p0, Lcom/drew/lang/ByteArrayReader;->_buffer:[B

    array-length v2, v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method protected validateIndex(II)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "bytesRequested"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0, p1, p2}, Lcom/drew/lang/ByteArrayReader;->isValidIndex(II)Z

    move-result v0

    if-nez v0, :cond_10

    .line 68
    new-instance v0, Lcom/drew/lang/BufferBoundsException;

    iget-object v1, p0, Lcom/drew/lang/ByteArrayReader;->_buffer:[B

    array-length v1, v1

    int-to-long v1, v1

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/drew/lang/BufferBoundsException;-><init>(IIJ)V

    throw v0

    .line 69
    :cond_10
    return-void
.end method
