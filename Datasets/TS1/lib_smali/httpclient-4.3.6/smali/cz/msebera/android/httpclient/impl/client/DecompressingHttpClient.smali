.class public Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;
.super Ljava/lang/Object;
.source "DecompressingHttpClient.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/HttpClient;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final acceptEncodingInterceptor:Lcz/msebera/android/httpclient/HttpRequestInterceptor;

.field private final backend:Lcz/msebera/android/httpclient/client/HttpClient;

.field private final contentEncodingInterceptor:Lcz/msebera/android/httpclient/HttpResponseInterceptor;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 89
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpClient;-><init>()V

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;-><init>(Lcz/msebera/android/httpclient/client/HttpClient;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/client/HttpClient;)V
    .registers 4
    .param p1, "backend"    # Lcz/msebera/android/httpclient/client/HttpClient;

    .prologue
    .line 99
    new-instance v0, Lcz/msebera/android/httpclient/client/protocol/RequestAcceptEncoding;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/client/protocol/RequestAcceptEncoding;-><init>()V

    new-instance v1, Lcz/msebera/android/httpclient/client/protocol/ResponseContentEncoding;

    invoke-direct {v1}, Lcz/msebera/android/httpclient/client/protocol/ResponseContentEncoding;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;-><init>(Lcz/msebera/android/httpclient/client/HttpClient;Lcz/msebera/android/httpclient/HttpRequestInterceptor;Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V

    .line 100
    return-void
.end method

.method constructor <init>(Lcz/msebera/android/httpclient/client/HttpClient;Lcz/msebera/android/httpclient/HttpRequestInterceptor;Lcz/msebera/android/httpclient/HttpResponseInterceptor;)V
    .registers 4
    .param p1, "backend"    # Lcz/msebera/android/httpclient/client/HttpClient;
    .param p2, "requestInterceptor"    # Lcz/msebera/android/httpclient/HttpRequestInterceptor;
    .param p3, "responseInterceptor"    # Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->backend:Lcz/msebera/android/httpclient/client/HttpClient;

    .line 106
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->acceptEncodingInterceptor:Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    .line 107
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->contentEncodingInterceptor:Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    .line 108
    return-void
.end method


# virtual methods
.method public execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/HttpResponse;
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
    .line 144
    const/4 v0, 0x0

    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 11
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
    .line 150
    if-eqz p3, :cond_3c

    move-object v2, p3

    .line 152
    .local v2, "localContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    :goto_3
    :try_start_3
    instance-of v5, p2, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_49

    .line 153
    new-instance v4, Lcz/msebera/android/httpclient/impl/client/EntityEnclosingRequestWrapper;

    check-cast p2, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    .end local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-direct {v4, p2}, Lcz/msebera/android/httpclient/impl/client/EntityEnclosingRequestWrapper;-><init>(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V

    .line 157
    .local v4, "wrapped":Lcz/msebera/android/httpclient/HttpRequest;
    :goto_e
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->acceptEncodingInterceptor:Lcz/msebera/android/httpclient/HttpRequestInterceptor;

    invoke-interface {v5, v4, v2}, Lcz/msebera/android/httpclient/HttpRequestInterceptor;->process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 158
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->backend:Lcz/msebera/android/httpclient/client/HttpClient;

    invoke-interface {v5, p1, v4, v2}, Lcz/msebera/android/httpclient/client/HttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    :try_end_18
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_3 .. :try_end_18} :catch_42

    move-result-object v3

    .line 160
    .local v3, "response":Lcz/msebera/android/httpclient/HttpResponse;
    :try_start_19
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->contentEncodingInterceptor:Lcz/msebera/android/httpclient/HttpResponseInterceptor;

    invoke-interface {v5, v3, v2}, Lcz/msebera/android/httpclient/HttpResponseInterceptor;->process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 161
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v6, "http.client.response.uncompressed"

    invoke-interface {v2, v6}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 162
    const-string v5, "Content-Length"

    invoke-interface {v3, v5}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 163
    const-string v5, "Content-Encoding"

    invoke-interface {v3, v5}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 164
    const-string v5, "Content-MD5"

    invoke-interface {v3, v5}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V
    :try_end_3b
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_19 .. :try_end_3b} :catch_4f
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_3b} :catch_58
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_3b} :catch_61

    .line 166
    :cond_3b
    return-object v3

    .line 150
    .end local v2    # "localContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    .end local v3    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    .end local v4    # "wrapped":Lcz/msebera/android/httpclient/HttpRequest;
    .restart local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_3c
    :try_start_3c
    new-instance v2, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/protocol/BasicHttpContext;-><init>()V
    :try_end_41
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_3c .. :try_end_41} :catch_42

    goto :goto_3

    .line 177
    .end local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :catch_42
    move-exception v0

    .line 178
    .local v0, "e":Lcz/msebera/android/httpclient/HttpException;
    new-instance v5, Lcz/msebera/android/httpclient/client/ClientProtocolException;

    invoke-direct {v5, v0}, Lcz/msebera/android/httpclient/client/ClientProtocolException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 155
    .end local v0    # "e":Lcz/msebera/android/httpclient/HttpException;
    .restart local v2    # "localContext":Lcz/msebera/android/httpclient/protocol/HttpContext;
    .restart local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_49
    :try_start_49
    new-instance v4, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;

    invoke-direct {v4, p2}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;-><init>(Lcz/msebera/android/httpclient/HttpRequest;)V

    .restart local v4    # "wrapped":Lcz/msebera/android/httpclient/HttpRequest;
    goto :goto_e

    .line 167
    .end local p2    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    .restart local v3    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    :catch_4f
    move-exception v1

    .line 168
    .local v1, "ex":Lcz/msebera/android/httpclient/HttpException;
    invoke-interface {v3}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 169
    throw v1

    .line 170
    .end local v1    # "ex":Lcz/msebera/android/httpclient/HttpException;
    :catch_58
    move-exception v1

    .line 171
    .local v1, "ex":Ljava/io/IOException;
    invoke-interface {v3}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 172
    throw v1

    .line 173
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_61
    move-exception v1

    .line 174
    .local v1, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v3}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 175
    throw v1
    :try_end_6a
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_49 .. :try_end_6a} :catch_42
.end method

