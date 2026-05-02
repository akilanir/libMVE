.class public Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;
.super Ljava/lang/Object;


# instance fields
.field private location:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private provider:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private newKeyStore()Ljava/security/KeyStore;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    :goto_12
    return-object v0

    :cond_13
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    goto :goto_12
.end method


# virtual methods
.method public createKeyStore()Ljava/security/KeyStore;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getLocation()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "location is required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    const/4 v0, 0x0

    :try_start_f
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getLocation()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/LocationUtil;->urlForResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_1a
    .catch Ljava/security/NoSuchProviderException; {:try_start_f .. :try_end_1a} :catch_37
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_f .. :try_end_1a} :catch_5f
    .catch Ljava/io/FileNotFoundException; {:try_start_f .. :try_end_1a} :catch_7d
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_1a} :catch_9b
    .catchall {:try_start_f .. :try_end_1a} :catchall_cd

    move-result-object v0

    :try_start_1b
    invoke-direct {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->newKeyStore()Ljava/security/KeyStore;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_2a
    .catch Ljava/security/NoSuchProviderException; {:try_start_1b .. :try_end_2a} :catch_37
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1b .. :try_end_2a} :catch_5f
    .catch Ljava/io/FileNotFoundException; {:try_start_1b .. :try_end_2a} :catch_7d
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2a} :catch_d2
    .catchall {:try_start_1b .. :try_end_2a} :catchall_55

    if-eqz v0, :cond_2f

    :try_start_2c
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2f} :catch_30

    :cond_2f
    :goto_2f
    return-object v1

    :catch_30
    move-exception v0

    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v2}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_2f

    :catch_37
    move-exception v1

    :try_start_38
    new-instance v1, Ljava/security/NoSuchProviderException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no such keystore provider: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/NoSuchProviderException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_55
    .catchall {:try_start_38 .. :try_end_55} :catchall_55

    :catchall_55
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    :goto_59
    if-eqz v1, :cond_5e

    :try_start_5b
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_c6

    :cond_5e
    :goto_5e
    throw v0

    :catch_5f
    move-exception v1

    :try_start_60
    new-instance v1, Ljava/security/NoSuchAlgorithmException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no such keystore type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v1

    :catch_7d
    move-exception v1

    new-instance v1, Ljava/security/KeyStoreException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getLocation()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": file not found"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_9b
    .catchall {:try_start_60 .. :try_end_9b} :catchall_55

    :catch_9b
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    :goto_9f
    :try_start_9f
    new-instance v2, Ljava/security/KeyStoreException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_c4
    .catchall {:try_start_9f .. :try_end_c4} :catchall_c4

    :catchall_c4
    move-exception v0

    goto :goto_59

    :catch_c6
    move-exception v1

    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v2}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_5e

    :catchall_cd
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_59

    :catch_d2
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_9f
.end method

.method public getLocation()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->location:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->password:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, "changeit"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->password:Ljava/lang/String;

    goto :goto_6
.end method

.method public getProvider()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->provider:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->type:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, "JKS"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->type:Ljava/lang/String;

    goto :goto_6
.end method

.method public setLocation(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->location:Ljava/lang/String;

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->password:Ljava/lang/String;

    return-void
.end method

.method public setProvider(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->provider:Ljava/lang/String;

    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->type:Ljava/lang/String;

    return-void
.end method
