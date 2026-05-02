.class public Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;
.super Ljava/lang/Object;


# instance fields
.field private algorithm:Ljava/lang/String;

.field private provider:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createSecureRandom()Ljava/security/SecureRandom;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v0

    :goto_12
    return-object v0

    :cond_13
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;
    :try_end_1a
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_1a} :catch_1c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_1a} :catch_3a

    move-result-object v0

    goto :goto_12

    :catch_1c
    move-exception v0

    new-instance v0, Ljava/security/NoSuchProviderException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no such secure random provider: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_3a
    move-exception v0

    new-instance v0, Ljava/security/NoSuchAlgorithmException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no such secure random algorithm: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->getAlgorithm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAlgorithm()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->algorithm:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, "SHA1PRNG"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->algorithm:Ljava/lang/String;

    goto :goto_6
.end method

.method public getProvider()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->provider:Ljava/lang/String;

    return-object v0
.end method

.method public setAlgorithm(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->algorithm:Ljava/lang/String;

    return-void
.end method

.method public setProvider(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->provider:Ljava/lang/String;

    return-void
.end method
