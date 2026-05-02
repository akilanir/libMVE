.class public Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;
.super Ljava/lang/Object;
.source "SecP160R1Field.java"


# static fields
.field private static final M:J = 0xffffffffL

.field static final P:[I

.field private static final P4:I = -0x1

.field static final PExt:[I

.field private static final PExt9:I = -0x1

.field private static final PExtInv:[I

.field private static final PInv:I = -0x7fffffff


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_1a

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    .line 14
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_28

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExt:[I

    .line 16
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_40

    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    return-void

    .line 13
    :array_1a
    .array-data 4
        0x7fffffff
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 14
    :array_28
    .array-data 4
        0x1
        0x40000001    # 2.0000002f
        0x0
        0x0
        0x0
        -0x2
        -0x2
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 16
    :array_40
    .array-data 4
        -0x1
        -0x40000002    # -1.9999998f
        -0x1
        -0x1
        -0x1
        0x1
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
    .line 24
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat160;->add([I[I[I)I

    move-result v0

    .line 25
    .local v0, "c":I
    if-nez v0, :cond_14

    const/4 v1, 0x4

    aget v1, p2, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1b

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    invoke-static {p2, v1}, Lorg/spongycastle/math/raw/Nat160;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 27
    :cond_14
    const/4 v1, 0x5

    const v2, -0x7fffffff

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->addWordTo(II[I)I

    .line 29
    :cond_1b
    return-void
.end method

.method public static addExt([I[I[I)V
    .registers 7
    .param p0, "xx"    # [I
    .param p1, "yy"    # [I
    .param p2, "zz"    # [I

    .prologue
    const/16 v3, 0xa

    .line 33
    invoke-static {v3, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    move-result v0

    .line 34
    .local v0, "c":I
    if-nez v0, :cond_17

    const/16 v1, 0x9

    aget v1, p2, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_28

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExt:[I

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 36
    :cond_17
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    array-length v1, v1

    sget-object v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    move-result v1

    if-eqz v1, :cond_28

    .line 38
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    array-length v1, v1

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 41
    :cond_28
    return-void
.end method

.method public static addOne([I[I)V
    .registers 6
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    const/4 v3, 0x5

    .line 45
    invoke-static {v3, p0, p1}, Lorg/spongycastle/math/raw/Nat;->inc(I[I[I)I

    move-result v0

    .line 46
    .local v0, "c":I
    if-nez v0, :cond_15

    const/4 v1, 0x4

    aget v1, p1, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1b

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    invoke-static {p1, v1}, Lorg/spongycastle/math/raw/Nat160;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 48
    :cond_15
    const v1, -0x7fffffff

    invoke-static {v3, v1, p1}, Lorg/spongycastle/math/raw/Nat;->addWordTo(II[I)I

    .line 50
    :cond_1b
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .registers 4
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 54
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat160;->fromBigInteger(Ljava/math/BigInteger;)[I

    move-result-object v0

    .line 55
    .local v0, "z":[I
    const/4 v1, 0x4

    aget v1, v0, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_17

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    invoke-static {v0, v1}, Lorg/spongycastle/math/raw/Nat160;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 57
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    invoke-static {v1, v0}, Lorg/spongycastle/math/raw/Nat160;->subFrom([I[I)I

    .line 59
    :cond_17
    return-object v0
.end method

.method public static half([I[I)V
    .registers 6
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    const/4 v3, 0x5

    const/4 v2, 0x0

    .line 64
    aget v1, p0, v2

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_c

    .line 66
    invoke-static {v3, p0, v2, p1}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II[I)I

    .line 73
    :goto_b
    return-void

    .line 70
    :cond_c
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    invoke-static {p0, v1, p1}, Lorg/spongycastle/math/raw/Nat160;->add([I[I[I)I

    move-result v0

    .line 71
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
    .line 77
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->createExt()[I

    move-result-object v0

    .line 78
    .local v0, "tt":[I
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/raw/Nat160;->mul([I[I[I)V

    .line 79
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce([I[I)V

    .line 80
    return-void
.end method

.method public static multiplyAddToExt([I[I[I)V
    .registers 7
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "zz"    # [I

    .prologue
    const/16 v3, 0xa

    .line 84
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat160;->mulAddTo([I[I[I)I

    move-result v0

    .line 85
    .local v0, "c":I
    if-nez v0, :cond_17

    const/16 v1, 0x9

    aget v1, p2, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_28

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExt:[I

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 87
    :cond_17
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    array-length v1, v1

    sget-object v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    move-result v1

    if-eqz v1, :cond_28

    .line 89
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    array-length v1, v1

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 92
    :cond_28
    return-void
.end method

.method public static negate([I[I)V
    .registers 3
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 96
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat160;->isZero([I)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 98
    invoke-static {p1}, Lorg/spongycastle/math/raw/Nat160;->zero([I)V

    .line 104
    :goto_9
    return-void

    .line 102
    :cond_a
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/raw/Nat160;->sub([I[I[I)I

    goto :goto_9
.end method

.method public static reduce([I[I)V
    .registers 19
    .param p0, "xx"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 108
    const/4 v13, 0x5

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long v3, v13, v15

    .local v3, "x5":J
    const/4 v13, 0x6

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long v5, v13, v15

    .local v5, "x6":J
    const/4 v13, 0x7

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long v7, v13, v15

    .local v7, "x7":J
    const/16 v13, 0x8

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long v9, v13, v15

    .local v9, "x8":J
    const/16 v13, 0x9

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long v11, v13, v15

    .line 110
    .local v11, "x9":J
    const-wide/16 v1, 0x0

    .line 111
    .local v1, "c":J
    const/4 v13, 0x0

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long/2addr v13, v15

    add-long/2addr v13, v3

    const/16 v15, 0x1f

    shl-long v15, v3, v15

    add-long/2addr v13, v15

    add-long/2addr v1, v13

    .line 112
    const/4 v13, 0x0

    long-to-int v14, v1

    aput v14, p1, v13

    const/16 v13, 0x20

    ushr-long/2addr v1, v13

    .line 113
    const/4 v13, 0x1

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long/2addr v13, v15

    add-long/2addr v13, v5

    const/16 v15, 0x1f

    shl-long v15, v5, v15

    add-long/2addr v13, v15

    add-long/2addr v1, v13

    .line 114
    const/4 v13, 0x1

    long-to-int v14, v1

    aput v14, p1, v13

    const/16 v13, 0x20

    ushr-long/2addr v1, v13

    .line 115
    const/4 v13, 0x2

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long/2addr v13, v15

    add-long/2addr v13, v7

    const/16 v15, 0x1f

    shl-long v15, v7, v15

    add-long/2addr v13, v15

    add-long/2addr v1, v13

    .line 116
    const/4 v13, 0x2

    long-to-int v14, v1

    aput v14, p1, v13

    const/16 v13, 0x20

    ushr-long/2addr v1, v13

    .line 117
    const/4 v13, 0x3

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long/2addr v13, v15

    add-long/2addr v13, v9

    const/16 v15, 0x1f

    shl-long v15, v9, v15

    add-long/2addr v13, v15

    add-long/2addr v1, v13

    .line 118
    const/4 v13, 0x3

    long-to-int v14, v1

    aput v14, p1, v13

    const/16 v13, 0x20

    ushr-long/2addr v1, v13

    .line 119
    const/4 v13, 0x4

    aget v13, p0, v13

    int-to-long v13, v13

    const-wide v15, 0xffffffffL

    and-long/2addr v13, v15

    add-long/2addr v13, v11

    const/16 v15, 0x1f

    shl-long v15, v11, v15

    add-long/2addr v13, v15

    add-long/2addr v1, v13

    .line 120
    const/4 v13, 0x4

    long-to-int v14, v1

    aput v14, p1, v13

    const/16 v13, 0x20

    ushr-long/2addr v1, v13

    .line 124
    long-to-int v13, v1

    move-object/from16 v0, p1

    invoke-static {v13, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce32(I[I)V

    .line 125
    return-void
.end method

.method public static reduce32(I[I)V
    .registers 5
    .param p0, "x"    # I
    .param p1, "z"    # [I

    .prologue
    const v2, -0x7fffffff

    .line 129
    if-eqz p0, :cond_c

    const/4 v0, 0x0

    invoke-static {v2, p0, p1, v0}, Lorg/spongycastle/math/raw/Nat160;->mulWordsAdd(II[II)I

    move-result v0

    if-nez v0, :cond_1a

    :cond_c
    const/4 v0, 0x4

    aget v0, p1, v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1e

    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    .line 130
    invoke-static {p1, v0}, Lorg/spongycastle/math/raw/Nat160;->gte([I[I)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 132
    :cond_1a
    const/4 v0, 0x5

    invoke-static {v0, v2, p1}, Lorg/spongycastle/math/raw/Nat;->addWordTo(II[I)I

    .line 134
    :cond_1e
    return-void
.end method

.method public static square([I[I)V
    .registers 3
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    .line 138
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->createExt()[I

    move-result-object v0

    .line 139
    .local v0, "tt":[I
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat160;->square([I[I)V

    .line 140
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce([I[I)V

    .line 141
    return-void
.end method

.method public static squareN([II[I)V
    .registers 4
    .param p0, "x"    # [I
    .param p1, "n"    # I
    .param p2, "z"    # [I

    .prologue
    .line 147
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->createExt()[I

    move-result-object v0

    .line 148
    .local v0, "tt":[I
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat160;->square([I[I)V

    .line 149
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce([I[I)V

    .line 151
    :goto_a
    add-int/lit8 p1, p1, -0x1

    if-lez p1, :cond_15

    .line 153
    invoke-static {p2, v0}, Lorg/spongycastle/math/raw/Nat160;->square([I[I)V

    .line 154
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce([I[I)V

    goto :goto_a

    .line 156
    :cond_15
    return-void
.end method

.method public static subtract([I[I[I)V
    .registers 6
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    .line 160
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat160;->sub([I[I[I)I

    move-result v0

    .line 161
    .local v0, "c":I
    if-eqz v0, :cond_d

    .line 163
    const/4 v1, 0x5

    const v2, -0x7fffffff

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->subWordFrom(II[I)I

    .line 165
    :cond_d
    return-void
.end method

.method public static subtractExt([I[I[I)V
    .registers 7
    .param p0, "xx"    # [I
    .param p1, "yy"    # [I
    .param p2, "zz"    # [I

    .prologue
    const/16 v3, 0xa

    .line 169
    invoke-static {v3, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->sub(I[I[I[I)I

    move-result v0

    .line 170
    .local v0, "c":I
    if-eqz v0, :cond_19

    .line 172
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    array-length v1, v1

    sget-object v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    invoke-static {v1, v2, p2}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    move-result v1

    if-eqz v1, :cond_19

    .line 174
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->PExtInv:[I

    array-length v1, v1

    invoke-static {v3, p2, v1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    .line 177
    :cond_19
    return-void
.end method

.method public static twice([I[I)V
    .registers 6
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    const/4 v3, 0x5

    .line 181
    const/4 v1, 0x0

    invoke-static {v3, p0, v1, p1}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit(I[II[I)I

    move-result v0

    .line 182
    .local v0, "c":I
    if-nez v0, :cond_16

    const/4 v1, 0x4

    aget v1, p1, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1c

    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->P:[I

    invoke-static {p1, v1}, Lorg/spongycastle/math/raw/Nat160;->gte([I[I)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 184
    :cond_16
    const v1, -0x7fffffff

    invoke-static {v3, v1, p1}, Lorg/spongycastle/math/raw/Nat;->addWordTo(II[I)I

    .line 186
    :cond_1c
    return-void
.end method
