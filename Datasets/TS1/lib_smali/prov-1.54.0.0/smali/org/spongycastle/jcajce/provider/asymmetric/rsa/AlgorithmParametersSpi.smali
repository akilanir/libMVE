.class public abstract Lorg/spongycastle/jcajce/provider/asymmetric/rsa/AlgorithmParametersSpi;
.super Ljava/security/AlgorithmParametersSpi;
.source "AlgorithmParametersSpi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/AlgorithmParametersSpi$PSS;,
        Lorg/spongycastle/jcajce/provider/asymmetric/rsa/AlgorithmParametersSpi$OAEP;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/security/AlgorithmParametersSpi;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 4
    .param p1, "paramSpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 35
    if-nez p1, :cond_a

    .line 37
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "argument to getParameterSpec must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_a
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/AlgorithmParametersSpi;->localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;

    move-result-object v0

    return-object v0
.end method

.method protected isASN1FormatString(Ljava/lang/String;)Z
    .registers 3
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 28
    if-eqz p1, :cond_a

    const-string v0, "ASN.1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected abstract localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation
.end method
