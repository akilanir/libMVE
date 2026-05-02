.class public Lcz/msebera/android/httpclient/impl/execchain/RetryExec;
.super Ljava/lang/Object;
.source "RetryExec.java"

# interfaces
.implements Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

.field private final retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;)V
    .registers 5
    .param p1, "requestExecutor"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .param p2, "retryHandler"    # Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 69
    const-string v0, "HTTP request executor"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    const-string v0, "HTTP request retry handler"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .line 72
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    .line 73
    return-void
.end method


# virtual methods
.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 12
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 80
    const-string v4, "HTTP route"

    invoke-static {p1, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    const-string v4, "HTTP request"

    invoke-static {p2, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    const-string v4, "HTTP context"

    invoke-static {p3, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 84
    .local v2, "origheaders":[Lcz/msebera/android/httpclient/Header;
    const/4 v1, 0x1

    .line 86
    .local v1, "execCount":I
    :goto_14
    :try_start_14
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    invoke-interface {v4, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_19} :catch_1b

    move-result-object v4

    return-object v4

    .line 87
    :catch_1b
    move-exception v0

    .line 88
    .local v0, "ex":Ljava/io/IOException;
    if-eqz p4, :cond_2c

    invoke-interface {p4}, Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 89
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v5, "Request has been aborted"

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 90
    throw v0

    .line 92
    :cond_2c
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->retryHandler:Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;

    invoke-interface {v4, v0, v1, p3}, Lcz/msebera/android/httpclient/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v4

    if-eqz v4, :cond_c1

    .line 93
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isInfoEnabled()Z

    move-result v4

    if-eqz v4, :cond_74

    .line 94
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "I/O exception ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") caught when processing request to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 98
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 94
    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->info(Ljava/lang/Object;)V

    .line 100
    :cond_74
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_85

    .line 101
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 103
    :cond_85
    invoke-static {p2}, Lcz/msebera/android/httpclient/impl/execchain/RequestEntityProxy;->isRepeatable(Lcz/msebera/android/httpclient/HttpRequest;)Z

    move-result v4

    if-nez v4, :cond_9a

    .line 104
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v5, "Cannot retry non-repeatable request"

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 105
    new-instance v4, Lcz/msebera/android/httpclient/client/NonRepeatableRequestException;

    const-string v5, "Cannot retry request with a non-repeatable request entity"

    invoke-direct {v4, v5, v0}, Lcz/msebera/android/httpclient/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 108
    :cond_9a
    invoke-virtual {p2, v2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 109
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v4}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isInfoEnabled()Z

    move-result v4

    if-eqz v4, :cond_bd

    .line 110
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/execchain/RetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Retrying request to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->info(Ljava/lang/Object;)V

    .line 84
    :cond_bd
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_14

    .line 113
    :cond_c1
    instance-of v4, v0, Lcz/msebera/android/httpclient/NoHttpResponseException;

    if-eqz v4, :cond_ed

    .line 114
    new-instance v3, Lcz/msebera/android/httpclient/NoHttpResponseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v5

    invoke-virtual {v5}, Lcz/msebera/android/httpclient/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " failed to respond"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcz/msebera/android/httpclient/NoHttpResponseException;-><init>(Ljava/lang/String;)V

    .line 116
    .local v3, "updatedex":Lcz/msebera/android/httpclient/NoHttpResponseException;
    invoke-virtual {v0}, Ljava/io/IOException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/NoHttpResponseException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 117
    throw v3

    .line 119
    .end local v3    # "updatedex":Lcz/msebera/android/httpclient/NoHttpResponseException;
    :cond_ed
    throw v0
.end method
