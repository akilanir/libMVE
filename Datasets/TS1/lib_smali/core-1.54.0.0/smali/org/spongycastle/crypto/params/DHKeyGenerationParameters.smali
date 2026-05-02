.class public Lorg/spongycastle/crypto/params/DHKeyGenerationParameters;
.super Lorg/spongycastle/crypto/KeyGenerationParameters;
.source "DHKeyGenerationParameters.java"


# instance fields
.field private params:Lorg/spongycastle/crypto/params/DHParameters;


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/params/DHParameters;)V
    .registers 4
    .param p1, "random"    # Ljava/security/SecureRandom;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/DHParameters;

    .prologue
    .line 16
    invoke-static {p2}, Lorg/spongycastle/crypto/params/DHKeyGenerationParameters;->getStrength(Lorg/spongycastle/crypto/params/DHParameters;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    .line 18
    iput-object p2, p0, Lorg/spongycastle/crypto/params/DHKeyGenerationParameters;->params:Lorg/spongycastle/crypto/params/DHParameters;

    .line 19
    return-void
.end method

.method static getStrength(Lorg/spongycastle/crypto/params/DHParameters;)I
    .registers 2
    .param p0, "params"    # Lorg/spongycastle/crypto/params/DHParameters;

    .prologue
    .line 28
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/DHParameters;->getL()I

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/DHParameters;->getL()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/DHParameters;->getP()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    goto :goto_a
.end method


# virtual methods
.method public getParameters()Lorg/spongycastle/crypto/params/DHParameters;
    .registers 2

    .prologue
    .line 23
    iget-object v0, p0, Lorg/spongycastle/crypto/params/DHKeyGenerationParameters;->params:Lorg/spongycastle/crypto/params/DHParameters;

    return-object v0
.end method
