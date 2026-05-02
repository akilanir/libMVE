.class public Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;
.super Ljava/lang/Object;
.source "SecP224R1Field.java"


# static fields
.field private static final M:J = 0xffffffffL

.field static final P:[I

.field private static final P6:I = -0x1

.field static final PExt:[I

.field private static final PExt13:I = -0x1

.field private static final PExtInv:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_1c

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 14
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_2e

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExt:[I

    .line 16
    const/16 v0, 0xb

    new-array v0, v0, [I

    fill-array-data v0, :array_4e

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    return-void

    .line 13
    nop

    :array_1c
    .array-data 4
        0x1
        0x0
        0x0
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 14
    :array_2e
    .array-data 4
        0x1
        0x0
        0x0
        -0x2
        -0x1
        -0x1
        0x0
        0x2
        0x0
        0x0
        -0x2
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 16
    :array_4e
    .array-data 4
        -0x1
        -0x1
        -0x1
        0x1
        0x0
        0x0
        -0x1
        -0x3
        -0x1
        -0x1
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add([I[I[I)V
    .registers 6
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    .line 23
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat224;->add([I[I[I)I

    move-result v0

    .line 24
    .local v0, "c":I
    if-nez v0, :cond_14

    const/4 v1, 0x6

    aget v1, p2, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_17

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    invoke-static {p2, v1}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 26
    :cond_14
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 28
    :cond_17
    return-void
.end method

.method public static addExt([I[I[I)V
    .registers 7
    .param p0, "xx"    # [I
    .param p1, "yy"    # [I
    .param p2, "zz"    # [I

    .prologue
    const/16 v3, 0xe

    .line 32
    invoke-static {v3, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    move-result v0

    .line 33
    .local v0, "c":I
    if-nez v0, :cond_17

    const/16 v1, 0xd

    aget v1, p2, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_28

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExt:[I

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 35
    :cond_17
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    array-length v1, v1

    sget-object v2, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    move-result v1

    if-eqz v1, :cond_28

    .line 37
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    array-length v1, v1

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 40
    :cond_28
    return-void
.end method

.method public static addOne([I[I)V
    .registers 5
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 44
    const/4 v1, 0x7

    invoke-static {v1, p0, p1}, Lorg/spongycastle/math/raw/Nat;->inc(I[I[I)I

    move-result v0

    .line 45
    .local v0, "c":I
    if-nez v0, :cond_15

    const/4 v1, 0x6

    aget v1, p1, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    invoke-static {p1, v1}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 47
    :cond_15
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 49
    :cond_18
    return-void
.end method

.method private static addPInvTo([I)V
    .registers 13
    .param p0, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const-wide v7, 0xffffffffL

    const/16 v6, 0x20

    .line 255
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v7

    const-wide/16 v4, 0x1

    sub-long v0, v2, v4

    .line 256
    .local v0, "c":J
    long-to-int v2, v0

    aput v2, p0, v9

    .line 257
    shr-long/2addr v0, v6

    .line 258
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_2e

    .line 260
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v7

    add-long/2addr v0, v2

    .line 261
    long-to-int v2, v0

    aput v2, p0, v10

    .line 262
    shr-long/2addr v0, v6

    .line 263
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v7

    add-long/2addr v0, v2

    .line 264
    long-to-int v2, v0

    aput v2, p0, v11

    .line 265
    shr-long/2addr v0, v6

    .line 267
    :cond_2e
    const/4 v2, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 268
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p0, v2

    .line 269
    shr-long/2addr v0, v6

    .line 270
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_47

    .line 272
    const/4 v2, 0x7

    const/4 v3, 0x4

    invoke-static {v2, p0, v3}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 274
    :cond_47
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .registers 4
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 53
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat224;->fromBigInteger(Ljava/math/BigInteger;)[I

    move-result-object v0

    .line 54
    .local v0, "z":[I
    const/4 v1, 0x6

    aget v1, v0, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_17

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    invoke-static {v0, v1}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 56
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    invoke-static {v1, v0}, Lorg/spongycastle/math/raw/Nat224;->subFrom([I[I)I

    .line 58
    :cond_17
    return-object v0
.end method

.method public static half([I[I)V
    .registers 6
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    const/4 v3, 0x7

    const/4 v2, 0x0

    .line 63
    aget v1, p0, v2

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_c

    .line 65
    invoke-static {v3, p0, v2, p1}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II[I)I

    .line 72
    :goto_b
    return-void

    .line 69
    :cond_c
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    invoke-static {p0, v1, p1}, Lorg/spongycastle/math/raw/Nat224;->add([I[I[I)I

    move-result v0

    .line 70
    .local v0, "c":I
    invoke-static {v3, p1, v0}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II)I

    goto :goto_b
.end method

.method public static multiply([I[I[I)V
    .registers 4
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    .line 76
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->createExt()[I

    move-result-object v0

    .line 77
    .local v0, "tt":[I
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/raw/Nat224;->mul([I[I[I)V

    .line 78
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

    .line 79
    return-void
.end method

.method public static multiplyAddToExt([I[I[I)V
    .registers 7
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "zz"    # [I

    .prologue
    const/16 v3, 0xe

    .line 83
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat224;->mulAddTo([I[I[I)I

    move-result v0

    .line 84
    .local v0, "c":I
    if-nez v0, :cond_17

    const/16 v1, 0xd

    aget v1, p2, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_28

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExt:[I

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 86
    :cond_17
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    array-length v1, v1

    sget-object v2, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    move-result v1

    if-eqz v1, :cond_28

    .line 88
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    array-length v1, v1

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 91
    :cond_28
    return-void
.end method

.method public static negate([I[I)V
    .registers 3
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 95
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat224;->isZero([I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 97
    invoke-static {p1}, Lorg/spongycastle/math/raw/Nat224;->zero([I)V

    .line 103
    :goto_9
    return-void

    .line 101
    :cond_a
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/raw/Nat224;->sub([I[I[I)I

    goto :goto_9
.end method

.method public static reduce([I[I)V
    .registers 31
    .param p0, "xx"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 107
    const/16 v25, 0xa

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v13, v25, v27

    .local v13, "xx10":J
    const/16 v25, 0xb

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v15, v25, v27

    .local v15, "xx11":J
    const/16 v25, 0xc

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v17, v25, v27

    .local v17, "xx12":J
    const/16 v25, 0xd

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v19, v25, v27

    .line 109
    .local v19, "xx13":J
    const-wide/16 v5, 0x1

    .line 111
    .local v5, "n":J
    const/16 v25, 0x7

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v25, v25, v15

    const-wide/16 v27, 0x1

    sub-long v7, v25, v27

    .line 112
    .local v7, "t0":J
    const/16 v25, 0x8

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v9, v25, v17

    .line 113
    .local v9, "t1":J
    const/16 v25, 0x9

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v11, v25, v19

    .line 115
    .local v11, "t2":J
    const-wide/16 v3, 0x0

    .line 116
    .local v3, "cc":J
    const/16 v25, 0x0

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    sub-long v25, v25, v7

    add-long v3, v3, v25

    .line 117
    const-wide v25, 0xffffffffL

    and-long v21, v3, v25

    .line 118
    .local v21, "z0":J
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 119
    const/16 v25, 0x1

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    sub-long v25, v25, v9

    add-long v3, v3, v25

    .line 120
    const/16 v25, 0x1

    long-to-int v0, v3

    move/from16 v26, v0

    aput v26, p1, v25

    .line 121
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 122
    const/16 v25, 0x2

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    sub-long v25, v25, v11

    add-long v3, v3, v25

    .line 123
    const/16 v25, 0x2

    long-to-int v0, v3

    move/from16 v26, v0

    aput v26, p1, v25

    .line 124
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 125
    const/16 v25, 0x3

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v25, v25, v7

    sub-long v25, v25, v13

    add-long v3, v3, v25

    .line 126
    const-wide v25, 0xffffffffL

    and-long v23, v3, v25

    .line 127
    .local v23, "z3":J
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 128
    const/16 v25, 0x4

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v25, v25, v9

    sub-long v25, v25, v15

    add-long v3, v3, v25

    .line 129
    const/16 v25, 0x4

    long-to-int v0, v3

    move/from16 v26, v0

    aput v26, p1, v25

    .line 130
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 131
    const/16 v25, 0x5

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v25, v25, v11

    sub-long v25, v25, v17

    add-long v3, v3, v25

    .line 132
    const/16 v25, 0x5

    long-to-int v0, v3

    move/from16 v26, v0

    aput v26, p1, v25

    .line 133
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 134
    const/16 v25, 0x6

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v25, v25, v13

    sub-long v25, v25, v19

    add-long v3, v3, v25

    .line 135
    const/16 v25, 0x6

    long-to-int v0, v3

    move/from16 v26, v0

    aput v26, p1, v25

    .line 136
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 137
    const-wide/16 v25, 0x1

    add-long v3, v3, v25

    .line 141
    add-long v23, v23, v3

    .line 143
    sub-long v21, v21, v3

    .line 144
    const/16 v25, 0x0

    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v26, v0

    aput v26, p1, v25

    .line 145
    const/16 v25, 0x20

    shr-long v3, v21, v25

    .line 146
    const-wide/16 v25, 0x0

    cmp-long v25, v3, v25

    if-eqz v25, :cond_1b6

    .line 148
    const/16 v25, 0x1

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v3, v3, v25

    .line 149
    const/16 v25, 0x1

    long-to-int v0, v3

    move/from16 v26, v0

    aput v26, p1, v25

    .line 150
    const/16 v25, 0x20

    shr-long v3, v3, v25

    .line 151
    const/16 v25, 0x2

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v3, v3, v25

    .line 152
    const/16 v25, 0x2

    long-to-int v0, v3

    move/from16 v26, v0

    aput v26, p1, v25

    .line 153
    const/16 v25, 0x20

    shr-long v25, v3, v25

    add-long v23, v23, v25

    .line 155
    :cond_1b6
    const/16 v25, 0x3

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v26, v0

    aput v26, p1, v25

    .line 156
    const/16 v25, 0x20

    shr-long v3, v23, v25

    .line 160
    const-wide/16 v25, 0x0

    cmp-long v25, v3, v25

    if-eqz v25, :cond_1d9

    const/16 v25, 0x7

    const/16 v26, 0x4

    move/from16 v0, v25

    move-object/from16 v1, p1

    move/from16 v2, v26

    invoke-static {v0, v1, v2}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    move-result v25

    if-nez v25, :cond_1f1

    :cond_1d9
    const/16 v25, 0x6

    aget v25, p1, v25

    const/16 v26, -0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_1f4

    sget-object v25, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 161
    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    move-result v25

    if-eqz v25, :cond_1f4

    .line 163
    :cond_1f1
    invoke-static/range {p1 .. p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 165
    :cond_1f4
    return-void
.end method

.method public static reduce32(I[I)V
    .registers 14
    .param p0, "x"    # I
    .param p1, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 169
    const-wide/16 v0, 0x0

    .line 171
    .local v0, "cc":J
    if-eqz p0, :cond_3f

    .line 173
    int-to-long v4, p0

    and-long v2, v4, v6

    .line 175
    .local v2, "xx07":J
    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 176
    long-to-int v4, v0

    aput v4, p1, v9

    .line 177
    shr-long/2addr v0, v8

    .line 178
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-eqz v4, :cond_33

    .line 180
    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 181
    long-to-int v4, v0

    aput v4, p1, v10

    .line 182
    shr-long/2addr v0, v8

    .line 183
    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 184
    long-to-int v4, v0

    aput v4, p1, v11

    .line 185
    shr-long/2addr v0, v8

    .line 187
    :cond_33
    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 188
    const/4 v4, 0x3

    long-to-int v5, v0

    aput v5, p1, v4

    .line 189
    shr-long/2addr v0, v8

    .line 194
    .end local v2    # "xx07":J
    :cond_3f
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-eqz v4, :cond_4d

    const/4 v4, 0x7

    const/4 v5, 0x4

    invoke-static {v4, p1, v5}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    move-result v4

    if-nez v4, :cond_5b

    :cond_4d
    const/4 v4, 0x6

    aget v4, p1, v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_5e

    sget-object v4, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 195
    invoke-static {p1, v4}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    move-result v4

    if-eqz v4, :cond_5e

    .line 197
    :cond_5b
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 199
    :cond_5e
    return-void
.end method

.method public static square([I[I)V
    .registers 3
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 203
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->createExt()[I

    move-result-object v0

    .line 204
    .local v0, "tt":[I
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat224;->square([I[I)V

    .line 205
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

    .line 206
    return-void
.end method

.method public static squareN([II[I)V
    .registers 4
    .param p0, "x"    # [I
    .param p1, "n"    # I
    .param p2, "z"    # [I

    .prologue
    .line 212
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->createExt()[I

    move-result-object v0

    .line 213
    .local v0, "tt":[I
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat224;->square([I[I)V

    .line 214
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

    .line 216
    :goto_a
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_15

    .line 218
    invoke-static {p2, v0}, Lorg/spongycastle/math/raw/Nat224;->square([I[I)V

    .line 219
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

    goto :goto_a

    .line 221
    :cond_15
    return-void
.end method

.method private static subPInvFrom([I)V
    .registers 13
    .param p0, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const-wide v7, 0xffffffffL

    const/16 v6, 0x20

    .line 278
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v7

    const-wide/16 v4, 0x1

    add-long v0, v2, v4

    .line 279
    .local v0, "c":J
    long-to-int v2, v0

    aput v2, p0, v9

    .line 280
    shr-long/2addr v0, v6

    .line 281
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_2e

    .line 283
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v7

    add-long/2addr v0, v2

    .line 284
    long-to-int v2, v0

    aput v2, p0, v10

    .line 285
    shr-long/2addr v0, v6

    .line 286
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v7

    add-long/2addr v0, v2

    .line 287
    long-to-int v2, v0

    aput v2, p0, v11

    .line 288
    shr-long/2addr v0, v6

    .line 290
    :cond_2e
    const/4 v2, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    const-wide/16 v4, 0x1

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 291
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p0, v2

    .line 292
    shr-long/2addr v0, v6

    .line 293
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_47

    .line 295
    const/4 v2, 0x7

    const/4 v3, 0x4

    invoke-static {v2, p0, v3}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    .line 297
    :cond_47
    return-void
.end method

.method public static subtract([I[I[I)V
    .registers 4
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    .line 225
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat224;->sub([I[I[I)I

    move-result v0

    .line 226
    .local v0, "c":I
    if-eqz v0, :cond_9

    .line 228
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->subPInvFrom([I)V

    .line 230
    :cond_9
    return-void
.end method

.method public static subtractExt([I[I[I)V
    .registers 7
    .param p0, "xx"    # [I
    .param p1, "yy"    # [I
    .param p2, "zz"    # [I

    .prologue
    const/16 v3, 0xe

    .line 234
    invoke-static {v3, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->sub(I[I[I[I)I

    move-result v0

    .line 235
    .local v0, "c":I
    if-eqz v0, :cond_19

    .line 237
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    array-length v1, v1

    sget-object v2, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    move-result v1

    if-eqz v1, :cond_19

    .line 239
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    array-length v1, v1

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    .line 242
    :cond_19
    return-void
.end method

.method public static twice([I[I)V
    .registers 5
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 246
    const/4 v1, 0x7

    const/4 v2, 0x0

    invoke-static {v1, p0, v2, p1}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit(I[II[I)I

    move-result v0

    .line 247
    .local v0, "c":I
    if-nez v0, :cond_16

    const/4 v1, 0x6

    aget v1, p1, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_19

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    invoke-static {p1, v1}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 249
    :cond_16
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 251
    :cond_19
    return-void
.end method
