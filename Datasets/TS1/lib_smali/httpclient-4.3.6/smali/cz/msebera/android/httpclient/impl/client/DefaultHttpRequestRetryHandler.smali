.class public Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;
.super Ljava/lang/Object;
.source "DefaultHttpRequestRetryHandler.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;


# instance fields
.field private final nonRetriableClasses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/io/IOException;",
            ">;>;"
        }
    .end annotation
.end field

.field private final requestSentRetryEnabled:Z

.field private final retryCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 58
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 121
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;-><init>(IZ)V

    .line 122
    return-void
.end method

.method public constructor <init>(IZ)V
    .registers 6
    .param p1, "retryCount"    # I
    .param p2, "requestSentRetryEnabled"    # Z

    .prologue
    .line 103
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/io/InterruptedIOException;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Ljava/net/UnknownHostException;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Ljava/net/ConnectException;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/net/ssl/SSLException;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;-><init>(IZLjava/util/Collection;)V

    .line 108
    return-void
.end method

.method protected constructor <init>(IZLjava/util/Collection;)V
    .registers 7
    .param p1, "retryCount"    # I
    .param p2, "requestSentRetryEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/io/IOException;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p3, "clazzes":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Class<+Ljava/io/IOException;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput p1, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->retryCount:I

    .line 82
    iput-boolean p2, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    .line 83
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    .line 84
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 85
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 87
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    :cond_24
    return-void
.end method


# virtual methods
.method public getRetryCount()I
    .registers 2

    .prologue
    .line 179
    iget v0, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->retryCount:I

    return v0
.end method

.method protected handleAsIdempotent(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 186
    instance-of v0, p1, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isRequestSentRetryEnabled()Z
    .registers 2

    .prologue
    .line 172
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    return v0
.end method

.method protected requestIsAborted(Lcz/msebera/android/httpclient/HttpRequest;)Z
    .registers 4
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 196
    move-object v0, p1

    .line 197
    .local v0, "req":Lcz/msebera/android/httpclient/HttpRequest;
    instance-of v1, p1, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;

    if-eqz v1, :cond_b

    .line 198
    check-cast p1, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;

    .end local p1    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/RequestWrapper;->getOriginal()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v0

    .line 200
    :cond_b
    instance-of v1, v0, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    if-eqz v1, :cond_19

    check-cast v0, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    .end local v0    # "req":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->isAborted()Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v1, 0x1

    :goto_18
    return v1

    :cond_19
    const/4 v1, 0x0

    goto :goto_18
.end method

.method public retryRequest(Ljava/io/IOException;ILcz/msebera/android/httpclient/protocol/HttpContext;)Z
    .registers 11
    .param p1, "exception"    # Ljava/io/IOException;
    .param p2, "executionCount"    # I
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 131
    const-string v5, "Exception parameter"

    invoke-static {p1, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 132
    const-string v5, "HTTP context"

    invoke-static {p3, v5}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 133
    iget v5, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->retryCount:I

    if-le p2, v5, :cond_11

    .line 164
    :cond_10
    :goto_10
    return v3

    .line 137
    :cond_11
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_10

    .line 140
    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_23
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_36

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 141
    .local v1, "rejectException":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_23

    goto :goto_10

    .line 146
    .end local v1    # "rejectException":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    :cond_36
    invoke-static {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v0

    .line 147
    .local v0, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getRequest()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v2

    .line 149
    .local v2, "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->requestIsAborted(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v5

    if-nez v5, :cond_10

    .line 153
    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->handleAsIdempotent(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v5

    if-eqz v5, :cond_4c

    move v3, v4

    .line 155
    goto :goto_10

    .line 158
    :cond_4c
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->isRequestSent()Z

    move-result v5

    if-eqz v5, :cond_56

    iget-boolean v5, p0, Lcz/msebera/android/httpclient/impl/client/DefaultHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    if-eqz v5, :cond_10

    :cond_56
    move v3, v4

    .line 161
    goto :goto_10
.end method
