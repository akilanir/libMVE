.class public Lorg/spongycastle/crypto/digests/KeccakDigest;
.super Ljava/lang/Object;
.source "KeccakDigest.java"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;


# static fields
.field private static KeccakRhoOffsets:[I

.field private static KeccakRoundConstants:[J


# instance fields
.field C:[J

.field protected bitsAvailableForSqueezing:I

.field protected bitsInQueue:I

.field chiC:[J

.field protected chunk:[B

.field protected dataQueue:[B

.field protected fixedOutputLength:I

.field protected oneByte:[B

.field protected rate:I

.field protected squeezing:Z

.field protected state:[B

.field tempA:[J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    invoke-static {}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakInitializeRoundConstants()[J

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRoundConstants:[J

    .line 16
    invoke-static {}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakInitializeRhoOffsets()[I

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRhoOffsets:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 97
    const/16 v0, 0x120

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;-><init>(I)V

    .line 98
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "bitLength"    # I

    .prologue
    const/4 v1, 0x5

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/16 v0, 0xc8

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 78
    const/16 v0, 0xc0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 462
    new-array v0, v1, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    .line 496
    const/16 v0, 0x19

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    .line 511
    new-array v0, v1, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    .line 102
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->init(I)V

    .line 103
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/KeccakDigest;)V
    .registers 6
    .param p1, "source"    # Lorg/spongycastle/crypto/digests/KeccakDigest;

    .prologue
    const/4 v1, 0x5

    const/4 v3, 0x0

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/16 v0, 0xc8

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    .line 78
    const/16 v0, 0xc0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    .line 462
    new-array v0, v1, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    .line 496
    const/16 v0, 0x19

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    .line 511
    new-array v0, v1, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    .line 106
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v2, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget-object v2, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 109
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 110
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 111
    iget-boolean v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    iput-boolean v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 112
    iget v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 113
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    .line 114
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 115
    return-void
.end method

.method private KeccakAbsorb([B[BI)V
    .registers 4
    .param p1, "byteState"    # [B
    .param p2, "data"    # [B
    .param p3, "dataInBytes"    # I

    .prologue
    .line 535
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutationAfterXor([B[BI)V

    .line 536
    return-void
.end method

.method private KeccakExtract([B[BI)V
    .registers 6
    .param p1, "byteState"    # [B
    .param p2, "data"    # [B
    .param p3, "laneCount"    # I

    .prologue
    const/4 v1, 0x0

    .line 547
    mul-int/lit8 v0, p3, 0x8

    invoke-static {p1, v1, p2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 548
    return-void
.end method

.method private KeccakExtract1024bits([B[B)V
    .registers 5
    .param p1, "byteState"    # [B
    .param p2, "data"    # [B

    .prologue
    const/4 v1, 0x0

    .line 541
    const/16 v0, 0x80

    invoke-static {p1, v1, p2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 542
    return-void
.end method

.method private static LFSR86540([B)Z
    .registers 4
    .param p0, "LFSR"    # [B

    .prologue
    const/4 v1, 0x0

    .line 44
    aget-byte v2, p0, v1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_18

    const/4 v0, 0x1

    .line 45
    .local v0, "result":Z
    :goto_8
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0x80

    if-eqz v2, :cond_1a

    .line 47
    aget-byte v2, p0, v1

    shl-int/lit8 v2, v2, 0x1

    xor-int/lit8 v2, v2, 0x71

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 54
    :goto_17
    return v0

    .end local v0    # "result":Z
    :cond_18
    move v0, v1

    .line 44
    goto :goto_8

    .line 51
    .restart local v0    # "result":Z
    :cond_1a
    aget-byte v2, p0, v1

    shl-int/lit8 v2, v2, 0x1

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    goto :goto_17
.end method

.method private absorbQueue()V
    .registers 4

    .prologue
    .line 234
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    div-int/lit8 v2, v2, 0x8

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakAbsorb([B[BI)V

    .line 236
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 237
    return-void
.end method

.method private chi([J)V
    .registers 12
    .param p1, "A"    # [J

    .prologue
    const/4 v9, 0x5

    .line 515
    const/4 v1, 0x0

    .local v1, "y":I
    :goto_2
    if-ge v1, v9, :cond_3c

    .line 517
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_5
    if-ge v0, v9, :cond_2a

    .line 519
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    mul-int/lit8 v3, v1, 0x5

    add-int/2addr v3, v0

    aget-wide v3, p1, v3

    add-int/lit8 v5, v0, 0x1

    rem-int/lit8 v5, v5, 0x5

    mul-int/lit8 v6, v1, 0x5

    add-int/2addr v5, v6

    aget-wide v5, p1, v5

    const-wide/16 v7, -0x1

    xor-long/2addr v5, v7

    add-int/lit8 v7, v0, 0x2

    rem-int/lit8 v7, v7, 0x5

    mul-int/lit8 v8, v1, 0x5

    add-int/2addr v7, v8

    aget-wide v7, p1, v7

    and-long/2addr v5, v7

    xor-long/2addr v3, v5

    aput-wide v3, v2, v0

    .line 517
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 521
    :cond_2a
    const/4 v0, 0x0

    :goto_2b
    if-ge v0, v9, :cond_39

    .line 523
    mul-int/lit8 v2, v1, 0x5

    add-int/2addr v2, v0

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chiC:[J

    aget-wide v3, v3, v0

    aput-wide v3, p1, v2

    .line 521
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    .line 515
    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 526
    .end local v0    # "x":I
    :cond_3c
    return-void
.end method

.method private clearDataQueueSection(II)V
    .registers 6
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 89
    move v0, p1

    .local v0, "i":I
    :goto_1
    add-int v1, p1, p2

    if-eq v0, v1, :cond_d

    .line 91
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    const/4 v2, 0x0

    aput-byte v2, v1, v0

    .line 89
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 93
    :cond_d
    return-void
.end method

.method private fromBytesToWords([J[B)V
    .registers 12
    .param p1, "stateAsWords"    # [J
    .param p2, "state"    # [B

    .prologue
    .line 385
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v3, 0x19

    if-ge v0, v3, :cond_26

    .line 387
    const-wide/16 v3, 0x0

    aput-wide v3, p1, v0

    .line 388
    mul-int/lit8 v1, v0, 0x8

    .line 389
    .local v1, "index":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_c
    const/16 v3, 0x8

    if-ge v2, v3, :cond_23

    .line 391
    aget-wide v3, p1, v0

    add-int v5, v1, v2

    aget-byte v5, p2, v5

    int-to-long v5, v5

    const-wide/16 v7, 0xff

    and-long/2addr v5, v7

    mul-int/lit8 v7, v2, 0x8

    shl-long/2addr v5, v7

    or-long/2addr v3, v5

    aput-wide v3, p1, v0

    .line 389
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 385
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 394
    .end local v1    # "index":I
    .end local v2    # "j":I
    :cond_26
    return-void
.end method

.method private fromWordsToBytes([B[J)V
    .registers 11
    .param p1, "state"    # [B
    .param p2, "stateAsWords"    # [J

    .prologue
    .line 398
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v3, 0x19

    if-ge v0, v3, :cond_20

    .line 400
    mul-int/lit8 v1, v0, 0x8

    .line 401
    .local v1, "index":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_8
    const/16 v3, 0x8

    if-ge v2, v3, :cond_1d

    .line 403
    add-int v3, v1, v2

    aget-wide v4, p2, v0

    mul-int/lit8 v6, v2, 0x8

    ushr-long/2addr v4, v6

    const-wide/16 v6, 0xff

    and-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    .line 401
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 398
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 406
    .end local v1    # "index":I
    .end local v2    # "j":I
    :cond_20
    return-void
.end method

.method private init(I)V
    .registers 4
    .param p1, "bitLength"    # I

    .prologue
    const/16 v1, 0x400

    const/16 v0, 0x240

    .line 183
    sparse-switch p1, :sswitch_data_38

    .line 204
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bitLength must be one of 128, 224, 256, 288, 384, or 512."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 186
    :sswitch_f
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    .line 206
    :goto_12
    return-void

    .line 189
    :sswitch_13
    const/16 v0, 0x540

    const/16 v1, 0x100

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    goto :goto_12

    .line 192
    :sswitch_1b
    const/16 v0, 0x480

    const/16 v1, 0x1c0

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    goto :goto_12

    .line 195
    :sswitch_23
    const/16 v0, 0x440

    const/16 v1, 0x200

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    goto :goto_12

    .line 198
    :sswitch_2b
    const/16 v0, 0x340

    const/16 v1, 0x300

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    goto :goto_12

    .line 201
    :sswitch_33
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->initSponge(II)V

    goto :goto_12

    .line 183
    nop

    :sswitch_data_38
    .sparse-switch
        0x80 -> :sswitch_13
        0xe0 -> :sswitch_1b
        0x100 -> :sswitch_23
        0x120 -> :sswitch_f
        0x180 -> :sswitch_2b
        0x200 -> :sswitch_33
    .end sparse-switch
.end method

.method private initSponge(II)V
    .registers 6
    .param p1, "rate"    # I
    .param p2, "capacity"    # I

    .prologue
    const/16 v2, 0x640

    const/4 v1, 0x0

    .line 210
    add-int v0, p1, p2

    if-eq v0, v2, :cond_f

    .line 212
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "rate + capacity != 1600"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_f
    if-lez p1, :cond_17

    if-ge p1, v2, :cond_17

    rem-int/lit8 v0, p1, 0x40

    if-eqz v0, :cond_1f

    .line 216
    :cond_17
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "invalid rate value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_1f
    iput p1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    .line 222
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 223
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 224
    iput v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 225
    iput-boolean v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 226
    iput v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 227
    div-int/lit8 v0, p2, 0x2

    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 228
    div-int/lit8 v0, p1, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    .line 229
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 230
    return-void
.end method

.method private iota([JI)V
    .registers 8
    .param p1, "A"    # [J
    .param p2, "indexRound"    # I

    .prologue
    .line 530
    const/4 v0, 0x0

    aget-wide v1, p1, v0

    sget-object v3, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRoundConstants:[J

    aget-wide v3, v3, p2

    xor-long/2addr v1, v3

    aput-wide v1, p1, v0

    .line 531
    return-void
.end method

.method private static keccakInitializeRhoOffsets()[I
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 59
    const/16 v6, 0x19

    new-array v0, v6, [I

    .line 62
    .local v0, "keccakRhoOffsets":[I
    aput v7, v0, v7

    .line 63
    const/4 v4, 0x1

    .line 64
    .local v4, "x":I
    const/4 v5, 0x0

    .line 65
    .local v5, "y":I
    const/4 v3, 0x0

    .local v3, "t":I
    :goto_a
    const/16 v6, 0x18

    if-ge v3, v6, :cond_33

    .line 67
    rem-int/lit8 v6, v4, 0x5

    rem-int/lit8 v7, v5, 0x5

    mul-int/lit8 v7, v7, 0x5

    add-int/2addr v6, v7

    add-int/lit8 v7, v3, 0x1

    add-int/lit8 v8, v3, 0x2

    mul-int/2addr v7, v8

    div-int/lit8 v7, v7, 0x2

    rem-int/lit8 v7, v7, 0x40

    aput v7, v0, v6

    .line 68
    mul-int/lit8 v6, v4, 0x0

    mul-int/lit8 v7, v5, 0x1

    add-int/2addr v6, v7

    rem-int/lit8 v1, v6, 0x5

    .line 69
    .local v1, "newX":I
    mul-int/lit8 v6, v4, 0x2

    mul-int/lit8 v7, v5, 0x3

    add-int/2addr v6, v7

    rem-int/lit8 v2, v6, 0x5

    .line 70
    .local v2, "newY":I
    move v4, v1

    .line 71
    move v5, v2

    .line 65
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 74
    .end local v1    # "newX":I
    .end local v2    # "newY":I
    :cond_33
    return-object v0
.end method

.method private static keccakInitializeRoundConstants()[J
    .registers 11

    .prologue
    const/16 v10, 0x18

    const/4 v9, 0x1

    .line 20
    new-array v4, v10, [J

    .line 21
    .local v4, "keccakRoundConstants":[J
    new-array v0, v9, [B

    .line 23
    .local v0, "LFSRstate":[B
    const/4 v5, 0x0

    aput-byte v9, v0, v5

    .line 26
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-ge v2, v10, :cond_2d

    .line 28
    const-wide/16 v5, 0x0

    aput-wide v5, v4, v2

    .line 29
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_12
    const/4 v5, 0x7

    if-ge v3, v5, :cond_2a

    .line 31
    shl-int v5, v9, v3

    add-int/lit8 v1, v5, -0x1

    .line 32
    .local v1, "bitPosition":I
    invoke-static {v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->LFSR86540([B)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 34
    aget-wide v5, v4, v2

    const-wide/16 v7, 0x1

    shl-long/2addr v7, v1

    xor-long/2addr v5, v7

    aput-wide v5, v4, v2

    .line 29
    :cond_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 26
    .end local v1    # "bitPosition":I
    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 39
    .end local v3    # "j":I
    :cond_2d
    return-object v4
.end method

.method private keccakPermutation([B)V
    .registers 4
    .param p1, "state"    # [B

    .prologue
    .line 410
    array-length v1, p1

    div-int/lit8 v1, v1, 0x8

    new-array v0, v1, [J

    .line 412
    .local v0, "longState":[J
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->fromBytesToWords([J[B)V

    .line 416
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutationOnWords([J)V

    .line 420
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->fromWordsToBytes([B[J)V

    .line 421
    return-void
.end method

.method private keccakPermutationAfterXor([B[BI)V
    .registers 7
    .param p1, "state"    # [B
    .param p2, "data"    # [B
    .param p3, "dataLengthInBytes"    # I

    .prologue
    .line 427
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p3, :cond_e

    .line 429
    aget-byte v1, p1, v0

    aget-byte v2, p2, v0

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 427
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 432
    :cond_e
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutation([B)V

    .line 433
    return-void
.end method

.method private keccakPermutationOnWords([J)V
    .registers 4
    .param p1, "state"    # [J

    .prologue
    .line 441
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x18

    if-ge v0, v1, :cond_17

    .line 445
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->theta([J)V

    .line 448
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->rho([J)V

    .line 451
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->pi([J)V

    .line 454
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->chi([J)V

    .line 457
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->iota([JI)V

    .line 441
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 460
    :cond_17
    return-void
.end method

.method private padAndSwitchToSqueezingPhase()V
    .registers 7

    .prologue
    const/16 v5, 0x400

    const/4 v4, 0x1

    .line 300
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    if-ne v0, v1, :cond_51

    .line 302
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    div-int/lit8 v1, v1, 0x8

    aget-byte v2, v0, v1

    iget v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    rem-int/lit8 v3, v3, 0x8

    shl-int v3, v4, v3

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 303
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorbQueue()V

    .line 304
    const/4 v0, 0x0

    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    div-int/lit8 v1, v1, 0x8

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->clearDataQueueSection(II)V

    .line 311
    :goto_28
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    add-int/lit8 v1, v1, -0x1

    div-int/lit8 v1, v1, 0x8

    aget-byte v2, v0, v1

    iget v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    add-int/lit8 v3, v3, -0x1

    rem-int/lit8 v3, v3, 0x8

    shl-int v3, v4, v3

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 312
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorbQueue()V

    .line 318
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    if-ne v0, v5, :cond_78

    .line 320
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract1024bits([B[B)V

    .line 321
    iput v5, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 332
    :goto_4e
    iput-boolean v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    .line 333
    return-void

    .line 308
    :cond_51
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    div-int/lit8 v1, v1, 0x8

    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    add-int/lit8 v2, v2, 0x7

    div-int/lit8 v2, v2, 0x8

    sub-int/2addr v1, v2

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->clearDataQueueSection(II)V

    .line 309
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    div-int/lit8 v1, v1, 0x8

    aget-byte v2, v0, v1

    iget v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    rem-int/lit8 v3, v3, 0x8

    shl-int v3, v4, v3

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_28

    .line 326
    :cond_78
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    div-int/lit8 v2, v2, 0x40

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract([B[BI)V

    .line 327
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    goto :goto_4e
.end method

.method private pi([J)V
    .registers 8
    .param p1, "A"    # [J

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x0

    .line 500
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    array-length v3, v3

    invoke-static {p1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 502
    const/4 v0, 0x0

    .local v0, "x":I
    :goto_b
    if-ge v0, v5, :cond_29

    .line 504
    const/4 v1, 0x0

    .local v1, "y":I
    :goto_e
    if-ge v1, v5, :cond_26

    .line 506
    mul-int/lit8 v2, v0, 0x2

    mul-int/lit8 v3, v1, 0x3

    add-int/2addr v2, v3

    rem-int/lit8 v2, v2, 0x5

    mul-int/lit8 v2, v2, 0x5

    add-int/2addr v2, v1

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->tempA:[J

    mul-int/lit8 v4, v1, 0x5

    add-int/2addr v4, v0

    aget-wide v3, v3, v4

    aput-wide v3, p1, v2

    .line 504
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 502
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 509
    .end local v1    # "y":I
    :cond_29
    return-void
.end method

.method private rho([J)V
    .registers 11
    .param p1, "A"    # [J

    .prologue
    const/4 v8, 0x5

    .line 486
    const/4 v1, 0x0

    .local v1, "x":I
    :goto_2
    if-ge v1, v8, :cond_2d

    .line 488
    const/4 v2, 0x0

    .local v2, "y":I
    :goto_5
    if-ge v2, v8, :cond_2a

    .line 490
    mul-int/lit8 v3, v2, 0x5

    add-int v0, v1, v3

    .line 491
    .local v0, "index":I
    sget-object v3, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRhoOffsets:[I

    aget v3, v3, v0

    if-eqz v3, :cond_27

    aget-wide v3, p1, v0

    sget-object v5, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRhoOffsets:[I

    aget v5, v5, v0

    shl-long/2addr v3, v5

    aget-wide v5, p1, v0

    sget-object v7, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakRhoOffsets:[I

    aget v7, v7, v0

    rsub-int/lit8 v7, v7, 0x40

    ushr-long/2addr v5, v7

    xor-long/2addr v3, v5

    :goto_22
    aput-wide v3, p1, v0

    .line 488
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 491
    :cond_27
    aget-wide v3, p1, v0

    goto :goto_22

    .line 486
    .end local v0    # "index":I
    :cond_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 494
    .end local v2    # "y":I
    :cond_2d
    return-void
.end method

.method private theta([J)V
    .registers 12
    .param p1, "A"    # [J

    .prologue
    const/4 v9, 0x5

    .line 466
    const/4 v2, 0x0

    .local v2, "x":I
    :goto_2
    if-ge v2, v9, :cond_1f

    .line 468
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    const-wide/16 v5, 0x0

    aput-wide v5, v4, v2

    .line 469
    const/4 v3, 0x0

    .local v3, "y":I
    :goto_b
    if-ge v3, v9, :cond_1c

    .line 471
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    aget-wide v5, v4, v2

    mul-int/lit8 v7, v3, 0x5

    add-int/2addr v7, v2

    aget-wide v7, p1, v7

    xor-long/2addr v5, v7

    aput-wide v5, v4, v2

    .line 469
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 466
    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 474
    .end local v3    # "y":I
    :cond_1f
    const/4 v2, 0x0

    :goto_20
    if-ge v2, v9, :cond_53

    .line 476
    iget-object v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    add-int/lit8 v5, v2, 0x1

    rem-int/lit8 v5, v5, 0x5

    aget-wide v4, v4, v5

    const/4 v6, 0x1

    shl-long/2addr v4, v6

    iget-object v6, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    add-int/lit8 v7, v2, 0x1

    rem-int/lit8 v7, v7, 0x5

    aget-wide v6, v6, v7

    const/16 v8, 0x3f

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    iget-object v6, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->C:[J

    add-int/lit8 v7, v2, 0x4

    rem-int/lit8 v7, v7, 0x5

    aget-wide v6, v6, v7

    xor-long v0, v4, v6

    .line 477
    .local v0, "dX":J
    const/4 v3, 0x0

    .restart local v3    # "y":I
    :goto_43
    if-ge v3, v9, :cond_50

    .line 479
    mul-int/lit8 v4, v3, 0x5

    add-int/2addr v4, v2

    aget-wide v5, p1, v4

    xor-long/2addr v5, v0

    aput-wide v5, p1, v4

    .line 477
    add-int/lit8 v3, v3, 0x1

    goto :goto_43

    .line 474
    :cond_50
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 482
    .end local v0    # "dX":J
    .end local v3    # "y":I
    :cond_53
    return-void
.end method


# virtual methods
.method protected absorb([BIJ)V
    .registers 18
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "databitlen"    # J

    .prologue
    .line 243
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    rem-int/lit8 v9, v9, 0x8

    if-eqz v9, :cond_e

    .line 245
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string v10, "attempt to absorb with odd length queue."

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 247
    :cond_e
    iget-boolean v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    if-eqz v9, :cond_1a

    .line 249
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string v10, "attempt to absorb while squeezing."

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 252
    :cond_1a
    const-wide/16 v0, 0x0

    .line 253
    .local v0, "i":J
    :cond_1c
    :goto_1c
    cmp-long v9, v0, p3

    if-gez v9, :cond_c0

    .line 255
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    if-nez v9, :cond_6b

    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    int-to-long v9, v9

    cmp-long v9, p3, v9

    if-ltz v9, :cond_6b

    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    int-to-long v9, v9

    sub-long v9, p3, v9

    cmp-long v9, v0, v9

    if-gtz v9, :cond_6b

    .line 257
    sub-long v9, p3, v0

    iget v11, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    int-to-long v11, v11

    div-long v7, v9, v11

    .line 259
    .local v7, "wholeBlocks":J
    const-wide/16 v2, 0x0

    .local v2, "j":J
    :goto_3d
    cmp-long v9, v2, v7

    if-gez v9, :cond_65

    .line 261
    int-to-long v9, p2

    const-wide/16 v11, 0x8

    div-long v11, v0, v11

    add-long/2addr v9, v11

    iget-object v11, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    array-length v11, v11

    int-to-long v11, v11

    mul-long/2addr v11, v2

    add-long/2addr v9, v11

    long-to-int v9, v9

    iget-object v10, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    const/4 v11, 0x0

    iget-object v12, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    array-length v12, v12

    invoke-static {p1, v9, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 265
    iget-object v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v10, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    iget-object v11, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->chunk:[B

    array-length v11, v11

    invoke-direct {p0, v9, v10, v11}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakAbsorb([B[BI)V

    .line 259
    const-wide/16 v9, 0x1

    add-long/2addr v2, v9

    goto :goto_3d

    .line 268
    :cond_65
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    int-to-long v9, v9

    mul-long/2addr v9, v7

    add-long/2addr v0, v9

    goto :goto_1c

    .line 272
    .end local v2    # "j":J
    .end local v7    # "wholeBlocks":J
    :cond_6b
    sub-long v9, p3, v0

    long-to-int v5, v9

    .line 273
    .local v5, "partialBlock":I
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    add-int/2addr v9, v5

    iget v10, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    if-le v9, v10, :cond_7b

    .line 275
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    iget v10, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    sub-int v5, v9, v10

    .line 277
    :cond_7b
    rem-int/lit8 v6, v5, 0x8

    .line 278
    .local v6, "partialByte":I
    sub-int/2addr v5, v6

    .line 279
    const-wide/16 v9, 0x8

    div-long v9, v0, v9

    long-to-int v9, v9

    add-int/2addr v9, p2

    iget-object v10, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v11, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    div-int/lit8 v11, v11, 0x8

    div-int/lit8 v12, v5, 0x8

    invoke-static {p1, v9, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 281
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    add-int/2addr v9, v5

    iput v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 282
    int-to-long v9, v5

    add-long/2addr v0, v9

    .line 283
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    iget v10, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    if-ne v9, v10, :cond_9f

    .line 285
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorbQueue()V

    .line 287
    :cond_9f
    if-lez v6, :cond_1c

    .line 289
    const/4 v9, 0x1

    shl-int/2addr v9, v6

    add-int/lit8 v4, v9, -0x1

    .line 290
    .local v4, "mask":I
    iget-object v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v10, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    div-int/lit8 v10, v10, 0x8

    const-wide/16 v11, 0x8

    div-long v11, v0, v11

    long-to-int v11, v11

    add-int/2addr v11, p2

    aget-byte v11, p1, v11

    and-int/2addr v11, v4

    int-to-byte v11, v11

    aput-byte v11, v9, v10

    .line 291
    iget v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    add-int/2addr v9, v6

    iput v9, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsInQueue:I

    .line 292
    int-to-long v9, v6

    add-long/2addr v0, v9

    goto/16 :goto_1c

    .line 296
    .end local v4    # "mask":I
    .end local v5    # "partialBlock":I
    .end local v6    # "partialByte":I
    :cond_c0
    return-void
.end method

.method public doFinal([BI)I
    .registers 5
    .param p1, "out"    # [B
    .param p2, "outOff"    # I

    .prologue
    .line 141
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeeze([BIJ)V

    .line 143
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->reset()V

    .line 145
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->getDigestSize()I

    move-result v0

    return v0
.end method

.method protected doFinal([BIBI)I
    .registers 9
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .param p3, "partialByte"    # B
    .param p4, "partialBits"    # I

    .prologue
    const/4 v3, 0x0

    .line 153
    if-lez p4, :cond_d

    .line 155
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    aput-byte p3, v0, v3

    .line 156
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    int-to-long v1, p4

    invoke-virtual {p0, v0, v3, v1, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 159
    :cond_d
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeeze([BIJ)V

    .line 161
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->reset()V

    .line 163
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->getDigestSize()I

    move-result v0

    return v0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Keccak-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getByteLength()I
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    div-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public getDigestSize()I
    .registers 2

    .prologue
    .line 124
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    div-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 168
    iget v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->init(I)V

    .line 169
    return-void
.end method

.method protected squeeze([BIJ)V
    .registers 15
    .param p1, "output"    # [B
    .param p2, "offset"    # I
    .param p3, "outputLength"    # J

    .prologue
    const-wide/16 v8, 0x8

    const/16 v7, 0x400

    .line 340
    iget-boolean v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeezing:Z

    if-nez v3, :cond_b

    .line 342
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->padAndSwitchToSqueezingPhase()V

    .line 344
    :cond_b
    rem-long v3, p3, v8

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_1b

    .line 346
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "outputLength not a multiple of 8"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 349
    :cond_1b
    const-wide/16 v0, 0x0

    .line 350
    .local v0, "i":J
    :goto_1d
    cmp-long v3, v0, p3

    if-gez v3, :cond_6d

    .line 352
    iget v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    if-nez v3, :cond_37

    .line 354
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    invoke-direct {p0, v3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->keccakPermutation([B)V

    .line 356
    iget v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    if-ne v3, v7, :cond_5d

    .line 358
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    invoke-direct {p0, v3, v4}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract1024bits([B[B)V

    .line 359
    iput v7, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 371
    :cond_37
    :goto_37
    iget v2, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 372
    .local v2, "partialBlock":I
    int-to-long v3, v2

    sub-long v5, p3, v0

    cmp-long v3, v3, v5

    if-lez v3, :cond_43

    .line 374
    sub-long v3, p3, v0

    long-to-int v2, v3

    .line 377
    :cond_43
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    iget v5, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x8

    div-long v5, v0, v8

    long-to-int v5, v5

    add-int/2addr v5, p2

    div-int/lit8 v6, v2, 0x8

    invoke-static {v3, v4, p1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 378
    iget v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    sub-int/2addr v3, v2

    iput v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    .line 379
    int-to-long v3, v2

    add-long/2addr v0, v3

    goto :goto_1d

    .line 364
    .end local v2    # "partialBlock":I
    :cond_5d
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->state:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->dataQueue:[B

    iget v5, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    div-int/lit8 v5, v5, 0x40

    invoke-direct {p0, v3, v4, v5}, Lorg/spongycastle/crypto/digests/KeccakDigest;->KeccakExtract([B[BI)V

    .line 365
    iget v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->rate:I

    iput v3, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->bitsAvailableForSqueezing:I

    goto :goto_37

    .line 381
    :cond_6d
    return-void
.end method

.method public update(B)V
    .registers 6
    .param p1, "in"    # B

    .prologue
    const/4 v3, 0x0

    .line 129
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    aput-byte p1, v0, v3

    .line 131
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    const-wide/16 v1, 0x8

    invoke-virtual {p0, v0, v3, v1, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 132
    return-void
.end method

.method public update([BII)V
    .registers 8
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I

    .prologue
    .line 136
    int-to-long v0, p3

    const-wide/16 v2, 0x8

    mul-long/2addr v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 137
    return-void
.end method
