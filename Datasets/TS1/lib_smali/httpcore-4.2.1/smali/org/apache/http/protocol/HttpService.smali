.class public Lorg/apache/http/protocol/HttpService;
.super Ljava/lang/Object;
.source "HttpService.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private volatile connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

.field private volatile expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

.field private volatile handlerResolver:Lorg/apache/http/protocol/HttpRequestHandlerResolver;

.field private volatile params:Lorg/apache/http/params/HttpParams;

.field private volatile processor:Lorg/apache/http/protocol/HttpProcessor;

.field private volatile responseFactory:Lorg/apache/http/HttpResponseFactory;


# direct methods
.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;)V
    .registers 5
    .param p1, "proc"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 78
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 79
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->handlerResolver:Lorg/apache/http/protocol/HttpRequestHandlerResolver;

    .line 80
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 81
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 82
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 160
    invoke-virtual {p0, p1}, Lorg/apache/http/protocol/HttpService;->setHttpProcessor(Lorg/apache/http/protocol/HttpProcessor;)V

    .line 161
    invoke-virtual {p0, p2}, Lorg/apache/http/protocol/HttpService;->setConnReuseStrategy(Lorg/apache/http/ConnectionReuseStrategy;)V

    .line 162
    invoke-virtual {p0, p3}, Lorg/apache/http/protocol/HttpService;->setResponseFactory(Lorg/apache/http/HttpResponseFactory;)V

    .line 163
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerResolver;Lorg/apache/http/params/HttpParams;)V
    .registers 13
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "handlerResolver"    # Lorg/apache/http/protocol/HttpRequestHandlerResolver;
    .param p5, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 141
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/protocol/HttpService;-><init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerResolver;Lorg/apache/http/protocol/HttpExpectationVerifier;Lorg/apache/http/params/HttpParams;)V

    .line 142
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerResolver;Lorg/apache/http/protocol/HttpExpectationVerifier;Lorg/apache/http/params/HttpParams;)V
    .registers 9
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "handlerResolver"    # Lorg/apache/http/protocol/HttpRequestHandlerResolver;
    .param p5, "expectationVerifier"    # Lorg/apache/http/protocol/HttpExpectationVerifier;
    .param p6, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    const/4 v0, 0x0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 78
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 79
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->handlerResolver:Lorg/apache/http/protocol/HttpRequestHandlerResolver;

    .line 80
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 81
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 82
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 104
    if-nez p1, :cond_1a

    .line 105
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP processor may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_1a
    if-nez p2, :cond_24

    .line 108
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Connection reuse strategy may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_24
    if-nez p3, :cond_2e

    .line 111
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Response factory may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_2e
    if-nez p6, :cond_38

    .line 114
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_38
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 117
    iput-object p2, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 118
    iput-object p3, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 119
    iput-object p4, p0, Lorg/apache/http/protocol/HttpService;->handlerResolver:Lorg/apache/http/protocol/HttpRequestHandlerResolver;

    .line 120
    iput-object p5, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 121
    iput-object p6, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 122
    return-void
.end method


