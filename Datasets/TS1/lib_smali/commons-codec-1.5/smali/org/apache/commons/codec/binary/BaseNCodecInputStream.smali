.class public Lorg/apache/commons/codec/binary/BaseNCodecInputStream;
.super Ljava/io/FilterInputStream;
.source "BaseNCodecInputStream.java"


# instance fields
.field private final baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

.field private final doEncode:Z

.field private final singleByte:[B


# direct methods
.method protected constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/codec/binary/BaseNCodec;Z)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "baseNCodec"    # Lorg/apache/commons/codec/binary/BaseNCodec;
    .param p3, "doEncode"    # Z

    .prologue
    .line 38
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 35
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    .line 39
    iput-boolean p3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->doEncode:Z

    .line 40
    iput-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    .line 41
    return-void
.end method


# virtual methods
.method public markSupported()Z
    .registers 2

    .prologue
    .line 128
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 51
    iget-object v1, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->read([BII)I

    move-result v0

    .line 52
    .local v0, "r":I
    :goto_8
    if-nez v0, :cond_11

    .line 53
    iget-object v1, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->read([BII)I

    move-result v0

    goto :goto_8

    .line 55
    :cond_11
    if-lez v0, :cond_25

    .line 56
    iget-object v1, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    aget-byte v1, v1, v2

    if-gez v1, :cond_20

    iget-object v1, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    aget-byte v1, v1, v2

    add-int/lit16 v1, v1, 0x100

    .line 58
    :goto_1f
    return v1

    .line 56
    :cond_20
    iget-object v1, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->singleByte:[B

    aget-byte v1, v1, v2

    goto :goto_1f

    .line 58
    :cond_25
    const/4 v1, -0x1

    goto :goto_1f
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

    .line 81
    if-nez p1, :cond_9

    .line 82
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 83
    :cond_9
    if-ltz p2, :cond_d

    if-gez p3, :cond_13

    .line 84
    :cond_d
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v3

    .line 85
    :cond_13
    array-length v3, p1

    if-gt p2, v3, :cond_1b

    add-int v3, p2, p3

    array-length v5, p1

    if-le v3, v5, :cond_21

    .line 86
    :cond_1b
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v3

    .line 87
    :cond_21
    if-nez p3, :cond_25

    move v2, v4

    .line 119
    :cond_24
    return v2

    .line 90
    :cond_25
    const/4 v2, 0x0

    .line 107
    .local v2, "readLen":I
    :goto_26
    if-nez v2, :cond_24

    .line 108
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v3}, Lorg/apache/commons/codec/binary/BaseNCodec;->hasData()Z

    move-result v3

    if-nez v3, :cond_47

    .line 109
    iget-boolean v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->doEncode:Z

    if-eqz v3, :cond_4e

    const/16 v3, 0x1000

    :goto_36
    new-array v0, v3, [B

    .line 110
    .local v0, "buf":[B
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 111
    .local v1, "c":I
    iget-boolean v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->doEncode:Z

    if-eqz v3, :cond_51

    .line 112
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v3, v0, v4, v1}, Lorg/apache/commons/codec/binary/BaseNCodec;->encode([BII)V

    .line 117
    .end local v0    # "buf":[B
    .end local v1    # "c":I
    :cond_47
    :goto_47
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v3, p1, p2, p3}, Lorg/apache/commons/codec/binary/BaseNCodec;->readResults([BII)I

    move-result v2

    goto :goto_26

    .line 109
    :cond_4e
    const/16 v3, 0x2000

    goto :goto_36

    .line 114
    .restart local v0    # "buf":[B
    .restart local v1    # "c":I
    :cond_51
    iget-object v3, p0, Lorg/apache/commons/codec/binary/BaseNCodecInputStream;->baseNCodec:Lorg/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v3, v0, v4, v1}, Lorg/apache/commons/codec/binary/BaseNCodec;->decode([BII)V

    goto :goto_47
.end method
