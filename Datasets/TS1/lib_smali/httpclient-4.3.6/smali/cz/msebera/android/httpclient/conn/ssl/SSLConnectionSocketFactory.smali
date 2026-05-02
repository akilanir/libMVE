.class public Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;
.super Ljava/lang/Object;
.source "SSLConnectionSocketFactory.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# static fields
.field public static final ALLOW_ALL_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

.field public static final BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

.field public static final SSL:Ljava/lang/String; = "SSL"

.field public static final SSLV2:Ljava/lang/String; = "SSLv2"

.field public static final STRICT_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

.field public static final TLS:Ljava/lang/String; = "TLS"


# instance fields
.field private final hostnameVerifier:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

.field private final socketfactory:Ljavax/net/ssl/SSLSocketFactory;

.field private final supportedCipherSuites:[Ljava/lang/String;

.field private final supportedProtocols:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 126
    new-instance v0, Lcz/msebera/android/httpclient/conn/ssl/AllowAllHostnameVerifier;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/conn/ssl/AllowAllHostnameVerifier;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .line 129
    new-instance v0, Lcz/msebera/android/httpclient/conn/ssl/BrowserCompatHostnameVerifier;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/conn/ssl/BrowserCompatHostnameVerifier;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .line 132
    new-instance v0, Lcz/msebera/android/httpclient/conn/ssl/StrictHostnameVerifier;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/conn/ssl/StrictHostnameVerifier;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->STRICT_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;)V
    .registers 3
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 178
    sget-object v0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    invoke-direct {p0, p1, v0}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    .line 179
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V
    .registers 5
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;
    .param p2, "hostnameVerifier"    # Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .prologue
    const/4 v1, 0x0

    .line 183
    const-string v0, "SSL context"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-direct {p0, v0, v1, v1, p2}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    .line 185
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V
    .registers 6
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;
    .param p2, "supportedProtocols"    # [Ljava/lang/String;
    .param p3, "supportedCipherSuites"    # [Ljava/lang/String;
    .param p4, "hostnameVerifier"    # Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .prologue
    .line 192
    const-string v0, "SSL context"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    .line 194
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V
    .registers 4
    .param p1, "socketfactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p2, "hostnameVerifier"    # Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .prologue
    const/4 v0, 0x0

    .line 199
    invoke-direct {p0, p1, v0, v0, p2}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    .line 200
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V
    .registers 6
    .param p1, "socketfactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p2, "supportedProtocols"    # [Ljava/lang/String;
    .param p3, "supportedCipherSuites"    # [Ljava/lang/String;
    .param p4, "hostnameVerifier"    # Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    const-string v0, "SSL socket factory"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    iput-object v0, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->socketfactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 208
    iput-object p2, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->supportedProtocols:[Ljava/lang/String;

    .line 209
    iput-object p3, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->supportedCipherSuites:[Ljava/lang/String;

    .line 210
    if-eqz p4, :cond_16

    .end local p4    # "hostnameVerifier":Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;
    :goto_13
    iput-object p4, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->hostnameVerifier:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    .line 211
    return-void

    .line 210
    .restart local p4    # "hostnameVerifier":Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;
    :cond_16
    sget-object p4, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    goto :goto_13
.end method

.method public static getSocketFactory()Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/conn/ssl/SSLInitializationException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;

    .line 144
    invoke-static {}, Lcz/msebera/android/httpclient/conn/ssl/SSLContexts;->createDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    sget-object v2, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    invoke-direct {v0, v1, v2}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    return-object v0
.end method

.method public static getSystemSocketFactory()Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/conn/ssl/SSLInitializationException;
        }
    .end annotation

    .prologue
    .line 165
    new-instance v1, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;

    .line 166
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    const-string v2, "https.protocols"

    .line 167
    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const-string v3, "https.cipherSuites"

    .line 168
    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    invoke-direct {v1, v0, v2, v3, v4}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V

    return-object v1
.end method

.method private static split(Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 149
    invoke-static {p0}, Lcz/msebera/android/httpclient/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 150
    const/4 v0, 0x0

    .line 152
    :goto_7
    return-object v0

    :cond_8
    const-string v0, " *, *"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method private verifyHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V
    .registers 5
    .param p1, "sslsock"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 301
    :try_start_0
    iget-object v1, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->hostnameVerifier:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    invoke-interface {v1, p2, p1}, Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 308
    return-void

    .line 303
    :catch_6
    move-exception v0

    .line 305
    .local v0, "iox":Ljava/io/IOException;
    :try_start_7
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_b

    .line 306
    :goto_a
    throw v0

    .line 305
    :catch_b
    move-exception v1

    goto :goto_a
.end method


# virtual methods
.method public connectSocket(ILjava/net/Socket;Lcz/msebera/android/httpclient/HttpHost;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;
    .registers 12
    .param p1, "connectTimeout"    # I
    .param p2, "socket"    # Ljava/net/Socket;
    .param p3, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p4, "remoteAddress"    # Ljava/net/InetSocketAddress;
    .param p5, "localAddress"    # Ljava/net/InetSocketAddress;
    .param p6, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    const-string v3, "HTTP host"

    invoke-static {p3, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 235
    const-string v3, "Remote address"

    invoke-static {p4, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 236
    if-eqz p2, :cond_32

    move-object v1, p2

    .line 237
    .local v1, "sock":Ljava/net/Socket;
    :goto_d
    if-eqz p5, :cond_12

    .line 238
    invoke-virtual {v1, p5}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 241
    :cond_12
    if-lez p1, :cond_1d

    :try_start_14
    invoke-virtual {v1}, Ljava/net/Socket;->getSoTimeout()I

    move-result v3

    if-nez v3, :cond_1d

    .line 242
    invoke-virtual {v1, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 244
    :cond_1d
    invoke-virtual {v1, p4, p1}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_20} :catch_37

    .line 253
    instance-of v3, v1, Ljavax/net/ssl/SSLSocket;

    if-eqz v3, :cond_3c

    move-object v2, v1

    .line 254
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    .line 255
    .local v2, "sslsock":Ljavax/net/ssl/SSLSocket;
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 256
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->verifyHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V

    .line 259
    .end local v1    # "sock":Ljava/net/Socket;
    .end local v2    # "sslsock":Ljavax/net/ssl/SSLSocket;
    :goto_31
    return-object v1

    .line 236
    :cond_32
    invoke-virtual {p0, p6}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->createSocket(Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v1

    goto :goto_d

    .line 245
    .restart local v1    # "sock":Ljava/net/Socket;
    :catch_37
    move-exception v0

    .line 247
    .local v0, "ex":Ljava/io/IOException;
    :try_start_38
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_3b
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_3b} :catch_49

    .line 250
    :goto_3b
    throw v0

    .line 259
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_3c
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v4

    invoke-virtual {p0, v1, v3, v4, p6}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v1

    goto :goto_31

    .line 248
    .restart local v0    # "ex":Ljava/io/IOException;
    :catch_49
    move-exception v3

    goto :goto_3b
.end method

.method public createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;
    .registers 12
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 268
    iget-object v4, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->socketfactory:Ljavax/net/ssl/SSLSocketFactory;

    const/4 v5, 0x1

    invoke-virtual {v4, p1, p2, p3, v5}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v3

    check-cast v3, Ljavax/net/ssl/SSLSocket;

    .line 273
    .local v3, "sslsock":Ljavax/net/ssl/SSLSocket;
    iget-object v4, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->supportedProtocols:[Ljava/lang/String;

    if-eqz v4, :cond_25

    .line 274
    iget-object v4, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->supportedProtocols:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 286
    :goto_12
    iget-object v4, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->supportedCipherSuites:[Ljava/lang/String;

    if-eqz v4, :cond_1b

    .line 287
    iget-object v4, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->supportedCipherSuites:[Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 289
    :cond_1b
    invoke-virtual {p0, v3}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->prepareSocket(Ljavax/net/ssl/SSLSocket;)V

    .line 290
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 291
    invoke-direct {p0, v3, p2}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->verifyHostname(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;)V

    .line 292
    return-object v3

    .line 277
    :cond_25
    invoke-virtual {v3}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v0

    .line 278
    .local v0, "allProtocols":[Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    array-length v4, v0

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 279
    .local v1, "enabledProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    array-length v5, v0

    const/4 v4, 0x0

    :goto_31
    if-ge v4, v5, :cond_43

    aget-object v2, v0, v4

    .line 280
    .local v2, "protocol":Ljava/lang/String;
    const-string v6, "SSL"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_40

    .line 281
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 279
    :cond_40
    add-int/lit8 v4, v4, 0x1

    goto :goto_31

    .line 284
    .end local v2    # "protocol":Ljava/lang/String;
    :cond_43
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v1, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    goto :goto_12
.end method

.method public createSocket(Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;
    .registers 3
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method getHostnameVerifier()Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;
    .registers 2

    .prologue
    .line 296
    iget-object v0, p0, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->hostnameVerifier:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    return-object v0
.end method

.method protected prepareSocket(Ljavax/net/ssl/SSLSocket;)V
    .registers 2
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 221
    return-void
.end method
