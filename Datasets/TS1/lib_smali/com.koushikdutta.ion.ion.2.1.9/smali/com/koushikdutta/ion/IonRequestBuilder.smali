.class Lcom/koushikdutta/ion/IonRequestBuilder;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Lcom/koushikdutta/ion/builder/Builders$Any$B;
.implements Lcom/koushikdutta/ion/builder/Builders$Any$F;
.implements Lcom/koushikdutta/ion/builder/Builders$Any$M;
.implements Lcom/koushikdutta/ion/builder/Builders$Any$U;
.implements Lcom/koushikdutta/ion/builder/LoadBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;,
        Lcom/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
        "Lcom/koushikdutta/ion/builder/Builders$Any$F;",
        "Lcom/koushikdutta/ion/builder/Builders$Any$M;",
        "Lcom/koushikdutta/ion/builder/Builders$Any$U;",
        "Lcom/koushikdutta/ion/builder/LoadBuilder",
        "<",
        "Lcom/koushikdutta/ion/builder/Builders$Any$B;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field body:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

.field bodyParameters:Lcom/koushikdutta/async/http/Multimap;

.field contextReference:Lcom/koushikdutta/ion/ContextReference;

.field followRedirect:Z

.field groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field handler:Landroid/os/Handler;

.field headers:Lcom/koushikdutta/async/http/Headers;

.field headersCallback:Lcom/koushikdutta/ion/HeadersCallback;

.field ion:Lcom/koushikdutta/ion/Ion;

.field loadRequestCallback:Lcom/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback;

.field logLevel:I

.field logTag:Ljava/lang/String;

.field method:Ljava/lang/String;

.field methodWasSet:Z

.field multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

.field noCache:Z

.field progress:Lcom/koushikdutta/ion/ProgressCallback;

.field progressBar:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ProgressBar;",
            ">;"
        }
    .end annotation
.end field

.field progressDialog:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/ProgressDialog;",
            ">;"
        }
    .end annotation
.end field

.field progressHandler:Lcom/koushikdutta/ion/ProgressCallback;

.field proxyHost:Ljava/lang/String;

.field proxyPort:I

.field query:Lcom/koushikdutta/async/http/Multimap;

.field timeoutMilliseconds:I

.field uploadProgress:Lcom/koushikdutta/ion/ProgressCallback;

.field uploadProgressBar:Landroid/widget/ProgressBar;

.field uploadProgressDialog:Landroid/app/ProgressDialog;

.field uploadProgressHandler:Lcom/koushikdutta/ion/ProgressCallback;

.field uri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 82
    const-class v0, Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/IonRequestBuilder;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/ContextReference;Lcom/koushikdutta/ion/Ion;)V
    .registers 7
    .param p1, "contextReference"    # Lcom/koushikdutta/ion/ContextReference;
    .param p2, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    sget-object v1, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    iput-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->handler:Landroid/os/Handler;

    .line 86
    const-string v1, "GET"

    iput-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->method:Ljava/lang/String;

    .line 186
    const/16 v1, 0x7530

    iput v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->timeoutMilliseconds:I

    .line 222
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->followRedirect:Z

    .line 90
    invoke-virtual {p1}, Lcom/koushikdutta/ion/ContextReference;->isAlive()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "alive":Ljava/lang/String;
    if-eqz v0, :cond_30

    .line 92
    const-string v1, "Ion"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Building request with dead context: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_30
    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 94
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    .line 95
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/ion/IonRequestBuilder;
    .param p1, "x1"    # Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
    .param p2, "x2"    # Ljava/lang/Exception;
    .param p3, "x3"    # Ljava/lang/Object;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/ion/IonRequestBuilder;->postExecute(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V

    return-void
.end method

