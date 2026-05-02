.class public Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;
.super Lorg/apache/james/mime4j/io/LineReaderInputStream;
.source "LineReaderInputStreamAdaptor.java"


# instance fields
.field private final bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

.field private eof:Z

.field private final maxLineLen:I

.field private used:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 54
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;-><init>(Ljava/io/InputStream;I)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "maxLineLen"    # I

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/io/LineReaderInputStream;-><init>(Ljava/io/InputStream;)V

    .line 37
    iput-boolean v0, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->used:Z

    .line 38
    iput-boolean v0, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->eof:Z

    .line 44
    instance-of v0, p1, Lorg/apache/james/mime4j/io/LineReaderInputStream;

    if-eqz v0, :cond_13

    .line 45
    check-cast p1, Lorg/apache/james/mime4j/io/LineReaderInputStream;

    .end local p1    # "is":Ljava/io/InputStream;
    iput-object p1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

    .line 49
    :goto_10
    iput p2, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->maxLineLen:I

    .line 50
    return-void

    .line 47
    .restart local p1    # "is":Ljava/io/InputStream;
    :cond_13
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

    goto :goto_10
.end method

.method private doReadLine(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)I
    .registers 7
    .param p1, "dst"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/io/MaxLineLimitException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 89
    const/4 v1, 0x0

    .line 91
    .local v1, "total":I
    :cond_2
    iget-object v3, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "ch":I
    if-eq v0, v2, :cond_27

    .line 92
    invoke-virtual {p1, v0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append(I)V

    .line 93
    add-int/lit8 v1, v1, 0x1

    .line 94
    iget v3, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->maxLineLen:I

    if-lez v3, :cond_23

    invoke-virtual {p1}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->length()I

    move-result v3

    iget v4, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->maxLineLen:I

    if-lt v3, v4, :cond_23

    .line 95
    new-instance v2, Lorg/apache/james/mime4j/io/MaxLineLimitException;

    const-string v3, "Maximum line length limit exceeded"

    invoke-direct {v2, v3}, Lorg/apache/james/mime4j/io/MaxLineLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 97
    :cond_23
    const/16 v3, 0xa

    if-ne v0, v3, :cond_2

    .line 101
    :cond_27
    if-nez v1, :cond_2c

    if-ne v0, v2, :cond_2c

    move v1, v2

    .line 104
    .end local v1    # "total":I
    :cond_2c
    return v1
.end method


# virtual methods
.method public eof()Z
    .registers 2

    .prologue
    .line 109
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->eof:Z

    return v0
.end method

.method public isUsed()Z
    .registers 2

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->used:Z

    return v0
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 59
    iget-object v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 60
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    move v1, v2

    :goto_b
    iput-boolean v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->eof:Z

    .line 61
    iput-boolean v2, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->used:Z

    .line 62
    return v0

    .line 60
    :cond_10
    const/4 v1, 0x0

    goto :goto_b
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
    const/4 v2, 0x1

    .line 67
    iget-object v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 68
    .local v0, "i":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_10

    move v1, v2

    :goto_b
    iput-boolean v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->eof:Z

    .line 69
    iput-boolean v2, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->used:Z

    .line 70
    return v0

    .line 68
    :cond_10
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public readLine(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)I
    .registers 5
    .param p1, "dst"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/io/MaxLineLimitException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 77
    iget-object v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

    if-eqz v1, :cond_14

    .line 78
    iget-object v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

    invoke-virtual {v1, p1}, Lorg/apache/james/mime4j/io/LineReaderInputStream;->readLine(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)I

    move-result v0

    .line 82
    .local v0, "i":I
    :goto_b
    const/4 v1, -0x1

    if-ne v0, v1, :cond_19

    move v1, v2

    :goto_f
    iput-boolean v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->eof:Z

    .line 83
    iput-boolean v2, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->used:Z

    .line 84
    return v0

    .line 80
    .end local v0    # "i":I
    :cond_14
    invoke-direct {p0, p1}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->doReadLine(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)I

    move-result v0

    .restart local v0    # "i":I
    goto :goto_b

    .line 82
    :cond_19
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public skip(J)J
    .registers 12
    .param p1, "count"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x0

    .line 132
    cmp-long v7, p1, v5

    if-gtz v7, :cond_8

    move-wide v3, v5

    .line 146
    :cond_7
    return-wide v3

    .line 135
    :cond_8
    const-wide/16 v7, 0x2000

    cmp-long v7, p1, v7

    if-lez v7, :cond_24

    const/16 v1, 0x2000

    .line 136
    .local v1, "bufferSize":I
    :goto_10
    new-array v0, v1, [B

    .line 137
    .local v0, "buffer":[B
    const-wide/16 v3, 0x0

    .line 138
    .local v3, "result":J
    :goto_14
    cmp-long v7, p1, v5

    if-lez v7, :cond_7

    .line 139
    invoke-virtual {p0, v0}, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->read([B)I

    move-result v2

    .line 140
    .local v2, "res":I
    const/4 v7, -0x1

    if-eq v2, v7, :cond_7

    .line 143
    int-to-long v7, v2

    add-long/2addr v3, v7

    .line 144
    int-to-long v7, v2

    sub-long/2addr p1, v7

    .line 145
    goto :goto_14

    .line 135
    .end local v0    # "buffer":[B
    .end local v1    # "bufferSize":I
    .end local v2    # "res":I
    .end local v3    # "result":J
    :cond_24
    long-to-int v1, p1

    goto :goto_10
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[LineReaderInputStreamAdaptor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unread(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)Z
    .registers 3
    .param p1, "buf"    # Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

    if-eqz v0, :cond_b

    .line 124
    iget-object v0, p0, Lorg/apache/james/mime4j/io/LineReaderInputStreamAdaptor;->bis:Lorg/apache/james/mime4j/io/LineReaderInputStream;

    invoke-virtual {v0, p1}, Lorg/apache/james/mime4j/io/LineReaderInputStream;->unread(Lorg/apache/james/mime4j/util/ByteArrayBuffer;)Z

    move-result v0

    .line 126
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
