.class public Lcom/squareup/okhttp/internal/Platform;
.super Ljava/lang/Object;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;,
        Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;,
        Lcom/squareup/okhttp/internal/Platform$Android;
    }
.end annotation


# static fields
.field private static final PLATFORM:Lcom/squareup/okhttp/internal/Platform;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->findPlatform()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/Platform;->PLATFORM:Lcom/squareup/okhttp/internal/Platform;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 316
    return-void
.end method

.method static concatLengthPrefixed(Ljava/util/List;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Protocol;",
            ">;)[B"
        }
    .end annotation

    .prologue
    .line 366
    .local p0, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 367
    .local v2, "result":Lokio/Buffer;
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    :goto_a
    if-ge v0, v3, :cond_2c

    .line 368
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/Protocol;

    .line 369
    .local v1, "protocol":Lcom/squareup/okhttp/Protocol;
    sget-object v4, Lcom/squareup/okhttp/Protocol;->HTTP_1_0:Lcom/squareup/okhttp/Protocol;

    if-ne v1, v4, :cond_19

    .line 367
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 370
    :cond_19
    invoke-virtual {v1}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 371
    invoke-virtual {v1}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    goto :goto_16

    .line 373
    .end local v1    # "protocol":Lcom/squareup/okhttp/Protocol;
    :cond_2c
    invoke-virtual {v2}, Lokio/Buffer;->readByteArray()[B

    move-result-object v4

    return-object v4
.end method

.method private static findPlatform()Lcom/squareup/okhttp/internal/Platform;
    .registers 16

    .prologue
    .line 108
    :try_start_0
    const-string v0, "com.android.org.conscrypt.OpenSSLSocketImpl"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_5} :catch_30

    .line 115
    .local v6, "ignored":Ljava/lang/ClassNotFoundException;
    :goto_5
    const/4 v11, 0x0

    .line 116
    .local v11, "trafficStatsTagSocket":Ljava/lang/reflect/Method;
    const/4 v12, 0x0

    .line 118
    .end local v6    # "ignored":Ljava/lang/ClassNotFoundException;
    .local v12, "trafficStatsUntagSocket":Ljava/lang/reflect/Method;
    :try_start_7
    const-string v0, "android.net.TrafficStats"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 119
    .local v10, "trafficStats":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "tagSocket"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Ljava/net/Socket;

    aput-object v15, v13, v14

    invoke-virtual {v10, v0, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .line 120
    const-string v0, "untagSocket"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Ljava/net/Socket;

    aput-object v15, v13, v14

    invoke-virtual {v10, v0, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_28
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_28} :catch_c4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_7 .. :try_end_28} :catch_c1

    move-result-object v12

    .line 125
    .end local v10    # "trafficStats":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_29
    :try_start_29
    new-instance v0, Lcom/squareup/okhttp/internal/Platform$Android;

    const/4 v13, 0x0

    invoke-direct {v0, v11, v12, v13}, Lcom/squareup/okhttp/internal/Platform$Android;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/squareup/okhttp/internal/Platform$1;)V

    .line 145
    .end local v11    # "trafficStatsTagSocket":Ljava/lang/reflect/Method;
    .end local v12    # "trafficStatsUntagSocket":Ljava/lang/reflect/Method;
    .local v8, "negoClassName":Ljava/lang/String;
    :goto_2f
    return-object v0

    .line 109
    .end local v8    # "negoClassName":Ljava/lang/String;
    :catch_30
    move-exception v6

    .line 111
    .restart local v6    # "ignored":Ljava/lang/ClassNotFoundException;
    const-string v0, "org.apache.harmony.xnet.provider.jsse.OpenSSLSocketImpl"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_36
    .catch Ljava/lang/ClassNotFoundException; {:try_start_29 .. :try_end_36} :catch_37

    goto :goto_5

    .line 126
    :catch_37
    move-exception v0

    .line 131
    .end local v6    # "ignored":Ljava/lang/ClassNotFoundException;
    :try_start_38
    const-string v8, "org.eclipse.jetty.alpn.ALPN"

    .line 132
    .restart local v8    # "negoClassName":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 133
    .local v7, "negoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v13, "$Provider"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 134
    .local v9, "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v13, "$ClientProvider"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 135
    .local v4, "clientProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v13, "$ServerProvider"

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 136
    .local v5, "serverProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "put"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Ljavax/net/ssl/SSLSocket;

    aput-object v15, v13, v14

    const/4 v14, 0x1

    aput-object v9, v13, v14

    invoke-virtual {v7, v0, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 137
    .local v1, "putMethod":Ljava/lang/reflect/Method;
    const-string v0, "get"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Ljavax/net/ssl/SSLSocket;

    aput-object v15, v13, v14

    invoke-virtual {v7, v0, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 138
    .local v2, "getMethod":Ljava/lang/reflect/Method;
    const-string v0, "remove"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Ljavax/net/ssl/SSLSocket;

    aput-object v15, v13, v14

    invoke-virtual {v7, v0, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 139
    .local v3, "removeMethod":Ljava/lang/reflect/Method;
    new-instance v0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;

    invoke-direct/range {v0 .. v5}, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/Class;)V
    :try_end_b5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_38 .. :try_end_b5} :catch_b7
    .catch Ljava/lang/NoSuchMethodException; {:try_start_38 .. :try_end_b5} :catch_bf

    goto/16 :goto_2f

    .line 141
    .end local v1    # "putMethod":Ljava/lang/reflect/Method;
    .end local v2    # "getMethod":Ljava/lang/reflect/Method;
    .end local v3    # "removeMethod":Ljava/lang/reflect/Method;
    .end local v4    # "clientProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "serverProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "negoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_b7
    move-exception v0

    .line 145
    :goto_b8
    new-instance v0, Lcom/squareup/okhttp/internal/Platform;

    invoke-direct {v0}, Lcom/squareup/okhttp/internal/Platform;-><init>()V

    goto/16 :goto_2f

    .line 142
    :catch_bf
    move-exception v0

    goto :goto_b8

    .line 122
    .end local v8    # "negoClassName":Ljava/lang/String;
    .restart local v11    # "trafficStatsTagSocket":Ljava/lang/reflect/Method;
    .restart local v12    # "trafficStatsUntagSocket":Ljava/lang/reflect/Method;
    :catch_c1
    move-exception v0

    goto/16 :goto_29

    .line 121
    :catch_c4
    move-exception v0

    goto/16 :goto_29
.end method

.method public static get()Lcom/squareup/okhttp/internal/Platform;
    .registers 1

    .prologue
    .line 54
    sget-object v0, Lcom/squareup/okhttp/internal/Platform;->PLATFORM:Lcom/squareup/okhttp/internal/Platform;

    return-object v0
.end method


# virtual methods
.method public afterHandshake(Ljavax/net/ssl/SSLSocket;)V
    .registers 2
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 91
    return-void
.end method

.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V
    .registers 4
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLSocket;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Protocol;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p3, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    return-void
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    .registers 4
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "address"    # Ljava/net/InetSocketAddress;
    .param p3, "connectTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p1, p2, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 101
    return-void
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    const-string v0, "OkHttp"

    return-object v0
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 3
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 95
    const/4 v0, 0x0

    return-object v0
.end method

.method public logW(Ljava/lang/String;)V
    .registers 3
    .param p1, "warning"    # Ljava/lang/String;

    .prologue
    .line 63
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public tagSocket(Ljava/net/Socket;)V
    .registers 2
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 67
    return-void
.end method

.method public toUriLenient(Ljava/net/URL;)Ljava/net/URI;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public untagSocket(Ljava/net/Socket;)V
    .registers 2
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 70
    return-void
.end method
