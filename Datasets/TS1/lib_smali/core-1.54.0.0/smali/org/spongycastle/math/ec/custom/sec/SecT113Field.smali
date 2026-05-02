.class public Lorg/spongycastle/math/ec/custom/sec/SecT113Field;
.super Ljava/lang/Object;
.source "SecT113Field.java"


# static fields
.field private static final M49:J = 0x1ffffffffffffL

.field private static final M57:J = 0x1ffffffffffffffL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add([J[J[J)V
    .registers 9
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 15
    aget-wide v0, p0, v4

    aget-wide v2, p1, v4

    xor-long/2addr v0, v2

    aput-wide v0, p2, v4

    .line 16
    aget-wide v0, p0, v5

    aget-wide v2, p1, v5

    xor-long/2addr v0, v2

    aput-wide v0, p2, v5

    .line 17
    return-void
.end method

.method public static addExt([J[J[J)V
    .registers 11
    .param p0, "xx"    # [J
    .param p1, "yy"    # [J
    .param p2, "zz"    # [J

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 21
    aget-wide v0, p0, v4

    aget-wide v2, p1, v4

    xor-long/2addr v0, v2

    aput-wide v0, p2, v4

    .line 22
    aget-wide v0, p0, v5

    aget-wide v2, p1, v5

    xor-long/2addr v0, v2

    aput-wide v0, p2, v5

    .line 23
    aget-wide v0, p0, v6

    aget-wide v2, p1, v6

    xor-long/2addr v0, v2

    aput-wide v0, p2, v6

    .line 24
    aget-wide v0, p0, v7

    aget-wide v2, p1, v7

    xor-long/2addr v0, v2

    aput-wide v0, p2, v7

    .line 25
    return-void
.end method

.method public static addOne([J[J)V
    .registers 8
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 29
    aget-wide v0, p0, v4

    const-wide/16 v2, 0x1

    xor-long/2addr v0, v2

    aput-wide v0, p1, v4

    .line 30
    aget-wide v0, p0, v5

    aput-wide v0, p1, v5

    .line 31
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[J
    .registers 3
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 35
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat128;->fromBigInteger64(Ljava/math/BigInteger;)[J

    move-result-object v0

    .line 36
    .local v0, "z":[J
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->reduce15([JI)V

    .line 37
    return-object v0
.end method

.method protected static implMultiply([J[J[J)V
    .registers 30
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 158
    const/4 v5, 0x0

    aget-wide v0, p0, v5

    .local v0, "f0":J
    const/4 v5, 0x1

    aget-wide v15, p0, v5

    .line 159
    .local v15, "f1":J
    const/16 v5, 0x39

    ushr-long v5, v0, v5

    const/4 v9, 0x7

    shl-long v9, v15, v9

    xor-long/2addr v5, v9

    const-wide v9, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long v15, v5, v9

    .line 160
    const-wide v5, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v0, v5

    .line 162
    const/4 v5, 0x0

    aget-wide v2, p1, v5

    .local v2, "g0":J
    const/4 v5, 0x1

    aget-wide v7, p1, v5

    .line 163
    .local v7, "g1":J
    const/16 v5, 0x39

    ushr-long v5, v2, v5

    const/4 v9, 0x7

    shl-long v9, v7, v9

    xor-long/2addr v5, v9

    const-wide v9, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long v7, v5, v9

    .line 164
    const-wide v5, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v2, v5

    .line 166
    const/4 v5, 0x6

    new-array v4, v5, [J

    .line 168
    .local v4, "H":[J
    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implMulw(JJ[JI)V

    .line 169
    const/4 v10, 0x2

    move-wide v5, v15

    move-object v9, v4

    invoke-static/range {v5 .. v10}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implMulw(JJ[JI)V

    .line 170
    xor-long v9, v0, v15

    xor-long v11, v2, v7

    const/4 v14, 0x4

    move-object v13, v4

    invoke-static/range {v9 .. v14}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implMulw(JJ[JI)V

    .line 172
    const/4 v5, 0x1

    aget-wide v5, v4, v5

    const/4 v9, 0x2

    aget-wide v9, v4, v9

    xor-long v17, v5, v9

    .line 173
    .local v17, "r":J
    const/4 v5, 0x0

    aget-wide v19, v4, v5

    .line 174
    .local v19, "z0":J
    const/4 v5, 0x3

    aget-wide v25, v4, v5

    .line 175
    .local v25, "z3":J
    const/4 v5, 0x4

    aget-wide v5, v4, v5

    xor-long v5, v5, v19

    xor-long v21, v5, v17

    .line 176
    .local v21, "z1":J
    const/4 v5, 0x5

    aget-wide v5, v4, v5

    xor-long v5, v5, v25

    xor-long v23, v5, v17

    .line 178
    .local v23, "z2":J
    const/4 v5, 0x0

    const/16 v6, 0x39

    shl-long v9, v21, v6

    xor-long v9, v9, v19

    aput-wide v9, p2, v5

    .line 179
    const/4 v5, 0x1

    const/4 v6, 0x7

    ushr-long v9, v21, v6

    const/16 v6, 0x32

    shl-long v11, v23, v6

    xor-long/2addr v9, v11

    aput-wide v9, p2, v5

    .line 180
    const/4 v5, 0x2

    const/16 v6, 0xe

    ushr-long v9, v23, v6

    const/16 v6, 0x2b

    shl-long v11, v25, v6

    xor-long/2addr v9, v11

    aput-wide v9, p2, v5

    .line 181
    const/4 v5, 0x3

    const/16 v6, 0x15

    ushr-long v9, v25, v6

    aput-wide v9, p2, v5

    .line 182
    return-void
.end method

.method protected static implMulw(JJ[JI)V
    .registers 20
    .param p0, "x"    # J
    .param p2, "y"    # J
    .param p4, "z"    # [J
    .param p5, "zOff"    # I

    .prologue
    .line 189
    const/16 v9, 0x8

    new-array v8, v9, [J

    .line 191
    .local v8, "u":[J
    const/4 v9, 0x1

    aput-wide p2, v8, v9

    .line 192
    const/4 v9, 0x2

    const/4 v10, 0x1

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 193
    const/4 v9, 0x3

    const/4 v10, 0x2

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 194
    const/4 v9, 0x4

    const/4 v10, 0x2

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 195
    const/4 v9, 0x5

    const/4 v10, 0x4

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 196
    const/4 v9, 0x6

    const/4 v10, 0x3

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 197
    const/4 v9, 0x7

    const/4 v10, 0x6

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 199
    long-to-int v4, p0

    .line 200
    .local v4, "j":I
    const-wide/16 v2, 0x0

    .local v2, "h":J
    and-int/lit8 v9, v4, 0x7

    aget-wide v6, v8, v9

    .line 201
    .local v6, "l":J
    const/16 v5, 0x30

    .line 204
    .local v5, "k":I
    :cond_40
    ushr-long v9, p0, v5

    long-to-int v4, v9

    .line 205
    and-int/lit8 v9, v4, 0x7

    aget-wide v9, v8, v9

    ushr-int/lit8 v11, v4, 0x3

    and-int/lit8 v11, v11, 0x7

    aget-wide v11, v8, v11

    const/4 v13, 0x3

    shl-long/2addr v11, v13

    xor-long/2addr v9, v11

    ushr-int/lit8 v11, v4, 0x6

    and-int/lit8 v11, v11, 0x7

    aget-wide v11, v8, v11

    const/4 v13, 0x6

    shl-long/2addr v11, v13

    xor-long v0, v9, v11

    .line 208
    .local v0, "g":J
    shl-long v9, v0, v5

    xor-long/2addr v6, v9

    .line 209
    neg-int v9, v5

    ushr-long v9, v0, v9

    xor-long/2addr v2, v9

    .line 211
    add-int/lit8 v5, v5, -0x9

    if-gtz v5, :cond_40

    .line 213
    const-wide v9, 0x100804020100800L

    and-long/2addr v9, p0

    const/4 v11, 0x7

    shl-long v11, p2, v11

    const/16 v13, 0x3f

    shr-long/2addr v11, v13

    and-long/2addr v9, v11

    const/16 v11, 0x8

    ushr-long/2addr v9, v11

    xor-long/2addr v2, v9

    .line 217
    const-wide v9, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v9, v6

    aput-wide v9, p4, p5

    .line 218
    add-int/lit8 v9, p5, 0x1

    const/16 v10, 0x39

    ushr-long v10, v6, v10

    const/4 v12, 0x7

    shl-long v12, v2, v12

    xor-long/2addr v10, v12

    aput-wide v10, p4, v9

    .line 219
    return-void
.end method

.method protected static implSquare([J[J)V
    .registers 5
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    const/4 v2, 0x0

    .line 223
    aget-wide v0, p0, v2

    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 224
    const/4 v0, 0x1

    aget-wide v0, p0, v0

    const/4 v2, 0x2

    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 225
    return-void
.end method

.method public static invert([J[J)V
    .registers 5
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 42
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat128;->isZero64([J)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 44
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 49
    :cond_c
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 50
    .local v0, "t0":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v1

    .line 52
    .local v1, "t1":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->square([J[J)V

    .line 53
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 54
    invoke-static {v0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->square([J[J)V

    .line 55
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 56
    const/4 v2, 0x3

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->squareN([JI[J)V

    .line 57
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 58
    invoke-static {v1, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->square([J[J)V

    .line 59
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 60
    const/4 v2, 0x7

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->squareN([JI[J)V

    .line 61
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 62
    const/16 v2, 0xe

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->squareN([JI[J)V

    .line 63
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 64
    const/16 v2, 0x1c

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->squareN([JI[J)V

    .line 65
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 66
    const/16 v2, 0x38

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->squareN([JI[J)V

    .line 67
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 68
    invoke-static {v1, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->square([J[J)V

    .line 69
    return-void
.end method

.method public static multiply([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    .line 73
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt64()[J

    move-result-object v0

    .line 74
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implMultiply([J[J[J)V

    .line 75
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->reduce([J[J)V

    .line 76
    return-void
.end method

.method public static multiplyAddToExt([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 80
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt64()[J

    move-result-object v0

    .line 81
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implMultiply([J[J[J)V

    .line 82
    invoke-static {p2, v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->addExt([J[J[J)V

    .line 83
    return-void
.end method

.method public static reduce([J[J)V
    .registers 17
    .param p0, "xx"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 87
    const/4 v10, 0x0

    aget-wide v2, p0, v10

    .local v2, "x0":J
    const/4 v10, 0x1

    aget-wide v4, p0, v10

    .local v4, "x1":J
    const/4 v10, 0x2

    aget-wide v6, p0, v10

    .local v6, "x2":J
    const/4 v10, 0x3

    aget-wide v8, p0, v10

    .line 89
    .local v8, "x3":J
    const/16 v10, 0xf

    shl-long v10, v8, v10

    const/16 v12, 0x18

    shl-long v12, v8, v12

    xor-long/2addr v10, v12

    xor-long/2addr v4, v10

    .line 90
    const/16 v10, 0x31

    ushr-long v10, v8, v10

    const/16 v12, 0x28

    ushr-long v12, v8, v12

    xor-long/2addr v10, v12

    xor-long/2addr v6, v10

    .line 92
    const/16 v10, 0xf

    shl-long v10, v6, v10

    const/16 v12, 0x18

    shl-long v12, v6, v12

    xor-long/2addr v10, v12

    xor-long/2addr v2, v10

    .line 93
    const/16 v10, 0x31

    ushr-long v10, v6, v10

    const/16 v12, 0x28

    ushr-long v12, v6, v12

    xor-long/2addr v10, v12

    xor-long/2addr v4, v10

    .line 95
    const/16 v10, 0x31

    ushr-long v0, v4, v10

    .line 96
    .local v0, "t":J
    const/4 v10, 0x0

    xor-long v11, v2, v0

    const/16 v13, 0x9

    shl-long v13, v0, v13

    xor-long/2addr v11, v13

    aput-wide v11, p1, v10

    .line 97
    const/4 v10, 0x1

    const-wide v11, 0x1ffffffffffffL

    and-long/2addr v11, v4

    aput-wide v11, p1, v10

    .line 98
    return-void
.end method

.method public static reduce15([JI)V
    .registers 10
    .param p0, "z"    # [J
    .param p1, "zOff"    # I

    .prologue
    .line 102
    add-int/lit8 v4, p1, 0x1

    aget-wide v2, p0, v4

    .local v2, "z1":J
    const/16 v4, 0x31

    ushr-long v0, v2, v4

    .line 103
    .local v0, "t":J
    aget-wide v4, p0, p1

    const/16 v6, 0x9

    shl-long v6, v0, v6

    xor-long/2addr v6, v0

    xor-long/2addr v4, v6

    aput-wide v4, p0, p1

    .line 104
    add-int/lit8 v4, p1, 0x1

    const-wide v5, 0x1ffffffffffffL

    and-long/2addr v5, v2

    aput-wide v5, p0, v4

    .line 105
    return-void
.end method

.method public static sqrt([J[J)V
    .registers 15
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 109
    const/4 v8, 0x0

    aget-wide v8, p0, v8

    invoke-static {v8, v9}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v4

    .local v4, "u0":J
    const/4 v8, 0x1

    aget-wide v8, p0, v8

    invoke-static {v8, v9}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v6

    .line 110
    .local v6, "u1":J
    const-wide v8, 0xffffffffL

    and-long/2addr v8, v4

    const/16 v10, 0x20

    shl-long v10, v6, v10

    or-long v2, v8, v10

    .line 111
    .local v2, "e0":J
    const/16 v8, 0x20

    ushr-long v8, v4, v8

    const-wide v10, -0x100000000L

    and-long/2addr v10, v6

    or-long v0, v8, v10

    .line 113
    .local v0, "c0":J
    const/4 v8, 0x0

    const/16 v9, 0x39

    shl-long v9, v0, v9

    xor-long/2addr v9, v2

    const/4 v11, 0x5

    shl-long v11, v0, v11

    xor-long/2addr v9, v11

    aput-wide v9, p1, v8

    .line 114
    const/4 v8, 0x1

    const/4 v9, 0x7

    ushr-long v9, v0, v9

    const/16 v11, 0x3b

    ushr-long v11, v0, v11

    xor-long/2addr v9, v11

    aput-wide v9, p1, v8

    .line 115
    return-void
.end method

.method public static square([J[J)V
    .registers 3
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 119
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt64()[J

    move-result-object v0

    .line 120
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implSquare([J[J)V

    .line 121
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->reduce([J[J)V

    .line 122
    return-void
.end method

.method public static squareAddToExt([J[J)V
    .registers 3
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    .line 126
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt64()[J

    move-result-object v0

    .line 127
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implSquare([J[J)V

    .line 128
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->addExt([J[J[J)V

    .line 129
    return-void
.end method

.method public static squareN([JI[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "n"    # I
    .param p2, "z"    # [J

    .prologue
    .line 135
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt64()[J

    move-result-object v0

    .line 136
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implSquare([J[J)V

    .line 137
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->reduce([J[J)V

    .line 139
    :goto_a
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_15

    .line 141
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->implSquare([J[J)V

    .line 142
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->reduce([J[J)V

    goto :goto_a

    .line 144
    :cond_15
    return-void
.end method

.method public static trace([J)I
    .registers 3
    .param p0, "x"    # [J

    .prologue
    .line 149
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    long-to-int v0, v0

    and-int/lit8 v0, v0, 0x1

    return v0
.end method
