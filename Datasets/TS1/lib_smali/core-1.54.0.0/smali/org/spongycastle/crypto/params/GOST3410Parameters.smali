.class public Lorg/spongycastle/crypto/params/GOST3410Parameters;
.super Ljava/lang/Object;
.source "GOST3410Parameters.java"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;


# instance fields
.field private a:Ljava/math/BigInteger;

.field private p:Ljava/math/BigInteger;

.field private q:Ljava/math/BigInteger;

.field private validation:Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "p"    # Ljava/math/BigInteger;
    .param p2, "q"    # Ljava/math/BigInteger;
    .param p3, "a"    # Ljava/math/BigInteger;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->p:Ljava/math/BigInteger;

    .line 21
    iput-object p2, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->q:Ljava/math/BigInteger;

    .line 22
    iput-object p3, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->a:Ljava/math/BigInteger;

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;)V
    .registers 5
    .param p1, "p"    # Ljava/math/BigInteger;
    .param p2, "q"    # Ljava/math/BigInteger;
    .param p3, "a"    # Ljava/math/BigInteger;
    .param p4, "params"    # Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p3, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->a:Ljava/math/BigInteger;

    .line 32
    iput-object p1, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->p:Ljava/math/BigInteger;

    .line 33
    iput-object p2, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->q:Ljava/math/BigInteger;

    .line 34
    iput-object p4, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->validation:Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 65
    instance-of v2, p1, Lorg/spongycastle/crypto/params/GOST3410Parameters;

    if-nez v2, :cond_6

    .line 72
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 70
    check-cast v0, Lorg/spongycastle/crypto/params/GOST3410Parameters;

    .line 72
    .local v0, "pm":Lorg/spongycastle/crypto/params/GOST3410Parameters;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/GOST3410Parameters;->getP()Ljava/math/BigInteger;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->p:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/GOST3410Parameters;->getQ()Ljava/math/BigInteger;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->q:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/GOST3410Parameters;->getA()Ljava/math/BigInteger;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->a:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getA()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->a:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getP()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->p:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getQ()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->q:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getValidationParameters()Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->validation:Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 59
    iget-object v0, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->p:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->q:Ljava/math/BigInteger;

    invoke-virtual {v1}, Ljava/math/BigInteger;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/crypto/params/GOST3410Parameters;->a:Ljava/math/BigInteger;

    invoke-virtual {v1}, Ljava/math/BigInteger;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
