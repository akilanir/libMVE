.class public Lorg/spongycastle/math/ec/custom/sec/SecT131Field;
.super Ljava/lang/Object;
.source "SecT131Field.java"


# static fields
.field private static final M03:J = 0x7L

.field private static final M44:J = 0xfffffffffffL

.field private static final ROOT_Z:[J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    const/4 v0, 0x3

    new-array v0, v0, [J

    fill-array-data v0, :array_a

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->ROOT_Z:[J

    return-void

    nop

    :array_a
    .array-data 8
        0x26bc4d789af13523L
        0x26bc4d789af135e2L    # 4.281425911902527E-122
        0x6
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add([J[J[J)V
    .registers 10
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 18
    aget-wide v0, p0, v4

    aget-wide v2, p1, v4

    xor-long/2addr v0, v2

    aput-wide v0, p2, v4

    .line 19
    aget-wide v0, p0, v5

    aget-wide v2, p1, v5

    xor-long/2addr v0, v2

    aput-wide v0, p2, v5

    .line 20
    aget-wide v0, p0, v6

    aget-wide v2, p1, v6

    xor-long/2addr v0, v2

    aput-wide v0, p2, v6

    .line 21
    return-void
.end method

.method public static addExt([J[J[J)V
    .registers 12
    .param p0, "xx"    # [J
    .param p1, "yy"    # [J
    .param p2, "zz"    # [J

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 25
    aget-wide v0, p0, v4

    aget-wide v2, p1, v4

    xor-long/2addr v0, v2

    aput-wide v0, p2, v4

    .line 26
    aget-wide v0, p0, v5

    aget-wide v2, p1, v5

    xor-long/2addr v0, v2

    aput-wide v0, p2, v5

    .line 27
    aget-wide v0, p0, v6

    aget-wide v2, p1, v6

    xor-long/2addr v0, v2

    aput-wide v0, p2, v6

    .line 28
    aget-wide v0, p0, v7

    aget-wide v2, p1, v7

    xor-long/2addr v0, v2

    aput-wide v0, p2, v7

    .line 29
    aget-wide v0, p0, v8

    aget-wide v2, p1, v8

    xor-long/2addr v0, v2

    aput-wide v0, p2, v8

    .line 30
    return-void
.end method

.method public static addOne([J[J)V
    .registers 9
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 34
    aget-wide v0, p0, v4

    const-wide/16 v2, 0x1

    xor-long/2addr v0, v2

    aput-wide v0, p1, v4

    .line 35
    aget-wide v0, p0, v5

    aput-wide v0, p1, v5

    .line 36
    aget-wide v0, p0, v6

    aput-wide v0, p1, v6

    .line 37
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[J
    .registers 3
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 41
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat192;->fromBigInteger64(Ljava/math/BigInteger;)[J

    move-result-object v0

    .line 42
    .local v0, "z":[J
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce61([JI)V

    .line 43
    return-object v0
.end method

.method protected static implCompactExt([J)V
    .registers 18
    .param p0, "zz"    # [J

    .prologue
    .line 173
    const/4 v12, 0x0

    aget-wide v0, p0, v12

    .local v0, "z0":J
    const/4 v12, 0x1

    aget-wide v2, p0, v12

    .local v2, "z1":J
    const/4 v12, 0x2

    aget-wide v4, p0, v12

    .local v4, "z2":J
    const/4 v12, 0x3

    aget-wide v6, p0, v12

    .local v6, "z3":J
    const/4 v12, 0x4

    aget-wide v8, p0, v12

    .local v8, "z4":J
    const/4 v12, 0x5

    aget-wide v10, p0, v12

    .line 174
    .local v10, "z5":J
    const/4 v12, 0x0

    const/16 v13, 0x2c

    shl-long v13, v2, v13

    xor-long/2addr v13, v0

    aput-wide v13, p0, v12

    .line 175
    const/4 v12, 0x1

    const/16 v13, 0x14

    ushr-long v13, v2, v13

    const/16 v15, 0x18

    shl-long v15, v4, v15

    xor-long/2addr v13, v15

    aput-wide v13, p0, v12

    .line 176
    const/4 v12, 0x2

    const/16 v13, 0x28

    ushr-long v13, v4, v13

    const/4 v15, 0x4

    shl-long v15, v6, v15

    xor-long/2addr v13, v15

    const/16 v15, 0x30

    shl-long v15, v8, v15

    xor-long/2addr v13, v15

    aput-wide v13, p0, v12

    .line 178
    const/4 v12, 0x3

    const/16 v13, 0x3c

    ushr-long v13, v6, v13

    const/16 v15, 0x1c

    shl-long v15, v10, v15

    xor-long/2addr v13, v15

    const/16 v15, 0x10

    ushr-long v15, v8, v15

    xor-long/2addr v13, v15

    aput-wide v13, p0, v12

    .line 180
    const/4 v12, 0x4

    const/16 v13, 0x24

    ushr-long v13, v10, v13

    aput-wide v13, p0, v12

    .line 181
    const/4 v12, 0x5

    const-wide/16 v13, 0x0

    aput-wide v13, p0, v12

    .line 182
    return-void
.end method

.method protected static implMultiply([J[J[J)V
    .registers 54
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 190
    const/4 v5, 0x0

    aget-wide v0, p0, v5

    .local v0, "f0":J
    const/4 v5, 0x1

    aget-wide v19, p0, v5

    .local v19, "f1":J
    const/4 v5, 0x2

    aget-wide v21, p0, v5

    .line 191
    .local v21, "f2":J
    const/16 v5, 0x18

    ushr-long v5, v19, v5

    const/16 v13, 0x28

    shl-long v13, v21, v13

    xor-long/2addr v5, v13

    const-wide v13, 0xfffffffffffL

    and-long v21, v5, v13

    .line 192
    const/16 v5, 0x2c

    ushr-long v5, v0, v5

    const/16 v13, 0x14

    shl-long v13, v19, v13

    xor-long/2addr v5, v13

    const-wide v13, 0xfffffffffffL

    and-long v19, v5, v13

    .line 193
    const-wide v5, 0xfffffffffffL

    and-long/2addr v0, v5

    .line 195
    const/4 v5, 0x0

    aget-wide v2, p1, v5

    .local v2, "g0":J
    const/4 v5, 0x1

    aget-wide v23, p1, v5

    .local v23, "g1":J
    const/4 v5, 0x2

    aget-wide v7, p1, v5

    .line 196
    .local v7, "g2":J
    const/16 v5, 0x18

    ushr-long v5, v23, v5

    const/16 v13, 0x28

    shl-long v13, v7, v13

    xor-long/2addr v5, v13

    const-wide v13, 0xfffffffffffL

    and-long v7, v5, v13

    .line 197
    const/16 v5, 0x2c

    ushr-long v5, v2, v5

    const/16 v13, 0x14

    shl-long v13, v23, v13

    xor-long/2addr v5, v13

    const-wide v13, 0xfffffffffffL

    and-long v23, v5, v13

    .line 198
    const-wide v5, 0xfffffffffffL

    and-long/2addr v2, v5

    .line 200
    const/16 v5, 0xa

    new-array v4, v5, [J

    .line 202
    .local v4, "H":[J
    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 203
    const/4 v10, 0x2

    move-wide/from16 v5, v21

    move-object v9, v4

    invoke-static/range {v5 .. v10}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 205
    xor-long v5, v0, v19

    xor-long v9, v5, v21

    .line 206
    .local v9, "t0":J
    xor-long v5, v2, v23

    xor-long v11, v5, v7

    .line 208
    .local v11, "t1":J
    const/4 v14, 0x4

    move-object v13, v4

    invoke-static/range {v9 .. v14}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 210
    const/4 v5, 0x1

    shl-long v5, v19, v5

    const/4 v13, 0x2

    shl-long v13, v21, v13

    xor-long v25, v5, v13

    .line 211
    .local v25, "t2":J
    const/4 v5, 0x1

    shl-long v5, v23, v5

    const/4 v13, 0x2

    shl-long v13, v7, v13

    xor-long v27, v5, v13

    .line 213
    .local v27, "t3":J
    xor-long v13, v0, v25

    xor-long v15, v2, v27

    const/16 v18, 0x6

    move-object/from16 v17, v4

    invoke-static/range {v13 .. v18}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 214
    xor-long v13, v9, v25

    xor-long v15, v11, v27

    const/16 v18, 0x8

    move-object/from16 v17, v4

    invoke-static/range {v13 .. v18}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMulw(JJ[JI)V

    .line 216
    const/4 v5, 0x6

    aget-wide v5, v4, v5

    const/16 v13, 0x8

    aget-wide v13, v4, v13

    xor-long v29, v5, v13

    .line 217
    .local v29, "t4":J
    const/4 v5, 0x7

    aget-wide v5, v4, v5

    const/16 v13, 0x9

    aget-wide v13, v4, v13

    xor-long v31, v5, v13

    .line 222
    .local v31, "t5":J
    const/4 v5, 0x1

    shl-long v5, v29, v5

    const/4 v13, 0x6

    aget-wide v13, v4, v13

    xor-long v39, v5, v13

    .line 223
    .local v39, "v0":J
    const/4 v5, 0x1

    shl-long v5, v31, v5

    xor-long v5, v5, v29

    const/4 v13, 0x7

    aget-wide v13, v4, v13

    xor-long v41, v5, v13

    .line 224
    .local v41, "v1":J
    move-wide/from16 v43, v31

    .line 227
    .local v43, "v2":J
    const/4 v5, 0x0

    aget-wide v33, v4, v5

    .line 228
    .local v33, "u0":J
    const/4 v5, 0x1

    aget-wide v5, v4, v5

    const/4 v13, 0x0

    aget-wide v13, v4, v13

    xor-long/2addr v5, v13

    const/4 v13, 0x4

    aget-wide v13, v4, v13

    xor-long v35, v5, v13

    .line 229
    .local v35, "u1":J
    const/4 v5, 0x1

    aget-wide v5, v4, v5

    const/4 v13, 0x5

    aget-wide v13, v4, v13

    xor-long v37, v5, v13

    .line 232
    .local v37, "u2":J
    xor-long v5, v33, v39

    const/4 v13, 0x2

    aget-wide v13, v4, v13

    const/4 v15, 0x4

    shl-long/2addr v13, v15

    xor-long/2addr v5, v13

    const/4 v13, 0x2

    aget-wide v13, v4, v13

    const/4 v15, 0x1

    shl-long/2addr v13, v15

    xor-long v45, v5, v13

    .line 233
    .local v45, "w0":J
    xor-long v5, v35, v41

    const/4 v13, 0x3

    aget-wide v13, v4, v13

    const/4 v15, 0x4

    shl-long/2addr v13, v15

    xor-long/2addr v5, v13

    const/4 v13, 0x3

    aget-wide v13, v4, v13

    const/4 v15, 0x1

    shl-long/2addr v13, v15

    xor-long v47, v5, v13

    .line 234
    .local v47, "w1":J
    xor-long v49, v37, v43

    .line 237
    .local v49, "w2":J
    const/16 v5, 0x2c

    ushr-long v5, v45, v5

    xor-long v47, v47, v5

    const-wide v5, 0xfffffffffffL

    and-long v45, v45, v5

    .line 238
    const/16 v5, 0x2c

    ushr-long v5, v47, v5

    xor-long v49, v49, v5

    const-wide v5, 0xfffffffffffL

    and-long v47, v47, v5

    .line 244
    const/4 v5, 0x1

    ushr-long v5, v45, v5

    const-wide/16 v13, 0x1

    and-long v13, v13, v47

    const/16 v15, 0x2b

    shl-long/2addr v13, v15

    xor-long v45, v5, v13

    .line 245
    const/4 v5, 0x1

    ushr-long v5, v47, v5

    const-wide/16 v13, 0x1

    and-long v13, v13, v49

    const/16 v15, 0x2b

    shl-long/2addr v13, v15

    xor-long v47, v5, v13

    .line 246
    const/4 v5, 0x1

    ushr-long v49, v49, v5

    .line 250
    const/4 v5, 0x1

    shl-long v5, v45, v5

    xor-long v45, v45, v5

    .line 251
    const/4 v5, 0x2

    shl-long v5, v45, v5

    xor-long v45, v45, v5

    .line 252
    const/4 v5, 0x4

    shl-long v5, v45, v5

    xor-long v45, v45, v5

    .line 253
    const/16 v5, 0x8

    shl-long v5, v45, v5

    xor-long v45, v45, v5

    .line 254
    const/16 v5, 0x10

    shl-long v5, v45, v5

    xor-long v45, v45, v5

    .line 255
    const/16 v5, 0x20

    shl-long v5, v45, v5

    xor-long v45, v45, v5

    .line 257
    const-wide v5, 0xfffffffffffL

    and-long v45, v45, v5

    const/16 v5, 0x2b

    ushr-long v5, v45, v5

    xor-long v47, v47, v5

    .line 259
    const/4 v5, 0x1

    shl-long v5, v47, v5

    xor-long v47, v47, v5

    .line 260
    const/4 v5, 0x2

    shl-long v5, v47, v5

    xor-long v47, v47, v5

    .line 261
    const/4 v5, 0x4

    shl-long v5, v47, v5

    xor-long v47, v47, v5

    .line 262
    const/16 v5, 0x8

    shl-long v5, v47, v5

    xor-long v47, v47, v5

    .line 263
    const/16 v5, 0x10

    shl-long v5, v47, v5

    xor-long v47, v47, v5

    .line 264
    const/16 v5, 0x20

    shl-long v5, v47, v5

    xor-long v47, v47, v5

    .line 266
    const-wide v5, 0xfffffffffffL

    and-long v47, v47, v5

    const/16 v5, 0x2b

    ushr-long v5, v47, v5

    xor-long v49, v49, v5

    .line 268
    const/4 v5, 0x1

    shl-long v5, v49, v5

    xor-long v49, v49, v5

    .line 269
    const/4 v5, 0x2

    shl-long v5, v49, v5

    xor-long v49, v49, v5

    .line 270
    const/4 v5, 0x4

    shl-long v5, v49, v5

    xor-long v49, v49, v5

    .line 271
    const/16 v5, 0x8

    shl-long v5, v49, v5

    xor-long v49, v49, v5

    .line 272
    const/16 v5, 0x10

    shl-long v5, v49, v5

    xor-long v49, v49, v5

    .line 273
    const/16 v5, 0x20

    shl-long v5, v49, v5

    xor-long v49, v49, v5

    .line 277
    const/4 v5, 0x0

    aput-wide v33, p2, v5

    .line 278
    const/4 v5, 0x1

    xor-long v13, v35, v45

    const/4 v6, 0x2

    aget-wide v15, v4, v6

    xor-long/2addr v13, v15

    aput-wide v13, p2, v5

    .line 279
    const/4 v5, 0x2

    xor-long v13, v37, v47

    xor-long v13, v13, v45

    const/4 v6, 0x3

    aget-wide v15, v4, v6

    xor-long/2addr v13, v15

    aput-wide v13, p2, v5

    .line 280
    const/4 v5, 0x3

    xor-long v13, v49, v47

    aput-wide v13, p2, v5

    .line 281
    const/4 v5, 0x4

    const/4 v6, 0x2

    aget-wide v13, v4, v6

    xor-long v13, v13, v49

    aput-wide v13, p2, v5

    .line 282
    const/4 v5, 0x5

    const/4 v6, 0x3

    aget-wide v13, v4, v6

    aput-wide v13, p2, v5

    .line 284
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implCompactExt([J)V

    .line 285
    return-void
.end method

.method protected static implMulw(JJ[JI)V
    .registers 20
    .param p0, "x"    # J
    .param p2, "y"    # J
    .param p4, "z"    # [J
    .param p5, "zOff"    # I

    .prologue
    .line 292
    const/16 v9, 0x8

    new-array v8, v9, [J

    .line 294
    .local v8, "u":[J
    const/4 v9, 0x1

    aput-wide p2, v8, v9

    .line 295
    const/4 v9, 0x2

    const/4 v10, 0x1

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 296
    const/4 v9, 0x3

    const/4 v10, 0x2

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 297
    const/4 v9, 0x4

    const/4 v10, 0x2

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 298
    const/4 v9, 0x5

    const/4 v10, 0x4

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 299
    const/4 v9, 0x6

    const/4 v10, 0x3

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 300
    const/4 v9, 0x7

    const/4 v10, 0x6

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 302
    long-to-int v4, p0

    .line 303
    .local v4, "j":I
    const-wide/16 v2, 0x0

    .local v2, "h":J
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

    xor-long v6, v9, v11

    .line 306
    .local v6, "l":J
    const/16 v5, 0x21

    .line 309
    .local v5, "k":I
    :cond_53
    ushr-long v9, p0, v5

    long-to-int v4, v9

    .line 310
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

    xor-long/2addr v9, v11

    ushr-int/lit8 v11, v4, 0x9

    and-int/lit8 v11, v11, 0x7

    aget-wide v11, v8, v11

    const/16 v13, 0x9

    shl-long/2addr v11, v13

    xor-long v0, v9, v11

    .line 314
    .local v0, "g":J
    shl-long v9, v0, v5

    xor-long/2addr v6, v9

    .line 315
    neg-int v9, v5

    ushr-long v9, v0, v9

    xor-long/2addr v2, v9

    .line 317
    add-int/lit8 v5, v5, -0xc

    if-gtz v5, :cond_53

    .line 321
    const-wide v9, 0xfffffffffffL

    and-long/2addr v9, v6

    aput-wide v9, p4, p5

    .line 322
    add-int/lit8 v9, p5, 0x1

    const/16 v10, 0x2c

    ushr-long v10, v6, v10

    const/16 v12, 0x14

    shl-long v12, v2, v12

    xor-long/2addr v10, v12

    aput-wide v10, p4, v9

    .line 323
    return-void
.end method

.method protected static implSquare([J[J)V
    .registers 7
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 327
    aget-wide v0, p0, v2

    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 328
    const/4 v0, 0x1

    aget-wide v0, p0, v0

    invoke-static {v0, v1, p1, v3}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 330
    const/4 v0, 0x4

    aget-wide v1, p0, v3

    long-to-int v1, v1

    invoke-static {v1}, Lorg/spongycastle/math/raw/Interleave;->expand8to16(I)I

    move-result v1

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aput-wide v1, p1, v0

    .line 331
    return-void
.end method

.method public static invert([J[J)V
    .registers 5
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 48
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat192;->isZero64([J)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 50
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 55
    :cond_c
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create64()[J

    move-result-object v0

    .line 56
    .local v0, "t0":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create64()[J

    move-result-object v1

    .line 58
    .local v1, "t1":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->square([J[J)V

    .line 59
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 60
    const/4 v2, 0x2

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 61
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 62
    const/4 v2, 0x4

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 63
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 64
    const/16 v2, 0x8

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 65
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 66
    const/16 v2, 0x10

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 67
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 68
    const/16 v2, 0x20

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 69
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 70
    invoke-static {v1, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->square([J[J)V

    .line 71
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 72
    const/16 v2, 0x41

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->squareN([JI[J)V

    .line 73
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 74
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->square([J[J)V

    .line 75
    return-void
.end method

.method public static multiply([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    .line 79
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt64()[J

    move-result-object v0

    .line 80
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMultiply([J[J[J)V

    .line 81
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

    .line 82
    return-void
.end method

.method public static multiplyAddToExt([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 86
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt64()[J

    move-result-object v0

    .line 87
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implMultiply([J[J[J)V

    .line 88
    invoke-static {p2, v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->addExt([J[J[J)V

    .line 89
    return-void
.end method

.method public static reduce([J[J)V
    .registers 19
    .param p0, "xx"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 93
    const/4 v12, 0x0

    aget-wide v2, p0, v12

    .local v2, "x0":J
    const/4 v12, 0x1

    aget-wide v4, p0, v12

    .local v4, "x1":J
    const/4 v12, 0x2

    aget-wide v6, p0, v12

    .local v6, "x2":J
    const/4 v12, 0x3

    aget-wide v8, p0, v12

    .local v8, "x3":J
    const/4 v12, 0x4

    aget-wide v10, p0, v12

    .line 95
    .local v10, "x4":J
    const/16 v12, 0x3d

    shl-long v12, v10, v12

    const/16 v14, 0x3f

    shl-long v14, v10, v14

    xor-long/2addr v12, v14

    xor-long/2addr v4, v12

    .line 96
    const/4 v12, 0x3

    ushr-long v12, v10, v12

    const/4 v14, 0x1

    ushr-long v14, v10, v14

    xor-long/2addr v12, v14

    xor-long/2addr v12, v10

    const/4 v14, 0x5

    shl-long v14, v10, v14

    xor-long/2addr v12, v14

    xor-long/2addr v6, v12

    .line 97
    const/16 v12, 0x3b

    ushr-long v12, v10, v12

    xor-long/2addr v8, v12

    .line 99
    const/16 v12, 0x3d

    shl-long v12, v8, v12

    const/16 v14, 0x3f

    shl-long v14, v8, v14

    xor-long/2addr v12, v14

    xor-long/2addr v2, v12

    .line 100
    const/4 v12, 0x3

    ushr-long v12, v8, v12

    const/4 v14, 0x1

    ushr-long v14, v8, v14

    xor-long/2addr v12, v14

    xor-long/2addr v12, v8

    const/4 v14, 0x5

    shl-long v14, v8, v14

    xor-long/2addr v12, v14

    xor-long/2addr v4, v12

    .line 101
    const/16 v12, 0x3b

    ushr-long v12, v8, v12

    xor-long/2addr v6, v12

    .line 103
    const/4 v12, 0x3

    ushr-long v0, v6, v12

    .line 104
    .local v0, "t":J
    const/4 v12, 0x0

    xor-long v13, v2, v0

    const/4 v15, 0x2

    shl-long v15, v0, v15

    xor-long/2addr v13, v15

    const/4 v15, 0x3

    shl-long v15, v0, v15

    xor-long/2addr v13, v15

    const/16 v15, 0x8

    shl-long v15, v0, v15

    xor-long/2addr v13, v15

    aput-wide v13, p1, v12

    .line 105
    const/4 v12, 0x1

    const/16 v13, 0x38

    ushr-long v13, v0, v13

    xor-long/2addr v13, v4

    aput-wide v13, p1, v12

    .line 106
    const/4 v12, 0x2

    const-wide/16 v13, 0x7

    and-long/2addr v13, v6

    aput-wide v13, p1, v12

    .line 107
    return-void
.end method

.method public static reduce61([JI)V
    .registers 12
    .param p0, "z"    # [J
    .param p1, "zOff"    # I

    .prologue
    const/4 v8, 0x3

    .line 111
    add-int/lit8 v4, p1, 0x2

    aget-wide v2, p0, v4

    .local v2, "z2":J
    ushr-long v0, v2, v8

    .line 112
    .local v0, "t":J
    aget-wide v4, p0, p1

    const/4 v6, 0x2

    shl-long v6, v0, v6

    xor-long/2addr v6, v0

    shl-long v8, v0, v8

    xor-long/2addr v6, v8

    const/16 v8, 0x8

    shl-long v8, v0, v8

    xor-long/2addr v6, v8

    xor-long/2addr v4, v6

    aput-wide v4, p0, p1

    .line 113
    add-int/lit8 v4, p1, 0x1

    aget-wide v5, p0, v4

    const/16 v7, 0x38

    ushr-long v7, v0, v7

    xor-long/2addr v5, v7

    aput-wide v5, p0, v4

    .line 114
    add-int/lit8 v4, p1, 0x2

    const-wide/16 v5, 0x7

    and-long/2addr v5, v2

    aput-wide v5, p0, v4

    .line 115
    return-void
.end method

.method public static sqrt([J[J)V
    .registers 16
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 119
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create64()[J

    move-result-object v4

    .line 122
    .local v4, "odd":[J
    const/4 v9, 0x0

    aget-wide v9, p0, v9

    invoke-static {v9, v10}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v5

    .local v5, "u0":J
    const/4 v9, 0x1

    aget-wide v9, p0, v9

    invoke-static {v9, v10}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v7

    .line 123
    .local v7, "u1":J
    const-wide v9, 0xffffffffL

    and-long/2addr v9, v5

    const/16 v11, 0x20

    shl-long v11, v7, v11

    or-long v0, v9, v11

    .line 124
    .local v0, "e0":J
    const/4 v9, 0x0

    const/16 v10, 0x20

    ushr-long v10, v5, v10

    const-wide v12, -0x100000000L

    and-long/2addr v12, v7

    or-long/2addr v10, v12

    aput-wide v10, v4, v9

    .line 126
    const/4 v9, 0x2

    aget-wide v9, p0, v9

    invoke-static {v9, v10}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v5

    .line 127
    const-wide v9, 0xffffffffL

    and-long v2, v5, v9

    .line 128
    .local v2, "e1":J
    const/4 v9, 0x1

    const/16 v10, 0x20

    ushr-long v10, v5, v10

    aput-wide v10, v4, v9

    .line 130
    sget-object v9, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->ROOT_Z:[J

    invoke-static {v4, v9, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->multiply([J[J[J)V

    .line 132
    const/4 v9, 0x0

    aget-wide v10, p1, v9

    xor-long/2addr v10, v0

    aput-wide v10, p1, v9

    .line 133
    const/4 v9, 0x1

    aget-wide v10, p1, v9

    xor-long/2addr v10, v2

    aput-wide v10, p1, v9

    .line 134
    return-void
.end method

.method public static square([J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 138
    const/4 v1, 0x5

    invoke-static {v1}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    move-result-object v0

    .line 139
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 140
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

    .line 141
    return-void
.end method

.method public static squareAddToExt([J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    .line 145
    const/4 v1, 0x5

    invoke-static {v1}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    move-result-object v0

    .line 146
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 147
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->addExt([J[J[J)V

    .line 148
    return-void
.end method

.method public static squareN([JI[J)V
    .registers 5
    .param p0, "x"    # [J
    .param p1, "n"    # I
    .param p2, "z"    # [J

    .prologue
    .line 154
    const/4 v1, 0x5

    invoke-static {v1}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    move-result-object v0

    .line 155
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 156
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

    .line 158
    :goto_b
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_16

    .line 160
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->implSquare([J[J)V

    .line 161
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT131Field;->reduce([J[J)V

    goto :goto_b

    .line 163
    :cond_16
    return-void
.end method

.method public static trace([J)I
    .registers 7
    .param p0, "x"    # [J

    .prologue
    const/4 v5, 0x1

    .line 168
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    aget-wide v2, p0, v5

    const/16 v4, 0x3b

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    const/4 v2, 0x2

    aget-wide v2, p0, v2

    ushr-long/2addr v2, v5

    xor-long/2addr v0, v2

    long-to-int v0, v0

    and-int/lit8 v0, v0, 0x1

    return v0
.end method
