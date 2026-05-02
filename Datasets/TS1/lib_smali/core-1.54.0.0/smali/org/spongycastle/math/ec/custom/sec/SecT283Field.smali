.class public Lorg/spongycastle/math/ec/custom/sec/SecT283Field;
.super Ljava/lang/Object;
.source "SecT283Field.java"


# static fields
.field private static final M27:J = 0x7ffffffL

.field private static final M57:J = 0x1ffffffffffffffL

.field private static final ROOT_Z:[J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    const/4 v0, 0x5

    new-array v0, v0, [J

    fill-array-data v0, :array_a

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->ROOT_Z:[J

    return-void

    nop

    :array_a
    .array-data 8
        0xc30c30c30c30808L    # 5.85284437198306E-250
        0x30c30c30c30c30c3L    # 8.42232057182544E-74
        -0x7df7df7df7df7cf4L    # -7.205387683174334E-299
        0x820820820820820L
        0x2082082
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
    .registers 12
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

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
    aget-wide v0, p0, v7

    aget-wide v2, p1, v7

    xor-long/2addr v0, v2

    aput-wide v0, p2, v7

    .line 22
    aget-wide v0, p0, v8

    aget-wide v2, p1, v8

    xor-long/2addr v0, v2

    aput-wide v0, p2, v8

    .line 23
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

    .line 27
    aget-wide v0, p0, v4

    aget-wide v2, p1, v4

    xor-long/2addr v0, v2

    aput-wide v0, p2, v4

    .line 28
    aget-wide v0, p0, v5

    aget-wide v2, p1, v5

    xor-long/2addr v0, v2

    aput-wide v0, p2, v5

    .line 29
    aget-wide v0, p0, v6

    aget-wide v2, p1, v6

    xor-long/2addr v0, v2

    aput-wide v0, p2, v6

    .line 30
    aget-wide v0, p0, v7

    aget-wide v2, p1, v7

    xor-long/2addr v0, v2

    aput-wide v0, p2, v7

    .line 31
    aget-wide v0, p0, v8

    aget-wide v2, p1, v8

    xor-long/2addr v0, v2

    aput-wide v0, p2, v8

    .line 32
    const/4 v0, 0x5

    const/4 v1, 0x5

    aget-wide v1, p0, v1

    const/4 v3, 0x5

    aget-wide v3, p1, v3

    xor-long/2addr v1, v3

    aput-wide v1, p2, v0

    .line 33
    const/4 v0, 0x6

    const/4 v1, 0x6

    aget-wide v1, p0, v1

    const/4 v3, 0x6

    aget-wide v3, p1, v3

    xor-long/2addr v1, v3

    aput-wide v1, p2, v0

    .line 34
    const/4 v0, 0x7

    const/4 v1, 0x7

    aget-wide v1, p0, v1

    const/4 v3, 0x7

    aget-wide v3, p1, v3

    xor-long/2addr v1, v3

    aput-wide v1, p2, v0

    .line 35
    const/16 v0, 0x8

    const/16 v1, 0x8

    aget-wide v1, p0, v1

    const/16 v3, 0x8

    aget-wide v3, p1, v3

    xor-long/2addr v1, v3

    aput-wide v1, p2, v0

    .line 36
    return-void
.end method

.method public static addOne([J[J)V
    .registers 11
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 40
    aget-wide v0, p0, v4

    const-wide/16 v2, 0x1

    xor-long/2addr v0, v2

    aput-wide v0, p1, v4

    .line 41
    aget-wide v0, p0, v5

    aput-wide v0, p1, v5

    .line 42
    aget-wide v0, p0, v6

    aput-wide v0, p1, v6

    .line 43
    aget-wide v0, p0, v7

    aput-wide v0, p1, v7

    .line 44
    aget-wide v0, p0, v8

    aput-wide v0, p1, v8

    .line 45
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[J
    .registers 3
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 49
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat320;->fromBigInteger64(Ljava/math/BigInteger;)[J

    move-result-object v0

    .line 50
    .local v0, "z":[J
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->reduce37([JI)V

    .line 51
    return-object v0
.end method

.method protected static implCompactExt([J)V
    .registers 26
    .param p0, "zz"    # [J

    .prologue
    .line 198
    const/16 v20, 0x0

    aget-wide v0, p0, v20

    .local v0, "z0":J
    const/16 v20, 0x1

    aget-wide v2, p0, v20

    .local v2, "z1":J
    const/16 v20, 0x2

    aget-wide v4, p0, v20

    .local v4, "z2":J
    const/16 v20, 0x3

    aget-wide v6, p0, v20

    .local v6, "z3":J
    const/16 v20, 0x4

    aget-wide v8, p0, v20

    .line 199
    .local v8, "z4":J
    const/16 v20, 0x5

    aget-wide v10, p0, v20

    .local v10, "z5":J
    const/16 v20, 0x6

    aget-wide v12, p0, v20

    .local v12, "z6":J
    const/16 v20, 0x7

    aget-wide v14, p0, v20

    .local v14, "z7":J
    const/16 v20, 0x8

    aget-wide v16, p0, v20

    .local v16, "z8":J
    const/16 v20, 0x9

    aget-wide v18, p0, v20

    .line 200
    .local v18, "z9":J
    const/16 v20, 0x0

    const/16 v21, 0x39

    shl-long v21, v2, v21

    xor-long v21, v21, v0

    aput-wide v21, p0, v20

    .line 201
    const/16 v20, 0x1

    const/16 v21, 0x7

    ushr-long v21, v2, v21

    const/16 v23, 0x32

    shl-long v23, v4, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 202
    const/16 v20, 0x2

    const/16 v21, 0xe

    ushr-long v21, v4, v21

    const/16 v23, 0x2b

    shl-long v23, v6, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 203
    const/16 v20, 0x3

    const/16 v21, 0x15

    ushr-long v21, v6, v21

    const/16 v23, 0x24

    shl-long v23, v8, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 204
    const/16 v20, 0x4

    const/16 v21, 0x1c

    ushr-long v21, v8, v21

    const/16 v23, 0x1d

    shl-long v23, v10, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 205
    const/16 v20, 0x5

    const/16 v21, 0x23

    ushr-long v21, v10, v21

    const/16 v23, 0x16

    shl-long v23, v12, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 206
    const/16 v20, 0x6

    const/16 v21, 0x2a

    ushr-long v21, v12, v21

    const/16 v23, 0xf

    shl-long v23, v14, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 207
    const/16 v20, 0x7

    const/16 v21, 0x31

    ushr-long v21, v14, v21

    const/16 v23, 0x8

    shl-long v23, v16, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 208
    const/16 v20, 0x8

    const/16 v21, 0x38

    ushr-long v21, v16, v21

    const/16 v23, 0x1

    shl-long v23, v18, v23

    xor-long v21, v21, v23

    aput-wide v21, p0, v20

    .line 209
    const/16 v20, 0x9

    const/16 v21, 0x3f

    ushr-long v21, v18, v21

    aput-wide v21, p0, v20

    .line 210
    return-void
.end method

.method protected static implExpand([J[J)V
    .registers 17
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 214
    const/4 v10, 0x0

    aget-wide v0, p0, v10

    .local v0, "x0":J
    const/4 v10, 0x1

    aget-wide v2, p0, v10

    .local v2, "x1":J
    const/4 v10, 0x2

    aget-wide v4, p0, v10

    .local v4, "x2":J
    const/4 v10, 0x3

    aget-wide v6, p0, v10

    .local v6, "x3":J
    const/4 v10, 0x4

    aget-wide v8, p0, v10

    .line 215
    .local v8, "x4":J
    const/4 v10, 0x0

    const-wide v11, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v11, v0

    aput-wide v11, p1, v10

    .line 216
    const/4 v10, 0x1

    const/16 v11, 0x39

    ushr-long v11, v0, v11

    const/4 v13, 0x7

    shl-long v13, v2, v13

    xor-long/2addr v11, v13

    const-wide v13, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v11, v13

    aput-wide v11, p1, v10

    .line 217
    const/4 v10, 0x2

    const/16 v11, 0x32

    ushr-long v11, v2, v11

    const/16 v13, 0xe

    shl-long v13, v4, v13

    xor-long/2addr v11, v13

    const-wide v13, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v11, v13

    aput-wide v11, p1, v10

    .line 218
    const/4 v10, 0x3

    const/16 v11, 0x2b

    ushr-long v11, v4, v11

    const/16 v13, 0x15

    shl-long v13, v6, v13

    xor-long/2addr v11, v13

    const-wide v13, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v11, v13

    aput-wide v11, p1, v10

    .line 219
    const/4 v10, 0x4

    const/16 v11, 0x24

    ushr-long v11, v6, v11

    const/16 v13, 0x1c

    shl-long v13, v8, v13

    xor-long/2addr v11, v13

    aput-wide v11, p1, v10

    .line 220
    return-void
.end method

.method protected static implMultiply([J[J[J)V
    .registers 122
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 243
    const/4 v7, 0x5

    new-array v0, v7, [J

    move-object/from16 v31, v0

    .local v31, "a":[J
    const/4 v7, 0x5

    new-array v0, v7, [J

    move-object/from16 v32, v0

    .line 244
    .local v32, "b":[J
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implExpand([J[J)V

    .line 245
    move-object/from16 v0, p1

    move-object/from16 v1, v32

    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implExpand([J[J)V

    .line 247
    const/16 v7, 0x1a

    new-array v6, v7, [J

    .line 249
    .local v6, "p":[J
    const/4 v7, 0x0

    aget-wide v2, v31, v7

    const/4 v7, 0x0

    aget-wide v4, v32, v7

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 250
    const/4 v7, 0x1

    aget-wide v2, v31, v7

    const/4 v7, 0x1

    aget-wide v4, v32, v7

    const/4 v7, 0x2

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 251
    const/4 v7, 0x2

    aget-wide v2, v31, v7

    const/4 v7, 0x2

    aget-wide v4, v32, v7

    const/4 v7, 0x4

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 252
    const/4 v7, 0x3

    aget-wide v2, v31, v7

    const/4 v7, 0x3

    aget-wide v4, v32, v7

    const/4 v7, 0x6

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 253
    const/4 v7, 0x4

    aget-wide v2, v31, v7

    const/4 v7, 0x4

    aget-wide v4, v32, v7

    const/16 v7, 0x8

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 255
    const/4 v7, 0x0

    aget-wide v7, v31, v7

    const/4 v11, 0x1

    aget-wide v11, v31, v11

    xor-long v111, v7, v11

    .local v111, "u0":J
    const/4 v7, 0x0

    aget-wide v7, v32, v7

    const/4 v11, 0x1

    aget-wide v11, v32, v11

    xor-long v13, v7, v11

    .line 256
    .local v13, "v0":J
    const/4 v7, 0x0

    aget-wide v7, v31, v7

    const/4 v11, 0x2

    aget-wide v11, v31, v11

    xor-long v113, v7, v11

    .local v113, "u1":J
    const/4 v7, 0x0

    aget-wide v7, v32, v7

    const/4 v11, 0x2

    aget-wide v11, v32, v11

    xor-long v17, v7, v11

    .line 257
    .local v17, "v1":J
    const/4 v7, 0x2

    aget-wide v7, v31, v7

    const/4 v11, 0x4

    aget-wide v11, v31, v11

    xor-long v115, v7, v11

    .local v115, "u2":J
    const/4 v7, 0x2

    aget-wide v7, v32, v7

    const/4 v11, 0x4

    aget-wide v11, v32, v11

    xor-long v21, v7, v11

    .line 258
    .local v21, "v2":J
    const/4 v7, 0x3

    aget-wide v7, v31, v7

    const/4 v11, 0x4

    aget-wide v11, v31, v11

    xor-long v117, v7, v11

    .local v117, "u3":J
    const/4 v7, 0x3

    aget-wide v7, v32, v7

    const/4 v11, 0x4

    aget-wide v11, v32, v11

    xor-long v25, v7, v11

    .line 260
    .local v25, "v3":J
    const/4 v7, 0x3

    aget-wide v7, v31, v7

    xor-long v2, v113, v7

    const/4 v7, 0x3

    aget-wide v7, v32, v7

    xor-long v4, v17, v7

    const/16 v7, 0x12

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 261
    const/4 v7, 0x1

    aget-wide v7, v31, v7

    xor-long v2, v115, v7

    const/4 v7, 0x1

    aget-wide v7, v32, v7

    xor-long v4, v21, v7

    const/16 v7, 0x14

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 263
    xor-long v2, v111, v117

    .local v2, "A4":J
    xor-long v4, v13, v25

    .line 264
    .local v4, "B4":J
    const/4 v7, 0x2

    aget-wide v7, v31, v7

    xor-long v29, v2, v7

    .local v29, "A5":J
    const/4 v7, 0x2

    aget-wide v7, v32, v7

    xor-long v9, v4, v7

    .line 266
    .local v9, "B5":J
    const/16 v7, 0x16

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 267
    const/16 v12, 0x18

    move-wide/from16 v7, v29

    move-object v11, v6

    invoke-static/range {v7 .. v12}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 269
    const/16 v16, 0xa

    move-wide/from16 v11, v111

    move-object v15, v6

    invoke-static/range {v11 .. v16}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 270
    const/16 v20, 0xc

    move-wide/from16 v15, v113

    move-object/from16 v19, v6

    invoke-static/range {v15 .. v20}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 271
    const/16 v24, 0xe

    move-wide/from16 v19, v115

    move-object/from16 v23, v6

    invoke-static/range {v19 .. v24}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 272
    const/16 v28, 0x10

    move-wide/from16 v23, v117

    move-object/from16 v27, v6

    invoke-static/range {v23 .. v28}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMulw(JJ[JI)V

    .line 289
    const/4 v7, 0x0

    const/4 v8, 0x0

    aget-wide v11, v6, v8

    aput-wide v11, p2, v7

    .line 290
    const/16 v7, 0x9

    const/16 v8, 0x9

    aget-wide v11, v6, v8

    aput-wide v11, p2, v7

    .line 292
    const/4 v7, 0x0

    aget-wide v7, v6, v7

    const/4 v11, 0x1

    aget-wide v11, v6, v11

    xor-long v33, v7, v11

    .line 293
    .local v33, "t1":J
    const/4 v7, 0x2

    aget-wide v7, v6, v7

    xor-long v55, v33, v7

    .line 294
    .local v55, "t2":J
    const/16 v7, 0xa

    aget-wide v7, v6, v7

    xor-long v77, v55, v7

    .line 296
    .local v77, "t3":J
    const/4 v7, 0x1

    aput-wide v77, p2, v7

    .line 298
    const/4 v7, 0x3

    aget-wide v7, v6, v7

    const/4 v11, 0x4

    aget-wide v11, v6, v11

    xor-long v99, v7, v11

    .line 299
    .local v99, "t4":J
    const/16 v7, 0xb

    aget-wide v7, v6, v7

    const/16 v11, 0xc

    aget-wide v11, v6, v11

    xor-long v101, v7, v11

    .line 300
    .local v101, "t5":J
    xor-long v103, v99, v101

    .line 301
    .local v103, "t6":J
    xor-long v105, v55, v103

    .line 303
    .local v105, "t7":J
    const/4 v7, 0x2

    aput-wide v105, p2, v7

    .line 305
    xor-long v107, v33, v99

    .line 306
    .local v107, "t8":J
    const/4 v7, 0x5

    aget-wide v7, v6, v7

    const/4 v11, 0x6

    aget-wide v11, v6, v11

    xor-long v109, v7, v11

    .line 307
    .local v109, "t9":J
    xor-long v35, v107, v109

    .line 308
    .local v35, "t10":J
    const/16 v7, 0x8

    aget-wide v7, v6, v7

    xor-long v37, v35, v7

    .line 309
    .local v37, "t11":J
    const/16 v7, 0xd

    aget-wide v7, v6, v7

    const/16 v11, 0xe

    aget-wide v11, v6, v11

    xor-long v39, v7, v11

    .line 310
    .local v39, "t12":J
    xor-long v41, v37, v39

    .line 311
    .local v41, "t13":J
    const/16 v7, 0x12

    aget-wide v7, v6, v7

    const/16 v11, 0x16

    aget-wide v11, v6, v11

    xor-long v43, v7, v11

    .line 312
    .local v43, "t14":J
    const/16 v7, 0x18

    aget-wide v7, v6, v7

    xor-long v45, v43, v7

    .line 313
    .local v45, "t15":J
    xor-long v47, v41, v45

    .line 315
    .local v47, "t16":J
    const/4 v7, 0x3

    aput-wide v47, p2, v7

    .line 317
    const/4 v7, 0x7

    aget-wide v7, v6, v7

    const/16 v11, 0x8

    aget-wide v11, v6, v11

    xor-long v49, v7, v11

    .line 318
    .local v49, "t17":J
    const/16 v7, 0x9

    aget-wide v7, v6, v7

    xor-long v51, v49, v7

    .line 319
    .local v51, "t18":J
    const/16 v7, 0x11

    aget-wide v7, v6, v7

    xor-long v53, v51, v7

    .line 321
    .local v53, "t19":J
    const/16 v7, 0x8

    aput-wide v53, p2, v7

    .line 323
    xor-long v57, v51, v109

    .line 324
    .local v57, "t20":J
    const/16 v7, 0xf

    aget-wide v7, v6, v7

    const/16 v11, 0x10

    aget-wide v11, v6, v11

    xor-long v59, v7, v11

    .line 325
    .local v59, "t21":J
    xor-long v61, v57, v59

    .line 327
    .local v61, "t22":J
    const/4 v7, 0x7

    aput-wide v61, p2, v7

    .line 329
    xor-long v63, v61, v77

    .line 330
    .local v63, "t23":J
    const/16 v7, 0x13

    aget-wide v7, v6, v7

    const/16 v11, 0x14

    aget-wide v11, v6, v11

    xor-long v65, v7, v11

    .line 332
    .local v65, "t24":J
    const/16 v7, 0x19

    aget-wide v7, v6, v7

    const/16 v11, 0x18

    aget-wide v11, v6, v11

    xor-long v67, v7, v11

    .line 333
    .local v67, "t25":J
    const/16 v7, 0x12

    aget-wide v7, v6, v7

    const/16 v11, 0x17

    aget-wide v11, v6, v11

    xor-long v69, v7, v11

    .line 334
    .local v69, "t26":J
    xor-long v71, v65, v67

    .line 335
    .local v71, "t27":J
    xor-long v73, v71, v69

    .line 336
    .local v73, "t28":J
    xor-long v75, v73, v63

    .line 338
    .local v75, "t29":J
    const/4 v7, 0x4

    aput-wide v75, p2, v7

    .line 340
    xor-long v79, v105, v53

    .line 341
    .local v79, "t30":J
    xor-long v81, v71, v79

    .line 342
    .local v81, "t31":J
    const/16 v7, 0x15

    aget-wide v7, v6, v7

    const/16 v11, 0x16

    aget-wide v11, v6, v11

    xor-long v83, v7, v11

    .line 343
    .local v83, "t32":J
    xor-long v85, v81, v83

    .line 345
    .local v85, "t33":J
    const/4 v7, 0x5

    aput-wide v85, p2, v7

    .line 347
    const/4 v7, 0x0

    aget-wide v7, v6, v7

    xor-long v87, v37, v7

    .line 348
    .local v87, "t34":J
    const/16 v7, 0x9

    aget-wide v7, v6, v7

    xor-long v89, v87, v7

    .line 349
    .local v89, "t35":J
    xor-long v91, v89, v39

    .line 350
    .local v91, "t36":J
    const/16 v7, 0x15

    aget-wide v7, v6, v7

    xor-long v93, v91, v7

    .line 351
    .local v93, "t37":J
    const/16 v7, 0x17

    aget-wide v7, v6, v7

    xor-long v95, v93, v7

    .line 352
    .local v95, "t38":J
    const/16 v7, 0x19

    aget-wide v7, v6, v7

    xor-long v97, v95, v7

    .line 354
    .local v97, "t39":J
    const/4 v7, 0x6

    aput-wide v97, p2, v7

    .line 356
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implCompactExt([J)V

    .line 357
    return-void
.end method

.method protected static implMulw(JJ[JI)V
    .registers 20
    .param p0, "x"    # J
    .param p2, "y"    # J
    .param p4, "z"    # [J
    .param p5, "zOff"    # I

    .prologue
    .line 364
    const/16 v9, 0x8

    new-array v8, v9, [J

    .line 366
    .local v8, "u":[J
    const/4 v9, 0x1

    aput-wide p2, v8, v9

    .line 367
    const/4 v9, 0x2

    const/4 v10, 0x1

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 368
    const/4 v9, 0x3

    const/4 v10, 0x2

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 369
    const/4 v9, 0x4

    const/4 v10, 0x2

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 370
    const/4 v9, 0x5

    const/4 v10, 0x4

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 371
    const/4 v9, 0x6

    const/4 v10, 0x3

    aget-wide v10, v8, v10

    const/4 v12, 0x1

    shl-long/2addr v10, v12

    aput-wide v10, v8, v9

    .line 372
    const/4 v9, 0x7

    const/4 v10, 0x6

    aget-wide v10, v8, v10

    xor-long v10, v10, p2

    aput-wide v10, v8, v9

    .line 374
    long-to-int v4, p0

    .line 375
    .local v4, "j":I
    const-wide/16 v2, 0x0

    .local v2, "h":J
    and-int/lit8 v9, v4, 0x7

    aget-wide v6, v8, v9

    .line 376
    .local v6, "l":J
    const/16 v5, 0x30

    .line 379
    .local v5, "k":I
    :cond_40
    ushr-long v9, p0, v5

    long-to-int v4, v9

    .line 380
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

    .line 383
    .local v0, "g":J
    shl-long v9, v0, v5

    xor-long/2addr v6, v9

    .line 384
    neg-int v9, v5

    ushr-long v9, v0, v9

    xor-long/2addr v2, v9

    .line 386
    add-int/lit8 v5, v5, -0x9

    if-gtz v5, :cond_40

    .line 388
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

    .line 392
    const-wide v9, 0x1ffffffffffffffL    # 4.77830972673648E-299

    and-long/2addr v9, v6

    aput-wide v9, p4, p5

    .line 393
    add-int/lit8 v9, p5, 0x1

    const/16 v10, 0x39

    ushr-long v10, v6, v10

    const/4 v12, 0x7

    shl-long v12, v2, v12

    xor-long/2addr v10, v12

    aput-wide v10, p4, v9

    .line 394
    return-void
.end method

.method protected static implSquare([J[J)V
    .registers 7
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    const/4 v4, 0x4

    .line 398
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, v4, :cond_e

    .line 400
    aget-wide v1, p0, v0

    shl-int/lit8 v3, v0, 0x1

    invoke-static {v1, v2, p1, v3}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 398
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 402
    :cond_e
    const/16 v1, 0x8

    aget-wide v2, p0, v4

    long-to-int v2, v2

    invoke-static {v2}, Lorg/spongycastle/math/raw/Interleave;->expand32to64(I)J

    move-result-wide v2

    aput-wide v2, p1, v1

    .line 403
    return-void
.end method

.method public static invert([J[J)V
    .registers 5
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 56
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat320;->isZero64([J)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 58
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 63
    :cond_c
    invoke-static {}, Lorg/spongycastle/math/raw/Nat320;->create64()[J

    move-result-object v0

    .line 64
    .local v0, "t0":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat320;->create64()[J

    move-result-object v1

    .line 66
    .local v1, "t1":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->square([J[J)V

    .line 67
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 68
    const/4 v2, 0x2

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->squareN([JI[J)V

    .line 69
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 70
    const/4 v2, 0x4

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->squareN([JI[J)V

    .line 71
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 72
    const/16 v2, 0x8

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->squareN([JI[J)V

    .line 73
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 74
    invoke-static {v1, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->square([J[J)V

    .line 75
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 76
    const/16 v2, 0x11

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->squareN([JI[J)V

    .line 77
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 78
    invoke-static {v0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->square([J[J)V

    .line 79
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 80
    const/16 v2, 0x23

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->squareN([JI[J)V

    .line 81
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 82
    const/16 v2, 0x46

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->squareN([JI[J)V

    .line 83
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 84
    invoke-static {v0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->square([J[J)V

    .line 85
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 86
    const/16 v2, 0x8d

    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->squareN([JI[J)V

    .line 87
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 88
    invoke-static {v1, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->square([J[J)V

    .line 89
    return-void
.end method

.method public static multiply([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "z"    # [J

    .prologue
    .line 93
    invoke-static {}, Lorg/spongycastle/math/raw/Nat320;->createExt64()[J

    move-result-object v0

    .line 94
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMultiply([J[J[J)V

    .line 95
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->reduce([J[J)V

    .line 96
    return-void
.end method

.method public static multiplyAddToExt([J[J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "y"    # [J
    .param p2, "zz"    # [J

    .prologue
    .line 100
    invoke-static {}, Lorg/spongycastle/math/raw/Nat320;->createExt64()[J

    move-result-object v0

    .line 101
    .local v0, "tt":[J
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implMultiply([J[J[J)V

    .line 102
    invoke-static {p2, v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->addExt([J[J[J)V

    .line 103
    return-void
.end method

.method public static reduce([J[J)V
    .registers 27
    .param p0, "xx"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 107
    const/16 v20, 0x0

    aget-wide v2, p0, v20

    .local v2, "x0":J
    const/16 v20, 0x1

    aget-wide v4, p0, v20

    .local v4, "x1":J
    const/16 v20, 0x2

    aget-wide v6, p0, v20

    .local v6, "x2":J
    const/16 v20, 0x3

    aget-wide v8, p0, v20

    .local v8, "x3":J
    const/16 v20, 0x4

    aget-wide v10, p0, v20

    .line 108
    .local v10, "x4":J
    const/16 v20, 0x5

    aget-wide v12, p0, v20

    .local v12, "x5":J
    const/16 v20, 0x6

    aget-wide v14, p0, v20

    .local v14, "x6":J
    const/16 v20, 0x7

    aget-wide v16, p0, v20

    .local v16, "x7":J
    const/16 v20, 0x8

    aget-wide v18, p0, v20

    .line 110
    .local v18, "x8":J
    const/16 v20, 0x25

    shl-long v20, v18, v20

    const/16 v22, 0x2a

    shl-long v22, v18, v22

    xor-long v20, v20, v22

    const/16 v22, 0x2c

    shl-long v22, v18, v22

    xor-long v20, v20, v22

    const/16 v22, 0x31

    shl-long v22, v18, v22

    xor-long v20, v20, v22

    xor-long v8, v8, v20

    .line 111
    const/16 v20, 0x1b

    ushr-long v20, v18, v20

    const/16 v22, 0x16

    ushr-long v22, v18, v22

    xor-long v20, v20, v22

    const/16 v22, 0x14

    ushr-long v22, v18, v22

    xor-long v20, v20, v22

    const/16 v22, 0xf

    ushr-long v22, v18, v22

    xor-long v20, v20, v22

    xor-long v10, v10, v20

    .line 113
    const/16 v20, 0x25

    shl-long v20, v16, v20

    const/16 v22, 0x2a

    shl-long v22, v16, v22

    xor-long v20, v20, v22

    const/16 v22, 0x2c

    shl-long v22, v16, v22

    xor-long v20, v20, v22

    const/16 v22, 0x31

    shl-long v22, v16, v22

    xor-long v20, v20, v22

    xor-long v6, v6, v20

    .line 114
    const/16 v20, 0x1b

    ushr-long v20, v16, v20

    const/16 v22, 0x16

    ushr-long v22, v16, v22

    xor-long v20, v20, v22

    const/16 v22, 0x14

    ushr-long v22, v16, v22

    xor-long v20, v20, v22

    const/16 v22, 0xf

    ushr-long v22, v16, v22

    xor-long v20, v20, v22

    xor-long v8, v8, v20

    .line 116
    const/16 v20, 0x25

    shl-long v20, v14, v20

    const/16 v22, 0x2a

    shl-long v22, v14, v22

    xor-long v20, v20, v22

    const/16 v22, 0x2c

    shl-long v22, v14, v22

    xor-long v20, v20, v22

    const/16 v22, 0x31

    shl-long v22, v14, v22

    xor-long v20, v20, v22

    xor-long v4, v4, v20

    .line 117
    const/16 v20, 0x1b

    ushr-long v20, v14, v20

    const/16 v22, 0x16

    ushr-long v22, v14, v22

    xor-long v20, v20, v22

    const/16 v22, 0x14

    ushr-long v22, v14, v22

    xor-long v20, v20, v22

    const/16 v22, 0xf

    ushr-long v22, v14, v22

    xor-long v20, v20, v22

    xor-long v6, v6, v20

    .line 119
    const/16 v20, 0x25

    shl-long v20, v12, v20

    const/16 v22, 0x2a

    shl-long v22, v12, v22

    xor-long v20, v20, v22

    const/16 v22, 0x2c

    shl-long v22, v12, v22

    xor-long v20, v20, v22

    const/16 v22, 0x31

    shl-long v22, v12, v22

    xor-long v20, v20, v22

    xor-long v2, v2, v20

    .line 120
    const/16 v20, 0x1b

    ushr-long v20, v12, v20

    const/16 v22, 0x16

    ushr-long v22, v12, v22

    xor-long v20, v20, v22

    const/16 v22, 0x14

    ushr-long v22, v12, v22

    xor-long v20, v20, v22

    const/16 v22, 0xf

    ushr-long v22, v12, v22

    xor-long v20, v20, v22

    xor-long v4, v4, v20

    .line 122
    const/16 v20, 0x1b

    ushr-long v0, v10, v20

    .line 123
    .local v0, "t":J
    const/16 v20, 0x0

    xor-long v21, v2, v0

    const/16 v23, 0x5

    shl-long v23, v0, v23

    xor-long v21, v21, v23

    const/16 v23, 0x7

    shl-long v23, v0, v23

    xor-long v21, v21, v23

    const/16 v23, 0xc

    shl-long v23, v0, v23

    xor-long v21, v21, v23

    aput-wide v21, p1, v20

    .line 124
    const/16 v20, 0x1

    aput-wide v4, p1, v20

    .line 125
    const/16 v20, 0x2

    aput-wide v6, p1, v20

    .line 126
    const/16 v20, 0x3

    aput-wide v8, p1, v20

    .line 127
    const/16 v20, 0x4

    const-wide/32 v21, 0x7ffffff

    and-long v21, v21, v10

    aput-wide v21, p1, v20

    .line 128
    return-void
.end method

.method public static reduce37([JI)V
    .registers 12
    .param p0, "z"    # [J
    .param p1, "zOff"    # I

    .prologue
    .line 132
    add-int/lit8 v4, p1, 0x4

    aget-wide v2, p0, v4

    .local v2, "z4":J
    const/16 v4, 0x1b

    ushr-long v0, v2, v4

    .line 133
    .local v0, "t":J
    aget-wide v4, p0, p1

    const/4 v6, 0x5

    shl-long v6, v0, v6

    xor-long/2addr v6, v0

    const/4 v8, 0x7

    shl-long v8, v0, v8

    xor-long/2addr v6, v8

    const/16 v8, 0xc

    shl-long v8, v0, v8

    xor-long/2addr v6, v8

    xor-long/2addr v4, v6

    aput-wide v4, p0, p1

    .line 134
    add-int/lit8 v4, p1, 0x4

    const-wide/32 v5, 0x7ffffff

    and-long/2addr v5, v2

    aput-wide v5, p0, v4

    .line 135
    return-void
.end method

.method public static sqrt([J[J)V
    .registers 19
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 139
    invoke-static {}, Lorg/spongycastle/math/raw/Nat320;->create64()[J

    move-result-object v7

    .line 142
    .local v7, "odd":[J
    const/4 v12, 0x0

    aget-wide v12, p0, v12

    invoke-static {v12, v13}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v8

    .local v8, "u0":J
    const/4 v12, 0x1

    aget-wide v12, p0, v12

    invoke-static {v12, v13}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v10

    .line 143
    .local v10, "u1":J
    const-wide v12, 0xffffffffL

    and-long/2addr v12, v8

    const/16 v14, 0x20

    shl-long v14, v10, v14

    or-long v1, v12, v14

    .line 144
    .local v1, "e0":J
    const/4 v12, 0x0

    const/16 v13, 0x20

    ushr-long v13, v8, v13

    const-wide v15, -0x100000000L

    and-long/2addr v15, v10

    or-long/2addr v13, v15

    aput-wide v13, v7, v12

    .line 146
    const/4 v12, 0x2

    aget-wide v12, p0, v12

    invoke-static {v12, v13}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v8

    const/4 v12, 0x3

    aget-wide v12, p0, v12

    invoke-static {v12, v13}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v10

    .line 147
    const-wide v12, 0xffffffffL

    and-long/2addr v12, v8

    const/16 v14, 0x20

    shl-long v14, v10, v14

    or-long v3, v12, v14

    .line 148
    .local v3, "e1":J
    const/4 v12, 0x1

    const/16 v13, 0x20

    ushr-long v13, v8, v13

    const-wide v15, -0x100000000L

    and-long/2addr v15, v10

    or-long/2addr v13, v15

    aput-wide v13, v7, v12

    .line 150
    const/4 v12, 0x4

    aget-wide v12, p0, v12

    invoke-static {v12, v13}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    move-result-wide v8

    .line 151
    const-wide v12, 0xffffffffL

    and-long v5, v8, v12

    .line 152
    .local v5, "e2":J
    const/4 v12, 0x2

    const/16 v13, 0x20

    ushr-long v13, v8, v13

    aput-wide v13, v7, v12

    .line 154
    sget-object v12, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->ROOT_Z:[J

    move-object/from16 v0, p1

    invoke-static {v7, v12, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->multiply([J[J[J)V

    .line 156
    const/4 v12, 0x0

    aget-wide v13, p1, v12

    xor-long/2addr v13, v1

    aput-wide v13, p1, v12

    .line 157
    const/4 v12, 0x1

    aget-wide v13, p1, v12

    xor-long/2addr v13, v3

    aput-wide v13, p1, v12

    .line 158
    const/4 v12, 0x2

    aget-wide v13, p1, v12

    xor-long/2addr v13, v5

    aput-wide v13, p1, v12

    .line 159
    return-void
.end method

.method public static square([J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    .line 163
    const/16 v1, 0x9

    invoke-static {v1}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    move-result-object v0

    .line 164
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implSquare([J[J)V

    .line 165
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->reduce([J[J)V

    .line 166
    return-void
.end method

.method public static squareAddToExt([J[J)V
    .registers 4
    .param p0, "x"    # [J
    .param p1, "zz"    # [J

    .prologue
    .line 170
    const/16 v1, 0x9

    invoke-static {v1}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    move-result-object v0

    .line 171
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implSquare([J[J)V

    .line 172
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->addExt([J[J[J)V

    .line 173
    return-void
.end method

.method public static squareN([JI[J)V
    .registers 5
    .param p0, "x"    # [J
    .param p1, "n"    # I
    .param p2, "z"    # [J

    .prologue
    .line 179
    const/16 v1, 0x9

    invoke-static {v1}, Lorg/spongycastle/math/raw/Nat;->create64(I)[J

    move-result-object v0

    .line 180
    .local v0, "tt":[J
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implSquare([J[J)V

    .line 181
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->reduce([J[J)V

    .line 183
    :goto_c
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_17

    .line 185
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->implSquare([J[J)V

    .line 186
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT283Field;->reduce([J[J)V

    goto :goto_c

    .line 188
    :cond_17
    return-void
.end method

.method public static trace([J)I
    .registers 6
    .param p0, "x"    # [J

    .prologue
    .line 193
    const/4 v0, 0x0

    aget-wide v0, p0, v0

    const/4 v2, 0x4

    aget-wide v2, p0, v2

    const/16 v4, 0xf

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    long-to-int v0, v0

    and-int/lit8 v0, v0, 0x1

    return v0
.end method