.method private getHeaders()Lcom/koushikdutta/async/http/Headers;
    .registers 3

    .prologue
    .line 119
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->headers:Lcom/koushikdutta/async/http/Headers;

    if-nez v0, :cond_15

    .line 120
    new-instance v0, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->headers:Lcom/koushikdutta/async/http/Headers;

    .line 121
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->headers:Lcom/koushikdutta/async/http/Headers;

    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    if-nez v0, :cond_18

    const/4 v0, 0x0

    :goto_12
    invoke-static {v1, v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setDefaultHeaders(Lcom/koushikdutta/async/http/Headers;Landroid/net/Uri;)V

    .line 123
    :cond_15
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->headers:Lcom/koushikdutta/async/http/Headers;

    return-object v0

    .line 121
    :cond_18
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_12
.end method

.method private getLoaderEmitter(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 301
    .local p1, "ret":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->prepareURI()Landroid/net/Uri;

    move-result-object v1

    .line 302
    .local v1, "uri":Landroid/net/Uri;
    if-nez v1, :cond_11

    .line 303
    new-instance v2, Ljava/lang/Exception;

    const-string v3, "Invalid URI"

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setComplete(Ljava/lang/Exception;)Z

    .line 311
    :goto_10
    return-void

    .line 307
    :cond_11
    invoke-direct {p0, v1}, Lcom/koushikdutta/ion/IonRequestBuilder;->prepareRequest(Landroid/net/Uri;)Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-result-object v0

    .line 308
    .local v0, "request":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    iput-object v0, p1, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->initialRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 310
    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->getLoaderEmitter(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    goto :goto_10
.end method

.method private getLoaderEmitter(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    .registers 6
    .param p2, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            ")V"
        }
    .end annotation

    .prologue
    .line 314
    .local p1, "ret":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->body:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    if-eqz v1, :cond_23

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressHandler:Lcom/koushikdutta/ion/ProgressCallback;

    if-nez v1, :cond_14

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressBar:Landroid/widget/ProgressBar;

    if-nez v1, :cond_14

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgress:Lcom/koushikdutta/ion/ProgressCallback;

    if-nez v1, :cond_14

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_23

    .line 315
    :cond_14
    new-instance v0, Lcom/koushikdutta/ion/RequestBodyUploadObserver;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->body:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    new-instance v2, Lcom/koushikdutta/ion/IonRequestBuilder$2;

    invoke-direct {v2, p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$2;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    invoke-direct {v0, v1, v2}, Lcom/koushikdutta/ion/RequestBodyUploadObserver;-><init>(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;Lcom/koushikdutta/ion/ProgressCallback;)V

    .line 344
    .local v0, "wrappedBody":Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    invoke-virtual {p2, v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)V

    .line 347
    .end local v0    # "wrappedBody":Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    :cond_23
    invoke-virtual {p0, p2, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->resolveAndLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    .line 348
    return-void
.end method

.method private loadInternal(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->method:Ljava/lang/String;

    .line 104
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 105
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p2

    .line 106
    :cond_1d
    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    .line 107
    return-object p0
.end method

.method private postExecute(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 6
    .param p2, "ex"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;",
            "Ljava/lang/Exception;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 230
    .local p1, "future":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    .local p3, "value":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/koushikdutta/ion/IonRequestBuilder$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Ljava/lang/Exception;Ljava/lang/Object;)V

    .line 250
    .local v0, "runner":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->handler:Landroid/os/Handler;

    if-nez v1, :cond_15

    .line 251
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v1, v1, Lcom/koushikdutta/ion/Ion;->httpClient:Lcom/koushikdutta/async/http/AsyncHttpClient;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpClient;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 254
    :goto_14
    return-void

    .line 253
    :cond_15
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->handler:Landroid/os/Handler;

    invoke-static {v1, v0}, Lcom/koushikdutta/async/AsyncServer;->post(Landroid/os/Handler;Ljava/lang/Runnable;)V

    goto :goto_14
.end method

.method private prepareRequest(Landroid/net/Uri;)Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 282
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getAsyncHttpRequestFactory()Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->method:Ljava/lang/String;

    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->headers:Lcom/koushikdutta/async/http/Headers;

    invoke-interface {v1, p1, v2, v3}, Lcom/koushikdutta/ion/loader/AsyncHttpRequestFactory;->createAsyncHttpRequest(Landroid/net/Uri;Ljava/lang/String;Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-result-object v0

    .line 283
    .local v0, "request":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    iget-boolean v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->followRedirect:Z

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setFollowRedirect(Z)Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 284
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->body:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)V

    .line 285
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v1, v1, Lcom/koushikdutta/ion/Ion;->logtag:Ljava/lang/String;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget v2, v2, Lcom/koushikdutta/ion/Ion;->logLevel:I

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setLogging(Ljava/lang/String;I)V

    .line 286
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->logTag:Ljava/lang/String;

    if-eqz v1, :cond_32

    .line 287
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->logTag:Ljava/lang/String;

    iget v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->logLevel:I

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setLogging(Ljava/lang/String;I)V

    .line 288
    :cond_32
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->proxyHost:Ljava/lang/String;

    iget v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->proxyPort:I

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->enableProxy(Ljava/lang/String;I)V

    .line 289
    iget v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->timeoutMilliseconds:I

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->setTimeout(I)Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 290
    const-string v1, "preparing request"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 291
    return-object v0
.end method

.method private prepareURI()Landroid/net/Uri;
    .registers 9

    .prologue
    .line 259
    :try_start_0
    iget-object v7, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    if-eqz v7, :cond_4f

    .line 260
    iget-object v7, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 261
    .local v0, "builder":Landroid/net/Uri$Builder;
    iget-object v7, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/Multimap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 262
    .local v4, "key":Ljava/lang/String;
    iget-object v7, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v7, v4}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_30
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_18

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 263
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v0, v4, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 264
    goto :goto_30

    .line 266
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_41
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_44} :catch_56

    move-result-object v5

    .line 275
    .end local v0    # "builder":Landroid/net/Uri$Builder;
    .local v5, "uri":Landroid/net/Uri;
    :goto_45
    if-eqz v5, :cond_4d

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_4e

    .line 276
    :cond_4d
    const/4 v5, 0x0

    .line 278
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_4e
    return-object v5

    .line 269
    :cond_4f
    :try_start_4f
    iget-object v7, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_54} :catch_56

    move-result-object v5

    .restart local v5    # "uri":Landroid/net/Uri;
    goto :goto_45

    .line 272
    .end local v5    # "uri":Landroid/net/Uri;
    :catch_56
    move-exception v1

    .line 273
    .local v1, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .restart local v5    # "uri":Landroid/net/Uri;
    goto :goto_45
.end method

.method private setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody",
            "<TT;>;)",
            "Lcom/koushikdutta/ion/IonRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, "body":Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;, "Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody<TT;>;"
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->methodWasSet:Z

    if-nez v0, :cond_8

    .line 202
    const-string v0, "POST"

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->method:Ljava/lang/String;

    .line 203
    :cond_8
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->body:Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    .line 204
    return-object p0
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 144
    if-eqz p2, :cond_9

    .line 145
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 146
    :cond_9
    return-object p0
.end method

.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addHeaders(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/koushikdutta/ion/IonRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 151
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-nez p1, :cond_3

    .line 157
    :cond_2
    return-object p0

    .line 153
    :cond_3
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    .line 154
    .local v1, "headers":Lcom/koushikdutta/async/http/Headers;
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 155
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-virtual {v1, v3, v4}, Lcom/koushikdutta/async/http/Headers;->addAll(Ljava/lang/String;Ljava/util/List;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_f
.end method

.method public bridge synthetic addHeaders(Ljava/util/Map;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->addHeaders(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addMultipartParts(Ljava/lang/Iterable;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/koushikdutta/async/http/body/Part;",
            ">;)",
            "Lcom/koushikdutta/ion/IonRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 838
    .local p1, "parameters":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/koushikdutta/async/http/body/Part;>;"
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    if-nez v2, :cond_10

    .line 839
    new-instance v2, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {v2}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;-><init>()V

    iput-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    .line 840
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {p0, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 843
    :cond_10
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/body/Part;

    .line 844
    .local v1, "part":Lcom/koushikdutta/async/http/body/Part;
    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-virtual {v2, v1}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;->addPart(Lcom/koushikdutta/async/http/body/Part;)V

    goto :goto_14

    .line 846
    .end local v1    # "part":Lcom/koushikdutta/async/http/body/Part;
    :cond_26
    return-object p0
.end method

.method public varargs addMultipartParts([Lcom/koushikdutta/async/http/body/Part;)Lcom/koushikdutta/ion/builder/Builders$Any$M;
    .registers 7
    .param p1, "parameters"    # [Lcom/koushikdutta/async/http/body/Part;

    .prologue
    .line 851
    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    if-nez v4, :cond_10

    .line 852
    new-instance v4, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {v4}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;-><init>()V

    iput-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    .line 853
    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {p0, v4}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 856
    :cond_10
    move-object v0, p1

    .local v0, "arr$":[Lcom/koushikdutta/async/http/body/Part;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_13
    if-ge v1, v2, :cond_1f

    aget-object v3, v0, v1

    .line 857
    .local v3, "part":Lcom/koushikdutta/async/http/body/Part;
    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-virtual {v4, v3}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;->addPart(Lcom/koushikdutta/async/http/body/Part;)V

    .line 856
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 859
    .end local v3    # "part":Lcom/koushikdutta/async/http/body/Part;
    :cond_1f
    return-object p0
.end method

.method public bridge synthetic addMultipartParts(Ljava/lang/Iterable;)Lcom/koushikdutta/ion/builder/MultipartBodyBuilder;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Iterable;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->addMultipartParts(Ljava/lang/Iterable;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic addMultipartParts([Lcom/koushikdutta/async/http/body/Part;)Lcom/koushikdutta/ion/builder/MultipartBodyBuilder;
    .registers 3
    .param p1, "x0"    # [Lcom/koushikdutta/async/http/body/Part;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->addMultipartParts([Lcom/koushikdutta/async/http/body/Part;)Lcom/koushikdutta/ion/builder/Builders$Any$M;

    move-result-object v0

    return-object v0
.end method

.method public addQueries(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/koushikdutta/ion/IonRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 180
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    if-nez v0, :cond_b

    .line 181
    new-instance v0, Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Multimap;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    .line 182
    :cond_b
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/http/Multimap;->putAll(Ljava/util/Map;)V

    .line 183
    return-object p0
.end method

.method public bridge synthetic addQueries(Ljava/util/Map;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->addQueries(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 170
    if-nez p2, :cond_3

    .line 175
    :goto_2
    return-object p0

    .line 172
    :cond_3
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    if-nez v0, :cond_e

    .line 173
    new-instance v0, Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Multimap;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    .line 174
    :cond_e
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->query:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/Multimap;->add(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public bridge synthetic addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public as(Lcom/google/gson/reflect/TypeToken;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/reflect/TypeToken",
            "<TT;>;)",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 924
    .local p1, "token":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/parser/AsyncParser",
            "<TT;>;)",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 745
    .local p1, "parser":Lcom/koushikdutta/async/parser/AsyncParser;, "Lcom/koushikdutta/async/parser/AsyncParser<TT;>;"
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public as(Ljava/lang/Class;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 919
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asBitmap()Lcom/koushikdutta/async/future/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 905
    new-instance v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->asBitmap()Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public asByteArray()Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 709
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder$7;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonRequestBuilder$7;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asCachedBitmap()Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 2

    .prologue
    .line 890
    new-instance v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->asCachedBitmap()Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v0

    return-object v0
.end method

.method public asDataEmitter()Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Lcom/koushikdutta/async/DataEmitter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 740
    new-instance v0, Lcom/koushikdutta/ion/DataEmitterParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/DataEmitterParser;-><init>()V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asDocument()Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Lorg/w3c/dom/Document;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1005
    new-instance v0, Lcom/koushikdutta/async/parser/DocumentParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/DocumentParser;-><init>()V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asInputStream()Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 735
    new-instance v0, Lcom/koushikdutta/ion/InputStreamParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/InputStreamParser;-><init>()V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asJsonArray()Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Lcom/google/gson/JsonArray;",
            ">;"
        }
    .end annotation

    .prologue
    .line 684
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonArrayParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonArrayParser;-><init>()V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asJsonArray(Ljava/nio/charset/Charset;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/charset/Charset;",
            ")",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Lcom/google/gson/JsonArray;",
            ">;"
        }
    .end annotation

    .prologue
    .line 694
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonArrayParser;

    invoke-direct {v0, p1}, Lcom/koushikdutta/ion/gson/GsonArrayParser;-><init>(Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asJsonObject()Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 679
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonObjectParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonObjectParser;-><init>()V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asJsonObject(Ljava/nio/charset/Charset;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/charset/Charset;",
            ")",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 689
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonObjectParser;

    invoke-direct {v0, p1}, Lcom/koushikdutta/ion/gson/GsonObjectParser;-><init>(Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asString()Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 699
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public asString(Ljava/nio/charset/Charset;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/charset/Charset;",
            ")",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 704
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/parser/StringParser;-><init>(Ljava/nio/charset/Charset;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method public basicAuthentication(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 9
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    .line 959
    const-string v0, "Authorization"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Basic "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%s:%s"

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic basicAuthentication(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->basicAuthentication(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method execute(Lcom/koushikdutta/async/DataSink;ZLjava/lang/Object;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
    .registers 5
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "close"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/DataSink;",
            "ZTT;)",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 604
    .local p3, "result":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/DataSink;ZLjava/lang/Object;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    move-result-object v0

    return-object v0
.end method

.method execute(Lcom/koushikdutta/async/DataSink;ZLjava/lang/Object;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
    .registers 11
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "close"    # Z
    .param p4, "cancel"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/DataSink;",
            "ZTT;",
            "Ljava/lang/Runnable;",
            ")",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 609
    .local p3, "result":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder$5;

    move-object v1, p0

    move-object v2, p4

    move v3, p2

    move-object v4, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/ion/IonRequestBuilder$5;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/lang/Runnable;ZLcom/koushikdutta/async/DataSink;Ljava/lang/Object;)V

    .line 629
    .local v0, "ret":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->getLoaderEmitter(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    .line 630
    return-object v0
.end method

.method execute(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/parser/AsyncParser",
            "<TT;>;)",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 634
    .local p1, "parser":Lcom/koushikdutta/async/parser/AsyncParser;, "Lcom/koushikdutta/async/parser/AsyncParser<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    return-object v0
.end method

.method execute(Lcom/koushikdutta/async/parser/AsyncParser;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 12
    .param p2, "cancel"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/parser/AsyncParser",
            "<TT;>;",
            "Ljava/lang/Runnable;",
            ")",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 638
    .local p1, "parser":Lcom/koushikdutta/async/parser/AsyncParser;, "Lcom/koushikdutta/async/parser/AsyncParser<TT;>;"
    sget-boolean v7, Lcom/koushikdutta/ion/IonRequestBuilder;->$assertionsDisabled:Z

    if-nez v7, :cond_c

    if-nez p1, :cond_c

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 640
    :cond_c
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->prepareURI()Landroid/net/Uri;

    move-result-object v6

    .line 641
    .local v6, "uri":Landroid/net/Uri;
    const/4 v3, 0x0

    .line 643
    .local v3, "request":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    if-eqz v6, :cond_39

    .line 644
    invoke-direct {p0, v6}, Lcom/koushikdutta/ion/IonRequestBuilder;->prepareRequest(Landroid/net/Uri;)Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-result-object v3

    .line 645
    invoke-interface {p1}, Lcom/koushikdutta/async/parser/AsyncParser;->getType()Ljava/lang/reflect/Type;

    move-result-object v5

    .line 646
    .local v5, "type":Ljava/lang/reflect/Type;
    iget-object v7, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v7, v7, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/ion/Loader;

    .line 647
    .local v1, "loader":Lcom/koushikdutta/ion/Loader;
    iget-object v7, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-interface {v1, v7, v3, v5}, Lcom/koushikdutta/ion/Loader;->load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/reflect/Type;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v2

    .line 648
    .local v2, "quickLoad":Lcom/koushikdutta/ion/future/ResponseFuture;, "Lcom/koushikdutta/ion/future/ResponseFuture<TT;>;"
    if-eqz v2, :cond_23

    move-object v4, v2

    .line 674
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "loader":Lcom/koushikdutta/ion/Loader;
    .end local v2    # "quickLoad":Lcom/koushikdutta/ion/future/ResponseFuture;, "Lcom/koushikdutta/ion/future/ResponseFuture<TT;>;"
    .end local v5    # "type":Ljava/lang/reflect/Type;
    :goto_38
    return-object v4

    .line 653
    :cond_39
    new-instance v4, Lcom/koushikdutta/ion/IonRequestBuilder$6;

    invoke-direct {v4, p0, p2, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$6;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/lang/Runnable;Lcom/koushikdutta/async/parser/AsyncParser;)V

    .line 667
    .local v4, "ret":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    if-nez v6, :cond_4b

    .line 668
    new-instance v7, Ljava/lang/Exception;

    const-string v8, "Invalid URI"

    invoke-direct {v7, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v7}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_38

    .line 672
    :cond_4b
    iput-object v3, v4, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->initialRequest:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 673
    invoke-direct {p0, v4}, Lcom/koushikdutta/ion/IonRequestBuilder;->getLoaderEmitter(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    goto :goto_38
.end method

.method public followRedirect(Z)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 2
    .param p1, "follow"    # Z

    .prologue
    .line 225
    iput-boolean p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->followRedirect:Z

    .line 226
    return-object p0
.end method

.method public bridge synthetic followRedirect(Z)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Z

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->followRedirect(Z)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public group(Ljava/lang/Object;)Lcom/koushikdutta/ion/builder/FutureBuilder;
    .registers 4
    .param p1, "groupKey"    # Ljava/lang/Object;

    .prologue
    .line 930
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->groups:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 931
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->groups:Ljava/util/ArrayList;

    .line 932
    :cond_b
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->groups:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 933
    return-object p0
.end method

.method public intoImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/future/ImageViewFuture;
    .registers 3
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 879
    new-instance v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    invoke-virtual {v0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->withImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->intoImageView(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/future/ImageViewFuture;

    move-result-object v0

    return-object v0
.end method

.method invokeLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
    .registers 4
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 407
    .local p2, "ret":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->loadRequestCallback:Lcom/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->loadRequestCallback:Lcom/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback;

    invoke-interface {v0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback;->loadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 408
    :cond_c
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->loadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    .line 409
    :cond_f
    return-void
.end method

.method public isLocallyCached()Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;
    .registers 2

    .prologue
    .line 900
    new-instance v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->isLocallyCached()Lcom/koushikdutta/ion/bitmap/LocallyCachedStatus;

    move-result-object v0

    return-object v0
.end method

.method public load(Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 884
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/koushikdutta/ion/IonRequestBuilder;->loadInternal(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 885
    return-object p0
.end method

.method public load(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 99
    const-string v0, "GET"

    invoke-direct {p0, v0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->loadInternal(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public load(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 113
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->methodWasSet:Z

    .line 114
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->loadInternal(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic load(Ljava/io/File;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/io/File;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->load(Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic load(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->load(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic load(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->load(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method loadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
    .registers 8
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 413
    .local p2, "ret":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/ion/Loader;

    .line 414
    .local v2, "loader":Lcom/koushikdutta/ion/Loader;
    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-interface {v2, v3, p1, p2}, Lcom/koushikdutta/ion/Loader;->load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    .line 415
    .local v0, "emitter":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/async/DataEmitter;>;"
    if-eqz v0, :cond_8

    .line 416
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Using loader: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 417
    invoke-virtual {p2, v0}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setParent(Lcom/koushikdutta/async/future/Cancellable;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 422
    .end local v0    # "emitter":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/async/DataEmitter;>;"
    .end local v2    # "loader":Lcom/koushikdutta/ion/Loader;
    :goto_35
    return-void

    .line 421
    :cond_36
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "Unknown uri scheme"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->setComplete(Ljava/lang/Exception;)Z

    goto :goto_35
.end method

.method public noCache()Lcom/koushikdutta/ion/builder/Builders$Any$B;
    .registers 3

    .prologue
    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->noCache:Z

    .line 164
    const-string v0, "Cache-Control"

    const-string v1, "no-cache"

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic noCache()Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 2

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->noCache()Lcom/koushikdutta/ion/builder/Builders$Any$B;

    move-result-object v0

    return-object v0
.end method

.method public onHeaders(Lcom/koushikdutta/ion/HeadersCallback;)Lcom/koushikdutta/ion/builder/Builders$Any$B;
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/ion/HeadersCallback;

    .prologue
    .line 993
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->headersCallback:Lcom/koushikdutta/ion/HeadersCallback;

    .line 994
    return-object p0
.end method

.method public bridge synthetic onHeaders(Lcom/koushikdutta/ion/HeadersCallback;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/HeadersCallback;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->onHeaders(Lcom/koushikdutta/ion/HeadersCallback;)Lcom/koushikdutta/ion/builder/Builders$Any$B;

    move-result-object v0

    return-object v0
.end method

.method public progress(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 592
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->progress:Lcom/koushikdutta/ion/ProgressCallback;

    .line 593
    return-object p0
.end method

.method public bridge synthetic progress(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->progress(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public progressBar(Landroid/widget/ProgressBar;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "progressBar"    # Landroid/widget/ProgressBar;

    .prologue
    .line 576
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->progressBar:Ljava/lang/ref/WeakReference;

    .line 577
    return-object p0
.end method

.method public bridge synthetic progressBar(Landroid/widget/ProgressBar;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/widget/ProgressBar;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->progressBar(Landroid/widget/ProgressBar;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public progressDialog(Landroid/app/ProgressDialog;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "progressDialog"    # Landroid/app/ProgressDialog;

    .prologue
    .line 582
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->progressDialog:Ljava/lang/ref/WeakReference;

    .line 583
    return-object p0
.end method

.method public bridge synthetic progressDialog(Landroid/app/ProgressDialog;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/app/ProgressDialog;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->progressDialog(Landroid/app/ProgressDialog;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public progressHandler(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 599
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->progressHandler:Lcom/koushikdutta/ion/ProgressCallback;

    .line 600
    return-object p0
.end method

.method public bridge synthetic progressHandler(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->progressHandler(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public proxy(Ljava/lang/String;I)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 940
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->proxyHost:Ljava/lang/String;

    .line 941
    iput p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->proxyPort:I

    .line 942
    return-object p0
.end method

.method public bridge synthetic proxy(Ljava/lang/String;I)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->proxy(Ljava/lang/String;I)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method recursiveResolveRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 351
    new-instance v1, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v1}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 353
    .local v1, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<Lcom/koushikdutta/async/http/AsyncHttpRequest;>;"
    new-instance v0, Lcom/koushikdutta/ion/IonRequestBuilder$3;

    invoke-direct {v0, p0, p1, v1}, Lcom/koushikdutta/ion/IonRequestBuilder$3;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/future/SimpleFuture;)V

    .line 377
    .local v0, "resolver":Ljava/lang/Runnable;
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 378
    return-object v1
.end method

.method public removeCachedBitmap()V
    .registers 2

    .prologue
    .line 895
    new-instance v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;->removeCachedBitmap()V

    .line 896
    return-void
.end method

.method resolveAndLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
    .registers 5
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 382
    .local p2, "ret":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform<TT;>;"
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->recursiveResolveRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/ion/IonRequestBuilder$4;

    invoke-direct {v1, p0, p2, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$4;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    .line 383
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    .line 404
    return-void
.end method

.method resolveRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Lcom/koushikdutta/async/future/Future;
    .registers 7
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 426
    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion;->loaders:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/ion/Loader;

    .line 427
    .local v1, "loader":Lcom/koushikdutta/ion/Loader;
    iget-object v3, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-virtual {v3}, Lcom/koushikdutta/ion/ContextReference;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-interface {v1, v3, v4, p1}, Lcom/koushikdutta/ion/Loader;->resolve(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;)Lcom/koushikdutta/async/future/Future;

    move-result-object v2

    .line 428
    .local v2, "resolved":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/async/http/AsyncHttpRequest;>;"
    if-eqz v2, :cond_8

    .line 432
    .end local v1    # "loader":Lcom/koushikdutta/ion/Loader;
    .end local v2    # "resolved":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/async/http/AsyncHttpRequest;>;"
    :goto_22
    return-object v2

    :cond_23
    const/4 v2, 0x0

    goto :goto_22
.end method

.method public setBodyParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 771
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    if-nez v0, :cond_15

    .line 772
    new-instance v0, Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Multimap;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    .line 773
    new-instance v0, Lcom/koushikdutta/async/http/body/UrlEncodedFormBody;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v0, v1}, Lcom/koushikdutta/async/http/body/UrlEncodedFormBody;-><init>(Lcom/koushikdutta/async/http/Multimap;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 775
    :cond_15
    if-eqz p2, :cond_1c

    .line 776
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/Multimap;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 777
    :cond_1c
    return-object p0
.end method

.method public bridge synthetic setBodyParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/builder/UrlEncodedBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBodyParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setBodyParameters(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/koushikdutta/ion/IonRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 781
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    if-nez v0, :cond_15

    .line 782
    new-instance v0, Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Multimap;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    .line 783
    new-instance v0, Lcom/koushikdutta/async/http/body/UrlEncodedFormBody;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v0, v1}, Lcom/koushikdutta/async/http/body/UrlEncodedFormBody;-><init>(Lcom/koushikdutta/async/http/Multimap;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 785
    :cond_15
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->bodyParameters:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/http/Multimap;->putAll(Ljava/util/Map;)V

    .line 786
    return-object p0
.end method

.method public bridge synthetic setBodyParameters(Ljava/util/Map;)Lcom/koushikdutta/ion/builder/UrlEncodedBuilder;
    .registers 3
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBodyParameters(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setByteArrayBody([B)Lcom/koushikdutta/ion/builder/Builders$Any$F;
    .registers 5
    .param p1, "bytes"    # [B

    .prologue
    .line 1016
    if-eqz p1, :cond_10

    .line 1017
    new-instance v0, Lcom/koushikdutta/async/http/body/StreamBody;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length v2, p1

    invoke-direct {v0, v1, v2}, Lcom/koushikdutta/async/http/body/StreamBody;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 1018
    :cond_10
    return-object p0
.end method

.method public bridge synthetic setByteArrayBody([B)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [B

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setByteArrayBody([B)Lcom/koushikdutta/ion/builder/Builders$Any$F;

    move-result-object v0

    return-object v0
.end method

.method public setDocumentBody(Lorg/w3c/dom/Document;)Lcom/koushikdutta/ion/builder/Builders$Any$F;
    .registers 3
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 999
    new-instance v0, Lcom/koushikdutta/async/http/body/DocumentBody;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/http/body/DocumentBody;-><init>(Lorg/w3c/dom/Document;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 1000
    return-object p0
.end method

.method public bridge synthetic setDocumentBody(Lorg/w3c/dom/Document;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lorg/w3c/dom/Document;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setDocumentBody(Lorg/w3c/dom/Document;)Lcom/koushikdutta/ion/builder/Builders$Any$F;

    move-result-object v0

    return-object v0
.end method

.method public setFileBody(Ljava/io/File;)Lcom/koushikdutta/ion/builder/Builders$Any$F;
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 1010
    new-instance v0, Lcom/koushikdutta/async/http/body/FileBody;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/http/body/FileBody;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 1011
    return-object p0
.end method

.method public bridge synthetic setFileBody(Ljava/io/File;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/io/File;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setFileBody(Ljava/io/File;)Lcom/koushikdutta/ion/builder/Builders$Any$F;

    move-result-object v0

    return-object v0
.end method

.method public setHandler(Landroid/os/Handler;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 2
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 195
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->handler:Landroid/os/Handler;

    .line 196
    return-object p0
.end method

.method public bridge synthetic setHandler(Landroid/os/Handler;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/os/Handler;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setHandler(Landroid/os/Handler;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 135
    if-nez p2, :cond_a

    .line 136
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/http/Headers;->removeAll(Ljava/lang/String;)Ljava/util/List;

    .line 139
    :goto_9
    return-object p0

    .line 138
    :cond_a
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_9
.end method

.method public varargs setHeader([Lcom/koushikdutta/async/http/NameValuePair;)Lcom/koushikdutta/ion/builder/Builders$Any$B;
    .registers 9
    .param p1, "header"    # [Lcom/koushikdutta/async/http/NameValuePair;

    .prologue
    .line 1035
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v2

    .line 1036
    .local v2, "headers":Lcom/koushikdutta/async/http/Headers;
    move-object v0, p1

    .local v0, "arr$":[Lcom/koushikdutta/async/http/NameValuePair;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_7
    if-ge v3, v4, :cond_19

    aget-object v1, v0, v3

    .line 1037
    .local v1, "h":Lcom/koushikdutta/async/http/NameValuePair;
    invoke-interface {v1}, Lcom/koushikdutta/async/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1}, Lcom/koushikdutta/async/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 1036
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 1039
    .end local v1    # "h":Lcom/koushikdutta/async/http/NameValuePair;
    :cond_19
    return-object p0
.end method

.method public bridge synthetic setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setHeader([Lcom/koushikdutta/async/http/NameValuePair;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # [Lcom/koushikdutta/async/http/NameValuePair;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setHeader([Lcom/koushikdutta/async/http/NameValuePair;)Lcom/koushikdutta/ion/builder/Builders$Any$B;

    move-result-object v0

    return-object v0
.end method

.method public setJsonArrayBody(Lcom/google/gson/JsonArray;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "jsonArray"    # Lcom/google/gson/JsonArray;

    .prologue
    .line 214
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonBody;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonBody;-><init>(Lcom/google/gson/Gson;Lcom/google/gson/JsonElement;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setJsonArrayBody(Lcom/google/gson/JsonArray;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/google/gson/JsonArray;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setJsonArrayBody(Lcom/google/gson/JsonArray;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setJsonObjectBody(Lcom/google/gson/JsonObject;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "jsonObject"    # Lcom/google/gson/JsonObject;

    .prologue
    .line 209
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonBody;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonBody;-><init>(Lcom/google/gson/Gson;Lcom/google/gson/JsonElement;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setJsonObjectBody(Lcom/google/gson/JsonObject;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/google/gson/JsonObject;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setJsonObjectBody(Lcom/google/gson/JsonObject;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setJsonPojoBody(Ljava/lang/Object;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 953
    new-instance v0, Lcom/koushikdutta/ion/gson/PojoBody;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lcom/koushikdutta/ion/gson/PojoBody;-><init>(Lcom/google/gson/Gson;Ljava/lang/Object;Lcom/google/gson/reflect/TypeToken;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 954
    return-object p0
.end method

.method public setJsonPojoBody(Ljava/lang/Object;Lcom/google/gson/reflect/TypeToken;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "token"    # Lcom/google/gson/reflect/TypeToken;

    .prologue
    .line 947
    new-instance v0, Lcom/koushikdutta/ion/gson/PojoBody;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/koushikdutta/ion/gson/PojoBody;-><init>(Lcom/google/gson/Gson;Ljava/lang/Object;Lcom/google/gson/reflect/TypeToken;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 948
    return-object p0
.end method

.method public bridge synthetic setJsonPojoBody(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setJsonPojoBody(Ljava/lang/Object;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setJsonPojoBody(Ljava/lang/Object;Lcom/google/gson/reflect/TypeToken;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/google/gson/reflect/TypeToken;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setJsonPojoBody(Ljava/lang/Object;Lcom/google/gson/reflect/TypeToken;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setLogging(Ljava/lang/String;I)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "level"    # I

    .prologue
    .line 912
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->logTag:Ljava/lang/String;

    .line 913
    iput p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->logLevel:I

    .line 914
    return-object p0
.end method

.method public bridge synthetic setLogging(Ljava/lang/String;I)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setLogging(Ljava/lang/String;I)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setMultipartContentType(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 864
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    if-nez v0, :cond_10

    .line 865
    new-instance v0, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    .line 866
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 868
    :cond_10
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;->setContentType(Ljava/lang/String;)V

    .line 869
    return-object p0
.end method

.method public bridge synthetic setMultipartContentType(Ljava/lang/String;)Lcom/koushikdutta/ion/builder/MultipartBodyBuilder;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setMultipartContentType(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setMultipartFile(Ljava/lang/String;Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 792
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setMultipartFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setMultipartFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 797
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    if-nez v1, :cond_10

    .line 798
    new-instance v1, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {v1}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;-><init>()V

    iput-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    .line 799
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {p0, v1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 802
    :cond_10
    new-instance v0, Lcom/koushikdutta/async/http/body/FilePart;

    invoke-direct {v0, p1, p3}, Lcom/koushikdutta/async/http/body/FilePart;-><init>(Ljava/lang/String;Ljava/io/File;)V

    .line 804
    .local v0, "part":Lcom/koushikdutta/async/http/body/FilePart;
    if-nez p2, :cond_1f

    .line 805
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->tryGetContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 807
    :cond_1f
    if-eqz p2, :cond_24

    .line 808
    invoke-virtual {v0, p2}, Lcom/koushikdutta/async/http/body/FilePart;->setContentType(Ljava/lang/String;)V

    .line 810
    :cond_24
    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;->addPart(Lcom/koushikdutta/async/http/body/Part;)V

    .line 811
    return-object p0
.end method

.method public bridge synthetic setMultipartFile(Ljava/lang/String;Ljava/io/File;)Lcom/koushikdutta/ion/builder/MultipartBodyBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/io/File;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setMultipartFile(Ljava/lang/String;Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setMultipartFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/koushikdutta/ion/builder/MultipartBodyBuilder;
    .registers 5
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Ljava/io/File;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/ion/IonRequestBuilder;->setMultipartFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setMultipartParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 816
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    if-nez v0, :cond_10

    .line 817
    new-instance v0, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    .line 818
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 820
    :cond_10
    if-eqz p2, :cond_17

    .line 821
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->multipartBody:Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;->addStringPart(Ljava/lang/String;Ljava/lang/String;)V

    .line 822
    :cond_17
    return-object p0
.end method

.method public bridge synthetic setMultipartParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/builder/MultipartBodyBuilder;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setMultipartParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setMultipartParameters(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/koushikdutta/ion/IonRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 827
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 828
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1e
    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 829
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_1e

    .line 830
    invoke-virtual {p0, v2, v3}, Lcom/koushikdutta/ion/IonRequestBuilder;->setMultipartParameter(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    goto :goto_1e

    .line 833
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_30
    return-object p0
.end method

.method public bridge synthetic setMultipartParameters(Ljava/util/Map;)Lcom/koushikdutta/ion/builder/MultipartBodyBuilder;
    .registers 3
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setMultipartParameters(Ljava/util/Map;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setStreamBody(Ljava/io/InputStream;)Lcom/koushikdutta/ion/builder/Builders$Any$F;
    .registers 4
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 1023
    new-instance v0, Lcom/koushikdutta/async/http/body/StreamBody;

    const/4 v1, -0x1

    invoke-direct {v0, p1, v1}, Lcom/koushikdutta/async/http/body/StreamBody;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 1024
    return-object p0
.end method

.method public setStreamBody(Ljava/io/InputStream;I)Lcom/koushikdutta/ion/builder/Builders$Any$F;
    .registers 4
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "length"    # I

    .prologue
    .line 1029
    new-instance v0, Lcom/koushikdutta/async/http/body/StreamBody;

    invoke-direct {v0, p1, p2}, Lcom/koushikdutta/async/http/body/StreamBody;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 1030
    return-object p0
.end method

.method public setStringBody(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 219
    new-instance v0, Lcom/koushikdutta/async/http/body/StringBody;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/http/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/IonRequestBuilder;->setBody(Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setStringBody(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setStringBody(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setTimeout(I)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 2
    .param p1, "timeoutMilliseconds"    # I

    .prologue
    .line 189
    iput p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->timeoutMilliseconds:I

    .line 190
    return-object p0
.end method

.method public bridge synthetic setTimeout(I)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setTimeout(I)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public uploadProgress(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/Builders$Any$B;
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 965
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgress:Lcom/koushikdutta/ion/ProgressCallback;

    .line 966
    return-object p0
.end method

.method public bridge synthetic uploadProgress(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgress(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/Builders$Any$B;

    move-result-object v0

    return-object v0
.end method

.method public uploadProgressBar(Landroid/widget/ProgressBar;)Lcom/koushikdutta/ion/builder/Builders$Any$B;
    .registers 2
    .param p1, "progressBar"    # Landroid/widget/ProgressBar;

    .prologue
    .line 972
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressBar:Landroid/widget/ProgressBar;

    .line 973
    return-object p0
.end method

.method public bridge synthetic uploadProgressBar(Landroid/widget/ProgressBar;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/widget/ProgressBar;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressBar(Landroid/widget/ProgressBar;)Lcom/koushikdutta/ion/builder/Builders$Any$B;

    move-result-object v0

    return-object v0
.end method

.method public uploadProgressDialog(Landroid/app/ProgressDialog;)Lcom/koushikdutta/ion/builder/Builders$Any$B;
    .registers 2
    .param p1, "progressDialog"    # Landroid/app/ProgressDialog;

    .prologue
    .line 979
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressDialog:Landroid/app/ProgressDialog;

    .line 980
    return-object p0
.end method

.method public bridge synthetic uploadProgressDialog(Landroid/app/ProgressDialog;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Landroid/app/ProgressDialog;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressDialog(Landroid/app/ProgressDialog;)Lcom/koushikdutta/ion/builder/Builders$Any$B;

    move-result-object v0

    return-object v0
.end method

.method public uploadProgressHandler(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/Builders$Any$B;
    .registers 2
    .param p1, "callback"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 986
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressHandler:Lcom/koushikdutta/ion/ProgressCallback;

    .line 987
    return-object p0
.end method

.method public bridge synthetic uploadProgressHandler(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Lcom/koushikdutta/ion/ProgressCallback;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->uploadProgressHandler(Lcom/koushikdutta/ion/ProgressCallback;)Lcom/koushikdutta/ion/builder/Builders$Any$B;

    move-result-object v0

    return-object v0
.end method

.method public userAgent(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;
    .registers 3
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 128
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 130
    .end local p0    # "this":Lcom/koushikdutta/ion/IonRequestBuilder;
    :goto_6
    return-object p0

    .restart local p0    # "this":Lcom/koushikdutta/ion/IonRequestBuilder;
    :cond_7
    const-string v0, "User-Agent"

    invoke-virtual {p0, v0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object p0

    goto :goto_6
.end method

.method public bridge synthetic userAgent(Ljava/lang/String;)Lcom/koushikdutta/ion/builder/RequestBuilder;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->userAgent(Ljava/lang/String;)Lcom/koushikdutta/ion/IonRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withBitmap()Lcom/koushikdutta/ion/IonImageViewRequestBuilder;
    .registers 2

    .prologue
    .line 874
    new-instance v0, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonImageViewRequestBuilder;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;)V

    return-object v0
.end method

.method public bridge synthetic withBitmap()Lcom/koushikdutta/ion/builder/Builders$Any$BF;
    .registers 2

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonRequestBuilder;->withBitmap()Lcom/koushikdutta/ion/IonImageViewRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 760
    new-instance v0, Lcom/koushikdutta/async/stream/FileDataSink;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/async/stream/FileDataSink;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/File;)V

    const/4 v1, 0x1

    new-instance v2, Lcom/koushikdutta/ion/IonRequestBuilder$8;

    invoke-direct {v2, p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$8;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/io/File;)V

    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/DataSink;ZLjava/lang/Object;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic write(Ljava/io/File;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 3
    .param p1, "x0"    # Ljava/io/File;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->write(Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/OutputStream;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<F:",
            "Ljava/io/OutputStream;",
            ">(TF;)",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TF;>;"
        }
    .end annotation

    .prologue
    .line 755
    .local p1, "outputStream":Ljava/io/OutputStream;, "TF;"
    new-instance v0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/OutputStream;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/DataSink;ZLjava/lang/Object;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/OutputStream;Z)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 5
    .param p2, "close"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<F:",
            "Ljava/io/OutputStream;",
            ">(TF;Z)",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TF;>;"
        }
    .end annotation

    .prologue
    .line 750
    .local p1, "outputStream":Ljava/io/OutputStream;, "TF;"
    new-instance v0, Lcom/koushikdutta/async/stream/OutputStreamDataSink;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;-><init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0, p2, p1}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/DataSink;ZLjava/lang/Object;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    move-result-object v0

    return-object v0
.end method
