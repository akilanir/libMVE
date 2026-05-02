.class public final Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;
.super Ljava/lang/Object;
.source "IntegerFunctions.java"


# static fields
.field private static final FOUR:Ljava/math/BigInteger;

.field private static final ONE:Ljava/math/BigInteger;

.field private static final SMALL_PRIMES:[I

.field private static final SMALL_PRIME_PRODUCT:J = 0x8a5b6470af95L

.field private static final TWO:Ljava/math/BigInteger;

.field private static final ZERO:Ljava/math/BigInteger;

.field private static final jacobiTable:[I

.field private static sr:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 13
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 15
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    .line 17
    const-wide/16 v0, 0x2

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    .line 19
    const-wide/16 v0, 0x4

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->FOUR:Ljava/math/BigInteger;

    .line 21
    const/16 v0, 0xc

    new-array v0, v0, [I

    fill-array-data v0, :array_36

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->SMALL_PRIMES:[I

    .line 27
    const/4 v0, 0x0

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->sr:Ljava/security/SecureRandom;

    .line 30
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_52

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->jacobiTable:[I

    return-void

    .line 21
    :array_36
    .array-data 4
        0x3
        0x5
        0x7
        0xb
        0xd
        0x11
        0x13
        0x17
        0x1d
        0x1f
        0x25
        0x29
    .end array-data

    .line 30
    :array_52
    .array-data 4
        0x0
        0x1
        0x0
        -0x1
        0x0
        -0x1
        0x0
        0x1
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static binomial(II)Ljava/math/BigInteger;
    .registers 7
    .param p0, "n"    # I
    .param p1, "t"    # I

    .prologue
    .line 1024
    sget-object v1, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    .line 1026
    .local v1, "result":Ljava/math/BigInteger;
    if-nez p0, :cond_b

    .line 1028
    if-nez p1, :cond_8

    move-object v2, v1

    .line 1047
    :goto_7
    return-object v2

    .line 1032
    :cond_8
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    goto :goto_7

    .line 1036
    :cond_b
    ushr-int/lit8 v2, p0, 0x1

    if-le p1, v2, :cond_11

    .line 1038
    sub-int p1, p0, p1

    .line 1041
    :cond_11
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_12
    if-gt v0, p1, :cond_2d

    .line 1043
    add-int/lit8 v2, v0, -0x1

    sub-int v2, p0, v2

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    int-to-long v3, v0

    .line 1044
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 1041
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    :cond_2d
    move-object v2, v1

    .line 1047
    goto :goto_7
.end method

.method public static bitCount(I)I
    .registers 3
    .param p0, "a"    # I

    .prologue
    .line 484
    const/4 v0, 0x0

    .line 485
    .local v0, "h":I
    :goto_1
    if-eqz p0, :cond_9

    .line 487
    and-int/lit8 v1, p0, 0x1

    add-int/2addr v0, v1

    .line 488
    ushr-int/lit8 p0, p0, 0x1

    goto :goto_1

    .line 491
    :cond_9
    return v0
.end method

.method public static ceilLog(I)I
    .registers 3
    .param p0, "a"    # I

    .prologue
    .line 337
    const/4 v1, 0x0

    .line 338
    .local v1, "log":I
    const/4 v0, 0x1

    .line 339
    .local v0, "i":I
    :goto_2
    if-ge v0, p0, :cond_9

    .line 341
    shl-int/lit8 v0, v0, 0x1

    .line 342
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 344
    :cond_9
    return v1
.end method

.method public static ceilLog(Ljava/math/BigInteger;)I
    .registers 4
    .param p0, "a"    # Ljava/math/BigInteger;

    .prologue
    .line 318
    const/4 v1, 0x0

    .line 319
    .local v1, "result":I
    sget-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    .line 320
    .local v0, "p":Ljava/math/BigInteger;
    :goto_3
    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    if-gez v2, :cond_11

    .line 322
    add-int/lit8 v1, v1, 0x1

    .line 323
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_3

    .line 325
    :cond_11
    return v1
.end method

.method public static ceilLog256(I)I
    .registers 3
    .param p0, "n"    # I

    .prologue
    .line 356
    if-nez p0, :cond_4

    .line 358
    const/4 v0, 0x1

    .line 376
    :cond_3
    return v0

    .line 361
    :cond_4
    if-gez p0, :cond_f

    .line 363
    neg-int v1, p0

    .line 370
    .local v1, "m":I
    :goto_7
    const/4 v0, 0x0

    .line 371
    .local v0, "d":I
    :goto_8
    if-lez v1, :cond_3

    .line 373
    add-int/lit8 v0, v0, 0x1

    .line 374
    ushr-int/lit8 v1, v1, 0x8

    goto :goto_8

    .line 367
    .end local v0    # "d":I
    .end local v1    # "m":I
    :cond_f
    move v1, p0

    .restart local v1    # "m":I
    goto :goto_7
.end method

.method public static ceilLog256(J)I
    .registers 8
    .param p0, "n"    # J

    .prologue
    const-wide/16 v4, 0x0

    .line 388
    cmp-long v3, p0, v4

    if-nez v3, :cond_8

    .line 390
    const/4 v0, 0x1

    .line 408
    :cond_7
    return v0

    .line 393
    :cond_8
    cmp-long v3, p0, v4

    if-gez v3, :cond_18

    .line 395
    neg-long v1, p0

    .line 402
    .local v1, "m":J
    :goto_d
    const/4 v0, 0x0

    .line 403
    .local v0, "d":I
    :goto_e
    cmp-long v3, v1, v4

    if-lez v3, :cond_7

    .line 405
    add-int/lit8 v0, v0, 0x1

    .line 406
    const/16 v3, 0x8

    ushr-long/2addr v1, v3

    goto :goto_e

    .line 399
    .end local v0    # "d":I
    .end local v1    # "m":J
    :cond_18
    move-wide v1, p0

    .restart local v1    # "m":J
    goto :goto_d
.end method

.method public static divideAndRound(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 4
    .param p0, "a"    # Ljava/math/BigInteger;
    .param p1, "b"    # Ljava/math/BigInteger;

    .prologue
    const/4 v1, 0x1

    .line 288
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v0

    if-gez v0, :cond_14

    .line 290
    invoke-virtual {p0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->divideAndRound(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    .line 296
    :goto_13
    return-object v0

    .line 292
    :cond_14
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result v0

    if-gez v0, :cond_27

    .line 294
    invoke-virtual {p1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->divideAndRound(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_13

    .line 296
    :cond_27
    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_13
.end method

.method public static divideAndRound([Ljava/math/BigInteger;Ljava/math/BigInteger;)[Ljava/math/BigInteger;
    .registers 5
    .param p0, "a"    # [Ljava/math/BigInteger;
    .param p1, "b"    # Ljava/math/BigInteger;

    .prologue
    .line 301
    array-length v2, p0

    new-array v1, v2, [Ljava/math/BigInteger;

    .line 302
    .local v1, "out":[Ljava/math/BigInteger;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_12

    .line 304
    aget-object v2, p0, v0

    invoke-static {v2, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->divideAndRound(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    aput-object v2, v1, v0

    .line 302
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 306
    :cond_12
    return-object v1
.end method

.method public static extGCD(II)[I
    .registers 11
    .param p0, "a"    # I
    .param p1, "b"    # I

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 276
    int-to-long v4, p0

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    .line 277
    .local v0, "ba":Ljava/math/BigInteger;
    int-to-long v4, p1

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 278
    .local v1, "bb":Ljava/math/BigInteger;
    invoke-static {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->extgcd(Ljava/math/BigInteger;Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v2

    .line 279
    .local v2, "bresult":[Ljava/math/BigInteger;
    const/4 v4, 0x3

    new-array v3, v4, [I

    .line 280
    .local v3, "result":[I
    aget-object v4, v2, v6

    invoke-virtual {v4}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    aput v4, v3, v6

    .line 281
    aget-object v4, v2, v7

    invoke-virtual {v4}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    aput v4, v3, v7

    .line 282
    aget-object v4, v2, v8

    invoke-virtual {v4}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    aput v4, v3, v8

    .line 283
    return-object v3
.end method

.method public static extgcd(Ljava/math/BigInteger;Ljava/math/BigInteger;)[Ljava/math/BigInteger;
    .registers 14
    .param p0, "a"    # Ljava/math/BigInteger;
    .param p1, "b"    # Ljava/math/BigInteger;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 627
    sget-object v5, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    .line 628
    .local v5, "u":Ljava/math/BigInteger;
    sget-object v6, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 629
    .local v6, "v":Ljava/math/BigInteger;
    move-object v0, p0

    .line 630
    .local v0, "d":Ljava/math/BigInteger;
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result v9

    if-eqz v9, :cond_37

    .line 632
    sget-object v7, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 633
    .local v7, "v1":Ljava/math/BigInteger;
    move-object v8, p1

    .line 634
    .local v8, "v3":Ljava/math/BigInteger;
    :goto_10
    invoke-virtual {v8}, Ljava/math/BigInteger;->signum()I

    move-result v9

    if-eqz v9, :cond_2b

    .line 636
    invoke-virtual {v0, v8}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v4

    .line 637
    .local v4, "tmp":[Ljava/math/BigInteger;
    aget-object v1, v4, v10

    .line 638
    .local v1, "q":Ljava/math/BigInteger;
    aget-object v3, v4, v11

    .line 639
    .local v3, "t3":Ljava/math/BigInteger;
    invoke-virtual {v1, v7}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 640
    .local v2, "t1":Ljava/math/BigInteger;
    move-object v5, v7

    .line 641
    move-object v0, v8

    .line 642
    move-object v7, v2

    .line 643
    move-object v8, v3

    .line 644
    goto :goto_10

    .line 645
    .end local v1    # "q":Ljava/math/BigInteger;
    .end local v2    # "t1":Ljava/math/BigInteger;
    .end local v3    # "t3":Ljava/math/BigInteger;
    .end local v4    # "tmp":[Ljava/math/BigInteger;
    :cond_2b
    invoke-virtual {p0, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 647
    .end local v7    # "v1":Ljava/math/BigInteger;
    .end local v8    # "v3":Ljava/math/BigInteger;
    :cond_37
    const/4 v9, 0x3

    new-array v9, v9, [Ljava/math/BigInteger;

    aput-object v0, v9, v10

    aput-object v5, v9, v11

    const/4 v10, 0x2

    aput-object v6, v9, v10

    return-object v9
.end method

.method public static floatPow(FI)F
    .registers 3
    .param p0, "f"    # F
    .param p1, "i"    # I

    .prologue
    .line 1163
    const/high16 v0, 0x3f800000    # 1.0f

    .line 1164
    .local v0, "g":F
    :goto_2
    if-lez p1, :cond_8

    .line 1166
    mul-float/2addr v0, p0

    .line 1164
    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    .line 1168
    :cond_8
    return v0
.end method

.method public static floorLog(I)I
    .registers 4
    .param p0, "a"    # I

    .prologue
    .line 439
    const/4 v0, 0x0

    .line 440
    .local v0, "h":I
    if-gtz p0, :cond_5

    .line 442
    const/4 v2, -0x1

    .line 451
    :goto_4
    return v2

    .line 444
    :cond_5
    ushr-int/lit8 v1, p0, 0x1

    .line 445
    .local v1, "p":I
    :goto_7
    if-lez v1, :cond_e

    .line 447
    add-int/lit8 v0, v0, 0x1

    .line 448
    ushr-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_e
    move v2, v0

    .line 451
    goto :goto_4
.end method

.method public static floorLog(Ljava/math/BigInteger;)I
    .registers 4
    .param p0, "a"    # Ljava/math/BigInteger;

    .prologue
    .line 420
    const/4 v1, -0x1

    .line 421
    .local v1, "result":I
    sget-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    .line 422
    .local v0, "p":Ljava/math/BigInteger;
    :goto_3
    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    if-gtz v2, :cond_11

    .line 424
    add-int/lit8 v1, v1, 0x1

    .line 425
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_3

    .line 427
    :cond_11
    return v1
.end method

.method public static gcd(II)I
    .registers 5
    .param p0, "u"    # I
    .param p1, "v"    # I

    .prologue
    .line 264
    int-to-long v0, p0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    int-to-long v1, p1

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    return v0
.end method

.method public static intRoot(II)F
    .registers 10
    .param p0, "base"    # I
    .param p1, "root"    # I

    .prologue
    .line 1136
    div-int v4, p0, p1

    int-to-float v1, v4

    .line 1137
    .local v1, "gNew":F
    const/4 v2, 0x0

    .line 1138
    .local v2, "gOld":F
    const/4 v0, 0x0

    .line 1139
    .local v0, "counter":I
    :goto_5
    sub-float v4, v2, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    float-to-double v4, v4

    const-wide v6, 0x3f1a36e2eb1c432dL    # 1.0E-4

    cmpl-double v4, v4, v6

    if-lez v4, :cond_3c

    .line 1141
    invoke-static {v1, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->floatPow(FI)F

    move-result v3

    .line 1142
    .local v3, "gPow":F
    :goto_19
    invoke-static {v3}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 1144
    add-float v4, v1, v2

    const/high16 v5, 0x40000000    # 2.0f

    div-float v1, v4, v5

    .line 1145
    invoke-static {v1, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->floatPow(FI)F

    move-result v3

    goto :goto_19

    .line 1147
    :cond_2a
    add-int/lit8 v0, v0, 0x1

    .line 1148
    move v2, v1

    .line 1149
    int-to-float v4, p0

    sub-float v4, v3, v4

    int-to-float v5, p1

    add-int/lit8 v6, p1, -0x1

    invoke-static {v2, v6}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->floatPow(FI)F

    move-result v6

    mul-float/2addr v5, v6

    div-float/2addr v4, v5

    sub-float v1, v2, v4

    .line 1150
    goto :goto_5

    .line 1151
    .end local v3    # "gPow":F
    :cond_3c
    return v1
.end method

.method public static integerToOctets(Ljava/math/BigInteger;)[B
    .registers 6
    .param p0, "val"    # Ljava/math/BigInteger;

    .prologue
    .line 1365
    invoke-virtual {p0}, Ljava/math/BigInteger;->abs()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v1

    .line 1368
    .local v1, "valBytes":[B
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    and-int/lit8 v2, v2, 0x7

    if-eqz v2, :cond_11

    .line 1375
    .end local v1    # "valBytes":[B
    :goto_10
    return-object v1

    .line 1373
    .restart local v1    # "valBytes":[B
    :cond_11
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    shr-int/lit8 v2, v2, 0x3

    new-array v0, v2, [B

    .line 1374
    .local v0, "tmp":[B
    const/4 v2, 0x1

    const/4 v3, 0x0

    array-length v4, v0

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v0

    .line 1375
    goto :goto_10
.end method

.method public static isIncreasing([I)Z
    .registers 5
    .param p0, "a"    # [I

    .prologue
    .line 1351
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_55

    .line 1353
    add-int/lit8 v1, v0, -0x1

    aget v1, p0, v1

    aget v2, p0, v0

    if-lt v1, v2, :cond_52

    .line 1355
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "a["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v3, v0, -0x1

    aget v3, p0, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " >= "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " = a["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1357
    const/4 v1, 0x0

    .line 1360
    :goto_51
    return v1

    .line 1351
    :cond_52
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1360
    :cond_55
    const/4 v1, 0x1

    goto :goto_51
.end method

.method public static isPower(II)I
    .registers 6
    .param p0, "a"    # I
    .param p1, "p"    # I

    .prologue
    const/4 v2, -0x1

    .line 723
    if-gtz p0, :cond_5

    move v1, v2

    .line 738
    :cond_4
    :goto_4
    return v1

    .line 727
    :cond_5
    const/4 v1, 0x0

    .line 728
    .local v1, "n":I
    move v0, p0

    .line 729
    .local v0, "d":I
    :goto_7
    const/4 v3, 0x1

    if-le v0, v3, :cond_4

    .line 731
    rem-int v3, v0, p1

    if-eqz v3, :cond_10

    move v1, v2

    .line 733
    goto :goto_4

    .line 735
    :cond_10
    div-int/2addr v0, p1

    .line 736
    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method public static isPrime(I)Z
    .registers 5
    .param p0, "n"    # I

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 785
    if-ge p0, v3, :cond_6

    .line 816
    :cond_5
    :goto_5
    return v1

    .line 789
    :cond_6
    if-ne p0, v3, :cond_a

    move v1, v2

    .line 791
    goto :goto_5

    .line 793
    :cond_a
    and-int/lit8 v3, p0, 0x1

    if-eqz v3, :cond_5

    .line 797
    const/16 v3, 0x2a

    if-ge p0, v3, :cond_23

    .line 799
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->SMALL_PRIMES:[I

    array-length v3, v3

    if-ge v0, v3, :cond_23

    .line 801
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->SMALL_PRIMES:[I

    aget v3, v3, v0

    if-ne p0, v3, :cond_20

    move v1, v2

    .line 803
    goto :goto_5

    .line 799
    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 808
    .end local v0    # "i":I
    :cond_23
    rem-int/lit8 v2, p0, 0x3

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x5

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x7

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0xb

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0xd

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x11

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x13

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x17

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x1d

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x1f

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x25

    if-eqz v2, :cond_5

    rem-int/lit8 v2, p0, 0x29

    if-eqz v2, :cond_5

    .line 816
    int-to-long v1, p0

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    const/16 v2, 0x14

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->isProbablePrime(I)Z

    move-result v1

    goto :goto_5
.end method

.method public static jacobi(Ljava/math/BigInteger;Ljava/math/BigInteger;)I
    .registers 12
    .param p0, "A"    # Ljava/math/BigInteger;
    .param p1, "B"    # Ljava/math/BigInteger;

    .prologue
    const/4 v9, -0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 58
    const-wide/16 v2, 0x1

    .line 60
    .local v2, "k":J
    const-wide/16 v2, 0x1

    .line 63
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {p1, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1f

    .line 65
    invoke-virtual {p0}, Ljava/math/BigInteger;->abs()Ljava/math/BigInteger;

    move-result-object v0

    .line 66
    .local v0, "a":Ljava/math/BigInteger;
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v0, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1d

    :goto_1b
    move v7, v6

    .line 135
    .end local v0    # "a":Ljava/math/BigInteger;
    :cond_1c
    :goto_1c
    return v7

    .restart local v0    # "a":Ljava/math/BigInteger;
    :cond_1d
    move v6, v7

    .line 66
    goto :goto_1b

    .line 69
    .end local v0    # "a":Ljava/math/BigInteger;
    :cond_1f
    invoke-virtual {p0, v7}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-nez v8, :cond_2b

    invoke-virtual {p1, v7}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-eqz v8, :cond_1c

    .line 74
    :cond_2b
    move-object v0, p0

    .line 75
    .restart local v0    # "a":Ljava/math/BigInteger;
    move-object v1, p1

    .line 77
    .local v1, "b":Ljava/math/BigInteger;
    invoke-virtual {v1}, Ljava/math/BigInteger;->signum()I

    move-result v8

    if-ne v8, v9, :cond_3f

    .line 79
    invoke-virtual {v1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v1

    .line 80
    invoke-virtual {v0}, Ljava/math/BigInteger;->signum()I

    move-result v8

    if-ne v8, v9, :cond_3f

    .line 82
    const-wide/16 v2, -0x1

    .line 86
    :cond_3f
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 87
    .local v4, "v":Ljava/math/BigInteger;
    :goto_41
    invoke-virtual {v1, v7}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-nez v8, :cond_54

    .line 89
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v4, v8}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    .line 90
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v1, v8}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_41

    .line 93
    :cond_54
    invoke-virtual {v4, v7}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-eqz v8, :cond_66

    .line 95
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->jacobiTable:[I

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v9

    and-int/lit8 v9, v9, 0x7

    aget v8, v8, v9

    int-to-long v8, v8

    mul-long/2addr v2, v8

    .line 98
    :cond_66
    invoke-virtual {v0}, Ljava/math/BigInteger;->signum()I

    move-result v8

    if-gez v8, :cond_77

    .line 100
    invoke-virtual {v1, v6}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-eqz v8, :cond_73

    .line 102
    neg-long v2, v2

    .line 104
    :cond_73
    invoke-virtual {v0}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v0

    .line 108
    :cond_77
    :goto_77
    invoke-virtual {v0}, Ljava/math/BigInteger;->signum()I

    move-result v8

    if-eqz v8, :cond_bf

    .line 110
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 111
    :goto_7f
    invoke-virtual {v0, v7}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-nez v8, :cond_92

    .line 113
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v4, v8}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    .line 114
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v0, v8}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_7f

    .line 116
    :cond_92
    invoke-virtual {v4, v7}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-eqz v8, :cond_a4

    .line 118
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->jacobiTable:[I

    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v9

    and-int/lit8 v9, v9, 0x7

    aget v8, v8, v9

    int-to-long v8, v8

    mul-long/2addr v2, v8

    .line 121
    :cond_a4
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v8

    if-gez v8, :cond_ba

    .line 124
    move-object v5, v0

    .line 125
    .local v5, "x":Ljava/math/BigInteger;
    move-object v0, v1

    .line 126
    move-object v1, v5

    .line 127
    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-eqz v8, :cond_ba

    invoke-virtual {v1, v6}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v8

    if-eqz v8, :cond_ba

    .line 129
    neg-long v2, v2

    .line 132
    .end local v5    # "x":Ljava/math/BigInteger;
    :cond_ba
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_77

    .line 135
    :cond_bf
    sget-object v6, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v6}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1c

    long-to-int v7, v2

    goto/16 :goto_1c
.end method

.method public static leastCommonMultiple([Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 6
    .param p0, "numbers"    # [Ljava/math/BigInteger;

    .prologue
    .line 658
    array-length v2, p0

    .line 659
    .local v2, "n":I
    const/4 v4, 0x0

    aget-object v3, p0, v4

    .line 660
    .local v3, "result":Ljava/math/BigInteger;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_5
    if-ge v1, v2, :cond_1a

    .line 662
    aget-object v4, p0, v1

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 663
    .local v0, "gcd":Ljava/math/BigInteger;
    aget-object v4, p0, v1

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 660
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 665
    .end local v0    # "gcd":Ljava/math/BigInteger;
    :cond_1a
    return-object v3
.end method

.method public static leastDiv(I)I
    .registers 3
    .param p0, "a"    # I

    .prologue
    .line 749
    if-gez p0, :cond_3

    .line 751
    neg-int p0, p0

    .line 753
    :cond_3
    if-nez p0, :cond_7

    .line 755
    const/4 v0, 0x1

    .line 771
    :cond_6
    :goto_6
    return v0

    .line 757
    :cond_7
    and-int/lit8 v1, p0, 0x1

    if-nez v1, :cond_d

    .line 759
    const/4 v0, 0x2

    goto :goto_6

    .line 761
    :cond_d
    const/4 v0, 0x3

    .line 762
    .local v0, "p":I
    :goto_e
    div-int v1, p0, v0

    if-gt v0, v1, :cond_19

    .line 764
    rem-int v1, p0, v0

    if-eqz v1, :cond_6

    .line 768
    add-int/lit8 v0, v0, 0x2

    goto :goto_e

    :cond_19
    move v0, p0

    .line 771
    goto :goto_6
.end method

.method public static log(D)D
    .registers 13
    .param p0, "x"    # D

    .prologue
    .line 1180
    const-wide/16 v9, 0x0

    cmpl-double v9, p0, v9

    if-lez v9, :cond_16

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    cmpg-double v9, p0, v9

    if-gez v9, :cond_16

    .line 1182
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    div-double v0, v9, p0

    .line 1183
    .local v0, "d":D
    invoke-static {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->log(D)D

    move-result-wide v9

    neg-double v4, v9

    .line 1199
    :goto_15
    return-wide v4

    .line 1187
    .end local v0    # "d":D
    :cond_16
    const/4 v6, 0x0

    .line 1188
    .local v6, "tmp":I
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 1189
    .local v7, "tmp2":D
    move-wide v0, p0

    .line 1191
    .restart local v0    # "d":D
    :goto_1a
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    cmpl-double v9, v0, v9

    if-lez v9, :cond_29

    .line 1193
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v9

    .line 1194
    add-int/lit8 v6, v6, 0x1

    .line 1195
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    mul-double/2addr v7, v9

    goto :goto_1a

    .line 1197
    :cond_29
    div-double v2, p0, v7

    .line 1198
    .local v2, "rem":D
    invoke-static {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->logBKM(D)D

    move-result-wide v2

    .line 1199
    int-to-double v9, v6

    add-double v4, v9, v2

    goto :goto_15
.end method

.method public static log(J)D
    .registers 11
    .param p0, "x"    # J

    .prologue
    .line 1211
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->floorLog(Ljava/math/BigInteger;)I

    move-result v2

    .line 1212
    .local v2, "tmp":I
    const/4 v5, 0x1

    shl-int/2addr v5, v2

    int-to-long v3, v5

    .line 1213
    .local v3, "tmp2":J
    long-to-double v5, p0

    long-to-double v7, v3

    div-double v0, v5, v7

    .line 1214
    .local v0, "rem":D
    invoke-static {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->logBKM(D)D

    move-result-wide v0

    .line 1215
    int-to-double v5, v2

    add-double/2addr v5, v0

    return-wide v5
.end method

.method private static logBKM(D)D
    .registers 15
    .param p0, "arg"    # D

    .prologue
    .line 1227
    const/16 v11, 0x64

    new-array v0, v11, [D

    fill-array-data v0, :array_26

    .line 1329
    .local v0, "ae":[D
    const/16 v2, 0x35

    .line 1330
    .local v2, "n":I
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 1331
    .local v5, "x":D
    const-wide/16 v7, 0x0

    .line 1333
    .local v7, "y":D
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 1336
    .local v3, "s":D
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_10
    if-ge v1, v2, :cond_24

    .line 1338
    mul-double v11, v5, v3

    add-double v9, v5, v11

    .line 1339
    .local v9, "z":D
    cmpg-double v11, v9, p0

    if-gtz v11, :cond_1e

    .line 1341
    move-wide v5, v9

    .line 1342
    aget-wide v11, v0, v1

    add-double/2addr v7, v11

    .line 1344
    :cond_1e
    const-wide/high16 v11, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v3, v11

    .line 1336
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 1346
    .end local v9    # "z":D
    :cond_24
    return-wide v7

    .line 1227
    nop

    :array_26
    .array-data 8
        0x3ff0000000000000L    # 1.0
        0x3fe2b803473f7ad1L    # 0.5849625007211562
        0x3fd49a784bcd1b8bL    # 0.32192809488736235
        0x3fc5c01a39fbd688L    # 0.16992500144231237
        0x3fb663f6fac91316L    # 0.0874628412503394
        0x3fa6bad3758efd87L    # 0.044394119358453436
        0x3f96e79685c2d22aL    # 0.02236781302845451
        0x3f86fe50b6ef0851L    # 0.01122725542325412
        0x3f7709c46d7aac77L    # 0.005624549193878107
        0x3f670f83ff0a7565L    # 0.0028150156070540383
        0x3f5712653743f454L    # 0.0014081943928083889
        0x3f4713d62f7957c3L    # 7.042690112466433E-4
        0x3f37148ec2a1bfc9L    # 3.5217748030102726E-4
        0x3f2714eb11fa5363L    # 1.7609948644250602E-4
        0x3f1715193b17d35dL    # 8.80524301221769E-5
        0x3f0715305002e4aeL    # 4.4026886827316716E-5
        0x3ef7153bda8f8225L    # 2.2013611360340496E-5
        0x3ee715419fdb9623L    # 1.1006847667481442E-5
        0x3ed7154482831175L    # 5.503434330648604E-6
        0x3ec71545f3d72b72L    # 2.751719789561283E-6
        0x3eb71546ac814f86L    # 1.375860550841138E-6
        0x3ea7154708d66756L    # 6.879304394358497E-7
        0x3e9715473700f4afL    # 3.4396526072176454E-7
        0x3e8715474e163bb8L    # 1.7198264061184464E-7
        0x3e77154759a0df53L    # 8.599132286866321E-8
        0x3e6715475f663127L    # 4.299566207501687E-8
        0x3e5715476248da12L    # 2.1497831197679756E-8
        0x3e47154763ba2e88L    # 1.0748915638882709E-8
        0x3e3715476472d8c3L    # 5.374457829452062E-9
        0x3e27154764cf2de1L    # 2.687228917228708E-9
        0x3e17154764fd586fL    # 1.3436144592400231E-9
        0x3e07154765146db7L    # 6.718072297764289E-10
        0x3df71547651ff85aL
        0x3de715476525bdacL    # 1.6795180747343547E-10
        0x3dd715476528a055L    # 8.397590373916176E-11
        0x3dc71547652a11aaL    # 4.1987951870191886E-11
        0x3db71547652aca54L
        0x3da71547652b26a9L    # 1.0496987967662534E-11
        0x3d971547652b54d4L    # 5.2484939838408146E-12
        0x3d871547652b6be9L    # 2.624246991922794E-12
        0x3d771547652b7773L    # 1.3121234959619935E-12
        0x3d671547652b7d39L    # 6.56061747981146E-13
        0x3d571547652b801bL    # 3.2803087399061026E-13
        0x3d471547652b818dL    # 1.6401543699531447E-13
        0x3d371547652b8245L    # 8.200771849765956E-14
        0x3d271547652b82a2L    # 4.1003859248830365E-14
        0x3d171547652b82d0L    # 2.0501929624415328E-14
        0x3d071547652b82e7L    # 1.02509648122077E-14
        0x3cf71547652b82f3L    # 5.1254824061038595E-15
        0x3ce71547652b82f8L
        0x3cd71547652b82fbL    # 1.2813706015259665E-15
        0x3cc71547652b82fdL    # 6.406853007629834E-16
        0x3cb71547652b82fdL    # 3.203426503814917E-16
        0x3ca71547652b82feL    # 1.6017132519074588E-16
        0x3c971547652b82feL    # 8.008566259537294E-17
        0x3c871547652b82feL    # 4.004283129768647E-17
        0x3c771547652b82feL    # 2.0021415648843235E-17
        0x3c671547652b82feL    # 1.0010707824421618E-17
        0x3c571547652b82feL    # 5.005353912210809E-18
        0x3c471547652b82feL    # 2.5026769561054044E-18
        0x3c371547652b82feL
        0x3c271547652b82feL    # 6.256692390263511E-19
        0x3c171547652b82feL    # 3.1283461951317555E-19
        0x3c071547652b82feL    # 1.5641730975658778E-19
        0x3bf71547652b82feL    # 7.820865487829389E-20
        0x3be71547652b82feL
        0x3bd71547652b82feL    # 1.9552163719573472E-20
        0x3bc71547652b82feL    # 9.776081859786736E-21
        0x3bb71547652b82feL    # 4.888040929893368E-21
        0x3ba71547652b82feL    # 2.444020464946684E-21
        0x3b971547652b82feL    # 1.222010232473342E-21
        0x3b871547652b82feL    # 6.11005116236671E-22
        0x3b771547652b82feL    # 3.055025581183355E-22
        0x3b671547652b82feL    # 1.5275127905916775E-22
        0x3b571547652b82feL    # 7.637563952958387E-23
        0x3b471547652b82feL    # 3.818781976479194E-23
        0x3b371547652b82feL    # 1.909390988239597E-23
        0x3b271547652b82feL    # 9.546954941197984E-24
        0x3b171547652b82feL    # 4.773477470598992E-24
        0x3b071547652b82feL    # 2.386738735299496E-24
        0x3af71547652b82feL    # 1.193369367649748E-24
        0x3ae71547652b82feL    # 5.96684683824874E-25
        0x3ad71547652b82feL    # 2.98342341912437E-25
        0x3ac71547652b82feL    # 1.491711709562185E-25
        0x3ab71547652b82feL    # 7.458558547810925E-26
        0x3aa71547652b82feL
        0x3a971547652b82feL    # 1.8646396369527313E-26
        0x3a871547652b82feL    # 9.323198184763657E-27
        0x3a771547652b82feL    # 4.661599092381828E-27
        0x3a671547652b82feL    # 2.330799546190914E-27
        0x3a571547652b82feL    # 1.165399773095457E-27
        0x3a471547652b82feL    # 5.826998865477285E-28
        0x3a371547652b82feL    # 2.9134994327386427E-28
        0x3a271547652b82feL    # 1.4567497163693213E-28
        0x3a171547652b82feL    # 7.283748581846607E-29
        0x3a071547652b82feL
        0x39f71547652b82feL    # 1.8209371454616517E-29
        0x39e71547652b82feL    # 9.104685727308258E-30
        0x39d71547652b82feL    # 4.552342863654129E-30
        0x39c71547652b82feL    # 2.2761714318270646E-30
    .end array-data
.end method

.method public static maxPower(I)I
    .registers 4
    .param p0, "a"    # I

    .prologue
    .line 463
    const/4 v0, 0x0

    .line 464
    .local v0, "h":I
    if-eqz p0, :cond_d

    .line 466
    const/4 v1, 0x1

    .line 467
    .local v1, "p":I
    :goto_4
    and-int v2, p0, v1

    if-nez v2, :cond_d

    .line 469
    add-int/lit8 v0, v0, 0x1

    .line 470
    shl-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 474
    .end local v1    # "p":I
    :cond_d
    return v0
.end method

.method public static mod(JJ)J
    .registers 8
    .param p0, "a"    # J
    .param p2, "m"    # J

    .prologue
    .line 679
    rem-long v0, p0, p2

    .line 680
    .local v0, "result":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_9

    .line 682
    add-long/2addr v0, p2

    .line 684
    :cond_9
    return-wide v0
.end method

.method public static modInverse(II)I
    .registers 5
    .param p0, "a"    # I
    .param p1, "mod"    # I

    .prologue
    .line 696
    int-to-long v0, p0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    int-to-long v1, p1

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 697
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    return v0
.end method

.method public static modInverse(JJ)J
    .registers 6
    .param p0, "a"    # J
    .param p2, "mod"    # J

    .prologue
    .line 709
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-static {p2, p3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 710
    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public static modPow(III)I
    .registers 6
    .param p0, "a"    # I
    .param p1, "e"    # I
    .param p2, "n"    # I

    .prologue
    .line 600
    if-lez p2, :cond_b

    mul-int v1, p2, p2

    const v2, 0x7fffffff

    if-gt v1, v2, :cond_b

    if-gez p1, :cond_d

    .line 602
    :cond_b
    const/4 v0, 0x0

    .line 615
    :cond_c
    return v0

    .line 604
    :cond_d
    const/4 v0, 0x1

    .line 605
    .local v0, "result":I
    rem-int v1, p0, p2

    add-int/2addr v1, p2

    rem-int p0, v1, p2

    .line 606
    :goto_13
    if-lez p1, :cond_c

    .line 608
    and-int/lit8 v1, p1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1e

    .line 610
    mul-int v1, v0, p0

    rem-int v0, v1, p2

    .line 612
    :cond_1e
    mul-int v1, p0, p0

    rem-int p0, v1, p2

    .line 613
    ushr-int/lit8 p1, p1, 0x1

    goto :goto_13
.end method

.method public static nextPrime(J)Ljava/math/BigInteger;
    .registers 16
    .param p0, "n"    # J

    .prologue
    const/4 v13, 0x1

    const-wide/16 v9, 0x1

    const-wide/16 v11, 0x2

    .line 975
    const/4 v0, 0x0

    .line 976
    .local v0, "found":Z
    const-wide/16 v5, 0x0

    .line 978
    .local v5, "result":J
    cmp-long v7, p0, v9

    if-gtz v7, :cond_11

    .line 980
    invoke-static {v11, v12}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    .line 1006
    :goto_10
    return-object v7

    .line 982
    :cond_11
    cmp-long v7, p0, v11

    if-nez v7, :cond_1c

    .line 984
    const-wide/16 v7, 0x3

    invoke-static {v7, v8}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    goto :goto_10

    .line 987
    :cond_1c
    add-long v7, p0, v9

    and-long/2addr v9, p0

    add-long v1, v7, v9

    .local v1, "i":J
    :goto_21
    shl-long v7, p0, v13

    cmp-long v7, v1, v7

    if-gtz v7, :cond_46

    if-nez v0, :cond_46

    .line 989
    const-wide/16 v3, 0x3

    .local v3, "j":J
    :goto_2b
    shr-long v7, v1, v13

    cmp-long v7, v3, v7

    if-gtz v7, :cond_3e

    if-nez v0, :cond_3e

    .line 991
    rem-long v7, v1, v3

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-nez v7, :cond_3c

    .line 993
    const/4 v0, 0x1

    .line 989
    :cond_3c
    add-long/2addr v3, v11

    goto :goto_2b

    .line 996
    :cond_3e
    if-eqz v0, :cond_43

    .line 998
    const/4 v0, 0x0

    .line 987
    :goto_41
    add-long/2addr v1, v11

    goto :goto_21

    .line 1002
    :cond_43
    move-wide v5, v1

    .line 1003
    const/4 v0, 0x1

    goto :goto_41

    .line 1006
    .end local v3    # "j":J
    :cond_46
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    goto :goto_10
.end method

.method public static nextProbablePrime(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 2
    .param p0, "n"    # Ljava/math/BigInteger;

    .prologue
    .line 963
    const/16 v0, 0x14

    invoke-static {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->nextProbablePrime(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public static nextProbablePrime(Ljava/math/BigInteger;I)Ljava/math/BigInteger;
    .registers 9
    .param p0, "n"    # Ljava/math/BigInteger;
    .param p1, "certainty"    # I

    .prologue
    const-wide/16 v5, 0x0

    .line 908
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-ltz v3, :cond_16

    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-eqz v3, :cond_16

    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 910
    :cond_16
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    .line 947
    :cond_18
    return-object v2

    .line 913
    :cond_19
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 916
    .local v2, "result":Ljava/math/BigInteger;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 918
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 924
    :cond_2c
    :goto_2c
    invoke-virtual {v2}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    const/4 v4, 0x6

    if-le v3, v4, :cond_ab

    .line 926
    const-wide v3, 0x8a5b6470af95L

    .line 927
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    .line 926
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 927
    invoke-virtual {v3}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v0

    .line 928
    .local v0, "r":J
    const-wide/16 v3, 0x3

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x5

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x7

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0xb

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0xd

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x11

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x13

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x17

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x1d

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x1f

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x25

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a4

    const-wide/16 v3, 0x29

    rem-long v3, v0, v3

    cmp-long v3, v3, v5

    if-nez v3, :cond_ab

    .line 933
    :cond_a4
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 934
    goto :goto_2c

    .line 939
    .end local v0    # "r":J
    :cond_ab
    invoke-virtual {v2}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    const/4 v4, 0x4

    if-lt v3, v4, :cond_18

    .line 945
    invoke-virtual {v2, p1}, Ljava/math/BigInteger;->isProbablePrime(I)Z

    move-result v3

    if-nez v3, :cond_18

    .line 950
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    goto/16 :goto_2c
.end method

.method public static nextSmallerPrime(I)I
    .registers 6
    .param p0, "n"    # I

    .prologue
    const/4 v4, 0x3

    const/4 v0, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 871
    if-gt p0, v0, :cond_7

    .line 894
    :goto_6
    return v1

    .line 876
    :cond_7
    if-ne p0, v4, :cond_b

    move v1, v0

    .line 878
    goto :goto_6

    .line 881
    :cond_b
    and-int/lit8 v0, p0, 0x1

    if-nez v0, :cond_21

    .line 883
    add-int/lit8 p0, p0, -0x1

    .line 890
    :goto_11
    if-le p0, v4, :cond_24

    move v0, v1

    :goto_14
    invoke-static {p0}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->isPrime(I)Z

    move-result v3

    if-nez v3, :cond_26

    move v3, v1

    :goto_1b
    and-int/2addr v0, v3

    if-eqz v0, :cond_28

    .line 892
    add-int/lit8 p0, p0, -0x2

    goto :goto_11

    .line 887
    :cond_21
    add-int/lit8 p0, p0, -0x2

    goto :goto_11

    :cond_24
    move v0, v2

    .line 890
    goto :goto_14

    :cond_26
    move v3, v2

    goto :goto_1b

    :cond_28
    move v1, p0

    .line 894
    goto :goto_6
.end method

.method public static octetsToInteger([B)Ljava/math/BigInteger;
    .registers 3
    .param p0, "data"    # [B

    .prologue
    .line 1390
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->octetsToInteger([BII)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public static octetsToInteger([BII)Ljava/math/BigInteger;
    .registers 6
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/4 v2, 0x0

    .line 1381
    add-int/lit8 v1, p2, 0x1

    new-array v0, v1, [B

    .line 1383
    .local v0, "val":[B
    aput-byte v2, v0, v2

    .line 1384
    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1385
    new-instance v1, Ljava/math/BigInteger;

    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>([B)V

    return-object v1
.end method

.method public static order(II)I
    .registers 7
    .param p0, "g"    # I
    .param p1, "p"    # I

    .prologue
    .line 507
    rem-int v0, p0, p1

    .line 508
    .local v0, "b":I
    const/4 v1, 0x1

    .line 511
    .local v1, "j":I
    if-nez v0, :cond_28

    .line 513
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not an element of Z/("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Z)^*; it is not meaningful to compute its order."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 518
    :cond_28
    :goto_28
    const/4 v2, 0x1

    if-eq v0, v2, :cond_33

    .line 520
    mul-int/2addr v0, p0

    .line 521
    rem-int/2addr v0, p1

    .line 522
    if-gez v0, :cond_30

    .line 524
    add-int/2addr v0, p1

    .line 526
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 529
    :cond_33
    return v1
.end method

.method public static passesSmallPrimeTest(Ljava/math/BigInteger;)Z
    .registers 5
    .param p0, "candidate"    # Ljava/math/BigInteger;

    .prologue
    .line 829
    const/16 v2, 0xef

    new-array v1, v2, [I

    fill-array-data v1, :array_26

    .line 851
    .local v1, "smallPrime":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v2, v1

    if-ge v0, v2, :cond_23

    .line 853
    aget v2, v1, v0

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 856
    const/4 v2, 0x0

    .line 859
    :goto_1f
    return v2

    .line 851
    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 859
    :cond_23
    const/4 v2, 0x1

    goto :goto_1f

    .line 829
    nop

    :array_26
    .array-data 4
        0x2
        0x3
        0x5
        0x7
        0xb
        0xd
        0x11
        0x13
        0x17
        0x1d
        0x1f
        0x25
        0x29
        0x2b
        0x2f
        0x35
        0x3b
        0x3d
        0x43
        0x47
        0x49
        0x4f
        0x53
        0x59
        0x61
        0x65
        0x67
        0x6b
        0x6d
        0x71
        0x7f
        0x83
        0x89
        0x8b
        0x95
        0x97
        0x9d
        0xa3
        0xa7
        0xad
        0xb3
        0xb5
        0xbf
        0xc1
        0xc5
        0xc7
        0xd3
        0xdf
        0xe3
        0xe5
        0xe9
        0xef
        0xf1
        0xfb
        0x101
        0x107
        0x10d
        0x10f
        0x115
        0x119
        0x11b
        0x125
        0x133
        0x137
        0x139
        0x13d
        0x14b
        0x151
        0x15b
        0x15d
        0x161
        0x167
        0x16f
        0x175
        0x17b
        0x17f
        0x185
        0x18d
        0x191
        0x199
        0x1a3
        0x1a5
        0x1af
        0x1b1
        0x1b7
        0x1bb
        0x1c1
        0x1c9
        0x1cd
        0x1cf
        0x1d3
        0x1df
        0x1e7
        0x1eb
        0x1f3
        0x1f7
        0x1fd
        0x209
        0x20b
        0x21d
        0x223
        0x22d
        0x233
        0x239
        0x23b
        0x241
        0x24b
        0x251
        0x257
        0x259
        0x25f
        0x265
        0x269
        0x26b
        0x277
        0x281
        0x283
        0x287
        0x28d
        0x293
        0x295
        0x2a1
        0x2a5
        0x2ab
        0x2b3
        0x2bd
        0x2c5
        0x2cf
        0x2d7
        0x2dd
        0x2e3
        0x2e7
        0x2ef
        0x2f5
        0x2f9
        0x301
        0x305
        0x313
        0x31d
        0x329
        0x32b
        0x335
        0x337
        0x33b
        0x33d
        0x347
        0x355
        0x359
        0x35b
        0x35f
        0x36d
        0x371
        0x373
        0x377
        0x38b
        0x38f
        0x397
        0x3a1
        0x3a9
        0x3ad
        0x3b3
        0x3b9
        0x3c7
        0x3cb
        0x3d1
        0x3d7
        0x3df
        0x3e5
        0x3f1
        0x3f5
        0x3fb
        0x3fd
        0x407
        0x409
        0x40f
        0x419
        0x41b
        0x425
        0x427
        0x42d
        0x43f
        0x443
        0x445
        0x449
        0x44f
        0x455
        0x45d
        0x463
        0x469
        0x47f
        0x481
        0x48b
        0x493
        0x49d
        0x4a3
        0x4a9
        0x4b1
        0x4bd
        0x4c1
        0x4c7
        0x4cd
        0x4cf
        0x4d5
        0x4e1
        0x4eb
        0x4fd
        0x4ff
        0x503
        0x509
        0x50b
        0x511
        0x515
        0x517
        0x51b
        0x527
        0x529
        0x52f
        0x551
        0x557
        0x55d
        0x565
        0x577
        0x581
        0x58f
        0x593    # 2.0E-42f
        0x595
        0x599
        0x59f
        0x5a7
        0x5ab
        0x5ad
        0x5b3
        0x5bf
        0x5c9
        0x5cb
        0x5cf
        0x5d1
        0x5d5
        0x5db
    .end array-data
.end method

.method public static pow(II)I
    .registers 5
    .param p0, "a"    # I
    .param p1, "e"    # I

    .prologue
    .line 555
    const/4 v0, 0x1

    .line 556
    .local v0, "result":I
    :goto_1
    if-lez p1, :cond_d

    .line 558
    and-int/lit8 v1, p1, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_9

    .line 560
    mul-int/2addr v0, p0

    .line 562
    :cond_9
    mul-int/2addr p0, p0

    .line 563
    ushr-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 565
    :cond_d
    return v0
.end method

.method public static pow(JI)J
    .registers 7
    .param p0, "a"    # J
    .param p2, "e"    # I

    .prologue
    .line 577
    const-wide/16 v0, 0x1

    .line 578
    .local v0, "result":J
    :goto_2
    if-lez p2, :cond_e

    .line 580
    and-int/lit8 v2, p2, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_a

    .line 582
    mul-long/2addr v0, p0

    .line 584
    :cond_a
    mul-long/2addr p0, p0

    .line 585
    ushr-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 587
    :cond_e
    return-wide v0
.end method

.method public static randomize(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 2
    .param p0, "upperBound"    # Ljava/math/BigInteger;

    .prologue
    .line 1052
    sget-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->sr:Ljava/security/SecureRandom;

    if-nez v0, :cond_b

    .line 1054
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->sr:Ljava/security/SecureRandom;

    .line 1056
    :cond_b
    sget-object v0, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->sr:Ljava/security/SecureRandom;

    invoke-static {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->randomize(Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public static randomize(Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;
    .registers 7
    .param p0, "upperBound"    # Ljava/math/BigInteger;
    .param p1, "prng"    # Ljava/security/SecureRandom;

    .prologue
    .line 1062
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    .line 1063
    .local v0, "blen":I
    const-wide/16 v3, 0x0

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    .line 1065
    .local v2, "randomNum":Ljava/math/BigInteger;
    if-nez p1, :cond_12

    .line 1067
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->sr:Ljava/security/SecureRandom;

    if-eqz v3, :cond_24

    sget-object p1, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->sr:Ljava/security/SecureRandom;

    .line 1070
    :cond_12
    :goto_12
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    const/16 v3, 0x14

    if-ge v1, v3, :cond_2d

    .line 1072
    new-instance v2, Ljava/math/BigInteger;

    .end local v2    # "randomNum":Ljava/math/BigInteger;
    invoke-direct {v2, v0, p1}, Ljava/math/BigInteger;-><init>(ILjava/util/Random;)V

    .line 1073
    .restart local v2    # "randomNum":Ljava/math/BigInteger;
    invoke-virtual {v2, p0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v3

    if-gez v3, :cond_2a

    move-object v3, v2

    .line 1078
    :goto_23
    return-object v3

    .line 1067
    .end local v1    # "i":I
    :cond_24
    new-instance p1, Ljava/security/SecureRandom;

    .end local p1    # "prng":Ljava/security/SecureRandom;
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    goto :goto_12

    .line 1070
    .restart local v1    # "i":I
    .restart local p1    # "prng":Ljava/security/SecureRandom;
    :cond_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 1078
    :cond_2d
    invoke-virtual {v2, p0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    goto :goto_23
.end method

.method public static reduceInto(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 5
    .param p0, "n"    # Ljava/math/BigInteger;
    .param p1, "begin"    # Ljava/math/BigInteger;
    .param p2, "end"    # Ljava/math/BigInteger;

    .prologue
    .line 543
    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p2, p1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public static ressol(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 19
    .param p0, "a"    # Ljava/math/BigInteger;
    .param p1, "p"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 152
    const/4 v12, 0x0

    .line 154
    .local v12, "v":Ljava/math/BigInteger;
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v14

    if-gez v14, :cond_f

    .line 156
    invoke-virtual/range {p0 .. p1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    .line 159
    :cond_f
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1c

    .line 161
    sget-object v7, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 252
    :cond_1b
    :goto_1b
    return-object v7

    .line 164
    :cond_1c
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_29

    move-object/from16 v7, p0

    .line 166
    goto :goto_1b

    .line 170
    :cond_29
    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v14

    if-eqz v14, :cond_7f

    const/4 v14, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v14

    if-eqz v14, :cond_7f

    .line 172
    invoke-static/range {p0 .. p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->jacobi(Ljava/math/BigInteger;Ljava/math/BigInteger;)I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_58

    .line 174
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    .line 175
    const/4 v14, 0x2

    invoke-virtual {v12, v14}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v12

    .line 176
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v12, v1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    goto :goto_1b

    .line 179
    :cond_58
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "No quadratic residue: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ", "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 182
    :cond_7f
    const-wide/16 v10, 0x0

    .line 187
    .local v10, "t":J
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 188
    .local v5, "k":Ljava/math/BigInteger;
    const-wide/16 v8, 0x0

    .line 189
    .local v8, "s":J
    :goto_8b
    const/4 v14, 0x0

    invoke-virtual {v5, v14}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v14

    if-nez v14, :cond_9b

    .line 191
    const-wide/16 v14, 0x1

    add-long/2addr v8, v14

    .line 192
    const/4 v14, 0x1

    invoke-virtual {v5, v14}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v5

    goto :goto_8b

    .line 195
    :cond_9b
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v5, v14}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 196
    const/4 v14, 0x1

    invoke-virtual {v5, v14}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v5

    .line 199
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v5, v1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 201
    .local v7, "r":Ljava/math/BigInteger;
    invoke-virtual {v7, v7}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 202
    .local v6, "n":Ljava/math/BigInteger;
    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 203
    move-object/from16 v0, p0

    invoke-virtual {v7, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 205
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v6, v14}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_1b

    .line 211
    sget-object v13, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    .line 212
    .local v13, "z":Ljava/math/BigInteger;
    :goto_da
    move-object/from16 v0, p1

    invoke-static {v13, v0}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->jacobi(Ljava/math/BigInteger;Ljava/math/BigInteger;)I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_ea

    .line 215
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v13, v14}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v13

    goto :goto_da

    .line 218
    :cond_ea
    move-object v12, v5

    .line 219
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v12, v14}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    .line 220
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v12, v14}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v12

    .line 221
    move-object/from16 v0, p1

    invoke-virtual {v13, v12, v0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 224
    .local v2, "c":Ljava/math/BigInteger;
    :goto_fd
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v6, v14}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_1b

    .line 226
    move-object v5, v6

    .line 227
    move-wide v10, v8

    .line 228
    const-wide/16 v8, 0x0

    .line 230
    :goto_10a
    sget-object v14, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v5, v14}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_120

    .line 232
    invoke-virtual {v5, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 233
    const-wide/16 v14, 0x1

    add-long/2addr v8, v14

    goto :goto_10a

    .line 236
    :cond_120
    sub-long/2addr v10, v8

    .line 237
    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-nez v14, :cond_14e

    .line 239
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "No quadratic residue: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ", "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 242
    :cond_14e
    sget-object v12, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    .line 243
    const-wide/16 v3, 0x0

    .local v3, "i":J
    :goto_152
    const-wide/16 v14, 0x1

    sub-long v14, v10, v14

    cmp-long v14, v3, v14

    if-gez v14, :cond_163

    .line 245
    const/4 v14, 0x1

    invoke-virtual {v12, v14}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v12

    .line 243
    const-wide/16 v14, 0x1

    add-long/2addr v3, v14

    goto :goto_152

    .line 247
    :cond_163
    move-object/from16 v0, p1

    invoke-virtual {v2, v12, v0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 248
    invoke-virtual {v7, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 249
    invoke-virtual {v2, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 250
    invoke-virtual {v6, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    goto/16 :goto_fd
.end method

.method public static squareRoot(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 9
    .param p0, "a"    # Ljava/math/BigInteger;

    .prologue
    const/4 v5, 0x0

    .line 1092
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {p0, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-gez v4, :cond_28

    .line 1094
    new-instance v4, Ljava/lang/ArithmeticException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cannot extract root of negative number"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1098
    :cond_28
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    .line 1099
    .local v1, "bl":I
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 1100
    .local v3, "result":Ljava/math/BigInteger;
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ZERO:Ljava/math/BigInteger;

    .line 1103
    .local v2, "remainder":Ljava/math/BigInteger;
    and-int/lit8 v4, v1, 0x1

    if-eqz v4, :cond_3c

    .line 1105
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 1106
    add-int/lit8 v1, v1, -0x1

    .line 1109
    :cond_3c
    :goto_3c
    if-lez v1, :cond_88

    .line 1111
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->FOUR:Ljava/math/BigInteger;

    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 1112
    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v4

    if-eqz v4, :cond_84

    const/4 v4, 0x2

    :goto_4d
    add-int/lit8 v1, v1, -0x1

    .line 1114
    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->testBit(I)Z

    move-result v6

    if-eqz v6, :cond_86

    const/4 v6, 0x1

    :goto_56
    add-int/2addr v4, v6

    int-to-long v6, v4

    .line 1112
    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 1115
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->FOUR:Ljava/math/BigInteger;

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    sget-object v6, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v4, v6}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 1116
    .local v0, "b":Ljava/math/BigInteger;
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->TWO:Ljava/math/BigInteger;

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 1117
    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    const/4 v6, -0x1

    if-eq v4, v6, :cond_3c

    .line 1119
    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 1120
    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    goto :goto_3c

    .end local v0    # "b":Ljava/math/BigInteger;
    :cond_84
    move v4, v5

    .line 1112
    goto :goto_4d

    :cond_86
    move v6, v5

    .line 1114
    goto :goto_56

    .line 1124
    :cond_88
    return-object v3
.end method
