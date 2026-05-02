.class public Lorg/acra/util/TlsSniSocketFactory;
.super Ljava/lang/Object;
.source "TlsSniSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/LayeredSocketFactory;


# static fields
.field private static final ALLOWED_CIPHERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String;

.field private static final VERSION_CODES_JELLY_BEAN_MR1:I = 0x11

.field private static final VERSION_CODES_LOLLIPOP:I = 0x15

.field private static final hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field private final sslSocketFactory:Landroid/net/SSLCertificateSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 48
    const-class v0, Lorg/acra/util/TlsSniSocketFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/acra/util/TlsSniSocketFactory;->TAG:Ljava/lang/String;

    .line 56
    new-instance v0, Lorg/apache/http/conn/ssl/BrowserCompatHostnameVerifier;

    invoke-direct {v0}, Lorg/apache/http/conn/ssl/BrowserCompatHostnameVerifier;-><init>()V

    sput-object v0, Lorg/acra/util/TlsSniSocketFactory;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 58
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "TLS_RSA_WITH_AES_256_GCM_SHA384"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "TLS_RSA_WITH_AES_128_GCM_SHA256"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "TLS_ECHDE_RSA_WITH_AES_128_GCM_SHA256"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "TLS_RSA_WITH_3DES_EDE_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "TLS_RSA_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "TLS_RSA_WITH_AES_256_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/acra/util/TlsSniSocketFactory;->ALLOWED_CIPHERS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/net/SSLCertificateSocketFactory;->getDefault(I)Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Landroid/net/SSLCertificateSocketFactory;

    iput-object v0, p0, Lorg/acra/util/TlsSniSocketFactory;->sslSocketFactory:Landroid/net/SSLCertificateSocketFactory;

    return-void
.end method

.method private establishAndVerify(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V
    .registers 8
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-direct {p0, p1}, Lorg/acra/util/TlsSniSocketFactory;->setTlsParameters(Ljavax/net/ssl/SSLSocket;)V

    .line 127
    invoke-direct {p0, p1, p2}, Lorg/acra/util/TlsSniSocketFactory;->setSniHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V

    .line 130
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 133
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    .line 134
    .local v0, "session":Ljavax/net/ssl/SSLSession;
    sget-object v1, Lorg/acra/util/TlsSniSocketFactory;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    invoke-interface {v1, p2, v0}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 136
    new-instance v1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    invoke-direct {v1, p2}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 139
    :cond_1b
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/util/TlsSniSocketFactory;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Established "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljavax/net/ssl/SSLSession;->getProtocol()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " connection with "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljavax/net/ssl/SSLSession;->getPeerHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " using "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    return-void
.end method

.method private setSniHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V
    .registers 10
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "hostName"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 189
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_26

    .line 190
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/util/TlsSniSocketFactory;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Using documented SNI with host name "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iget-object v2, p0, Lorg/acra/util/TlsSniSocketFactory;->sslSocketFactory:Landroid/net/SSLCertificateSocketFactory;

    invoke-virtual {v2, p1, p2}, Landroid/net/SSLCertificateSocketFactory;->setHostname(Ljava/net/Socket;Ljava/lang/String;)V

    .line 201
    :goto_25
    return-void

    .line 193
    :cond_26
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/util/TlsSniSocketFactory;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No documented SNI support on Android <4.2, trying reflection method with host name "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    :try_start_40
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setHostname"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 196
    .local v1, "setHostnameMethod":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_5b} :catch_5c

    goto :goto_25

    .line 197
    .end local v1    # "setHostnameMethod":Ljava/lang/reflect/Method;
    :catch_5c
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/util/TlsSniSocketFactory;->TAG:Ljava/lang/String;

    const-string v4, "SNI not usable"

    invoke-interface {v2, v3, v4, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_25
.end method

.method private setTlsParameters(Ljavax/net/ssl/SSLSocket;)V
    .registers 13
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 156
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    .line 157
    .local v6, "protocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_b
    if-ge v2, v3, :cond_21

    aget-object v5, v0, v2

    .line 158
    .local v5, "protocol":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    const-string v8, "SSL"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1e

    .line 159
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 162
    .end local v5    # "protocol":Ljava/lang/String;
    :cond_21
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/util/TlsSniSocketFactory;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setting allowed TLS protocols: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-static {v10, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Lorg/acra/log/ACRALog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 166
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-ge v7, v8, :cond_a2

    .line 169
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 172
    .local v1, "availableCiphers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/HashSet;

    sget-object v7, Lorg/acra/util/TlsSniSocketFactory;->ALLOWED_CIPHERS:Ljava/util/List;

    invoke-direct {v4, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 173
    .local v4, "preferredCiphers":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v4, v1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 179
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 181
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/util/TlsSniSocketFactory;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Setting allowed TLS ciphers: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-static {v10, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Lorg/acra/log/ACRALog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v4, v7}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 184
    .end local v1    # "availableCiphers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "preferredCiphers":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_a2
    return-void
.end method


# virtual methods
.method public connectSocket(Ljava/net/Socket;Ljava/lang/String;ILjava/net/InetAddress;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 8
    .param p1, "s"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "localAddress"    # Ljava/net/InetAddress;
    .param p5, "localPort"    # I
    .param p6, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    const/4 v0, 0x0

    return-object v0
.end method

.method public createSocket()Ljava/net/Socket;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    const/4 v0, 0x0

    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 8
    .param p1, "plainSocket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    if-eqz p4, :cond_5

    .line 103
    invoke-virtual {p1}, Ljava/net/Socket;->close()V

    .line 107
    :cond_5
    iget-object v1, p0, Lorg/acra/util/TlsSniSocketFactory;->sslSocketFactory:Landroid/net/SSLCertificateSocketFactory;

    invoke-static {p2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v1, v2, p3}, Landroid/net/SSLCertificateSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    .line 110
    .local v0, "ssl":Ljavax/net/ssl/SSLSocket;
    invoke-direct {p0, v0, p2}, Lorg/acra/util/TlsSniSocketFactory;->establishAndVerify(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V

    .line 112
    return-object v0
.end method

.method public isSecure(Ljava/net/Socket;)Z
    .registers 3
    .param p1, "s"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 93
    instance-of v0, p1, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_c

    invoke-virtual {p1}, Ljava/net/Socket;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
