.class public Lcom/koushikdutta/async/http/AsyncHttpClient;
.super Ljava/lang/Object;
.source "AsyncHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;,
        Lcom/koushikdutta/async/http/AsyncHttpClient$FileCallback;,
        Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;,
        Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;,
        Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;,
        Lcom/koushikdutta/async/http/AsyncHttpClient$DownloadCallback;,
        Lcom/koushikdutta/async/http/AsyncHttpClient$RequestCallbackBase;,
        Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final LOGTAG:Ljava/lang/String; = "AsyncHttp"

.field private static mDefaultInstance:Lcom/koushikdutta/async/http/AsyncHttpClient;


# instance fields
.field httpTransportMiddleware:Lcom/koushikdutta/async/http/HttpTransportMiddleware;

.field final mMiddleware:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;",
            ">;"
        }
    .end annotation
.end field

.field mServer:Lcom/koushikdutta/async/AsyncServer;

.field socketMiddleware:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

.field sslSocketMiddleware:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    const-class v0, Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/async/AsyncServer;)V
    .registers 4
    .param p1, "server"    # Lcom/koushikdutta/async/AsyncServer;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    .line 72
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    .line 73
    new-instance v0, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->socketMiddleware:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V

    .line 74
    new-instance v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->sslSocketMiddleware:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V

    .line 75
    new-instance v0, Lcom/koushikdutta/async/http/HttpTransportMiddleware;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/HttpTransportMiddleware;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->httpTransportMiddleware:Lcom/koushikdutta/async/http/HttpTransportMiddleware;

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V

    .line 76
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->sslSocketMiddleware:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    new-instance v1, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;

    invoke-direct {v1}, Lcom/koushikdutta/async/http/SSLEngineSNIConfigurator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->addEngineConfigurator(Lcom/koushikdutta/async/http/AsyncSSLEngineConfigurator;)V

    .line 77
    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    .registers 5
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "x2"    # I
    .param p3, "x3"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p4, "x4"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/koushikdutta/async/http/AsyncHttpClient;->executeAffinity(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/http/AsyncHttpResponse;)V
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/callback/RequestCallback;
    .param p2, "x2"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->invokeConnect(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/http/AsyncHttpResponse;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/http/AsyncHttpResponse;JJ)V
    .registers 7
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/callback/RequestCallback;
    .param p2, "x2"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;
    .param p3, "x3"    # J
    .param p5, "x4"    # J

    .prologue
    .line 50
    invoke-direct/range {p0 .. p6}, Lcom/koushikdutta/async/http/AsyncHttpClient;->invokeProgress(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/http/AsyncHttpResponse;JJ)V

    return-void
.end method

.method static synthetic access$200(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    .registers 6
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p2, "x2"    # Ljava/lang/Exception;
    .param p3, "x3"    # Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;
    .param p4, "x4"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p5, "x5"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    .prologue
    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    return-void
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;)V
    .registers 6
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "x2"    # I
    .param p3, "x3"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p4, "x4"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;
    .param p5, "x5"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    .prologue
    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->executeSocket(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;)V

    return-void
.end method

