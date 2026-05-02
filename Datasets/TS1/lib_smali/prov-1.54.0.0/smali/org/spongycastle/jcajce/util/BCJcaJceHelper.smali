.class public Lorg/spongycastle/jcajce/util/BCJcaJceHelper;
.super Lorg/spongycastle/jcajce/util/ProviderJcaJceHelper;
.source "BCJcaJceHelper.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-static {}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;->getBouncyCastleProvider()Ljava/security/Provider;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/jcajce/util/ProviderJcaJceHelper;-><init>(Ljava/security/Provider;)V

    .line 29
    return-void
.end method

.method private static getBouncyCastleProvider()Ljava/security/Provider;
    .registers 1

    .prologue
    .line 16
    const-string v0, "SC"

    invoke-static {v0}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 18
    const-string v0, "SC"

    invoke-static {v0}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v0

    .line 22
    :goto_e
    return-object v0

    :cond_f
    new-instance v0, Lorg/spongycastle/jce/provider/BouncyCastleProvider;

    invoke-direct {v0}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;-><init>()V

    goto :goto_e
.end method
