.class public Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;
.super Ljava/lang/Object;


# static fields
.field private static final JSSE_KEY_STORE_PROPERTY:Ljava/lang/String; = "javax.net.ssl.keyStore"

.field private static final JSSE_TRUST_STORE_PROPERTY:Ljava/lang/String; = "javax.net.ssl.trustStore"


# instance fields
.field private keyManagerFactory:Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;

.field private keyStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

.field private protocol:Ljava/lang/String;

.field private provider:Ljava/lang/String;

.field private secureRandom:Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;

.field private trustManagerFactory:Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;

.field private trustStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private createKeyManagers(Lch/qos/logback/core/spi/ContextAware;)[Ljavax/net/ssl/KeyManager;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/UnrecoverableKeyException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getKeyStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getKeyStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->createKeyStore()Ljava/security/KeyStore;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "key store of type \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/security/KeyStore;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' provider \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/security/KeyStore;->getProvider()Ljava/security/Provider;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getKeyStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getLocation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lch/qos/logback/core/spi/ContextAware;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getKeyManagerFactory()Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;

    move-result-object v1

    invoke-virtual {v1}, Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;->createKeyManagerFactory()Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "key manager algorithm \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljavax/net/ssl/KeyManagerFactory;->getAlgorithm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' provider \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljavax/net/ssl/KeyManagerFactory;->getProvider()Ljava/security/Provider;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Lch/qos/logback/core/spi/ContextAware;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getKeyStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    invoke-virtual {v1}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object v0

    goto/16 :goto_7
.end method

.method private createSecureRandom(Lch/qos/logback/core/spi/ContextAware;)Ljava/security/SecureRandom;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getSecureRandom()Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;->createSecureRandom()Ljava/security/SecureRandom;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "secure random algorithm \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/security/SecureRandom;->getAlgorithm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' provider \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/security/SecureRandom;->getProvider()Ljava/security/Provider;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lch/qos/logback/core/spi/ContextAware;->addInfo(Ljava/lang/String;)V

    return-object v0
.end method

.method private createTrustManagers(Lch/qos/logback/core/spi/ContextAware;)[Ljavax/net/ssl/TrustManager;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getTrustStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getTrustStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->createKeyStore()Ljava/security/KeyStore;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "trust store of type \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/security/KeyStore;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' provider \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/security/KeyStore;->getProvider()Ljava/security/Provider;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getTrustStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->getLocation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lch/qos/logback/core/spi/ContextAware;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getTrustManagerFactory()Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;

    move-result-object v1

    invoke-virtual {v1}, Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;->createTrustManagerFactory()Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "trust manager algorithm \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljavax/net/ssl/TrustManagerFactory;->getAlgorithm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' provider \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljavax/net/ssl/TrustManagerFactory;->getProvider()Ljava/security/Provider;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Lch/qos/logback/core/spi/ContextAware;->addInfo(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    invoke-virtual {v1}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    goto :goto_7
.end method

.method private keyStoreFromSystemProperties(Ljava/lang/String;)Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;
    .registers 5

    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    new-instance v0, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    invoke-direct {v0}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;-><init>()V

    invoke-direct {p0, p1}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->locationFromSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->setLocation(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Provider"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->setProvider(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Password"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->setPassword(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;->setType(Ljava/lang/String;)V

    goto :goto_7
.end method

.method private locationFromSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_21

    const-string v1, "file:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_21

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_21
    return-object v0
.end method


# virtual methods
.method public createContext(Lch/qos/logback/core/spi/ContextAware;)Ljavax/net/ssl/SSLContext;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchProviderException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/UnrecoverableKeyException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getProtocol()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    :goto_12
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SSL protocol \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' provider \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getProvider()Ljava/security/Provider;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lch/qos/logback/core/spi/ContextAware;->addInfo(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->createKeyManagers(Lch/qos/logback/core/spi/ContextAware;)[Ljavax/net/ssl/KeyManager;

    move-result-object v1

    invoke-direct {p0, p1}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->createTrustManagers(Lch/qos/logback/core/spi/ContextAware;)[Ljavax/net/ssl/TrustManager;

    move-result-object v2

    invoke-direct {p0, p1}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->createSecureRandom(Lch/qos/logback/core/spi/ContextAware;)Ljava/security/SecureRandom;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    return-object v0

    :cond_50
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->getProtocol()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    goto :goto_12
.end method

.method public getKeyManagerFactory()Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyManagerFactory:Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;

    if-nez v0, :cond_a

    new-instance v0, Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;

    invoke-direct {v0}, Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;-><init>()V

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyManagerFactory:Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;

    goto :goto_9
.end method

.method public getKeyStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    if-nez v0, :cond_c

    const-string v0, "javax.net.ssl.keyStore"

    invoke-direct {p0, v0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyStoreFromSystemProperties(Ljava/lang/String;)Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    :cond_c
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    return-object v0
.end method

.method public getProtocol()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->protocol:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, "SSL"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->protocol:Ljava/lang/String;

    goto :goto_6
.end method

.method public getProvider()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->provider:Ljava/lang/String;

    return-object v0
.end method

.method public getSecureRandom()Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->secureRandom:Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;

    if-nez v0, :cond_a

    new-instance v0, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;

    invoke-direct {v0}, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;-><init>()V

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->secureRandom:Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;

    goto :goto_9
.end method

.method public getTrustManagerFactory()Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->trustManagerFactory:Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;

    if-nez v0, :cond_a

    new-instance v0, Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;

    invoke-direct {v0}, Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;-><init>()V

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->trustManagerFactory:Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;

    goto :goto_9
.end method

.method public getTrustStore()Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->trustStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    if-nez v0, :cond_c

    const-string v0, "javax.net.ssl.trustStore"

    invoke-direct {p0, v0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyStoreFromSystemProperties(Ljava/lang/String;)Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->trustStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    :cond_c
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->trustStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    return-object v0
.end method

.method public setKeyManagerFactory(Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyManagerFactory:Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;

    return-void
.end method

.method public setKeyStore(Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->keyStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    return-void
.end method

.method public setProtocol(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->protocol:Ljava/lang/String;

    return-void
.end method

.method public setProvider(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->provider:Ljava/lang/String;

    return-void
.end method

.method public setSecureRandom(Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->secureRandom:Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;

    return-void
.end method

.method public setTrustManagerFactory(Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->trustManagerFactory:Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;

    return-void
.end method

.method public setTrustStore(Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;->trustStore:Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    return-void
.end method
