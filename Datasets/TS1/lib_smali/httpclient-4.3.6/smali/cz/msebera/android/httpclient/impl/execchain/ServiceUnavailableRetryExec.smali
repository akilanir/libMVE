.class public Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;
.super Ljava/lang/Object;
.source "ServiceUnavailableRetryExec.java"

# interfaces
.implements Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

.field private final retryStrategy:Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;)V
    .registers 5
    .param p1, "requestExecutor"    # Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;
    .param p2, "retryStrategy"    # Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 69
    const-string v0, "HTTP request executor"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    const-string v0, "Retry strategy"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;->requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    .line 72
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

    .line 73
    return-void
.end method


# virtual methods
.method public execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 15
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
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    .line 81
    .local v5, "origheaders":[Lcz/msebera/android/httpclient/Header;
    const/4 v0, 0x1

    .line 82
    .local v0, "c":I
    :goto_5
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;->requestExecutor:Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;

    invoke-interface {v7, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/impl/execchain/ClientExecChain;->execute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    move-result-object v6

    .line 85
    .local v6, "response":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_start_b
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v7, v6, v0, p3}, Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;->retryRequest(Lcz/msebera/android/httpclient/HttpResponse;ILcz/msebera/android/httpclient/protocol/HttpContext;)Z

    move-result v7

    if-eqz v7, :cond_56

    .line 86
    invoke-interface {v6}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 87
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v7}, Lcz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy;->getRetryInterval()J
    :try_end_1b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_1b} :catch_51

    move-result-wide v3

    .line 88
    .local v3, "nextInterval":J
    const-wide/16 v7, 0x0

    cmp-long v7, v3, v7

    if-lez v7, :cond_3d

    .line 90
    :try_start_22
    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/execchain/ServiceUnavailableRetryExec;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Wait for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->trace(Ljava/lang/Object;)V

    .line 91
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3d
    .catch Ljava/lang/InterruptedException; {:try_start_22 .. :try_end_3d} :catch_43
    .catch Ljava/lang/RuntimeException; {:try_start_22 .. :try_end_3d} :catch_51

    .line 97
    :cond_3d
    :try_start_3d
    invoke-virtual {p2, v5}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 92
    :catch_43
    move-exception v1

    .line 93
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    .line 94
    new-instance v7, Ljava/io/InterruptedIOException;

    invoke-direct {v7}, Ljava/io/InterruptedIOException;-><init>()V

    throw v7
    :try_end_51
    .catch Ljava/lang/RuntimeException; {:try_start_3d .. :try_end_51} :catch_51

    .line 101
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v3    # "nextInterval":J
    :catch_51
    move-exception v2

    .line 102
    .local v2, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v6}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    .line 103
    throw v2

    .line 99
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    :cond_56
    return-object v6
.end method
