.class public final Lcom/squareup/okhttp/internal/http/RouteSelector;
.super Ljava/lang/Object;
.source "RouteSelector.java"


# instance fields
.field private final address:Lcom/squareup/okhttp/Address;

.field private final client:Lcom/squareup/okhttp/OkHttpClient;

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

.field private nextInetSocketAddressIndex:I

.field private nextProxyIndex:I

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

.field private final routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

.field private final url:Lcom/squareup/okhttp/HttpUrl;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Address;Lcom/squareup/okhttp/HttpUrl;Lcom/squareup/okhttp/OkHttpClient;)V
    .registers 5
    .param p1, "address"    # Lcom/squareup/okhttp/Address;
    .param p2, "url"    # Lcom/squareup/okhttp/HttpUrl;
    .param p3, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 56
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    .line 63
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    .line 64
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->url:Lcom/squareup/okhttp/HttpUrl;

    .line 65
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 66
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, p3}, Lcom/squareup/okhttp/internal/Internal;->routeDatabase(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    .line 68
    invoke-virtual {p1}, Lcom/squareup/okhttp/Address;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetNextProxy(Lcom/squareup/okhttp/HttpUrl;Ljava/net/Proxy;)V

    .line 69
    return-void
.end method

.method public static get(Lcom/squareup/okhttp/Address;Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/http/RouteSelector;
    .registers 5
    .param p0, "address"    # Lcom/squareup/okhttp/Address;
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .param p2, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v1

    invoke-direct {v0, p0, v1, p2}, Lcom/squareup/okhttp/internal/http/RouteSelector;-><init>(Lcom/squareup/okhttp/Address;Lcom/squareup/okhttp/HttpUrl;Lcom/squareup/okhttp/OkHttpClient;)V

    return-object v0
.end method

.method static getHostString(Ljava/net/InetSocketAddress;)Ljava/lang/String;
    .registers 3
    .param p0, "socketAddress"    # Ljava/net/InetSocketAddress;

    .prologue
    .line 199
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 200
    .local v0, "address":Ljava/net/InetAddress;
    if-nez v0, :cond_b

    .line 204
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    .line 208
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method private hasNextInetSocketAddress()Z
    .registers 3

    .prologue
    .line 213
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
    .line 227
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
    .line 143
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

.method private nextInetSocketAddress()Ljava/net/InetSocketAddress;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v0

    if-nez v0, :cond_31

    .line 219
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

    const-string v2, "; exhausted inet socket addresses: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 222
    :cond_31
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    iget v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method private nextPostponed()Lcom/squareup/okhttp/Route;
    .registers 3

    .prologue
    .line 232
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
    .line 148
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v1

    if-nez v1, :cond_31

    .line 149
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

    .line 152
    :cond_31
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    iget v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Proxy;

    .line 153
    .local v0, "result":Ljava/net/Proxy;
    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetNextInetSocketAddress(Ljava/net/Proxy;)V

    .line 154
    return-object v0
.end method

.method private resetNextInetSocketAddress(Ljava/net/Proxy;)V
    .registers 13
    .param p1, "proxy"    # Ljava/net/Proxy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 164
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v8

    sget-object v9, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v8, v9, :cond_17

    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v8

    sget-object v9, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    if-ne v8, v9, :cond_54

    .line 165
    :cond_17
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v8}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v6

    .line 166
    .local v6, "socketHost":Ljava/lang/String;
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v8}, Lcom/squareup/okhttp/Address;->getUriPort()I

    move-result v7

    .line 178
    .local v7, "socketPort":I
    :goto_23
    const/4 v8, 0x1

    if-lt v7, v8, :cond_2b

    const v8, 0xffff

    if-le v7, v8, :cond_85

    .line 179
    :cond_2b
    new-instance v8, Ljava/net/SocketException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "No route to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ":"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; port is out of range"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 168
    .end local v6    # "socketHost":Ljava/lang/String;
    .end local v7    # "socketPort":I
    :cond_54
    invoke-virtual {p1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v3

    .line 169
    .local v3, "proxyAddress":Ljava/net/SocketAddress;
    instance-of v8, v3, Ljava/net/InetSocketAddress;

    if-nez v8, :cond_79

    .line 170
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Proxy.address() is not an InetSocketAddress: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 171
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_79
    move-object v4, v3

    .line 173
    check-cast v4, Ljava/net/InetSocketAddress;

    .line 174
    .local v4, "proxySocketAddress":Ljava/net/InetSocketAddress;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/RouteSelector;->getHostString(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    move-result-object v6

    .line 175
    .restart local v6    # "socketHost":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v7

    .restart local v7    # "socketPort":I
    goto :goto_23

    .line 184
    .end local v3    # "proxyAddress":Ljava/net/SocketAddress;
    .end local v4    # "proxySocketAddress":Ljava/net/InetSocketAddress;
    :cond_85
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v8}, Lcom/squareup/okhttp/Address;->getDns()Lcom/squareup/okhttp/Dns;

    move-result-object v8

    invoke-interface {v8, v6}, Lcom/squareup/okhttp/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 185
    .local v0, "addresses":Ljava/util/List;, "Ljava/util/List<Ljava/net/InetAddress;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    .local v5, "size":I
    :goto_94
    if-ge v1, v5, :cond_a9

    .line 186
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    .line 187
    .local v2, "inetAddress":Ljava/net/InetAddress;
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    new-instance v9, Ljava/net/InetSocketAddress;

    invoke-direct {v9, v2, v7}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    add-int/lit8 v1, v1, 0x1

    goto :goto_94

    .line 190
    .end local v2    # "inetAddress":Ljava/net/InetAddress;
    :cond_a9
    const/4 v8, 0x0

    iput v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    .line 191
    return-void
.end method

.method private resetNextProxy(Lcom/squareup/okhttp/HttpUrl;Ljava/net/Proxy;)V
    .registers 6
    .param p1, "url"    # Lcom/squareup/okhttp/HttpUrl;
    .param p2, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 125
    if-eqz p2, :cond_c

    .line 127
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 138
    :goto_8
    const/4 v1, 0x0

    iput v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    .line 139
    return-void

    .line 131
    :cond_c
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 132
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v1

    invoke-virtual {p1}, Lcom/squareup/okhttp/HttpUrl;->uri()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v0

    .line 133
    .local v0, "selectedProxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    if-eqz v0, :cond_28

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 135
    :cond_28
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 136
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method


# virtual methods
.method public connectFailed(Lcom/squareup/okhttp/Route;Ljava/io/IOException;)V
    .registers 6
    .param p1, "failedRoute"    # Lcom/squareup/okhttp/Route;
    .param p2, "failure"    # Ljava/io/IOException;

    .prologue
    .line 114
    invoke-virtual {p1}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_2b

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v0

    if-eqz v0, :cond_2b

    .line 116
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->url:Lcom/squareup/okhttp/HttpUrl;

    .line 117
    invoke-virtual {v1}, Lcom/squareup/okhttp/HttpUrl;->uri()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {p1}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    .line 116
    invoke-virtual {v0, v1, v2, p2}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 120
    :cond_2b
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/internal/RouteDatabase;->failed(Lcom/squareup/okhttp/Route;)V

    .line 121
    return-void
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v0

    if-nez v0, :cond_12

    .line 82
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v0

    if-nez v0, :cond_12

    .line 83
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextPostponed()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public next()Lcom/squareup/okhttp/Route;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v1

    if-nez v1, :cond_23

    .line 89
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v1

    if-nez v1, :cond_1d

    .line 90
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextPostponed()Z

    move-result v1

    if-nez v1, :cond_18

    .line 91
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 93
    :cond_18
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextPostponed()Lcom/squareup/okhttp/Route;

    move-result-object v0

    .line 106
    :cond_1c
    :goto_1c
    return-object v0

    .line 95
    :cond_1d
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxy()Ljava/net/Proxy;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    .line 97
    :cond_23
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    .line 99
    new-instance v0, Lcom/squareup/okhttp/Route;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-direct {v0, v1, v2, v3}, Lcom/squareup/okhttp/Route;-><init>(Lcom/squareup/okhttp/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    .line 100
    .local v0, "route":Lcom/squareup/okhttp/Route;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v1, v0}, Lcom/squareup/okhttp/internal/RouteDatabase;->shouldPostpone(Lcom/squareup/okhttp/Route;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 101
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->next()Lcom/squareup/okhttp/Route;

    move-result-object v0

    goto :goto_1c
.end method
