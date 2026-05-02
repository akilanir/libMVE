.class public Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;
.super Ljavax/crypto/CipherSpi;
.source "CipherSpi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi$OldIES;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi$IES;
    }
.end annotation


# instance fields
.field private availableSpecs:[Ljava/lang/Class;

.field private buffer:Ljava/io/ByteArrayOutputStream;

.field private cipher:Lorg/spongycastle/crypto/engines/IESEngine;

.field private engineParam:Ljava/security/AlgorithmParameters;

.field private engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

.field private state:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/engines/IESEngine;)V
    .registers 5
    .param p1, "engine"    # Lorg/spongycastle/crypto/engines/IESEngine;

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 38
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->state:I

    .line 42
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 43
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParam:Ljava/security/AlgorithmParameters;

    .line 44
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 49
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Lorg/spongycastle/jce/spec/IESParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->availableSpecs:[Ljava/lang/Class;

    .line 57
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->cipher:Lorg/spongycastle/crypto/engines/IESEngine;

    .line 58
    return-void
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .registers 11
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
    .line 334
    if-eqz p3, :cond_7

    .line 336
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 341
    :cond_7
    :try_start_7
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 343
    .local v0, "buf":[B
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 345
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->cipher:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v2, v0, v3, v4}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B

    move-result-object v0

    .line 347
    const/4 v2, 0x0

    array-length v3, v0

    invoke-static {v0, v2, p4, p5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 349
    array-length v2, v0
    :try_end_20
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_7 .. :try_end_20} :catch_21

    return v2

    .line 351
    .end local v0    # "buf":[B
    :catch_21
    move-exception v1

    .line 353
    .local v1, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v2, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineDoFinal([BII)[B
    .registers 9
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
    .line 307
    if-eqz p3, :cond_7

    .line 309
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 314
    :cond_7
    :try_start_7
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 316
    .local v0, "buf":[B
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 318
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->cipher:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v2, v0, v3, v4}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B
    :try_end_19
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_7 .. :try_end_19} :catch_1b

    move-result-object v2

    return-object v2

    .line 320
    .end local v0    # "buf":[B
    :catch_1b
    move-exception v1

    .line 322
    .local v1, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v2, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineGetBlockSize()I
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method protected engineGetIV()[B
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineGetKeySize(Ljava/security/Key;)I
    .registers 6
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 73
    instance-of v2, p1, Lorg/spongycastle/jce/interfaces/IESKey;

    if-nez v2, :cond_c

    .line 75
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "must be passed IE key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_c
    move-object v0, p1

    .line 78
    check-cast v0, Lorg/spongycastle/jce/interfaces/IESKey;

    .line 80
    .local v0, "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v2

    instance-of v2, v2, Ljavax/crypto/interfaces/DHPrivateKey;

    if-eqz v2, :cond_26

    .line 82
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v1

    check-cast v1, Ljavax/crypto/interfaces/DHPrivateKey;

    .line 84
    .local v1, "k":Ljavax/crypto/interfaces/DHPrivateKey;
    invoke-interface {v1}, Ljavax/crypto/interfaces/DHPrivateKey;->getX()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    .line 90
    .end local v1    # "k":Ljavax/crypto/interfaces/DHPrivateKey;
    :goto_25
    return v2

    .line 86
    :cond_26
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v2

    instance-of v2, v2, Lorg/spongycastle/jce/interfaces/ECPrivateKey;

    if-eqz v2, :cond_3d

    .line 88
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/jce/interfaces/ECPrivateKey;

    .line 90
    .local v1, "k":Lorg/spongycastle/jce/interfaces/ECPrivateKey;
    invoke-interface {v1}, Lorg/spongycastle/jce/interfaces/ECPrivateKey;->getD()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->bitLength()I

    move-result v2

    goto :goto_25

    .line 93
    .end local v1    # "k":Lorg/spongycastle/jce/interfaces/ECPrivateKey;
    :cond_3d
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "not an IE key!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineGetOutputSize(I)I
    .registers 4
    .param p1, "inputLen"    # I

    .prologue
    .line 99
    iget v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->state:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    iget v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->state:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_14

    .line 101
    :cond_a
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x14

    .line 105
    :goto_13
    return v0

    .line 103
    :cond_14
    iget v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->state:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1e

    iget v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->state:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_28

    .line 105
    :cond_1e
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x14

    goto :goto_13

    .line 109
    :cond_28
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cipher not initialised"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 5

    .prologue
    .line 115
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParam:Ljava/security/AlgorithmParameters;

    if-nez v2, :cond_19

    .line 117
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

    if-eqz v2, :cond_19

    .line 119
    const-string v1, "IES"

    .line 123
    .local v1, "name":Ljava/lang/String;
    :try_start_a
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    invoke-interface {v2, v1}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createAlgorithmParameters(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParam:Ljava/security/AlgorithmParameters;

    .line 124
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParam:Ljava/security/AlgorithmParameters;

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_19} :catch_1c

    .line 133
    .end local v1    # "name":Ljava/lang/String;
    :cond_19
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParam:Ljava/security/AlgorithmParameters;

    return-object v2

    .line 126
    .restart local v1    # "name":Ljava/lang/String;
    :catch_1c
    move-exception v0

    .line 128
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
    .line 232
    const/4 v2, 0x0

    .line 234
    .local v2, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_34

    .line 236
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->availableSpecs:[Ljava/lang/Class;

    array-length v3, v3

    if-eq v1, v3, :cond_11

    .line 240
    :try_start_9
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->availableSpecs:[Ljava/lang/Class;

    aget-object v3, v3, v1

    invoke-virtual {p3, v3}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_10} :catch_30

    move-result-object v2

    .line 249
    :cond_11
    if-nez v2, :cond_34

    .line 251
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

    .line 243
    :catch_30
    move-exception v0

    .line 236
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 255
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i":I
    :cond_34
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParam:Ljava/security/AlgorithmParameters;

    .line 256
    invoke-virtual {p0, p1, p2, v2, p4}, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 257
    return-void
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/SecureRandom;)V
    .registers 6
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 265
    const/4 v0, 0x1

    if-eq p1, v0, :cond_6

    const/4 v0, 0x3

    if-ne p1, v0, :cond_e

    .line 269
    :cond_6
    const/4 v0, 0x0

    :try_start_7
    check-cast v0, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_c
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_7 .. :try_end_c} :catch_d

    .line 270
    return-void

    .line 272
    :catch_d
    move-exception v0

    .line 278
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "can\'t handle null parameter spec in IES"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 15
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
    const/16 v7, 0x10

    const/4 v9, 0x1

    .line 156
    instance-of v6, p2, Lorg/spongycastle/jce/interfaces/IESKey;

    if-nez v6, :cond_f

    .line 158
    new-instance v6, Ljava/security/InvalidKeyException;

    const-string v7, "must be passed IES key"

    invoke-direct {v6, v7}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 161
    :cond_f
    if-nez p3, :cond_76

    if-eq p1, v9, :cond_16

    const/4 v6, 0x3

    if-ne p1, v6, :cond_76

    .line 167
    :cond_16
    new-array v0, v7, [B

    .line 168
    .local v0, "d":[B
    new-array v1, v7, [B

    .line 170
    .local v1, "e":[B
    if-nez p4, :cond_21

    .line 172
    new-instance p4, Ljava/security/SecureRandom;

    .end local p4    # "random":Ljava/security/SecureRandom;
    invoke-direct {p4}, Ljava/security/SecureRandom;-><init>()V

    .line 175
    .restart local p4    # "random":Ljava/security/SecureRandom;
    :cond_21
    invoke-virtual {p4, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 176
    invoke-virtual {p4, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 178
    new-instance p3, Lorg/spongycastle/jce/spec/IESParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    const/16 v6, 0x80

    invoke-direct {p3, v0, v1, v6}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BI)V

    .end local v0    # "d":[B
    .end local v1    # "e":[B
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_2e
    move-object v2, p2

    .line 185
    check-cast v2, Lorg/spongycastle/jce/interfaces/IESKey;

    .line 190
    .local v2, "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    invoke-interface {v2}, Lorg/spongycastle/jce/interfaces/IESKey;->getPublic()Ljava/security/PublicKey;

    move-result-object v6

    instance-of v6, v6, Ljavax/crypto/interfaces/DHPublicKey;

    if-eqz v6, :cond_82

    .line 192
    invoke-interface {v2}, Lorg/spongycastle/jce/interfaces/IESKey;->getPublic()Ljava/security/PublicKey;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v5

    .line 193
    .local v5, "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    invoke-interface {v2}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v4

    .line 202
    .local v4, "privKey":Lorg/spongycastle/crypto/CipherParameters;
    :goto_49
    check-cast p3, Lorg/spongycastle/jce/spec/IESParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 204
    new-instance v3, Lorg/spongycastle/crypto/params/IESParameters;

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v6}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getDerivationV()[B

    move-result-object v6

    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v7}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getEncodingV()[B

    move-result-object v7

    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->engineParams:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v8}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getMacKeySize()I

    move-result v8

    invoke-direct {v3, v6, v7, v8}, Lorg/spongycastle/crypto/params/IESParameters;-><init>([B[BI)V

    .line 206
    .local v3, "p":Lorg/spongycastle/crypto/params/IESParameters;
    iput p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->state:I

    .line 208
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 210
    packed-switch p1, :pswitch_data_a0

    .line 221
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "eeek!"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 223
    :goto_75
    return-void

    .line 180
    .end local v2    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    .end local v3    # "p":Lorg/spongycastle/crypto/params/IESParameters;
    .end local v4    # "privKey":Lorg/spongycastle/crypto/CipherParameters;
    .end local v5    # "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_76
    instance-of v6, p3, Lorg/spongycastle/jce/spec/IESParameterSpec;

    if-nez v6, :cond_2e

    .line 182
    new-instance v6, Ljava/security/InvalidAlgorithmParameterException;

    const-string v7, "must be passed IES parameters"

    invoke-direct {v6, v7}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 198
    .restart local v2    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    :cond_82
    invoke-interface {v2}, Lorg/spongycastle/jce/interfaces/IESKey;->getPublic()Ljava/security/PublicKey;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v5

    .line 199
    .restart local v5    # "pubKey":Lorg/spongycastle/crypto/CipherParameters;
    invoke-interface {v2}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v4

    .restart local v4    # "privKey":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_49

    .line 214
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v3    # "p":Lorg/spongycastle/crypto/params/IESParameters;
    :pswitch_93
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->cipher:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v6, v9, v4, v5, v3}, Lorg/spongycastle/crypto/engines/IESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_75

    .line 218
    :pswitch_99
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->cipher:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v4, v5, v3}, Lorg/spongycastle/crypto/engines/IESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V

    goto :goto_75

    .line 210
    :pswitch_data_a0
    .packed-switch 0x1
        :pswitch_93
        :pswitch_99
        :pswitch_93
        :pswitch_99
    .end packed-switch
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .registers 5
    .param p1, "mode"    # Ljava/lang/String;

    .prologue
    .line 139
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
    .line 146
    new-instance v0, Ljavax/crypto/NoSuchPaddingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " unavailable with RSA."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUpdate([BII[BI)I
    .registers 7
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I

    .prologue
    .line 297
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 298
    const/4 v0, 0x0

    return v0
.end method

.method protected engineUpdate([BII)[B
    .registers 5
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 286
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 287
    const/4 v0, 0x0

    return-object v0
.end method
