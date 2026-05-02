.class public Lorg/spongycastle/crypto/modes/GCMBlockCipher;
.super Ljava/lang/Object;
.source "GCMBlockCipher.java"

# interfaces
.implements Lorg/spongycastle/crypto/modes/AEADBlockCipher;


# static fields
.field private static final BLOCK_SIZE:I = 0x10


# instance fields
.field private H:[B

.field private J0:[B

.field private S:[B

.field private S_at:[B

.field private S_atPre:[B

.field private atBlock:[B

.field private atBlockPos:I

.field private atLength:J

.field private atLengthPre:J

.field private bufBlock:[B

.field private bufOff:I

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private counter:[B

.field private exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

.field private forEncryption:Z

.field private initialAssociatedText:[B

.field private macBlock:[B

.field private macSize:I

.field private multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

.field private nonce:[B

.field private totalLength:J


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 3
    .param p1, "c"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;)V
    .registers 5
    .param p1, "c"    # Lorg/spongycastle/crypto/BlockCipher;
    .param p2, "m"    # Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_13

    .line 62
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cipher required with a block size of 16."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_13
    if-nez p2, :cond_1a

    .line 69
    new-instance p2, Lorg/spongycastle/crypto/modes/gcm/Tables8kGCMMultiplier;

    .end local p2    # "m":Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;
    invoke-direct {p2}, Lorg/spongycastle/crypto/modes/gcm/Tables8kGCMMultiplier;-><init>()V

    .line 72
    .restart local p2    # "m":Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;
    :cond_1a
    iput-object p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 73
    iput-object p2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    .line 74
    return-void
.end method

.method private gCTRBlock([B[BI)V
    .registers 9
    .param p1, "block"    # [B
    .param p2, "out"    # [B
    .param p3, "outOff"    # I

    .prologue
    .line 480
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->getNextCounterBlock()[B

    move-result-object v0

    .line 482
    .local v0, "tmp":[B
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 483
    const/4 v1, 0x0

    const/16 v2, 0x10

    invoke-static {v0, v1, p2, p3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 485
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    iget-boolean v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    if-eqz v2, :cond_1e

    .end local v0    # "tmp":[B
    :goto_13
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 487
    iget-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 488
    return-void

    .restart local v0    # "tmp":[B
    :cond_1e
    move-object v0, p1

    .line 485
    goto :goto_13
.end method

.method private gCTRPartial([BII[BI)V
    .registers 11
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "out"    # [B
    .param p5, "outOff"    # I

    .prologue
    const/4 v3, 0x0

    .line 492
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->getNextCounterBlock()[B

    move-result-object v0

    .line 494
    .local v0, "tmp":[B
    invoke-static {v0, p1, p2, p3}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[BII)V

    .line 495
    invoke-static {v0, v3, p4, p5, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 497
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    iget-boolean v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    if-eqz v2, :cond_1b

    .end local v0    # "tmp":[B
    :goto_11
    invoke-direct {p0, v1, v0, v3, p3}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 499
    iget-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    int-to-long v3, p3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 500
    return-void

    .restart local v0    # "tmp":[B
    :cond_1b
    move-object v0, p1

    .line 497
    goto :goto_11
.end method

.method private gHASH([B[BI)V
    .registers 8
    .param p1, "Y"    # [B
    .param p2, "b"    # [B
    .param p3, "len"    # I

    .prologue
    .line 504
    const/4 v1, 0x0

    .local v1, "pos":I
    :goto_1
    if-ge v1, p3, :cond_11

    .line 506
    sub-int v2, p3, v1

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 507
    .local v0, "num":I
    invoke-direct {p0, p1, p2, v1, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 504
    add-int/lit8 v1, v1, 0x10

    goto :goto_1

    .line 509
    .end local v0    # "num":I
    :cond_11
    return-void
.end method

.method private gHASHBlock([B[B)V
    .registers 4
    .param p1, "Y"    # [B
    .param p2, "b"    # [B

    .prologue
    .line 513
    invoke-static {p1, p2}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 514
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;->multiplyH([B)V

    .line 515
    return-void
.end method

.method private gHASHPartial([B[BII)V
    .registers 6
    .param p1, "Y"    # [B
    .param p2, "b"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I

    .prologue
    .line 519
    invoke-static {p1, p2, p3, p4}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[BII)V

    .line 520
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;->multiplyH([B)V

    .line 521
    return-void
.end method

.method private getNextCounterBlock()[B
    .registers 10

    .prologue
    const/16 v8, 0xf

    const/16 v7, 0xe

    const/16 v6, 0xd

    const/16 v5, 0xc

    const/4 v4, 0x0

    .line 525
    const/4 v0, 0x1

    .line 526
    .local v0, "c":I
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    aget-byte v2, v2, v8

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v0, v2

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    int-to-byte v3, v0

    aput-byte v3, v2, v8

    ushr-int/lit8 v0, v0, 0x8

    .line 527
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    aget-byte v2, v2, v7

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v0, v2

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    int-to-byte v3, v0

    aput-byte v3, v2, v7

    ushr-int/lit8 v0, v0, 0x8

    .line 528
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    aget-byte v2, v2, v6

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v0, v2

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    int-to-byte v3, v0

    aput-byte v3, v2, v6

    ushr-int/lit8 v0, v0, 0x8

    .line 529
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    aget-byte v2, v2, v5

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v0, v2

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    int-to-byte v3, v0

    aput-byte v3, v2, v5

    .line 531
    const/16 v2, 0x10

    new-array v1, v2, [B

    .line 533
    .local v1, "tmp":[B
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    invoke-interface {v2, v3, v4, v1, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 534
    return-object v1
.end method

.method private initCipher()V
    .registers 9

    .prologue
    const-wide/16 v6, 0x0

    const/16 v5, 0x10

    const/4 v4, 0x0

    .line 248
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    cmp-long v0, v0, v6

    if-lez v0, :cond_16

    .line 250
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    invoke-static {v0, v4, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 251
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 255
    :cond_16
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    if-lez v0, :cond_2b

    .line 257
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    invoke-direct {p0, v0, v1, v4, v2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 258
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 261
    :cond_2b
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    cmp-long v0, v0, v6

    if-lez v0, :cond_38

    .line 263
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    invoke-static {v0, v4, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 265
    :cond_38
    return-void
.end method

.method private outputBlock([BI)V
    .registers 8
    .param p1, "output"    # [B
    .param p2, "offset"    # I

    .prologue
    const/4 v4, 0x0

    .line 303
    array-length v0, p1

    add-int/lit8 v1, p2, 0x10

    if-ge v0, v1, :cond_e

    .line 305
    new-instance v0, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v1, "Output buffer too short"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 307
    :cond_e
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_19

    .line 309
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initCipher()V

    .line 311
    :cond_19
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gCTRBlock([B[BI)V

    .line 312
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    if-eqz v0, :cond_25

    .line 314
    iput v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 321
    :goto_24
    return-void

    .line 318
    :cond_25
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    const/16 v1, 0x10

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    iget v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    invoke-static {v0, v1, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 319
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    iput v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    goto :goto_24
.end method

.method private reset(Z)V
    .registers 7
    .param p1, "clearMac"    # Z

    .prologue
    const-wide/16 v3, 0x0

    const/16 v1, 0x10

    const/4 v2, 0x0

    .line 449
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 451
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 452
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 453
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 454
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 455
    iput v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 456
    iput-wide v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 457
    iput-wide v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 458
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    .line 459
    iput v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 460
    iput-wide v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 462
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    if-eqz v0, :cond_35

    .line 464
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    invoke-static {v0, v2}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 467
    :cond_35
    if-eqz p1, :cond_3a

    .line 469
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 472
    :cond_3a
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    if-eqz v0, :cond_46

    .line 474
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    array-length v1, v1

    invoke-virtual {p0, v0, v2, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->processAADBytes([BII)V

    .line 476
    :cond_46
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 16
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    .line 326
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-nez v0, :cond_b

    .line 328
    invoke-direct {p0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initCipher()V

    .line 331
    :cond_b
    iget v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 333
    .local v3, "extra":I
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    if-eqz v0, :cond_21

    .line 335
    array-length v0, p1

    add-int v1, p2, v3

    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_3d

    .line 337
    new-instance v0, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v1, "Output buffer too short"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 342
    :cond_21
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    if-ge v3, v0, :cond_2d

    .line 344
    new-instance v0, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v1, "data too short"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_2d
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    sub-int/2addr v3, v0

    .line 348
    array-length v0, p1

    add-int v1, p2, v3

    if-ge v0, v1, :cond_3d

    .line 350
    new-instance v0, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v1, "Output buffer too short"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 354
    :cond_3d
    if-lez v3, :cond_48

    .line 356
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    const/4 v2, 0x0

    move-object v0, p0

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gCTRPartial([BII[BI)V

    .line 359
    :cond_48
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    int-to-long v4, v2

    add-long/2addr v0, v4

    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 361
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    iget-wide v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    cmp-long v0, v0, v4

    if-lez v0, :cond_a7

    .line 371
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    if-lez v0, :cond_66

    .line 373
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    const/4 v2, 0x0

    iget v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    invoke-direct {p0, v0, v1, v2, v4}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHPartial([B[BII)V

    .line 377
    :cond_66
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-lez v0, :cond_75

    .line 379
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 383
    :cond_75
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    const-wide/16 v4, 0x8

    mul-long/2addr v0, v4

    const-wide/16 v4, 0x7f

    add-long/2addr v0, v4

    const/4 v2, 0x7

    ushr-long v8, v0, v2

    .line 386
    .local v8, "c":J
    const/16 v0, 0x10

    new-array v6, v0, [B

    .line 387
    .local v6, "H_c":[B
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    if-nez v0, :cond_96

    .line 389
    new-instance v0, Lorg/spongycastle/crypto/modes/gcm/Tables1kGCMExponentiator;

    invoke-direct {v0}, Lorg/spongycastle/crypto/modes/gcm/Tables1kGCMExponentiator;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    .line 390
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;->init([B)V

    .line 392
    :cond_96
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    invoke-interface {v0, v8, v9, v6}, Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;->exponentiateX(J[B)V

    .line 395
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    invoke-static {v0, v6}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->multiply([B[B)V

    .line 398
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 402
    .end local v6    # "H_c":[B
    .end local v8    # "c":J
    :cond_a7
    const/16 v0, 0x10

    new-array v7, v0, [B

    .line 403
    .local v7, "X":[B
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    const-wide/16 v4, 0x8

    mul-long/2addr v0, v4

    const/4 v2, 0x0

    invoke-static {v0, v1, v7, v2}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 404
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    const-wide/16 v4, 0x8

    mul-long/2addr v0, v4

    const/16 v2, 0x8

    invoke-static {v0, v1, v7, v2}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 406
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    invoke-direct {p0, v0, v7}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 409
    const/16 v0, 0x10

    new-array v12, v0, [B

    .line 410
    .local v12, "tag":[B
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-interface {v0, v1, v2, v12, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 411
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    invoke-static {v12, v0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->xor([B[B)V

    .line 413
    move v11, v3

    .line 416
    .local v11, "resultLen":I
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 417
    const/4 v0, 0x0

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    const/4 v2, 0x0

    iget v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    invoke-static {v12, v0, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 419
    iget-boolean v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    if-eqz v0, :cond_fc

    .line 422
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    const/4 v1, 0x0

    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    add-int/2addr v2, p2

    iget v4, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    invoke-static {v0, v1, p1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 423
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    add-int/2addr v11, v0

    .line 436
    :cond_f7
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->reset(Z)V

    .line 438
    return v11

    .line 428
    :cond_fc
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    new-array v10, v0, [B

    .line 429
    .local v10, "msgMac":[B
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    const/4 v1, 0x0

    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    invoke-static {v0, v3, v10, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 430
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    invoke-static {v0, v10}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v0

    if-nez v0, :cond_f7

    .line 432
    new-instance v0, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v1, "mac check in GCM failed"

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/GCM"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMac()[B
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getOutputSize(I)I
    .registers 4
    .param p1, "len"    # I

    .prologue
    .line 195
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    add-int v0, p1, v1

    .line 197
    .local v0, "totalData":I
    iget-boolean v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    if-eqz v1, :cond_c

    .line 199
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    add-int/2addr v1, v0

    .line 202
    :goto_b
    return v1

    :cond_c
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    if-ge v0, v1, :cond_12

    const/4 v1, 0x0

    goto :goto_b

    :cond_12
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    sub-int v1, v0, v1

    goto :goto_b
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    return-object v0
.end method

.method public getUpdateOutputSize(I)I
    .registers 4
    .param p1, "len"    # I

    .prologue
    .line 207
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    add-int v0, p1, v1

    .line 208
    .local v0, "totalData":I
    iget-boolean v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    if-nez v1, :cond_11

    .line 210
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    if-ge v0, v1, :cond_e

    .line 212
    const/4 v1, 0x0

    .line 216
    :goto_d
    return v1

    .line 214
    :cond_e
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    sub-int/2addr v0, v1

    .line 216
    :cond_11
    rem-int/lit8 v1, v0, 0x10

    sub-int v1, v0, v1

    goto :goto_d
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 13
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 93
    iput-boolean p1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->forEncryption:Z

    .line 94
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macBlock:[B

    .line 98
    instance-of v5, p2, Lorg/spongycastle/crypto/params/AEADParameters;

    if-eqz v5, :cond_63

    move-object v4, p2

    .line 100
    check-cast v4, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 102
    .local v4, "param":Lorg/spongycastle/crypto/params/AEADParameters;
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/AEADParameters;->getNonce()[B

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    .line 103
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/AEADParameters;->getAssociatedText()[B

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    .line 105
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/AEADParameters;->getMacSize()I

    move-result v3

    .line 106
    .local v3, "macSizeBits":I
    const/16 v5, 0x20

    if-lt v3, v5, :cond_28

    const/16 v5, 0x80

    if-gt v3, v5, :cond_28

    rem-int/lit8 v5, v3, 0x8

    if-eqz v5, :cond_41

    .line 108
    :cond_28
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid value for MAC size: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 111
    :cond_41
    div-int/lit8 v5, v3, 0x8

    iput v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 112
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/AEADParameters;->getKey()Lorg/spongycastle/crypto/params/KeyParameter;

    move-result-object v2

    .line 128
    .end local v3    # "macSizeBits":I
    .end local v4    # "param":Lorg/spongycastle/crypto/params/AEADParameters;
    .local v2, "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :goto_49
    if-eqz p1, :cond_86

    const/16 v1, 0x10

    .line 129
    .local v1, "bufLength":I
    :goto_4d
    new-array v5, v1, [B

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    .line 131
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    if-eqz v5, :cond_5b

    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    array-length v5, v5

    const/4 v6, 0x1

    if-ge v5, v6, :cond_8b

    .line 133
    :cond_5b
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "IV must be at least 1 byte"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 114
    .end local v1    # "bufLength":I
    .end local v2    # "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_63
    instance-of v5, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v5, :cond_7e

    move-object v4, p2

    .line 116
    check-cast v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 118
    .local v4, "param":Lorg/spongycastle/crypto/params/ParametersWithIV;
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    .line 119
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    .line 120
    const/16 v5, 0x10

    iput v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    .line 121
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 122
    .restart local v2    # "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    goto :goto_49

    .line 125
    .end local v2    # "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    .end local v4    # "param":Lorg/spongycastle/crypto/params/ParametersWithIV;
    :cond_7e
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "invalid parameters passed to GCM"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 128
    .restart local v2    # "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_86
    iget v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->macSize:I

    add-int/lit8 v1, v5, 0x10

    goto :goto_4d

    .line 140
    .restart local v1    # "bufLength":I
    :cond_8b
    if-eqz v2, :cond_10e

    .line 142
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    const/4 v6, 0x1

    invoke-interface {v5, v6, v2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 144
    const/16 v5, 0x10

    new-array v5, v5, [B

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    .line 145
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v6, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    const/4 v7, 0x0

    iget-object v8, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    const/4 v9, 0x0

    invoke-interface {v5, v6, v7, v8, v9}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 148
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->multiplier:Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;

    iget-object v6, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    invoke-interface {v5, v6}, Lorg/spongycastle/crypto/modes/gcm/GCMMultiplier;->init([B)V

    .line 149
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->exp:Lorg/spongycastle/crypto/modes/gcm/GCMExponentiator;

    .line 156
    :cond_ae
    const/16 v5, 0x10

    new-array v5, v5, [B

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    .line 158
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    array-length v5, v5

    const/16 v6, 0xc

    if-ne v5, v6, :cond_11a

    .line 160
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    const/4 v8, 0x0

    iget-object v9, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    array-length v9, v9

    invoke-static {v5, v6, v7, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 161
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    const/16 v6, 0xf

    const/4 v7, 0x1

    aput-byte v7, v5, v6

    .line 171
    :goto_ce
    const/16 v5, 0x10

    new-array v5, v5, [B

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S:[B

    .line 172
    const/16 v5, 0x10

    new-array v5, v5, [B

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    .line 173
    const/16 v5, 0x10

    new-array v5, v5, [B

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_atPre:[B

    .line 174
    const/16 v5, 0x10

    new-array v5, v5, [B

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    .line 175
    const/4 v5, 0x0

    iput v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 176
    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 177
    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLengthPre:J

    .line 178
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    invoke-static {v5}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->counter:[B

    .line 179
    const/4 v5, 0x0

    iput v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    .line 180
    const-wide/16 v5, 0x0

    iput-wide v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->totalLength:J

    .line 182
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    if-eqz v5, :cond_10d

    .line 184
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->initialAssociatedText:[B

    array-length v7, v7

    invoke-virtual {p0, v5, v6, v7}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->processAADBytes([BII)V

    .line 186
    :cond_10d
    return-void

    .line 151
    :cond_10e
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->H:[B

    if-nez v5, :cond_ae

    .line 153
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Key must be specified in initial init"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 165
    :cond_11a
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    iget-object v6, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    iget-object v7, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    array-length v7, v7

    invoke-direct {p0, v5, v6, v7}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASH([B[BI)V

    .line 166
    const/16 v5, 0x10

    new-array v0, v5, [B

    .line 167
    .local v0, "X":[B
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->nonce:[B

    array-length v5, v5

    int-to-long v5, v5

    const-wide/16 v7, 0x8

    mul-long/2addr v5, v7

    const/16 v7, 0x8

    invoke-static {v5, v6, v0, v7}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 168
    iget-object v5, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->J0:[B

    invoke-direct {p0, v5, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    goto :goto_ce
.end method

.method public processAADByte(B)V
    .registers 6
    .param p1, "in"    # B

    .prologue
    .line 221
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    aput-byte p1, v0, v1

    .line 222
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    const/16 v1, 0x10

    if-ne v0, v1, :cond_21

    .line 225
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 226
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 227
    iget-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    const-wide/16 v2, 0x10

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 229
    :cond_21
    return-void
.end method

.method public processAADBytes([BII)V
    .registers 9
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I

    .prologue
    .line 233
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p3, :cond_2b

    .line 235
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    add-int v3, p2, v0

    aget-byte v3, p1, v3

    aput-byte v3, v1, v2

    .line 236
    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    const/16 v2, 0x10

    if-ne v1, v2, :cond_28

    .line 239
    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->S_at:[B

    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlock:[B

    invoke-direct {p0, v1, v2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->gHASHBlock([B[B)V

    .line 240
    const/4 v1, 0x0

    iput v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atBlockPos:I

    .line 241
    iget-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->atLength:J

    .line 233
    :cond_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 244
    :cond_2b
    return-void
.end method

.method public processByte(B[BI)I
    .registers 6
    .param p1, "in"    # B
    .param p2, "out"    # [B
    .param p3, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .prologue
    .line 270
    iget-object v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    iget v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    aput-byte p1, v0, v1

    .line 271
    iget v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    iget-object v1, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    array-length v1, v1

    if-ne v0, v1, :cond_17

    .line 273
    invoke-direct {p0, p2, p3}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->outputBlock([BI)V

    .line 274
    const/16 v0, 0x10

    .line 276
    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public processBytes([BII[BI)I
    .registers 11
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .param p4, "out"    # [B
    .param p5, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .prologue
    .line 282
    array-length v2, p1

    add-int v3, p2, p3

    if-ge v2, v3, :cond_d

    .line 284
    new-instance v2, Lorg/spongycastle/crypto/DataLengthException;

    const-string v3, "Input buffer too short"

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 286
    :cond_d
    const/4 v1, 0x0

    .line 288
    .local v1, "resultLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, p3, :cond_30

    .line 290
    iget-object v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    iget v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    add-int v4, p2, v0

    aget-byte v4, p1, v4

    aput-byte v4, v2, v3

    .line 291
    iget v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufOff:I

    iget-object v3, p0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->bufBlock:[B

    array-length v3, v3

    if-ne v2, v3, :cond_2d

    .line 293
    add-int v2, p5, v1

    invoke-direct {p0, p4, v2}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->outputBlock([BI)V

    .line 294
    add-int/lit8 v1, v1, 0x10

    .line 288
    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 298
    :cond_30
    return v1
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 443
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;->reset(Z)V

    .line 444
    return-void
.end method
