.class public Lorg/apache/http/protocol/HttpRequestExecutor;
.super Ljava/lang/Object;
.source "HttpRequestExecutor.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method private static final closeConnection(Lorg/apache/http/HttpClientConnection;)V
    .registers 2
    .param p0, "conn"    # Lorg/apache/http/HttpClientConnection;

    .prologue
    .line 144
    :try_start_0
    invoke-interface {p0}, Lorg/apache/http/HttpClientConnection;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 147
    :goto_3
    return-void

    .line 145
    :catch_4
    move-exception v0

    goto :goto_3
.end method


# virtual methods
.method protected canResponseHaveBody(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z
    .registers 7
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v1, 0x0

    .line 87
    const-string v2, "HEAD"

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 91
    :cond_11
    :goto_11
    return v1

    .line 90
    :cond_12
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 91
    .local v0, "status":I
    const/16 v2, 0xc8

    if-lt v0, v2, :cond_11

    const/16 v2, 0xcc

    if-eq v0, v2, :cond_11

    const/16 v2, 0x130

    if-eq v0, v2, :cond_11

    const/16 v2, 0xcd

    if-eq v0, v2, :cond_11

    const/4 v1, 0x1

    goto :goto_11
.end method

.method protected doReceiveResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 8
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "conn"    # Lorg/apache/http/HttpClientConnection;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 285
    if-nez p1, :cond_a

    .line 286
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "HTTP request may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 288
    :cond_a
    if-nez p2, :cond_14

    .line 289
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "HTTP connection may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 291
    :cond_14
    if-nez p3, :cond_1e

    .line 292
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "HTTP context may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 295
    :cond_1e
    const/4 v0, 0x0

    .line 296
    .local v0, "response":Lorg/apache/http/HttpResponse;
    const/4 v1, 0x0

    .line 298
    .local v1, "statuscode":I
    :goto_20
    if-eqz v0, :cond_26

    const/16 v2, 0xc8

    if-ge v1, v2, :cond_3c

    .line 300
    :cond_26
    invoke-interface {p2}, Lorg/apache/http/HttpClientConnection;->receiveResponseHeader()Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 301
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/protocol/HttpRequestExecutor;->canResponseHaveBody(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 302
    invoke-interface {p2, v0}, Lorg/apache/http/HttpClientConnection;->receiveResponseEntity(Lorg/apache/http/HttpResponse;)V

    .line 304
    :cond_33
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    goto :goto_20

    .line 308
    :cond_3c
    return-object v0
.end method

.method protected doSendRequest(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 12
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "conn"    # Lorg/apache/http/HttpClientConnection;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 206
    if-nez p1, :cond_a

    .line 207
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "HTTP request may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 209
    :cond_a
    if-nez p2, :cond_14

    .line 210
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "HTTP connection may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 212
    :cond_14
    if-nez p3, :cond_1e

    .line 213
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "HTTP context may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 216
    :cond_1e
    const/4 v0, 0x0

    .line 218
    .local v0, "response":Lorg/apache/http/HttpResponse;
    const-string v5, "http.connection"

    invoke-interface {p3, v5, p2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 219
    const-string v5, "http.request_sent"

    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p3, v5, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 221
    invoke-interface {p2, p1}, Lorg/apache/http/HttpClientConnection;->sendRequestHeader(Lorg/apache/http/HttpRequest;)V

    .line 222
    instance-of v5, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_a3

    .line 226
    const/4 v1, 0x1

    .line 227
    .local v1, "sendentity":Z
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v4

    .local v4, "ver":Lorg/apache/http/ProtocolVersion;
    move-object v5, p1

    .line 229
    check-cast v5, Lorg/apache/http/HttpEntityEnclosingRequest;

    invoke-interface {v5}, Lorg/apache/http/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v5

    if-eqz v5, :cond_9c

    sget-object v5, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v4, v5}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v5

    if-nez v5, :cond_9c

    .line 232
    invoke-interface {p2}, Lorg/apache/http/HttpClientConnection;->flush()V

    .line 235
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    const-string v6, "http.protocol.wait-for-continue"

    const/16 v7, 0x7d0

    invoke-interface {v5, v6, v7}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v3

    .line 238
    .local v3, "tms":I
    invoke-interface {p2, v3}, Lorg/apache/http/HttpClientConnection;->isResponseAvailable(I)Z

    move-result v5

    if-eqz v5, :cond_9c

    .line 239
    invoke-interface {p2}, Lorg/apache/http/HttpClientConnection;->receiveResponseHeader()Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 240
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/protocol/HttpRequestExecutor;->canResponseHaveBody(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 241
    invoke-interface {p2, v0}, Lorg/apache/http/HttpClientConnection;->receiveResponseEntity(Lorg/apache/http/HttpResponse;)V

    .line 243
    :cond_6e
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    .line 244
    .local v2, "status":I
    const/16 v5, 0xc8

    if-ge v2, v5, :cond_ae

    .line 245
    const/16 v5, 0x64

    if-eq v2, v5, :cond_9b

    .line 246
    new-instance v5, Lorg/apache/http/ProtocolException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 250
    :cond_9b
    const/4 v0, 0x0

    .line 256
    .end local v2    # "status":I
    .end local v3    # "tms":I
    :cond_9c
    :goto_9c
    if-eqz v1, :cond_a3

    .line 257
    check-cast p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    invoke-interface {p2, p1}, Lorg/apache/http/HttpClientConnection;->sendRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 260
    .end local v1    # "sendentity":Z
    .end local v4    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_a3
    invoke-interface {p2}, Lorg/apache/http/HttpClientConnection;->flush()V

    .line 261
    const-string v5, "http.request_sent"

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p3, v5, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 262
    return-object v0

    .line 252
    .restart local v1    # "sendentity":Z
    .restart local v2    # "status":I
    .restart local v3    # "tms":I
    .restart local v4    # "ver":Lorg/apache/http/ProtocolVersion;
    .restart local p1    # "request":Lorg/apache/http/HttpRequest;
    :cond_ae
    const/4 v1, 0x0

    goto :goto_9c
.end method

.method public execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 8
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "conn"    # Lorg/apache/http/HttpClientConnection;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 114
    if-nez p1, :cond_a

    .line 115
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "HTTP request may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 117
    :cond_a
    if-nez p2, :cond_14

    .line 118
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Client connection may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 120
    :cond_14
    if-nez p3, :cond_1e

    .line 121
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "HTTP context may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 125
    :cond_1e
    :try_start_1e
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/protocol/HttpRequestExecutor;->doSendRequest(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 126
    .local v1, "response":Lorg/apache/http/HttpResponse;
    if-nez v1, :cond_28

    .line 127
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/protocol/HttpRequestExecutor;->doReceiveResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_27} :catch_29
    .catch Lorg/apache/http/HttpException; {:try_start_1e .. :try_end_27} :catch_2e
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_27} :catch_33

    move-result-object v1

    .line 129
    :cond_28
    return-object v1

    .line 130
    .end local v1    # "response":Lorg/apache/http/HttpResponse;
    :catch_29
    move-exception v0

    .line 131
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->closeConnection(Lorg/apache/http/HttpClientConnection;)V

    .line 132
    throw v0

    .line 133
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_2e
    move-exception v0

    .line 134
    .local v0, "ex":Lorg/apache/http/HttpException;
    invoke-static {p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->closeConnection(Lorg/apache/http/HttpClientConnection;)V

    .line 135
    throw v0

    .line 136
    .end local v0    # "ex":Lorg/apache/http/HttpException;
    :catch_33
    move-exception v0

    .line 137
    .local v0, "ex":Ljava/lang/RuntimeException;
    invoke-static {p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->closeConnection(Lorg/apache/http/HttpClientConnection;)V

    .line 138
    throw v0
.end method

.method public postProcess(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V
    .registers 6
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    if-nez p1, :cond_a

    .line 336
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP response may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 338
    :cond_a
    if-nez p2, :cond_14

    .line 339
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP processor may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 341
    :cond_14
    if-nez p3, :cond_1e

    .line 342
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP context may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 344
    :cond_1e
    const-string v0, "http.response"

    invoke-interface {p3, v0, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 345
    invoke-interface {p2, p1, p3}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 346
    return-void
.end method

.method public preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V
    .registers 6
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    if-nez p1, :cond_a

    .line 167
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP request may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_a
    if-nez p2, :cond_14

    .line 170
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP processor may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_14
    if-nez p3, :cond_1e

    .line 173
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP context may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 175
    :cond_1e
    const-string v0, "http.request"

    invoke-interface {p3, v0, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 176
    invoke-interface {p2, p1, p3}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 177
    return-void
.end method
