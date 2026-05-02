.class public Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;
.super Ljava/lang/Object;
.source "RFC5649WrapEngine.java"

# interfaces
.implements Lorg/spongycastle/crypto/Wrapper;


# instance fields
.field private engine:Lorg/spongycastle/crypto/BlockCipher;

.field private extractedAIV:[B

.field private forWrapping:Z

.field private highOrderIV:[B

.field private param:Lorg/spongycastle/crypto/params/KeyParameter;

.field private preIV:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 3
    .param p1, "engine"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_16

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->highOrderIV:[B

    .line 30
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->highOrderIV:[B

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->preIV:[B

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    .line 36
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 37
    return-void

    .line 29
    nop

    :array_16
    .array-data 1
        -0x5at
        0x59t
        0x59t
        -0x5at
    .end array-data
.end method

.method private padPlaintext([B)[B
    .registers 8
    .param p1, "plaintext"    # [B

    .prologue
    const/4 v5, 0x0

    .line 77
    array-length v2, p1

    .line 78
    .local v2, "plaintextLength":I
    rem-int/lit8 v4, v2, 0x8

    rsub-int/lit8 v4, v4, 0x8

    rem-int/lit8 v0, v4, 0x8

    .line 79
    .local v0, "numOfZerosToAppend":I
    add-int v4, v2, v0

    new-array v1, v4, [B

    .line 80
    .local v1, "paddedPlaintext":[B
    invoke-static {p1, v5, v1, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 81
    if-eqz v0, :cond_16

    .line 85
    new-array v3, v0, [B

    .line 86
    .local v3, "zeros":[B
    invoke-static {v3, v5, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 88
    .end local v3    # "zeros":[B
    :cond_16
    return-object v1
.end method

.method private rfc3394UnwrapNoIvCheck([BII)[B
    .registers 17
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I

    .prologue
    .line 258
    const/16 v10, 0x8

    new-array v4, v10, [B

    .line 259
    .local v4, "iv":[B
    array-length v10, v4

    sub-int v10, p3, v10

    new-array v1, v10, [B

    .line 260
    .local v1, "block":[B
    array-length v10, v4

    new-array v0, v10, [B

    .line 261
    .local v0, "a":[B
    array-length v10, v4

    add-int/lit8 v10, v10, 0x8

    new-array v2, v10, [B

    .line 263
    .local v2, "buf":[B
    const/4 v10, 0x0

    array-length v11, v4

    invoke-static {p1, p2, v0, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 264
    array-length v10, v4

    add-int/2addr v10, p2

    const/4 v11, 0x0

    array-length v12, v4

    sub-int v12, p3, v12

    invoke-static {p1, v10, v1, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 266
    iget-object v10, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    const/4 v11, 0x0

    iget-object v12, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface {v10, v11, v12}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 268
    div-int/lit8 v7, p3, 0x8

    .line 269
    .local v7, "n":I
    add-int/lit8 v7, v7, -0x1

    .line 271
    const/4 v5, 0x5

    .local v5, "j":I
    :goto_2c
    if-ltz v5, :cond_76

    .line 273
    move v3, v7

    .local v3, "i":I
    :goto_2f
    const/4 v10, 0x1

    if-lt v3, v10, :cond_73

    .line 275
    const/4 v10, 0x0

    const/4 v11, 0x0

    array-length v12, v4

    invoke-static {v0, v10, v2, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 276
    add-int/lit8 v10, v3, -0x1

    mul-int/lit8 v10, v10, 0x8

    array-length v11, v4

    const/16 v12, 0x8

    invoke-static {v1, v10, v2, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 278
    mul-int v10, v7, v5

    add-int v8, v10, v3

    .line 279
    .local v8, "t":I
    const/4 v6, 0x1

    .local v6, "k":I
    :goto_47
    if-eqz v8, :cond_57

    .line 281
    int-to-byte v9, v8

    .line 283
    .local v9, "v":B
    array-length v10, v4

    sub-int/2addr v10, v6

    aget-byte v11, v2, v10

    xor-int/2addr v11, v9

    int-to-byte v11, v11

    aput-byte v11, v2, v10

    .line 285
    ushr-int/lit8 v8, v8, 0x8

    .line 279
    add-int/lit8 v6, v6, 0x1

    goto :goto_47

    .line 288
    .end local v9    # "v":B
    :cond_57
    iget-object v10, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-interface {v10, v2, v11, v2, v12}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 289
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-static {v2, v10, v0, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 290
    const/16 v10, 0x8

    add-int/lit8 v11, v3, -0x1

    mul-int/lit8 v11, v11, 0x8

    const/16 v12, 0x8

    invoke-static {v2, v10, v1, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 273
    add-int/lit8 v3, v3, -0x1

    goto :goto_2f

    .line 271
    .end local v6    # "k":I
    .end local v8    # "t":I
    :cond_73
    add-int/lit8 v5, v5, -0x1

    goto :goto_2c

    .line 295
    .end local v3    # "i":I
    :cond_76
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    .line 297
    return-object v1
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 5
    .param p1, "forWrapping"    # Z
    .param p2, "param"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 41
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->forWrapping:Z

    .line 43
    instance-of v0, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    if-eqz v0, :cond_c

    .line 45
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .end local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object p2

    .line 48
    .restart local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_c
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    if-eqz v0, :cond_15

    .line 50
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .end local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 61
    :cond_14
    return-void

    .line 52
    .restart local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_15
    instance-of v0, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_14

    move-object v0, p2

    .line 54
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->preIV:[B

    .line 55
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/KeyParameter;

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 56
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->preIV:[B

    array-length v0, v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_14

    .line 58
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "IV length not equal to 4"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public unwrap([BII)[B
    .registers 28
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    .line 144
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->forWrapping:Z

    move/from16 v20, v0

    if-eqz v20, :cond_10

    .line 146
    new-instance v20, Ljava/lang/IllegalStateException;

    const-string v21, "not set for unwrapping"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 149
    :cond_10
    div-int/lit8 v13, p3, 0x8

    .line 151
    .local v13, "n":I
    mul-int/lit8 v20, v13, 0x8

    move/from16 v0, v20

    move/from16 v1, p3

    if-eq v0, v1, :cond_22

    .line 153
    new-instance v20, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v21, "unwrap data must be a multiple of 8 bytes"

    invoke-direct/range {v20 .. v21}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 156
    :cond_22
    const/16 v20, 0x1

    move/from16 v0, v20

    if-ne v13, v0, :cond_30

    .line 158
    new-instance v20, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v21, "unwrap data must be at least 16 bytes"

    invoke-direct/range {v20 .. v21}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 161
    :cond_30
    move/from16 v0, p3

    new-array v0, v0, [B

    move-object/from16 v17, v0

    .line 162
    .local v17, "relevantCiphertext":[B
    const/16 v20, 0x0

    move-object/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, v17

    move/from16 v3, v20

    move/from16 v4, p3

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 163
    move/from16 v0, p3

    new-array v5, v0, [B

    .line 166
    .local v5, "decrypted":[B
    const/16 v20, 0x2

    move/from16 v0, v20

    if-ne v13, v0, :cond_173

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    move-object/from16 v22, v0

    invoke-interface/range {v20 .. v22}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 171
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_61
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v8, v0, :cond_84

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-interface {v0, v1, v8, v5, v8}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 171
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v20

    add-int v8, v8, v20

    goto :goto_61

    .line 177
    :cond_84
    const/16 v20, 0x8

    move/from16 v0, v20

    new-array v0, v0, [B

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    .line 178
    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v20

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-static {v5, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 179
    array-length v0, v5

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    sub-int v20, v20, v21

    move/from16 v0, v20

    new-array v15, v0, [B

    .line 180
    .local v15, "paddedPlaintext":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    const/16 v21, 0x0

    array-length v0, v15

    move/from16 v22, v0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    invoke-static {v5, v0, v15, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 190
    .end local v8    # "i":I
    :goto_df
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v7, v0, [B

    .line 191
    .local v7, "extractedHighOrderAIV":[B
    const/16 v20, 0x4

    move/from16 v0, v20

    new-array v12, v0, [B

    .line 192
    .local v12, "mliBytes":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    array-length v0, v7

    move/from16 v23, v0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-static {v0, v1, v7, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->extractedAIV:[B

    move-object/from16 v20, v0

    array-length v0, v7

    move/from16 v21, v0

    const/16 v22, 0x0

    array-length v0, v12

    move/from16 v23, v0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 194
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-static {v12, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    move-result v11

    .line 198
    .local v11, "mli":I
    const/4 v9, 0x1

    .line 201
    .local v9, "isValid":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->preIV:[B

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-static {v7, v0}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v20

    if-nez v20, :cond_134

    .line 203
    const/4 v9, 0x0

    .line 207
    :cond_134
    array-length v0, v15

    move/from16 v18, v0

    .line 208
    .local v18, "upperBound":I
    add-int/lit8 v10, v18, -0x8

    .line 209
    .local v10, "lowerBound":I
    if-gt v11, v10, :cond_13c

    .line 211
    const/4 v9, 0x0

    .line 213
    :cond_13c
    move/from16 v0, v18

    if-le v11, v0, :cond_141

    .line 215
    const/4 v9, 0x0

    .line 219
    :cond_141
    sub-int v6, v18, v11

    .line 220
    .local v6, "expectedZeros":I
    array-length v0, v15

    move/from16 v20, v0

    move/from16 v0, v20

    if-lt v6, v0, :cond_14c

    .line 222
    const/4 v9, 0x0

    .line 223
    array-length v6, v15

    .line 226
    :cond_14c
    new-array v0, v6, [B

    move-object/from16 v19, v0

    .line 227
    .local v19, "zeros":[B
    new-array v14, v6, [B

    .line 228
    .local v14, "pad":[B
    array-length v0, v15

    move/from16 v20, v0

    sub-int v20, v20, v6

    const/16 v21, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-static {v15, v0, v14, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 229
    move-object/from16 v0, v19

    invoke-static {v14, v0}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v20

    if-nez v20, :cond_169

    .line 231
    const/4 v9, 0x0

    .line 234
    :cond_169
    if-nez v9, :cond_17a

    .line 236
    new-instance v20, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v21, "checksum failed"

    invoke-direct/range {v20 .. v21}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 185
    .end local v6    # "expectedZeros":I
    .end local v7    # "extractedHighOrderAIV":[B
    .end local v9    # "isValid":Z
    .end local v10    # "lowerBound":I
    .end local v11    # "mli":I
    .end local v12    # "mliBytes":[B
    .end local v14    # "pad":[B
    .end local v15    # "paddedPlaintext":[B
    .end local v18    # "upperBound":I
    .end local v19    # "zeros":[B
    :cond_173
    invoke-direct/range {p0 .. p3}, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->rfc3394UnwrapNoIvCheck([BII)[B

    move-result-object v5

    .line 186
    move-object v15, v5

    .restart local v15    # "paddedPlaintext":[B
    goto/16 :goto_df

    .line 240
    .restart local v6    # "expectedZeros":I
    .restart local v7    # "extractedHighOrderAIV":[B
    .restart local v9    # "isValid":Z
    .restart local v10    # "lowerBound":I
    .restart local v11    # "mli":I
    .restart local v12    # "mliBytes":[B
    .restart local v14    # "pad":[B
    .restart local v18    # "upperBound":I
    .restart local v19    # "zeros":[B
    :cond_17a
    new-array v0, v11, [B

    move-object/from16 v16, v0

    .line 241
    .local v16, "plaintext":[B
    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v20

    move-object/from16 v1, v16

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v15, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 243
    return-object v16
.end method

.method public wrap([BII)[B
    .registers 16
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I

    .prologue
    .line 93
    iget-boolean v8, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->forWrapping:Z

    if-nez v8, :cond_c

    .line 95
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "not set for wrapping"

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 97
    :cond_c
    const/16 v8, 0x8

    new-array v1, v8, [B

    .line 100
    .local v1, "iv":[B
    invoke-static {p3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I)[B

    move-result-object v2

    .line 102
    .local v2, "mli":[B
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->preIV:[B

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget-object v11, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->preIV:[B

    array-length v11, v11

    invoke-static {v8, v9, v1, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    const/4 v8, 0x0

    iget-object v9, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->preIV:[B

    array-length v9, v9

    array-length v10, v2

    invoke-static {v2, v8, v1, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    new-array v6, p3, [B

    .line 108
    .local v6, "relevantPlaintext":[B
    const/4 v8, 0x0

    invoke-static {p1, p2, v6, v8, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    invoke-direct {p0, v6}, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->padPlaintext([B)[B

    move-result-object v4

    .line 111
    .local v4, "paddedPlaintext":[B
    array-length v8, v4

    const/16 v9, 0x8

    if-ne v8, v9, :cond_5f

    .line 117
    array-length v8, v4

    array-length v9, v1

    add-int/2addr v8, v9

    new-array v3, v8, [B

    .line 118
    .local v3, "paddedPlainTextWithIV":[B
    const/4 v8, 0x0

    const/4 v9, 0x0

    array-length v10, v1

    invoke-static {v1, v8, v3, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 119
    const/4 v8, 0x0

    array-length v9, v1

    array-length v10, v4

    invoke-static {v4, v8, v3, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 121
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    const/4 v9, 0x1

    iget-object v10, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface {v8, v9, v10}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 122
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4f
    array-length v8, v3

    if-ge v0, v8, :cond_77

    .line 124
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v8, v3, v0, v3, v0}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 122
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v8}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v8

    add-int/2addr v0, v8

    goto :goto_4f

    .line 133
    .end local v0    # "i":I
    .end local v3    # "paddedPlainTextWithIV":[B
    :cond_5f
    new-instance v7, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;

    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v7, v8}, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 134
    .local v7, "wrapper":Lorg/spongycastle/crypto/Wrapper;
    new-instance v5, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iget-object v8, p0, Lorg/spongycastle/crypto/engines/RFC5649WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v5, v8, v1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 135
    .local v5, "paramsWithIV":Lorg/spongycastle/crypto/params/ParametersWithIV;
    const/4 v8, 0x1

    invoke-interface {v7, v8, v5}, Lorg/spongycastle/crypto/Wrapper;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 136
    const/4 v8, 0x0

    array-length v9, v4

    invoke-interface {v7, v4, v8, v9}, Lorg/spongycastle/crypto/Wrapper;->wrap([BII)[B

    move-result-object v3

    .end local v5    # "paramsWithIV":Lorg/spongycastle/crypto/params/ParametersWithIV;
    .end local v7    # "wrapper":Lorg/spongycastle/crypto/Wrapper;
    :cond_77
    return-object v3
.end method
