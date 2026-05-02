.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;
.super Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
.source "GF2nONBField.java"


# static fields
.field private static final MAXLONG:I = 0x40


# instance fields
.field private mBit:I

.field private mLength:I

.field mMult:[[I

.field private mType:I


# direct methods
.method public constructor <init>(ILjava/security/SecureRandom;)V
    .registers 7
    .param p1, "deg"    # I
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x3

    const/4 v3, -0x1

    .line 110
    invoke-direct {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;-><init>(Ljava/security/SecureRandom;)V

    .line 112
    if-ge p1, v2, :cond_f

    .line 114
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "k must be at least 3"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    :cond_f
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    .line 118
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    div-int/lit8 v1, v1, 0x40

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mLength:I

    .line 119
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    and-int/lit8 v1, v1, 0x3f

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mBit:I

    .line 120
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mBit:I

    if-nez v1, :cond_53

    .line 122
    const/16 v1, 0x40

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mBit:I

    .line 129
    :goto_25
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->computeType()V

    .line 133
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    if-ge v1, v2, :cond_6f

    .line 135
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    const/4 v2, 0x2

    filled-new-array {v1, v2}, [I

    move-result-object v1

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[I

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    .line 136
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3e
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v0, v1, :cond_5a

    .line 138
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x0

    aput v3, v1, v2

    .line 139
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x1

    aput v3, v1, v2

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_3e

    .line 126
    .end local v0    # "i":I
    :cond_53
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mLength:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mLength:I

    goto :goto_25

    .line 141
    .restart local v0    # "i":I
    :cond_5a
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->computeMultMatrix()V

    .line 148
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->computeFieldPolynomial()V

    .line 149
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->fields:Ljava/util/Vector;

    .line 150
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->matrices:Ljava/util/Vector;

    .line 151
    return-void

    .line 145
    .end local v0    # "i":I
    :cond_6f
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\nThe type of this field is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private computeMultMatrix()V
    .registers 16

    .prologue
    const/4 v14, 0x2

    const/4 v13, -0x1

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 396
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    and-int/lit8 v9, v9, 0x7

    if-eqz v9, :cond_10c

    .line 398
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    iget v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    mul-int/2addr v9, v10

    add-int/lit8 v6, v9, 0x1

    .line 403
    .local v6, "p":I
    new-array v0, v6, [I

    .line 406
    .local v0, "F":[I
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    if-ne v9, v12, :cond_30

    .line 408
    const/4 v7, 0x1

    .line 419
    .local v7, "u":I
    :goto_18
    const/4 v8, 0x1

    .line 421
    .local v8, "w":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1a
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    if-ge v2, v9, :cond_48

    .line 423
    move v5, v8

    .line 425
    .local v5, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v1, v9, :cond_3e

    .line 427
    aput v1, v0, v5

    .line 428
    shl-int/lit8 v9, v5, 0x1

    rem-int v5, v9, v6

    .line 429
    if-gez v5, :cond_2d

    .line 431
    add-int/2addr v5, v6

    .line 425
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 410
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v5    # "n":I
    .end local v7    # "u":I
    .end local v8    # "w":I
    :cond_30
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    if-ne v9, v14, :cond_37

    .line 412
    add-int/lit8 v7, v6, -0x1

    .restart local v7    # "u":I
    goto :goto_18

    .line 416
    .end local v7    # "u":I
    :cond_37
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    invoke-direct {p0, v9, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->elementOfOrder(II)I

    move-result v7

    .restart local v7    # "u":I
    goto :goto_18

    .line 434
    .restart local v1    # "i":I
    .restart local v2    # "j":I
    .restart local v5    # "n":I
    .restart local v8    # "w":I
    :cond_3e
    mul-int v9, v7, v8

    rem-int v8, v9, v6

    .line 435
    if-gez v8, :cond_45

    .line 437
    add-int/2addr v8, v6

    .line 421
    :cond_45
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 443
    .end local v1    # "i":I
    .end local v5    # "n":I
    :cond_48
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    if-ne v9, v12, :cond_cf

    .line 445
    const/4 v3, 0x1

    .local v3, "k":I
    :goto_4d
    add-int/lit8 v9, v6, -0x1

    if-ge v3, v9, :cond_7d

    .line 447
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, 0x1

    aget v10, v0, v10

    aget-object v9, v9, v10

    aget v9, v9, v11

    if-ne v9, v13, :cond_6e

    .line 449
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, 0x1

    aget v10, v0, v10

    aget-object v9, v9, v10

    sub-int v10, v6, v3

    aget v10, v0, v10

    aput v10, v9, v11

    .line 445
    :goto_6b
    add-int/lit8 v3, v3, 0x1

    goto :goto_4d

    .line 453
    :cond_6e
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, 0x1

    aget v10, v0, v10

    aget-object v9, v9, v10

    sub-int v10, v6, v3

    aget v10, v0, v10

    aput v10, v9, v12

    goto :goto_6b

    .line 457
    :cond_7d
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    shr-int/lit8 v4, v9, 0x1

    .line 458
    .local v4, "m_2":I
    const/4 v3, 0x1

    :goto_82
    if-gt v3, v4, :cond_114

    .line 461
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, -0x1

    aget-object v9, v9, v10

    aget v9, v9, v11

    if-ne v9, v13, :cond_b5

    .line 463
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, -0x1

    aget-object v9, v9, v10

    add-int v10, v4, v3

    add-int/lit8 v10, v10, -0x1

    aput v10, v9, v11

    .line 470
    :goto_9a
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int v10, v4, v3

    add-int/lit8 v10, v10, -0x1

    aget-object v9, v9, v10

    aget v9, v9, v11

    if-ne v9, v13, :cond_c2

    .line 472
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int v10, v4, v3

    add-int/lit8 v10, v10, -0x1

    aget-object v9, v9, v10

    add-int/lit8 v10, v3, -0x1

    aput v10, v9, v11

    .line 458
    :goto_b2
    add-int/lit8 v3, v3, 0x1

    goto :goto_82

    .line 467
    :cond_b5
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, -0x1

    aget-object v9, v9, v10

    add-int v10, v4, v3

    add-int/lit8 v10, v10, -0x1

    aput v10, v9, v12

    goto :goto_9a

    .line 476
    :cond_c2
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int v10, v4, v3

    add-int/lit8 v10, v10, -0x1

    aget-object v9, v9, v10

    add-int/lit8 v10, v3, -0x1

    aput v10, v9, v12

    goto :goto_b2

    .line 480
    .end local v3    # "k":I
    .end local v4    # "m_2":I
    :cond_cf
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    if-ne v9, v14, :cond_104

    .line 482
    const/4 v3, 0x1

    .restart local v3    # "k":I
    :goto_d4
    add-int/lit8 v9, v6, -0x1

    if-ge v3, v9, :cond_114

    .line 484
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, 0x1

    aget v10, v0, v10

    aget-object v9, v9, v10

    aget v9, v9, v11

    if-ne v9, v13, :cond_f5

    .line 486
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, 0x1

    aget v10, v0, v10

    aget-object v9, v9, v10

    sub-int v10, v6, v3

    aget v10, v0, v10

    aput v10, v9, v11

    .line 482
    :goto_f2
    add-int/lit8 v3, v3, 0x1

    goto :goto_d4

    .line 490
    :cond_f5
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    add-int/lit8 v10, v3, 0x1

    aget v10, v0, v10

    aget-object v9, v9, v10

    sub-int v10, v6, v3

    aget v10, v0, v10

    aput v10, v9, v12

    goto :goto_f2

    .line 496
    .end local v3    # "k":I
    :cond_104
    new-instance v9, Ljava/lang/RuntimeException;

    const-string v10, "only type 1 or type 2 implemented"

    invoke-direct {v9, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 501
    .end local v0    # "F":[I
    .end local v2    # "j":I
    .end local v6    # "p":I
    .end local v7    # "u":I
    .end local v8    # "w":I
    :cond_10c
    new-instance v9, Ljava/lang/RuntimeException;

    const-string v10, "bisher nur fuer Gausssche Normalbasen implementiert"

    invoke-direct {v9, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 504
    .restart local v0    # "F":[I
    .restart local v2    # "j":I
    .restart local v3    # "k":I
    .restart local v6    # "p":I
    .restart local v7    # "u":I
    .restart local v8    # "w":I
    :cond_114
    return-void
.end method

.method private computeType()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 359
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    and-int/lit8 v3, v3, 0x7

    if-nez v3, :cond_10

    .line 361
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "The extension degree is divisible by 8!"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 365
    :cond_10
    const/4 v2, 0x0

    .line 366
    .local v2, "s":I
    const/4 v1, 0x0

    .line 367
    .local v1, "k":I
    iput v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    .line 368
    const/4 v0, 0x0

    .local v0, "d":I
    :goto_15
    if-eq v0, v5, :cond_3b

    .line 370
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    mul-int/2addr v3, v4

    add-int/lit8 v2, v3, 0x1

    .line 371
    invoke-static {v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->isPrime(I)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 373
    invoke-static {v6, v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->order(II)I

    move-result v1

    .line 374
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    mul-int/2addr v3, v4

    div-int/2addr v3, v1

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    invoke-static {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->gcd(II)I

    move-result v0

    .line 368
    :cond_34
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    goto :goto_15

    .line 377
    :cond_3b
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    .line 378
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    if-ne v3, v5, :cond_68

    .line 380
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    shl-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v3, 0x1

    .line 381
    invoke-static {v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->isPrime(I)Z

    move-result v3

    if-eqz v3, :cond_68

    .line 383
    invoke-static {v6, v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->order(II)I

    move-result v1

    .line 384
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    shl-int/lit8 v3, v3, 0x1

    div-int/2addr v3, v1

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    invoke-static {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->gcd(II)I

    move-result v0

    .line 385
    if-ne v0, v5, :cond_68

    .line 387
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    .line 391
    :cond_68
    return-void
.end method

.method private elementOfOrder(II)I
    .registers 9
    .param p1, "k"    # I
    .param p2, "p"    # I

    .prologue
    .line 508
    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    .line 509
    .local v4, "random":Ljava/util/Random;
    const/4 v2, 0x0

    .line 510
    .local v2, "m":I
    :cond_6
    :goto_6
    if-nez v2, :cond_15

    .line 512
    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    move-result v2

    .line 513
    add-int/lit8 v5, p2, -0x1

    rem-int/2addr v2, v5

    .line 514
    if-gez v2, :cond_6

    .line 516
    add-int/lit8 v5, p2, -0x1

    add-int/2addr v2, v5

    goto :goto_6

    .line 520
    :cond_15
    invoke-static {v2, p2}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->order(II)I

    move-result v1

    .line 522
    .local v1, "l":I
    :goto_19
    rem-int v5, v1, p1

    if-nez v5, :cond_1f

    if-nez v1, :cond_33

    .line 524
    :cond_1f
    :goto_1f
    if-nez v2, :cond_2e

    .line 526
    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    move-result v2

    .line 527
    add-int/lit8 v5, p2, -0x1

    rem-int/2addr v2, v5

    .line 528
    if-gez v2, :cond_1f

    .line 530
    add-int/lit8 v5, p2, -0x1

    add-int/2addr v2, v5

    goto :goto_1f

    .line 533
    :cond_2e
    invoke-static {v2, p2}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->order(II)I

    move-result v1

    goto :goto_19

    .line 535
    :cond_33
    move v3, v2

    .line 537
    .local v3, "r":I
    div-int v1, p1, v1

    .line 539
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_37
    if-gt v0, v1, :cond_3d

    .line 541
    mul-int/2addr v3, v2

    .line 539
    add-int/lit8 v0, v0, 0x1

    goto :goto_37

    .line 544
    :cond_3d
    return v3
.end method


# virtual methods
.method protected computeCOBMatrix(Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V
    .registers 9
    .param p1, "B1"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .prologue
    .line 244
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    iget v6, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    if-eq v5, v6, :cond_e

    .line 246
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "GF2nField.computeCOBMatrix: B1 has a different degree and thus cannot be coverted to!"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 253
    :cond_e
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    new-array v0, v5, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 254
    .local v0, "COBMatrix":[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v2, v5, :cond_23

    .line 256
    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    invoke-direct {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    aput-object v5, v0, v2

    .line 254
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 263
    :cond_23
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    invoke-virtual {p1, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->getRandomRoot(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    move-result-object v4

    .line 265
    .local v4, "u":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->isZero()Z

    move-result v5

    if-nez v5, :cond_23

    .line 267
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    new-array v1, v5, [Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;

    .line 269
    .local v1, "gamma":[Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    const/4 v6, 0x0

    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    aput-object v5, v1, v6

    .line 270
    const/4 v2, 0x1

    :goto_3d
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v2, v5, :cond_4e

    .line 272
    add-int/lit8 v5, v2, -0x1

    aget-object v5, v1, v5

    invoke-virtual {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->square()Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    move-result-object v5

    aput-object v5, v1, v2

    .line 270
    add-int/lit8 v2, v2, 0x1

    goto :goto_3d

    .line 275
    :cond_4e
    const/4 v2, 0x0

    :goto_4f
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v2, v5, :cond_75

    .line 277
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_54
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v3, v5, :cond_72

    .line 279
    aget-object v5, v1, v2

    invoke-virtual {v5, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->testBit(I)Z

    move-result v5

    if-eqz v5, :cond_6f

    .line 281
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    sub-int/2addr v5, v3

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v0, v5

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    sub-int/2addr v6, v2

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 277
    :cond_6f
    add-int/lit8 v3, v3, 0x1

    goto :goto_54

    .line 275
    :cond_72
    add-int/lit8 v2, v2, 0x1

    goto :goto_4f

    .line 286
    .end local v3    # "j":I
    :cond_75
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->fields:Ljava/util/Vector;

    invoke-virtual {v5, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 287
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->matrices:Ljava/util/Vector;

    invoke-virtual {v5, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 288
    iget-object v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fields:Ljava/util/Vector;

    invoke-virtual {v5, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 289
    iget-object v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->matrices:Ljava/util/Vector;

    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->invertMatrix([Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 290
    return-void
.end method

.method protected computeFieldPolynomial()V
    .registers 8

    .prologue
    .line 300
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_13

    .line 302
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    add-int/lit8 v5, v5, 0x1

    const-string v6, "ALL"

    invoke-direct {v4, v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/lang/String;)V

    iput-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 326
    :cond_12
    :goto_12
    return-void

    .line 304
    :cond_13
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mType:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_12

    .line 307
    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    add-int/lit8 v4, v4, 0x1

    const-string v5, "ONE"

    invoke-direct {v2, v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/lang/String;)V

    .line 309
    .local v2, "q":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    add-int/lit8 v4, v4, 0x1

    const-string v5, "X"

    invoke-direct {v1, v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/lang/String;)V

    .line 310
    .local v1, "p":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    invoke-virtual {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 314
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_32
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v0, v4, :cond_42

    .line 317
    move-object v3, v2

    .line 319
    .local v3, "r":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    move-object v2, v1

    .line 321
    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeft()Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    move-result-object v1

    .line 322
    invoke-virtual {v1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 314
    add-int/lit8 v0, v0, 0x1

    goto :goto_32

    .line 324
    .end local v3    # "r":Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    :cond_42
    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    goto :goto_12
.end method

.method getONBBit()I
    .registers 2

    .prologue
    .line 164
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mBit:I

    return v0
.end method

.method getONBLength()I
    .registers 2

    .prologue
    .line 159
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mLength:I

    return v0
.end method

.method protected getRandomRoot(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .registers 13
    .param p1, "polynomial"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .prologue
    const/4 v10, 0x1

    .line 187
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    invoke-direct {v1, p1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V

    .line 188
    .local v1, "g":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v2

    .line 192
    .local v2, "gDegree":I
    :goto_a
    if-le v2, v10, :cond_5a

    .line 197
    :cond_c
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->random:Ljava/security/SecureRandom;

    invoke-direct {v6, p0, v8}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;Ljava/security/SecureRandom;)V

    .line 198
    .local v6, "u":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    new-instance v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    const/4 v8, 0x2

    invoke-static {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->ZERO(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(ILorg/spongycastle/pqc/math/linearalgebra/GF2nElement;)V

    .line 200
    .local v7, "ut":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-virtual {v7, v10, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->set(ILorg/spongycastle/pqc/math/linearalgebra/GF2nElement;)V

    .line 201
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    invoke-direct {v0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)V

    .line 203
    .local v0, "c":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_26
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    add-int/lit8 v8, v8, -0x1

    if-gt v5, v8, :cond_37

    .line 206
    invoke-virtual {v0, v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->multiplyAndReduce(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v0

    .line 207
    invoke-virtual {v0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->add(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v0

    .line 203
    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    .line 210
    :cond_37
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->gcd(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v3

    .line 213
    .local v3, "h":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v4

    .line 214
    .local v4, "hDegree":I
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v2

    .line 216
    if-eqz v4, :cond_c

    if-eq v4, v2, :cond_c

    .line 218
    shl-int/lit8 v8, v4, 0x1

    if-le v8, v2, :cond_54

    .line 220
    invoke-virtual {v1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->quotient(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    move-result-object v1

    .line 227
    :goto_4f
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->getDegree()I

    move-result v2

    goto :goto_a

    .line 225
    :cond_54
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;

    .end local v1    # "g":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    invoke-direct {v1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;)V

    .restart local v1    # "g":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    goto :goto_4f

    .line 230
    .end local v0    # "c":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    .end local v3    # "h":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    .end local v4    # "hDegree":I
    .end local v5    # "i":I
    .end local v6    # "u":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .end local v7    # "ut":Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;
    :cond_5a
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomial;->at(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    move-result-object v8

    return-object v8
.end method

.method invMatrix([[I)[[I
    .registers 8
    .param p1, "a"    # [[I

    .prologue
    .line 337
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    filled-new-array {v4, v5}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    .line 338
    .local v0, "A":[[I
    move-object v0, p1

    .line 339
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    filled-new-array {v4, v5}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[I

    .line 341
    .local v2, "inv":[[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_22
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v1, v4, :cond_2e

    .line 343
    aget-object v4, v2, v1

    const/4 v5, 0x1

    aput v5, v4, v1

    .line 341
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 346
    :cond_2e
    const/4 v1, 0x0

    :goto_2f
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v1, v4, :cond_4b

    .line 348
    move v3, v1

    .local v3, "j":I
    :goto_34
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    if-ge v3, v4, :cond_48

    .line 350
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mDegree:I

    add-int/lit8 v4, v4, -0x1

    sub-int/2addr v4, v1

    aget-object v4, v0, v4

    aget-object v5, v0, v1

    aget v5, v5, v1

    aput v5, v4, v3

    .line 348
    add-int/lit8 v3, v3, 0x1

    goto :goto_34

    .line 346
    :cond_48
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 353
    .end local v3    # "j":I
    :cond_4b
    const/4 v4, 0x0

    check-cast v4, [[I

    return-object v4
.end method
