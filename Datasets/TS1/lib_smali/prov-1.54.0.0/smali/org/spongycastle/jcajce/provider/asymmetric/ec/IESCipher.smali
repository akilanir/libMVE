.class public Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;
.super Ljavax/crypto/CipherSpi;
.source "IESCipher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithAESCBC;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithDESedeCBC;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithAES;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithDESede;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithCipher;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIES;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithAESCBC;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithDESedeCBC;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithAES;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithDESede;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithCipher;,
        Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIES;
    }
.end annotation


# instance fields
.field private buffer:Ljava/io/ByteArrayOutputStream;

.field private dhaesMode:Z

.field private engine:Lorg/spongycastle/crypto/engines/IESEngine;

.field private engineParam:Ljava/security/AlgorithmParameters;

.field private engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

.field private ivLength:I

.field private key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

.field private otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

.field private random:Ljava/security/SecureRandom;

.field private state:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/engines/IESEngine;)V
    .registers 5
    .param p1, "engine"    # Lorg/spongycastle/crypto/engines/IESEngine;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 58
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    .line 63
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 64
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 65
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 68
    iput-boolean v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->dhaesMode:Z

    .line 69
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 73
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    .line 74
    iput v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->ivLength:I

    .line 75
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/engines/IESEngine;I)V
    .registers 5
    .param p1, "engine"    # Lorg/spongycastle/crypto/engines/IESEngine;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 58
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    .line 63
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 64
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 65
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->dhaesMode:Z

    .line 69
    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 79
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    .line 80
    iput p2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->ivLength:I

    .line 81
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
    .line 493
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineDoFinal([BII)[B

    move-result-object v0

    .line 494
    .local v0, "buf":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, p4, p5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 495
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
    .line 392
    if-eqz p3, :cond_7

    .line 394
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v8, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 397
    :cond_7
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 398
    .local v3, "in":[B
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 401
    new-instance v5, Lorg/spongycastle/crypto/params/IESWithCipherParameters;

    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v8}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getDerivationV()[B

    move-result-object v8

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 402
    invoke-virtual {v9}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getEncodingV()[B

    move-result-object v9

    iget-object v10, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 403
    invoke-virtual {v10}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getMacKeySize()I

    move-result v10

    iget-object v11, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 404
    invoke-virtual {v11}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getCipherKeySize()I

    move-result v11

    invoke-direct {v5, v8, v9, v10, v11}, Lorg/spongycastle/crypto/params/IESWithCipherParameters;-><init>([B[BII)V

    .line 406
    .local v5, "params":Lorg/spongycastle/crypto/CipherParameters;
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v8}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getNonce()[B

    move-result-object v8

    if-eqz v8, :cond_43

    .line 408
    new-instance v6, Lorg/spongycastle/crypto/params/ParametersWithIV;

    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v8}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getNonce()[B

    move-result-object v8

    invoke-direct {v6, v5, v8}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v5    # "params":Lorg/spongycastle/crypto/CipherParameters;
    .local v6, "params":Lorg/spongycastle/crypto/CipherParameters;
    move-object v5, v6

    .line 411
    .end local v6    # "params":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v5    # "params":Lorg/spongycastle/crypto/CipherParameters;
    :cond_43
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    check-cast v8, Lorg/spongycastle/crypto/params/ECKeyParameters;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/params/ECKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v1

    .line 415
    .local v1, "ecParams":Lorg/spongycastle/crypto/params/ECDomainParameters;
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    if-eqz v8, :cond_82

    .line 419
    :try_start_4f
    iget v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    const/4 v9, 0x1

    if-eq v8, v9, :cond_59

    iget v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    const/4 v9, 0x3

    if-ne v8, v9, :cond_6c

    .line 421
    :cond_59
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v9, 0x1

    iget-object v10, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    iget-object v11, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-virtual {v8, v9, v10, v11, v5}, Lorg/spongycastle/crypto/engines/IESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V

    .line 427
    :goto_63
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v9, 0x0

    array-length v10, v3

    invoke-virtual {v8, v3, v9, v10}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B

    move-result-object v8

    .line 470
    :goto_6b
    return-object v8

    .line 425
    :cond_6c
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v9, 0x0

    iget-object v10, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    iget-object v11, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-virtual {v8, v9, v10, v11, v5}, Lorg/spongycastle/crypto/engines/IESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_76} :catch_77

    goto :goto_63

    .line 429
    :catch_77
    move-exception v0

    .line 431
    .local v0, "e":Ljava/lang/Exception;
    new-instance v8, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 435
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_82
    iget v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    const/4 v9, 0x1

    if-eq v8, v9, :cond_8c

    iget v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    const/4 v9, 0x3

    if-ne v8, v9, :cond_c6

    .line 438
    :cond_8c
    new-instance v2, Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;

    invoke-direct {v2}, Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;-><init>()V

    .line 439
    .local v2, "gen":Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;
    new-instance v8, Lorg/spongycastle/crypto/params/ECKeyGenerationParameters;

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->random:Ljava/security/SecureRandom;

    invoke-direct {v8, v1, v9}, Lorg/spongycastle/crypto/params/ECKeyGenerationParameters;-><init>(Lorg/spongycastle/crypto/params/ECDomainParameters;Ljava/security/SecureRandom;)V

    invoke-virtual {v2, v8}, Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;->init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 441
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v8}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getPointCompression()Z

    move-result v7

    .line 442
    .local v7, "usePointCompression":Z
    new-instance v4, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;

    new-instance v8, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$1;

    invoke-direct {v8, p0, v7}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$1;-><init>(Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;Z)V

    invoke-direct {v4, v2, v8}, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;-><init>(Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;Lorg/spongycastle/crypto/KeyEncoder;)V

    .line 453
    .local v4, "kGen":Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;
    :try_start_ab
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    invoke-virtual {v8, v9, v5, v4}, Lorg/spongycastle/crypto/engines/IESEngine;->init(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;)V

    .line 455
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v9, 0x0

    array-length v10, v3

    invoke-virtual {v8, v3, v9, v10}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_ab .. :try_end_b9} :catch_bb

    move-result-object v8

    goto :goto_6b

    .line 457
    :catch_bb
    move-exception v0

    .line 459
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v8, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 463
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "gen":Lorg/spongycastle/crypto/generators/ECKeyPairGenerator;
    .end local v4    # "kGen":Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;
    .end local v7    # "usePointCompression":Z
    :cond_c6
    iget v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    const/4 v9, 0x2

    if-eq v8, v9, :cond_d0

    iget v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    const/4 v9, 0x4

    if-ne v8, v9, :cond_f0

    .line 468
    :cond_d0
    :try_start_d0
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    new-instance v10, Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;

    invoke-direct {v10, v1}, Lorg/spongycastle/crypto/parsers/ECIESPublicKeyParser;-><init>(Lorg/spongycastle/crypto/params/ECDomainParameters;)V

    invoke-virtual {v8, v9, v5, v10}, Lorg/spongycastle/crypto/engines/IESEngine;->init(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/KeyParser;)V

    .line 470
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    const/4 v9, 0x0

    array-length v10, v3

    invoke-virtual {v8, v3, v9, v10}, Lorg/spongycastle/crypto/engines/IESEngine;->processBlock([BII)[B
    :try_end_e3
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_d0 .. :try_end_e3} :catch_e5

    move-result-object v8

    goto :goto_6b

    .line 472
    :catch_e5
    move-exception v0

    .line 474
    .local v0, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    new-instance v8, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 479
    .end local v0    # "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    :cond_f0
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "cipher not initialised"

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method public engineGetBlockSize()I
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 87
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getBlockSize()I

    move-result v0

    .line 91
    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public engineGetIV()[B
    .registers 2

    .prologue
    .line 111
    const/4 v0, 0x0

    return-object v0
.end method

.method public engineGetKeySize(Ljava/security/Key;)I
    .registers 4
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 98
    instance-of v0, p1, Lorg/spongycastle/jce/interfaces/ECKey;

    if-eqz v0, :cond_13

    .line 100
    check-cast p1, Lorg/spongycastle/jce/interfaces/ECKey;

    .end local p1    # "key":Ljava/security/Key;
    invoke-interface {p1}, Lorg/spongycastle/jce/interfaces/ECKey;->getParameters()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    move-result v0

    return v0

    .line 104
    .restart local p1    # "key":Ljava/security/Key;
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "not an EC key"

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

    .line 157
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    if-nez v3, :cond_10

    .line 159
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "cipher not initialised"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 162
    :cond_10
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getMac()Lorg/spongycastle/crypto/Mac;

    move-result-object v3

    invoke-interface {v3}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    move-result v0

    .line 164
    .local v0, "len1":I
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    if-nez v3, :cond_51

    .line 166
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    check-cast v3, Lorg/spongycastle/crypto/params/ECKeyParameters;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/ECKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    move-result v3

    add-int/lit8 v3, v3, 0x7

    mul-int/lit8 v3, v3, 0x2

    div-int/lit8 v3, v3, 0x8

    add-int/lit8 v1, v3, 0x1

    .line 173
    .local v1, "len2":I
    :goto_36
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v3

    if-nez v3, :cond_53

    .line 175
    move v2, p1

    .line 190
    .local v2, "len3":I
    :goto_3f
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-eq v3, v5, :cond_47

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-ne v3, v7, :cond_84

    .line 192
    :cond_47
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v0

    add-int/2addr v3, v1

    add-int/2addr v3, v2

    .line 196
    :goto_50
    return v3

    .line 170
    .end local v1    # "len2":I
    .end local v2    # "len3":I
    :cond_51
    const/4 v1, 0x0

    .restart local v1    # "len2":I
    goto :goto_36

    .line 177
    :cond_53
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-eq v3, v5, :cond_5b

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-ne v3, v7, :cond_66

    .line 179
    :cond_5b
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v2

    .restart local v2    # "len3":I
    goto :goto_3f

    .line 181
    .end local v2    # "len3":I
    :cond_66
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-eq v3, v6, :cond_6e

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-ne v3, v8, :cond_7c

    .line 183
    :cond_6e
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v3

    sub-int v4, p1, v0

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getOutputSize(I)I

    move-result v2

    .restart local v2    # "len3":I
    goto :goto_3f

    .line 187
    .end local v2    # "len3":I
    :cond_7c
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "cipher not initialised"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 194
    .restart local v2    # "len3":I
    :cond_84
    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-eq v3, v6, :cond_8c

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    if-ne v3, v8, :cond_96

    .line 196
    :cond_8c
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    sub-int/2addr v3, v0

    sub-int/2addr v3, v1

    add-int/2addr v3, v2

    goto :goto_50

    .line 200
    :cond_96
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "cipher not initialised"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 4

    .prologue
    .line 116
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    if-nez v1, :cond_19

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    if-eqz v1, :cond_19

    .line 120
    :try_start_8
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    const-string v2, "IES"

    invoke-interface {v1, v2}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createAlgorithmParameters(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 121
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v1, v2}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_19} :catch_1c

    .line 129
    :cond_19
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    return-object v1

    .line 123
    :catch_1c
    move-exception v0

    .line 125
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
    .line 235
    const/4 v1, 0x0

    .line 237
    .local v1, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_9

    .line 241
    :try_start_3
    const-class v2, Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {p3, v2}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_8} :catch_f

    move-result-object v1

    .line 249
    :cond_9
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineParam:Ljava/security/AlgorithmParameters;

    .line 250
    invoke-virtual {p0, p1, p2, v1, p4}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 252
    return-void

    .line 243
    :catch_f
    move-exception v0

    .line 245
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
    .line 350
    const/4 v1, 0x0

    :try_start_1
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_6
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_6} :catch_7

    .line 357
    return-void

    .line 352
    :catch_7
    move-exception v0

    .line 354
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "can\'t handle supplied parameter spec"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 10
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
    .line 262
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 265
    if-nez p3, :cond_25

    .line 267
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engine:Lorg/spongycastle/crypto/engines/IESEngine;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/engines/IESEngine;->getCipher()Lorg/spongycastle/crypto/BufferedBlockCipher;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/IESUtil;->guessParameterSpec(Lorg/spongycastle/crypto/BufferedBlockCipher;)Lorg/spongycastle/jce/spec/IESParameterSpec;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    .line 278
    .end local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :goto_11
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/IESParameterSpec;->getNonce()[B

    move-result-object v1

    .line 280
    .local v1, "nonce":[B
    if-eqz v1, :cond_5c

    .line 282
    iget v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->ivLength:I

    if-nez v2, :cond_36

    .line 284
    new-instance v2, Ljava/security/InvalidAlgorithmParameterException;

    const-string v3, "NONCE present in IES Parameters when none required"

    invoke-direct {v2, v3}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 269
    .end local v1    # "nonce":[B
    .restart local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_25
    instance-of v2, p3, Lorg/spongycastle/jce/spec/IESParameterSpec;

    if-eqz v2, :cond_2e

    .line 271
    check-cast p3, Lorg/spongycastle/jce/spec/IESParameterSpec;

    .end local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->engineSpec:Lorg/spongycastle/jce/spec/IESParameterSpec;

    goto :goto_11

    .line 275
    .restart local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_2e
    new-instance v2, Ljava/security/InvalidAlgorithmParameterException;

    const-string v3, "must be passed IES parameters"

    invoke-direct {v2, v3}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 286
    .end local p3    # "engineSpec":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v1    # "nonce":[B
    :cond_36
    array-length v2, v1

    iget v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->ivLength:I

    if-eq v2, v3, :cond_5c

    .line 288
    new-instance v2, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NONCE in IES Parameters needs to be "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->ivLength:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes long"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 293
    :cond_5c
    const/4 v2, 0x1

    if-eq p1, v2, :cond_62

    const/4 v2, 0x3

    if-ne p1, v2, :cond_9c

    .line 295
    :cond_62
    instance-of v2, p2, Ljava/security/PublicKey;

    if-eqz v2, :cond_78

    .line 297
    check-cast p2, Ljava/security/PublicKey;

    .end local p2    # "key":Ljava/security/Key;
    invoke-static {p2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 335
    :goto_6e
    iput-object p4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->random:Ljava/security/SecureRandom;

    .line 336
    iput p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->state:I

    .line 337
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 339
    return-void

    .line 299
    .restart local p2    # "key":Ljava/security/Key;
    :cond_78
    instance-of v2, p2, Lorg/spongycastle/jce/interfaces/IESKey;

    if-eqz v2, :cond_94

    move-object v0, p2

    .line 301
    check-cast v0, Lorg/spongycastle/jce/interfaces/IESKey;

    .line 303
    .local v0, "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPublic()Ljava/security/PublicKey;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 304
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    goto :goto_6e

    .line 308
    .end local v0    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    :cond_94
    new-instance v2, Ljava/security/InvalidKeyException;

    const-string v3, "must be passed recipient\'s public EC key for encryption"

    invoke-direct {v2, v3}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 311
    :cond_9c
    const/4 v2, 0x2

    if-eq p1, v2, :cond_a2

    const/4 v2, 0x4

    if-ne p1, v2, :cond_d3

    .line 313
    :cond_a2
    instance-of v2, p2, Ljava/security/PrivateKey;

    if-eqz v2, :cond_af

    .line 315
    check-cast p2, Ljava/security/PrivateKey;

    .end local p2    # "key":Ljava/security/Key;
    invoke-static {p2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    goto :goto_6e

    .line 317
    .restart local p2    # "key":Ljava/security/Key;
    :cond_af
    instance-of v2, p2, Lorg/spongycastle/jce/interfaces/IESKey;

    if-eqz v2, :cond_cb

    move-object v0, p2

    .line 319
    check-cast v0, Lorg/spongycastle/jce/interfaces/IESKey;

    .line 321
    .restart local v0    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPublic()Ljava/security/PublicKey;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePublicKeyParameter(Ljava/security/PublicKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->otherKeyParameter:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 322
    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/IESKey;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->generatePrivateKeyParameter(Ljava/security/PrivateKey;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->key:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    goto :goto_6e

    .line 326
    .end local v0    # "ieKey":Lorg/spongycastle/jce/interfaces/IESKey;
    :cond_cb
    new-instance v2, Ljava/security/InvalidKeyException;

    const-string v3, "must be passed recipient\'s private EC key for decryption"

    invoke-direct {v2, v3}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 331
    :cond_d3
    new-instance v2, Ljava/security/InvalidKeyException;

    const-string v3, "must be passed EC key"

    invoke-direct {v2, v3}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v2
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
    .line 136
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "modeName":Ljava/lang/String;
    const-string v1, "NONE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 140
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->dhaesMode:Z

    .line 150
    :goto_f
    return-void

    .line 142
    :cond_10
    const-string v1, "DHAES"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 144
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->dhaesMode:Z

    goto :goto_f

    .line 148
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
    .line 208
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 211
    .local v0, "paddingName":Ljava/lang/String;
    const-string v1, "NOPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 223
    :cond_c
    return-void

    .line 215
    :cond_d
    const-string v1, "PKCS5PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    const-string v1, "PKCS7PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 221
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
    .line 379
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 380
    const/4 v0, 0x0

    return v0
.end method

.method public engineUpdate([BII)[B
    .registers 5
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 367
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 368
    const/4 v0, 0x0

    return-object v0
.end method
