.class Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;
.super Ljava/lang/Object;
.source "AsynchronousValidationRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

.field private final cachingExec:Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;

.field private final consecutiveFailedAttempts:I

.field private final context:Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

.field private final execAware:Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;

.field private final identifier:Ljava/lang/String;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final parent:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

.field private final request:Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

.field private final route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;


# direct methods
.method constructor <init>(Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/lang/String;I)V
    .registers 12
    .param p1, "parent"    # Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;
    .param p2, "cachingExec"    # Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;
    .param p3, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p4, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p5, "context"    # Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    .param p6, "execAware"    # Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;
    .param p7, "cacheEntry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p8, "identifier"    # Ljava/lang/String;
    .param p9, "consecutiveFailedAttempts"    # I

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 80
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->parent:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    .line 81
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->cachingExec:Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;

    .line 82
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    .line 83
    iput-object p4, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->request:Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    .line 84
    iput-object p5, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->context:Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    .line 85
    iput-object p6, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->execAware:Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;

    .line 86
    iput-object p7, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .line 87
    iput-object p8, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    .line 88
    iput p9, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->consecutiveFailedAttempts:I

    .line 89
    return-void
.end method

.method private isNotServerError(I)Z
    .registers 3
    .param p1, "statusCode"    # I

    .prologue
    .line 137
    const/16 v0, 0x1f4

    if-ge p1, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private isNotStale(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 9
    .param p1, "httpResponse"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v3, 0x0

    .line 146
    const-string v4, "Warning"

    invoke-interface {p1, v4}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    .line 147
    .local v2, "warnings":[Lcz/msebera/android/httpclient/Header;
    if-eqz v2, :cond_27

    .line 149
    array-length v5, v2

    move v4, v3

    :goto_b
    if-ge v4, v5, :cond_27

    aget-object v0, v2, v4

    .line 156
    .local v0, "warning":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 157
    .local v1, "warningValue":Ljava/lang/String;
    const-string v6, "110"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_23

    const-string v6, "111"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_24

    .line 163
    .end local v0    # "warning":Lcz/msebera/android/httpclient/Header;
    .end local v1    # "warningValue":Ljava/lang/String;
    :cond_23
    :goto_23
    return v3

    .line 149
    .restart local v0    # "warning":Lcz/msebera/android/httpclient/Header;
    .restart local v1    # "warningValue":Ljava/lang/String;
    :cond_24
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .line 163
    .end local v0    # "warning":Lcz/msebera/android/httpclient/Header;
    .end local v1    # "warningValue":Ljava/lang/String;
    :cond_27
    const/4 v3, 0x1

    goto :goto_23
.end method


# virtual methods
.method public getConsecutiveFailedAttempts()I
    .registers 2

    .prologue
    .line 175
    iget v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->consecutiveFailedAttempts:I

    return v0
.end method

.method getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method protected revalidateCacheEntry()Z
    .registers 13

    .prologue
    const/4 v11, 0x0

    .line 112
    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->cachingExec:Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->request:Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;

    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->context:Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->execAware:Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->cacheEntry:Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    invoke-virtual/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/client/cache/CachingExec;->revalidateCacheEntry(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;Lcz/msebera/android/httpclient/client/methods/HttpExecutionAware;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_10} :catch_32
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_1 .. :try_end_10} :catch_3b
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_10} :catch_44

    move-result-object v6

    .line 114
    .local v6, "httpResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_start_11
    invoke-interface {v6}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v10

    .line 115
    .local v10, "statusCode":I
    invoke-direct {p0, v10}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->isNotServerError(I)Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-direct {p0, v6}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->isNotStale(Lcz/msebera/android/httpclient/HttpResponse;)Z
    :try_end_22
    .catchall {:try_start_11 .. :try_end_22} :catchall_2d

    move-result v0

    if-eqz v0, :cond_2b

    const/4 v0, 0x1

    .line 117
    :goto_26
    :try_start_26
    invoke-interface {v6}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    move v11, v0

    .line 127
    .end local v6    # "httpResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .end local v10    # "statusCode":I
    :goto_2a
    return v11

    .restart local v6    # "httpResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .restart local v10    # "statusCode":I
    :cond_2b
    move v0, v11

    .line 115
    goto :goto_26

    .line 117
    .end local v10    # "statusCode":I
    :catchall_2d
    move-exception v0

    invoke-interface {v6}, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;->close()V

    throw v0
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_32} :catch_32
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_26 .. :try_end_32} :catch_3b
    .catch Ljava/lang/RuntimeException; {:try_start_26 .. :try_end_32} :catch_44

    .line 119
    .end local v6    # "httpResponse":Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :catch_32
    move-exception v7

    .line 120
    .local v7, "ioe":Ljava/io/IOException;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "Asynchronous revalidation failed due to I/O error"

    invoke-virtual {v0, v1, v7}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_2a

    .line 122
    .end local v7    # "ioe":Ljava/io/IOException;
    :catch_3b
    move-exception v8

    .line 123
    .local v8, "pe":Lcz/msebera/android/httpclient/HttpException;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "HTTP protocol exception during asynchronous revalidation"

    invoke-virtual {v0, v1, v8}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_2a

    .line 125
    .end local v8    # "pe":Lcz/msebera/android/httpclient/HttpException;
    :catch_44
    move-exception v9

    .line 126
    .local v9, "re":Ljava/lang/RuntimeException;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RuntimeException thrown during asynchronous revalidation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->error(Ljava/lang/Object;)V

    goto :goto_2a
.end method

.method public run()V
    .registers 4

    .prologue
    .line 93
    :try_start_0
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->revalidateCacheEntry()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 94
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->parent:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;->jobSuccessful(Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_0 .. :try_end_d} :catchall_1d

    .line 99
    :goto_d
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->parent:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    .line 101
    return-void

    .line 96
    :cond_15
    :try_start_15
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->parent:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;->jobFailed(Ljava/lang/String;)V
    :try_end_1c
    .catchall {:try_start_15 .. :try_end_1c} :catchall_1d

    goto :goto_d

    .line 99
    :catchall_1d
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->parent:Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/impl/client/cache/AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    throw v0
.end method
