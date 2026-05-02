.class public Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;
.super Lorg/apache/commons/compress/compressors/CompressorInputStream;
.source "BZip2CompressorInputStream.java"

# interfaces
.implements Lorg/apache/commons/compress/compressors/bzip2/BZip2Constants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    }
.end annotation


# static fields
.field private static final EOF:I = 0x0

.field private static final NO_RAND_PART_A_STATE:I = 0x5

.field private static final NO_RAND_PART_B_STATE:I = 0x6

.field private static final NO_RAND_PART_C_STATE:I = 0x7

.field private static final RAND_PART_A_STATE:I = 0x2

.field private static final RAND_PART_B_STATE:I = 0x3

.field private static final RAND_PART_C_STATE:I = 0x4

.field private static final START_BLOCK_STATE:I = 0x1


# instance fields
.field private blockRandomised:Z

.field private blockSize100k:I

.field private bsBuff:I

.field private bsLive:I

.field private computedBlockCRC:I

.field private computedCombinedCRC:I

.field private final crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

.field private currentState:I

.field private data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

.field private final decompressConcatenated:Z

.field private in:Ljava/io/InputStream;

.field private last:I

.field private nInUse:I

.field private origPtr:I

.field private storedBlockCRC:I

.field private storedCombinedCRC:I

.field private su_ch2:I

.field private su_chPrev:I

.field private su_count:I

.field private su_i2:I

.field private su_j2:I

.field private su_rNToGo:I

.field private su_rTPos:I

.field private su_tPos:I