# virtual methods
.method protected doService(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 7
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 369
    const/4 v0, 0x0

    .line 370
    .local v0, "handler":Lorg/apache/http/protocol/HttpRequestHandler;
    iget-object v2, p0, Lorg/apache/http/protocol/HttpService;->handlerResolver:Lorg/apache/http/protocol/HttpRequestHandlerResolver;

    if-eqz v2, :cond_13

    .line 371
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v1

    .line 372
    .local v1, "requestURI":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/http/protocol/HttpService;->handlerResolver:Lorg/apache/http/protocol/HttpRequestHandlerResolver;

    invoke-interface {v2, v1}, Lorg/apache/http/protocol/HttpRequestHandlerResolver;->lookup(Ljava/lang/String;)Lorg/apache/http/protocol/HttpRequestHandler;

    move-result-object v0

    .line 374
    .end local v1    # "requestURI":Ljava/lang/String;
    :cond_13
    if-eqz v0, :cond_19

    .line 375
    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/protocol/HttpRequestHandler;->handle(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 379
    :goto_18
    return-void

    .line 377
    :cond_19
    const/16 v2, 0x1f5

    invoke-interface {p2, v2}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_18
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method

.method protected handleException(Lorg/apache/http/HttpException;Lorg/apache/http/HttpResponse;)V
    .registers 7
    .param p1, "ex"    # Lorg/apache/http/HttpException;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 329
    instance-of v3, p1, Lorg/apache/http/MethodNotSupportedException;

    if-eqz v3, :cond_25

    .line 330
    const/16 v3, 0x1f5

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    .line 338
    :goto_9
    invoke-virtual {p1}, Lorg/apache/http/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 339
    .local v1, "message":Ljava/lang/String;
    if-nez v1, :cond_13

    .line 340
    invoke-virtual {p1}, Lorg/apache/http/HttpException;->toString()Ljava/lang/String;

    move-result-object v1

    .line 342
    :cond_13
    invoke-static {v1}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 343
    .local v2, "msg":[B
    new-instance v0, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v0, v2}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 344
    .local v0, "entity":Lorg/apache/http/entity/ByteArrayEntity;
    const-string v3, "text/plain; charset=US-ASCII"

    invoke-virtual {v0, v3}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 345
    invoke-interface {p2, v0}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 346
    return-void

    .line 331
    .end local v0    # "entity":Lorg/apache/http/entity/ByteArrayEntity;
    .end local v1    # "message":Ljava/lang/String;
    .end local v2    # "msg":[B
    :cond_25
    instance-of v3, p1, Lorg/apache/http/UnsupportedHttpVersionException;

    if-eqz v3, :cond_2f

    .line 332
    const/16 v3, 0x1f9

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_9

    .line 333
    :cond_2f
    instance-of v3, p1, Lorg/apache/http/ProtocolException;

    if-eqz v3, :cond_39

    .line 334
    const/16 v3, 0x190

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_9

    .line 336
    :cond_39
    const/16 v3, 0x1f4

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_9
.end method

.method public handleRequest(Lorg/apache/http/HttpServerConnection;Lorg/apache/http/protocol/HttpContext;)V
    .registers 13
    .param p1, "conn"    # Lorg/apache/http/HttpServerConnection;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x1f4

    const/16 v8, 0xc8

    .line 240
    const-string v5, "http.connection"

    invoke-interface {p2, v5, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 242
    const/4 v4, 0x0

    .line 246
    .local v4, "response":Lorg/apache/http/HttpResponse;
    :try_start_a
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->receiveRequestHeader()Lorg/apache/http/HttpRequest;

    move-result-object v3

    .line 247
    .local v3, "request":Lorg/apache/http/HttpRequest;
    new-instance v5, Lorg/apache/http/params/DefaultedHttpParams;

    invoke-interface {v3}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    invoke-direct {v5, v6, v7}, Lorg/apache/http/params/DefaultedHttpParams;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    invoke-interface {v3, v5}, Lorg/apache/http/HttpRequest;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 250
    instance-of v5, v3, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_63

    .line 252
    move-object v0, v3

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {v5}, Lorg/apache/http/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v5

    if-eqz v5, :cond_ef

    .line 253
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v7, 0x64

    invoke-interface {v5, v6, v7, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 255
    new-instance v5, Lorg/apache/http/params/DefaultedHttpParams;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    invoke-direct {v5, v6, v7}, Lorg/apache/http/params/DefaultedHttpParams;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 258
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;
    :try_end_44
    .catch Lorg/apache/http/HttpException; {:try_start_a .. :try_end_44} :catch_d4

    if-eqz v5, :cond_4b

    .line 260
    :try_start_46
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    invoke-interface {v5, v3, v4, p2}, Lorg/apache/http/protocol/HttpExpectationVerifier;->verify(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    :try_end_4b
    .catch Lorg/apache/http/HttpException; {:try_start_46 .. :try_end_4b} :catch_b6

    .line 269
    :cond_4b
    :goto_4b
    :try_start_4b
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    if-ge v5, v8, :cond_63

    .line 272
    invoke-interface {p1, v4}, Lorg/apache/http/HttpServerConnection;->sendResponseHeader(Lorg/apache/http/HttpResponse;)V

    .line 273
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->flush()V

    .line 274
    const/4 v4, 0x0

    .line 275
    move-object v0, v3

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {p1, v5}, Lorg/apache/http/HttpServerConnection;->receiveRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 282
    :cond_63
    :goto_63
    const-string v5, "http.request"

    invoke-interface {p2, v5, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 284
    if-nez v4, :cond_8a

    .line 285
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v7, 0xc8

    invoke-interface {v5, v6, v7, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 287
    new-instance v5, Lorg/apache/http/params/DefaultedHttpParams;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    invoke-direct {v5, v6, v7}, Lorg/apache/http/params/DefaultedHttpParams;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 289
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-interface {v5, v3, p2}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 290
    invoke-virtual {p0, v3, v4, p2}, Lorg/apache/http/protocol/HttpService;->doService(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 294
    :cond_8a
    instance-of v5, v3, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_97

    .line 295
    check-cast v3, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local v3    # "request":Lorg/apache/http/HttpRequest;
    invoke-interface {v3}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 296
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_97
    .catch Lorg/apache/http/HttpException; {:try_start_4b .. :try_end_97} :catch_d4

    .line 308
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    :cond_97
    :goto_97
    const-string v5, "http.response"

    invoke-interface {p2, v5, v4}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 310
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-interface {v5, v4, p2}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 311
    invoke-interface {p1, v4}, Lorg/apache/http/HttpServerConnection;->sendResponseHeader(Lorg/apache/http/HttpResponse;)V

    .line 312
    invoke-interface {p1, v4}, Lorg/apache/http/HttpServerConnection;->sendResponseEntity(Lorg/apache/http/HttpResponse;)V

    .line 313
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->flush()V

    .line 315
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    invoke-interface {v5, v4, p2}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v5

    if-nez v5, :cond_b5

    .line 316
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->close()V

    .line 318
    :cond_b5
    return-void

    .line 261
    .restart local v3    # "request":Lorg/apache/http/HttpRequest;
    :catch_b6
    move-exception v2

    .line 262
    .local v2, "ex":Lorg/apache/http/HttpException;
    :try_start_b7
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    const/16 v7, 0x1f4

    invoke-interface {v5, v6, v7, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 264
    new-instance v5, Lorg/apache/http/params/DefaultedHttpParams;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    invoke-direct {v5, v6, v7}, Lorg/apache/http/params/DefaultedHttpParams;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 266
    invoke-virtual {p0, v2, v4}, Lorg/apache/http/protocol/HttpService;->handleException(Lorg/apache/http/HttpException;Lorg/apache/http/HttpResponse;)V
    :try_end_d2
    .catch Lorg/apache/http/HttpException; {:try_start_b7 .. :try_end_d2} :catch_d4

    goto/16 :goto_4b

    .line 299
    .end local v2    # "ex":Lorg/apache/http/HttpException;
    .end local v3    # "request":Lorg/apache/http/HttpRequest;
    :catch_d4
    move-exception v2

    .line 300
    .restart local v2    # "ex":Lorg/apache/http/HttpException;
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-interface {v5, v6, v9, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 303
    new-instance v5, Lorg/apache/http/params/DefaultedHttpParams;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    invoke-direct {v5, v6, v7}, Lorg/apache/http/params/DefaultedHttpParams;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 305
    invoke-virtual {p0, v2, v4}, Lorg/apache/http/protocol/HttpService;->handleException(Lorg/apache/http/HttpException;Lorg/apache/http/HttpResponse;)V

    goto :goto_97

    .line 278
    .end local v2    # "ex":Lorg/apache/http/HttpException;
    .restart local v3    # "request":Lorg/apache/http/HttpRequest;
    :cond_ef
    :try_start_ef
    move-object v0, v3

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {p1, v5}, Lorg/apache/http/HttpServerConnection;->receiveRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    :try_end_f6
    .catch Lorg/apache/http/HttpException; {:try_start_ef .. :try_end_f6} :catch_d4

    goto/16 :goto_63
.end method

.method public setConnReuseStrategy(Lorg/apache/http/ConnectionReuseStrategy;)V
    .registers 4
    .param p1, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 181
    if-nez p1, :cond_a

    .line 182
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Connection reuse strategy may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :cond_a
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 185
    return-void
.end method

.method public setExpectationVerifier(Lorg/apache/http/protocol/HttpExpectationVerifier;)V
    .registers 2
    .param p1, "expectationVerifier"    # Lorg/apache/http/protocol/HttpExpectationVerifier;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 219
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 220
    return-void
.end method

.method public setHandlerResolver(Lorg/apache/http/protocol/HttpRequestHandlerResolver;)V
    .registers 2
    .param p1, "handlerResolver"    # Lorg/apache/http/protocol/HttpRequestHandlerResolver;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 211
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->handlerResolver:Lorg/apache/http/protocol/HttpRequestHandlerResolver;

    .line 212
    return-void
.end method

.method public setHttpProcessor(Lorg/apache/http/protocol/HttpProcessor;)V
    .registers 4
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 170
    if-nez p1, :cond_a

    .line 171
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP processor may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_a
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 174
    return-void
.end method

.method public setParams(Lorg/apache/http/params/HttpParams;)V
    .registers 2
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 203
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 204
    return-void
.end method

.method public setResponseFactory(Lorg/apache/http/HttpResponseFactory;)V
    .registers 4
    .param p1, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 192
    if-nez p1, :cond_a

    .line 193
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Response factory may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_a
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 196
    return-void
.end method
