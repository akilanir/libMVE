.class Lorg/apache/commons/compress/archivers/dump/TapeInputStream;
.super Ljava/io/FilterInputStream;
.source "TapeInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/dump/TapeInputStream$1;
    }
.end annotation


# static fields
.field private static final recordSize:I = 0x400


# instance fields
.field private blockBuffer:[B

.field private blockSize:I

.field private bytesRead:J

.field private currBlkIdx:I

.field private isCompressed:Z

.field private readOffset:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/16 v1, 0x400

    .line 50
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 38
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    .line 40
    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    .line 42
    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->isCompressed:Z

    .line 44
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 51
    return-void
.end method

.method private readBlock(Z)Z
    .registers 15
    .param p1, "decompress"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v8, 0x0

    .line 258
    const/4 v7, 0x1

    .line 260
    .local v7, "success":Z
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    if-nez v9, :cond_f

    .line 261
    new-instance v8, Ljava/io/IOException;

    const-string v9, "input buffer is closed"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 264
    :cond_f
    iget-boolean v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->isCompressed:Z

    if-eqz v9, :cond_18

    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    const/4 v10, -0x1

    if-ne v9, v10, :cond_32

    .line 266
    :cond_18
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    invoke-direct {p0, v9, v8, v10}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v7

    .line 267
    iget-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    iget v11, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v11, v11

    add-long/2addr v9, v11

    iput-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 328
    :goto_28
    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    .line 329
    iput v8, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    move v8, v7

    .line 331
    :cond_31
    return v8

    .line 269
    :cond_32
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    const/4 v10, 0x4

    invoke-direct {p0, v9, v8, v10}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v9

    if-eqz v9, :cond_31

    .line 272
    iget-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    const-wide/16 v11, 0x4

    add-long/2addr v9, v11

    iput-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 274
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    invoke-static {v9, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v4

    .line 275
    .local v4, "h":I
    and-int/lit8 v9, v4, 0x1

    if-ne v9, v1, :cond_5f

    .line 277
    .local v1, "compressed":Z
    :goto_4c
    if-nez v1, :cond_61

    .line 279
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v10, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    invoke-direct {p0, v9, v8, v10}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v7

    .line 280
    iget-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    iget v11, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v11, v11

    add-long/2addr v9, v11

    iput-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    goto :goto_28

    .end local v1    # "compressed":Z
    :cond_5f
    move v1, v8

    .line 275
    goto :goto_4c

    .line 283
    .restart local v1    # "compressed":Z
    :cond_61
    shr-int/lit8 v9, v4, 0x1

    and-int/lit8 v3, v9, 0x7

    .line 284
    .local v3, "flags":I
    shr-int/lit8 v9, v4, 0x4

    const v10, 0xfffffff

    and-int v6, v9, v10

    .line 285
    .local v6, "length":I
    new-array v0, v6, [B

    .line 286
    .local v0, "compBuffer":[B
    invoke-direct {p0, v0, v8, v6}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    move-result v7

    .line 287
    iget-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    int-to-long v11, v6

    add-long/2addr v9, v11

    iput-wide v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    .line 289
    if-nez p1, :cond_80

    .line 291
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    invoke-static {v9, v8}, Ljava/util/Arrays;->fill([BB)V

    goto :goto_28

    .line 293
    :cond_80
    sget-object v9, Lorg/apache/commons/compress/archivers/dump/TapeInputStream$1;->$SwitchMap$org$apache$commons$compress$archivers$dump$DumpArchiveConstants$COMPRESSION_TYPE:[I

    and-int/lit8 v10, v3, 0x3

    invoke-static {v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$COMPRESSION_TYPE;->find(I)Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$COMPRESSION_TYPE;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$COMPRESSION_TYPE;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_d0

    .line 322
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;

    invoke-direct {v8}, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;-><init>()V

    throw v8

    .line 298
    :pswitch_97
    :try_start_97
    new-instance v5, Ljava/util/zip/Inflater;

    invoke-direct {v5}, Ljava/util/zip/Inflater;-><init>()V

    .line 299
    .local v5, "inflator":Ljava/util/zip/Inflater;
    const/4 v9, 0x0

    array-length v10, v0

    invoke-virtual {v5, v0, v9, v10}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 300
    iget-object v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    invoke-virtual {v5, v9}, Ljava/util/zip/Inflater;->inflate([B)I

    move-result v6

    .line 302
    iget v9, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-eq v6, v9, :cond_ba

    .line 303
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/ShortFileException;

    invoke-direct {v8}, Lorg/apache/commons/compress/archivers/dump/ShortFileException;-><init>()V

    throw v8
    :try_end_b1
    .catch Ljava/util/zip/DataFormatException; {:try_start_97 .. :try_end_b1} :catch_b1

    .line 307
    .end local v5    # "inflator":Ljava/util/zip/Inflater;
    :catch_b1
    move-exception v2

    .line 308
    .local v2, "e":Ljava/util/zip/DataFormatException;
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/DumpArchiveException;

    const-string v9, "bad data"

    invoke-direct {v8, v9, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 306
    .end local v2    # "e":Ljava/util/zip/DataFormatException;
    .restart local v5    # "inflator":Ljava/util/zip/Inflater;
    :cond_ba
    :try_start_ba
    invoke-virtual {v5}, Ljava/util/zip/Inflater;->end()V
    :try_end_bd
    .catch Ljava/util/zip/DataFormatException; {:try_start_ba .. :try_end_bd} :catch_b1

    goto/16 :goto_28

    .line 314
    .end local v5    # "inflator":Ljava/util/zip/Inflater;
    :pswitch_bf
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;

    const-string v9, "BZLIB2"

    invoke-direct {v8, v9}, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 318
    :pswitch_c7
    new-instance v8, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;

    const-string v9, "LZO"

    invoke-direct {v8, v9}, Lorg/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 293
    nop

    :pswitch_data_d0
    .packed-switch 0x1
        :pswitch_97
        :pswitch_bf
        :pswitch_c7
    .end packed-switch
.end method

.method private readFully([BII)Z
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 339
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    invoke-static {v1, p1, p2, p3}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[BII)I

    move-result v0

    .line 340
    .local v0, "count":I
    if-ge v0, p3, :cond_e

    .line 341
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/ShortFileException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/ShortFileException;-><init>()V

    throw v1

    .line 344
    :cond_e
    const/4 v1, 0x1

    return v1
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
    .line 90
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ge v0, v1, :cond_c

    .line 91
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int/2addr v0, v1

    .line 94
    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    goto :goto_b
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_f

    .line 207
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 209
    :cond_f
    return-void
.end method

.method public getBytesRead()J
    .registers 3

    .prologue
    .line 351
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->bytesRead:J

    return-wide v0
.end method

.method public peek()[B
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 221
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ne v1, v2, :cond_f

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readBlock(Z)Z

    move-result v1

    if-nez v1, :cond_f

    .line 222
    const/4 v0, 0x0

    .line 229
    :goto_e
    return-object v0

    .line 226
    :cond_f
    const/16 v1, 0x400

    new-array v0, v1, [B

    .line 227
    .local v0, "b":[B
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    const/4 v3, 0x0

    array-length v4, v0

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_e
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "all reads must be multiple of record size (1024 bytes."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    rem-int/lit16 v2, p3, 0x400

    if-eqz v2, :cond_c

    .line 118
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "all reads must be multiple of record size (1024 bytes."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 123
    :cond_c
    const/4 v0, 0x0

    .line 125
    .local v0, "bytes":I
    :goto_d
    if-ge v0, p3, :cond_1d

    .line 129
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ne v2, v3, :cond_1e

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readBlock(Z)Z

    move-result v2

    if-nez v2, :cond_1e

    .line 130
    const/4 v0, -0x1

    .line 150
    .end local v0    # "bytes":I
    :cond_1d
    return v0

    .line 133
    .restart local v0    # "bytes":I
    :cond_1e
    const/4 v1, 0x0

    .line 135
    .local v1, "n":I
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int v3, p3, v0

    add-int/2addr v2, v3

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-gt v2, v3, :cond_39

    .line 137
    sub-int v1, p3, v0

    .line 144
    :goto_2a
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 146
    add-int/2addr v0, v1

    .line 147
    add-int/2addr p2, v1

    .line 148
    goto :goto_d

    .line 140
    :cond_39
    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int v1, v2, v3

    goto :goto_2a
.end method

.method public readRecord()[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 239
    const/16 v1, 0x400

    new-array v0, v1, [B

    .line 243
    .local v0, "result":[B
    const/4 v1, -0x1

    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {p0, v0, v2, v3}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->read([BII)I

    move-result v2

    if-ne v1, v2, :cond_13

    .line 244
    new-instance v1, Lorg/apache/commons/compress/archivers/dump/ShortFileException;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/dump/ShortFileException;-><init>()V

    throw v1

    .line 247
    :cond_13
    return-object v0
.end method

.method public resetBlockSize(IZ)V
    .registers 8
    .param p1, "recsPerBlock"    # I
    .param p2, "isCompressed"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x400

    const/4 v3, 0x0

    .line 69
    iput-boolean p2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->isCompressed:Z

    .line 71
    mul-int/lit16 v1, p1, 0x400

    iput v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    .line 74
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    .line 77
    .local v0, "oldBuffer":[B
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    .line 78
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    invoke-static {v0, v3, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockBuffer:[B

    iget v2, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    add-int/lit16 v2, v2, -0x400

    invoke-direct {p0, v1, v4, v2}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readFully([BII)Z

    .line 81
    iput v3, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->currBlkIdx:I

    .line 82
    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 83
    return-void
.end method

.method public skip(J)J
    .registers 11
    .param p1, "len"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    const-wide/16 v4, 0x400

    rem-long v4, p1, v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_12

    .line 164
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "all reads must be multiple of record size (1024 bytes."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 169
    :cond_12
    const-wide/16 v0, 0x0

    .line 171
    .local v0, "bytes":J
    :goto_14
    cmp-long v4, v0, p1

    if-gez v4, :cond_30

    .line 176
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    if-ne v4, v5, :cond_33

    sub-long v4, p1, v0

    iget v6, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_31

    const/4 v4, 0x1

    :goto_28
    invoke-direct {p0, v4}, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readBlock(Z)Z

    move-result v4

    if-nez v4, :cond_33

    .line 178
    const-wide/16 v0, -0x1

    .line 196
    .end local v0    # "bytes":J
    :cond_30
    return-wide v0

    .line 176
    .restart local v0    # "bytes":J
    :cond_31
    const/4 v4, 0x0

    goto :goto_28

    .line 181
    :cond_33
    const-wide/16 v2, 0x0

    .line 183
    .local v2, "n":J
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    int-to-long v4, v4

    sub-long v6, p1, v0

    add-long/2addr v4, v6

    iget v6, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_4d

    .line 185
    sub-long v2, p1, v0

    .line 192
    :goto_44
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    int-to-long v4, v4

    add-long/2addr v4, v2

    long-to-int v4, v4

    iput v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    .line 193
    add-long/2addr v0, v2

    .line 194
    goto :goto_14

    .line 188
    :cond_4d
    iget v4, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->blockSize:I

    iget v5, p0, Lorg/apache/commons/compress/archivers/dump/TapeInputStream;->readOffset:I

    sub-int/2addr v4, v5

    int-to-long v2, v4

    goto :goto_44
.end method