.field private su_z:C


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "decompressConcatenated"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 129
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/CompressorInputStream;-><init>()V

    .line 60
    new-instance v0, Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-direct {v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    .line 76
    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 130
    iput-object p1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 131
    iput-boolean p2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->decompressConcatenated:Z

    .line 133
    invoke-direct {p0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->init(Z)Z

    .line 134
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->initBlock()V

    .line 135
    return-void
.end method

.method private bsGetBit()Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 395
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 396
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 398
    .local v0, "bsBuffShadow":I
    if-ge v1, v3, :cond_1f

    .line 399
    iget-object v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 401
    .local v2, "thech":I
    if-gez v2, :cond_17

    .line 402
    new-instance v3, Ljava/io/IOException;

    const-string v4, "unexpected end of stream"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 405
    :cond_17
    shl-int/lit8 v4, v0, 0x8

    or-int v0, v4, v2

    .line 406
    add-int/lit8 v1, v1, 0x8

    .line 407
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 410
    .end local v2    # "thech":I
    :cond_1f
    add-int/lit8 v4, v1, -0x1

    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 411
    add-int/lit8 v4, v1, -0x1

    shr-int v4, v0, v4

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_2c

    :goto_2b
    return v3

    :cond_2c
    const/4 v3, 0x0

    goto :goto_2b
.end method

.method private bsGetInt()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x8

    .line 419
    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method private bsGetUByte()C
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 415
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v0

    int-to-char v0, v0

    return v0
.end method

.method private bsR(I)I
    .registers 8
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 371
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 372
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 374
    .local v0, "bsBuffShadow":I
    if-ge v1, p1, :cond_20

    .line 375
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 377
    .local v2, "inShadow":Ljava/io/InputStream;
    :cond_8
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 379
    .local v3, "thech":I
    if-gez v3, :cond_16

    .line 380
    new-instance v4, Ljava/io/IOException;

    const-string v5, "unexpected end of stream"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 383
    :cond_16
    shl-int/lit8 v4, v0, 0x8

    or-int v0, v4, v3

    .line 384
    add-int/lit8 v1, v1, 0x8

    .line 385
    if-lt v1, p1, :cond_8

    .line 387
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 390
    .end local v2    # "inShadow":Ljava/io/InputStream;
    .end local v3    # "thech":I
    :cond_20
    sub-int v4, v1, p1

    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 391
    sub-int v4, v1, p1

    shr-int v4, v0, v4

    const/4 v5, 0x1

    shl-int/2addr v5, p1

    add-int/lit8 v5, v5, -0x1

    and-int/2addr v4, v5

    return v4
.end method

.method private complete()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 342
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetInt()I

    move-result v1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    .line 343
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 344
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 346
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    if-eq v1, v2, :cond_1a

    .line 347
    new-instance v0, Ljava/io/IOException;

    const-string v1, "BZip2 CRC error"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 352
    :cond_1a
    iget-boolean v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->decompressConcatenated:Z

    if-eqz v1, :cond_24

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->init(Z)Z

    move-result v1

    if-nez v1, :cond_25

    :cond_24
    const/4 v0, 0x1

    :cond_25
    return v0
.end method

.method private createHuffmanDecodingTables(II)V
    .registers 22
    .param p1, "alphaSize"    # I
    .param p2, "nGroups"    # I

    .prologue
    .line 549
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 550
    .local v10, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v12, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->temp_charArray2d:[[C

    .line 551
    .local v12, "len":[[C
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->minLens:[I

    move-object/from16 v16, v0

    .line 552
    .local v16, "minLens":[I
    iget-object v15, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->limit:[[I

    .line 553
    .local v15, "limit":[[I
    iget-object v9, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->base:[[I

    .line 554
    .local v9, "base":[[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->perm:[[I

    move-object/from16 v17, v0

    .line 556
    .local v17, "perm":[[I
    const/16 v18, 0x0

    .local v18, "t":I
    :goto_14
    move/from16 v0, v18

    move/from16 v1, p2

    if-ge v0, v1, :cond_40

    .line 557
    const/16 v6, 0x20

    .line 558
    .local v6, "minLen":I
    const/4 v7, 0x0

    .line 559
    .local v7, "maxLen":I
    aget-object v13, v12, v18

    .line 560
    .local v13, "len_t":[C
    move/from16 v11, p1

    .local v11, "i":I
    :cond_21
    :goto_21
    add-int/lit8 v11, v11, -0x1

    if-ltz v11, :cond_2e

    .line 561
    aget-char v14, v13, v11

    .line 562
    .local v14, "lent":C
    if-le v14, v7, :cond_2a

    .line 563
    move v7, v14

    .line 565
    :cond_2a
    if-ge v14, v6, :cond_21

    .line 566
    move v6, v14

    goto :goto_21

    .line 569
    .end local v14    # "lent":C
    :cond_2e
    aget-object v2, v15, v18

    aget-object v3, v9, v18

    aget-object v4, v17, v18

    aget-object v5, v12, v18

    move/from16 v8, p1

    invoke-static/range {v2 .. v8}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->hbCreateDecodeTables([I[I[I[CIII)V

    .line 571
    aput v6, v16, v18

    .line 556
    add-int/lit8 v18, v18, 0x1

    goto :goto_14

    .line 573
    .end local v6    # "minLen":I
    .end local v7    # "maxLen":I
    .end local v11    # "i":I
    .end local v13    # "len_t":[C
    :cond_40
    return-void
.end method

.method private endBlock()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 323
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->getFinalCRC()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedBlockCRC:I

    .line 326
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedBlockCRC:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedBlockCRC:I

    if-eq v0, v1, :cond_28

    .line 329
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedCombinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 331
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedBlockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 333
    new-instance v0, Ljava/io/IOException;

    const-string v1, "BZip2 CRC error"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_28
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    shl-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    ushr-int/lit8 v1, v1, 0x1f

    or-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 338
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedBlockCRC:I

    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 339
    return-void
.end method

.method private getAndMoveToFrontDecode()V
    .registers 44
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 576
    const/16 v40, 0x18

    move-object/from16 v0, p0

    move/from16 v1, v40

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v40

    move/from16 v0, v40

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    .line 577
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->recvDecodingTables()V

    .line 579
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 580
    .local v15, "inShadow":Ljava/io/InputStream;
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 581
    .local v10, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    move-object/from16 v22, v0

    .line 582
    .local v22, "ll8":[B
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->unzftab:[I

    move-object/from16 v35, v0

    .line 583
    .local v35, "unzftab":[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selector:[B

    move-object/from16 v31, v0

    .line 584
    .local v31, "selector":[B
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->seqToUnseq:[B

    move-object/from16 v32, v0

    .line 585
    .local v32, "seqToUnseq":[B
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->getAndMoveToFrontDecode_yy:[C

    move-object/from16 v36, v0

    .line 586
    .local v36, "yy":[C
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->minLens:[I

    move-object/from16 v23, v0

    .line 587
    .local v23, "minLens":[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->limit:[[I

    move-object/from16 v19, v0

    .line 588
    .local v19, "limit":[[I
    iget-object v5, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->base:[[I

    .line 589
    .local v5, "base":[[I
    iget-object v0, v10, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->perm:[[I

    move-object/from16 v27, v0

    .line 590
    .local v27, "perm":[[I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockSize100k:I

    move/from16 v40, v0

    const v41, 0x186a0

    mul-int v20, v40, v41

    .line 597
    .local v20, "limitLast":I
    const/16 v14, 0x100

    .local v14, "i":I
    :goto_4a
    add-int/lit8 v14, v14, -0x1

    if-ltz v14, :cond_58

    .line 598
    int-to-char v0, v14

    move/from16 v40, v0

    aput-char v40, v36, v14

    .line 599
    const/16 v40, 0x0

    aput v40, v35, v14

    goto :goto_4a

    .line 602
    :cond_58
    const/4 v12, 0x0

    .line 603
    .local v12, "groupNo":I
    const/16 v13, 0x31

    .line 604
    .local v13, "groupPos":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->nInUse:I

    move/from16 v40, v0

    add-int/lit8 v11, v40, 0x1

    .line 605
    .local v11, "eob":I
    const/16 v40, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v40

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->getAndMoveToFrontDecode0(I)I

    move-result v26

    .line 606
    .local v26, "nextSym":I
    move-object/from16 v0, p0

    iget v7, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 607
    .local v7, "bsBuffShadow":I
    move-object/from16 v0, p0

    iget v8, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 608
    .local v8, "bsLiveShadow":I
    const/16 v18, -0x1

    .line 609
    .local v18, "lastShadow":I
    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 610
    .local v38, "zt":I
    aget-object v6, v5, v38

    .line 611
    .local v6, "base_zt":[I
    aget-object v21, v19, v38

    .line 612
    .local v21, "limit_zt":[I
    aget-object v28, v27, v38

    .line 613
    .local v28, "perm_zt":[I
    aget v24, v23, v38

    .line 615
    .local v24, "minLens_zt":I
    :cond_87
    :goto_87
    move/from16 v0, v26

    if-eq v0, v11, :cond_221

    .line 616
    if-eqz v26, :cond_95

    const/16 v40, 0x1

    move/from16 v0, v26

    move/from16 v1, v40

    if-ne v0, v1, :cond_153

    .line 617
    :cond_95
    const/16 v29, -0x1

    .line 619
    .local v29, "s":I
    const/16 v25, 0x1

    .line 620
    .local v25, "n":I
    :goto_99
    if-nez v26, :cond_c6

    .line 621
    add-int v29, v29, v25

    .line 628
    :goto_9d
    if-nez v13, :cond_d3

    .line 629
    const/16 v13, 0x31

    .line 630
    add-int/lit8 v12, v12, 0x1

    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 631
    aget-object v6, v5, v38

    .line 632
    aget-object v21, v19, v38

    .line 633
    aget-object v28, v27, v38

    .line 634
    aget v24, v23, v38

    .line 639
    :goto_b3
    move/from16 v37, v24

    .line 643
    .local v37, "zn":I
    :goto_b5
    move/from16 v0, v37

    if-ge v8, v0, :cond_de

    .line 644
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 645
    .local v33, "thech":I
    if-ltz v33, :cond_d6

    .line 646
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 647
    add-int/lit8 v8, v8, 0x8

    .line 648
    goto :goto_b5

    .line 622
    .end local v33    # "thech":I
    .end local v37    # "zn":I
    :cond_c6
    const/16 v40, 0x1

    move/from16 v0, v26

    move/from16 v1, v40

    if-ne v0, v1, :cond_126

    .line 623
    shl-int/lit8 v40, v25, 0x1

    add-int v29, v29, v40

    goto :goto_9d

    .line 636
    :cond_d3
    add-int/lit8 v13, v13, -0x1

    goto :goto_b3

    .line 650
    .restart local v33    # "thech":I
    .restart local v37    # "zn":I
    :cond_d6
    new-instance v40, Ljava/io/IOException;

    const-string v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 653
    .end local v33    # "thech":I
    :cond_de
    sub-int v40, v8, v37

    shr-int v40, v7, v40

    const/16 v41, 0x1

    shl-int v41, v41, v37

    add-int/lit8 v41, v41, -0x1

    and-int v39, v40, v41

    .line 655
    .local v39, "zvec":I
    sub-int v8, v8, v37

    .line 657
    :goto_ec
    aget v40, v21, v37

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_11c

    .line 658
    add-int/lit8 v37, v37, 0x1

    .line 659
    :goto_f6
    const/16 v40, 0x1

    move/from16 v0, v40

    if-ge v8, v0, :cond_111

    .line 660
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 661
    .restart local v33    # "thech":I
    if-ltz v33, :cond_109

    .line 662
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 663
    add-int/lit8 v8, v8, 0x8

    .line 664
    goto :goto_f6

    .line 666
    :cond_109
    new-instance v40, Ljava/io/IOException;

    const-string v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 670
    .end local v33    # "thech":I
    :cond_111
    add-int/lit8 v8, v8, -0x1

    .line 671
    shl-int/lit8 v40, v39, 0x1

    shr-int v41, v7, v8

    and-int/lit8 v41, v41, 0x1

    or-int v39, v40, v41

    goto :goto_ec

    .line 674
    :cond_11c
    aget v40, v6, v37

    sub-int v40, v39, v40

    aget v26, v28, v40

    .line 619
    shl-int/lit8 v25, v25, 0x1

    goto/16 :goto_99

    .line 677
    .end local v37    # "zn":I
    .end local v39    # "zvec":I
    :cond_126
    const/16 v40, 0x0

    aget-char v40, v36, v40

    aget-byte v9, v32, v40

    .line 678
    .local v9, "ch":B
    and-int/lit16 v0, v9, 0xff

    move/from16 v40, v0

    aget v41, v35, v40

    add-int/lit8 v42, v29, 0x1

    add-int v41, v41, v42

    aput v41, v35, v40

    move/from16 v30, v29

    .line 680
    .end local v29    # "s":I
    .local v30, "s":I
    :goto_13a
    add-int/lit8 v29, v30, -0x1

    .end local v30    # "s":I
    .restart local v29    # "s":I
    if-ltz v30, :cond_145

    .line 681
    add-int/lit8 v18, v18, 0x1

    aput-byte v9, v22, v18

    move/from16 v30, v29

    .end local v29    # "s":I
    .restart local v30    # "s":I
    goto :goto_13a

    .line 684
    .end local v30    # "s":I
    .restart local v29    # "s":I
    :cond_145
    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_87

    .line 685
    new-instance v40, Ljava/io/IOException;

    const-string v41, "block overrun"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 688
    .end local v9    # "ch":B
    .end local v25    # "n":I
    .end local v29    # "s":I
    :cond_153
    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_163

    .line 689
    new-instance v40, Ljava/io/IOException;

    const-string v41, "block overrun"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 692
    :cond_163
    add-int/lit8 v40, v26, -0x1

    aget-char v34, v36, v40

    .line 693
    .local v34, "tmp":C
    aget-byte v40, v32, v34

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v40, v0

    aget v41, v35, v40

    add-int/lit8 v41, v41, 0x1

    aput v41, v35, v40

    .line 694
    aget-byte v40, v32, v34

    aput-byte v40, v22, v18

    .line 701
    const/16 v40, 0x10

    move/from16 v0, v26

    move/from16 v1, v40

    if-gt v0, v1, :cond_190

    .line 702
    add-int/lit8 v16, v26, -0x1

    .local v16, "j":I
    move/from16 v17, v16

    .end local v16    # "j":I
    .local v17, "j":I
    :goto_185
    if-lez v17, :cond_1a3

    .line 703
    add-int/lit8 v16, v17, -0x1

    .end local v17    # "j":I
    .restart local v16    # "j":I
    aget-char v40, v36, v16

    aput-char v40, v36, v17

    move/from16 v17, v16

    .end local v16    # "j":I
    .restart local v17    # "j":I
    goto :goto_185

    .line 706
    .end local v17    # "j":I
    :cond_190
    const/16 v40, 0x0

    const/16 v41, 0x1

    add-int/lit8 v42, v26, -0x1

    move-object/from16 v0, v36

    move/from16 v1, v40

    move-object/from16 v2, v36

    move/from16 v3, v41

    move/from16 v4, v42

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 709
    :cond_1a3
    const/16 v40, 0x0

    aput-char v34, v36, v40

    .line 711
    if-nez v13, :cond_1d0

    .line 712
    const/16 v13, 0x31

    .line 713
    add-int/lit8 v12, v12, 0x1

    aget-byte v40, v31, v12

    move/from16 v0, v40

    and-int/lit16 v0, v0, 0xff

    move/from16 v38, v0

    .line 714
    aget-object v6, v5, v38

    .line 715
    aget-object v21, v19, v38

    .line 716
    aget-object v28, v27, v38

    .line 717
    aget v24, v23, v38

    .line 722
    :goto_1bd
    move/from16 v37, v24

    .line 726
    .restart local v37    # "zn":I
    :goto_1bf
    move/from16 v0, v37

    if-ge v8, v0, :cond_1db

    .line 727
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 728
    .restart local v33    # "thech":I
    if-ltz v33, :cond_1d3

    .line 729
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 730
    add-int/lit8 v8, v8, 0x8

    .line 731
    goto :goto_1bf

    .line 719
    .end local v33    # "thech":I
    .end local v37    # "zn":I
    :cond_1d0
    add-int/lit8 v13, v13, -0x1

    goto :goto_1bd

    .line 733
    .restart local v33    # "thech":I
    .restart local v37    # "zn":I
    :cond_1d3
    new-instance v40, Ljava/io/IOException;

    const-string v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 736
    .end local v33    # "thech":I
    :cond_1db
    sub-int v40, v8, v37

    shr-int v40, v7, v40

    const/16 v41, 0x1

    shl-int v41, v41, v37

    add-int/lit8 v41, v41, -0x1

    and-int v39, v40, v41

    .line 738
    .restart local v39    # "zvec":I
    sub-int v8, v8, v37

    .line 740
    :goto_1e9
    aget v40, v21, v37

    move/from16 v0, v39

    move/from16 v1, v40

    if-le v0, v1, :cond_219

    .line 741
    add-int/lit8 v37, v37, 0x1

    .line 742
    :goto_1f3
    const/16 v40, 0x1

    move/from16 v0, v40

    if-ge v8, v0, :cond_20e

    .line 743
    invoke-virtual {v15}, Ljava/io/InputStream;->read()I

    move-result v33

    .line 744
    .restart local v33    # "thech":I
    if-ltz v33, :cond_206

    .line 745
    shl-int/lit8 v40, v7, 0x8

    or-int v7, v40, v33

    .line 746
    add-int/lit8 v8, v8, 0x8

    .line 747
    goto :goto_1f3

    .line 749
    :cond_206
    new-instance v40, Ljava/io/IOException;

    const-string v41, "unexpected end of stream"

    invoke-direct/range {v40 .. v41}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v40

    .line 752
    .end local v33    # "thech":I
    :cond_20e
    add-int/lit8 v8, v8, -0x1

    .line 753
    shl-int/lit8 v40, v39, 0x1

    shr-int v41, v7, v8

    and-int/lit8 v41, v41, 0x1

    or-int v39, v40, v41

    goto :goto_1e9

    .line 755
    :cond_219
    aget v40, v6, v37

    sub-int v40, v39, v40

    aget v26, v28, v40

    .line 756
    goto/16 :goto_87

    .line 759
    .end local v34    # "tmp":C
    .end local v37    # "zn":I
    .end local v39    # "zvec":I
    :cond_221
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    .line 760
    move-object/from16 v0, p0

    iput v8, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 761
    move-object/from16 v0, p0

    iput v7, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 762
    return-void
.end method

.method private getAndMoveToFrontDecode0(I)I
    .registers 13
    .param p1, "groupNo"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 765
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 766
    .local v3, "inShadow":Ljava/io/InputStream;
    iget-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 767
    .local v2, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selector:[B

    aget-byte v9, v9, p1

    and-int/lit16 v7, v9, 0xff

    .line 768
    .local v7, "zt":I
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->limit:[[I

    aget-object v4, v9, v7

    .line 769
    .local v4, "limit_zt":[I
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->minLens:[I

    aget v6, v9, v7

    .line 770
    .local v6, "zn":I
    invoke-direct {p0, v6}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v8

    .line 771
    .local v8, "zvec":I
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 772
    .local v1, "bsLiveShadow":I
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 774
    .local v0, "bsBuffShadow":I
    :goto_1a
    aget v9, v4, v6

    if-le v8, v9, :cond_43

    .line 775
    add-int/lit8 v6, v6, 0x1

    .line 776
    :goto_20
    const/4 v9, 0x1

    if-ge v1, v9, :cond_38

    .line 777
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 779
    .local v5, "thech":I
    if-ltz v5, :cond_30

    .line 780
    shl-int/lit8 v9, v0, 0x8

    or-int v0, v9, v5

    .line 781
    add-int/lit8 v1, v1, 0x8

    .line 782
    goto :goto_20

    .line 784
    :cond_30
    new-instance v9, Ljava/io/IOException;

    const-string v10, "unexpected end of stream"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 787
    .end local v5    # "thech":I
    :cond_38
    add-int/lit8 v1, v1, -0x1

    .line 788
    shl-int/lit8 v9, v8, 0x1

    shr-int v10, v0, v1

    and-int/lit8 v10, v10, 0x1

    or-int v8, v9, v10

    goto :goto_1a

    .line 791
    :cond_43
    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 792
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsBuff:I

    .line 794
    iget-object v9, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->perm:[[I

    aget-object v9, v9, v7

    iget-object v10, v2, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->base:[[I

    aget-object v10, v10, v7

    aget v10, v10, v6

    sub-int v10, v8, v10

    aget v9, v9, v10

    return v9
.end method

.method private static hbCreateDecodeTables([I[I[I[CIII)V
    .registers 16
    .param p0, "limit"    # [I
    .param p1, "base"    # [I
    .param p2, "perm"    # [I
    .param p3, "length"    # [C
    .param p4, "minLen"    # I
    .param p5, "maxLen"    # I
    .param p6, "alphaSize"    # I

    .prologue
    .line 428
    move v1, p4

    .local v1, "i":I
    const/4 v4, 0x0

    .local v4, "pp":I
    :goto_2
    if-gt v1, p5, :cond_18

    .line 429
    const/4 v2, 0x0

    .local v2, "j":I
    move v5, v4

    .end local v4    # "pp":I
    .local v5, "pp":I
    :goto_6
    if-ge v2, p6, :cond_14

    .line 430
    aget-char v7, p3, v2

    if-ne v7, v1, :cond_71

    .line 431
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    aput v2, p2, v5

    .line 429
    :goto_10
    add-int/lit8 v2, v2, 0x1

    move v5, v4

    .end local v4    # "pp":I
    .restart local v5    # "pp":I
    goto :goto_6

    .line 428
    :cond_14
    add-int/lit8 v1, v1, 0x1

    move v4, v5

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    goto :goto_2

    .line 436
    .end local v2    # "j":I
    :cond_18
    const/16 v1, 0x17

    :goto_1a
    add-int/lit8 v1, v1, -0x1

    if-lez v1, :cond_25

    .line 437
    const/4 v7, 0x0

    aput v7, p1, v1

    .line 438
    const/4 v7, 0x0

    aput v7, p0, v1

    goto :goto_1a

    .line 441
    :cond_25
    const/4 v1, 0x0

    :goto_26
    if-ge v1, p6, :cond_35

    .line 442
    aget-char v7, p3, v1

    add-int/lit8 v7, v7, 0x1

    aget v8, p1, v7

    add-int/lit8 v8, v8, 0x1

    aput v8, p1, v7

    .line 441
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 445
    :cond_35
    const/4 v1, 0x1

    const/4 v7, 0x0

    aget v0, p1, v7

    .local v0, "b":I
    :goto_39
    const/16 v7, 0x17

    if-ge v1, v7, :cond_45

    .line 446
    aget v7, p1, v1

    add-int/2addr v0, v7

    .line 447
    aput v0, p1, v1

    .line 445
    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    .line 450
    :cond_45
    move v1, p4

    const/4 v6, 0x0

    .local v6, "vec":I
    aget v0, p1, v1

    :goto_49
    if-gt v1, p5, :cond_5c

    .line 451
    add-int/lit8 v7, v1, 0x1

    aget v3, p1, v7

    .line 452
    .local v3, "nb":I
    sub-int v7, v3, v0

    add-int/2addr v6, v7

    .line 453
    move v0, v3

    .line 454
    add-int/lit8 v7, v6, -0x1

    aput v7, p0, v1

    .line 455
    shl-int/lit8 v6, v6, 0x1

    .line 450
    add-int/lit8 v1, v1, 0x1

    goto :goto_49

    .line 458
    .end local v3    # "nb":I
    :cond_5c
    add-int/lit8 v1, p4, 0x1

    :goto_5e
    if-gt v1, p5, :cond_70

    .line 459
    add-int/lit8 v7, v1, -0x1

    aget v7, p0, v7

    add-int/lit8 v7, v7, 0x1

    shl-int/lit8 v7, v7, 0x1

    aget v8, p1, v1

    sub-int/2addr v7, v8

    aput v7, p1, v1

    .line 458
    add-int/lit8 v1, v1, 0x1

    goto :goto_5e

    .line 461
    :cond_70
    return-void

    .end local v0    # "b":I
    .end local v4    # "pp":I
    .end local v6    # "vec":I
    .restart local v2    # "j":I
    .restart local v5    # "pp":I
    :cond_71
    move v4, v5

    .end local v5    # "pp":I
    .restart local v4    # "pp":I
    goto :goto_10
.end method

.method private init(Z)Z
    .registers 8
    .param p1, "isFirstStream"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 232
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    if-nez v5, :cond_d

    .line 233
    new-instance v4, Ljava/io/IOException;

    const-string v5, "No InputStream"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 236
    :cond_d
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 237
    .local v1, "magic0":I
    const/4 v5, -0x1

    if-ne v1, v5, :cond_19

    if-nez p1, :cond_19

    .line 259
    :goto_18
    return v4

    .line 240
    :cond_19
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 241
    .local v2, "magic1":I
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 243
    .local v3, "magic2":I
    const/16 v5, 0x42

    if-ne v1, v5, :cond_31

    const/16 v5, 0x5a

    if-ne v2, v5, :cond_31

    const/16 v5, 0x68

    if-eq v3, v5, :cond_3e

    .line 244
    :cond_31
    new-instance v5, Ljava/io/IOException;

    if-eqz p1, :cond_3b

    const-string v4, "Stream is not in the BZip2 format"

    :goto_37
    invoke-direct {v5, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_3b
    const-string v4, "Garbage after a valid BZip2 stream"

    goto :goto_37

    .line 249
    :cond_3e
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 250
    .local v0, "blockSize":I
    const/16 v5, 0x31

    if-lt v0, v5, :cond_4c

    const/16 v5, 0x39

    if-le v0, v5, :cond_54

    .line 251
    :cond_4c
    new-instance v4, Ljava/io/IOException;

    const-string v5, "BZip2 block size is invalid"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 254
    :cond_54
    add-int/lit8 v5, v0, -0x30

    iput v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockSize100k:I

    .line 256
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsLive:I

    .line 257
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->computedCombinedCRC:I

    .line 259
    const/4 v4, 0x1

    goto :goto_18
.end method

.method private initBlock()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x59

    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 272
    :cond_4
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v0

    .line 273
    .local v0, "magic0":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v1

    .line 274
    .local v1, "magic1":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v2

    .line 275
    .local v2, "magic2":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v3

    .line 276
    .local v3, "magic3":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v4

    .line 277
    .local v4, "magic4":C
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetUByte()C

    move-result v5

    .line 280
    .local v5, "magic5":C
    const/16 v8, 0x17

    if-ne v0, v8, :cond_34

    const/16 v8, 0x72

    if-ne v1, v8, :cond_34

    const/16 v8, 0x45

    if-ne v2, v8, :cond_34

    const/16 v8, 0x38

    if-ne v3, v8, :cond_34

    const/16 v8, 0x50

    if-ne v4, v8, :cond_34

    const/16 v8, 0x90

    if-eq v5, v8, :cond_52

    .line 293
    :cond_34
    const/16 v8, 0x31

    if-ne v0, v8, :cond_48

    const/16 v8, 0x41

    if-ne v1, v8, :cond_48

    if-ne v2, v9, :cond_48

    const/16 v8, 0x26

    if-ne v3, v8, :cond_48

    const/16 v8, 0x53

    if-ne v4, v8, :cond_48

    if-eq v5, v9, :cond_59

    .line 300
    :cond_48
    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 301
    new-instance v6, Ljava/io/IOException;

    const-string v7, "bad block header"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 288
    :cond_52
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->complete()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 320
    :goto_58
    return-void

    .line 303
    :cond_59
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetInt()I

    move-result v8

    iput v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->storedBlockCRC:I

    .line 304
    invoke-direct {p0, v7}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v8

    if-ne v8, v7, :cond_66

    move v6, v7

    :cond_66
    iput-boolean v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockRandomised:Z

    .line 310
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    if-nez v6, :cond_75

    .line 311
    new-instance v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget v8, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockSize100k:I

    invoke-direct {v6, v8}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;-><init>(I)V

    iput-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 315
    :cond_75
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->getAndMoveToFrontDecode()V

    .line 317
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v6}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->initialiseCRC()V

    .line 318
    iput v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    goto :goto_58
.end method

.method private makeMaps()V
    .registers 7

    .prologue
    .line 186
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->inUse:[Z

    .line 187
    .local v1, "inUse":[Z
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v4, v5, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->seqToUnseq:[B

    .line 189
    .local v4, "seqToUnseq":[B
    const/4 v2, 0x0

    .line 191
    .local v2, "nInUseShadow":I
    const/4 v0, 0x0

    .local v0, "i":I
    move v3, v2

    .end local v2    # "nInUseShadow":I
    .local v3, "nInUseShadow":I
    :goto_b
    const/16 v5, 0x100

    if-ge v0, v5, :cond_1c

    .line 192
    aget-boolean v5, v1, v0

    if-eqz v5, :cond_1f

    .line 193
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "nInUseShadow":I
    .restart local v2    # "nInUseShadow":I
    int-to-byte v5, v0

    aput-byte v5, v4, v3

    .line 191
    :goto_18
    add-int/lit8 v0, v0, 0x1

    move v3, v2

    .end local v2    # "nInUseShadow":I
    .restart local v3    # "nInUseShadow":I
    goto :goto_b

    .line 197
    :cond_1c
    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->nInUse:I

    .line 198
    return-void

    :cond_1f
    move v2, v3

    .end local v3    # "nInUseShadow":I
    .restart local v2    # "nInUseShadow":I
    goto :goto_18
.end method

.method public static matches([BI)Z
    .registers 6
    .param p0, "signature"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1021
    const/4 v2, 0x3

    if-ge p1, v2, :cond_6

    .line 1037
    :cond_5
    :goto_5
    return v0

    .line 1025
    :cond_6
    aget-byte v2, p0, v0

    const/16 v3, 0x42

    if-ne v2, v3, :cond_5

    .line 1029
    aget-byte v2, p0, v1

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_5

    .line 1033
    const/4 v2, 0x2

    aget-byte v2, p0, v2

    const/16 v3, 0x68

    if-ne v2, v3, :cond_5

    move v0, v1

    .line 1037
    goto :goto_5
.end method

.method private read0()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    packed-switch v0, :pswitch_data_32

    .line 227
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 203
    :pswitch_b
    const/4 v0, -0x1

    .line 224
    :goto_c
    return v0

    .line 206
    :pswitch_d
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupBlock()I

    move-result v0

    goto :goto_c

    .line 209
    :pswitch_12
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 212
    :pswitch_18
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartB()I

    move-result v0

    goto :goto_c

    .line 215
    :pswitch_1d
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartC()I

    move-result v0

    goto :goto_c

    .line 218
    :pswitch_22
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 221
    :pswitch_28
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartB()I

    move-result v0

    goto :goto_c

    .line 224
    :pswitch_2d
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartC()I

    move-result v0

    goto :goto_c

    .line 201
    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_b
        :pswitch_d
        :pswitch_12
        :pswitch_18
        :pswitch_1d
        :pswitch_22
        :pswitch_28
        :pswitch_2d
    .end packed-switch
.end method

.method private recvDecodingTables()V
    .registers 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 464
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 465
    .local v4, "dataShadow":Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;
    iget-object v7, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->inUse:[Z

    .line 466
    .local v7, "inUse":[Z
    iget-object v14, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->recvDecodingTables_pos:[B

    .line 467
    .local v14, "pos":[B
    iget-object v15, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selector:[B

    .line 468
    .local v15, "selector":[B
    iget-object v0, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->selectorMtf:[B

    move-object/from16 v16, v0

    .line 470
    .local v16, "selectorMtf":[B
    const/4 v8, 0x0

    .line 473
    .local v8, "inUse16":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_10
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v5, v0, :cond_25

    .line 474
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_22

    .line 475
    const/16 v20, 0x1

    shl-int v20, v20, v5

    or-int v8, v8, v20

    .line 473
    :cond_22
    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    .line 479
    :cond_25
    const/16 v5, 0x100

    :goto_27
    add-int/lit8 v5, v5, -0x1

    if-ltz v5, :cond_30

    .line 480
    const/16 v20, 0x0

    aput-boolean v20, v7, v5

    goto :goto_27

    .line 483
    :cond_30
    const/4 v5, 0x0

    :goto_31
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v5, v0, :cond_5a

    .line 484
    const/16 v20, 0x1

    shl-int v20, v20, v5

    and-int v20, v20, v8

    if-eqz v20, :cond_57

    .line 485
    shl-int/lit8 v6, v5, 0x4

    .line 486
    .local v6, "i16":I
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_42
    const/16 v20, 0x10

    move/from16 v0, v20

    if-ge v9, v0, :cond_57

    .line 487
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_54

    .line 488
    add-int v20, v6, v9

    const/16 v21, 0x1

    aput-boolean v21, v7, v20

    .line 486
    :cond_54
    add-int/lit8 v9, v9, 0x1

    goto :goto_42

    .line 483
    .end local v6    # "i16":I
    .end local v9    # "j":I
    :cond_57
    add-int/lit8 v5, v5, 0x1

    goto :goto_31

    .line 494
    :cond_5a
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->makeMaps()V

    .line 495
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->nInUse:I

    move/from16 v20, v0

    add-int/lit8 v2, v20, 0x2

    .line 498
    .local v2, "alphaSize":I
    const/16 v20, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v12

    .line 499
    .local v12, "nGroups":I
    const/16 v20, 0xf

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v13

    .line 501
    .local v13, "nSelectors":I
    const/4 v5, 0x0

    :goto_7a
    if-ge v5, v13, :cond_8e

    .line 502
    const/4 v9, 0x0

    .line 503
    .restart local v9    # "j":I
    :goto_7d
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_86

    .line 504
    add-int/lit8 v9, v9, 0x1

    goto :goto_7d

    .line 506
    :cond_86
    int-to-byte v0, v9

    move/from16 v20, v0

    aput-byte v20, v16, v5

    .line 501
    add-int/lit8 v5, v5, 0x1

    goto :goto_7a

    .line 510
    .end local v9    # "j":I
    :cond_8e
    move/from16 v19, v12

    .local v19, "v":I
    :goto_90
    add-int/lit8 v19, v19, -0x1

    if-ltz v19, :cond_9c

    .line 511
    move/from16 v0, v19

    int-to-byte v0, v0

    move/from16 v20, v0

    aput-byte v20, v14, v19

    goto :goto_90

    .line 514
    :cond_9c
    const/4 v5, 0x0

    :goto_9d
    if-ge v5, v13, :cond_bd

    .line 515
    aget-byte v20, v16, v5

    move/from16 v0, v20

    and-int/lit16 v0, v0, 0xff

    move/from16 v19, v0

    .line 516
    aget-byte v18, v14, v19

    .line 517
    .local v18, "tmp":B
    :goto_a9
    if-lez v19, :cond_b4

    .line 519
    add-int/lit8 v20, v19, -0x1

    aget-byte v20, v14, v20

    aput-byte v20, v14, v19

    .line 520
    add-int/lit8 v19, v19, -0x1

    goto :goto_a9

    .line 522
    :cond_b4
    const/16 v20, 0x0

    aput-byte v18, v14, v20

    .line 523
    aput-byte v18, v15, v5

    .line 514
    add-int/lit8 v5, v5, 0x1

    goto :goto_9d

    .line 526
    .end local v18    # "tmp":B
    :cond_bd
    iget-object v10, v4, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->temp_charArray2d:[[C

    .line 529
    .local v10, "len":[[C
    const/16 v17, 0x0

    .local v17, "t":I
    :goto_c1
    move/from16 v0, v17

    if-ge v0, v12, :cond_f3

    .line 530
    const/16 v20, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsR(I)I

    move-result v3

    .line 531
    .local v3, "curr":I
    aget-object v11, v10, v17

    .line 532
    .local v11, "len_t":[C
    const/4 v5, 0x0

    :goto_d2
    if-ge v5, v2, :cond_f0

    .line 533
    :goto_d4
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_e8

    .line 534
    invoke-direct/range {p0 .. p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->bsGetBit()Z

    move-result v20

    if-eqz v20, :cond_e5

    const/16 v20, -0x1

    :goto_e2
    add-int v3, v3, v20

    goto :goto_d4

    :cond_e5
    const/16 v20, 0x1

    goto :goto_e2

    .line 536
    :cond_e8
    int-to-char v0, v3

    move/from16 v20, v0

    aput-char v20, v11, v5

    .line 532
    add-int/lit8 v5, v5, 0x1

    goto :goto_d2

    .line 529
    :cond_f0
    add-int/lit8 v17, v17, 0x1

    goto :goto_c1

    .line 541
    .end local v3    # "curr":I
    .end local v11    # "len_t":[C
    :cond_f3
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v12}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->createHuffmanDecodingTables(II)V

    .line 542
    return-void
.end method

.method private setupBlock()I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x100

    const/4 v9, 0x0

    .line 798
    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    if-eqz v6, :cond_b

    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    if-nez v6, :cond_d

    .line 799
    :cond_b
    const/4 v6, -0x1

    .line 831
    :goto_c
    return v6

    .line 802
    :cond_d
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->cftab:[I

    .line 803
    .local v1, "cftab":[I
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget v7, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->initTT(I)[I

    move-result-object v5

    .line 804
    .local v5, "tt":[I
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v4, v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    .line 805
    .local v4, "ll8":[B
    aput v9, v1, v9

    .line 806
    iget-object v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v6, v6, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->unzftab:[I

    const/4 v7, 0x1

    invoke-static {v6, v9, v1, v7, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 808
    const/4 v2, 0x1

    .local v2, "i":I
    aget v0, v1, v9

    .local v0, "c":I
    :goto_2c
    if-gt v2, v10, :cond_36

    .line 809
    aget v6, v1, v2

    add-int/2addr v0, v6

    .line 810
    aput v0, v1, v2

    .line 808
    add-int/lit8 v2, v2, 0x1

    goto :goto_2c

    .line 813
    :cond_36
    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    .local v3, "lastShadow":I
    :goto_39
    if-gt v2, v3, :cond_4a

    .line 814
    aget-byte v6, v4, v2

    and-int/lit16 v6, v6, 0xff

    aget v7, v1, v6

    add-int/lit8 v8, v7, 0x1

    aput v8, v1, v6

    aput v2, v5, v7

    .line 813
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 817
    :cond_4a
    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    if-ltz v6, :cond_53

    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    array-length v7, v5

    if-lt v6, v7, :cond_5b

    .line 818
    :cond_53
    new-instance v6, Ljava/io/IOException;

    const-string v7, "stream corrupted"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 821
    :cond_5b
    iget v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->origPtr:I

    aget v6, v5, v6

    iput v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 822
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 823
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 824
    iput v10, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 826
    iget-boolean v6, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->blockRandomised:Z

    if-eqz v6, :cond_74

    .line 827
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    .line 828
    iput v9, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    .line 829
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()I

    move-result v6

    goto :goto_c

    .line 831
    :cond_74
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()I

    move-result v6

    goto :goto_c
.end method

.method private setupNoRandPartA()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 860
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    if-gt v1, v2, :cond_2f

    .line 861
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    .line 862
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 863
    .local v0, "su_ch2Shadow":I
    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 864
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v1, v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v1, v1, v2

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 865
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 866
    const/4 v1, 0x6

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 867
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 873
    .end local v0    # "su_ch2Shadow":I
    :goto_2e
    return v0

    .line 870
    :cond_2f
    const/4 v1, 0x5

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 871
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->endBlock()V

    .line 872
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->initBlock()V

    .line 873
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupBlock()I

    move-result v0

    goto :goto_2e
.end method

.method private setupNoRandPartB()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 919
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    if-eq v0, v1, :cond_e

    .line 920
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 921
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()I

    move-result v0

    .line 928
    :goto_d
    return v0

    .line 922
    :cond_e
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_36

    .line 923
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    .line 924
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 925
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 926
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartC()I

    move-result v0

    goto :goto_d

    .line 928
    :cond_36
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()I

    move-result v0

    goto :goto_d
.end method

.method private setupNoRandPartC()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 933
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    iget-char v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    if-ge v1, v2, :cond_17

    .line 934
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 935
    .local v0, "su_ch2Shadow":I
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 936
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 937
    const/4 v1, 0x7

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 942
    .end local v0    # "su_ch2Shadow":I
    :goto_16
    return v0

    .line 940
    :cond_17
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 941
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 942
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupNoRandPartA()I

    move-result v0

    goto :goto_16
.end method

.method private setupRandPartA()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 835
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    iget v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->last:I

    if-gt v3, v4, :cond_59

    .line 836
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    .line 837
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v3, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v3, v3, v4

    and-int/lit16 v0, v3, 0xff

    .line 838
    .local v0, "su_ch2Shadow":I
    iget-object v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v3, v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v3, v3, v4

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 839
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-nez v3, :cond_50

    .line 840
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    invoke-static {v3}, Lorg/apache/commons/compress/compressors/bzip2/Rand;->rNums(I)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    .line 841
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    const/16 v4, 0x200

    if-ne v3, v4, :cond_3a

    .line 842
    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    .line 847
    :cond_3a
    :goto_3a
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-ne v3, v1, :cond_57

    :goto_3e
    xor-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 848
    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 849
    const/4 v1, 0x3

    iput v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 850
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    invoke-virtual {v1, v0}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 855
    .end local v0    # "su_ch2Shadow":I
    :goto_4f
    return v0

    .line 845
    .restart local v0    # "su_ch2Shadow":I
    :cond_50
    iget v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    goto :goto_3a

    :cond_57
    move v1, v2

    .line 847
    goto :goto_3e

    .line 853
    .end local v0    # "su_ch2Shadow":I
    :cond_59
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->endBlock()V

    .line 854
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->initBlock()V

    .line 855
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupBlock()I

    move-result v0

    goto :goto_4f
.end method

.method private setupRandPartB()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 878
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_chPrev:I

    if-eq v0, v1, :cond_13

    .line 879
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 880
    iput v3, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 881
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()I

    move-result v0

    .line 901
    :goto_12
    return v0

    .line 882
    :cond_13
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    if-lt v0, v5, :cond_67

    .line 883
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->ll8:[B

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    .line 884
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    iget-object v0, v0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;->tt:[I

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    aget v0, v0, v1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_tPos:I

    .line 885
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-nez v0, :cond_60

    .line 886
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    invoke-static {v0}, Lorg/apache/commons/compress/compressors/bzip2/Rand;->rNums(I)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    .line 887
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    const/16 v1, 0x200

    if-ne v0, v1, :cond_4c

    .line 888
    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rTPos:I

    .line 893
    :cond_4c
    :goto_4c
    iput v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 894
    iput v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 895
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    if-ne v0, v3, :cond_5b

    .line 896
    iget-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    xor-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    iput-char v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    .line 898
    :cond_5b
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartC()I

    move-result v0

    goto :goto_12

    .line 891
    :cond_60
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_rNToGo:I

    goto :goto_4c

    .line 900
    :cond_67
    iput v4, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 901
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()I

    move-result v0

    goto :goto_12
.end method

.method private setupRandPartC()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 906
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    iget-char v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_z:C

    if-ge v0, v1, :cond_16

    .line 907
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->crc:Lorg/apache/commons/compress/compressors/bzip2/CRC;

    iget v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/compressors/bzip2/CRC;->updateCRC(I)V

    .line 908
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_j2:I

    .line 909
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_ch2:I

    .line 914
    :goto_15
    return v0

    .line 911
    :cond_16
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->currentState:I

    .line 912
    iget v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_i2:I

    .line 913
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->su_count:I

    .line 914
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->setupRandPartA()I

    move-result v0

    goto :goto_15
.end method


# virtual methods
.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 357
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 358
    .local v0, "inShadow":Ljava/io/InputStream;
    if-eqz v0, :cond_10

    .line 360
    :try_start_5
    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    if-eq v0, v1, :cond_c

    .line 361
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catchall {:try_start_5 .. :try_end_c} :catchall_11

    .line 364
    :cond_c
    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 365
    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    .line 368
    :cond_10
    return-void

    .line 364
    :catchall_11
    move-exception v1

    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->data:Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream$Data;

    .line 365
    iput-object v2, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    throw v1
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    iget-object v1, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    if-eqz v1, :cond_11

    .line 140
    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->read0()I

    move-result v0

    .line 141
    .local v0, "r":I
    if-gez v0, :cond_f

    const/4 v1, -0x1

    :goto_b
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->count(I)V

    .line 142
    return v0

    .line 141
    :cond_f
    const/4 v1, 0x1

    goto :goto_b

    .line 144
    .end local v0    # "r":I
    :cond_11
    new-instance v1, Ljava/io/IOException;

    const-string v2, "stream closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public read([BII)I
    .registers 12
    .param p1, "dest"    # [B
    .param p2, "offs"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    if-gez p2, :cond_21

    .line 157
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "offs("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") < 0."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 159
    :cond_21
    if-gez p3, :cond_42

    .line 160
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "len("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") < 0."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 162
    :cond_42
    add-int v5, p2, p3

    array-length v6, p1

    if-le v5, v6, :cond_7b

    .line 163
    new-instance v5, Ljava/lang/IndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "offs("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") + len("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") > dest.length("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, p1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 166
    :cond_7b
    iget-object v5, p0, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->in:Ljava/io/InputStream;

    if-nez v5, :cond_87

    .line 167
    new-instance v5, Ljava/io/IOException;

    const-string v6, "stream closed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 169
    :cond_87
    if-nez p3, :cond_8b

    .line 170
    const/4 v1, 0x0

    .line 182
    :goto_8a
    return v1

    .line 173
    :cond_8b
    add-int v4, p2, p3

    .line 174
    .local v4, "hi":I
    move v2, p2

    .local v2, "destOffs":I
    move v3, v2

    .line 176
    .end local v2    # "destOffs":I
    .local v3, "destOffs":I
    :goto_8f
    if-ge v3, v4, :cond_a2

    invoke-direct {p0}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->read0()I

    move-result v0

    .local v0, "b":I
    if-ltz v0, :cond_a2

    .line 177
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "destOffs":I
    .restart local v2    # "destOffs":I
    int-to-byte v5, v0

    aput-byte v5, p1, v3

    .line 178
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->count(I)V

    move v3, v2

    .end local v2    # "destOffs":I
    .restart local v3    # "destOffs":I
    goto :goto_8f

    .line 181
    .end local v0    # "b":I
    :cond_a2
    if-ne v3, p2, :cond_a6

    const/4 v1, -0x1

    .line 182
    .local v1, "c":I
    :goto_a5
    goto :goto_8a

    .line 181
    .end local v1    # "c":I
    :cond_a6
    sub-int v1, v3, p2

    goto :goto_a5
.end method
