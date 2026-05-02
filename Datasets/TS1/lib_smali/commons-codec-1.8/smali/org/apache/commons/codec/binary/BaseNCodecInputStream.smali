.class public Lorg/apache/commons/codec/binary/BaseNCodecInputStream;
.super Ljava/io/FilterInputStream;
.source "BaseNCodecInputStream.java"


# instance fields
.field private final baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

.field private final context:Lorg/apache/commons/codec/binary/BaseNCodec$Context;

.field private final doEncode:Z

.field private final singleByte:[B


# direct methods
.method protected constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/codec/binary/BaseNCodec;Z)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "baseNCodec"    # Lorg/apache/commons/codec/binary/BaseNCodec;
    .param p3, "doEncode"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 40
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    .line 42
    new-instance v0, Lorg/apache/commons/codec/binary/BaseNCodec$Context;

    invoke-direct {v0}, Lorg/apache/commons/codec/binary/BaseNCodec$Context;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->context:Lorg/apache/commons/codec/binary/BaseNCodec$Context;

    .line 46
    iput-boolean p3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->doEncode:Z

    .line 47
    iput-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    .line 48
    return-void
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->context:Lorg/apache/commons/codec/binary/BaseNCodec$Context;

    iget-boolean v0, v0, Lorg/apache/commons/codec/binary/BaseNCodec$Context;->eof:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public declared-synchronized mark(I)V
    .registers 2
    .param p1, "readLimit"    # I

    .prologue
    .line 76
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 97
    iget-object v2, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->read([BII)I

    move-result v1

    .line 98
    .local v1, "r":I
    :goto_8
    if-nez v1, :cond_11

    .line 99
    iget-object v2, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->read([BII)I

    move-result v1

    goto :goto_8

    .line 101
    :cond_11
    if-lez v1, :cond_1c

    .line 102
    iget-object v2, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    aget-byte v0, v2, v3

    .line 103
    .local v0, "b":B
    if-gez v0, :cond_1b

    add-int/lit16 v0, v0, 0x100

    .line 105
    .end local v0    # "b":B
    :cond_1b
    :goto_1b
    return v0

    :cond_1c
    const/4 v0, -0x1

    goto :goto_1b
.end method

.method public read([BII)I
    .registers 10
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 129
    if-nez p1, :cond_9

    .line 130
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 131
    :cond_9
    if-ltz p2, :cond_d

    if-gez p3, :cond_13

    .line 132
    :cond_d
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v3

    .line 133
    :cond_13
    array-length v3, p1

    if-gt p2, v3, :cond_1b

    add-int v3, p2, p3

    array-length v5, p1

    if-le v3, v5, :cond_21

    .line 134
    :cond_1b
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v3

    .line 135
    :cond_21
    if-nez p3, :cond_25

    move v2, v4

    .line 167
    :cond_24
    return v2

    .line 138
    :cond_25
    const/4 v2, 0x0

    .line 155
    .local v2, "readLen":I
    :goto_26
    if-nez v2, :cond_24

    .line 156
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    iget-object v5, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->context:Lorg/apache/commons/codec/binary/BaseNCodec$Context;

    invoke-virtual {v3, v5}, Lorg/apache/commons/codec/binary/BaseNCodec;->hasData(Lorg/apache/commons/codec/binary/BaseNCodec$Context;)Z

    move-result v3

    if-nez v3, :cond_4b

    .line 157
    iget-boolean v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->doEncode:Z

    if-eqz v3, :cond_54

    const/16 v3, 0x1000

    :goto_38
    new-array v0, v3, [B

    .line 158
    .local v0, "buf":[B
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 159
    .local v1, "c":I
    iget-boolean v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->doEncode:Z

    if-eqz v3, :cond_57

    .line 160
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    iget-object v5, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->context:Lorg/apache/commons/codec/binary/BaseNCodec$Context;

    invoke-virtual {v3, v0, v4, v1, v5}, Lorg/apache/commons/codec/binary/BaseNCodec;->encode([BIILorg/apache/commons/codec/binary/BaseNCodec$Context;)V

    .line 165
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    :cond_4b
    :goto_4b
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    iget-object v5, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->context:Lorg/apache/commons/codec/binary/BaseNCodec$Context;

    invoke-virtual {v3, p1, p2, p3, v5}, Lorg/apache/commons/codec/binary/BaseNCodec;->readResults([BIILorg/apache/commons/codec/binary/BaseNCodec$Context;)I

    move-result v2

    goto :goto_26

    .line 157
    :cond_54
    const/16 v3, 0x2000

    goto :goto_38

    .line 162
    .restart local v0    # "buf":[B
    .restart local v1    # "c":I
    :cond_57
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    iget-object v5, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->context:Lorg/apache/commons/codec/binary/BaseNCodec$Context;

    invoke-virtual {v3, v0, v4, v1, v5}, Lorg/apache/commons/codec/binary/BaseNCodec;->decode([BIILorg/apache/commons/codec/binary/BaseNCodec$Context;)V

    goto :goto_4b
.end method

.method public declared-synchronized reset()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "mark/reset not supported"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_9

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public skip(J)J
    .registers 11
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 192
    cmp-long v4, p1, v6

    if-gez v4, :cond_1f

    .line 193
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Negative skip length: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 197
    :cond_1f
    const/16 v4, 0x200

    new-array v0, v4, [B

    .line 198
    .local v0, "b":[B
    move-wide v2, p1

    .line 200
    .local v2, "todo":J
    :goto_24
    cmp-long v4, v2, v6

    if-lez v4, :cond_37

    .line 201
    array-length v4, v0

    int-to-long v4, v4

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v1, v4

    .line 202
    .local v1, "len":I
    const/4 v4, 0x0

    invoke-virtual {p0, v0, v4, v1}, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->read([BII)I

    move-result v1

    .line 203
    const/4 v4, -0x1

    if-ne v1, v4, :cond_3a

    .line 209
    .end local v1    # "len":I
    :cond_37
    sub-long v4, p1, v2

    return-wide v4

    .line 206
    .restart local v1    # "len":I
    :cond_3a
    int-to-long v4, v1

    sub-long/2addr v2, v4

    .line 207
    goto :goto_24
.end method
