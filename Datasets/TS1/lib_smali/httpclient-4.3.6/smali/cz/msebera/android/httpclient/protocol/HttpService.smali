.class public Lcz/msebera/android/httpclient/protocol/HttpService;
.super Ljava/lang/Object;
.source "HttpService.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcz/msebera/android/httpclient/protocol/HttpService$HttpRequestHandlerResolverAdapter;
    }
.end annotation


# instance fields
.field private volatile connStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

.field private volatile expectationVerifier:Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;

.field private volatile handlerMapper:Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

.field private volatile params:Lcz/msebera/android/httpclient/params/HttpParams;

.field private volatile processor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

.field private volatile responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;)V
    .registers 5
    .param p1, "proc"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 81
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->processor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 82
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->handlerMapper:Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    .line 83
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->connStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 84
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    .line 85
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->expectationVerifier:Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;

    .line 161
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/protocol/HttpService;->setHttpProcessor(Lcz/msebera/android/httpclient/protocol/HttpProcessor;)V

    .line 162
    invoke-virtual {p0, p2}, Lcz/msebera/android/httpclient/protocol/HttpService;->setConnReuseStrategy(Lcz/msebera/android/httpclient/ConnectionReuseStrategy;)V

    .line 163
    invoke-virtual {p0, p3}, Lcz/msebera/android/httpclient/protocol/HttpService;->setResponseFactory(Lcz/msebera/android/httpclient/HttpResponseFactory;)V

    .line 164
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;)V
    .registers 11
    .param p1, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;
    .param p4, "handlerMapper"    # Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    .prologue
    .line 212
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/protocol/HttpService;-><init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;)V

    .line 213
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;)V
    .registers 7
    .param p1, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;
    .param p4, "handlerMapper"    # Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;
    .param p5, "expectationVerifier"    # Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;

    .prologue
    const/4 v0, 0x0

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 81
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->processor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 82
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->handlerMapper:Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    .line 83
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->connStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 84
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    .line 85
    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->expectationVerifier:Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;

    .line 186
    const-string v0, "HTTP processor"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->processor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 187
    if-eqz p2, :cond_27

    .end local p2    # "connStrategy":Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    :goto_1c
    iput-object p2, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->connStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 189
    if-eqz p3, :cond_2a

    .end local p3    # "responseFactory":Lcz/msebera/android/httpclient/HttpResponseFactory;
    :goto_20
    iput-object p3, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    .line 191
    iput-object p4, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->handlerMapper:Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    .line 192
    iput-object p5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->expectationVerifier:Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;

    .line 193
    return-void

    .line 187
    .restart local p2    # "connStrategy":Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .restart local p3    # "responseFactory":Lcz/msebera/android/httpclient/HttpResponseFactory;
    :cond_27
    sget-object p2, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;

    goto :goto_1c

    .line 189
    .end local p2    # "connStrategy":Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    :cond_2a
    sget-object p3, Lcz/msebera/android/httpclient/impl/DefaultHttpResponseFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/DefaultHttpResponseFactory;

    goto :goto_20
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 12
    .param p1, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;
    .param p4, "handlerResolver"    # Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;
    .param p5, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 137
    new-instance v4, Lcz/msebera/android/httpclient/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v4, p4}, Lcz/msebera/android/httpclient/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;)V

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/protocol/HttpService;-><init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;)V

    .line 142
    iput-object p5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 143
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 13
    .param p1, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;
    .param p4, "handlerResolver"    # Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;
    .param p5, "expectationVerifier"    # Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;
    .param p6, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 109
    new-instance v4, Lcz/msebera/android/httpclient/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v4, p4}, Lcz/msebera/android/httpclient/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/protocol/HttpService;-><init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;)V

    .line 114
    iput-object p6, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 115
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;)V
    .registers 9
    .param p1, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p2, "handlerMapper"    # Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    .prologue
    const/4 v2, 0x0

    .line 225
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, p2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/protocol/HttpService;-><init>(Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/ConnectionReuseStrategy;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;)V

    .line 226
    return-void
.end method


