.class public Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;
.super Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseAlgorithmParameterGeneratorSpi;
.source "AlgorithmParameterGeneratorSpi.java"


# instance fields
.field protected params:Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;

.field protected random:Ljava/security/SecureRandom;

.field protected strength:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/BaseAlgorithmParameterGeneratorSpi;-><init>()V

    .line 20
    const/16 v0, 0x400

    iput v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->strength:I

    return-void
.end method


# virtual methods
.method protected engineGenerateParameters()Ljava/security/AlgorithmParameters;
    .registers 10

    .prologue
    const/16 v8, 0x50

    const/16 v7, 0x400

    .line 58
    iget v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->strength:I

    if-gt v4, v7, :cond_4b

    .line 60
    new-instance v2, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;

    invoke-direct {v2}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;-><init>()V

    .line 67
    .local v2, "pGen":Lorg/spongycastle/crypto/generators/DSAParametersGenerator;
    :goto_d
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->random:Ljava/security/SecureRandom;

    if-nez v4, :cond_18

    .line 69
    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->random:Ljava/security/SecureRandom;

    .line 72
    :cond_18
    iget v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->strength:I

    if-ne v4, v7, :cond_56

    .line 74
    new-instance v4, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;

    const/16 v5, 0xa0

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->random:Ljava/security/SecureRandom;

    invoke-direct {v4, v7, v5, v8, v6}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;-><init>(IIILjava/security/SecureRandom;)V

    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->params:Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;

    .line 75
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->params:Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;

    invoke-virtual {v2, v4}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->init(Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;)V

    .line 87
    :goto_2c
    invoke-virtual {v2}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->generateParameters()Lorg/spongycastle/crypto/params/DSAParameters;

    move-result-object v1

    .line 93
    .local v1, "p":Lorg/spongycastle/crypto/params/DSAParameters;
    :try_start_30
    const-string v4, "DSA"

    invoke-virtual {p0, v4}, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->createParametersInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v3

    .line 94
    .local v3, "params":Ljava/security/AlgorithmParameters;
    new-instance v4, Ljava/security/spec/DSAParameterSpec;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/DSAParameters;->getP()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/DSAParameters;->getQ()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/DSAParameters;->getG()Ljava/math/BigInteger;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Ljava/security/spec/DSAParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-virtual {v3, v4}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_4a} :catch_77

    .line 101
    return-object v3

    .line 64
    .end local v1    # "p":Lorg/spongycastle/crypto/params/DSAParameters;
    .end local v2    # "pGen":Lorg/spongycastle/crypto/generators/DSAParametersGenerator;
    .end local v3    # "params":Ljava/security/AlgorithmParameters;
    :cond_4b
    new-instance v2, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;

    new-instance v4, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v4}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    invoke-direct {v2, v4}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .restart local v2    # "pGen":Lorg/spongycastle/crypto/generators/DSAParametersGenerator;
    goto :goto_d

    .line 77
    :cond_56
    iget v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->strength:I

    if-le v4, v7, :cond_6d

    .line 79
    new-instance v4, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;

    iget v5, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->strength:I

    const/16 v6, 0x100

    iget-object v7, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->random:Ljava/security/SecureRandom;

    invoke-direct {v4, v5, v6, v8, v7}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;-><init>(IIILjava/security/SecureRandom;)V

    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->params:Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;

    .line 80
    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->params:Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;

    invoke-virtual {v2, v4}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->init(Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;)V

    goto :goto_2c

    .line 84
    :cond_6d
    iget v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->strength:I

    const/16 v5, 0x14

    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->random:Ljava/security/SecureRandom;

    invoke-virtual {v2, v4, v5, v6}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->init(IILjava/security/SecureRandom;)V

    goto :goto_2c

    .line 96
    .restart local v1    # "p":Lorg/spongycastle/crypto/params/DSAParameters;
    :catch_77
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected engineInit(ILjava/security/SecureRandom;)V
    .registers 5
    .param p1, "strength"    # I
    .param p2, "random"    # Ljava/security/SecureRandom;

    .prologue
    const/16 v1, 0x400

    .line 27
    const/16 v0, 0x200

    if-lt p1, v0, :cond_a

    const/16 v0, 0xc00

    if-le p1, v0, :cond_12

    .line 29
    :cond_a
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "strength must be from 512 - 3072"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_12
    if-gt p1, v1, :cond_20

    rem-int/lit8 v0, p1, 0x40

    if-eqz v0, :cond_20

    .line 34
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "strength must be a multiple of 64 below 1024 bits."

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_20
    if-le p1, v1, :cond_2e

    rem-int/lit16 v0, p1, 0x400

    if-eqz v0, :cond_2e

    .line 39
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "strength must be a multiple of 1024 above 1024 bits."

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_2e
    iput p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->strength:I

    .line 43
    iput-object p2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParameterGeneratorSpi;->random:Ljava/security/SecureRandom;

    .line 44
    return-void
.end method

.method protected engineInit(Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 5
    .param p1, "genParamSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 51
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    const-string v1, "No supported AlgorithmParameterSpec for DSA parameter generation."

    invoke-direct {v0, v1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
