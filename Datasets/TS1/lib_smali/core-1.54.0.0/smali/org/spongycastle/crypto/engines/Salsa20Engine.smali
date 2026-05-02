.class public Lorg/spongycastle/crypto/engines/Salsa20Engine;
.super Ljava/lang/Object;
.source "Salsa20Engine.java"

# interfaces
.implements Lorg/spongycastle/crypto/SkippingStreamCipher;


# static fields
.field public static final DEFAULT_ROUNDS:I = 0x14

.field private static final STATE_SIZE:I = 0x10

.field protected static final sigma:[B

.field protected static final tau:[B


# instance fields
.field private cW0:I

.field private cW1:I

.field private cW2:I

.field protected engineState:[I

.field private index:I

.field private initialised:Z

.field private keyStream:[B

.field protected rounds:I

.field protected x:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-string v0, "expand 32-byte k"

    invoke-static {v0}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->sigma:[B

    .line 26
    const-string v0, "expand 16-byte k"

    invoke-static {v0}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->tau:[B

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 50
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;-><init>(I)V

    .line 51
    return-void
.end method

.method public constructor <init>(I)V
    .registers 5
    .param p1, "rounds"    # I

    .prologue
    const/16 v2, 0x10

    const/4 v1, 0x0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    .line 35
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 36
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->x:[I

    .line 37
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    .line 38
    iput-boolean v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->initialised:Z

    .line 59
    if-lez p1, :cond_1e

    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_26

    .line 61
    :cond_1e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'rounds\' must be a positive, even number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_26
    iput p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rounds:I

    .line 65
    return-void
.end method

.method private limitExceeded()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 523
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW0:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW0:I

    if-nez v1, :cond_1c

    .line 525
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW1:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW1:I

    if-nez v1, :cond_1c

    .line 527
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW2:I

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_1c

    const/4 v0, 0x1

    .line 531
    :cond_1c
    return v0
.end method

.method private limitExceeded(I)Z
    .registers 4
    .param p1, "len"    # I

    .prologue
    const/4 v0, 0x0

    .line 539
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW0:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW0:I

    .line 540
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW0:I

    if-ge v1, p1, :cond_21

    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW0:I

    if-ltz v1, :cond_21

    .line 542
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW1:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW1:I

    if-nez v1, :cond_21

    .line 544
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW2:I

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_21

    const/4 v0, 0x1

    .line 548
    :cond_21
    return v0
.end method

.method private resetLimitCounter()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 516
    iput v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW0:I

    .line 517
    iput v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW1:I

    .line 518
    iput v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->cW2:I

    .line 519
    return-void
.end method

.method protected static rotl(II)I
    .registers 4
    .param p0, "x"    # I
    .param p1, "y"    # I

    .prologue
    .line 511
    shl-int v0, p0, p1

    neg-int v1, p1

    ushr-int v1, p0, v1

    or-int/2addr v0, v1

    return v0
.end method

.method public static salsaCore(I[I[I)V
    .registers 24
    .param p0, "rounds"    # I
    .param p1, "input"    # [I
    .param p2, "x"    # [I

    .prologue
    .line 416
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_13

    .line 418
    new-instance v19, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v19 .. v19}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v19

    .line 420
    :cond_13
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_26

    .line 422
    new-instance v19, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v19 .. v19}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v19

    .line 424
    :cond_26
    rem-int/lit8 v19, p0, 0x2

    if-eqz v19, :cond_32

    .line 426
    new-instance v19, Ljava/lang/IllegalArgumentException;

    const-string v20, "Number of rounds must be even"

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 429
    :cond_32
    const/16 v19, 0x0

    aget v3, p1, v19

    .line 430
    .local v3, "x00":I
    const/16 v19, 0x1

    aget v4, p1, v19

    .line 431
    .local v4, "x01":I
    const/16 v19, 0x2

    aget v5, p1, v19

    .line 432
    .local v5, "x02":I
    const/16 v19, 0x3

    aget v6, p1, v19

    .line 433
    .local v6, "x03":I
    const/16 v19, 0x4

    aget v7, p1, v19

    .line 434
    .local v7, "x04":I
    const/16 v19, 0x5

    aget v8, p1, v19

    .line 435
    .local v8, "x05":I
    const/16 v19, 0x6

    aget v9, p1, v19

    .line 436
    .local v9, "x06":I
    const/16 v19, 0x7

    aget v10, p1, v19

    .line 437
    .local v10, "x07":I
    const/16 v19, 0x8

    aget v11, p1, v19

    .line 438
    .local v11, "x08":I
    const/16 v19, 0x9

    aget v12, p1, v19

    .line 439
    .local v12, "x09":I
    const/16 v19, 0xa

    aget v13, p1, v19

    .line 440
    .local v13, "x10":I
    const/16 v19, 0xb

    aget v14, p1, v19

    .line 441
    .local v14, "x11":I
    const/16 v19, 0xc

    aget v15, p1, v19

    .line 442
    .local v15, "x12":I
    const/16 v19, 0xd

    aget v16, p1, v19

    .line 443
    .local v16, "x13":I
    const/16 v19, 0xe

    aget v17, p1, v19

    .line 444
    .local v17, "x14":I
    const/16 v19, 0xf

    aget v18, p1, v19

    .line 446
    .local v18, "x15":I
    move/from16 v2, p0

    .local v2, "i":I
    :goto_74
    if-lez v2, :cond_1ba

    .line 448
    add-int v19, v3, v15

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v7, v7, v19

    .line 449
    add-int v19, v7, v3

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v11, v11, v19

    .line 450
    add-int v19, v11, v7

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v15, v15, v19

    .line 451
    add-int v19, v15, v11

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v3, v3, v19

    .line 452
    add-int v19, v8, v4

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v12, v12, v19

    .line 453
    add-int v19, v12, v8

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v16, v16, v19

    .line 454
    add-int v19, v16, v12

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v4, v4, v19

    .line 455
    add-int v19, v4, v16

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v8, v8, v19

    .line 456
    add-int v19, v13, v9

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v17, v17, v19

    .line 457
    add-int v19, v17, v13

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v5, v5, v19

    .line 458
    add-int v19, v5, v17

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v9, v9, v19

    .line 459
    add-int v19, v9, v5

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v13, v13, v19

    .line 460
    add-int v19, v18, v14

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v6, v6, v19

    .line 461
    add-int v19, v6, v18

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v10, v10, v19

    .line 462
    add-int v19, v10, v6

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v14, v14, v19

    .line 463
    add-int v19, v14, v10

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v18, v18, v19

    .line 465
    add-int v19, v3, v6

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v4, v4, v19

    .line 466
    add-int v19, v4, v3

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v5, v5, v19

    .line 467
    add-int v19, v5, v4

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v6, v6, v19

    .line 468
    add-int v19, v6, v5

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v3, v3, v19

    .line 469
    add-int v19, v8, v7

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v9, v9, v19

    .line 470
    add-int v19, v9, v8

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v10, v10, v19

    .line 471
    add-int v19, v10, v9

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v7, v7, v19

    .line 472
    add-int v19, v7, v10

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v8, v8, v19

    .line 473
    add-int v19, v13, v12

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v14, v14, v19

    .line 474
    add-int v19, v14, v13

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v11, v11, v19

    .line 475
    add-int v19, v11, v14

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v12, v12, v19

    .line 476
    add-int v19, v12, v11

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v13, v13, v19

    .line 477
    add-int v19, v18, v17

    const/16 v20, 0x7

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v15, v15, v19

    .line 478
    add-int v19, v15, v18

    const/16 v20, 0x9

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v16, v16, v19

    .line 479
    add-int v19, v16, v15

    const/16 v20, 0xd

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v17, v17, v19

    .line 480
    add-int v19, v17, v16

    const/16 v20, 0x12

    invoke-static/range {v19 .. v20}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v19

    xor-int v18, v18, v19

    .line 446
    add-int/lit8 v2, v2, -0x2

    goto/16 :goto_74

    .line 483
    :cond_1ba
    const/16 v19, 0x0

    const/16 v20, 0x0

    aget v20, p1, v20

    add-int v20, v20, v3

    aput v20, p2, v19

    .line 484
    const/16 v19, 0x1

    const/16 v20, 0x1

    aget v20, p1, v20

    add-int v20, v20, v4

    aput v20, p2, v19

    .line 485
    const/16 v19, 0x2

    const/16 v20, 0x2

    aget v20, p1, v20

    add-int v20, v20, v5

    aput v20, p2, v19

    .line 486
    const/16 v19, 0x3

    const/16 v20, 0x3

    aget v20, p1, v20

    add-int v20, v20, v6

    aput v20, p2, v19

    .line 487
    const/16 v19, 0x4

    const/16 v20, 0x4

    aget v20, p1, v20

    add-int v20, v20, v7

    aput v20, p2, v19

    .line 488
    const/16 v19, 0x5

    const/16 v20, 0x5

    aget v20, p1, v20

    add-int v20, v20, v8

    aput v20, p2, v19

    .line 489
    const/16 v19, 0x6

    const/16 v20, 0x6

    aget v20, p1, v20

    add-int v20, v20, v9

    aput v20, p2, v19

    .line 490
    const/16 v19, 0x7

    const/16 v20, 0x7

    aget v20, p1, v20

    add-int v20, v20, v10

    aput v20, p2, v19

    .line 491
    const/16 v19, 0x8

    const/16 v20, 0x8

    aget v20, p1, v20

    add-int v20, v20, v11

    aput v20, p2, v19

    .line 492
    const/16 v19, 0x9

    const/16 v20, 0x9

    aget v20, p1, v20

    add-int v20, v20, v12

    aput v20, p2, v19

    .line 493
    const/16 v19, 0xa

    const/16 v20, 0xa

    aget v20, p1, v20

    add-int v20, v20, v13

    aput v20, p2, v19

    .line 494
    const/16 v19, 0xb

    const/16 v20, 0xb

    aget v20, p1, v20

    add-int v20, v20, v14

    aput v20, p2, v19

    .line 495
    const/16 v19, 0xc

    const/16 v20, 0xc

    aget v20, p1, v20

    add-int v20, v20, v15

    aput v20, p2, v19

    .line 496
    const/16 v19, 0xd

    const/16 v20, 0xd

    aget v20, p1, v20

    add-int v20, v20, v16

    aput v20, p2, v19

    .line 497
    const/16 v19, 0xe

    const/16 v20, 0xe

    aget v20, p1, v20

    add-int v20, v20, v17

    aput v20, p2, v19

    .line 498
    const/16 v19, 0xf

    const/16 v20, 0xf

    aget v20, p1, v20

    add-int v20, v20, v18

    aput v20, p2, v19

    .line 499
    return-void
.end method


# virtual methods
.method protected advanceCounter()V
    .registers 4

    .prologue
    .line 179
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v1, 0x8

    aget v2, v0, v1

    add-int/lit8 v2, v2, 0x1

    aput v2, v0, v1

    if-nez v2, :cond_16

    .line 181
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v1, 0x9

    aget v2, v0, v1

    add-int/lit8 v2, v2, 0x1

    aput v2, v0, v1

    .line 183
    :cond_16
    return-void
.end method

.method protected advanceCounter(J)V
    .registers 10
    .param p1, "diff"    # J

    .prologue
    const/16 v6, 0x9

    const/16 v5, 0x8

    .line 159
    const/16 v3, 0x20

    ushr-long v3, p1, v3

    long-to-int v0, v3

    .line 160
    .local v0, "hi":I
    long-to-int v1, p1

    .line 162
    .local v1, "lo":I
    if-lez v0, :cond_13

    .line 164
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v4, v3, v6

    add-int/2addr v4, v0

    aput v4, v3, v6

    .line 167
    :cond_13
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v2, v3, v5

    .line 169
    .local v2, "oldState":I
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v4, v3, v5

    add-int/2addr v4, v1

    aput v4, v3, v5

    .line 171
    if-eqz v2, :cond_2e

    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v3, v3, v5

    if-ge v3, v2, :cond_2e

    .line 173
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v4, v3, v6

    add-int/lit8 v4, v4, 0x1

    aput v4, v3, v6

    .line 175
    :cond_2e
    return-void
.end method

.method protected generateKeyStream([B)V
    .registers 5
    .param p1, "output"    # [B

    .prologue
    .line 405
    iget v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rounds:I

    iget-object v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->x:[I

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->salsaCore(I[I[I)V

    .line 406
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToLittleEndian([I[BI)V

    .line 407
    return-void
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 130
    const-string v0, "Salsa20"

    .line 131
    .local v0, "name":Ljava/lang/String;
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rounds:I

    const/16 v2, 0x14

    if-eq v1, v2, :cond_21

    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rounds:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    :cond_21
    return-object v0
.end method

.method protected getCounter()J
    .registers 7

    .prologue
    .line 351
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v1, 0x9

    aget v0, v0, v1

    int-to-long v0, v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0x8

    aget v2, v2, v3

    int-to-long v2, v2

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method protected getNonceSize()I
    .registers 2

    .prologue
    .line 125
    const/16 v0, 0x8

    return v0
.end method

.method public getPosition()J
    .registers 5

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getCounter()J

    move-result-wide v0

    const-wide/16 v2, 0x40

    mul-long/2addr v0, v2

    iget v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 9
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 85
    instance-of v3, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-nez v3, :cond_21

    .line 87
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getAlgorithmName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Init parameters must include an IV"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_21
    move-object v1, p2

    .line 90
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 92
    .local v1, "ivParams":Lorg/spongycastle/crypto/params/ParametersWithIV;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    .line 93
    .local v0, "iv":[B
    if-eqz v0, :cond_31

    array-length v3, v0

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getNonceSize()I

    move-result v4

    if-eq v3, v4, :cond_5c

    .line 95
    :cond_31
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getAlgorithmName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " requires exactly "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getNonceSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes of IV"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 99
    :cond_5c
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v2

    .line 100
    .local v2, "keyParam":Lorg/spongycastle/crypto/CipherParameters;
    if-nez v2, :cond_8e

    .line 102
    iget-boolean v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->initialised:Z

    if-nez v3, :cond_83

    .line 104
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getAlgorithmName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " KeyParameter can not be null for first initialisation"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 107
    :cond_83
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->setKey([B[B)V

    .line 118
    .end local v2    # "keyParam":Lorg/spongycastle/crypto/CipherParameters;
    :goto_87
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->reset()V

    .line 120
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->initialised:Z

    .line 121
    return-void

    .line 109
    .restart local v2    # "keyParam":Lorg/spongycastle/crypto/CipherParameters;
    :cond_8e
    instance-of v3, v2, Lorg/spongycastle/crypto/params/KeyParameter;

    if-eqz v3, :cond_9c

    .line 111
    check-cast v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .end local v2    # "keyParam":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->setKey([B[B)V

    goto :goto_87

    .line 115
    .restart local v2    # "keyParam":Lorg/spongycastle/crypto/CipherParameters;
    :cond_9c
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getAlgorithmName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Init parameters must contain a KeyParameter (or null for re-init)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public processBytes([BII[BI)I
    .registers 10
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .param p4, "out"    # [B
    .param p5, "outOff"    # I

    .prologue
    .line 240
    iget-boolean v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->initialised:Z

    if-nez v1, :cond_21

    .line 242
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not initialised"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 245
    :cond_21
    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_2e

    .line 247
    new-instance v1, Lorg/spongycastle/crypto/DataLengthException;

    const-string v2, "input buffer too short"

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 250
    :cond_2e
    add-int v1, p5, p3

    array-length v2, p4

    if-le v1, v2, :cond_3b

    .line 252
    new-instance v1, Lorg/spongycastle/crypto/OutputLengthException;

    const-string v2, "output buffer too short"

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/OutputLengthException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 255
    :cond_3b
    invoke-direct {p0, p3}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->limitExceeded(I)Z

    move-result v1

    if-eqz v1, :cond_49

    .line 257
    new-instance v1, Lorg/spongycastle/crypto/MaxBytesExceededException;

    const-string v2, "2^70 byte limit per IV would be exceeded; Change IV"

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/MaxBytesExceededException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 260
    :cond_49
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4a
    if-ge v0, p3, :cond_73

    .line 262
    add-int v1, v0, p5

    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    iget v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    aget-byte v2, v2, v3

    add-int v3, v0, p2

    aget-byte v3, p1, v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p4, v1

    .line 263
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    add-int/lit8 v1, v1, 0x1

    and-int/lit8 v1, v1, 0x3f

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    .line 265
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    if-nez v1, :cond_70

    .line 267
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->advanceCounter()V

    .line 268
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->generateKeyStream([B)V

    .line 260
    :cond_70
    add-int/lit8 v0, v0, 0x1

    goto :goto_4a

    .line 272
    :cond_73
    return p3
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 342
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    .line 343
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->resetLimitCounter()V

    .line 344
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->resetCounter()V

    .line 346
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->generateKeyStream([B)V

    .line 347
    return-void
.end method

.method protected resetCounter()V
    .registers 6

    .prologue
    .line 356
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v1, 0x8

    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0x9

    const/4 v4, 0x0

    aput v4, v2, v3

    aput v4, v0, v1

    .line 357
    return-void
.end method

.method protected retreatCounter()V
    .registers 5

    .prologue
    const/16 v3, 0x9

    const/16 v2, 0x8

    .line 222
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v0, v0, v2

    if-nez v0, :cond_18

    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v0, v0, v3

    if-nez v0, :cond_18

    .line 224
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "attempt to reduce counter past zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_18
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v1, v0, v2

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, v2

    const/4 v0, -0x1

    if-ne v1, v0, :cond_2b

    .line 229
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v1, v0, v3

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, v3

    .line 231
    :cond_2b
    return-void
.end method

.method protected retreatCounter(J)V
    .registers 13
    .param p1, "diff"    # J

    .prologue
    const/16 v9, 0x8

    const-wide v7, 0xffffffffL

    const/16 v6, 0x9

    .line 187
    const/16 v2, 0x20

    ushr-long v2, p1, v2

    long-to-int v0, v2

    .line 188
    .local v0, "hi":I
    long-to-int v1, p1

    .line 190
    .local v1, "lo":I
    if-eqz v0, :cond_24

    .line 192
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v2, v2, v6

    int-to-long v2, v2

    and-long/2addr v2, v7

    int-to-long v4, v0

    and-long/2addr v4, v7

    cmp-long v2, v2, v4

    if-ltz v2, :cond_38

    .line 194
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v3, v2, v6

    sub-int/2addr v3, v0

    aput v3, v2, v6

    .line 202
    :cond_24
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v2, v2, v9

    int-to-long v2, v2

    and-long/2addr v2, v7

    int-to-long v4, v1

    and-long/2addr v4, v7

    cmp-long v2, v2, v4

    if-ltz v2, :cond_40

    .line 204
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v3, v2, v9

    sub-int/2addr v3, v1

    aput v3, v2, v9

    .line 218
    :goto_37
    return-void

    .line 198
    :cond_38
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "attempt to reduce counter past zero."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 208
    :cond_40
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v2, v2, v6

    if-eqz v2, :cond_56

    .line 210
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v3, v2, v6

    add-int/lit8 v3, v3, -0x1

    aput v3, v2, v6

    .line 211
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v3, v2, v9

    sub-int/2addr v3, v1

    aput v3, v2, v9

    goto :goto_37

    .line 215
    :cond_56
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "attempt to reduce counter past zero."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public returnByte(B)B
    .registers 5
    .param p1, "in"    # B

    .prologue
    .line 140
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->limitExceeded()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 142
    new-instance v1, Lorg/spongycastle/crypto/MaxBytesExceededException;

    const-string v2, "2^70 byte limit per IV; Change IV"

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/MaxBytesExceededException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 145
    :cond_e
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    iget v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    aget-byte v1, v1, v2

    xor-int/2addr v1, p1

    int-to-byte v0, v1

    .line 146
    .local v0, "out":B
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    add-int/lit8 v1, v1, 0x1

    and-int/lit8 v1, v1, 0x3f

    iput v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    .line 148
    iget v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    if-nez v1, :cond_2a

    .line 150
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->advanceCounter()V

    .line 151
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->generateKeyStream([B)V

    .line 154
    :cond_2a
    return v0
.end method

.method public seekTo(J)J
    .registers 5
    .param p1, "position"    # J

    .prologue
    .line 330
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->reset()V

    .line 332
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method

.method protected setKey([B[B)V
    .registers 13
    .param p1, "keyBytes"    # [B
    .param p2, "ivBytes"    # [B

    .prologue
    const/16 v9, 0x20

    const/16 v8, 0x8

    const/16 v7, 0xc

    const/4 v6, 0x4

    const/4 v5, 0x0

    .line 361
    if-eqz p1, :cond_aa

    .line 363
    array-length v2, p1

    const/16 v3, 0x10

    if-eq v2, v3, :cond_2f

    array-length v2, p1

    if-eq v2, v9, :cond_2f

    .line 365
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->getAlgorithmName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " requires 128 bit or 256 bit key"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 369
    :cond_2f
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x1

    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 370
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x2

    invoke-static {p1, v6}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 371
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x3

    invoke-static {p1, v8}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 372
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    invoke-static {p1, v7}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v3

    aput v3, v2, v6

    .line 376
    array-length v2, p1

    if-ne v2, v9, :cond_bd

    .line 378
    sget-object v0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->sigma:[B

    .line 379
    .local v0, "constants":[B
    const/16 v1, 0x10

    .line 387
    .local v1, "offset":I
    :goto_59
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xb

    invoke-static {p1, v1}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 388
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    add-int/lit8 v3, v1, 0x4

    invoke-static {p1, v3}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v3

    aput v3, v2, v7

    .line 389
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xd

    add-int/lit8 v4, v1, 0x8

    invoke-static {p1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 390
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xe

    add-int/lit8 v4, v1, 0xc

    invoke-static {p1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 392
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    invoke-static {v0, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v3

    aput v3, v2, v5

    .line 393
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x5

    invoke-static {v0, v6}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 394
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xa

    invoke-static {v0, v8}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 395
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xf

    invoke-static {v0, v7}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 399
    .end local v0    # "constants":[B
    .end local v1    # "offset":I
    :cond_aa
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x6

    invoke-static {p2, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 400
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x7

    invoke-static {p2, v6}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    aput v4, v2, v3

    .line 401
    return-void

    .line 383
    :cond_bd
    sget-object v0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->tau:[B

    .line 384
    .restart local v0    # "constants":[B
    const/4 v1, 0x0

    .restart local v1    # "offset":I
    goto :goto_59
.end method

.method public skip(J)J
    .registers 14
    .param p1, "numberOfBytes"    # J

    .prologue
    const-wide/16 v9, 0x40

    .line 277
    const-wide/16 v7, 0x0

    cmp-long v7, p1, v7

    if-ltz v7, :cond_2c

    .line 279
    move-wide v5, p1

    .line 281
    .local v5, "remaining":J
    cmp-long v7, v5, v9

    if-ltz v7, :cond_15

    .line 283
    div-long v0, v5, v9

    .line 285
    .local v0, "count":J
    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->advanceCounter(J)V

    .line 287
    mul-long v7, v0, v9

    sub-long/2addr v5, v7

    .line 290
    .end local v0    # "count":J
    :cond_15
    iget v4, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    .line 292
    .local v4, "oldIndex":I
    iget v7, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    long-to-int v8, v5

    add-int/2addr v7, v8

    and-int/lit8 v7, v7, 0x3f

    iput v7, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    .line 294
    iget v7, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    if-ge v7, v4, :cond_26

    .line 296
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->advanceCounter()V

    .line 323
    .end local v4    # "oldIndex":I
    :cond_26
    iget-object v7, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    invoke-virtual {p0, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->generateKeyStream([B)V

    .line 325
    return-wide p1

    .line 301
    .end local v5    # "remaining":J
    :cond_2c
    neg-long v5, p1

    .line 303
    .restart local v5    # "remaining":J
    cmp-long v7, v5, v9

    if-ltz v7, :cond_39

    .line 305
    div-long v0, v5, v9

    .line 307
    .restart local v0    # "count":J
    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->retreatCounter(J)V

    .line 309
    mul-long v7, v0, v9

    sub-long/2addr v5, v7

    .line 312
    .end local v0    # "count":J
    :cond_39
    const-wide/16 v2, 0x0

    .local v2, "i":J
    :goto_3b
    cmp-long v7, v2, v5

    if-gez v7, :cond_26

    .line 314
    iget v7, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    if-nez v7, :cond_46

    .line 316
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->retreatCounter()V

    .line 319
    :cond_46
    iget v7, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    add-int/lit8 v7, v7, -0x1

    and-int/lit8 v7, v7, 0x3f

    iput v7, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->index:I

    .line 312
    const-wide/16 v7, 0x1

    add-long/2addr v2, v7

    goto :goto_3b
.end method
