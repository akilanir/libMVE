.class public Lorg/spongycastle/crypto/engines/IESEngine;
.super Ljava/lang/Object;
.source "IESEngine.java"


# instance fields
.field private IV:[B

.field V:[B

.field agree:Lorg/spongycastle/crypto/BasicAgreement;

.field cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

.field forEncryption:Z

.field kdf:Lorg/spongycastle/crypto/DerivationFunction;

.field private keyPairGenerator:Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;

.field private keyParser:Lorg/spongycastle/crypto/KeyParser;

.field mac:Lorg/spongycastle/crypto/Mac;

.field macBuf:[B

.field param:Lorg/spongycastle/crypto/params/IESParameters;

.field privParam:Lorg/spongycastle/crypto/CipherParameters;

.field pubParam:Lorg/spongycastle/crypto/CipherParameters;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BasicAgreement;Lorg/spongycastle/crypto/DerivationFunction;Lorg/spongycastle/crypto/Mac;)V
    .registers 5
    .param p1, "agree"    # Lorg/spongycastle/crypto/BasicAgreement;
    .param p2, "kdf"    # Lorg/spongycastle/crypto/DerivationFunction;
    .param p3, "mac"    # Lorg/spongycastle/crypto/Mac;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/IESEngine;->agree:Lorg/spongycastle/crypto/BasicAgreement;

    .line 62
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/IESEngine;->kdf:Lorg/spongycastle/crypto/DerivationFunction;

    .line 63
    iput-object p3, p0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    .line 64
    invoke-interface {p3}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->macBuf:[B

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 66
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BasicAgreement;Lorg/spongycastle/crypto/DerivationFunction;Lorg/spongycastle/crypto/Mac;Lorg/spongycastle/crypto/BufferedBlockCipher;)V
    .registers 6
    .param p1, "agree"    # Lorg/spongycastle/crypto/BasicAgreement;
    .param p2, "kdf"    # Lorg/spongycastle/crypto/DerivationFunction;
    .param p3, "mac"    # Lorg/spongycastle/crypto/Mac;
    .param p4, "cipher"    # Lorg/spongycastle/crypto/BufferedBlockCipher;

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/IESEngine;->agree:Lorg/spongycastle/crypto/BasicAgreement;

    .line 85
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/IESEngine;->kdf:Lorg/spongycastle/crypto/DerivationFunction;

    .line 86
    iput-object p3, p0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    .line 87
    invoke-interface {p3}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->macBuf:[B

    .line 88
    iput-object p4, p0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 89
    return-void
.end method

.method private decryptBlock([BII)[B
    .registers 21
    .param p1, "in_enc"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    .line 272
    const/4 v5, 0x0

    .local v5, "M":[B
    const/4 v7, 0x0

    .local v7, "K":[B
    const/4 v8, 0x0

    .local v8, "K1":[B
    const/4 v9, 0x0

    .line 276
    .local v9, "K2":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v2}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v2

    add-int/2addr v1, v2

    move/from16 v0, p3

    if-ge v0, v1, :cond_1e

    .line 278
    new-instance v1, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v2, "Length of input must be greater than the MAC and V combined"

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 281
    :cond_1e
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    if-nez v1, :cond_10e

    .line 284
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    sub-int v1, p3, v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v2}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v2

    sub-int/2addr v1, v2

    new-array v8, v1, [B

    .line 285
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESParameters;->getMacKeySize()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    new-array v9, v1, [B

    .line 286
    array-length v1, v8

    array-length v2, v9

    add-int/2addr v1, v2

    new-array v7, v1, [B

    .line 288
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->kdf:Lorg/spongycastle/crypto/DerivationFunction;

    const/4 v2, 0x0

    array-length v3, v7

    invoke-interface {v1, v7, v2, v3}, Lorg/spongycastle/crypto/DerivationFunction;->generateBytes([BII)I

    .line 290
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    if-eqz v1, :cond_7d

    .line 292
    const/4 v1, 0x0

    const/4 v2, 0x0

    array-length v3, v9

    invoke-static {v7, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 293
    array-length v1, v9

    const/4 v2, 0x0

    array-length v3, v8

    invoke-static {v7, v1, v8, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 301
    :goto_63
    array-length v1, v8

    new-array v5, v1, [B

    .line 303
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_67
    array-length v1, v8

    if-eq v15, v1, :cond_8a

    .line 305
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    add-int v1, v1, p2

    add-int/2addr v1, v15

    aget-byte v1, p1, v1

    aget-byte v2, v8, v15

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v5, v15

    .line 303
    add-int/lit8 v15, v15, 0x1

    goto :goto_67

    .line 297
    .end local v15    # "i":I
    :cond_7d
    const/4 v1, 0x0

    const/4 v2, 0x0

    array-length v3, v8

    invoke-static {v7, v1, v8, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 298
    array-length v1, v8

    const/4 v2, 0x0

    array-length v3, v9

    invoke-static {v7, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_63

    .line 308
    .restart local v15    # "i":I
    :cond_8a
    array-length v0, v8

    move/from16 v16, v0

    .line 338
    .end local v15    # "i":I
    .local v16, "len":I
    :goto_8d
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESParameters;->getEncodingV()[B

    move-result-object v11

    .line 339
    .local v11, "P2":[B
    const/4 v10, 0x0

    .line 340
    .local v10, "L2":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    if-eqz v1, :cond_a3

    .line 342
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/spongycastle/crypto/engines/IESEngine;->getLengthTag([B)[B

    move-result-object v10

    .line 346
    :cond_a3
    add-int v14, p2, p3

    .line 347
    .local v14, "end":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v1}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v1

    sub-int v1, v14, v1

    move-object/from16 v0, p1

    invoke-static {v0, v1, v14}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v12

    .line 349
    .local v12, "T1":[B
    array-length v1, v12

    new-array v13, v1, [B

    .line 350
    .local v13, "T2":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v2, v9}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    invoke-interface {v1, v2}, Lorg/spongycastle/crypto/Mac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 351
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v2, v2

    add-int v2, v2, p2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v3, v3

    sub-int v3, p3, v3

    array-length v4, v13

    sub-int/2addr v3, v4

    move-object/from16 v0, p1

    invoke-interface {v1, v0, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 353
    if-eqz v11, :cond_e8

    .line 355
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    array-length v3, v11

    invoke-interface {v1, v11, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 357
    :cond_e8
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    if-eqz v1, :cond_f8

    .line 359
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    array-length v3, v10

    invoke-interface {v1, v10, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 361
    :cond_f8
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    invoke-interface {v1, v13, v2}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 363
    invoke-static {v12, v13}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v1

    if-nez v1, :cond_1b7

    .line 365
    new-instance v1, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v2, "Invalid MAC."

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 313
    .end local v10    # "L2":[B
    .end local v11    # "P2":[B
    .end local v12    # "T1":[B
    .end local v13    # "T2":[B
    .end local v14    # "end":I
    .end local v16    # "len":I
    :cond_10e
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    check-cast v1, Lorg/spongycastle/crypto/params/IESWithCipherParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESWithCipherParameters;->getCipherKeySize()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    new-array v8, v1, [B

    .line 314
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESParameters;->getMacKeySize()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    new-array v9, v1, [B

    .line 315
    array-length v1, v8

    array-length v2, v9

    add-int/2addr v1, v2

    new-array v7, v1, [B

    .line 317
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->kdf:Lorg/spongycastle/crypto/DerivationFunction;

    const/4 v2, 0x0

    array-length v3, v7

    invoke-interface {v1, v7, v2, v3}, Lorg/spongycastle/crypto/DerivationFunction;->generateBytes([BII)I

    .line 318
    const/4 v1, 0x0

    const/4 v2, 0x0

    array-length v3, v8

    invoke-static {v7, v1, v8, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 319
    array-length v1, v8

    const/4 v2, 0x0

    array-length v3, v9

    invoke-static {v7, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 322
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->IV:[B

    if-eqz v1, :cond_1a9

    .line 324
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v2, 0x0

    new-instance v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    new-instance v4, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v4, v8}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/crypto/engines/IESEngine;->IV:[B

    invoke-direct {v3, v4, v6}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    invoke-virtual {v1, v2, v3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 331
    :goto_15e
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v2, v2

    sub-int v2, p3, v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v3}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v1

    new-array v5, v1, [B

    .line 332
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v2, v2

    add-int v3, p2, v2

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v2, v2

    sub-int v2, p3, v2

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v4}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v4

    sub-int v4, v2, v4

    const/4 v6, 0x0

    move-object/from16 v2, p1

    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    move-result v16

    .line 333
    .restart local v16    # "len":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    move/from16 v0, v16

    invoke-virtual {v1, v5, v0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->doFinal([BI)I

    move-result v1

    add-int v16, v16, v1

    goto/16 :goto_8d

    .line 328
    .end local v16    # "len":I
    :cond_1a9
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v2, 0x0

    new-instance v3, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v3, v8}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    invoke-virtual {v1, v2, v3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_15e

    .line 369
    .restart local v10    # "L2":[B
    .restart local v11    # "P2":[B
    .restart local v12    # "T1":[B
    .restart local v13    # "T2":[B
    .restart local v14    # "end":I
    .restart local v16    # "len":I
    :cond_1b7
    const/4 v1, 0x0

    move/from16 v0, v16

    invoke-static {v5, v1, v0}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    return-object v1
.end method

.method private encryptBlock([BII)[B
    .registers 20
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    .line 175
    const/4 v5, 0x0

    .local v5, "C":[B
    const/4 v7, 0x0

    .local v7, "K":[B
    const/4 v8, 0x0

    .local v8, "K1":[B
    const/4 v9, 0x0

    .line 178
    .local v9, "K2":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    if-nez v1, :cond_e6

    .line 181
    move/from16 v0, p3

    new-array v8, v0, [B

    .line 182
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESParameters;->getMacKeySize()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    new-array v9, v1, [B

    .line 183
    array-length v1, v8

    array-length v2, v9

    add-int/2addr v1, v2

    new-array v7, v1, [B

    .line 185
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->kdf:Lorg/spongycastle/crypto/DerivationFunction;

    const/4 v2, 0x0

    array-length v3, v7

    invoke-interface {v1, v7, v2, v3}, Lorg/spongycastle/crypto/DerivationFunction;->generateBytes([BII)I

    .line 187
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    if-eqz v1, :cond_51

    .line 189
    const/4 v1, 0x0

    const/4 v2, 0x0

    array-length v3, v9

    invoke-static {v7, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 190
    array-length v1, v9

    const/4 v2, 0x0

    array-length v3, v8

    invoke-static {v7, v1, v8, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    :goto_3b
    move/from16 v0, p3

    new-array v5, v0, [B

    .line 200
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_40
    move/from16 v0, p3

    if-eq v14, v0, :cond_5f

    .line 202
    add-int v1, p2, v14

    aget-byte v1, p1, v1

    aget-byte v2, v8, v14

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v5, v14

    .line 200
    add-int/lit8 v14, v14, 0x1

    goto :goto_40

    .line 194
    .end local v14    # "i":I
    :cond_51
    const/4 v1, 0x0

    const/4 v2, 0x0

    array-length v3, v8

    invoke-static {v7, v1, v8, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    const/4 v1, 0x0

    array-length v2, v9

    move/from16 v0, p3

    invoke-static {v7, v0, v9, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_3b

    .line 204
    .restart local v14    # "i":I
    :cond_5f
    move/from16 v15, p3

    .line 234
    .end local v14    # "i":I
    .local v15, "len":I
    :goto_61
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESParameters;->getEncodingV()[B

    move-result-object v12

    .line 235
    .local v12, "P2":[B
    const/4 v10, 0x0

    .line 236
    .local v10, "L2":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    if-eqz v1, :cond_77

    .line 238
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/spongycastle/crypto/engines/IESEngine;->getLengthTag([B)[B

    move-result-object v10

    .line 243
    :cond_77
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    invoke-interface {v1}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v1

    new-array v13, v1, [B

    .line 245
    .local v13, "T":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v2, v9}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    invoke-interface {v1, v2}, Lorg/spongycastle/crypto/Mac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 246
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    array-length v3, v5

    invoke-interface {v1, v5, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 247
    if-eqz v12, :cond_a1

    .line 249
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    array-length v3, v12

    invoke-interface {v1, v12, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 251
    :cond_a1
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    if-eqz v1, :cond_b1

    .line 253
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    array-length v3, v10

    invoke-interface {v1, v10, v2, v3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 255
    :cond_b1
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    const/4 v2, 0x0

    invoke-interface {v1, v13, v2}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 259
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v1, v1

    add-int/2addr v1, v15

    array-length v2, v13

    add-int/2addr v1, v2

    new-array v11, v1, [B

    .line 260
    .local v11, "Output":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v4, v4

    invoke-static {v1, v2, v11, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 261
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v2, v2

    invoke-static {v5, v1, v11, v2, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 262
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v2, v2

    add-int/2addr v2, v15

    array-length v3, v13

    invoke-static {v13, v1, v11, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 263
    return-object v11

    .line 209
    .end local v10    # "L2":[B
    .end local v11    # "Output":[B
    .end local v12    # "P2":[B
    .end local v13    # "T":[B
    .end local v15    # "len":I
    :cond_e6
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    check-cast v1, Lorg/spongycastle/crypto/params/IESWithCipherParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESWithCipherParameters;->getCipherKeySize()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    new-array v8, v1, [B

    .line 210
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/IESParameters;->getMacKeySize()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    new-array v9, v1, [B

    .line 211
    array-length v1, v8

    array-length v2, v9

    add-int/2addr v1, v2

    new-array v7, v1, [B

    .line 213
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->kdf:Lorg/spongycastle/crypto/DerivationFunction;

    const/4 v2, 0x0

    array-length v3, v7

    invoke-interface {v1, v7, v2, v3}, Lorg/spongycastle/crypto/DerivationFunction;->generateBytes([BII)I

    .line 214
    const/4 v1, 0x0

    const/4 v2, 0x0

    array-length v3, v8

    invoke-static {v7, v1, v8, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 215
    array-length v1, v8

    const/4 v2, 0x0

    array-length v3, v9

    invoke-static {v7, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 218
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->IV:[B

    if-eqz v1, :cond_15c

    .line 220
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v2, 0x1

    new-instance v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    new-instance v4, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v4, v8}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/crypto/engines/IESEngine;->IV:[B

    invoke-direct {v3, v4, v6}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    invoke-virtual {v1, v2, v3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 227
    :goto_136
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    move/from16 v0, p3

    invoke-virtual {v1, v0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v1

    new-array v5, v1, [B

    .line 228
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v6, 0x0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    move-result v15

    .line 229
    .restart local v15    # "len":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v1, v5, v15}, Lorg/spongycastle/crypto/BufferedBlockCipher;->doFinal([BI)I

    move-result v1

    add-int/2addr v15, v1

    goto/16 :goto_61

    .line 224
    .end local v15    # "len":I
    :cond_15c
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v2, 0x1

    new-instance v3, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v3, v8}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    invoke-virtual {v1, v2, v3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_136
.end method

.method private extractParams(Lorg/spongycastle/crypto/CipherParameters;)V
    .registers 3
    .param p1, "params"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 147
    instance-of v0, p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_18

    move-object v0, p1

    .line 149
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->IV:[B

    .line 150
    check-cast p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/params/IESParameters;

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    .line 157
    :goto_17
    return-void

    .line 154
    .restart local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    :cond_18
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->IV:[B

    .line 155
    check-cast p1, Lorg/spongycastle/crypto/params/IESParameters;

    .end local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    goto :goto_17
.end method


# virtual methods
.method public getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    return-object v0
.end method

.method protected getLengthTag([B)[B
    .registers 7
    .param p1, "p2"    # [B

    .prologue
    .line 441
    const/16 v1, 0x8

    new-array v0, v1, [B

    .line 442
    .local v0, "L2":[B
    if-eqz p1, :cond_f

    .line 444
    array-length v1, p1

    int-to-long v1, v1

    const-wide/16 v3, 0x8

    mul-long/2addr v1, v3

    const/4 v3, 0x0

    invoke-static {v1, v2, v0, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 446
    :cond_f
    return-object v0
.end method

.method public getMac()Lorg/spongycastle/crypto/Mac;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->mac:Lorg/spongycastle/crypto/Mac;

    return-object v0
.end method

.method public init(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/KeyParser;)V
    .registers 5
    .param p1, "privateKey"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .param p3, "publicKeyParser"    # Lorg/spongycastle/crypto/KeyParser;

    .prologue
    .line 138
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->forEncryption:Z

    .line 139
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/IESEngine;->privParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 140
    iput-object p3, p0, Lorg/spongycastle/crypto/engines/IESEngine;->keyParser:Lorg/spongycastle/crypto/KeyParser;

    .line 142
    invoke-direct {p0, p2}, Lorg/spongycastle/crypto/engines/IESEngine;->extractParams(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 143
    return-void
.end method

.method public init(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;)V
    .registers 5
    .param p1, "publicKey"    # Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .param p3, "ephemeralKeyPairGenerator"    # Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;

    .prologue
    .line 122
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->forEncryption:Z

    .line 123
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/IESEngine;->pubParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 124
    iput-object p3, p0, Lorg/spongycastle/crypto/engines/IESEngine;->keyPairGenerator:Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;

    .line 126
    invoke-direct {p0, p2}, Lorg/spongycastle/crypto/engines/IESEngine;->extractParams(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 127
    return-void
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V
    .registers 6
    .param p1, "forEncryption"    # Z
    .param p2, "privParam"    # Lorg/spongycastle/crypto/CipherParameters;
    .param p3, "pubParam"    # Lorg/spongycastle/crypto/CipherParameters;
    .param p4, "params"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 105
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/IESEngine;->forEncryption:Z

    .line 106
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/IESEngine;->privParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 107
    iput-object p3, p0, Lorg/spongycastle/crypto/engines/IESEngine;->pubParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 108
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    .line 110
    invoke-direct {p0, p4}, Lorg/spongycastle/crypto/engines/IESEngine;->extractParams(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 111
    return-void
.end method

.method public processBlock([BII)[B
    .registers 15
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "inLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 379
    iget-boolean v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->forEncryption:Z

    if-eqz v8, :cond_63

    .line 381
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->keyPairGenerator:Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;

    if-eqz v8, :cond_1f

    .line 383
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->keyPairGenerator:Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;->generate()Lorg/spongycastle/crypto/EphemeralKeyPair;

    move-result-object v5

    .line 385
    .local v5, "ephKeyPair":Lorg/spongycastle/crypto/EphemeralKeyPair;
    invoke-virtual {v5}, Lorg/spongycastle/crypto/EphemeralKeyPair;->getKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    move-result-object v8

    invoke-virtual {v8}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->getPrivate()Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v8

    iput-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->privParam:Lorg/spongycastle/crypto/CipherParameters;

    .line 386
    invoke-virtual {v5}, Lorg/spongycastle/crypto/EphemeralKeyPair;->getEncodedPublicKey()[B

    move-result-object v8

    iput-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    .line 410
    .end local v5    # "ephKeyPair":Lorg/spongycastle/crypto/EphemeralKeyPair;
    :cond_1f
    :goto_1f
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->agree:Lorg/spongycastle/crypto/BasicAgreement;

    iget-object v9, p0, Lorg/spongycastle/crypto/engines/IESEngine;->privParam:Lorg/spongycastle/crypto/CipherParameters;

    invoke-interface {v8, v9}, Lorg/spongycastle/crypto/BasicAgreement;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 411
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->agree:Lorg/spongycastle/crypto/BasicAgreement;

    iget-object v9, p0, Lorg/spongycastle/crypto/engines/IESEngine;->pubParam:Lorg/spongycastle/crypto/CipherParameters;

    invoke-interface {v8, v9}, Lorg/spongycastle/crypto/BasicAgreement;->calculateAgreement(Lorg/spongycastle/crypto/CipherParameters;)Ljava/math/BigInteger;

    move-result-object v7

    .line 412
    .local v7, "z":Ljava/math/BigInteger;
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->agree:Lorg/spongycastle/crypto/BasicAgreement;

    invoke-interface {v8}, Lorg/spongycastle/crypto/BasicAgreement;->getFieldSize()I

    move-result v8

    invoke-static {v8, v7}, Lorg/spongycastle/util/BigIntegers;->asUnsignedByteArray(ILjava/math/BigInteger;)[B

    move-result-object v1

    .line 415
    .local v1, "Z":[B
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    array-length v8, v8

    if-eqz v8, :cond_47

    .line 417
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    invoke-static {v8, v1}, Lorg/spongycastle/util/Arrays;->concatenate([B[B)[B

    move-result-object v0

    .line 418
    .local v0, "VZ":[B
    invoke-static {v1, v10}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 419
    move-object v1, v0

    .line 425
    .end local v0    # "VZ":[B
    :cond_47
    :try_start_47
    new-instance v6, Lorg/spongycastle/crypto/params/KDFParameters;

    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->param:Lorg/spongycastle/crypto/params/IESParameters;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/params/IESParameters;->getDerivationV()[B

    move-result-object v8

    invoke-direct {v6, v1, v8}, Lorg/spongycastle/crypto/params/KDFParameters;-><init>([B[B)V

    .line 426
    .local v6, "kdfParam":Lorg/spongycastle/crypto/params/KDFParameters;
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->kdf:Lorg/spongycastle/crypto/DerivationFunction;

    invoke-interface {v8, v6}, Lorg/spongycastle/crypto/DerivationFunction;->init(Lorg/spongycastle/crypto/DerivationParameters;)V

    .line 428
    iget-boolean v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->forEncryption:Z

    if-eqz v8, :cond_a1

    .line 429
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/engines/IESEngine;->encryptBlock([BII)[B
    :try_end_5e
    .catchall {:try_start_47 .. :try_end_5e} :catchall_a6

    move-result-object v8

    .line 434
    :goto_5f
    invoke-static {v1, v10}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    return-object v8

    .line 391
    .end local v1    # "Z":[B
    .end local v6    # "kdfParam":Lorg/spongycastle/crypto/params/KDFParameters;
    .end local v7    # "z":Ljava/math/BigInteger;
    :cond_63
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->keyParser:Lorg/spongycastle/crypto/KeyParser;

    if-eqz v8, :cond_1f

    .line 393
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p1, p2, p3}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 397
    .local v2, "bIn":Ljava/io/ByteArrayInputStream;
    :try_start_6c
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->keyParser:Lorg/spongycastle/crypto/KeyParser;

    invoke-interface {v8, v2}, Lorg/spongycastle/crypto/KeyParser;->readKey(Ljava/io/InputStream;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v8

    iput-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->pubParam:Lorg/spongycastle/crypto/CipherParameters;
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_74} :catch_83

    .line 404
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v8

    sub-int v4, p3, v8

    .line 405
    .local v4, "encLength":I
    add-int v8, p2, v4

    invoke-static {p1, p2, v8}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v8

    iput-object v8, p0, Lorg/spongycastle/crypto/engines/IESEngine;->V:[B

    goto :goto_1f

    .line 399
    .end local v4    # "encLength":I
    :catch_83
    move-exception v3

    .line 401
    .local v3, "e":Ljava/io/IOException;
    new-instance v8, Lorg/spongycastle/crypto/InvalidCipherTextException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "unable to recover ephemeral public key: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 430
    .end local v2    # "bIn":Ljava/io/ByteArrayInputStream;
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v1    # "Z":[B
    .restart local v6    # "kdfParam":Lorg/spongycastle/crypto/params/KDFParameters;
    .restart local v7    # "z":Ljava/math/BigInteger;
    :cond_a1
    :try_start_a1
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/engines/IESEngine;->decryptBlock([BII)[B
    :try_end_a4
    .catchall {:try_start_a1 .. :try_end_a4} :catchall_a6

    move-result-object v8

    goto :goto_5f

    .line 434
    .end local v6    # "kdfParam":Lorg/spongycastle/crypto/params/KDFParameters;
    :catchall_a6
    move-exception v8

    invoke-static {v1, v10}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    throw v8
.end method
