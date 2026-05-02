.class public Lorg/spongycastle/crypto/modes/OCBBlockCipher;
.super Ljava/lang/Object;
.source "OCBBlockCipher.java"

# interfaces
.implements Lorg/spongycastle/crypto/modes/AEADBlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x10


# instance fields
.field private Checksum:[B

.field private KtopInput:[B

.field private L:Ljava/util/Vector;

.field private L_Asterisk:[B

.field private L_Dollar:[B

.field private OffsetHASH:[B

.field private OffsetMAIN:[B

.field private OffsetMAIN_0:[B

.field private Stretch:[B

.field private Sum:[B

.field private forEncryption:Z

.field private hashBlock:[B

.field private hashBlockCount:J

.field private hashBlockPos:I

.field private hashCipher:Lorg/spongycastle/crypto/BlockCipher;

.field private initialAssociatedText:[B

.field private macBlock:[B

.field private macSize:I

.field private mainBlock:[B

.field private mainBlockCount:J

.field private mainBlockPos:I

.field private mainCipher:Lorg/spongycastle/crypto/BlockCipher;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 5
    .param p1, "hashCipher"    # Lorg/spongycastle/crypto/BlockCipher;
    .param p2, "mainCipher"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    const/16 v1, 0x10

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    .line 54
    const/16 v0, 0x18

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    .line 55
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    .line 65
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    .line 73
    if-nez p1, :cond_20

    .line 75
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'hashCipher\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_20
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    if-eq v0, v1, :cond_2e

    .line 79
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'hashCipher\' must have a block size of 16"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_2e
    if-nez p2, :cond_38

    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'mainCipher\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_38
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    if-eq v0, v1, :cond_46

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'mainCipher\' must have a block size of 16"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_46
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5c

    .line 94
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'hashCipher\' and \'mainCipher\' must be the same algorithm"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_5c
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 99
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 100
    return-void
.end method

.method protected static OCB_double([B)[B
    .registers 7
    .param p0, "block"    # [B

    .prologue
    .line 542
    const/16 v2, 0x10

    new-array v1, v2, [B

    .line 543
    .local v1, "result":[B
    invoke-static {p0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->shiftLeft([B[B)I

    move-result v0

    .line 548
    .local v0, "carry":I
    const/16 v2, 0xf

    aget-byte v3, v1, v2

    const/16 v4, 0x87

    rsub-int/lit8 v5, v0, 0x1

    shl-int/lit8 v5, v5, 0x3

    ushr-int/2addr v4, v5

    xor-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 550
    return-object v1
.end method

.method protected static OCB_extend([BI)V
    .registers 3
    .param p0, "block"    # [B
    .param p1, "pos"    # I

    .prologue
    .line 555
    const/16 v0, -0x80

    aput-byte v0, p0, p1

    .line 556
    :goto_4
    add-int/lit8 p1, p1, 0x1

    const/16 v0, 0x10

    if-ge p1, v0, :cond_e

    .line 558
    const/4 v0, 0x0

    aput-byte v0, p0, p1

    goto :goto_4

    .line 560
    :cond_e
    return-void
.end method

.method protected static OCB_ntz(J)I
    .registers 7
    .param p0, "x"    # J

    .prologue
    const-wide/16 v3, 0x0

    .line 564
    cmp-long v1, p0, v3

    if-nez v1, :cond_9

    .line 566
    const/16 v0, 0x40

    .line 575
    :cond_8
    return v0

    .line 569
    :cond_9
    const/4 v0, 0x0

    .line 570
    .local v0, "n":I
    :goto_a
    const-wide/16 v1, 0x1

    and-long/2addr v1, p0

    cmp-long v1, v1, v3

    if-nez v1, :cond_8

    .line 572
    add-int/lit8 v0, v0, 0x1

    .line 573
    const/4 v1, 0x1

    ushr-long/2addr p0, v1

    goto :goto_a
.end method

.method protected static shiftLeft([B[B)I
    .registers 6
    .param p0, "block"    # [B
    .param p1, "output"    # [B

    .prologue
    .line 580
    const/16 v2, 0x10

    .line 581
    .local v2, "i":I
    const/4 v1, 0x0

    .line 582
    .local v1, "bit":I
    :goto_3
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_16

    .line 584
    aget-byte v3, p0, v2

    and-int/lit16 v0, v3, 0xff

    .line 585
    .local v0, "b":I
    shl-int/lit8 v3, v0, 0x1

    or-int/2addr v3, v1

    int-to-byte v3, v3

    aput-byte v3, p1, v2

    .line 586
    ushr-int/lit8 v3, v0, 0x7

    and-int/lit8 v1, v3, 0x1

    .line 587
    goto :goto_3

    .line 588
    .end local v0    # "b":I
    :cond_16
    return v1
.end method

.method protected static xor([B[B)V
    .registers 5
    .param p0, "block"    # [B
    .param p1, "val"    # [B

    .prologue
    .line 593
    const/16 v0, 0xf

    .local v0, "i":I
    :goto_2
    if-ltz v0, :cond_f

    .line 595
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 593
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 597
    :cond_f
    return-void
.end method


# virtual methods
.method protected clear([B)V
    .registers 3
    .param p1, "bs"    # [B

    .prologue
    .line 445
    if-eqz p1, :cond_6

    .line 447
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 449
    :cond_6
    return-void
.end method

.method public doFinal([BI)I
    .registers 10
    .param p1, "output"    # [B
    .param p2, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 346
    const/4 v2, 0x0

    .line 347
    .local v2, "tag":[B
    iget-boolean v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-nez v3, :cond_28

    .line 349
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    if-ge v3, v4, :cond_14

    .line 351
    new-instance v3, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v4, "data too short"

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 353
    :cond_14
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    sub-int/2addr v3, v4

    iput v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 354
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    new-array v2, v3, [B

    .line 355
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    iget v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    invoke-static {v3, v4, v2, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 361
    :cond_28
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    if-lez v3, :cond_38

    .line 363
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_extend([BI)V

    .line 364
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    invoke-virtual {p0, v3}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->updateHASH([B)V

    .line 370
    :cond_38
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    if-lez v3, :cond_8c

    .line 372
    iget-boolean v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-eqz v3, :cond_4e

    .line 374
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_extend([BI)V

    .line 375
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 378
    :cond_4e
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 380
    const/16 v3, 0x10

    new-array v0, v3, [B

    .line 381
    .local v0, "Pad":[B
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    invoke-interface {v3, v4, v6, v0, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 383
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-static {v3, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 385
    array-length v3, p1

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    add-int/2addr v4, p2

    if-ge v3, v4, :cond_73

    .line 387
    new-instance v3, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v4, "Output buffer too short"

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 389
    :cond_73
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    invoke-static {v3, v6, p1, p2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 391
    iget-boolean v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-nez v3, :cond_8c

    .line 393
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_extend([BI)V

    .line 394
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 401
    .end local v0    # "Pad":[B
    :cond_8c
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 402
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Dollar:[B

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 403
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    invoke-interface {v3, v4, v6, v5, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 404
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 406
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    new-array v3, v3, [B

    iput-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 407
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    iget v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    invoke-static {v3, v6, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 412
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 414
    .local v1, "resultLen":I
    iget-boolean v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-eqz v3, :cond_df

    .line 416
    array-length v3, p1

    add-int v4, p2, v1

    iget v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    add-int/2addr v4, v5

    if-ge v3, v4, :cond_cf

    .line 418
    new-instance v3, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v4, "Output buffer too short"

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 421
    :cond_cf
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    add-int v4, p2, v1

    iget v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    invoke-static {v3, v6, p1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 422
    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    add-int/2addr v1, v3

    .line 433
    :cond_db
    invoke-virtual {p0, v6}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->reset(Z)V

    .line 435
    return v1

    .line 427
    :cond_df
    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    invoke-static {v3, v2}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v3

    if-nez v3, :cond_db

    .line 429
    new-instance v3, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v4, "mac check in OCB failed"

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/OCB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getLSub(I)[B
    .registers 4
    .param p1, "n"    # I

    .prologue
    .line 453
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lt p1, v0, :cond_1c

    .line 455
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    invoke-static {v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_double([B)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 457
    :cond_1c
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method public getMac()[B
    .registers 2

    .prologue
    .line 257
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getOutputSize(I)I
    .registers 4
    .param p1, "len"    # I

    .prologue
    .line 262
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    add-int v0, p1, v1

    .line 263
    .local v0, "totalData":I
    iget-boolean v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-eqz v1, :cond_c

    .line 265
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    add-int/2addr v1, v0

    .line 267
    :goto_b
    return v1

    :cond_c
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    if-ge v0, v1, :cond_12

    const/4 v1, 0x0

    goto :goto_b

    :cond_12
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    sub-int v1, v0, v1

    goto :goto_b
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    return-object v0
.end method

.method public getUpdateOutputSize(I)I
    .registers 4
    .param p1, "len"    # I

    .prologue
    .line 272
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    add-int v0, p1, v1

    .line 273
    .local v0, "totalData":I
    iget-boolean v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-nez v1, :cond_11

    .line 275
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    if-ge v0, v1, :cond_e

    .line 277
    const/4 v1, 0x0

    .line 281
    :goto_d
    return v1

    .line 279
    :cond_e
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    sub-int/2addr v0, v1

    .line 281
    :cond_11
    rem-int/lit8 v1, v0, 0x10

    sub-int v1, v0, v1

    goto :goto_d
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 22
    .param p1, "forEncryption"    # Z
    .param p2, "parameters"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 115
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 116
    .local v12, "oldForEncryption":Z
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    .line 117
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 122
    move-object/from16 v0, p2

    instance-of v14, v0, Lorg/spongycastle/crypto/params/AEADParameters;

    if-eqz v14, :cond_7c

    move-object/from16 v3, p2

    .line 124
    check-cast v3, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 126
    .local v3, "aeadParameters":Lorg/spongycastle/crypto/params/AEADParameters;
    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/AEADParameters;->getNonce()[B

    move-result-object v2

    .line 127
    .local v2, "N":[B
    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/AEADParameters;->getAssociatedText()[B

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    .line 129
    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/AEADParameters;->getMacSize()I

    move-result v11

    .line 130
    .local v11, "macSizeBits":I
    const/16 v14, 0x40

    if-lt v11, v14, :cond_35

    const/16 v14, 0x80

    if-gt v11, v14, :cond_35

    rem-int/lit8 v14, v11, 0x8

    if-eqz v14, :cond_4e

    .line 132
    :cond_35
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Invalid value for MAC size: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 135
    :cond_4e
    div-int/lit8 v14, v11, 0x8

    move-object/from16 v0, p0

    iput v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 136
    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/AEADParameters;->getKey()Lorg/spongycastle/crypto/params/KeyParameter;

    move-result-object v10

    .line 152
    .end local v3    # "aeadParameters":Lorg/spongycastle/crypto/params/AEADParameters;
    .end local v11    # "macSizeBits":I
    .local v10, "keyParameter":Lorg/spongycastle/crypto/params/KeyParameter;
    :goto_58
    const/16 v14, 0x10

    new-array v14, v14, [B

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    .line 153
    if-eqz p1, :cond_a4

    const/16 v14, 0x10

    :goto_64
    new-array v14, v14, [B

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    .line 155
    if-nez v2, :cond_6f

    .line 157
    const/4 v14, 0x0

    new-array v2, v14, [B

    .line 160
    :cond_6f
    array-length v14, v2

    const/16 v15, 0xf

    if-le v14, v15, :cond_ab

    .line 162
    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "IV must be no more than 15 bytes"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 138
    .end local v2    # "N":[B
    .end local v10    # "keyParameter":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_7c
    move-object/from16 v0, p2

    instance-of v14, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v14, :cond_9c

    move-object/from16 v13, p2

    .line 140
    check-cast v13, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 142
    .local v13, "parametersWithIV":Lorg/spongycastle/crypto/params/ParametersWithIV;
    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v2

    .line 143
    .restart local v2    # "N":[B
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    .line 144
    const/16 v14, 0x10

    move-object/from16 v0, p0

    iput v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    .line 145
    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v10

    check-cast v10, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 146
    .restart local v10    # "keyParameter":Lorg/spongycastle/crypto/params/KeyParameter;
    goto :goto_58

    .line 149
    .end local v2    # "N":[B
    .end local v10    # "keyParameter":Lorg/spongycastle/crypto/params/KeyParameter;
    .end local v13    # "parametersWithIV":Lorg/spongycastle/crypto/params/ParametersWithIV;
    :cond_9c
    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "invalid parameters passed to OCB"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 153
    .restart local v2    # "N":[B
    .restart local v10    # "keyParameter":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_a4
    move-object/from16 v0, p0

    iget v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    add-int/lit8 v14, v14, 0x10

    goto :goto_64

    .line 169
    :cond_ab
    if-eqz v10, :cond_181

    .line 172
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    const/4 v15, 0x1

    invoke-interface {v14, v15, v10}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 173
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    move/from16 v0, p1

    invoke-interface {v14, v0, v10}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 174
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    .line 181
    :cond_c3
    const/16 v14, 0x10

    new-array v14, v14, [B

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    .line 182
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-interface/range {v14 .. v18}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 184
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Asterisk:[B

    invoke-static {v14}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_double([B)[B

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Dollar:[B

    .line 186
    new-instance v14, Ljava/util/Vector;

    invoke-direct {v14}, Ljava/util/Vector;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    .line 187
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L:Ljava/util/Vector;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->L_Dollar:[B

    invoke-static {v15}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_double([B)[B

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 193
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processNonce([B)I

    move-result v7

    .line 195
    .local v7, "bottom":I
    rem-int/lit8 v6, v7, 0x8

    .local v6, "bits":I
    div-int/lit8 v8, v7, 0x8

    .line 196
    .local v8, "bytes":I
    if-nez v6, :cond_18d

    .line 198
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    const/16 v16, 0x0

    const/16 v17, 0x10

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-static {v14, v8, v15, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 210
    :cond_123
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 211
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 213
    const-wide/16 v14, 0x0

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    .line 214
    const-wide/16 v14, 0x0

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    .line 216
    const/16 v14, 0x10

    new-array v14, v14, [B

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    .line 217
    const/16 v14, 0x10

    new-array v14, v14, [B

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    .line 218
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const/16 v18, 0x10

    invoke-static/range {v14 .. v18}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 219
    const/16 v14, 0x10

    new-array v14, v14, [B

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    .line 221
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    if-eqz v14, :cond_180

    .line 223
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v14, v15, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processAADBytes([BII)V

    .line 225
    :cond_180
    return-void

    .line 176
    .end local v6    # "bits":I
    .end local v7    # "bottom":I
    .end local v8    # "bytes":I
    :cond_181
    move/from16 v0, p1

    if-eq v12, v0, :cond_c3

    .line 178
    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "cannot change encrypting state without providing key."

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 202
    .restart local v6    # "bits":I
    .restart local v7    # "bottom":I
    .restart local v8    # "bytes":I
    :cond_18d
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_18e
    const/16 v14, 0x10

    if-ge v9, v14, :cond_123

    .line 204
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    aget-byte v14, v14, v8

    and-int/lit16 v4, v14, 0xff

    .line 205
    .local v4, "b1":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    add-int/lit8 v8, v8, 0x1

    aget-byte v14, v14, v8

    and-int/lit16 v5, v14, 0xff

    .line 206
    .local v5, "b2":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    shl-int v15, v4, v6

    rsub-int/lit8 v16, v6, 0x8

    ushr-int v16, v5, v16

    or-int v15, v15, v16

    int-to-byte v15, v15

    aput-byte v15, v14, v9

    .line 202
    add-int/lit8 v9, v9, 0x1

    goto :goto_18e
.end method

.method public processAADByte(B)V
    .registers 4
    .param p1, "input"    # B

    .prologue
    .line 286
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    aput-byte p1, v0, v1

    .line 287
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    array-length v1, v1

    if-ne v0, v1, :cond_14

    .line 289
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processHashBlock()V

    .line 291
    :cond_14
    return-void
.end method

.method public processAADBytes([BII)V
    .registers 8
    .param p1, "input"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 295
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p3, :cond_1e

    .line 297
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    add-int v3, p2, v0

    aget-byte v3, p1, v3

    aput-byte v3, v1, v2

    .line 298
    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    array-length v2, v2

    if-ne v1, v2, :cond_1b

    .line 300
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processHashBlock()V

    .line 295
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 303
    :cond_1e
    return-void
.end method

.method public processByte(B[BI)I
    .registers 6
    .param p1, "input"    # B
    .param p2, "output"    # [B
    .param p3, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .prologue
    .line 308
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    aput-byte p1, v0, v1

    .line 309
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    array-length v1, v1

    if-ne v0, v1, :cond_17

    .line 311
    invoke-virtual {p0, p2, p3}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processMainBlock([BI)V

    .line 312
    const/16 v0, 0x10

    .line 314
    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public processBytes([BII[BI)I
    .registers 11
    .param p1, "input"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .param p4, "output"    # [B
    .param p5, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .prologue
    .line 320
    array-length v2, p1

    add-int v3, p2, p3

    if-ge v2, v3, :cond_d

    .line 322
    new-instance v2, Lorg/spongycastle/crypto/DataLengthException;

    const-string v3, "Input buffer too short"

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 324
    :cond_d
    const/4 v1, 0x0

    .line 326
    .local v1, "resultLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, p3, :cond_30

    .line 328
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    add-int v4, p2, v0

    aget-byte v4, p1, v4

    aput-byte v4, v2, v3

    .line 329
    iget v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    iget-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    array-length v3, v3

    if-ne v2, v3, :cond_2d

    .line 331
    add-int v2, p5, v1

    invoke-virtual {p0, p4, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processMainBlock([BI)V

    .line 332
    add-int/lit8 v1, v1, 0x10

    .line 326
    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 336
    :cond_30
    return v1
.end method

.method protected processHashBlock()V
    .registers 5

    .prologue
    .line 465
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_ntz(J)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->getLSub(I)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->updateHASH([B)V

    .line 466
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 467
    return-void
.end method

.method protected processMainBlock([BI)V
    .registers 10
    .param p1, "output"    # [B
    .param p2, "outOff"    # I

    .prologue
    const/16 v6, 0x10

    const/4 v5, 0x0

    .line 471
    array-length v0, p1

    add-int/lit8 v1, p2, 0x10

    if-ge v0, v1, :cond_10

    .line 473
    new-instance v0, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v1, "Output buffer too short"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 480
    :cond_10
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-eqz v0, :cond_1d

    .line 482
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 483
    iput v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 486
    :cond_1d
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    iget-wide v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    invoke-static {v1, v2}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OCB_ntz(J)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->getLSub(I)[B

    move-result-object v1

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 488
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 489
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-interface {v0, v1, v5, v2, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 490
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 492
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-static {v0, v5, p1, p2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 494
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->forEncryption:Z

    if-nez v0, :cond_65

    .line 496
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 497
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    invoke-static {v0, v6, v1, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 498
    iget v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    iput v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 500
    :cond_65
    return-void
.end method

.method protected processNonce([B)I
    .registers 11
    .param p1, "N"    # [B

    .prologue
    const/16 v8, 0xf

    const/16 v7, 0x10

    const/4 v6, 0x0

    .line 229
    new-array v3, v7, [B

    .line 230
    .local v3, "nonce":[B
    array-length v4, v3

    array-length v5, p1

    sub-int/2addr v4, v5

    array-length v5, p1

    invoke-static {p1, v6, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 231
    iget v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macSize:I

    shl-int/lit8 v4, v4, 0x4

    int-to-byte v4, v4

    aput-byte v4, v3, v6

    .line 232
    array-length v4, p1

    rsub-int/lit8 v4, v4, 0xf

    aget-byte v5, v3, v4

    or-int/lit8 v5, v5, 0x1

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    .line 234
    aget-byte v4, v3, v8

    and-int/lit8 v1, v4, 0x3f

    .line 235
    .local v1, "bottom":I
    aget-byte v4, v3, v8

    and-int/lit16 v4, v4, 0xc0

    int-to-byte v4, v4

    aput-byte v4, v3, v8

    .line 240
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    if-eqz v4, :cond_36

    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    invoke-static {v3, v4}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v4

    if-nez v4, :cond_5c

    .line 242
    :cond_36
    new-array v0, v7, [B

    .line 243
    .local v0, "Ktop":[B
    iput-object v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    .line 244
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->KtopInput:[B

    invoke-interface {v4, v5, v6, v0, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 245
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    invoke-static {v0, v6, v4, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 246
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_47
    const/16 v4, 0x8

    if-ge v2, v4, :cond_5c

    .line 248
    iget-object v4, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Stretch:[B

    add-int/lit8 v5, v2, 0x10

    aget-byte v6, v0, v2

    add-int/lit8 v7, v2, 0x1

    aget-byte v7, v0, v7

    xor-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 246
    add-int/lit8 v2, v2, 0x1

    goto :goto_47

    .line 252
    .end local v0    # "Ktop":[B
    .end local v2    # "i":I
    :cond_5c
    return v1
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 440
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->reset(Z)V

    .line 441
    return-void
.end method

.method protected reset(Z)V
    .registers 6
    .param p1, "clearMac"    # Z

    .prologue
    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    .line 504
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 505
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainCipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 507
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 508
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlock:[B

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 510
    iput v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockPos:I

    .line 511
    iput v3, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockPos:I

    .line 513
    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlockCount:J

    .line 514
    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->mainBlockCount:J

    .line 516
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 517
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 518
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN_0:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetMAIN:[B

    const/16 v2, 0x10

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 519
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Checksum:[B

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->clear([B)V

    .line 521
    if-eqz p1, :cond_3c

    .line 523
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->macBlock:[B

    .line 526
    :cond_3c
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    if-eqz v0, :cond_48

    .line 528
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->initialAssociatedText:[B

    array-length v1, v1

    invoke-virtual {p0, v0, v3, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->processAADBytes([BII)V

    .line 530
    :cond_48
    return-void
.end method

.method protected updateHASH([B)V
    .registers 6
    .param p1, "LSub"    # [B

    .prologue
    const/4 v3, 0x0

    .line 534
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 535
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->OffsetHASH:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 536
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashCipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    invoke-interface {v0, v1, v3, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 537
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->Sum:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->hashBlock:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;->xor([B[B)V

    .line 538
    return-void
.end method
