.class public abstract Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;
.super Ljava/lang/Object;
.source "CloseableHttpClient.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/HttpClient;
.implements Ljava/io/Closeable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    return-void
.end method

.method private static determineTarget(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;
    .registers 6
    .param p0, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 88
    const/4 v1, 0x0

    .line 90
    .local v1, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-interface {p0}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    .line 91
    .local v0, "requestURI":Ljava/net/URI;
    invoke-virtual {v0}, Ljava/net/URI;->isAbsolute()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 92
    invoke-static {v0}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->extractHost(Ljava/net/URI;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    .line 93
    if-nez v1, :cond_2a

    .line 94
    new-instance v2, Lcz/msebera/android/httpclient/client/ClientProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "URI does not specify a valid host name: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcz/msebera/android/httpclient/client/ClientProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 98
    :cond_2a
    return-object v1
.end method


# virtual methods
.method protected abstract doExecute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation
.end method

.method public bridge synthetic execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 4
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 115
    const/4 v0, 0x0

    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->doExecute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 5
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->doExecute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 106
    const/4 v0, 0x0

    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 4
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 81
    const-string v0, "HTTP request"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    invoke-static {p1}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->determineTarget(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->doExecute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;)Ljava/lang/Object;
    .registers 5
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcz/msebera/android/httpclient/HttpHost;",
            "Lcz/msebera/android/httpclient/HttpRequest;",
            "Lcz/msebera/android/httpclient/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 185
    .local p3, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;
    .registers 12
    .param p1, "target"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p2, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p4, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcz/msebera/android/httpclient/HttpHost;",
            "Lcz/msebera/android/httpclient/HttpRequest;",
            "Lcz/msebera/android/httpclient/client/ResponseHandler",
            "<+TT;>;",
            "Lcz/msebera/android/httpclient/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 212
    .local p3, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    const-string v5, "Response handler"

    invoke-static {p3, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 214
    invoke-virtual {p0, p1, p2, p4}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v1

    .line 218
    .local v1, "response":Lcz/msebera/android/httpclient/HttpResponse;
    :try_start_9
    invoke-interface {p3, v1}, Lcz/msebera/android/httpclient/client/ResponseHandler;->handleResponse(Lcz/msebera/android/httpclient/HttpResponse;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_c} :catch_15

    move-result-object v2

    .line 239
    .local v2, "result":Ljava/lang/Object;, "TT;"
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 240
    .local v0, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 241
    return-object v2

    .line 219
    .end local v0    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    :catch_15
    move-exception v3

    .line 220
    .local v3, "t":Ljava/lang/Exception;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 222
    .restart local v0    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    :try_start_1a
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1d} :catch_24

    .line 228
    :goto_1d
    instance-of v5, v3, Ljava/lang/RuntimeException;

    if-eqz v5, :cond_2d

    .line 229
    check-cast v3, Ljava/lang/RuntimeException;

    .end local v3    # "t":Ljava/lang/Exception;
    throw v3

    .line 223
    .restart local v3    # "t":Ljava/lang/Exception;
    :catch_24
    move-exception v4

    .line 226
    .local v4, "t2":Ljava/lang/Exception;
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v6, "Error consuming content after an exception."

    invoke-virtual {v5, v6, v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1d

    .line 231
    .end local v4    # "t2":Ljava/lang/Exception;
    :cond_2d
    instance-of v5, v3, Ljava/io/IOException;

    if-eqz v5, :cond_34

    .line 232
    check-cast v3, Ljava/io/IOException;

    .end local v3    # "t":Ljava/lang/Exception;
    throw v3

    .line 234
    .restart local v3    # "t":Ljava/lang/Exception;
    :cond_34
    new-instance v5, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v5, v3}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;)Ljava/lang/Object;
    .registers 4
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;",
            "Lcz/msebera/android/httpclient/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 136
    .local p2, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;
    .registers 6
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;",
            "Lcz/msebera/android/httpclient/client/ResponseHandler",
            "<+TT;>;",
            "Lcz/msebera/android/httpclient/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 159
    .local p2, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    invoke-static {p1}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->determineTarget(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    .line 160
    .local v0, "target":Lcz/msebera/android/httpclient/HttpHost;
    invoke-virtual {p0, v0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
