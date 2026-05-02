.class Lcom/koushikdutta/async/http/AsyncHttpClient$4;
.super Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;
.source "AsyncHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/AsyncHttpClient;->executeSocket(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

.field final synthetic val$callback:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

.field final synthetic val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

.field final synthetic val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

.field final synthetic val$redirectCount:I

.field final synthetic val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;I)V
    .registers 8
    .param p2, "x0"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 321
    iput-object p1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iput-object p3, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iput-object p4, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iput-object p5, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$callback:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    iput-object p6, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    iput p7, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$redirectCount:I

    invoke-direct {p0, p2}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;-><init>(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    return-void
.end method


# virtual methods
.method public detachSocket()Lcom/koushikdutta/async/AsyncSocket;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 449
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v3, "Detaching socket"

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logd(Ljava/lang/String;)V

    .line 450
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->socket()Lcom/koushikdutta/async/AsyncSocket;

    move-result-object v0

    .line 451
    .local v0, "socket":Lcom/koushikdutta/async/AsyncSocket;
    if-nez v0, :cond_10

    move-object v0, v1

    .line 458
    .end local v0    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    :goto_f
    return-object v0

    .line 453
    .restart local v0    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    :cond_10
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V

    .line 454
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 455
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setEndCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 456
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 457
    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->setSocket(Lcom/koushikdutta/async/AsyncSocket;)V

    goto :goto_f
.end method

.method protected onHeadersReceived()V
    .registers 6

    .prologue
    .line 396
    invoke-super {p0}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->onHeadersReceived()V

    .line 397
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 415
    :goto_b
    return-void

    .line 401
    :cond_c
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iget-object v2, v2, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->timeoutRunnable:Ljava/lang/Runnable;

    if-eqz v2, :cond_1d

    .line 402
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v2, v2, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    iget-object v3, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iget-object v3, v3, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->scheduled:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/AsyncServer;->removeAllCallbacks(Ljava/lang/Object;)V

    .line 405
    :cond_1d
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received headers:\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 407
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v3, v2, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    monitor-enter v3

    .line 408
    :try_start_3e
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v2, v2, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_46
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 409
    .local v1, "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    invoke-interface {v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;->onHeadersReceived(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnHeadersReceivedDataOnRequestSentData;)V

    goto :goto_46

    .line 411
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    :catchall_58
    move-exception v2

    monitor-exit v3
    :try_end_5a
    .catchall {:try_start_3e .. :try_end_5a} :catchall_58

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_5b
    :try_start_5b
    monitor-exit v3
    :try_end_5c
    .catchall {:try_start_5b .. :try_end_5c} :catchall_58

    goto :goto_b
.end method

.method protected onRequestCompleted(Ljava/lang/Exception;)V
    .registers 10
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 324
    if-eqz p1, :cond_10

    .line 325
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v5, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$callback:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    move-object v2, p1

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    invoke-static/range {v0 .. v5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$200(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    .line 343
    :cond_f
    :goto_f
    return-void

    .line 329
    :cond_10
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v1, "request completed"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 330
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_f

    .line 333
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->timeoutRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_4a

    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    if-nez v0, :cond_4a

    .line 334
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iget-object v1, v1, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->scheduled:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/AsyncServer;->removeAllCallbacks(Ljava/lang/Object;)V

    .line 335
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v1, v1, Lcom/koushikdutta/async/http/AsyncHttpClient;->mServer:Lcom/koushikdutta/async/AsyncServer;

    iget-object v2, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    iget-object v2, v2, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->timeoutRunnable:Ljava/lang/Runnable;

    iget-object v3, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->getTimeoutRemaining(Lcom/koushikdutta/async/http/AsyncHttpRequest;)J
    invoke-static {v3}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$400(Lcom/koushikdutta/async/http/AsyncHttpRequest;)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/koushikdutta/async/AsyncServer;->postDelayed(Ljava/lang/Runnable;J)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->scheduled:Ljava/lang/Object;

    .line 338
    :cond_4a
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    monitor-enter v1

    .line 339
    :try_start_4f
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_57
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 340
    .local v7, "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    invoke-interface {v7, v0}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;->onRequestSent(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;)V

    goto :goto_57

    .line 342
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    :catchall_69
    move-exception v0

    monitor-exit v1
    :try_end_6b
    .catchall {:try_start_4f .. :try_end_6b} :catchall_69

    throw v0

    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_6c
    :try_start_6c
    monitor-exit v1
    :try_end_6d
    .catchall {:try_start_6c .. :try_end_6d} :catchall_69

    goto :goto_f
.end method

.method protected report(Ljava/lang/Exception;)V
    .registers 12
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 419
    if-eqz p1, :cond_9

    .line 420
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v1, "exception during response"

    invoke-virtual {v0, v1, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->loge(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 421
    :cond_9
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 445
    :cond_11
    :goto_11
    return-void

    .line 423
    :cond_12
    instance-of v0, p1, Lcom/koushikdutta/async/AsyncSSLException;

    if-eqz v0, :cond_2b

    .line 424
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v1, "SSL Exception"

    invoke-virtual {v0, v1, p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->loge(Ljava/lang/String;Ljava/lang/Exception;)V

    move-object v6, p1

    .line 425
    check-cast v6, Lcom/koushikdutta/async/AsyncSSLException;

    .line 426
    .local v6, "ase":Lcom/koushikdutta/async/AsyncSSLException;
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v0, v6}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->onHandshakeException(Lcom/koushikdutta/async/AsyncSSLException;)V

    .line 427
    invoke-virtual {v6}, Lcom/koushikdutta/async/AsyncSSLException;->getIgnore()Z

    move-result v0

    if-nez v0, :cond_11

    .line 430
    .end local v6    # "ase":Lcom/koushikdutta/async/AsyncSSLException;
    :cond_2b
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->socket()Lcom/koushikdutta/async/AsyncSocket;

    move-result-object v9

    .line 431
    .local v9, "socket":Lcom/koushikdutta/async/AsyncSocket;
    if-eqz v9, :cond_11

    .line 433
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->report(Ljava/lang/Exception;)V

    .line 434
    invoke-interface {v9}, Lcom/koushikdutta/async/AsyncSocket;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_3c

    if-eqz p1, :cond_51

    .line 435
    :cond_3c
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    if-nez v0, :cond_51

    if-eqz p1, :cond_51

    .line 436
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v1, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v5, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$callback:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    move-object v2, p1

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    invoke-static/range {v0 .. v5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$200(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    .line 439
    :cond_51
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    iput-object p1, v0, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->exception:Ljava/lang/Exception;

    .line 440
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    monitor-enter v1

    .line 441
    :try_start_5a
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v0, v0, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_62
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_77

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 442
    .local v8, "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    iget-object v0, p0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    invoke-interface {v8, v0}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;->onResponseComplete(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;)V

    goto :goto_62

    .line 444
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    :catchall_74
    move-exception v0

    monitor-exit v1
    :try_end_76
    .catchall {:try_start_5a .. :try_end_76} :catchall_74

    throw v0

    .restart local v7    # "i$":Ljava/util/Iterator;
    :cond_77
    :try_start_77
    monitor-exit v1
    :try_end_78
    .catchall {:try_start_77 .. :try_end_78} :catchall_74

    goto :goto_11
.end method

.method public setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V
    .registers 20
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;

    .prologue
    .line 347
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    move-object/from16 v0, p1

    iput-object v0, v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    .line 348
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v2, v1, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    monitor-enter v2

    .line 349
    :try_start_f
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    iget-object v1, v1, Lcom/koushikdutta/async/http/AsyncHttpClient;->mMiddleware:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_30

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;

    .line 350
    .local v14, "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    invoke-interface {v14, v1}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;->onBodyDecoder(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData;)V

    goto :goto_19

    .line 352
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v14    # "middleware":Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware;
    :catchall_2d
    move-exception v1

    monitor-exit v2
    :try_end_2f
    .catchall {:try_start_f .. :try_end_2f} :catchall_2d

    throw v1

    .restart local v11    # "i$":Ljava/util/Iterator;
    :cond_30
    :try_start_30
    monitor-exit v2
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2d

    .line 354
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;

    iget-object v1, v1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData;->bodyEmitter:Lcom/koushikdutta/async/DataEmitter;

    move-object/from16 v0, p0

    invoke-super {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 356
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->mHeaders:Lcom/koushikdutta/async/http/Headers;

    .line 357
    .local v10, "headers":Lcom/koushikdutta/async/http/Headers;
    invoke-virtual/range {p0 .. p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->code()I

    move-result v17

    .line 358
    .local v17, "responseCode":I
    const/16 v1, 0x12d

    move/from16 v0, v17

    if-eq v0, v1, :cond_56

    const/16 v1, 0x12e

    move/from16 v0, v17

    if-eq v0, v1, :cond_56

    const/16 v1, 0x133

    move/from16 v0, v17

    if-ne v0, v1, :cond_12d

    :cond_56
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getFollowRedirect()Z

    move-result v1

    if-eqz v1, :cond_12d

    .line 359
    const-string v1, "Location"

    invoke-virtual {v10, v1}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 362
    .local v12, "location":Ljava/lang/String;
    :try_start_66
    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    .line 363
    .local v16, "redirect":Landroid/net/Uri;
    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_8e

    .line 364
    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/net/URL;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2, v12}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_8d} :catch_112

    move-result-object v16

    .line 371
    :cond_8e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "HEAD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_129

    const-string v13, "HEAD"

    .line 372
    .local v13, "method":Ljava/lang/String;
    :goto_a0
    new-instance v15, Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v13}, Lcom/koushikdutta/async/http/AsyncHttpRequest;-><init>(Landroid/net/Uri;Ljava/lang/String;)V

    .line 373
    .local v15, "newReq":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-wide v1, v1, Lcom/koushikdutta/async/http/AsyncHttpRequest;->executionTime:J

    iput-wide v1, v15, Lcom/koushikdutta/async/http/AsyncHttpRequest;->executionTime:J

    .line 374
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget v1, v1, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    iput v1, v15, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logLevel:I

    .line 375
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v1, v1, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    iput-object v1, v15, Lcom/koushikdutta/async/http/AsyncHttpRequest;->LOGTAG:Ljava/lang/String;

    .line 376
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v1, v1, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyHost:Ljava/lang/String;

    iput-object v1, v15, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyHost:Ljava/lang/String;

    .line 377
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget v1, v1, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyPort:I

    iput v1, v15, Lcom/koushikdutta/async/http/AsyncHttpRequest;->proxyPort:I

    .line 378
    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->setupAndroidProxy(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V
    invoke-static {v15}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$500(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    .line 379
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v2, "User-Agent"

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->copyHeader(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V
    invoke-static {v1, v15, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$600(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V

    .line 380
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v2, "Range"

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->copyHeader(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V
    invoke-static {v1, v15, v2}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$600(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/String;)V

    .line 381
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v2, "Redirecting"

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 382
    const-string v1, "Redirected"

    invoke-virtual {v15, v1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logi(Ljava/lang/String;)V

    .line 383
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$redirectCount:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$callback:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->execute(Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    invoke-static {v1, v15, v2, v4, v5}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$700(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpRequest;ILcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    .line 385
    new-instance v1, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;

    invoke-direct {v1}, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 393
    .end local v12    # "location":Ljava/lang/String;
    .end local v13    # "method":Ljava/lang/String;
    .end local v15    # "newReq":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .end local v16    # "redirect":Landroid/net/Uri;
    :goto_111
    return-void

    .line 367
    .restart local v12    # "location":Ljava/lang/String;
    :catch_112
    move-exception v3

    .line 368
    .local v3, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$callback:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    move-object/from16 v4, p0

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    invoke-static/range {v1 .. v6}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$200(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    goto :goto_111

    .line 371
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v16    # "redirect":Landroid/net/Uri;
    :cond_129
    const-string v13, "GET"

    goto/16 :goto_a0

    .line 389
    .end local v12    # "location":Ljava/lang/String;
    .end local v16    # "redirect":Landroid/net/Uri;
    :cond_12d
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Final (post cache response) headers:\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 392
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->this$0:Lcom/koushikdutta/async/http/AsyncHttpClient;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$cancel:Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/koushikdutta/async/http/AsyncHttpClient$4;->val$callback:Lcom/koushikdutta/async/http/callback/HttpConnectCallback;

    move-object/from16 v7, p0

    # invokes: Lcom/koushikdutta/async/http/AsyncHttpClient;->reportConnectedCompleted(Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V
    invoke-static/range {v4 .. v9}, Lcom/koushikdutta/async/http/AsyncHttpClient;->access$200(Lcom/koushikdutta/async/http/AsyncHttpClient;Lcom/koushikdutta/async/http/AsyncHttpClient$FutureAsyncHttpResponse;Ljava/lang/Exception;Lcom/koushikdutta/async/http/AsyncHttpResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/http/callback/HttpConnectCallback;)V

    goto :goto_111
.end method
