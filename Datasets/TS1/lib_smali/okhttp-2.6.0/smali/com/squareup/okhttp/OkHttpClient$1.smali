.class final Lcom/squareup/okhttp/OkHttpClient$1;
.super Lcom/squareup/okhttp/internal/Internal;
.source "OkHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/OkHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/Internal;-><init>()V

    return-void
.end method


# virtual methods
.method public addLenient(Lcom/squareup/okhttp/Headers$Builder;Ljava/lang/String;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/Headers$Builder;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->addLenient(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 93
    return-void
.end method

.method public addLenient(Lcom/squareup/okhttp/Headers$Builder;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "builder"    # Lcom/squareup/okhttp/Headers$Builder;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-virtual {p1, p2, p3}, Lcom/squareup/okhttp/Headers$Builder;->addLenient(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 97
    return-void
.end method

.method public apply(Lcom/squareup/okhttp/ConnectionSpec;Ljavax/net/ssl/SSLSocket;Z)V
    .registers 4
    .param p1, "tlsConfiguration"    # Lcom/squareup/okhttp/ConnectionSpec;
    .param p2, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p3, "isFallback"    # Z

    .prologue
    .line 147
    invoke-virtual {p1, p2, p3}, Lcom/squareup/okhttp/ConnectionSpec;->apply(Ljavax/net/ssl/SSLSocket;Z)V

    .line 148
    return-void
.end method

.method public callEngineGetConnection(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/Connection;
    .registers 3
    .param p1, "call"    # Lcom/squareup/okhttp/Call;

    .prologue
    .line 130
    iget-object v0, p1, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getConnection()Lcom/squareup/okhttp/Connection;

    move-result-object v0

    return-object v0
.end method

.method public callEngineReleaseConnection(Lcom/squareup/okhttp/Call;)V
    .registers 3
    .param p1, "call"    # Lcom/squareup/okhttp/Call;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p1, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 127
    return-void
.end method

.method public callEnqueue(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;Z)V
    .registers 4
    .param p1, "call"    # Lcom/squareup/okhttp/Call;
    .param p2, "responseCallback"    # Lcom/squareup/okhttp/Callback;
    .param p3, "forWebSocket"    # Z

    .prologue
    .line 122
    invoke-virtual {p1, p2, p3}, Lcom/squareup/okhttp/Call;->enqueue(Lcom/squareup/okhttp/Callback;Z)V

    .line 123
    return-void
.end method

.method public clearOwner(Lcom/squareup/okhttp/Connection;)Z
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 72
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->clearOwner()Z

    move-result v0

    return v0
.end method

.method public closeIfOwnedBy(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "owner"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->closeIfOwnedBy(Ljava/lang/Object;)V

    .line 77
    return-void
.end method

.method public connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 4
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p3, "owner"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/squareup/okhttp/internal/http/RouteException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p2, p1, p3}, Lcom/squareup/okhttp/Connection;->connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Ljava/lang/Object;)V

    .line 118
    return-void
.end method

.method public connectionRawSink(Lcom/squareup/okhttp/Connection;)Lokio/BufferedSink;
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 138
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->rawSink()Lokio/BufferedSink;

    move-result-object v0

    return-object v0
.end method

.method public connectionRawSource(Lcom/squareup/okhttp/Connection;)Lokio/BufferedSource;
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 134
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->rawSource()Lokio/BufferedSource;

    move-result-object v0

    return-object v0
.end method

.method public connectionSetOwner(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "owner"    # Ljava/lang/Object;

    .prologue
    .line 142
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 143
    return-void
.end method

.method public getHttpUrlChecked(Ljava/lang/String;)Lcom/squareup/okhttp/HttpUrl;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-static {p1}, Lcom/squareup/okhttp/HttpUrl;->getChecked(Ljava/lang/String;)Lcom/squareup/okhttp/HttpUrl;

    move-result-object v0

    return-object v0
.end method

.method public internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 104
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->internalCache()Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v0

    return-object v0
.end method

.method public isReadable(Lcom/squareup/okhttp/Connection;)Z
    .registers 3
    .param p1, "pooled"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 88
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isReadable()Z

    move-result v0

    return v0
.end method

.method public newTransport(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;
    .registers 4
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->newTransport(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v0

    return-object v0
.end method

.method public recycle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V
    .registers 3
    .param p1, "pool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 108
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/ConnectionPool;->recycle(Lcom/squareup/okhttp/Connection;)V

    .line 109
    return-void
.end method

.method public recycleCount(Lcom/squareup/okhttp/Connection;)I
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 80
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->recycleCount()I

    move-result v0

    return v0
.end method

.method public routeDatabase(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 112
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public setCache(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/internal/InternalCache;)V
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "internalCache"    # Lcom/squareup/okhttp/internal/InternalCache;

    .prologue
    .line 100
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/OkHttpClient;->setInternalCache(Lcom/squareup/okhttp/internal/InternalCache;)V

    .line 101
    return-void
.end method

.method public setOwner(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;

    .prologue
    .line 84
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 85
    return-void
.end method
