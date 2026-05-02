.class public Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;
.source "BaseStreamCipher.java"

# interfaces
.implements Lorg/spongycastle/jcajce/provider/symmetric/util/PBE;


# instance fields
.field private availableSpecs:[Ljava/lang/Class;

.field private cipher:Lorg/spongycastle/crypto/StreamCipher;

.field private digest:I

.field private ivLength:I

.field private ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

.field private keySizeInBits:I

.field private pbeAlgorithm:Ljava/lang/String;

.field private pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;


# direct methods
.method protected constructor <init>(Lorg/spongycastle/crypto/StreamCipher;I)V
    .registers 4
    .param p1, "engine"    # Lorg/spongycastle/crypto/StreamCipher;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v0, -0x1

    .line 57
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;-><init>(Lorg/spongycastle/crypto/StreamCipher;III)V

    .line 58
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/StreamCipher;III)V
    .registers 10
    .param p1, "engine"    # Lorg/spongycastle/crypto/StreamCipher;
    .param p2, "ivLength"    # I
    .param p3, "keySizeInBits"    # I
    .param p4, "digest"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 65
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 35
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->availableSpecs:[Ljava/lang/Class;

    .line 48
    iput v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivLength:I

    .line 50
    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 51
    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 66
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 67
    iput p2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivLength:I

    .line 68
    iput p3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->keySizeInBits:I

    .line 69
    iput p4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->digest:I

    .line 70
    return-void
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .registers 12
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;
        }
    .end annotation

    .prologue
    .line 386
    add-int v0, p5, p3

    array-length v1, p4

    if-le v0, v1, :cond_d

    .line 388
    new-instance v0, Ljavax/crypto/ShortBufferException;

    const-string v1, "output buffer too short for input."

    invoke-direct {v0, v1}, Ljavax/crypto/ShortBufferException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 391
    :cond_d
    if-eqz p3, :cond_19

    .line 393
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/crypto/StreamCipher;->processBytes([BII[BI)I

    .line 396
    :cond_19
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/StreamCipher;->reset()V

    .line 398
    return p3
.end method

.method protected engineDoFinal([BII)[B
    .registers 6
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 364
    if-eqz p3, :cond_c

    .line 366
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->engineUpdate([BII)[B

    move-result-object v0

    .line 368
    .local v0, "out":[B
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/StreamCipher;->reset()V

    .line 375
    .end local v0    # "out":[B
    :goto_b
    return-object v0

    .line 373
    :cond_c
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/StreamCipher;->reset()V

    .line 375
    const/4 v1, 0x0

    new-array v0, v1, [B

    goto :goto_b
.end method

.method protected engineGetBlockSize()I
    .registers 2

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method protected engineGetIV()[B
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

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
    .line 85
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    return v0
.end method

.method protected engineGetOutputSize(I)I
    .registers 2
    .param p1, "inputLen"    # I

    .prologue
    .line 91
    return p1
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 4

    .prologue
    .line 96
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    if-nez v2, :cond_17

    .line 98
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v2, :cond_17

    .line 102
    :try_start_8
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->createParametersInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v1

    .line 103
    .local v1, "engineParams":Ljava/security/AlgorithmParameters;
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v1, v2}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_13} :catch_14

    .line 114
    .end local v1    # "engineParams":Ljava/security/AlgorithmParameters;
    :goto_13
    return-object v1

    .line 107
    :catch_14
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_13

    .line 114
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_17
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    goto :goto_13
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
    .line 278
    const/4 v2, 0x0

    .line 280
    .local v2, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_34

    .line 282
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->availableSpecs:[Ljava/lang/Class;

    array-length v3, v3

    if-eq v1, v3, :cond_11

    .line 286
    :try_start_9
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->availableSpecs:[Ljava/lang/Class;

    aget-object v3, v3, v1

    invoke-virtual {p3, v3}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_10} :catch_30

    move-result-object v2

    .line 295
    :cond_11
    if-nez v2, :cond_34

    .line 297
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

    .line 289
    :catch_30
    move-exception v0

    .line 282
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 301
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i":I
    :cond_34
    invoke-virtual {p0, p1, p2, v2, p4}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 302
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 303
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
    .line 313
    const/4 v1, 0x0

    :try_start_1
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_6
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_6} :catch_7

    .line 319
    return-void

    .line 315
    :catch_7
    move-exception v0

    .line 317
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 19
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
    .line 151
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 152
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 154
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 159
    move-object/from16 v0, p2

    instance-of v1, v0, Ljavax/crypto/SecretKey;

    if-nez v1, :cond_32

    .line 161
    new-instance v1, Ljava/security/InvalidKeyException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Key for algorithm "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getAlgorithm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not suitable for symmetric enryption."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 164
    :cond_32
    move-object/from16 v0, p2

    instance-of v1, v0, Lorg/spongycastle/jcajce/PKCS12Key;

    if-eqz v1, :cond_ce

    move-object/from16 v11, p2

    .line 166
    check-cast v11, Lorg/spongycastle/jcajce/PKCS12Key;

    .line 167
    .local v11, "k":Lorg/spongycastle/jcajce/PKCS12Key;
    check-cast p3, Ljavax/crypto/spec/PBEParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    move-object/from16 v0, p3

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 168
    instance-of v1, v11, Lorg/spongycastle/jcajce/PKCS12KeyWithParameters;

    if-eqz v1, :cond_5f

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v1, :cond_5f

    .line 170
    new-instance v2, Ljavax/crypto/spec/PBEParameterSpec;

    move-object v1, v11

    check-cast v1, Lorg/spongycastle/jcajce/PKCS12KeyWithParameters;

    invoke-virtual {v1}, Lorg/spongycastle/jcajce/PKCS12KeyWithParameters;->getSalt()[B

    move-result-object v3

    move-object v1, v11

    check-cast v1, Lorg/spongycastle/jcajce/PKCS12KeyWithParameters;

    invoke-virtual {v1}, Lorg/spongycastle/jcajce/PKCS12KeyWithParameters;->getIterationCount()I

    move-result v1

    invoke-direct {v2, v3, v1}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 173
    :cond_5f
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/PKCS12Key;->getEncoded()[B

    move-result-object v1

    const/4 v2, 0x2

    iget v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->digest:I

    iget v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->keySizeInBits:I

    iget v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivLength:I

    mul-int/lit8 v5, v5, 0x8

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    invoke-interface {v7}, Lorg/spongycastle/crypto/StreamCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v1 .. v7}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters([BIIIILjava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v12

    .line 226
    .end local v11    # "k":Lorg/spongycastle/jcajce/PKCS12Key;
    .local v12, "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_78
    :goto_78
    iget v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivLength:I

    if-eqz v1, :cond_a1

    instance-of v1, v12, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-nez v1, :cond_a1

    .line 228
    move-object/from16 v10, p4

    .line 230
    .local v10, "ivRandom":Ljava/security/SecureRandom;
    if-nez v10, :cond_89

    .line 232
    new-instance v10, Ljava/security/SecureRandom;

    .end local v10    # "ivRandom":Ljava/security/SecureRandom;
    invoke-direct {v10}, Ljava/security/SecureRandom;-><init>()V

    .line 235
    .restart local v10    # "ivRandom":Ljava/security/SecureRandom;
    :cond_89
    const/4 v1, 0x1

    if-eq p1, v1, :cond_8f

    const/4 v1, 0x3

    if-ne p1, v1, :cond_178

    .line 237
    :cond_8f
    iget v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivLength:I

    new-array v9, v1, [B

    .line 239
    .local v9, "iv":[B
    invoke-virtual {v10, v9}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 240
    new-instance v13, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-direct {v13, v12, v9}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .local v13, "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object v1, v13

    .line 241
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object v12, v13

    .line 251
    .end local v9    # "iv":[B
    .end local v10    # "ivRandom":Ljava/security/SecureRandom;
    .end local v13    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_a1
    packed-switch p1, :pswitch_data_18e

    .line 262
    :try_start_a4
    new-instance v1, Ljava/security/InvalidParameterException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unknown opmode "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " passed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_c3} :catch_c3

    .line 265
    :catch_c3
    move-exception v8

    .line 267
    .local v8, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/security/InvalidKeyException;

    invoke-virtual {v8}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 175
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_ce
    move-object/from16 v0, p2

    instance-of v1, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    if-eqz v1, :cond_136

    move-object/from16 v11, p2

    .line 177
    check-cast v11, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    .line 179
    .local v11, "k":Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    if-eqz v1, :cond_10e

    .line 181
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 188
    :goto_e8
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v1

    if-eqz v1, :cond_115

    .line 190
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v12

    .line 191
    .restart local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    new-instance v1, Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getSalt()[B

    move-result-object v2

    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getIterationCount()I

    move-result v3

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 203
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :goto_101
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getIvSize()I

    move-result v1

    if-eqz v1, :cond_78

    move-object v1, v12

    .line 205
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_78

    .line 185
    .end local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_10e
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    goto :goto_e8

    .line 193
    :cond_115
    move-object/from16 v0, p3

    instance-of v1, v0, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v1, :cond_12e

    .line 195
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/StreamCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-static {v11, v0, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters(Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;Ljava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v12

    .line 196
    .restart local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    check-cast p3, Ljavax/crypto/spec/PBEParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    move-object/from16 v0, p3

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    goto :goto_101

    .line 200
    .end local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_12e
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    const-string v2, "PBE requires PBE parameters to be set."

    invoke-direct {v1, v2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 208
    .end local v11    # "k":Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    :cond_136
    if-nez p3, :cond_14f

    .line 210
    iget v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->digest:I

    if-lez v1, :cond_144

    .line 212
    new-instance v1, Ljava/security/InvalidKeyException;

    const-string v2, "Algorithm requires a PBE key"

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_144
    new-instance v12, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    invoke-direct {v12, v1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_78

    .line 216
    .end local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_14f
    move-object/from16 v0, p3

    instance-of v1, v0, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v1, :cond_170

    .line 218
    new-instance v12, Lorg/spongycastle/crypto/params/ParametersWithIV;

    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    check-cast p3, Ljavax/crypto/spec/IvParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v2

    invoke-direct {v12, v1, v2}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .restart local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object v1, v12

    .line 219
    check-cast v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_78

    .line 223
    .end local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_170
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    const-string v2, "unknown parameter type."

    invoke-direct {v1, v2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 245
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v10    # "ivRandom":Ljava/security/SecureRandom;
    .restart local v12    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_178
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    const-string v2, "no IV set when one expected"

    invoke-direct {v1, v2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 255
    .end local v10    # "ivRandom":Ljava/security/SecureRandom;
    :pswitch_180
    :try_start_180
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    const/4 v2, 0x1

    invoke-interface {v1, v2, v12}, Lorg/spongycastle/crypto/StreamCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 269
    :goto_186
    return-void

    .line 259
    :pswitch_187
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v12}, Lorg/spongycastle/crypto/StreamCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V
    :try_end_18d
    .catch Ljava/lang/Exception; {:try_start_180 .. :try_end_18d} :catch_c3

    goto :goto_186

    .line 251
    :pswitch_data_18e
    .packed-switch 0x1
        :pswitch_180
        :pswitch_187
        :pswitch_180
        :pswitch_187
    .end packed-switch
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .registers 5
    .param p1, "mode"    # Ljava/lang/String;

    .prologue
    .line 123
    const-string v0, "ECB"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_21

    .line 125
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "can\'t support mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_21
    return-void
.end method

.method protected engineSetPadding(Ljava/lang/String;)V
    .registers 5
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 136
    const-string v0, "NoPadding"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_27

    .line 138
    new-instance v0, Ljavax/crypto/NoSuchPaddingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Padding "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " unknown."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_27
    return-void
.end method

.method protected engineUpdate([BII[BI)I
    .registers 13
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;
        }
    .end annotation

    .prologue
    .line 341
    add-int v0, p5, p3

    array-length v1, p4

    if-le v0, v1, :cond_d

    .line 343
    new-instance v0, Ljavax/crypto/ShortBufferException;

    const-string v1, "output buffer too short for input."

    invoke-direct {v0, v1}, Ljavax/crypto/ShortBufferException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 348
    :cond_d
    :try_start_d
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/crypto/StreamCipher;->processBytes([BII[BI)I
    :try_end_17
    .catch Lorg/spongycastle/crypto/DataLengthException; {:try_start_d .. :try_end_17} :catch_18

    .line 350
    return p3

    .line 352
    :catch_18
    move-exception v6

    .line 355
    .local v6, "e":Lorg/spongycastle/crypto/DataLengthException;
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUpdate([BII)[B
    .registers 10
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 326
    new-array v4, p3, [B

    .line 328
    .local v4, "out":[B
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseStreamCipher;->cipher:Lorg/spongycastle/crypto/StreamCipher;

    const/4 v5, 0x0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/crypto/StreamCipher;->processBytes([BII[BI)I

    .line 330
    return-object v4
.end method
