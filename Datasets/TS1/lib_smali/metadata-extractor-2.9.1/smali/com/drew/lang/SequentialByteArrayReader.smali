.class public Lcom/drew/lang/SequentialByteArrayReader;
.super Lcom/drew/lang/SequentialReader;
.source "SequentialByteArrayReader.java"


# instance fields
.field private final _bytes:[B
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private _index:I


# direct methods
.method public constructor <init>([B)V
    .registers 3
    .param p1, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([BI)V

    .line 42
    return-void
.end method

.method public constructor <init>([BI)V
    .registers 4
    .param p1, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "baseIndex"    # I

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/drew/lang/SequentialReader;-><init>()V

    .line 47
    if-nez p1, :cond_b

    .line 48
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 50
    :cond_b
    iput-object p1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    .line 51
    iput p2, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    .line 52
    return-void
.end method


# virtual methods
.method protected getByte()B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    iget v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    iget-object v1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    array-length v1, v1

    if-lt v0, v1, :cond_f

    .line 58
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "End of data reached."

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_f
    iget-object v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    iget v1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    aget-byte v0, v0, v1

    return v0
.end method

.method public getBytes(I)[B
    .registers 6
    .param p1, "count"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    iget v1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    array-length v2, v2

    if-le v1, v2, :cond_10

    .line 68
    new-instance v1, Ljava/io/EOFException;

    const-string v2, "End of data reached."

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_10
    new-array v0, p1, [B

    .line 72
    .local v0, "bytes":[B
    iget-object v1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    iget v2, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v0, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    iget v1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    .line 75
    return-object v0
.end method

.method public skip(J)V
    .registers 7
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_e

    .line 82
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "n must be zero or greater."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_e
    iget v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    iget-object v2, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    array-length v2, v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_22

    .line 86
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "End of data reached."

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_22
    iget v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    long-to-int v0, v0

    iput v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    .line 90
    return-void
.end method

.method public trySkip(J)Z
    .registers 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_e

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "n must be zero or greater."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_e
    iget v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    long-to-int v0, v0

    iput v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    .line 101
    iget v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    iget-object v1, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    array-length v1, v1

    if-le v0, v1, :cond_23

    .line 102
    iget-object v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_bytes:[B

    array-length v0, v0

    iput v0, p0, Lcom/drew/lang/SequentialByteArrayReader;->_index:I

    .line 103
    const/4 v0, 0x0

    .line 106
    :goto_22
    return v0

    :cond_23
    const/4 v0, 0x1

    goto :goto_22
.end method
