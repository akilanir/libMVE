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
    .line 60
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/Internal;-><init>()V

    return-void
.end method


# virtual methods
.method public addLine(Lcom/squareup/okhttp/Headers$Builder;Ljava/lang/String;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/Headers$Builder;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->addLine(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 92
    return-void
.end method

.method public callEngineGetConnection(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/Connection;
    .registers 3
    .param p1, "call"    # Lcom/squareup/okhttp/Call;

    .prologue
    .line 137
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
    .line 133
    iget-object v0, p1, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 134
    return-void
.end method

.method public callGetResponse(Lcom/squareup/okhttp/Call;Z)Lcom/squareup/okhttp/Response;
    .registers 4
    .param p1, "call"    # Lcom/squareup/okhttp/Call;
    .param p2, "forWebSocket"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p1, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {p1, v0, p2}, Lcom/squareup/okhttp/Call;->getResponse(Lcom/squareup/okhttp/Request;Z)Lcom/squareup/okhttp/Response;

    move-result-object v0

    return-object v0
.end method

.method public clearOwner(Lcom/squareup/okhttp/Connection;)Z
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 67
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
    .line 71
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->closeIfOwnedBy(Ljava/lang/Object;)V

    .line 72
    return-void
.end method

.method public connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/Request;)V
    .registers 5
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p3, "owner"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .param p4, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-virtual {p2, p1, p3, p4}, Lcom/squareup/okhttp/Connection;->connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Ljava/lang/Object;Lcom/squareup/okhttp/Request;)V

    .line 121
    return-void
.end method

.method public connectionClearOwner(Lcom/squareup/okhttp/Connection;)Z
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 141
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->clearOwner()Z

    move-result v0

    return v0
.end method

.method public connectionCloseIfOwnedBy(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "owner"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->closeIfOwnedBy(Ljava/lang/Object;)V

    .line 151
    return-void
.end method

.method public connectionSetOwner(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "owner"    # Ljava/lang/Object;

    .prologue
    .line 145
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 146
    return-void
.end method

.method public internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 99
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->internalCache()Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v0

    return-object v0
.end method

.method public isReadable(Lcom/squareup/okhttp/Connection;)Z
    .registers 3
    .param p1, "pooled"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 87
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isReadable()Z

    move-result v0

    return v0
.end method

.method public network(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/Network;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 111
    # getter for: Lcom/squareup/okhttp/OkHttpClient;->network:Lcom/squareup/okhttp/internal/Network;
    invoke-static {p1}, Lcom/squareup/okhttp/OkHttpClient;->access$000(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/Network;

    move-result-object v0

    return-object v0
.end method

.method public newCall(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Call;
    .registers 4
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 124
    new-instance v0, Lcom/squareup/okhttp/Call;

    invoke-direct {v0, p1, p2}, Lcom/squareup/okhttp/Call;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)V

    return-object v0
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
    .line 63
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->newTransport(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v0

    return-object v0
.end method

.method public recycle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V
    .registers 3
    .param p1, "pool"    # Lcom/squareup/okhttp/ConnectionPool;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 103
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/ConnectionPool;->recycle(Lcom/squareup/okhttp/Connection;)V

    .line 104
    return-void
.end method

.method public recycleCount(Lcom/squareup/okhttp/Connection;)I
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 75
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->recycleCount()I

    move-result v0

    return v0
.end method

.method public routeDatabase(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 107
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->routeDatabase()Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public setCache(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/internal/InternalCache;)V
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "internalCache"    # Lcom/squareup/okhttp/internal/InternalCache;

    .prologue
    .line 95
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/OkHttpClient;->setInternalCache(Lcom/squareup/okhttp/internal/InternalCache;)V

    .line 96
    return-void
.end method

.method public setNetwork(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/internal/Network;)V
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "network"    # Lcom/squareup/okhttp/internal/Network;

    .prologue
    .line 115
    # setter for: Lcom/squareup/okhttp/OkHttpClient;->network:Lcom/squareup/okhttp/internal/Network;
    invoke-static {p1, p2}, Lcom/squareup/okhttp/OkHttpClient;->access$002(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/internal/Network;)Lcom/squareup/okhttp/internal/Network;

    .line 116
    return-void
.end method

.method public setOwner(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;

    .prologue
    .line 83
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setOwner(Ljava/lang/Object;)V

    .line 84
    return-void
.end method

.method public setProtocol(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/Protocol;)V
    .registers 3
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    .line 79
    invoke-virtual {p1, p2}, Lcom/squareup/okhttp/Connection;->setProtocol(Lcom/squareup/okhttp/Protocol;)V

    .line 80
    return-void
.end method
