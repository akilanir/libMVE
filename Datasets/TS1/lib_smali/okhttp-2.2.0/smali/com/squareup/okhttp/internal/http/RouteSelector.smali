.class public final Lcom/squareup/okhttp/internal/http/RouteSelector;
.super Ljava/lang/Object;
.source "RouteSelector.java"


# instance fields
.field private final address:Lcom/squareup/okhttp/Address;

.field private final client:Lcom/squareup/okhttp/OkHttpClient;

.field private connectionSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field private inetSocketAddresses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/InetSocketAddress;",
            ">;"
        }
    .end annotation
.end field

.field private lastInetSocketAddress:Ljava/net/InetSocketAddress;

.field private lastProxy:Ljava/net/Proxy;

.field private lastSpec:Lcom/squareup/okhttp/ConnectionSpec;

.field private final network:Lcom/squareup/okhttp/internal/Network;

.field private nextInetSocketAddressIndex:I

.field private nextProxyIndex:I

.field private nextSpecIndex:I

.field private final pool:Lcom/squareup/okhttp/ConnectionPool;

.field private final postponedRoutes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Route;",
            ">;"
        }
    .end annotation
.end field

.field private proxies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field

.field private final request:Lcom/squareup/okhttp/Request;

.field private final routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

.field private final uri:Ljava/net/URI;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Address;Ljava/net/URI;Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)V
    .registers 6
    .param p1, "address"    # Lcom/squareup/okhttp/Address;
    .param p2, "uri"    # Ljava/net/URI;
    .param p3, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p4, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 72
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 76
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    .line 83
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    .line 84
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->uri:Ljava/net/URI;

    .line 85
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 86
    invoke-virtual {p3}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionPool()Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    .line 87
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, p3}, Lcom/squareup/okhttp/internal/Internal;->routeDatabase(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    .line 88
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, p3}, Lcom/squareup/okhttp/internal/Internal;->network(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/Network;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->network:Lcom/squareup/okhttp/internal/Network;

    .line 89
    iput-object p4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    .line 91
    invoke-virtual {p1}, Lcom/squareup/okhttp/Address;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetNextProxy(Ljava/net/URI;Ljava/net/Proxy;)V

    .line 92
    return-void
.end method

.method public static get(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/http/RouteSelector;
    .registers 14
    .param p0, "request"    # Lcom/squareup/okhttp/Request;
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 96
    .local v1, "uriHost":Ljava/lang/String;
    if-eqz v1, :cond_10

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1e

    .line 97
    :cond_10
    new-instance v2, Ljava/net/UnknownHostException;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 100
    :cond_1e
    const/4 v4, 0x0

    .line 101
    .local v4, "sslSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    const/4 v5, 0x0

    .line 102
    .local v5, "hostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    const/4 v6, 0x0

    .line 103
    .local v6, "certificatePinner":Lcom/squareup/okhttp/CertificatePinner;
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->isHttps()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 104
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getSslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v4

    .line 105
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v5

    .line 106
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getCertificatePinner()Lcom/squareup/okhttp/CertificatePinner;

    move-result-object v6

    .line 109
    :cond_33
    new-instance v0, Lcom/squareup/okhttp/Address;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v2

    .line 110
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v3

    .line 111
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getAuthenticator()Lcom/squareup/okhttp/Authenticator;

    move-result-object v7

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v8

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getProtocols()Ljava/util/List;

    move-result-object v9

    .line 112
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionSpecs()Ljava/util/List;

    move-result-object v10

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v11

    invoke-direct/range {v0 .. v11}, Lcom/squareup/okhttp/Address;-><init>(Ljava/lang/String;ILjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lcom/squareup/okhttp/CertificatePinner;Lcom/squareup/okhttp/Authenticator;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V

    .line 114
    .local v0, "address":Lcom/squareup/okhttp/Address;
    new-instance v2, Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->uri()Ljava/net/URI;

    move-result-object v3

    invoke-direct {v2, v0, v3, p1, p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;-><init>(Lcom/squareup/okhttp/Address;Ljava/net/URI;Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)V

    return-object v2
.end method

.method static getHostString(Ljava/net/InetSocketAddress;)Ljava/lang/String;
    .registers 3
    .param p0, "socketAddress"    # Ljava/net/InetSocketAddress;

    .prologue
    .line 278
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 279
    .local v0, "address":Ljava/net/InetAddress;
    if-nez v0, :cond_b

    .line 283
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    .line 287
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method private hasNextConnectionSpec()Z
    .registers 3

    .prologue
    .line 321
    iget v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private hasNextInetSocketAddress()Z
    .registers 3

    .prologue
    .line 292
    iget v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private hasNextPostponed()Z
    .registers 2

    .prologue
    .line 335
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private hasNextProxy()Z
    .registers 3

    .prologue
    .line 230
    iget v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private nextConnectionSpec()Lcom/squareup/okhttp/ConnectionSpec;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextConnectionSpec()Z

    move-result v0

    if-nez v0, :cond_31

    .line 327
    new-instance v0, Ljava/net/SocketException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No route to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; exhausted connection specs: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 330
    :cond_31
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    iget v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/ConnectionSpec;

    return-object v0
.end method

.method private nextInetSocketAddress()Ljava/net/InetSocketAddress;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v1

    if-nez v1, :cond_31

    .line 298
    new-instance v1, Ljava/net/SocketException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No route to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; exhausted inet socket addresses: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 301
    :cond_31
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    iget v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    .line 302
    .local v0, "result":Ljava/net/InetSocketAddress;
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetConnectionSpecs()V

    .line 303
    return-object v0
.end method

.method private nextPostponed()Lcom/squareup/okhttp/Route;
    .registers 3

    .prologue
    .line 340
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Route;

    return-object v0
.end method

.method private nextProxy()Ljava/net/Proxy;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v1

    if-nez v1, :cond_31

    .line 236
    new-instance v1, Ljava/net/SocketException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No route to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; exhausted proxy configurations: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 239
    :cond_31
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    iget v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Proxy;

    .line 240
    .local v0, "result":Ljava/net/Proxy;
    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetNextInetSocketAddress(Ljava/net/Proxy;)V

    .line 241
    return-object v0
.end method

.method private resetConnectionSpecs()V
    .registers 7

    .prologue
    .line 308
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    .line 309
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Address;->getConnectionSpecs()Ljava/util/List;

    move-result-object v3

    .line 310
    .local v3, "specs":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/ConnectionSpec;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_12
    if-ge v0, v1, :cond_2e

    .line 311
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/okhttp/ConnectionSpec;

    .line 312
    .local v2, "spec":Lcom/squareup/okhttp/ConnectionSpec;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Request;->isHttps()Z

    move-result v4

    invoke-virtual {v2}, Lcom/squareup/okhttp/ConnectionSpec;->isTls()Z

    move-result v5

    if-ne v4, v5, :cond_2b

    .line 313
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    :cond_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 316
    .end local v2    # "spec":Lcom/squareup/okhttp/ConnectionSpec;
    :cond_2e
    const/4 v4, 0x0

    iput v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    .line 317
    return-void
.end method

.method private resetNextInetSocketAddress(Ljava/net/Proxy;)V
    .registers 13
    .param p1, "proxy"    # Ljava/net/Proxy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 247
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 251
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v5

    sget-object v7, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v5, v7, :cond_18

    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v5

    sget-object v7, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    if-ne v5, v7, :cond_3d

    .line 252
    :cond_18
    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v5}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v3

    .line 253
    .local v3, "socketHost":Ljava/lang/String;
    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->uri:Ljava/net/URI;

    invoke-static {v5}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URI;)I

    move-result v4

    .line 266
    .local v4, "socketPort":I
    :goto_24
    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->network:Lcom/squareup/okhttp/internal/Network;

    invoke-interface {v5, v3}, Lcom/squareup/okhttp/internal/Network;->resolveInetAddresses(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v7

    array-length v8, v7

    move v5, v6

    :goto_2c
    if-ge v5, v8, :cond_6e

    aget-object v0, v7, v5

    .line 267
    .local v0, "inetAddress":Ljava/net/InetAddress;
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    new-instance v10, Ljava/net/InetSocketAddress;

    invoke-direct {v10, v0, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    add-int/lit8 v5, v5, 0x1

    goto :goto_2c

    .line 255
    .end local v0    # "inetAddress":Ljava/net/InetAddress;
    .end local v3    # "socketHost":Ljava/lang/String;
    .end local v4    # "socketPort":I
    :cond_3d
    invoke-virtual {p1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v1

    .line 256
    .local v1, "proxyAddress":Ljava/net/SocketAddress;
    instance-of v5, v1, Ljava/net/InetSocketAddress;

    if-nez v5, :cond_62

    .line 257
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Proxy.address() is not an InetSocketAddress: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 258
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_62
    move-object v2, v1

    .line 260
    check-cast v2, Ljava/net/InetSocketAddress;

    .line 261
    .local v2, "proxySocketAddress":Ljava/net/InetSocketAddress;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/RouteSelector;->getHostString(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    move-result-object v3

    .line 262
    .restart local v3    # "socketHost":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v4

    .restart local v4    # "socketPort":I
    goto :goto_24

    .line 269
    .end local v1    # "proxyAddress":Ljava/net/SocketAddress;
    .end local v2    # "proxySocketAddress":Ljava/net/InetSocketAddress;
    :cond_6e
    iput v6, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    .line 270
    return-void
.end method

.method private resetNextProxy(Ljava/net/URI;Ljava/net/Proxy;)V
    .registers 6
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 212
    if-eqz p2, :cond_c

    .line 214
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 225
    :goto_8
    const/4 v1, 0x0

    iput v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    .line 226
    return-void

    .line 218
    :cond_c
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 219
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v0

    .line 220
    .local v0, "selectedProxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    if-eqz v0, :cond_24

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 222
    :cond_24
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 223
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method private shouldSendTlsFallbackIndicator(Lcom/squareup/okhttp/ConnectionSpec;)Z
    .registers 4
    .param p1, "connectionSpec"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    const/4 v0, 0x0

    .line 175
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eq p1, v1, :cond_10

    .line 176
    invoke-virtual {p1}, Lcom/squareup/okhttp/ConnectionSpec;->isTls()Z

    move-result v1

    if-eqz v1, :cond_10

    const/4 v0, 0x1

    :cond_10
    return v0
.end method


# virtual methods
.method public connectFailed(Lcom/squareup/okhttp/Connection;Ljava/io/IOException;)V
    .registers 10
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "failure"    # Ljava/io/IOException;

    .prologue
    .line 185
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/Internal;->recycleCount(Lcom/squareup/okhttp/Connection;)I

    move-result v1

    if-lez v1, :cond_9

    .line 208
    :cond_8
    return-void

    .line 187
    :cond_9
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v6

    .line 188
    .local v6, "failedRoute":Lcom/squareup/okhttp/Route;
    invoke-virtual {v6}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    sget-object v2, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v1, v2, :cond_34

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v1

    if-eqz v1, :cond_34

    .line 190
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->uri:Ljava/net/URI;

    invoke-virtual {v6}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-virtual {v1, v2, v3, p2}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 193
    :cond_34
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/internal/RouteDatabase;->failed(Lcom/squareup/okhttp/Route;)V

    .line 198
    instance-of v1, p2, Ljavax/net/ssl/SSLHandshakeException;

    if-nez v1, :cond_8

    instance-of v1, p2, Ljavax/net/ssl/SSLProtocolException;

    if-nez v1, :cond_8

    .line 199
    :goto_41
    iget v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_8

    .line 200
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    iget v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/squareup/okhttp/ConnectionSpec;

    .line 202
    .local v4, "connectionSpec":Lcom/squareup/okhttp/ConnectionSpec;
    invoke-direct {p0, v4}, Lcom/squareup/okhttp/internal/http/RouteSelector;->shouldSendTlsFallbackIndicator(Lcom/squareup/okhttp/ConnectionSpec;)Z

    move-result v5

    .line 203
    .local v5, "shouldSendTlsFallbackIndicator":Z
    new-instance v0, Lcom/squareup/okhttp/Route;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-direct/range {v0 .. v5}, Lcom/squareup/okhttp/Route;-><init>(Lcom/squareup/okhttp/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lcom/squareup/okhttp/ConnectionSpec;Z)V

    .line 205
    .local v0, "toSuppress":Lcom/squareup/okhttp/Route;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v1, v0}, Lcom/squareup/okhttp/internal/RouteDatabase;->failed(Lcom/squareup/okhttp/Route;)V

    goto :goto_41
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextConnectionSpec()Z

    move-result v0

    if-nez v0, :cond_18

    .line 123
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v0

    if-nez v0, :cond_18

    .line 124
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v0

    if-nez v0, :cond_18

    .line 125
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextPostponed()Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public next(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Connection;
    .registers 6
    .param p1, "owner"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextUnconnected()Lcom/squareup/okhttp/Connection;

    move-result-object v0

    .line 131
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->client:Lcom/squareup/okhttp/OkHttpClient;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1, v2, v0, p1, v3}, Lcom/squareup/okhttp/internal/Internal;->connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/Request;)V

    .line 132
    return-object v0
.end method

.method nextUnconnected()Lcom/squareup/okhttp/Connection;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    :goto_0
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/ConnectionPool;->get(Lcom/squareup/okhttp/Address;)Lcom/squareup/okhttp/Connection;

    move-result-object v6

    .local v6, "pooled":Lcom/squareup/okhttp/Connection;
    if-eqz v6, :cond_29

    .line 143
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/internal/Internal;->isReadable(Lcom/squareup/okhttp/Connection;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 171
    .end local v6    # "pooled":Lcom/squareup/okhttp/Connection;
    :cond_20
    :goto_20
    return-object v6

    .line 144
    .restart local v6    # "pooled":Lcom/squareup/okhttp/Connection;
    :cond_21
    invoke-virtual {v6}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    goto :goto_0

    .line 148
    :cond_29
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextConnectionSpec()Z

    move-result v1

    if-nez v1, :cond_5f

    .line 149
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v1

    if-nez v1, :cond_59

    .line 150
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v1

    if-nez v1, :cond_53

    .line 151
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextPostponed()Z

    move-result v1

    if-nez v1, :cond_47

    .line 152
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 154
    :cond_47
    new-instance v6, Lcom/squareup/okhttp/Connection;

    .end local v6    # "pooled":Lcom/squareup/okhttp/Connection;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextPostponed()Lcom/squareup/okhttp/Route;

    move-result-object v2

    invoke-direct {v6, v1, v2}, Lcom/squareup/okhttp/Connection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Route;)V

    goto :goto_20

    .line 156
    .restart local v6    # "pooled":Lcom/squareup/okhttp/Connection;
    :cond_53
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxy()Ljava/net/Proxy;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    .line 158
    :cond_59
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    .line 160
    :cond_5f
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextConnectionSpec()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastSpec:Lcom/squareup/okhttp/ConnectionSpec;

    .line 162
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastSpec:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-direct {p0, v1}, Lcom/squareup/okhttp/internal/http/RouteSelector;->shouldSendTlsFallbackIndicator(Lcom/squareup/okhttp/ConnectionSpec;)Z

    move-result v5

    .line 163
    .local v5, "shouldSendTlsFallbackIndicator":Z
    new-instance v0, Lcom/squareup/okhttp/Route;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastSpec:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-direct/range {v0 .. v5}, Lcom/squareup/okhttp/Route;-><init>(Lcom/squareup/okhttp/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lcom/squareup/okhttp/ConnectionSpec;Z)V

    .line 165
    .local v0, "route":Lcom/squareup/okhttp/Route;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v1, v0}, Lcom/squareup/okhttp/internal/RouteDatabase;->shouldPostpone(Lcom/squareup/okhttp/Route;)Z

    move-result v1

    if-eqz v1, :cond_8a

    .line 166
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextUnconnected()Lcom/squareup/okhttp/Connection;

    move-result-object v6

    goto :goto_20

    .line 171
    :cond_8a
    new-instance v6, Lcom/squareup/okhttp/Connection;

    .end local v6    # "pooled":Lcom/squareup/okhttp/Connection;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    invoke-direct {v6, v1, v0}, Lcom/squareup/okhttp/Connection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Route;)V

    goto :goto_20
.end method
