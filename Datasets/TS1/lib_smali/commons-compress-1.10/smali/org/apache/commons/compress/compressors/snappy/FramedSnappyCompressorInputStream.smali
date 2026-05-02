.class public Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "FramedSnappyCompressorInputStream.java"


# static fields
.field private static final COMPRESSED_CHUNK_TYPE:I = 0x0

.field static final MASK_OFFSET:J = 0xa282ead8L

.field private static final MAX_SKIPPABLE_TYPE:I = 0xfd

.field private static final MAX_UNSKIPPABLE_TYPE:I = 0x7f

.field private static final MIN_UNSKIPPABLE_TYPE:I = 0x2

.field private static final PADDING_CHUNK_TYPE:I = 0xfe

.field private static final STREAM_IDENTIFIER_TYPE:I = 0xff

.field private static final SZ_SIGNATURE:[B

.field private static final UNCOMPRESSED_CHUNK_TYPE:I = 0x1


# instance fields
.field private final checksum:Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;

.field private currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

.field private endReached:Z

.field private expectedChecksum:J

.field private final in:Ljava/io/PushbackInputStream;

.field private inUncompressedChunk:Z

.field private final oneByte:[B

.field private uncompressedBytesRemaining:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    const/16 v0, 0xa

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->SZ_SIGNATURE:[B

    return-void

    :array_a
    .array-data 1
        -0x1t
        0x6t
        0x0t
        0x0t
        0x73t
        0x4et
        0x61t
        0x50t
        0x70t
        0x59t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 77
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 64
    new-array v0, v2, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->oneByte:[B

    .line 69
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->expectedChecksum:J

    .line 70
    new-instance v0, Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->checksum:Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;

    .line 78
    new-instance v0, Ljava/io/PushbackInputStream;

    invoke-direct {v0, p1, v2}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    .line 79
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readStreamIdentifier()V

    .line 80
    return-void
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 277
    sget-object v2, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->SZ_SIGNATURE:[B

    array-length v2, v2

    if-ge p1, v2, :cond_7

    .line 287
    :goto_6
    return v1

    .line 281
    :cond_7
    move-object v0, p0

    .line 282
    .local v0, "shortenedSig":[B
    array-length v2, p0

    sget-object v3, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->SZ_SIGNATURE:[B

    array-length v3, v3

    if-le v2, v3, :cond_19

    .line 283
    sget-object v2, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->SZ_SIGNATURE:[B

    array-length v2, v2

    new-array v0, v2, [B

    .line 284
    sget-object v2, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->SZ_SIGNATURE:[B

    array-length v2, v2

    invoke-static {p0, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 287
    :cond_19
    sget-object v1, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->SZ_SIGNATURE:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_6
.end method

.method private readCrc()J
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 197
    new-array v0, v9, [B

    .line 198
    .local v0, "b":[B
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-static {v5, v0}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v4

    .line 199
    .local v4, "read":I
    invoke-virtual {p0, v4}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->count(I)V

    .line 200
    if-eq v4, v9, :cond_16

    .line 201
    new-instance v5, Ljava/io/IOException;

    const-string v6, "premature end of stream"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 203
    :cond_16
    const-wide/16 v1, 0x0

    .line 204
    .local v1, "crc":J
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_19
    if-ge v3, v9, :cond_28

    .line 205
    aget-byte v5, v0, v3

    int-to-long v5, v5

    const-wide/16 v7, 0xff

    and-long/2addr v5, v7

    mul-int/lit8 v7, v3, 0x8

    shl-long/2addr v5, v7

    or-long/2addr v1, v5

    .line 204
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 207
    :cond_28
    return-wide v1
.end method

.method private readNextBlock()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x7f

    const/4 v4, 0x1

    .line 160
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->verifyLastChecksumAndReset()V

    .line 161
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->inUncompressedChunk:Z

    .line 162
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readOneByte()I

    move-result v2

    .line 163
    .local v2, "type":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_13

    .line 164
    iput-boolean v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->endReached:Z

    .line 194
    :goto_12
    return-void

    .line 165
    :cond_13
    const/16 v3, 0xff

    if-ne v2, v3, :cond_28

    .line 166
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-virtual {v3, v2}, Ljava/io/PushbackInputStream;->unread(I)V

    .line 167
    const-wide/16 v3, 0x1

    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->pushedBackBytes(J)V

    .line 168
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readStreamIdentifier()V

    .line 169
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readNextBlock()V

    goto :goto_12

    .line 170
    :cond_28
    const/16 v3, 0xfe

    if-eq v2, v3, :cond_32

    if-le v2, v5, :cond_39

    const/16 v3, 0xfd

    if-gt v2, v3, :cond_39

    .line 172
    :cond_32
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->skipBlock()V

    .line 173
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readNextBlock()V

    goto :goto_12

    .line 174
    :cond_39
    const/4 v3, 0x2

    if-lt v2, v3, :cond_71

    if-gt v2, v5, :cond_71

    .line 175
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unskippable chunk with type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " (hex "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " detected."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 178
    :cond_71
    if-ne v2, v4, :cond_88

    .line 179
    iput-boolean v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->inUncompressedChunk:Z

    .line 180
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readSize()I

    move-result v3

    add-int/lit8 v3, v3, -0x4

    iput v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->uncompressedBytesRemaining:I

    .line 181
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readCrc()J

    move-result-wide v3

    invoke-static {v3, v4}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->unmask(J)J

    move-result-wide v3

    iput-wide v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->expectedChecksum:J

    goto :goto_12

    .line 182
    :cond_88
    if-nez v2, :cond_b4

    .line 183
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readSize()I

    move-result v3

    add-int/lit8 v3, v3, -0x4

    int-to-long v0, v3

    .line 184
    .local v0, "size":J
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readCrc()J

    move-result-wide v3

    invoke-static {v3, v4}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->unmask(J)J

    move-result-wide v3

    iput-wide v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->expectedChecksum:J

    .line 185
    new-instance v3, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    new-instance v4, Lorg/apache/commons/compress/utils/BoundedInputStream;

    iget-object v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-direct {v4, v5, v0, v1}, Lorg/apache/commons/compress/utils/BoundedInputStream;-><init>(Ljava/io/InputStream;J)V

    invoke-direct {v3, v4}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    .line 188
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-virtual {v3}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->getBytesRead()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->count(J)V

    goto/16 :goto_12

    .line 191
    .end local v0    # "size":J
    :cond_b4
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unknown chunk type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " detected."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private readOnce([BII)I
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 132
    const/4 v3, -0x1

    .line 133
    .local v3, "read":I
    iget-boolean v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->inUncompressedChunk:Z

    if-eqz v5, :cond_28

    .line 134
    iget v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->uncompressedBytesRemaining:I

    invoke-static {v5, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 135
    .local v0, "amount":I
    if-nez v0, :cond_f

    .line 156
    .end local v0    # "amount":I
    :goto_e
    return v4

    .line 138
    .restart local v0    # "amount":I
    :cond_f
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-virtual {v5, p1, p2, v0}, Ljava/io/PushbackInputStream;->read([BII)I

    move-result v3

    .line 139
    if-eq v3, v4, :cond_1f

    .line 140
    iget v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->uncompressedBytesRemaining:I

    sub-int/2addr v4, v3

    iput v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->uncompressedBytesRemaining:I

    .line 141
    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->count(I)V

    .line 153
    .end local v0    # "amount":I
    :cond_1f
    :goto_1f
    if-lez v3, :cond_26

    .line 154
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->checksum:Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;

    invoke-virtual {v4, p1, p2, v3}, Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;->update([BII)V

    :cond_26
    move v4, v3

    .line 156
    goto :goto_e

    .line 143
    :cond_28
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    if-eqz v5, :cond_1f

    .line 144
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-virtual {v5}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->getBytesRead()J

    move-result-wide v1

    .line 145
    .local v1, "before":J
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-virtual {v5, p1, p2, p3}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->read([BII)I

    move-result v3

    .line 146
    if-ne v3, v4, :cond_43

    .line 147
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->close()V

    .line 148
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    goto :goto_1f

    .line 150
    :cond_43
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-virtual {v4}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->getBytesRead()J

    move-result-wide v4

    sub-long/2addr v4, v1

    invoke-virtual {p0, v4, v5}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->count(J)V

    goto :goto_1f
.end method

.method private readOneByte()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 250
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-virtual {v2}, Ljava/io/PushbackInputStream;->read()I

    move-result v0

    .line 251
    .local v0, "b":I
    if-eq v0, v1, :cond_f

    .line 252
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->count(I)V

    .line 253
    and-int/lit16 v1, v0, 0xff

    .line 255
    :cond_f
    return v1
.end method

.method private readSize()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    const/4 v0, 0x0

    .line 220
    .local v0, "b":I
    const/4 v2, 0x0

    .line 221
    .local v2, "sz":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    const/4 v3, 0x3

    if-ge v1, v3, :cond_1d

    .line 222
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readOneByte()I

    move-result v0

    .line 223
    const/4 v3, -0x1

    if-ne v0, v3, :cond_15

    .line 224
    new-instance v3, Ljava/io/IOException;

    const-string v4, "premature end of stream"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 226
    :cond_15
    mul-int/lit8 v3, v1, 0x8

    shl-int v3, v0, v3

    or-int/2addr v2, v3

    .line 221
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 228
    :cond_1d
    return v2
.end method

.method private readStreamIdentifier()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0xa

    .line 241
    new-array v0, v3, [B

    .line 242
    .local v0, "b":[B
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-static {v2, v0}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v1

    .line 243
    .local v1, "read":I
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->count(I)V

    .line 244
    if-ne v3, v1, :cond_15

    invoke-static {v0, v3}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->matches([BI)Z

    move-result v2

    if-nez v2, :cond_1d

    .line 245
    :cond_15
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Not a framed Snappy stream"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 247
    :cond_1d
    return-void
.end method

.method private skipBlock()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readSize()I

    move-result v2

    .line 233
    .local v2, "size":I
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    int-to-long v4, v2

    invoke-static {v3, v4, v5}, Lorg/apache/commons/compress/utils/IOUtils;->skip(Ljava/io/InputStream;J)J

    move-result-wide v0

    .line 234
    .local v0, "read":J
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->count(J)V

    .line 235
    int-to-long v3, v2

    cmp-long v3, v0, v3

    if-eqz v3, :cond_1b

    .line 236
    new-instance v3, Ljava/io/IOException;

    const-string v4, "premature end of stream"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 238
    :cond_1b
    return-void
.end method

.method static unmask(J)J
    .registers 8
    .param p0, "x"    # J

    .prologue
    const-wide v4, 0xffffffffL

    .line 213
    const-wide v0, 0xa282ead8L

    sub-long/2addr p0, v0

    .line 214
    and-long/2addr p0, v4

    .line 215
    const/16 v0, 0x11

    shr-long v0, p0, v0

    const/16 v2, 0xf

    shl-long v2, p0, v2

    or-long/2addr v0, v2

    and-long/2addr v0, v4

    return-wide v0
.end method

.method private verifyLastChecksumAndReset()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    iget-wide v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->expectedChecksum:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1c

    iget-wide v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->expectedChecksum:J

    iget-object v2, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->checksum:Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;

    invoke-virtual {v2}, Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;->getValue()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1c

    .line 260
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Checksum verification failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 262
    :cond_1c
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->expectedChecksum:J

    .line 263
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->checksum:Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/snappy/PureJavaCrc32C;->reset()V

    .line 264
    return-void
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-boolean v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->inUncompressedChunk:Z

    if-eqz v0, :cond_11

    .line 116
    iget v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->uncompressedBytesRemaining:I

    iget-object v1, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-virtual {v1}, Ljava/io/PushbackInputStream;->available()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 121
    :goto_10
    return v0

    .line 118
    :cond_11
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    if-eqz v0, :cond_1c

    .line 119
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->available()I

    move-result v0

    goto :goto_10

    .line 121
    :cond_1c
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    if-eqz v0, :cond_c

    .line 92
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;->close()V

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->currentCompressedChunk:Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    .line 95
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->in:Ljava/io/PushbackInputStream;

    invoke-virtual {v0}, Ljava/io/PushbackInputStream;->close()V

    .line 96
    return-void
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v0, -0x1

    .line 85
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->oneByte:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->oneByte:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

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
    const/4 v1, -0x1

    .line 101
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readOnce([BII)I

    move-result v0

    .line 102
    .local v0, "read":I
    if-ne v0, v1, :cond_13

    .line 103
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readNextBlock()V

    .line 104
    iget-boolean v2, p0, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->endReached:Z

    if-eqz v2, :cond_f

    .line 109
    :goto_e
    return v1

    .line 107
    :cond_f
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->readOnce([BII)I

    move-result v0

    :cond_13
    move v1, v0

    .line 109
    goto :goto_e
.end method
