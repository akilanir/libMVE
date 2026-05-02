.class public Lorg/spongycastle/math/ec/custom/sec/SecT571Field;
.super Ljava/lang/Object;
.source "SecT571Field.java"


# static fields
.field private static final M59:J = 0x7ffffffffffffffL

.field private static final RM:J = -0x1084210842108422L

.field private static final ROOT_Z:[J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/16 v0, 0x9

    new-array v0, v0, [J

    fill-array-data v0, :array_a

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->ROOT_Z:[J

    return-void

    :array_a
    .array-data 8
        0x2be1195f08cafb99L    # 2.5016400602366306E-97
        -0x6a0f73507b9a83ddL    # -5.27848393260514E-203
        -0x3507b9a83dcd41efL    # -1.4531635499737842E53
        0x657c232be1195f08L    # 7.297283174828906E180
        -0x7b9a83dcf73507cL
        0x7c232be1195f08caL    # 9.34156735235881E289
        -0x41ee6a0f73507b9bL    # -1.02362256409199E-9
        0x5f08caf84657c232L    # 6.340366030377565E149
        0x784657c232be119L
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static add([JI[JI[JI)V
    .registers 12
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y"    # [J
    .param p3, "yOff"    # I
    .param p4, "z"    # [J
    .param p5, "zOff"    # I

    .prologue
    .line 28
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x9

    if-ge v0, v1, :cond_15

    .line 30
    add-int v1, p5, v0

    add-int v2, p1, v0

    aget-wide v2, p0, v2

    add-int v4, p3, v0

    aget-wide v4, p2, v4

    xor-long/2addr v2, v4

    aput-wide v2, p4, v1

    .line 28
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 32
    :cond_15
    return-void
.end method

.method public static add([J[J[J)V
    .registers 8
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    .line 20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x9

    if-ge v0, v1, :cond_f

    .line 22
    aget-wide v1, p0, v0

    aget-wide v3, p1, v0

    xor-long/2addr v1, v3

    aput-wide v1, p2, v0

    .line 20
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 24
    :cond_f
    return-void
.end method

.method private static addBothTo([JI[JI[JI)V
    .registers 14
    .param p0, "x"    # [J
    .param p1, "xOff"    # I
    .param p2, "y"    # [J
    .param p3, "yOff"    # I
    .param p4, "z"    # [J
    .param p5, "zOff"    # I

    .prologue
    .line 36
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x9

    if-ge v0, v1, :cond_18

    .line 38
    add-int v1, p5, v0

    aget-wide v2, p4, v1

    add-int v4, p1, v0

    aget-wide v4, p0, v4

    add-int v6, p3, v0

    aget-wide v6, p2, v6

    xor-long/2addr v4, v6

    xor-long/2addr v2, v4

    aput-wide v2, p4, v1

    .line 36
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 40
    :cond_18
    return-void
.end method

.method public static addExt([J[J[J)V
    .registers 8
    .param p0, "xx"    # [J
    .param p1, "yy"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 44
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x12

    if-ge v0, v1, :cond_f

    .line 46
    aget-wide v1, p0, v0

    aget-wide v3, p1, v0

    xor-long/2addr v1, v3

    aput-wide v1, p2, v0

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 48
    :cond_f
    return-void
.end method

.method public static addOne([J[J)V
    .registers 8
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    const/4 v5, 0x0

    .line 52
    aget-wide v1, p0, v5

    const-wide/16 v3, 0x1

    xor-long/2addr v1, v3

    aput-wide v1, p1, v5

    .line 53
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_9
    const/16 v1, 0x9

    if-ge v0, v1, :cond_14

    .line 55
    aget-wide v1, p0, v0

    aput-wide v1, p1, v0

    .line 53
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 57
    :cond_14
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[J
    .registers 3
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 61
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat576;->fromBigInteger64(Ljava/math/BigInteger;)[J

    move-result-object v0

    .line 62
    .local v0, "z":[J
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->reduce5([JI)V

    .line 63
    return-object v0
.end method

.method protected static implMultiply([J[J[J)V
    .registers 28
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 232
    const/16 v1, 0x90

    new-array v2, v1, [J

    .line 233
    .local v2, "T0":[J
    const/4 v1, 0x0

    const/16 v3, 0x9

    const/16 v4, 0x9

    move-object/from16 v0, p1

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 235
    const/4 v7, 0x0

    .line 236
    .local v7, "tOff":I
    const/16 v20, 0x7

    .local v20, "i":I
    :goto_11
    if-lez v20, :cond_2f

    .line 238
    add-int/lit8 v7, v7, 0x12

    .line 239
    const/16 v1, 0x9

    ushr-int/lit8 v3, v7, 0x1

    const-wide/16 v4, 0x0

    move-object v6, v2

    invoke-static/range {v1 .. v7}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit64(I[JIJ[JI)J

    .line 240
    invoke-static {v2, v7}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->reduce5([JI)V

    .line 241
    const/16 v5, 0x9

    add-int/lit8 v9, v7, 0x9

    move-object v4, v2

    move-object v6, v2

    move-object v8, v2

    invoke-static/range {v4 .. v9}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->add([JI[JI[JI)V

    .line 236
    add-int/lit8 v20, v20, -0x1

    goto :goto_11

    .line 247
    :cond_2f
    array-length v1, v2

    new-array v14, v1, [J

    .line 248
    .local v14, "T1":[J
    array-length v8, v2

    const/4 v10, 0x0

    const/4 v11, 0x4

    const-wide/16 v12, 0x0

    const/4 v15, 0x0

    move-object v9, v2

    invoke-static/range {v8 .. v15}, Lorg/spongycastle/math/raw/Nat;->shiftUpBits64(I[JIIJ[JI)J

    .line 250
    const/16 v18, 0xf

    .line 256
    .local v18, "MASK":I
    const/16 v22, 0x38

    .local v22, "k":I
    :goto_40
    if-ltz v22, :cond_79

    .line 258
    const/16 v17, 0x1

    .local v17, "j":I
    move/from16 v21, v17

    .end local v17    # "j":I
    .local v21, "j":I
    :goto_46
    const/16 v1, 0x9

    move/from16 v0, v21

    if-ge v0, v1, :cond_6a

    .line 260
    aget-wide v3, p0, v21

    ushr-long v3, v3, v22

    long-to-int v0, v3

    move/from16 v19, v0

    .line 261
    .local v19, "aVal":I
    and-int v23, v19, v18

    .line 262
    .local v23, "u":I
    ushr-int/lit8 v1, v19, 0x4

    and-int v24, v1, v18

    .line 263
    .local v24, "v":I
    mul-int/lit8 v13, v23, 0x9

    mul-int/lit8 v15, v24, 0x9

    add-int/lit8 v17, v21, -0x1

    move-object v12, v2

    move-object/from16 v16, p2

    invoke-static/range {v12 .. v17}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->addBothTo([JI[JI[JI)V

    .line 258
    add-int/lit8 v17, v21, 0x2

    .end local v21    # "j":I
    .restart local v17    # "j":I
    move/from16 v21, v17

    .end local v17    # "j":I
    .restart local v21    # "j":I
    goto :goto_46

    .line 265
    .end local v19    # "aVal":I
    .end local v23    # "u":I
    .end local v24    # "v":I
    :cond_6a
    const/16 v8, 0x10

    const/4 v10, 0x0

    const/16 v11, 0x8

    const-wide/16 v12, 0x0

    move-object/from16 v9, p2

    invoke-static/range {v8 .. v13}, Lorg/spongycastle/math/raw/Nat;->shiftUpBits64(I[JIIJ)J

    .line 256
    add-int/lit8 v22, v22, -0x8

    goto :goto_40

    .line 268
    .end local v21    # "j":I
    :cond_79
    const/16 v22, 0x38

    :goto_7b
    if-ltz v22, :cond_b0

    .line 270
    const/16 v17, 0x0

    .restart local v17    # "j":I
    :goto_7f
    const/16 v1, 0x9

    move/from16 v0, v17

    if-ge v0, v1, :cond_9f

    .line 272
    aget-wide v3, p0, v17

    ushr-long v3, v3, v22

    long-to-int v0, v3

    move/from16 v19, v0

    .line 273
    .restart local v19    # "aVal":I
    and-int v23, v19, v18

    .line 274
    .restart local v23    # "u":I
    ushr-int/lit8 v1, v19, 0x4

    and-int v24, v1, v18

    .line 275
    .restart local v24    # "v":I
    mul-int/lit8 v13, v23, 0x9

    mul-int/lit8 v15, v24, 0x9

    move-object v12, v2

    move-object/from16 v16, p2

    invoke-static/range {v12 .. v17}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->addBothTo([JI[JI[JI)V

    .line 270
    add-int/lit8 v17, v17, 0x2

    goto :goto_7f

    .line 277
    .end local v19    # "aVal":I
    .end local v23    # "u":I
    .end local v24    # "v":I
    :cond_9f
    if-lez v22, :cond_ad

    .line 279
    const/16 v8, 0x12

    const/4 v10, 0x0

    const/16 v11, 0x8

    const-wide/16 v12, 0x0

    move-object/from16 v9, p2

    invoke-static/range {v8 .. v13}, Lorg/spongycastle/math/raw/Nat;->shiftUpBits64(I[JIIJ)J

    .line 268
    :cond_ad
    add-int/lit8 v22, v22, -0x8

    goto :goto_7b

    .line 282
    .end local v17    # "j":I
    :cond_b0
    return-void
.end method

.method protected static implMulwAcc([JJ[JI)V
    .registers 21
    .param p0, "xs"    # [J
    .param p1, "y"    # J
    .param p3, "z"    # [J
    .param p4, "zOff"    # I

    .prologue
    .line 286
    const/16 v13, 0x20

    new-array v10, v13, [J

    .line 288
    .local v10, "u":[J
    const/4 v13, 0x1

    aput-wide p1, v10, v13

    .line 289
    const/4 v4, 0x2

    .local v4, "i":I
    :goto_8
    const/16 v13, 0x20

    if-ge v4, v13, :cond_1f

    .line 291
    ushr-int/lit8 v13, v4, 0x1

    aget-wide v13, v10, v13

    const/4 v15, 0x1

    shl-long/2addr v13, v15

    aput-wide v13, v10, v4

    .line 292
    add-int/lit8 v13, v4, 0x1

    aget-wide v14, v10, v4

    xor-long v14, v14, p1

    aput-wide v14, v10, v13

    .line 289
    add-int/lit8 v4, v4, 0x2

    goto :goto_8

    .line 295
    :cond_1f
    const-wide/16 v7, 0x0

    .line 296
    .local v7, "l":J
    const/4 v4, 0x0

    :goto_22
    const/16 v13, 0x9

    if-ge v4, v13, :cond_66

    .line 298
    aget-wide v11, p0, v4

    .line 300
    .local v11, "x":J
    long-to-int v5, v11

    .line 302
    .local v5, "j":I
    and-int/lit8 v13, v5, 0x1f

    aget-wide v13, v10, v13

    xor-long/2addr v7, v13

    .line 304
    const-wide/16 v2, 0x0

    .line 305
    .local v2, "h":J
    const/16 v6, 0x3c

    .line 308
    .local v6, "k":I
    :cond_32
    ushr-long v13, v11, v6

    long-to-int v5, v13

    .line 309
    and-int/lit8 v13, v5, 0x1f

    aget-wide v0, v10, v13

    .line 310
    .local v0, "g":J
    shl-long v13, v0, v6

    xor-long/2addr v7, v13

    .line 311
    neg-int v13, v6

    ushr-long v13, v0, v13

    xor-long/2addr v2, v13

    .line 313
    add-int/lit8 v6, v6, -0x5

    if-gtz v6, :cond_32

    .line 315
    const/4 v9, 0x0

    .local v9, "p":I
    :goto_45
    const/4 v13, 0x4

    if-ge v9, v13, :cond_5b

    .line 317
    const-wide v13, -0x1084210842108422L    # -1.0564009196602605E229

    and-long/2addr v13, v11

    const/4 v15, 0x1

    ushr-long v11, v13, v15

    .line 318
    shl-long v13, p1, v9

    const/16 v15, 0x3f

    shr-long/2addr v13, v15

    and-long/2addr v13, v11

    xor-long/2addr v2, v13

    .line 315
    add-int/lit8 v9, v9, 0x1

    goto :goto_45

    .line 321
    :cond_5b
    add-int v13, p4, v4

    aget-wide v14, p3, v13

    xor-long/2addr v14, v7

    aput-wide v14, p3, v13

    .line 323
    move-wide v7, v2

    .line 296
    add-int/lit8 v4, v4, 0x1

    goto :goto_22

    .line 325
    .end local v0    # "g":J
    .end local v2    # "h":J
    .end local v5    # "j":I
    .end local v6    # "k":I
    .end local v9    # "p":I
    .end local v11    # "x":J
    :cond_66
    add-int/lit8 v13, p4, 0x9

    aget-wide v14, p3, v13

    xor-long/2addr v14, v7

    aput-wide v14, p3, v13

    .line 326
    return-void
.end method

.method protected static implSquare([J[J)V
    .registers 6
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    .line 330
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x9

    if-ge v0, v1, :cond_f

    .line 332
    aget-wide v1, p0, v0

    shl-int/lit8 v3, v0, 0x1

    invoke-static {v1, v2, p1, v3}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 330
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 334
    :cond_f
    return-void
.end method

.method public static invert([J[J)V
    .registers 10
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    const/16 v7, 0xb4

    const/16 v6, 0x3c

    const/16 v5, 0x1e

    const/4 v4, 0x5

    .line 68
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat576;->isZero64([J)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 70
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 75
    :cond_13
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->create64()[J

    move-result-object v0

    .line 76
    .local v0, "t0":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->create64()[J

    move-result-object v1

    .line 77
    .local v1, "t1":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->create64()[J

    move-result-object v2

    .line 79
    .local v2, "t2":[J
    invoke-static {p0, v2}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->square([J[J)V

    .line 82
    invoke-static {v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->square([J[J)V

    .line 83
    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->square([J[J)V

    .line 84
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 85
    const/4 v3, 0x2

    invoke-static {v0, v3, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 86
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 87
    invoke-static {v0, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 90
    invoke-static {v0, v4, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 91
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 92
    invoke-static {v1, v4, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 93
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 96
    const/16 v3, 0xf

    invoke-static {v0, v3, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 97
    invoke-static {v0, v1, v2}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 100
    invoke-static {v2, v5, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 101
    invoke-static {v0, v5, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 102
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 105
    invoke-static {v0, v6, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 106
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 107
    invoke-static {v1, v6, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 108
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 111
    invoke-static {v0, v7, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 112
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 113
    invoke-static {v1, v7, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->squareN([JI[J)V

    .line 114
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 116
    invoke-static {v0, v2, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 117
    return-void
.end method

.method public static multiply([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    .line 121
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->createExt64()[J

    move-result-object v0

    .line 122
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->implMultiply([J[J[J)V

    .line 123
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->reduce([J[J)V

    .line 124
    return-void
.end method

.method public static multiplyAddToExt([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 128
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->createExt64()[J

    move-result-object v0

    .line 129
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->implMultiply([J[J[J)V

    .line 130
    invoke-static {p2, v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->addExt([J[J[J)V

    .line 131
    return-void
.end method

.method public static reduce([J[J)V
    .registers 18
    .param p0, "xx"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 135
    const/16 v11, 0x9

    aget-wide v9, p0, v11

    .line 136
    .local v9, "xx09":J
    const/16 v11, 0x11

    aget-wide v3, p0, v11

    .local v3, "u":J
    move-wide v5, v9

    .line 138
    .local v5, "v":J
    const/16 v11, 0x3b

    ushr-long v11, v3, v11

    xor-long/2addr v11, v5

    const/16 v13, 0x39

    ushr-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0x36

    ushr-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0x31

    ushr-long v13, v3, v13

    xor-long v9, v11, v13

    .line 139
    const/16 v11, 0x8

    aget-wide v11, p0, v11

    const/4 v13, 0x5

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/4 v13, 0x7

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0xa

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0xf

    shl-long v13, v3, v13

    xor-long v5, v11, v13

    .line 141
    const/16 v0, 0x10

    .local v0, "i":I
    :goto_37
    const/16 v11, 0xa

    if-lt v0, v11, :cond_6f

    .line 143
    aget-wide v3, p0, v0

    .line 144
    add-int/lit8 v11, v0, -0x8

    const/16 v12, 0x3b

    ushr-long v12, v3, v12

    xor-long/2addr v12, v5

    const/16 v14, 0x39

    ushr-long v14, v3, v14

    xor-long/2addr v12, v14

    const/16 v14, 0x36

    ushr-long v14, v3, v14

    xor-long/2addr v12, v14

    const/16 v14, 0x31

    ushr-long v14, v3, v14

    xor-long/2addr v12, v14

    aput-wide v12, p1, v11

    .line 145
    add-int/lit8 v11, v0, -0x9

    aget-wide v11, p0, v11

    const/4 v13, 0x5

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/4 v13, 0x7

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0xa

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0xf

    shl-long v13, v3, v13

    xor-long v5, v11, v13

    .line 141
    add-int/lit8 v0, v0, -0x1

    goto :goto_37

    .line 148
    :cond_6f
    move-wide v3, v9

    .line 149
    const/4 v11, 0x1

    const/16 v12, 0x3b

    ushr-long v12, v3, v12

    xor-long/2addr v12, v5

    const/16 v14, 0x39

    ushr-long v14, v3, v14

    xor-long/2addr v12, v14

    const/16 v14, 0x36

    ushr-long v14, v3, v14

    xor-long/2addr v12, v14

    const/16 v14, 0x31

    ushr-long v14, v3, v14

    xor-long/2addr v12, v14

    aput-wide v12, p1, v11

    .line 150
    const/4 v11, 0x0

    aget-wide v11, p0, v11

    const/4 v13, 0x5

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/4 v13, 0x7

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0xa

    shl-long v13, v3, v13

    xor-long/2addr v11, v13

    const/16 v13, 0xf

    shl-long v13, v3, v13

    xor-long v5, v11, v13

    .line 152
    const/16 v11, 0x8

    aget-wide v7, p1, v11

    .line 153
    .local v7, "x08":J
    const/16 v11, 0x3b

    ushr-long v1, v7, v11

    .line 154
    .local v1, "t":J
    const/4 v11, 0x0

    xor-long v12, v5, v1

    const/4 v14, 0x2

    shl-long v14, v1, v14

    xor-long/2addr v12, v14

    const/4 v14, 0x5

    shl-long v14, v1, v14

    xor-long/2addr v12, v14

    const/16 v14, 0xa

    shl-long v14, v1, v14

    xor-long/2addr v12, v14

    aput-wide v12, p1, v11

    .line 155
    const/16 v11, 0x8

    const-wide v12, 0x7ffffffffffffffL

    and-long/2addr v12, v7

    aput-wide v12, p1, v11

    .line 156
    return-void
.end method

.method public static reduce5([JI)V
    .registers 12
    .param p0, "z"    # [J
    .param p1, "zOff"    # I

    .prologue
    .line 160
    add-int/lit8 v4, p1, 0x8

    aget-wide v2, p0, v4

    .local v2, "z8":J
    const/16 v4, 0x3b

    ushr-long v0, v2, v4

    .line 161
    .local v0, "t":J
    aget-wide v4, p0, p1

    const/4 v6, 0x2

    shl-long v6, v0, v6

    xor-long/2addr v6, v0

    const/4 v8, 0x5

    shl-long v8, v0, v8

    xor-long/2addr v6, v8

    const/16 v8, 0xa

    shl-long v8, v0, v8

    xor-long/2addr v6, v8

    xor-long/2addr v4, v6

    aput-wide v4, p0, p1

    .line 162
    add-int/lit8 v4, p1, 0x8

    const-wide v5, 0x7ffffffffffffffL

    and-long/2addr v5, v2

    aput-wide v5, p0, v4

    .line 163
    return-void
.end method

.method public static sqrt([J[J)V
    .registers 15
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 167
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->create64()[J

    move-result-object v0

    .local v0, "evn":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->create64()[J

    move-result-object v2

    .line 169
    .local v2, "odd":[J
    const/4 v3, 0x0

    .line 170
    .local v3, "pos":I
    const/4 v1, 0x0

    .local v1, "i":I
    move v4, v3

    .end local v3    # "pos":I
    .local v4, "pos":I
    :goto_b
    const/4 v9, 0x4

    if-ge v1, v9, :cond_3b

    .line 172
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    aget-wide v9, p0, v4

    invoke-static {v9, v10}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v5

    .line 173
    .local v5, "u0":J
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    aget-wide v9, p0, v3

    invoke-static {v9, v10}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v7

    .line 174
    .local v7, "u1":J
    const-wide v9, 0xffffffffL

    and-long/2addr v9, v5

    const/16 v11, 0x20

    shl-long v11, v7, v11

    or-long/2addr v9, v11

    aput-wide v9, v0, v1

    .line 175
    const/16 v9, 0x20

    ushr-long v9, v5, v9

    const-wide v11, -0x100000000L

    and-long/2addr v11, v7

    or-long/2addr v9, v11

    aput-wide v9, v2, v1

    .line 170
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 178
    .end local v5    # "u0":J
    .end local v7    # "u1":J
    :cond_3b
    aget-wide v9, p0, v4

    invoke-static {v9, v10}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v5

    .line 179
    .restart local v5    # "u0":J
    const/4 v9, 0x4

    const-wide v10, 0xffffffffL

    and-long/2addr v10, v5

    aput-wide v10, v0, v9

    .line 180
    const/4 v9, 0x4

    const/16 v10, 0x20

    ushr-long v10, v5, v10

    aput-wide v10, v2, v9

    .line 183
    sget-object v9, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->ROOT_Z:[J

    invoke-static {v2, v9, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->multiply([J[J[J)V

    .line 184
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->add([J[J[J)V

    .line 185
    return-void
.end method

.method public static square([J[J)V
    .registers 3
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 189
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->createExt64()[J

    move-result-object v0

    .line 190
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->implSquare([J[J)V

    .line 191
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->reduce([J[J)V

    .line 192
    return-void
.end method

.method public static squareAddToExt([J[J)V
    .registers 3
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    .line 196
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->createExt64()[J

    move-result-object v0

    .line 197
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->implSquare([J[J)V

    .line 198
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->addExt([J[J[J)V

    .line 199
    return-void
.end method

.method public static squareN([JI[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "n"    # I
    .param p2, "z"    # [J

    .prologue
    .line 205
    invoke-static {}, Lorg/spongycastle/math/raw/Nat576;->createExt64()[J

    move-result-object v0

    .line 206
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->implSquare([J[J)V

    .line 207
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->reduce([J[J)V

    .line 209
    :goto_a
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_15

    .line 211
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->implSquare([J[J)V

    .line 212
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT571Field;->reduce([J[J)V

    goto :goto_a

    .line 214
    :cond_15
    return-void
.end method

.method public static trace([J)I
    .registers 7
    .param p0, "x"    # [J

    .prologue
    const/16 v5, 0x8

    .line 219
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    aget-wide v2, p0, v5

    const/16 v4, 0x31

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    aget-wide v2, p0, v5

    const/16 v4, 0x39

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    long-to-int v0, v0

    and-int/lit8 v0, v0, 0x1

    return v0
.end method
