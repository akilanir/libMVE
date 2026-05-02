.class public Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;
.super Lch/boye/httpclientandroidlib/conn/ssl/SSLSocketFactory;
.source "StrongSSLSocketFactory.java"

# interfaces
.implements Lch/boye/httpclientandroidlib/conn/scheme/LayeredSchemeSocketFactory;


# static fields
.field public static final SSL:Ljava/lang/String; = "SSL"

.field public static final SSLV2:Ljava/lang/String; = "SSLv2"

.field public static final TLS:Ljava/lang/String; = "TLS"


# instance fields
.field private mCipherSuites:[Ljava/lang/String;

.field private mEnableStongerDefaultProtocalVersion:Z

.field private mEnableStongerDefaultSSLCipherSuite:Z

.field private mFactory:Ljavax/net/ssl/SSLSocketFactory;

.field private mProtocols:[Ljava/lang/String;

.field private mProxy:Ljava/net/Proxy;


# direct methods
.method public constructor <init>(Landroid/content/Context;[Ljavax/net/ssl/TrustManager;Ljava/security/KeyStore;Ljava/lang/String;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "trustManagers"    # [Ljavax/net/ssl/TrustManager;
    .param p3, "keyStore"    # Ljava/security/KeyStore;
    .param p4, "keyStorePassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyManagementException;,
            Ljava/security/UnrecoverableKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/cert/CertificateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 58
    invoke-direct {p0, p3}, Lch/boye/httpclientandroidlib/conn/ssl/SSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 34
    iput-object v3, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 36
    iput-object v3, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mProxy:Ljava/net/Proxy;

    .line 47
    iput-boolean v2, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultSSLCipherSuite:Z

    .line 48
    iput-boolean v2, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultProtocalVersion:Z

    .line 60
    const-string v2, "TLS"

    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 61
    .local v1, "sslContext":Ljavax/net/ssl/SSLContext;
    invoke-direct {p0, p3, p4}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->createKeyManagers(Ljava/security/KeyStore;Ljava/lang/String;)[Ljavax/net/ssl/KeyManager;

    move-result-object v0

    .line 64
    .local v0, "km":[Ljavax/net/ssl/KeyManager;
    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v0, p2, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 66
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    iput-object v2, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 68
    return-void
.end method

.method private createKeyManagers(Ljava/security/KeyStore;Ljava/lang/String;)[Ljavax/net/ssl/KeyManager;
    .registers 6
    .param p1, "keystore"    # Ljava/security/KeyStore;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    .line 93
    if-nez p1, :cond_a

    .line 94
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Keystore may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_a
    invoke-static {}, Ljavax/net/ssl/KeyManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v0

    .line 98
    .local v0, "kmfactory":Ljavax/net/ssl/KeyManagerFactory;
    if-eqz p2, :cond_20

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    :goto_18
    invoke-virtual {v0, p1, v1}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 100
    invoke-virtual {v0}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object v1

    return-object v1

    .line 98
    :cond_20
    const/4 v1, 0x0

    goto :goto_18
.end method

.method private enableStrongerDefaults(Ljava/net/Socket;)V
    .registers 4
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 127
    invoke-virtual {p0, p1}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v1

    if-eqz v1, :cond_26

    move-object v0, p1

    .line 128
    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 129
    .local v0, "sslSocket":Ljavax/net/ssl/SSLSocket;
    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->readSSLParameters(Ljavax/net/ssl/SSLSocket;)V

    .line 131
    iget-boolean v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultProtocalVersion:Z

    if-eqz v1, :cond_19

    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mProtocols:[Ljava/lang/String;

    if-eqz v1, :cond_19

    .line 132
    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mProtocols:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 135
    :cond_19
    iget-boolean v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultSSLCipherSuite:Z

    if-eqz v1, :cond_26

    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mCipherSuites:[Ljava/lang/String;

    if-eqz v1, :cond_26

    .line 136
    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mCipherSuites:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 139
    .end local v0    # "sslSocket":Ljavax/net/ssl/SSLSocket;
    :cond_26
    return-void
.end method

.method private readSSLParameters(Ljavax/net/ssl/SSLSocket;)V
    .registers 12
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 71
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v6, "protocolsToEnable":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    .line 73
    .local v8, "supportedProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Linfo/guardianproject/netcipher/client/StrongConstants;->ENABLED_PROTOCOLS:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_11
    if-ge v4, v5, :cond_21

    aget-object v3, v0, v4

    .line 74
    .local v3, "enabledProtocol":Ljava/lang/String;
    invoke-interface {v8, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1e

    .line 75
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_1e
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 78
    .end local v3    # "enabledProtocol":Ljava/lang/String;
    :cond_21
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v6, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    iput-object v9, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mProtocols:[Ljava/lang/String;

    .line 80
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v1, "cipherSuitesToEnable":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 82
    .local v7, "supportedCipherSuites":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Linfo/guardianproject/netcipher/client/StrongConstants;->ENABLED_CIPHERS:[Ljava/lang/String;

    array-length v5, v0

    const/4 v4, 0x0

    :goto_40
    if-ge v4, v5, :cond_50

    aget-object v2, v0, v4

    .line 83
    .local v2, "enabledCipherSuite":Ljava/lang/String;
    invoke-interface {v7, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 84
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_4d
    add-int/lit8 v4, v4, 0x1

    goto :goto_40

    .line 87
    .end local v2    # "enabledCipherSuite":Ljava/lang/String;
    :cond_50
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v1, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    iput-object v9, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mCipherSuites:[Ljava/lang/String;

    .line 88
    return-void
.end method


# virtual methods
.method public createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "arg0"    # Ljava/net/Socket;
    .param p2, "arg1"    # Ljava/lang/String;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mFactory:Ljavax/net/ssl/SSLSocketFactory;

    check-cast v0, Lch/boye/httpclientandroidlib/conn/scheme/LayeredSchemeSocketFactory;

    invoke-interface {v0, p1, p2, p3, p4}, Lch/boye/httpclientandroidlib/conn/scheme/LayeredSchemeSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket()Ljava/net/Socket;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    .line 106
    .local v0, "newSocket":Ljava/net/Socket;
    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->enableStrongerDefaults(Ljava/net/Socket;)V

    .line 107
    return-object v0
.end method

.method public createSocket(Lch/boye/httpclientandroidlib/params/HttpParams;)Ljava/net/Socket;
    .registers 4
    .param p1, "httpParams"    # Lch/boye/httpclientandroidlib/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    .line 174
    .local v0, "newSocket":Ljava/net/Socket;
    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->enableStrongerDefaults(Ljava/net/Socket;)V

    .line 176
    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v1, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    .line 116
    .local v0, "newSocket":Ljava/net/Socket;
    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->enableStrongerDefaults(Ljava/net/Socket;)V

    .line 118
    return-object v0
.end method

.method public getProxy()Ljava/net/Proxy;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mProxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public isEnableStongerDefaultProtocalVersion()Z
    .registers 2

    .prologue
    .line 163
    iget-boolean v0, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultProtocalVersion:Z

    return v0
.end method

.method public isEnableStongerDefaultSSLCipherSuite()Z
    .registers 2

    .prologue
    .line 155
    iget-boolean v0, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultSSLCipherSuite:Z

    return v0
.end method

.method public isSecure(Ljava/net/Socket;)Z
    .registers 3
    .param p1, "sock"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 143
    instance-of v0, p1, Ljavax/net/ssl/SSLSocket;

    return v0
.end method

.method public setEnableStongerDefaultProtocalVersion(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 167
    iput-boolean p1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultProtocalVersion:Z

    .line 168
    return-void
.end method

.method public setEnableStongerDefaultSSLCipherSuite(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 159
    iput-boolean p1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mEnableStongerDefaultSSLCipherSuite:Z

    .line 160
    return-void
.end method

.method public setProxy(Ljava/net/Proxy;)V
    .registers 2
    .param p1, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 147
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/StrongSSLSocketFactory;->mProxy:Ljava/net/Proxy;

    .line 148
    return-void
.end method
