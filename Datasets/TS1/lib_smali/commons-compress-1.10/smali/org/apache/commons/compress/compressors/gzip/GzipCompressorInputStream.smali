.class public Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "GzipCompressorInputStream.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final FCOMMENT:I = 0x10

.field private static final FEXTRA:I = 0x4

.field private static final FHCRC:I = 0x2

.field private static final FNAME:I = 0x8

.field private static final FRESERVED:I = 0xe0


# instance fields
.field private final buf:[B

.field private bufUsed:I

.field private final crc:Ljava/util/zip/CRC32;

.field private final decompressConcatenated:Z

.field private endReached:Z

.field private final in:Ljava/io/InputStream;

.field private inf:Ljava/util/zip/Inflater;

.field private final oneByte:[B

.field private final parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    const-class v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 101
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .registers 6
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "decompressConcatenated"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 125
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 66
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    .line 69
    iput v2, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    .line 72
    new-instance v0, Ljava/util/zip/Inflater;

    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    .line 75
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    .line 78
    iput-boolean v2, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->endReached:Z

    .line 81
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->oneByte:[B

    .line 83
    new-instance v0, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    .line 128
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 129
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    .line 134
    :goto_30
    iput-boolean p2, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->decompressConcatenated:Z

    .line 135
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->init(Z)Z

    .line 136
    return-void

    .line 131
    :cond_36
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    goto :goto_30
.end method

.method private init(Z)Z
    .registers 15
    .param p1, "isFirstMember"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 149
    sget-boolean v8, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->$assertionsDisabled:Z

    if-nez v8, :cond_11

    if-nez p1, :cond_11

    iget-boolean v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->decompressConcatenated:Z

    if-nez v8, :cond_11

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 152
    :cond_11
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 153
    .local v2, "magic0":I
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 157
    .local v3, "magic1":I
    const/4 v8, -0x1

    if-ne v2, v8, :cond_24

    if-nez p1, :cond_24

    .line 158
    const/4 v7, 0x0

    .line 233
    :goto_23
    return v7

    .line 161
    :cond_24
    const/16 v8, 0x1f

    if-ne v2, v8, :cond_2c

    const/16 v8, 0x8b

    if-eq v3, v8, :cond_39

    .line 162
    :cond_2c
    new-instance v8, Ljava/io/IOException;

    if-eqz p1, :cond_36

    const-string v7, "Input is not in the .gz format"

    :goto_32
    invoke-direct {v8, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_36
    const-string v7, "Garbage after a valid .gz stream"

    goto :goto_32

    .line 168
    :cond_39
    new-instance v1, Ljava/io/DataInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-direct {v1, v8}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 169
    .local v1, "inData":Ljava/io/DataInputStream;
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v4

    .line 170
    .local v4, "method":I
    const/16 v8, 0x8

    if-eq v4, v8, :cond_67

    .line 171
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unsupported compression method "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " in the .gz header"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 175
    :cond_67
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    .line 176
    .local v0, "flg":I
    and-int/lit16 v8, v0, 0xe0

    if-eqz v8, :cond_77

    .line 177
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Reserved flags are set in the .gz header"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 181
    :cond_77
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->readLittleEndianInt(Ljava/io/DataInputStream;)J

    move-result-wide v9

    const-wide/16 v11, 0x3e8

    mul-long/2addr v9, v11

    invoke-virtual {v8, v9, v10}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->setModificationTime(J)V

    .line 182
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v8

    packed-switch v8, :pswitch_data_f6

    .line 193
    :goto_8a
    :pswitch_8a
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v9

    invoke-virtual {v8, v9}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->setOperatingSystem(I)V

    .line 196
    and-int/lit8 v8, v0, 0x4

    if-eqz v8, :cond_ba

    .line 197
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v5

    .line 198
    .local v5, "xlen":I
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v8

    shl-int/lit8 v8, v8, 0x8

    or-int/2addr v5, v8

    move v6, v5

    .line 203
    .end local v5    # "xlen":I
    .local v6, "xlen":I
    :goto_a3
    add-int/lit8 v5, v6, -0x1

    .end local v6    # "xlen":I
    .restart local v5    # "xlen":I
    if-lez v6, :cond_ba

    .line 204
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move v6, v5

    .end local v5    # "xlen":I
    .restart local v6    # "xlen":I
    goto :goto_a3

    .line 184
    .end local v6    # "xlen":I
    :pswitch_ac
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    const/16 v9, 0x9

    invoke-virtual {v8, v9}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->setCompressionLevel(I)V

    goto :goto_8a

    .line 187
    :pswitch_b4
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    invoke-virtual {v8, v7}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->setCompressionLevel(I)V

    goto :goto_8a

    .line 209
    :cond_ba
    and-int/lit8 v8, v0, 0x8

    if-eqz v8, :cond_ce

    .line 210
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    new-instance v9, Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->readToNull(Ljava/io/DataInputStream;)[B

    move-result-object v10

    const-string v11, "ISO-8859-1"

    invoke-direct {v9, v10, v11}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v8, v9}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->setFilename(Ljava/lang/String;)V

    .line 215
    :cond_ce
    and-int/lit8 v8, v0, 0x10

    if-eqz v8, :cond_e2

    .line 216
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    new-instance v9, Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->readToNull(Ljava/io/DataInputStream;)[B

    move-result-object v10

    const-string v11, "ISO-8859-1"

    invoke-direct {v9, v10, v11}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v8, v9}, Lorg/apache/commons/compress/compressors/gzip/GzipParameters;->setComment(Ljava/lang/String;)V

    .line 225
    :cond_e2
    and-int/lit8 v8, v0, 0x2

    if-eqz v8, :cond_e9

    .line 226
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readShort()S

    .line 230
    :cond_e9
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v8}, Ljava/util/zip/Inflater;->reset()V

    .line 231
    iget-object v8, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v8}, Ljava/util/zip/CRC32;->reset()V

    goto/16 :goto_23

    .line 182
    nop

    :pswitch_data_f6
    .packed-switch 0x2
        :pswitch_ac
        :pswitch_8a
        :pswitch_b4
    .end packed-switch
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 354
    const/4 v2, 0x2

    if-ge p1, v2, :cond_6

    .line 366
    :cond_5
    :goto_5
    return v0

    .line 358
    :cond_6
    aget-byte v2, p0, v0

    const/16 v3, 0x1f

    if-ne v2, v3, :cond_5

    .line 362
    aget-byte v2, p0, v1

    const/16 v3, -0x75

    if-ne v2, v3, :cond_5

    move v0, v1

    .line 366
    goto :goto_5
.end method

.method private readLittleEndianInt(Ljava/io/DataInputStream;)J
    .registers 7
    .param p1, "inData"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    int-to-long v0, v0

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private readToNull(Ljava/io/DataInputStream;)[B
    .registers 5
    .param p1, "inData"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 238
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    const/4 v0, 0x0

    .line 239
    .local v0, "b":I
    :goto_6
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-eqz v0, :cond_10

    .line 240
    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_6

    .line 242
    :cond_10
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 376
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    if-eqz v0, :cond_c

    .line 377
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 378
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    .line 381
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_17

    .line 382
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 384
    :cond_17
    return-void
.end method

.method public getMetaData()Lorg/apache/commons/compress/compressors/gzip/GzipParameters;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->parameters:Lorg/apache/commons/compress/compressors/gzip/GzipParameters;

    return-object v0
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

    .line 254
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->oneByte:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->oneByte:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 20
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->endReached:Z

    if-eqz v12, :cond_8

    .line 265
    const/4 v10, -0x1

    .line 340
    :cond_7
    :goto_7
    return v10

    .line 268
    :cond_8
    const/4 v10, 0x0

    .line 270
    .local v10, "size":I
    :cond_9
    if-lez p3, :cond_7

    .line 271
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v12}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v12

    if-eqz v12, :cond_4e

    .line 274
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    array-length v13, v13

    invoke-virtual {v12, v13}, Ljava/io/InputStream;->mark(I)V

    .line 276
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    invoke-virtual {v12, v13}, Ljava/io/InputStream;->read([B)I

    move-result v12

    move-object/from16 v0, p0

    iput v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    .line 277
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    const/4 v13, -0x1

    if-ne v12, v13, :cond_3e

    .line 278
    new-instance v12, Ljava/io/EOFException;

    invoke-direct {v12}, Ljava/io/EOFException;-><init>()V

    throw v12

    .line 281
    :cond_3e
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->buf:[B

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    invoke-virtual {v12, v13, v14, v15}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 286
    :cond_4e
    :try_start_4e
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v12, v0, v1, v2}, Ljava/util/zip/Inflater;->inflate([BII)I
    :try_end_5b
    .catch Ljava/util/zip/DataFormatException; {:try_start_4e .. :try_end_5b} :catch_a4

    move-result v9

    .line 291
    .local v9, "ret":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v12, v0, v1, v9}, Ljava/util/zip/CRC32;->update([BII)V

    .line 292
    add-int p2, p2, v9

    .line 293
    sub-int p3, p3, v9

    .line 294
    add-int/2addr v10, v9

    .line 295
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->count(I)V

    .line 297
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v12}, Ljava/util/zip/Inflater;->finished()Z

    move-result v12

    if-eqz v12, :cond_9

    .line 303
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v12}, Ljava/io/InputStream;->reset()V

    .line 305
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v13}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v13

    sub-int v11, v12, v13

    .line 306
    .local v11, "skipAmount":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    int-to-long v13, v11

    invoke-virtual {v12, v13, v14}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v12

    int-to-long v14, v11

    cmp-long v12, v12, v14

    if-eqz v12, :cond_ad

    .line 307
    new-instance v12, Ljava/io/IOException;

    invoke-direct {v12}, Ljava/io/IOException;-><init>()V

    throw v12

    .line 287
    .end local v9    # "ret":I
    .end local v11    # "skipAmount":I
    :catch_a4
    move-exception v5

    .line 288
    .local v5, "e":Ljava/util/zip/DataFormatException;
    new-instance v12, Ljava/io/IOException;

    const-string v13, "Gzip-compressed data is corrupt"

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 310
    .end local v5    # "e":Ljava/util/zip/DataFormatException;
    .restart local v9    # "ret":I
    .restart local v11    # "skipAmount":I
    :cond_ad
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->bufUsed:I

    .line 312
    new-instance v6, Ljava/io/DataInputStream;

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->in:Ljava/io/InputStream;

    invoke-direct {v6, v12}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 315
    .local v6, "inData":Ljava/io/DataInputStream;
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->readLittleEndianInt(Ljava/io/DataInputStream;)J

    move-result-wide v3

    .line 317
    .local v3, "crcStored":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v12}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v12

    cmp-long v12, v3, v12

    if-eqz v12, :cond_d5

    .line 318
    new-instance v12, Ljava/io/IOException;

    const-string v13, "Gzip-compressed data is corrupt (CRC32 error)"

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 323
    :cond_d5
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->readLittleEndianInt(Ljava/io/DataInputStream;)J

    move-result-wide v7

    .line 325
    .local v7, "isize":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v12}, Ljava/util/zip/Inflater;->getBytesWritten()J

    move-result-wide v12

    const-wide v14, 0xffffffffL

    and-long/2addr v12, v14

    cmp-long v12, v7, v12

    if-eqz v12, :cond_f5

    .line 326
    new-instance v12, Ljava/io/IOException;

    const-string v13, "Gzip-compressed data is corrupt(uncompressed size mismatch)"

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 331
    :cond_f5
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->decompressConcatenated:Z

    if-eqz v12, :cond_104

    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->init(Z)Z

    move-result v12

    if-nez v12, :cond_9

    .line 332
    :cond_104
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v12}, Ljava/util/zip/Inflater;->end()V

    .line 333
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->inf:Ljava/util/zip/Inflater;

    .line 334
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->endReached:Z

    .line 335
    if-nez v10, :cond_7

    const/4 v10, -0x1

    goto/16 :goto_7
.end method
