.class public Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;
.super Ljava/lang/Object;
.source "BrokenJCEBlockCipher.java"

# interfaces
.implements Lorg/spongycastle/jce/provider/BrokenPBE;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher$OldPBEWithSHAAndTwofish;,
        Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher$BrokePBEWithSHAAndDES2Key;,
        Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher$OldPBEWithSHAAndDES3Key;,
        Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher$BrokePBEWithSHAAndDES3Key;,
        Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher$BrokePBEWithSHA1AndDES;,
        Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher$BrokePBEWithMD5AndDES;
    }
.end annotation


# instance fields
.field private availableSpecs:[Ljava/lang/Class;

.field private cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

.field private engineParams:Ljava/security/AlgorithmParameters;

.field private ivLength:I

.field private ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

.field private pbeHash:I

.field private pbeIvSize:I

.field private pbeKeySize:I

.field private pbeType:I


# direct methods
.method protected constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 8
    .param p1, "engine"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v1, v0, v3

    const-class v1, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 63
    iput v5, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeType:I

    .line 64
    iput v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeHash:I

    .line 68
    iput v3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 75
    new-instance v0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 76
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/BlockCipher;IIII)V
    .registers 12
    .param p1, "engine"    # Lorg/spongycastle/crypto/BlockCipher;
    .param p2, "pbeType"    # I
    .param p3, "pbeHash"    # I
    .param p4, "pbeKeySize"    # I
    .param p5, "pbeIvSize"    # I

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v1, v0, v3

    const-class v1, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 63
    iput v5, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeType:I

    .line 64
    iput v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeHash:I

    .line 68
    iput v3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 85
    new-instance v0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 87
    iput p2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeType:I

    .line 88
    iput p3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeHash:I

    .line 89
    iput p4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeKeySize:I

    .line 90
    iput p5, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeIvSize:I

    .line 91
    return-void
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .registers 14
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 449
    const/4 v7, 0x0

    .line 451
    .local v7, "len":I
    if-eqz p3, :cond_e

    .line 453
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    move-result v7

    .line 458
    :cond_e
    :try_start_e
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    add-int v1, p5, v7

    invoke-virtual {v0, p4, v1}, Lorg/spongycastle/crypto/BufferedBlockCipher;->doFinal([BI)I
    :try_end_15
    .catch Lorg/spongycastle/crypto/DataLengthException; {:try_start_e .. :try_end_15} :catch_18
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_e .. :try_end_15} :catch_23

    move-result v0

    add-int/2addr v0, v7

    return v0

    .line 460
    :catch_18
    move-exception v6

    .line 462
    .local v6, "e":Lorg/spongycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 464
    .end local v6    # "e":Lorg/spongycastle/crypto/DataLengthException;
    :catch_23
    move-exception v6

    .line 466
    .local v6, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v0, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineDoFinal([BII)[B
    .registers 13
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 413
    const/4 v7, 0x0

    .line 414
    .local v7, "len":I
    invoke-virtual {p0, p3}, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineGetOutputSize(I)I

    move-result v0

    new-array v4, v0, [B

    .line 416
    .local v4, "tmp":[B
    if-eqz p3, :cond_13

    .line 418
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    move-result v7

    .line 423
    :cond_13
    :try_start_13
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v0, v4, v7}, Lorg/spongycastle/crypto/BufferedBlockCipher;->doFinal([BI)I
    :try_end_18
    .catch Lorg/spongycastle/crypto/DataLengthException; {:try_start_13 .. :try_end_18} :catch_20
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_13 .. :try_end_18} :catch_2b

    move-result v0

    add-int/2addr v7, v0

    .line 434
    new-array v8, v7, [B

    .line 436
    .local v8, "out":[B
    invoke-static {v4, v5, v8, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 438
    return-object v8

    .line 425
    .end local v8    # "out":[B
    :catch_20
    move-exception v6

    .line 427
    .local v6, "e":Lorg/spongycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 429
    .end local v6    # "e":Lorg/spongycastle/crypto/DataLengthException;
    :catch_2b
    move-exception v6

    .line 431
    .local v6, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v0, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineGetBlockSize()I
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getBlockSize()I

    move-result v0

    return v0
.end method

.method protected engineGetIV()[B
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected engineGetKeySize(Ljava/security/Key;)I
    .registers 3
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 106
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method protected engineGetOutputSize(I)I
    .registers 3
    .param p1, "inputLen"    # I

    .prologue
    .line 112
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v0, p1}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v0

    return v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 5

    .prologue
    const/16 v3, 0x2f

    .line 117
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    if-nez v2, :cond_36

    .line 119
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v2, :cond_36

    .line 121
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_23

    .line 125
    const/4 v2, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 130
    :cond_23
    :try_start_23
    const-string v2, "SC"

    invoke-static {v1, v2}, Ljava/security/AlgorithmParameters;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 131
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    iget-object v3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init([B)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_36} :catch_39

    .line 140
    .end local v1    # "name":Ljava/lang/String;
    :cond_36
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    return-object v2

    .line 133
    .restart local v1    # "name":Ljava/lang/String;
    :catch_39
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/AlgorithmParameters;Ljava/security/SecureRandom;)V
    .registers 11
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/AlgorithmParameters;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 334
    const/4 v2, 0x0

    .line 336
    .local v2, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_34

    .line 338
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    iget-object v3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    array-length v3, v3

    if-eq v1, v3, :cond_11

    .line 342
    :try_start_9
    iget-object v3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    aget-object v3, v3, v1

    invoke-virtual {p3, v3}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_10} :catch_30

    move-result-object v2

    .line 351
    :cond_11
    if-nez v2, :cond_34

    .line 353
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can\'t handle parameter "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p3}, Ljava/security/AlgorithmParameters;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 345
    :catch_30
    move-exception v0

    .line 338
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 357
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i":I
    :cond_34
    iput-object p3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 358
    invoke-virtual {p0, p1, p2, v2, p4}, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 359
    return-void
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/SecureRandom;)V
    .registers 7
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 369
    const/4 v1, 0x0

    :try_start_1
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_6
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_6} :catch_7

    .line 375
    return-void

    .line 371
    :catch_7
    move-exception v0

    .line 373
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 18
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 233
    instance-of v1, p2, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    if-eqz v1, :cond_5c

    move-object v1, p2

    .line 235
    check-cast v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    iget v3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeType:I

    iget v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeHash:I

    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 236
    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v5

    iget v6, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeKeySize:I

    iget v7, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeIvSize:I

    move-object/from16 v2, p3

    .line 235
    invoke-static/range {v1 .. v7}, Lorg/spongycastle/jce/provider/BrokenPBE$Util;->makePBEParameters(Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;Ljava/security/spec/AlgorithmParameterSpec;IILjava/lang/String;II)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v9

    .line 238
    .local v9, "param":Lorg/spongycastle/crypto/CipherParameters;
    iget v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->pbeIvSize:I

    if-eqz v1, :cond_28

    move-object v1, v9

    .line 240
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 291
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_28
    :goto_28
    iget v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    if-eqz v1, :cond_51

    instance-of v1, v9, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-nez v1, :cond_51

    .line 293
    if-nez p4, :cond_37

    .line 295
    new-instance p4, Ljava/security/SecureRandom;

    .end local p4    # "random":Ljava/security/SecureRandom;
    invoke-direct/range {p4 .. p4}, Ljava/security/SecureRandom;-><init>()V

    .line 298
    .restart local p4    # "random":Ljava/security/SecureRandom;
    :cond_37
    const/4 v1, 0x1

    if-eq p1, v1, :cond_3d

    const/4 v1, 0x3

    if-ne p1, v1, :cond_114

    .line 300
    :cond_3d
    iget v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    new-array v8, v1, [B

    .line 302
    .local v8, "iv":[B
    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 303
    new-instance v10, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-direct {v10, v9, v8}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .local v10, "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object v1, v10

    .line 304
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object v9, v10

    .line 312
    .end local v8    # "iv":[B
    .end local v10    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_51
    packed-switch p1, :pswitch_data_12c

    .line 323
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "eeek!"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 325
    :goto_5b
    return-void

    .line 243
    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_5c
    if-nez p3, :cond_68

    .line 245
    new-instance v9, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    invoke-direct {v9, v1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_28

    .line 247
    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_68
    move-object/from16 v0, p3

    instance-of v1, v0, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v1, :cond_96

    .line 249
    iget v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    if-eqz v1, :cond_8c

    .line 251
    new-instance v9, Lorg/spongycastle/crypto/params/ParametersWithIV;

    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    check-cast p3, Ljavax/crypto/spec/IvParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v2

    invoke-direct {v9, v1, v2}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object v1, v9

    .line 252
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto :goto_28

    .line 256
    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_8c
    new-instance v9, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    invoke-direct {v9, v1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_28

    .line 259
    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_96
    move-object/from16 v0, p3

    instance-of v1, v0, Ljavax/crypto/spec/RC2ParameterSpec;

    if-eqz v1, :cond_ca

    move-object/from16 v11, p3

    .line 261
    check-cast v11, Ljavax/crypto/spec/RC2ParameterSpec;

    .line 263
    .local v11, "rc2Param":Ljavax/crypto/spec/RC2ParameterSpec;
    new-instance v9, Lorg/spongycastle/crypto/params/RC2Parameters;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    check-cast p3, Ljavax/crypto/spec/RC2ParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Ljavax/crypto/spec/RC2ParameterSpec;->getEffectiveKeyBits()I

    move-result v2

    invoke-direct {v9, v1, v2}, Lorg/spongycastle/crypto/params/RC2Parameters;-><init>([BI)V

    .line 265
    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {v11}, Ljavax/crypto/spec/RC2ParameterSpec;->getIV()[B

    move-result-object v1

    if-eqz v1, :cond_28

    iget v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    if-eqz v1, :cond_28

    .line 267
    new-instance v10, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v11}, Ljavax/crypto/spec/RC2ParameterSpec;->getIV()[B

    move-result-object v1

    invoke-direct {v10, v9, v1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v10    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object v1, v10

    .line 268
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local v11    # "rc2Param":Ljavax/crypto/spec/RC2ParameterSpec;
    :goto_c7
    move-object v9, v10

    .end local v10    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_28

    .line 271
    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_ca
    move-object/from16 v0, p3

    instance-of v1, v0, Ljavax/crypto/spec/RC5ParameterSpec;

    if-eqz v1, :cond_10c

    move-object/from16 v12, p3

    .line 273
    check-cast v12, Ljavax/crypto/spec/RC5ParameterSpec;

    .line 275
    .local v12, "rc5Param":Ljavax/crypto/spec/RC5ParameterSpec;
    new-instance v9, Lorg/spongycastle/crypto/params/RC5Parameters;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    check-cast p3, Ljavax/crypto/spec/RC5ParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Ljavax/crypto/spec/RC5ParameterSpec;->getRounds()I

    move-result v2

    invoke-direct {v9, v1, v2}, Lorg/spongycastle/crypto/params/RC5Parameters;-><init>([BI)V

    .line 276
    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {v12}, Ljavax/crypto/spec/RC5ParameterSpec;->getWordSize()I

    move-result v1

    const/16 v2, 0x20

    if-eq v1, v2, :cond_f3

    .line 278
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "can only accept RC5 word size 32 (at the moment...)"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 280
    :cond_f3
    invoke-virtual {v12}, Ljavax/crypto/spec/RC5ParameterSpec;->getIV()[B

    move-result-object v1

    if-eqz v1, :cond_28

    iget v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    if-eqz v1, :cond_28

    .line 282
    new-instance v10, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v12}, Ljavax/crypto/spec/RC5ParameterSpec;->getIV()[B

    move-result-object v1

    invoke-direct {v10, v9, v1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v10    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object v1, v10

    .line 283
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto :goto_c7

    .line 288
    .end local v10    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .end local v12    # "rc5Param":Ljavax/crypto/spec/RC5ParameterSpec;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_10c
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    const-string v2, "unknown parameter type."

    invoke-direct {v1, v2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 308
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v9    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_114
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    const-string v2, "no IV set when one expected"

    invoke-direct {v1, v2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 316
    :pswitch_11c
    iget-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v9}, Lorg/spongycastle/crypto/BufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    goto/16 :goto_5b

    .line 320
    :pswitch_124
    iget-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v9}, Lorg/spongycastle/crypto/BufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    goto/16 :goto_5b

    .line 312
    :pswitch_data_12c
    .packed-switch 0x1
        :pswitch_11c
        :pswitch_124
        :pswitch_11c
        :pswitch_124
    .end packed-switch
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .registers 8
    .param p1, "mode"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x3

    .line 146
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "modeName":Ljava/lang/String;
    const-string v2, "ECB"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 150
    const/4 v2, 0x0

    iput v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    .line 151
    new-instance v2, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    iget-object v3, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 195
    :goto_1d
    return-void

    .line 153
    :cond_1e
    const-string v2, "CBC"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_45

    .line 155
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    .line 156
    new-instance v2, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 157
    invoke-virtual {v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    goto :goto_1d

    .line 159
    :cond_45
    const-string v2, "OFB"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_95

    .line 161
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    .line 162
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v3, :cond_7a

    .line 164
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 166
    .local v1, "wordSize":I
    new-instance v2, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/OFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 167
    invoke-virtual {v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/crypto/modes/OFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    goto :goto_1d

    .line 171
    .end local v1    # "wordSize":I
    :cond_7a
    new-instance v2, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/OFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 172
    invoke-virtual {v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getBlockSize()I

    move-result v5

    mul-int/lit8 v5, v5, 0x8

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/crypto/modes/OFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    goto :goto_1d

    .line 175
    :cond_95
    const-string v2, "CFB"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e7

    .line 177
    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->ivLength:I

    .line 178
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v3, :cond_cb

    .line 180
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 182
    .restart local v1    # "wordSize":I
    new-instance v2, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 183
    invoke-virtual {v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/crypto/modes/CFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    goto/16 :goto_1d

    .line 187
    .end local v1    # "wordSize":I
    :cond_cb
    new-instance v2, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 188
    invoke-virtual {v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getBlockSize()I

    move-result v5

    mul-int/lit8 v5, v5, 0x8

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/crypto/modes/CFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    goto/16 :goto_1d

    .line 193
    :cond_e7
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can\'t support mode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineSetPadding(Ljava/lang/String;)V
    .registers 6
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "paddingName":Ljava/lang/String;
    const-string v1, "NOPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 205
    new-instance v1, Lorg/spongycastle/crypto/BufferedBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    .line 219
    :goto_19
    return-void

    .line 207
    :cond_1a
    const-string v1, "PKCS5PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_32

    const-string v1, "PKCS7PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_32

    const-string v1, "ISO10126PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_40

    .line 209
    :cond_32
    new-instance v1, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    goto :goto_19

    .line 211
    :cond_40
    const-string v1, "WITHCTS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_56

    .line 213
    new-instance v1, Lorg/spongycastle/crypto/modes/CTSBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/modes/CTSBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    goto :goto_19

    .line 217
    :cond_56
    new-instance v1, Ljavax/crypto/NoSuchPaddingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Padding "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " unknown."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineUnwrap([BLjava/lang/String;I)Ljava/security/Key;
    .registers 11
    .param p1, "wrappedKey"    # [B
    .param p2, "wrappedKeyAlgorithm"    # Ljava/lang/String;
    .param p3, "wrappedKeyType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 496
    const/4 v2, 0x0

    .line 499
    .local v2, "encoded":[B
    const/4 v4, 0x0

    :try_start_2
    array-length v5, p1

    invoke-virtual {p0, p1, v4, v5}, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineDoFinal([BII)[B
    :try_end_6
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2 .. :try_end_6} :catch_10
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2 .. :try_end_6} :catch_1b

    move-result-object v2

    .line 510
    const/4 v4, 0x3

    if-ne p3, v4, :cond_26

    .line 512
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v4, v2, p2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 526
    :goto_f
    return-object v4

    .line 501
    :catch_10
    move-exception v0

    .line 503
    .local v0, "e":Ljavax/crypto/BadPaddingException;
    new-instance v4, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 505
    .end local v0    # "e":Ljavax/crypto/BadPaddingException;
    :catch_1b
    move-exception v1

    .line 507
    .local v1, "e2":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v4, Ljava/security/InvalidKeyException;

    invoke-virtual {v1}, Ljavax/crypto/IllegalBlockSizeException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 518
    .end local v1    # "e2":Ljavax/crypto/IllegalBlockSizeException;
    :cond_26
    :try_start_26
    const-string v4, "SC"

    invoke-static {p2, v4}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v3

    .line 520
    .local v3, "kf":Ljava/security/KeyFactory;
    const/4 v4, 0x1

    if-ne p3, v4, :cond_39

    .line 522
    new-instance v4, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v4, v2}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v4

    goto :goto_f

    .line 524
    :cond_39
    const/4 v4, 0x2

    if-ne p3, v4, :cond_a0

    .line 526
    new-instance v4, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v4, v2}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;
    :try_end_44
    .catch Ljava/security/NoSuchProviderException; {:try_start_26 .. :try_end_44} :catch_46
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_26 .. :try_end_44} :catch_64
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_26 .. :try_end_44} :catch_82

    move-result-object v4

    goto :goto_f

    .line 529
    .end local v3    # "kf":Ljava/security/KeyFactory;
    :catch_46
    move-exception v0

    .line 531
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/NoSuchProviderException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 533
    .end local v0    # "e":Ljava/security/NoSuchProviderException;
    :catch_64
    move-exception v0

    .line 535
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 537
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_82
    move-exception v1

    .line 539
    .local v1, "e2":Ljava/security/spec/InvalidKeySpecException;
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/security/spec/InvalidKeySpecException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 542
    .end local v1    # "e2":Ljava/security/spec/InvalidKeySpecException;
    .restart local v3    # "kf":Ljava/security/KeyFactory;
    :cond_a0
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected engineUpdate([BII[BI)I
    .registers 12
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I

    .prologue
    .line 404
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    move-result v0

    return v0
.end method

.method protected engineUpdate([BII)[B
    .registers 16
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 382
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    invoke-virtual {v0, p3}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUpdateOutputSize(I)I

    move-result v11

    .line 384
    .local v11, "length":I
    if-lez v11, :cond_14

    .line 386
    new-array v4, v11, [B

    .line 388
    .local v4, "out":[B
    iget-object v0, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v5, 0x0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    .line 394
    .end local v4    # "out":[B
    :goto_13
    return-object v4

    .line 392
    :cond_14
    iget-object v5, p0, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->cipher:Lorg/spongycastle/crypto/BufferedBlockCipher;

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v6, p1

    move v7, p2

    move v8, p3

    invoke-virtual/range {v5 .. v10}, Lorg/spongycastle/crypto/BufferedBlockCipher;->processBytes([BII[BI)I

    .line 394
    const/4 v4, 0x0

    goto :goto_13
.end method

.method protected engineWrap(Ljava/security/Key;)[B
    .registers 6
    .param p1, "key"    # Ljava/security/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 474
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    .line 475
    .local v1, "encoded":[B
    if-nez v1, :cond_e

    .line 477
    new-instance v2, Ljava/security/InvalidKeyException;

    const-string v3, "Cannot wrap key, null encoding."

    invoke-direct {v2, v3}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 482
    :cond_e
    const/4 v2, 0x0

    :try_start_f
    array-length v3, v1

    invoke-virtual {p0, v1, v2, v3}, Lorg/spongycastle/jce/provider/BrokenJCEBlockCipher;->engineDoFinal([BII)[B
    :try_end_13
    .catch Ljavax/crypto/BadPaddingException; {:try_start_f .. :try_end_13} :catch_15

    move-result-object v2

    return-object v2

    .line 484
    :catch_15
    move-exception v0

    .line 486
    .local v0, "e":Ljavax/crypto/BadPaddingException;
    new-instance v2, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
