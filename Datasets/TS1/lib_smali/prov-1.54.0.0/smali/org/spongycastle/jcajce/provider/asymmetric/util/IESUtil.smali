.class public Lorg/spongycastle/jcajce/provider/asymmetric/util/IESUtil;
.super Ljava/lang/Object;
.source "IESUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static guessParameterSpec(Lorg/spongycastle/crypto/BufferedBlockCipher;)Lorg/spongycastle/jce/spec/IESParameterSpec;
    .registers 9
    .param p0, "iesBlockCipher"    # Lorg/spongycastle/crypto/BufferedBlockCipher;

    .prologue
    const/16 v7, 0x100

    const/16 v6, 0x50

    const/16 v5, 0x40

    const/16 v4, 0x80

    const/4 v3, 0x0

    .line 11
    if-nez p0, :cond_11

    .line 13
    new-instance v1, Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-direct {v1, v3, v3, v4}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BI)V

    .line 35
    :goto_10
    return-object v1

    .line 17
    :cond_11
    invoke-virtual {p0}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v0

    .line 19
    .local v0, "underlyingCipher":Lorg/spongycastle/crypto/BlockCipher;
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "DES"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_45

    .line 20
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "RC2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_45

    .line 21
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "RC5-32"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_45

    .line 22
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "RC5-64"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 24
    :cond_45
    new-instance v1, Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-direct {v1, v3, v3, v5, v5}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BII)V

    goto :goto_10

    .line 26
    :cond_4b
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SKIPJACK"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5d

    .line 28
    new-instance v1, Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-direct {v1, v3, v3, v6, v6}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BII)V

    goto :goto_10

    .line 30
    :cond_5d
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GOST28147"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 32
    new-instance v1, Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-direct {v1, v3, v3, v7, v7}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BII)V

    goto :goto_10

    .line 35
    :cond_6f
    new-instance v1, Lorg/spongycastle/jce/spec/IESParameterSpec;

    invoke-direct {v1, v3, v3, v4, v4}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BII)V

    goto :goto_10
.end method
