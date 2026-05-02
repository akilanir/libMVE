.class public Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;
.super Ljavax/crypto/CipherSpi;
.source "IESCipher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithAES;,
        Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithDESede;,
        Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIES;,
        Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithCipher;,
        Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$IESwithAES;,
        Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$IESwithDESede;,
        Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$IES;
    }
.end annotation


# instance fields
.field private buffer:Ljava/io/ByteArrayOutputStream;

.field private dhaesMode:Z

.field private engine:Lorg/spongycastle/crypto/engines/IESEngine;

.field private engineParam:Ljava/security/AlgorithmParameters;

.field private engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

.field private key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

.field private otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

.field private random:Ljava/security/SecureRandom;

.field private state:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/engines/IESEngine;)V
    .registers 4
    .param p1, "engine"    # Lorg/spongycastle/crypto/engines/IESEngine;

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    .line 63
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 64
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 65
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->dhaesMode:Z

    .line 69
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 73
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    .line 74
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/engines/OldIESEngine;)V
    .registers 4
    .param p1, "engine"    # Lorg/spongycastle/crypto/engines/OldIESEngine;

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    .line 63
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 64
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 65
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->dhaesMode:Z

    .line 69
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 78
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    .line 79
    return-void
.end method


# virtual methods
.method public engineDoFinal([BII[BI)I
    .registers 9
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLength"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 476
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineDoFinal([BII)[B

    move-result-object v0

    .line 477
    .local v0, "buf":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, p4, p5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 478
    array-length v1, v0

    return v1
.end method

.method public engineDoFinal([BII)[B
    .registers 16
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
    const/4 v11, 0x3

    const/4 v10, 0x1

    .line 370
    if-eqz p3, :cond_9

    .line 372
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v6, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 375
    :cond_9
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 376
    .local v3, "in":[B
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 379
    new-instance v5, Lorg/spongycastle/crypto/params/IESWithCipherParameters;

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v6}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getDerivationV()[B

    move-result-object v6

    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 380
    invoke-virtual {v7}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getEncodingV()[B

    move-result-object v7

    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 381
    invoke-virtual {v8}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getMacKeySize()I

    move-result v8

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 382
    invoke-virtual {v9}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getCipherKeySize()I

    move-result v9

    invoke-direct {v5, v6, v7, v8, v9}, Lorg/spongycastle/crypto/params/IESWithCipherParameters;-><init>([B[BII)V

    .line 384
    .local v5, "params":Lorg/spongycastle/crypto/params/IESParameters;
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    check-cast v6, Lorg/spongycastle/crypto/params/DHKeyParameters;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/params/DHKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v0

    .line 387
    .local v0, "dhParams":Lorg/spongycastle/crypto/params/DHParameters;
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    if-eqz v6, :cond_6e

    .line 391
    :try_start_3d
    iget v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-eq v6, v10, :cond_45

    iget v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-ne v6, v11, :cond_58

    .line 393
    :cond_45
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v7, 0x1

    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-virtual {v6, v7, v8, v9, v5}, Lorg/spongycastle/crypto/engines/IESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V

    .line 399
    :goto_4f
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v7, 0x0

    array-length v8, v3

    invoke-virtual {v6, v3, v7, v8}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B

    move-result-object v6

    .line 452
    :goto_57
    return-object v6

    .line 397
    :cond_58
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v7, 0x0

    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-virtual {v6, v7, v8, v9, v5}, Lorg/spongycastle/crypto/engines/IESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_62} :catch_63

    goto :goto_4f

    .line 401
    :catch_63
    move-exception v1

    .line 403
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 407
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_6e
    iget v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-eq v6, v10, :cond_76

    iget v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-ne v6, v11, :cond_aa

    .line 410
    :cond_76
    new-instance v2, Lorg/spongycastle/crypto/generators/DHKeyPairGenerator;

    invoke-direct {v2}, Lorg/spongycastle/crypto/generators/DHKeyPairGenerator;-><init>()V

    .line 411
    .local v2, "gen":Lorg/spongycastle/crypto/generators/DHKeyPairGenerator;
    new-instance v6, Lorg/spongycastle/crypto/params/DHKeyGenerationParameters;

    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->random:Ljava/security/SecureRandom;

    invoke-direct {v6, v7, v0}, Lorg/spongycastle/crypto/params/DHKeyGenerationParameters;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/params/DHParameters;)V

    invoke-virtual {v2, v6}, Lorg/spongycastle/crypto/generators/DHKeyPairGenerator;->init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 413
    new-instance v4, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;

    new-instance v6, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$1;

    invoke-direct {v6, p0}, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$1;-><init>(Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;)V

    invoke-direct {v4, v2, v6}, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;-><init>(Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;Lorg/spongycastle/crypto/KeyEncoder;)V

    .line 436
    .local v4, "kGen":Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;
    :try_start_8f
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-virtual {v6, v7, v5, v4}, Lorg/spongycastle/crypto/engines/IESEngine;->init(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;)V

    .line 438
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v7, 0x0

    array-length v8, v3

    invoke-virtual {v6, v3, v7, v8}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B
    :try_end_9d
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_9d} :catch_9f

    move-result-object v6

    goto :goto_57

    .line 440
    :catch_9f
    move-exception v1

    .line 442
    .restart local v1    # "e":Ljava/lang/Exception;
    new-instance v6, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 445
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "gen":Lorg/spongycastle/crypto/generators/DHKeyPairGenerator;
    .end local v4    # "kGen":Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;
    :cond_aa
    iget v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    const/4 v7, 0x2

    if-eq v6, v7, :cond_b4

    iget v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    const/4 v7, 0x4

    if-ne v6, v7, :cond_dc

    .line 450
    :cond_b4
    :try_start_b4
    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    new-instance v9, Lorg/spongycastle/crypto/parsers/DHIESPublicKeyParser;

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    check-cast v6, Lorg/spongycastle/crypto/params/DHKeyParameters;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/params/DHKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v6

    invoke-direct {v9, v6}, Lorg/spongycastle/crypto/parsers/DHIESPublicKeyParser;-><init>(Lorg/spongycastle/crypto/params/DHParameters;)V

    invoke-virtual {v7, v8, v5, v9}, Lorg/spongycastle/crypto/engines/IESEngine;->init(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/KeyParser;)V

    .line 452
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v7, 0x0

    array-length v8, v3

    invoke-virtual {v6, v3, v7, v8}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B
    :try_end_cf
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_b4 .. :try_end_cf} :catch_d1

    move-result-object v6

    goto :goto_57

    .line 454
    :catch_d1
    move-exception v1

    .line 456
    .local v1, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v6, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 461
    .end local v1    # "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    :cond_dc
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "IESCipher not initialised"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public engineGetBlockSize()I
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 85
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getBlockSize()I

    move-result v0

    .line 89
    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public engineGetIV()[B
    .registers 2

    .prologue
    .line 109
    const/4 v0, 0x0

    return-object v0
.end method

.method public engineGetKeySize(Ljava/security/Key;)I
    .registers 4
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 96
    instance-of v0, p1, Ljavax/crypto/interfaces/DHKey;

    if-eqz v0, :cond_13

    .line 98
    check-cast p1, Ljavax/crypto/interfaces/DHKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-interface {p1}, Ljavax/crypto/interfaces/DHKey;->getParams()Ljavax/crypto/spec/DHParameterSpec;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/crypto/spec/DHParameterSpec;->getP()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    return v0

    .line 102
    .restart local p1    # "key":Ljava/security/Key;
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "not a DH key"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public engineGetOutputSize(I)I
    .registers 11
    .param p1, "inputLen"    # I

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 154
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    if-nez v3, :cond_10

    .line 156
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "cipher not initialised"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 159
    :cond_10
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getMac()Lorg/spongycastle/crypto/Mac;

    move-result-object v3

    invoke-interface {v3}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v0

    .line 161
    .local v0, "len1":I
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    if-nez v3, :cond_51

    .line 163
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    check-cast v3, Lorg/spongycastle/crypto/params/DHKeyParameters;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/DHKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/DHParameters;->getP()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    add-int/lit8 v3, v3, 0x7

    mul-int/lit8 v3, v3, 0x2

    div-int/lit8 v3, v3, 0x8

    add-int/lit8 v1, v3, 0x1

    .line 170
    .local v1, "len2":I
    :goto_36
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v3

    if-nez v3, :cond_53

    .line 172
    move v2, p1

    .line 187
    .local v2, "len3":I
    :goto_3f
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-eq v3, v5, :cond_47

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-ne v3, v7, :cond_84

    .line 189
    :cond_47
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v0

    add-int/2addr v3, v1

    add-int/2addr v3, v2

    .line 193
    :goto_50
    return v3

    .line 167
    .end local v1    # "len2":I
    .end local v2    # "len3":I
    :cond_51
    const/4 v1, 0x0

    .restart local v1    # "len2":I
    goto :goto_36

    .line 174
    :cond_53
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-eq v3, v5, :cond_5b

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-ne v3, v7, :cond_66

    .line 176
    :cond_5b
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v2

    .restart local v2    # "len3":I
    goto :goto_3f

    .line 178
    .end local v2    # "len3":I
    :cond_66
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-eq v3, v6, :cond_6e

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-ne v3, v8, :cond_7c

    .line 180
    :cond_6e
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v3

    sub-int v4, p1, v0

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v2

    .restart local v2    # "len3":I
    goto :goto_3f

    .line 184
    .end local v2    # "len3":I
    :cond_7c
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "cipher not initialised"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 191
    .restart local v2    # "len3":I
    :cond_84
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-eq v3, v6, :cond_8c

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    if-ne v3, v8, :cond_96

    .line 193
    :cond_8c
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    sub-int/2addr v3, v0

    sub-int/2addr v3, v1

    add-int/2addr v3, v2

    goto :goto_50

    .line 197
    :cond_96
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "IESCipher not initialised"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 4

    .prologue
    .line 114
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    if-nez v1, :cond_19

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    if-eqz v1, :cond_19

    .line 118
    :try_start_8
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    const-string v2, "IES"

    invoke-interface {v1, v2}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createAlgorithmParameters(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 119
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v1, v2}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_19} :catch_1c

    .line 127
    :cond_19
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    return-object v1

    .line 121
    :catch_1c
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public engineInit(ILjava/security/Key;Ljava/security/AlgorithmParameters;Ljava/security/SecureRandom;)V
    .registers 10
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
    .line 231
    const/4 v1, 0x0

    .line 233
    .local v1, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_9

    .line 237
    :try_start_3
    const-class v2, Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {p3, v2}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_8} :catch_f

    move-result-object v1

    .line 245
    :cond_9
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 246
    invoke-virtual {p0, p1, p2, v1, p4}, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 247
    return-void

    .line 239
    :catch_f
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cannot recognise parameters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public engineInit(ILjava/security/Key;Ljava/security/SecureRandom;)V
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
    .line 328
    const/4 v1, 0x0

    :try_start_1
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_6
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_6} :catch_7

    .line 335
    return-void

    .line 330
    :catch_7
    move-exception v0

    .line 332
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "can\'t handle supplied parameter spec"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 8
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "engineSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidAlgorithmParameterException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 258
    if-nez p3, :cond_2a

    .line 260
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/IESUtil;->guessParameterSpec(Lorg/spongycastle/crypto/BufferedBlockCipher;)Lorg/spongycastle/jce/spec/IESParameterSpec;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 272
    .end local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :goto_e
    const/4 v1, 0x1

    if-eq p1, v1, :cond_14

    const/4 v1, 0x3

    if-ne p1, v1, :cond_5f

    .line 274
    :cond_14
    instance-of v1, p2, Ljavax/crypto/interfaces/DHPublicKey;

    if-eqz v1, :cond_3b

    .line 276
    check-cast p2, Ljava/security/PublicKey;

    .end local p2    # "key":Ljava/security/Key;
    invoke-static {p2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 313
    :goto_20
    iput-object p4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->random:Ljava/security/SecureRandom;

    .line 314
    iput p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->state:I

    .line 315
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 317
    return-void

    .line 262
    .restart local p2    # "key":Ljava/security/Key;
    .restart local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_2a
    instance-of v1, p3, Lorg/spongycastle/jce/spec/IESParameterSpec;

    if-eqz v1, :cond_33

    .line 264
    check-cast p3, Lorg/spongycastle/jce/spec/IESParameterSpec;

    .end local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    goto :goto_e

    .line 268
    .restart local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_33
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    const-string v2, "must be passed IES parameters"

    invoke-direct {v1, v2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 278
    .end local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_3b
    instance-of v1, p2, Lorg/spongycastle/jce/interfaces/IESKey;

    if-eqz v1, :cond_57

    move-object v0, p2

    .line 280
    check-cast v0, Lorg/spongycastle/jce/interfaces/IESKey;

    .line 282
    .local v0, "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPublic()Ljava/security/PublicKey;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 283
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    goto :goto_20

    .line 287
    .end local v0    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    :cond_57
    new-instance v1, Ljava/security/InvalidKeyException;

    const-string v2, "must be passed recipient\'s public DH key for encryption"

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 290
    :cond_5f
    const/4 v1, 0x2

    if-eq p1, v1, :cond_65

    const/4 v1, 0x4

    if-ne p1, v1, :cond_96

    .line 292
    :cond_65
    instance-of v1, p2, Ljavax/crypto/interfaces/DHPrivateKey;

    if-eqz v1, :cond_72

    .line 294
    check-cast p2, Ljava/security/PrivateKey;

    .end local p2    # "key":Ljava/security/Key;
    invoke-static {p2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    goto :goto_20

    .line 296
    .restart local p2    # "key":Ljava/security/Key;
    :cond_72
    instance-of v1, p2, Lorg/spongycastle/jce/interfaces/IESKey;

    if-eqz v1, :cond_8e

    move-object v0, p2

    .line 298
    check-cast v0, Lorg/spongycastle/jce/interfaces/IESKey;

    .line 300
    .restart local v0    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPublic()Ljava/security/PublicKey;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 301
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/DHUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    goto :goto_20

    .line 305
    .end local v0    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    :cond_8e
    new-instance v1, Ljava/security/InvalidKeyException;

    const-string v2, "must be passed recipient\'s private DH key for decryption"

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 310
    :cond_96
    new-instance v1, Ljava/security/InvalidKeyException;

    const-string v2, "must be passed EC key"

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public engineSetMode(Ljava/lang/String;)V
    .registers 6
    .param p1, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "modeName":Ljava/lang/String;
    const-string v1, "NONE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 138
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->dhaesMode:Z

    .line 148
    :goto_f
    return-void

    .line 140
    :cond_10
    const-string v1, "DHAES"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 142
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->dhaesMode:Z

    goto :goto_f

    .line 146
    :cond_1c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t support mode "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public engineSetPadding(Ljava/lang/String;)V
    .registers 5
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "paddingName":Ljava/lang/String;
    const-string v1, "NOPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 220
    :cond_c
    return-void

    .line 212
    :cond_d
    const-string v1, "PKCS5PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    const-string v1, "PKCS7PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 218
    new-instance v1, Ljavax/crypto/NoSuchPaddingException;

    const-string v2, "padding not available with IESCipher"

    invoke-direct {v1, v2}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public engineUpdate([BII[BI)I
    .registers 7
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I

    .prologue
    .line 357
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 358
    const/4 v0, 0x0

    return v0
.end method

.method public engineUpdate([BII)[B
    .registers 5
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 345
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 346
    const/4 v0, 0x0

    return-object v0
.end method
