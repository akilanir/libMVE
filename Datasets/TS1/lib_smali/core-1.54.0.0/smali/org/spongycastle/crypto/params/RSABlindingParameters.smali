.class public Lorg/spongycastle/crypto/params/RSABlindingParameters;
.super Ljava/lang/Object;
.source "RSABlindingParameters.java"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field private blindingFactor:Ljava/math/BigInteger;

.field private publicKey:Lorg/spongycastle/crypto/params/RSAKeyParameters;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/params/RSAKeyParameters;Ljava/math/BigInteger;)V
    .registers 5
    .param p1, "publicKey"    # Lorg/spongycastle/crypto/params/RSAKeyParameters;
    .param p2, "blindingFactor"    # Ljava/math/BigInteger;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    instance-of v0, p1, Lorg/spongycastle/crypto/params/RSAPrivateCrtKeyParameters;

    if-eqz v0, :cond_f

    .line 19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "RSA parameters should be for a public key"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_f
    iput-object p1, p0, Lorg/spongycastle/crypto/params/RSABlindingParameters;->publicKey:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 23
    iput-object p2, p0, Lorg/spongycastle/crypto/params/RSABlindingParameters;->blindingFactor:Ljava/math/BigInteger;

    .line 24
    return-void
.end method


# virtual methods
.method public getBlindingFactor()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lorg/spongycastle/crypto/params/RSABlindingParameters;->blindingFactor:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getPublicKey()Lorg/spongycastle/crypto/params/RSAKeyParameters;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lorg/spongycastle/crypto/params/RSABlindingParameters;->publicKey:Lorg/spongycastle/crypto/params/RSAKeyParameters;

    return-object v0
.end method