.method static synthetic access$400(Lcom/koushikdutta/async/http/AsyncHttpRequest;)J
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 50
    invoke-static {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getTimeoutRemaining(Lcom/koushikdutta/async/http/AsyncHttpRequest;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$500(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 50
    invoke-static {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->setupAndroidProxy(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    return-void
.end method

.method static synthetic access$600(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-static {p0, p1, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->copyHeader(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    .registers 5
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "x2"    # I
    .param p3, "x3"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p4, "x4"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    return-void
.end method

.method static synthetic access$800(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 6
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/callback/RequestCallback;
    .param p2, "x2"    # Lcom/koushikdutta/async/future/SimpleFuture;
    .param p3, "x3"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;
    .param p4, "x4"    # Ljava/lang/Exception;
    .param p5, "x5"    # Ljava/lang/Object;

    .prologue
    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->invokeWithAffinity(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$900(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 6
    .param p0, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpClient;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/callback/RequestCallback;
    .param p2, "x2"    # Lcom/koushikdutta/async/future/SimpleFuture;
    .param p3, "x3"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;
    .param p4, "x4"    # Ljava/lang/Exception;
    .param p5, "x5"    # Ljava/lang/Object;

    .prologue
    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->invoke(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method private static copyHeader(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V
    .registers 5
    .param p0, "from"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p1, "to"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "header"    # Ljava/lang/String;

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "value":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 204
    invoke-virtual {p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 205
    :cond_15
    return-void
.end method

.method private execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    .registers 12
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "redirectCount"    # I
    .param p3, "cancel"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p4, "callback"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v0}, Lcom/koushikdutta/async/AsyncServer;->isAffinityThread()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 183
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/koushikdutta/async/http/AsyncHttpClient;->executeAffinity(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    .line 193
    :goto_b
    return-void

    .line 186
    :cond_c
    iget-object v6, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpClient$1;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/http/AsyncHttpClient$1;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    invoke-virtual {v6, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    goto :goto_b
.end method

.method private executeAffinity(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    .registers 20
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "redirectCount"    # I
    .param p3, "cancel"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p4, "callback"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    .prologue
    .line 208
    sget-boolean v1, Lcom/koushikdutta/async/http/AsyncHttpClient;->$assertionsDisabled:Z

    if-nez v1, :cond_12

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v1}, Lcom/koushikdutta/async/AsyncServer;->isAffinityThread()Z

    move-result v1

    if-nez v1, :cond_12

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 209
    :cond_12
    const/16 v1, 0xf

    move/from16 v0, p2

    if-le v0, v1, :cond_2b

    .line 210
    new-instance v3, Lcom/koushikdutta/async/http/RedirectLimitExceededException;

    const-string v1, "too many redirects"

    invoke-direct {v3, v1}, Lcom/koushikdutta/async/http/RedirectLimitExceededException;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    move-object v1, p0

    move-object/from16 v2, p3

    move-object/from16 v5, p1

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/koushikdutta/async/http/AsyncHttpClient;->reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    .line 313
    :goto_2a
    return-void

    .line 213
    :cond_2b
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v14

    .line 214
    .local v14, "uri":Landroid/net/Uri;
    new-instance v3, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    invoke-direct {v3}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;-><init>()V

    .line 215
    .local v3, "data":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p1

    iput-wide v1, v0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->executionTime:J

    .line 216
    move-object/from16 v0, p1

    iput-object v0, v3, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 218
    const-string v1, "Executing request."

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 220
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    monitor-enter v2

    .line 221
    :try_start_4a
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_50
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_63

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 222
    .local v12, "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    invoke-interface {v12, v3}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;->onRequest(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestData;)V

    goto :goto_50

    .line 224
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v12    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    :catchall_60
    move-exception v1

    monitor-exit v2
    :try_end_62
    .catchall {:try_start_4a .. :try_end_62} :catchall_60

    throw v1

    .restart local v11    # "i$":Ljava/util/Iterator;
    :cond_63
    :try_start_63
    monitor-exit v2
    :try_end_64
    .catchall {:try_start_63 .. :try_end_64} :catchall_60

    .line 236
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getTimeout()I

    move-result v1

    if-lez v1, :cond_8c

    .line 238
    new-instance v1, Lcom/koushikdutta/async/http/AsyncHttpClient$2;

    move-object v2, p0

    move-object/from16 v4, p3

    move-object/from16 v5, p1

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/koushikdutta/async/http/AsyncHttpClient$2;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    move-object/from16 v0, p3

    iput-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->timeoutRunnable:Ljava/lang/Runnable;

    .line 250
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->timeoutRunnable:Ljava/lang/Runnable;

    invoke-static/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getTimeoutRemaining(Lcom/koushikdutta/async/http/AsyncHttpRequest;)J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Lcom/koushikdutta/async/AsyncServer;->postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v0, p3

    iput-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->scheduled:Ljava/lang/Object;

    .line 254
    :cond_8c
    new-instance v4, Lcom/koushikdutta/async/http/AsyncHttpClient$3;

    move-object v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object v9, v3

    move/from16 v10, p2

    invoke-direct/range {v4 .. v10}, Lcom/koushikdutta/async/http/AsyncHttpClient$3;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;I)V

    iput-object v4, v3, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->connectCallback:Lcom/koushikdutta/async/callback/ConnectCallback;

    .line 292
    invoke-static/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpClient;->setupAndroidProxy(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    .line 295
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v1

    if-eqz v1, :cond_c3

    .line 296
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_c3

    .line 297
    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    const-string v2, "Content-Type"

    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v4

    invoke-interface {v4}, Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;->getContentType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 301
    :cond_c3
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    monitor-enter v2

    .line 302
    :try_start_c6
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_cc
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_eb

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 303
    .restart local v12    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    invoke-interface {v12, v3}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v13

    .line 304
    .local v13, "socketCancellable":Lcom/koushikdutta/async/future/Cancellable;
    if-eqz v13, :cond_cc

    .line 305
    iput-object v13, v3, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socketCancellable:Lcom/koushikdutta/async/future/Cancellable;

    .line 306
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 307
    monitor-exit v2

    goto/16 :goto_2a

    .line 311
    .end local v12    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    .end local v13    # "socketCancellable":Lcom/koushikdutta/async/future/Cancellable;
    :catchall_e8
    move-exception v1

    monitor-exit v2
    :try_end_ea
    .catchall {:try_start_c6 .. :try_end_ea} :catchall_e8

    throw v1

    .line 310
    :cond_eb
    :try_start_eb
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid uri="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " middlewares="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v4, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 311
    .local v6, "unsupportedURI":Ljava/lang/Exception;
    monitor-exit v2
    :try_end_114
    .catchall {:try_start_eb .. :try_end_114} :catchall_e8

    .line 312
    const/4 v7, 0x0

    move-object v4, p0

    move-object/from16 v5, p3

    move-object/from16 v8, p1

    move-object/from16 v9, p4

    invoke-direct/range {v4 .. v9}, Lcom/koushikdutta/async/http/AsyncHttpClient;->reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    goto/16 :goto_2a
.end method

.method private executeSocket(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;)V
    .registers 16
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "redirectCount"    # I
    .param p3, "cancel"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p4, "callback"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;
    .param p5, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    .prologue
    .line 321
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move-object v4, p1

    move-object v5, p4

    move-object v6, p5

    move v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;I)V

    .line 462
    .local v0, "ret":Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;
    new-instance v1, Lcom/koushikdutta/async/http/AsyncHttpClient$5;

    invoke-direct {v1, p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$5;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;)V

    iput-object v1, p5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->sendHeadersCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 471
    new-instance v1, Lcom/koushikdutta/async/http/AsyncHttpClient$6;

    invoke-direct {v1, p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$6;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;)V

    iput-object v1, p5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->receiveHeadersCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 480
    iput-object v0, p5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 481
    iget-object v1, p5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->setSocket(Lcom/koushikdutta/async/AsyncSocket;)V

    .line 483
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    monitor-enter v2

    .line 484
    :try_start_24
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_2a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 485
    .local v9, "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    invoke-interface {v9, p5}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;->exchangeHeaders(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 488
    .end local v9    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    :cond_3c
    monitor-exit v2

    .line 489
    return-void

    .line 488
    .end local v8    # "i$":Ljava/util/Iterator;
    :catchall_3e
    move-exception v1

    monitor-exit v2
    :try_end_40
    .catchall {:try_start_24 .. :try_end_40} :catchall_3e

    throw v1
.end method

.method public static getDefaultInstance()Lcom/koushikdutta/async/http/AsyncHttpClient;
    .registers 2

    .prologue
    .line 53
    sget-object v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mDefaultInstance:Lcom/koushikdutta/async/http/AsyncHttpClient;

    if-nez v0, :cond_f

    .line 54
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-static {}, Lcom/koushikdutta/async/AsyncServer;->getDefault()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpClient;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    sput-object v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mDefaultInstance:Lcom/koushikdutta/async/http/AsyncHttpClient;

    .line 56
    :cond_f
    sget-object v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mDefaultInstance:Lcom/koushikdutta/async/http/AsyncHttpClient;

    return-object v0
.end method

.method private static getTimeoutRemaining(Lcom/koushikdutta/async/http/AsyncHttpRequest;)J
    .registers 3
    .param p0, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getTimeout()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method private invoke(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 13
    .param p3, "response"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;
    .param p4, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/callback/RequestCallback",
            "<TT;>;",
            "Lcom/koushikdutta/async/future/SimpleFuture",
            "<TT;>;",
            "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
            "Ljava/lang/Exception;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 544
    .local p1, "callback":Lcom/koushikdutta/async/http/callback/RequestCallback;, "Lcom/koushikdutta/async/http/callback/RequestCallback<TT;>;"
    .local p2, "future":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<TT;>;"
    .local p5, "result":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpClient$7;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/koushikdutta/async/http/AsyncHttpClient$7;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;Ljava/lang/Object;)V

    .line 550
    .local v0, "runnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 551
    return-void
.end method

.method private invokeConnect(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/http/AsyncHttpResponse;)V
    .registers 3
    .param p1, "callback"    # Lcom/koushikdutta/async/http/callback/RequestCallback;
    .param p2, "response"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;

    .prologue
    .line 559
    if-eqz p1, :cond_5

    .line 560
    invoke-interface {p1, p2}, Lcom/koushikdutta/async/http/callback/RequestCallback;->onConnect(Lcom/koushikdutta/async/http/AsyncHttpResponse;)V

    .line 561
    :cond_5
    return-void
.end method

.method private invokeProgress(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/http/AsyncHttpResponse;JJ)V
    .registers 7
    .param p1, "callback"    # Lcom/koushikdutta/async/http/callback/RequestCallback;
    .param p2, "response"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;
    .param p3, "downloaded"    # J
    .param p5, "total"    # J

    .prologue
    .line 554
    if-eqz p1, :cond_5

    .line 555
    invoke-interface/range {p1 .. p6}, Lcom/koushikdutta/async/http/callback/RequestCallback;->onProgress(Lcom/koushikdutta/async/http/AsyncHttpResponse;JJ)V

    .line 556
    :cond_5
    return-void
.end method

.method private invokeWithAffinity(Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpResponse;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 7
    .param p3, "response"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;
    .param p4, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/callback/RequestCallback",
            "<TT;>;",
            "Lcom/koushikdutta/async/future/SimpleFuture",
            "<TT;>;",
            "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
            "Ljava/lang/Exception;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 533
    .local p1, "callback":Lcom/koushikdutta/async/http/callback/RequestCallback;, "Lcom/koushikdutta/async/http/callback/RequestCallback<TT;>;"
    .local p2, "future":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<TT;>;"
    .local p5, "result":Ljava/lang/Object;, "TT;"
    if-eqz p4, :cond_9

    .line 534
    invoke-virtual {p2, p4}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    move-result v0

    .line 537
    .local v0, "complete":Z
    :goto_6
    if-nez v0, :cond_e

    .line 541
    :cond_8
    :goto_8
    return-void

    .line 536
    .end local v0    # "complete":Z
    :cond_9
    invoke-virtual {p2, p5}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Object;)Z

    move-result v0

    .restart local v0    # "complete":Z
    goto :goto_6

    .line 539
    :cond_e
    if-eqz p1, :cond_8

    .line 540
    invoke-interface {p1, p4, p3, p5}, Lcom/koushikdutta/async/http/callback/RequestCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_8
.end method

.method private reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    .registers 9
    .param p1, "cancel"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .param p2, "ex"    # Ljava/lang/Exception;
    .param p3, "response"    # Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;
    .param p4, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p5, "callback"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    .prologue
    .line 157
    sget-boolean v1, Lcom/koushikdutta/async/http/AsyncHttpClient;->$assertionsDisabled:Z

    if-nez v1, :cond_c

    if-nez p5, :cond_c

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 158
    :cond_c
    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->scheduled:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/AsyncServer;->removeAllCallbacks(Ljava/lang/Object;)V

    .line 160
    if-eqz p2, :cond_41

    .line 161
    const-string v1, "Connection error"

    invoke-virtual {p4, v1, p2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->loge(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 162
    invoke-virtual {p1, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->setComplete(Ljava/lang/Exception;)Z

    move-result v0

    .line 168
    .local v0, "complete":Z
    :goto_1e
    if-eqz v0, :cond_4b

    .line 169
    invoke-interface {p5, p2, p3}, Lcom/koushikdutta/async/http/callback/HttpConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponse;)V

    .line 170
    sget-boolean v1, Lcom/koushikdutta/async/http/AsyncHttpClient;->$assertionsDisabled:Z

    if-nez v1, :cond_58

    if-nez p2, :cond_58

    invoke-virtual {p3}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->socket()Lcom/koushikdutta/async/AsyncSocket;

    move-result-object v1

    if-eqz v1, :cond_58

    invoke-virtual {p3}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->getDataCallback()Lcom/koushikdutta/async/callback/DataCallback;

    move-result-object v1

    if-nez v1, :cond_58

    invoke-virtual {p3}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->isPaused()Z

    move-result v1

    if-nez v1, :cond_58

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 165
    .end local v0    # "complete":Z
    :cond_41
    const-string v1, "Connection successful"

    invoke-virtual {p4, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 166
    invoke-virtual {p1, p3}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->setComplete(Ljava/lang/Object;)Z

    move-result v0

    .restart local v0    # "complete":Z
    goto :goto_1e

    .line 174
    :cond_4b
    if-eqz p3, :cond_58

    .line 176
    new-instance v1, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;

    invoke-direct {v1}, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;-><init>()V

    invoke-virtual {p3, v1}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 177
    invoke-virtual {p3}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->close()V

    .line 179
    :cond_58
    return-void
.end method

.method private static setupAndroidProxy(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 9
    .param p0, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 82
    iget-object v6, p0, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyHost:Ljava/lang/String;

    if-eqz v6, :cond_5

    .line 113
    :cond_4
    :goto_4
    return-void

    .line 87
    :cond_5
    :try_start_5
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v6

    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_18} :catch_4e

    move-result-object v2

    .line 93
    .local v2, "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    .line 95
    const/4 v6, 0x0

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/Proxy;

    .line 96
    .local v3, "proxy":Ljava/net/Proxy;
    invoke-virtual {v3}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v6

    sget-object v7, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v6, v7, :cond_4

    .line 98
    invoke-virtual {v3}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v6

    instance-of v6, v6, Ljava/net/InetSocketAddress;

    if-eqz v6, :cond_4

    .line 100
    invoke-virtual {v3}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v4

    check-cast v4, Ljava/net/InetSocketAddress;

    .line 102
    .local v4, "proxyAddress":Ljava/net/InetSocketAddress;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xe

    if-lt v6, v7, :cond_50

    .line 103
    invoke-virtual {v4}, Ljava/net/InetSocketAddress;->getHostString()Ljava/lang/String;

    move-result-object v5

    .line 112
    .local v5, "proxyHost":Ljava/lang/String;
    :goto_46
    invoke-virtual {v4}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v6

    invoke-virtual {p0, v5, v6}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->enableProxy(Ljava/lang/String;I)V

    goto :goto_4

    .line 89
    .end local v2    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .end local v3    # "proxy":Ljava/net/Proxy;
    .end local v4    # "proxyAddress":Ljava/net/InetSocketAddress;
    .end local v5    # "proxyHost":Ljava/lang/String;
    :catch_4e
    move-exception v1

    .line 91
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_4

    .line 106
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .restart local v3    # "proxy":Ljava/net/Proxy;
    .restart local v4    # "proxyAddress":Ljava/net/InetSocketAddress;
    :cond_50
    invoke-virtual {v4}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 107
    .local v0, "address":Ljava/net/InetAddress;
    if-eqz v0, :cond_5b

    .line 108
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "proxyHost":Ljava/lang/String;
    goto :goto_46

    .line 110
    .end local v5    # "proxyHost":Ljava/lang/String;
    :cond_5b
    invoke-virtual {v4}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "proxyHost":Ljava/lang/String;
    goto :goto_46
.end method


# virtual methods
.method public execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 6
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "callback"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/async/http/callback/HttpConnectCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    const/4 v1, 0x0

    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$1;)V

    .local v0, "ret":Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    invoke-direct {p0, p1, v1, v0, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    .line 126
    return-object v0
.end method

.method public execute(Ljava/lang/String;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/koushikdutta/async/http/callback/HttpConnectCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/async/http/callback/HttpConnectCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/http/AsyncHttpResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpGet;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/http/AsyncHttpGet;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/parser/AsyncParser;Lcom/koushikdutta/async/http/callback/RequestCallback;)Lcom/koushikdutta/async/future/SimpleFuture;
    .registers 8
    .param p1, "req"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/async/parser/AsyncParser",
            "<TT;>;",
            "Lcom/koushikdutta/async/http/callback/RequestCallback",
            "<TT;>;)",
            "Lcom/koushikdutta/async/future/SimpleFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 645
    .local p2, "parser":Lcom/koushikdutta/async/parser/AsyncParser;, "Lcom/koushikdutta/async/parser/AsyncParser<TT;>;"
    .local p3, "callback":Lcom/koushikdutta/async/http/callback/RequestCallback;, "Lcom/koushikdutta/async/http/callback/RequestCallback<TT;>;"
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$1;)V

    .line 646
    .local v0, "cancel":Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    new-instance v1, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v1}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 647
    .local v1, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<TT;>;"
    const/4 v2, 0x0

    new-instance v3, Lcom/koushikdutta/async/http/AsyncHttpClient$10;

    invoke-direct {v3, p0, p3, v1, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient$10;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/callback/RequestCallback;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/parser/AsyncParser;)V

    invoke-direct {p0, p1, v2, v0, v3}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    .line 668
    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/future/SimpleFuture;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 669
    return-object v1
.end method

.method public executeByteBufferList(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpClient$DownloadCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "callback"    # Lcom/koushikdutta/async/http/AsyncHttpClient$DownloadCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/async/http/AsyncHttpClient$DownloadCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/ByteBufferList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 516
    new-instance v0, Lcom/koushikdutta/async/parser/ByteBufferListParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/ByteBufferListParser;-><init>()V

    invoke-virtual {p0, p1, v0, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/parser/AsyncParser;Lcom/koushikdutta/async/http/callback/RequestCallback;)Lcom/koushikdutta/async/future/SimpleFuture;

    move-result-object v0

    return-object v0
.end method

.method public executeFile(Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$FileCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 14
    .param p1, "req"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/koushikdutta/async/http/AsyncHttpClient$FileCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/async/http/AsyncHttpClient$FileCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 564
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 565
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 568
    :try_start_c
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 v1, 0x2000

    invoke-direct {v2, v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_18
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_18} :catch_33

    .line 575
    .local v2, "fout":Ljava/io/OutputStream;
    new-instance v6, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    const/4 v0, 0x0

    invoke-direct {v6, p0, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$1;)V

    .line 576
    .local v6, "cancel":Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    new-instance v5, Lcom/koushikdutta/async/http/AsyncHttpClient$8;

    invoke-direct {v5, p0, v6, v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpClient$8;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/io/OutputStream;Ljava/io/File;)V

    .line 593
    .local v5, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Ljava/io/File;>;"
    invoke-virtual {v5, v6}, Lcom/koushikdutta/async/future/SimpleFuture;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 594
    const/4 v9, 0x0

    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpClient$9;

    move-object v1, p0

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/http/AsyncHttpClient$9;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Ljava/io/OutputStream;Ljava/io/File;Lcom/koushikdutta/async/http/AsyncHttpClient$FileCallback;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-direct {p0, p1, v9, v6, v0}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    move-object v8, v5

    .line 641
    .end local v2    # "fout":Ljava/io/OutputStream;
    .end local v5    # "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Ljava/io/File;>;"
    .end local v6    # "cancel":Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;
    .local v8, "ret":Ljava/lang/Object;, "Lcom/koushikdutta/async/future/SimpleFuture<Ljava/io/File;>;"
    :goto_32
    return-object v8

    .line 570
    .end local v8    # "ret":Ljava/lang/Object;, "Lcom/koushikdutta/async/future/SimpleFuture<Ljava/io/File;>;"
    :catch_33
    move-exception v7

    .line 571
    .local v7, "e":Ljava/io/FileNotFoundException;
    new-instance v5, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v5}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 572
    .restart local v5    # "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Ljava/io/File;>;"
    invoke-virtual {v5, v7}, Lcom/koushikdutta/async/future/SimpleFuture;->setComplete(Ljava/lang/Exception;)Z

    move-object v8, v5

    .line 573
    .restart local v8    # "ret":Ljava/lang/Object;, "Lcom/koushikdutta/async/future/SimpleFuture<Ljava/io/File;>;"
    goto :goto_32
.end method

.method public executeJSONArray(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "req"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "callback"    # Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONArrayCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation

    .prologue
    .line 528
    new-instance v0, Lcom/koushikdutta/async/parser/JSONArrayParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/JSONArrayParser;-><init>()V

    invoke-virtual {p0, p1, v0, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/parser/AsyncParser;Lcom/koushikdutta/async/http/callback/RequestCallback;)Lcom/koushikdutta/async/future/SimpleFuture;

    move-result-object v0

    return-object v0
.end method

.method public executeJSONObject(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "req"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "callback"    # Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/async/http/AsyncHttpClient$JSONObjectCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 524
    new-instance v0, Lcom/koushikdutta/async/parser/JSONObjectParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/JSONObjectParser;-><init>()V

    invoke-virtual {p0, p1, v0, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/parser/AsyncParser;Lcom/koushikdutta/async/http/callback/RequestCallback;)Lcom/koushikdutta/async/future/SimpleFuture;

    move-result-object v0

    return-object v0
.end method

.method public executeString(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "req"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "callback"    # Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/async/http/AsyncHttpClient$StringCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 520
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {p0, p1, v0, p2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/parser/AsyncParser;Lcom/koushikdutta/async/http/callback/RequestCallback;)Lcom/koushikdutta/async/future/SimpleFuture;

    move-result-object v0

    return-object v0
.end method

.method public getMiddleware()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSSLSocketMiddleware()Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->sslSocketMiddleware:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    return-object v0
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 714
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    return-object v0
.end method

.method public getSocketMiddleware()Lcom/koushikdutta/async/http/AsyncSocketMiddleware;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->socketMiddleware:Lcom/koushikdutta/async/http/AsyncSocketMiddleware;

    return-object v0
.end method

.method public insertMiddleware(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;)V
    .registers 4
    .param p1, "middleware"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 65
    return-void
.end method

.method public websocket(Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 7
    .param p1, "req"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "protocol"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/http/WebSocket;",
            ">;"
        }
    .end annotation

    .prologue
    .line 677
    invoke-static {p1, p2}, Lcom/koushikdutta/async/http/WebSocketImpl;->addWebSocketUpgradeHeaders(Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V

    .line 678
    new-instance v1, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v1}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 679
    .local v1, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/async/http/WebSocket;>;"
    new-instance v2, Lcom/koushikdutta/async/http/AsyncHttpClient$11;

    invoke-direct {v2, p0, v1, p3, p1}, Lcom/koushikdutta/async/http/AsyncHttpClient$11;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    invoke-virtual {p0, p1, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    .line 703
    .local v0, "connect":Lcom/koushikdutta/async/future/Cancellable;
    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/future/SimpleFuture;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 704
    return-object v1
.end method

.method public websocket(Ljava/lang/String;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;)Lcom/koushikdutta/async/future/Future;
    .registers 8
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "protocol"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/http/WebSocket;",
            ">;"
        }
    .end annotation

    .prologue
    .line 709
    new-instance v0, Lcom/koushikdutta/async/http/AsyncHttpGet;

    const-string v1, "ws://"

    const-string v2, "http://"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "wss://"

    const-string v3, "https://"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpGet;-><init>(Ljava/lang/String;)V

    .line 710
    .local v0, "get":Lcom/koushikdutta/async/http/AsyncHttpGet;
    invoke-virtual {p0, v0, p2, p3}, Lcom/koushikdutta/async/http/AsyncHttpClient;->websocket(Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;Lcom/koushikdutta/async/http/AsyncHttpClient$WebSocketConnectCallback;)Lcom/koushikdutta/async/future/Future;

    move-result-object v1

    return-object v1
.end method