.method public execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 4
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->getHttpHost(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    const/4 v0, 0x0

    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    invoke-virtual {p0, v1, p1, v0}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
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
    .line 139
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->getHttpHost(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

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
    .line 197
    .local p3, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;
    .registers 8
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
    .line 203
    .local p3, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1, p2, p4}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v1

    .line 205
    .local v1, "response":Lcz/msebera/android/httpclient/HttpResponse;
    :try_start_4
    invoke-interface {p3, v1}, Lcz/msebera/android/httpclient/client/ResponseHandler;->handleResponse(Lcz/msebera/android/httpclient/HttpResponse;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_12

    move-result-object v2

    .line 207
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 208
    .local v0, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-eqz v0, :cond_11

    .line 209
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 211
    :cond_11
    return-object v2

    .line 207
    .end local v0    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    :catchall_12
    move-exception v2

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 208
    .restart local v0    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-eqz v0, :cond_1c

    .line 209
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 211
    :cond_1c
    throw v2
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
    .line 185
    .local p2, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->getHttpHost(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;
    .registers 5
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
    .line 191
    .local p2, "responseHandler":Lcz/msebera/android/httpclient/client/ResponseHandler;, "Lcz/msebera/android/httpclient/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->getHttpHost(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2, p3}, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->execute(Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/ResponseHandler;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->backend:Lcz/msebera/android/httpclient/client/HttpClient;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/client/HttpClient;->getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;

    move-result-object v0

    return-object v0
.end method

.method public getHttpClient()Lcz/msebera/android/httpclient/client/HttpClient;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->backend:Lcz/msebera/android/httpclient/client/HttpClient;

    return-object v0
.end method

.method getHttpHost(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpHost;
    .registers 4
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    .prologue
    .line 133
    invoke-interface {p1}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    .line 134
    .local v0, "uri":Ljava/net/URI;
    invoke-static {v0}, Lcz/msebera/android/httpclient/client/utils/URIUtils;->extractHost(Ljava/net/URI;)Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v1

    return-object v1
.end method

.method public getParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/DecompressingHttpClient;->backend:Lcz/msebera/android/httpclient/client/HttpClient;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/client/HttpClient;->getParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    return-object v0
.end method
