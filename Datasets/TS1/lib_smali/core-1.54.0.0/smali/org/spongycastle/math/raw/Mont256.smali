.class public abstract Lorg/spongycastle/math/raw/Mont256;
.super Ljava/lang/Object;
.source "Mont256.java"


# static fields
.field private static final M:J = 0xffffffffL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inverse32(I)I
    .registers 3
    .param p0, "x"    # I

    .prologue
    .line 10
    move v0, p0

    .line 11
    .local v0, "z":I
    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    .line 12
    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    .line 13
    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    .line 14
    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    .line 16
    return v0
.end method

.method public static multAdd([I[I[I[II)V
    .registers 31
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I
    .param p3, "m"    # [I
    .param p4, "mInv32"    # I

    .prologue
    .line 21
    const/16 v19, 0x0

    .line 22
    .local v19, "z_8":I
    const/16 v20, 0x0

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v15, v20, v22

    .line 24
    .local v15, "y_0":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_13
    const/16 v20, 0x8

    move/from16 v0, v20

    if-ge v5, v0, :cond_103

    .line 26
    const/16 v20, 0x0

    aget v20, p2, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v17, v20, v22

    .line 27
    .local v17, "z_0":J
    aget v20, p0, v5

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v13, v20, v22

    .line 29
    .local v13, "x_i":J
    mul-long v7, v13, v15

    .line 30
    .local v7, "prod1":J
    const-wide v20, 0xffffffffL

    and-long v20, v20, v7

    add-long v3, v20, v17

    .line 32
    .local v3, "carry":J
    long-to-int v0, v3

    move/from16 v20, v0

    mul-int v20, v20, p4

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v11, v20, v22

    .line 34
    .local v11, "t":J
    const/16 v20, 0x0

    aget v20, p3, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v20, v20, v22

    mul-long v9, v11, v20

    .line 35
    .local v9, "prod2":J
    const-wide v20, 0xffffffffL

    and-long v20, v20, v9

    add-long v3, v3, v20

    .line 37
    const/16 v20, 0x20

    ushr-long v20, v3, v20

    const/16 v22, 0x20

    ushr-long v22, v7, v22

    add-long v20, v20, v22

    const/16 v22, 0x20

    ushr-long v22, v9, v22

    add-long v3, v20, v22

    .line 39
    const/4 v6, 0x1

    .local v6, "j":I
    :goto_7f
    const/16 v20, 0x8

    move/from16 v0, v20

    if-ge v6, v0, :cond_e1

    .line 41
    aget v20, p1, v6

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v20, v20, v22

    mul-long v7, v13, v20

    .line 42
    aget v20, p3, v6

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v20, v20, v22

    mul-long v9, v11, v20

    .line 44
    const-wide v20, 0xffffffffL

    and-long v20, v20, v7

    const-wide v22, 0xffffffffL

    and-long v22, v22, v9

    add-long v20, v20, v22

    aget v22, p2, v6

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v3, v3, v20

    .line 45
    add-int/lit8 v20, v6, -0x1

    long-to-int v0, v3

    move/from16 v21, v0

    aput v21, p2, v20

    .line 46
    const/16 v20, 0x20

    ushr-long v20, v3, v20

    const/16 v22, 0x20

    ushr-long v22, v7, v22

    add-long v20, v20, v22

    const/16 v22, 0x20

    ushr-long v22, v9, v22

    add-long v3, v20, v22

    .line 39
    add-int/lit8 v6, v6, 0x1

    goto :goto_7f

    .line 49
    :cond_e1
    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v20, v20, v22

    add-long v3, v3, v20

    .line 50
    const/16 v20, 0x7

    long-to-int v0, v3

    move/from16 v21, v0

    aput v21, p2, v20

    .line 51
    const/16 v20, 0x20

    ushr-long v20, v3, v20

    move-wide/from16 v0, v20

    long-to-int v0, v0

    move/from16 v19, v0

    .line 24
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_13

    .line 54
    .end local v3    # "carry":J
    .end local v6    # "j":I
    .end local v7    # "prod1":J
    .end local v9    # "prod2":J
    .end local v11    # "t":J
    .end local v13    # "x_i":J
    .end local v17    # "z_0":J
    :cond_103
    if-nez v19, :cond_10b

    invoke-static/range {p2 .. p3}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    move-result v20

    if-eqz v20, :cond_114

    .line 56
    :cond_10b
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 58
    :cond_114
    return-void
.end method

.method public static multAddXF([I[I[I[I)V
    .registers 28
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I
    .param p3, "m"    # [I

    .prologue
    .line 64
    const/16 v17, 0x0

    .line 65
    .local v17, "z_8":I
    const/16 v18, 0x0

    aget v18, p1, v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v15, v18, v20

    .line 67
    .local v15, "y_0":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_13
    const/16 v18, 0x8

    move/from16 v0, v18

    if-ge v5, v0, :cond_cd

    .line 69
    aget v18, p0, v5

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v13, v18, v20

    .line 71
    .local v13, "x_i":J
    mul-long v18, v13, v15

    const/16 v20, 0x0

    aget v20, p2, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v20, v20, v22

    add-long v3, v18, v20

    .line 72
    .local v3, "carry":J
    const-wide v18, 0xffffffffL

    and-long v11, v3, v18

    .line 73
    .local v11, "t":J
    const/16 v18, 0x20

    ushr-long v18, v3, v18

    add-long v3, v18, v11

    .line 75
    const/4 v6, 0x1

    .local v6, "j":I
    :goto_49
    const/16 v18, 0x8

    move/from16 v0, v18

    if-ge v6, v0, :cond_ab

    .line 77
    aget v18, p1, v6

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    mul-long v7, v13, v18

    .line 78
    .local v7, "prod1":J
    aget v18, p3, v6

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    mul-long v9, v11, v18

    .line 80
    .local v9, "prod2":J
    const-wide v18, 0xffffffffL

    and-long v18, v18, v7

    const-wide v20, 0xffffffffL

    and-long v20, v20, v9

    add-long v18, v18, v20

    aget v20, p2, v6

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v20, v20, v22

    add-long v18, v18, v20

    add-long v3, v3, v18

    .line 81
    add-int/lit8 v18, v6, -0x1

    long-to-int v0, v3

    move/from16 v19, v0

    aput v19, p2, v18

    .line 82
    const/16 v18, 0x20

    ushr-long v18, v3, v18

    const/16 v20, 0x20

    ushr-long v20, v7, v20

    add-long v18, v18, v20

    const/16 v20, 0x20

    ushr-long v20, v9, v20

    add-long v3, v18, v20

    .line 75
    add-int/lit8 v6, v6, 0x1

    goto :goto_49

    .line 85
    .end local v7    # "prod1":J
    .end local v9    # "prod2":J
    :cond_ab
    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    add-long v3, v3, v18

    .line 86
    const/16 v18, 0x7

    long-to-int v0, v3

    move/from16 v19, v0

    aput v19, p2, v18

    .line 87
    const/16 v18, 0x20

    ushr-long v18, v3, v18

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v17, v0

    .line 67
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_13

    .line 90
    .end local v3    # "carry":J
    .end local v6    # "j":I
    .end local v11    # "t":J
    .end local v13    # "x_i":J
    :cond_cd
    if-nez v17, :cond_d5

    invoke-static/range {p2 .. p3}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    move-result v18

    if-eqz v18, :cond_de

    .line 92
    :cond_d5
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 94
    :cond_de
    return-void
.end method

.method public static reduce([I[II)V
    .registers 16
    .param p0, "z"    # [I
    .param p1, "m"    # [I
    .param p2, "mInv32"    # I

    .prologue
    .line 98
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    const/16 v7, 0x8

    if-ge v2, v7, :cond_55

    .line 100
    const/4 v7, 0x0

    aget v6, p0, v7

    .line 102
    .local v6, "z_0":I
    mul-int v7, v6, p2

    int-to-long v7, v7

    const-wide v9, 0xffffffffL

    and-long v4, v7, v9

    .line 104
    .local v4, "t":J
    const/4 v7, 0x0

    aget v7, p1, v7

    int-to-long v7, v7

    const-wide v9, 0xffffffffL

    and-long/2addr v7, v9

    mul-long/2addr v7, v4

    int-to-long v9, v6

    const-wide v11, 0xffffffffL

    and-long/2addr v9, v11

    add-long v0, v7, v9

    .line 106
    .local v0, "carry":J
    const/16 v7, 0x20

    ushr-long/2addr v0, v7

    .line 108
    const/4 v3, 0x1

    .local v3, "j":I
    :goto_2a
    const/16 v7, 0x8

    if-ge v3, v7, :cond_4e

    .line 110
    aget v7, p1, v3

    int-to-long v7, v7

    const-wide v9, 0xffffffffL

    and-long/2addr v7, v9

    mul-long/2addr v7, v4

    aget v9, p0, v3

    int-to-long v9, v9

    const-wide v11, 0xffffffffL

    and-long/2addr v9, v11

    add-long/2addr v7, v9

    add-long/2addr v0, v7

    .line 111
    add-int/lit8 v7, v3, -0x1

    long-to-int v8, v0

    aput v8, p0, v7

    .line 112
    const/16 v7, 0x20

    ushr-long/2addr v0, v7

    .line 108
    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    .line 115
    :cond_4e
    const/4 v7, 0x7

    long-to-int v8, v0

    aput v8, p0, v7

    .line 98
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 119
    .end local v0    # "carry":J
    .end local v3    # "j":I
    .end local v4    # "t":J
    .end local v6    # "z_0":I
    :cond_55
    invoke-static {p0, p1}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    move-result v7

    if-eqz v7, :cond_5e

    .line 121
    invoke-static {p0, p1, p0}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 123
    :cond_5e
    return-void
.end method

.method public static reduceXF([I[I)V
    .registers 16
    .param p0, "z"    # [I
    .param p1, "m"    # [I

    .prologue
    const/16 v13, 0x8

    const-wide v11, 0xffffffffL

    .line 129
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, v13, :cond_31

    .line 131
    const/4 v7, 0x0

    aget v6, p0, v7

    .line 133
    .local v6, "z_0":I
    int-to-long v7, v6

    and-long v4, v7, v11

    .line 134
    .local v4, "t":J
    move-wide v0, v4

    .line 136
    .local v0, "carry":J
    const/4 v3, 0x1

    .local v3, "j":I
    :goto_12
    if-ge v3, v13, :cond_2a

    .line 138
    aget v7, p1, v3

    int-to-long v7, v7

    and-long/2addr v7, v11

    mul-long/2addr v7, v4

    aget v9, p0, v3

    int-to-long v9, v9

    and-long/2addr v9, v11

    add-long/2addr v7, v9

    add-long/2addr v0, v7

    .line 139
    add-int/lit8 v7, v3, -0x1

    long-to-int v8, v0

    aput v8, p0, v7

    .line 140
    const/16 v7, 0x20

    ushr-long/2addr v0, v7

    .line 136
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 143
    :cond_2a
    const/4 v7, 0x7

    long-to-int v8, v0

    aput v8, p0, v7

    .line 129
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 147
    .end local v0    # "carry":J
    .end local v3    # "j":I
    .end local v4    # "t":J
    .end local v6    # "z_0":I
    :cond_31
    invoke-static {p0, p1}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    move-result v7

    if-eqz v7, :cond_3a

    .line 149
    invoke-static {p0, p1, p0}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 151
    :cond_3a
    return-void
.end method
