.class public Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;
.super Ljava/lang/Object;
.source "RainbowUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertArray([S)[B
    .registers 4
    .param p0, "in"    # [S

    .prologue
    .line 116
    array-length v2, p0

    new-array v1, v2, [B

    .line 117
    .local v1, "out":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_f

    .line 119
    aget-short v2, p0, v0

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 121
    :cond_f
    return-object v1
.end method

.method public static convertArray([B)[S
    .registers 4
    .param p0, "in"    # [B

    .prologue
    .line 38
    array-length v2, p0

    new-array v1, v2, [S

    .line 39
    .local v1, "out":[S
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_11

    .line 41
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    int-to-short v2, v2

    aput-short v2, v1, v0

    .line 39
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 43
    :cond_11
    return-object v1
.end method

.method public static convertArray([[S)[[B
    .registers 7
    .param p0, "in"    # [[S

    .prologue
    const/4 v5, 0x0

    .line 133
    array-length v3, p0

    aget-object v4, p0, v5

    array-length v4, v4

    filled-new-array {v3, v4}, [I

    move-result-object v3

    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[B

    .line 134
    .local v2, "out":[[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v3, p0

    if-ge v0, v3, :cond_2a

    .line 136
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_16
    aget-object v3, p0, v5

    array-length v3, v3

    if-ge v1, v3, :cond_27

    .line 138
    aget-object v3, v2, v0

    aget-object v4, p0, v0

    aget-short v4, v4, v1

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    .line 136
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 134
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 141
    .end local v1    # "j":I
    :cond_2a
    return-object v2
.end method

.method public static convertArray([[B)[[S
    .registers 7
    .param p0, "in"    # [[B

    .prologue
    const/4 v5, 0x0

    .line 55
    array-length v3, p0

    aget-object v4, p0, v5

    array-length v4, v4

    filled-new-array {v3, v4}, [I

    move-result-object v3

    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[S

    .line 56
    .local v2, "out":[[S
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v3, p0

    if-ge v0, v3, :cond_2c

    .line 58
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_16
    aget-object v3, p0, v5

    array-length v3, v3

    if-ge v1, v3, :cond_29

    .line 60
    aget-object v3, v2, v0

    aget-object v4, p0, v0

    aget-byte v4, v4, v1

    and-int/lit16 v4, v4, 0xff

    int-to-short v4, v4

    aput-short v4, v3, v1

    .line 58
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 56
    :cond_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 63
    .end local v1    # "j":I
    :cond_2c
    return-object v2
.end method

.method public static convertArray([[[S)[[[B
    .registers 9
    .param p0, "in"    # [[[S

    .prologue
    const/4 v7, 0x0

    .line 153
    array-length v4, p0

    aget-object v5, p0, v7

    array-length v5, v5

    aget-object v6, p0, v7

    aget-object v6, v6, v7

    array-length v6, v6

    filled-new-array {v4, v5, v6}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[[B

    .line 154
    .local v3, "out":[[[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v4, p0

    if-ge v0, v4, :cond_3e

    .line 156
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1b
    aget-object v4, p0, v7

    array-length v4, v4

    if-ge v1, v4, :cond_3b

    .line 158
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_21
    aget-object v4, p0, v7

    aget-object v4, v4, v7

    array-length v4, v4

    if-ge v2, v4, :cond_38

    .line 160
    aget-object v4, v3, v0

    aget-object v4, v4, v1

    aget-object v5, p0, v0

    aget-object v5, v5, v1

    aget-short v5, v5, v2

    int-to-byte v5, v5

    aput-byte v5, v4, v2

    .line 158
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 156
    :cond_38
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 154
    .end local v2    # "k":I
    :cond_3b
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 164
    .end local v1    # "j":I
    :cond_3e
    return-object v3
.end method

.method public static convertArray([[[B)[[[S
    .registers 9
    .param p0, "in"    # [[[B

    .prologue
    const/4 v7, 0x0

    .line 75
    array-length v4, p0

    aget-object v5, p0, v7

    array-length v5, v5

    aget-object v6, p0, v7

    aget-object v6, v6, v7

    array-length v6, v6

    filled-new-array {v4, v5, v6}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[[S

    .line 76
    .local v3, "out":[[[S
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v4, p0

    if-ge v0, v4, :cond_40

    .line 78
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1b
    aget-object v4, p0, v7

    array-length v4, v4

    if-ge v1, v4, :cond_3d

    .line 80
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_21
    aget-object v4, p0, v7

    aget-object v4, v4, v7

    array-length v4, v4

    if-ge v2, v4, :cond_3a

    .line 82
    aget-object v4, v3, v0

    aget-object v4, v4, v1

    aget-object v5, p0, v0

    aget-object v5, v5, v1

    aget-byte v5, v5, v2

    and-int/lit16 v5, v5, 0xff

    int-to-short v5, v5

    aput-short v5, v4, v2

    .line 80
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 78
    :cond_3a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 76
    .end local v2    # "k":I
    :cond_3d
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 86
    .end local v1    # "j":I
    :cond_40
    return-object v3
.end method

.method public static convertArraytoInt([B)[I
    .registers 4
    .param p0, "in"    # [B

    .prologue
    .line 20
    array-length v2, p0

    new-array v1, v2, [I

    .line 21
    .local v1, "out":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_10

    .line 23
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    aput v2, v1, v0

    .line 21
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 25
    :cond_10
    return-object v1
.end method

.method public static convertIntArray([I)[B
    .registers 4
    .param p0, "in"    # [I

    .prologue
    .line 98
    array-length v2, p0

    new-array v1, v2, [B

    .line 99
    .local v1, "out":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_f

    .line 101
    aget v2, p0, v0

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 99
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 103
    :cond_f
    return-object v1
.end method

.method public static equals([S[S)Z
    .registers 7
    .param p0, "left"    # [S
    .param p1, "right"    # [S

    .prologue
    const/4 v3, 0x0

    .line 176
    array-length v2, p0

    array-length v4, p1

    if-eq v2, v4, :cond_6

    .line 185
    :goto_5
    return v3

    .line 180
    :cond_6
    const/4 v1, 0x1

    .line 181
    .local v1, "result":Z
    array-length v2, p0

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_a
    if-ltz v0, :cond_19

    .line 183
    aget-short v2, p0, v0

    aget-short v4, p1, v0

    if-ne v2, v4, :cond_17

    const/4 v2, 0x1

    :goto_13
    and-int/2addr v1, v2

    .line 181
    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    :cond_17
    move v2, v3

    .line 183
    goto :goto_13

    :cond_19
    move v3, v1

    .line 185
    goto :goto_5
.end method

.method public static equals([[S[[S)Z
    .registers 6
    .param p0, "left"    # [[S
    .param p1, "right"    # [[S

    .prologue
    .line 197
    array-length v2, p0

    array-length v3, p1

    if-eq v2, v3, :cond_6

    .line 199
    const/4 v1, 0x0

    .line 206
    :cond_5
    return v1

    .line 201
    :cond_6
    const/4 v1, 0x1

    .line 202
    .local v1, "result":Z
    array-length v2, p0

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_a
    if-ltz v0, :cond_5

    .line 204
    aget-object v2, p0, v0

    aget-object v3, p1, v0

    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([S[S)Z

    move-result v2

    and-int/2addr v1, v2

    .line 202
    add-int/lit8 v0, v0, -0x1

    goto :goto_a
.end method

.method public static equals([[[S[[[S)Z
    .registers 6
    .param p0, "left"    # [[[S
    .param p1, "right"    # [[[S

    .prologue
    .line 218
    array-length v2, p0

    array-length v3, p1

    if-eq v2, v3, :cond_6

    .line 220
    const/4 v1, 0x0

    .line 227
    :cond_5
    return v1

    .line 222
    :cond_6
    const/4 v1, 0x1

    .line 223
    .local v1, "result":Z
    array-length v2, p0

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_a
    if-ltz v0, :cond_5

    .line 225
    aget-object v2, p0, v0

    aget-object v3, p1, v0

    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([[S[[S)Z

    move-result v2

    and-int/2addr v1, v2

    .line 223
    add-int/lit8 v0, v0, -0x1

    goto :goto_a
.end method
