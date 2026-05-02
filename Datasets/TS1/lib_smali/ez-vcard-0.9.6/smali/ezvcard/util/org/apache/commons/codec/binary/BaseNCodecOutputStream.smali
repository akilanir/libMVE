.class public Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;
.super Ljava/io/FilterOutputStream;
.source "BaseNCodecOutputStream.java"


# instance fields
.field private final baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

.field private final doEncode:Z

.field private final singleByte:[B


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;Z)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "basedCodec"    # Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;
    .param p3, "doEncode"    # Z

    .prologue
    .line 38
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 35
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->singleByte:[B

    .line 39
    iput-object p2, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

    .line 40
    iput-boolean p3, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->doEncode:Z

    .line 41
    return-void
.end method

.method private flush(Z)V
    .registers 7
    .param p1, "propogate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 103
    iget-object v3, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v3}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;->available()I

    move-result v0

    .line 104
    .local v0, "avail":I
    if-lez v0, :cond_18

    .line 105
    new-array v1, v0, [B

    .line 106
    .local v1, "buf":[B
    iget-object v3, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v3, v1, v4, v0}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;->readResults([BII)I

    move-result v2

    .line 107
    .local v2, "c":I
    if-lez v2, :cond_18

    .line 108
    iget-object v3, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v3, v1, v4, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 111
    .end local v1    # "buf":[B
    .end local v2    # "c":I
    :cond_18
    if-eqz p1, :cond_1f

    .line 112
    iget-object v3, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 114
    :cond_1f
    return-void
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 136
    iget-boolean v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->doEncode:Z

    if-eqz v0, :cond_16

    .line 137
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

    iget-object v1, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->singleByte:[B

    invoke-virtual {v0, v1, v3, v2}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;->encode([BII)V

    .line 141
    :goto_d
    invoke-virtual {p0}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->flush()V

    .line 142
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 143
    return-void

    .line 139
    :cond_16
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

    iget-object v1, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->singleByte:[B

    invoke-virtual {v0, v1, v3, v2}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;->decode([BII)V

    goto :goto_d
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->flush(Z)V

    .line 125
    return-void
.end method

.method public write(I)V
    .registers 5
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 53
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->singleByte:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 54
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->singleByte:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->write([BII)V

    .line 55
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    if-nez p1, :cond_8

    .line 78
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 79
    :cond_8
    if-ltz p2, :cond_c

    if-gez p3, :cond_12

    .line 80
    :cond_c
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 81
    :cond_12
    array-length v0, p1

    if-gt p2, v0, :cond_1a

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_20

    .line 82
    :cond_1a
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 83
    :cond_20
    if-lez p3, :cond_2f

    .line 84
    iget-boolean v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->doEncode:Z

    if-eqz v0, :cond_30

    .line 85
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v0, p1, p2, p3}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;->encode([BII)V

    .line 89
    :goto_2b
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->flush(Z)V

    .line 91
    :cond_2f
    return-void

    .line 87
    :cond_30
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodecOutputStream;->baseNCodec:Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;

    invoke-virtual {v0, p1, p2, p3}, Lezvcard/util/org/apache/commons/codec/binary/BaseNCodec;->decode([BII)V

    goto :goto_2b
.end method