# virtual methods
.method protected doService(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 6
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 418
    const/4 v0, 0x0

    .line 419
    .local v0, "handler":Lcz/msebera/android/httpclient/protocol/HttpRequestHandler;
    iget-object v1, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->handlerMapper:Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    if-eqz v1, :cond_b

    .line 420
    iget-object v1, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->handlerMapper:Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;->lookup(Lcz/msebera/android/httpclient/HttpRequest;)Lcz/msebera/android/httpclient/protocol/HttpRequestHandler;

    move-result-object v0

    .line 422
    :cond_b
    if-eqz v0, :cond_11

    .line 423
    invoke-interface {v0, p1, p2, p3}, Lcz/msebera/android/httpclient/protocol/HttpRequestHandler;->handle(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 427
    :goto_10
    return-void

    .line 425
    :cond_11
    const/16 v1, 0x1f5

    invoke-interface {p2, v1}, Lcz/msebera/android/httpclient/HttpResponse;->setStatusCode(I)V

    goto :goto_10
.end method

.method public getParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 284
    iget-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method protected handleException(Lcz/msebera/android/httpclient/HttpException;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 7
    .param p1, "ex"    # Lcz/msebera/android/httpclient/HttpException;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 378
    instance-of v3, p1, Lcz/msebera/android/httpclient/MethodNotSupportedException;

    if-eqz v3, :cond_25

    .line 379
    const/16 v3, 0x1f5

    invoke-interface {p2, v3}, Lcz/msebera/android/httpclient/HttpResponse;->setStatusCode(I)V

    .line 387
    :goto_9
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 388
    .local v1, "message":Ljava/lang/String;
    if-nez v1, :cond_13

    .line 389
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/HttpException;->toString()Ljava/lang/String;

    move-result-object v1

    .line 391
    :cond_13
    invoke-static {v1}, Lcz/msebera/android/httpclient/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 392
    .local v2, "msg":[B
    new-instance v0, Lcz/msebera/android/httpclient/entity/ByteArrayEntity;

    invoke-direct {v0, v2}, Lcz/msebera/android/httpclient/entity/ByteArrayEntity;-><init>([B)V

    .line 393
    .local v0, "entity":Lcz/msebera/android/httpclient/entity/ByteArrayEntity;
    const-string v3, "text/plain; charset=US-ASCII"

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 394
    invoke-interface {p2, v0}, Lcz/msebera/android/httpclient/HttpResponse;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 395
    return-void

    .line 380
    .end local v0    # "entity":Lcz/msebera/android/httpclient/entity/ByteArrayEntity;
    .end local v1    # "message":Ljava/lang/String;
    .end local v2    # "msg":[B
    :cond_25
    instance-of v3, p1, Lcz/msebera/android/httpclient/UnsupportedHttpVersionException;

    if-eqz v3, :cond_2f

    .line 381
    const/16 v3, 0x1f9

    invoke-interface {p2, v3}, Lcz/msebera/android/httpclient/HttpResponse;->setStatusCode(I)V

    goto :goto_9

    .line 382
    :cond_2f
    instance-of v3, p1, Lcz/msebera/android/httpclient/ProtocolException;

    if-eqz v3, :cond_39

    .line 383
    const/16 v3, 0x190

    invoke-interface {p2, v3}, Lcz/msebera/android/httpclient/HttpResponse;->setStatusCode(I)V

    goto :goto_9

    .line 385
    :cond_39
    const/16 v3, 0x1f4

    invoke-interface {p2, v3}, Lcz/msebera/android/httpclient/HttpResponse;->setStatusCode(I)V

    goto :goto_9
.end method

.method public handleRequest(Lcz/msebera/android/httpclient/HttpServerConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 13
    .param p1, "conn"    # Lcz/msebera/android/httpclient/HttpServerConnection;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x1f4

    const/16 v8, 0xc8

    .line 301
    const-string v5, "http.connection"

    invoke-interface {p2, v5, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 303
    const/4 v4, 0x0

    .line 307
    .local v4, "response":Lcz/msebera/android/httpclient/HttpResponse;
    :try_start_a
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpServerConnection;->receiveRequestHeader()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v3

    .line 308
    .local v3, "request":Lcz/msebera/android/httpclient/HttpRequest;
    instance-of v5, v3, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_47

    .line 310
    move-object v0, v3

    check-cast v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {v5}, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v5

    if-eqz v5, :cond_a8

    .line 311
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    sget-object v6, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v7, 0x64

    invoke-interface {v5, v6, v7, p2}, Lcz/msebera/android/httpclient/HttpResponseFactory;->newHttpResponse(Lcz/msebera/android/httpclient/ProtocolVersion;ILcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v4

    .line 313
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->expectationVerifier:Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;
    :try_end_28
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_a .. :try_end_28} :catch_9b

    if-eqz v5, :cond_2f

    .line 315
    :try_start_2a
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->expectationVerifier:Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;

    invoke-interface {v5, v3, v4, p2}, Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;->verify(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    :try_end_2f
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_2a .. :try_end_2f} :catch_8c

    .line 322
    :cond_2f
    :goto_2f
    :try_start_2f
    invoke-interface {v4}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v5

    if-ge v5, v8, :cond_47

    .line 325
    invoke-interface {p1, v4}, Lcz/msebera/android/httpclient/HttpServerConnection;->sendResponseHeader(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 326
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpServerConnection;->flush()V

    .line 327
    const/4 v4, 0x0

    .line 328
    move-object v0, v3

    check-cast v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpServerConnection;->receiveRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V

    .line 335
    :cond_47
    :goto_47
    const-string v5, "http.request"

    invoke-interface {p2, v5, v3}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 337
    if-nez v4, :cond_60

    .line 338
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    sget-object v6, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v7, 0xc8

    invoke-interface {v5, v6, v7, p2}, Lcz/msebera/android/httpclient/HttpResponseFactory;->newHttpResponse(Lcz/msebera/android/httpclient/ProtocolVersion;ILcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v4

    .line 340
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->processor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    invoke-interface {v5, v3, p2}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 341
    invoke-virtual {p0, v3, v4, p2}, Lcz/msebera/android/httpclient/protocol/HttpService;->doService(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 345
    :cond_60
    instance-of v5, v3, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_6d

    .line 346
    check-cast v3, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    .end local v3    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {v3}, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v1

    .line 347
    .local v1, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-static {v1}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V
    :try_end_6d
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_2f .. :try_end_6d} :catch_9b

    .line 357
    .end local v1    # "entity":Lcz/msebera/android/httpclient/HttpEntity;
    :cond_6d
    :goto_6d
    const-string v5, "http.response"

    invoke-interface {p2, v5, v4}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 359
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->processor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    invoke-interface {v5, v4, p2}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 360
    invoke-interface {p1, v4}, Lcz/msebera/android/httpclient/HttpServerConnection;->sendResponseHeader(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 361
    invoke-interface {p1, v4}, Lcz/msebera/android/httpclient/HttpServerConnection;->sendResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 362
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpServerConnection;->flush()V

    .line 364
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->connStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    invoke-interface {v5, v4, p2}, Lcz/msebera/android/httpclient/ConnectionReuseStrategy;->keepAlive(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v5

    if-nez v5, :cond_8b

    .line 365
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpServerConnection;->close()V

    .line 367
    :cond_8b
    return-void

    .line 316
    .restart local v3    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :catch_8c
    move-exception v2

    .line 317
    .local v2, "ex":Lcz/msebera/android/httpclient/HttpException;
    :try_start_8d
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    sget-object v6, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v7, 0x1f4

    invoke-interface {v5, v6, v7, p2}, Lcz/msebera/android/httpclient/HttpResponseFactory;->newHttpResponse(Lcz/msebera/android/httpclient/ProtocolVersion;ILcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v4

    .line 319
    invoke-virtual {p0, v2, v4}, Lcz/msebera/android/httpclient/protocol/HttpService;->handleException(Lcz/msebera/android/httpclient/HttpException;Lcz/msebera/android/httpclient/HttpResponse;)V
    :try_end_9a
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_8d .. :try_end_9a} :catch_9b

    goto :goto_2f

    .line 350
    .end local v2    # "ex":Lcz/msebera/android/httpclient/HttpException;
    .end local v3    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :catch_9b
    move-exception v2

    .line 351
    .restart local v2    # "ex":Lcz/msebera/android/httpclient/HttpException;
    iget-object v5, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    sget-object v6, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    .line 352
    invoke-interface {v5, v6, v9, p2}, Lcz/msebera/android/httpclient/HttpResponseFactory;->newHttpResponse(Lcz/msebera/android/httpclient/ProtocolVersion;ILcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v4

    .line 354
    invoke-virtual {p0, v2, v4}, Lcz/msebera/android/httpclient/protocol/HttpService;->handleException(Lcz/msebera/android/httpclient/HttpException;Lcz/msebera/android/httpclient/HttpResponse;)V

    goto :goto_6d

    .line 331
    .end local v2    # "ex":Lcz/msebera/android/httpclient/HttpException;
    .restart local v3    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_a8
    :try_start_a8
    move-object v0, v3

    check-cast v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/HttpServerConnection;->receiveRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V
    :try_end_af
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_a8 .. :try_end_af} :catch_9b

    goto :goto_47
.end method

.method public setConnReuseStrategy(Lcz/msebera/android/httpclient/ConnectionReuseStrategy;)V
    .registers 3
    .param p1, "connStrategy"    # Lcz/msebera/android/httpclient/ConnectionReuseStrategy;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 242
    const-string v0, "Connection reuse strategy"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 243
    iput-object p1, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->connStrategy:Lcz/msebera/android/httpclient/ConnectionReuseStrategy;

    .line 244
    return-void
.end method

.method public setExpectationVerifier(Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;)V
    .registers 2
    .param p1, "expectationVerifier"    # Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 276
    iput-object p1, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->expectationVerifier:Lcz/msebera/android/httpclient/protocol/HttpExpectationVerifier;

    .line 277
    return-void
.end method

.method public setHandlerResolver(Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;)V
    .registers 3
    .param p1, "handlerResolver"    # Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 268
    new-instance v0, Lcz/msebera/android/httpclient/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerResolver;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->handlerMapper:Lcz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper;

    .line 269
    return-void
.end method

.method public setHttpProcessor(Lcz/msebera/android/httpclient/protocol/HttpProcessor;)V
    .registers 3
    .param p1, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 233
    const-string v0, "HTTP processor"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 234
    iput-object p1, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->processor:Lcz/msebera/android/httpclient/protocol/HttpProcessor;

    .line 235
    return-void
.end method

.method public setParams(Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 2
    .param p1, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 260
    iput-object p1, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 261
    return-void
.end method

.method public setResponseFactory(Lcz/msebera/android/httpclient/HttpResponseFactory;)V
    .registers 3
    .param p1, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 251
    const-string v0, "Response factory"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 252
    iput-object p1, p0, Lcz/msebera/android/httpclient/protocol/HttpService;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    .line 253
    return-void
.end method
