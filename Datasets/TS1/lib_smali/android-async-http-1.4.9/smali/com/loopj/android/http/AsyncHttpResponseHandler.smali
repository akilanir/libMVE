.class public abstract Lcom/loopj/android/http/AsyncHttpResponseHandler;
.super Ljava/lang/Object;
.source "AsyncHttpResponseHandler.java"

# interfaces
.implements Lcom/loopj/android/http/ResponseHandlerInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/loopj/android/http/AsyncHttpResponseHandler$ResponderHandler;
    }
.end annotation


# static fields
.field protected static final BUFFER_SIZE:I = 0x1000

.field protected static final CANCEL_MESSAGE:I = 0x6

.field public static final DEFAULT_CHARSET:Ljava/lang/String; = "UTF-8"

.field protected static final FAILURE_MESSAGE:I = 0x1

.field protected static final FINISH_MESSAGE:I = 0x3

.field private static final LOG_TAG:Ljava/lang/String; = "AsyncHttpRH"

.field protected static final PROGRESS_MESSAGE:I = 0x4

.field protected static final RETRY_MESSAGE:I = 0x5

.field protected static final START_MESSAGE:I = 0x2

.field protected static final SUCCESS_MESSAGE:I = 0x0

.field public static final UTF8_BOM:Ljava/lang/String; = "\ufeff"


# instance fields
.field private TAG:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private handler:Landroid/os/Handler;

.field private looper:Landroid/os/Looper;

.field private requestHeaders:[Lcz/msebera/android/httpclient/Header;

.field private requestURI:Ljava/net/URI;

.field private responseCharset:Ljava/lang/String;

.field private usePoolThread:Z

.field private useSynchronousMode:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 109
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>(Landroid/os/Looper;)V

    .line 110
    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .registers 5
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->responseCharset:Ljava/lang/String;

    .line 100
    iput-object v1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestURI:Ljava/net/URI;

    .line 101
    iput-object v1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestHeaders:[Lcz/msebera/android/httpclient/Header;

    .line 102
    iput-object v1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->looper:Landroid/os/Looper;

    .line 103
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->TAG:Ljava/lang/ref/WeakReference;

    .line 120
    if-nez p1, :cond_1c

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    .end local p1    # "looper":Landroid/os/Looper;
    :cond_1c
    iput-object p1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->looper:Landroid/os/Looper;

    .line 123
    invoke-virtual {p0, v2}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->setUseSynchronousMode(Z)V

    .line 126
    invoke-virtual {p0, v2}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->setUsePoolThread(Z)V

    .line 127
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 4
    .param p1, "usePoolThread"    # Z

    .prologue
    const/4 v1, 0x0

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->responseCharset:Ljava/lang/String;

    .line 100
    iput-object v1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestURI:Ljava/net/URI;

    .line 101
    iput-object v1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestHeaders:[Lcz/msebera/android/httpclient/Header;

    .line 102
    iput-object v1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->looper:Landroid/os/Looper;

    .line 103
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->TAG:Ljava/lang/ref/WeakReference;

    .line 137
    invoke-virtual {p0, p1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->setUsePoolThread(Z)V

    .line 140
    invoke-virtual {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->getUsePoolThread()Z

    move-result v0

    if-nez v0, :cond_28

    .line 142
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->looper:Landroid/os/Looper;

    .line 145
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->setUseSynchronousMode(Z)V

    .line 147
    :cond_28
    return-void
.end method


# virtual methods
.method public getCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->responseCharset:Ljava/lang/String;

    if-nez v0, :cond_7

    const-string v0, "UTF-8"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->responseCharset:Ljava/lang/String;

    goto :goto_6
.end method

.method public getRequestHeaders()[Lcz/msebera/android/httpclient/Header;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestHeaders:[Lcz/msebera/android/httpclient/Header;

    return-object v0
.end method

.method public getRequestURI()Ljava/net/URI;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestURI:Ljava/net/URI;

    return-object v0
.end method

.method getResponseData(Lcz/msebera/android/httpclient/HttpEntity;)[B
    .registers 15
    .param p1, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 462
    const/4 v9, 0x0

    .line 463
    .local v9, "responseBody":[B
    if-eqz p1, :cond_74

    .line 464
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v7

    .line 465
    .local v7, "instream":Ljava/io/InputStream;
    if-eqz v7, :cond_74

    .line 466
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v2

    .line 467
    .local v2, "contentLength":J
    const-wide/32 v11, 0x7fffffff

    cmp-long v11, v2, v11

    if-lez v11, :cond_1c

    .line 468
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "HTTP entity too large to be buffered in memory"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 470
    :cond_1c
    const-wide/16 v11, 0x0

    cmp-long v11, v2, v11

    if-gtz v11, :cond_66

    const/16 v1, 0x1000

    .line 472
    .local v1, "buffersize":I
    :goto_24
    :try_start_24
    new-instance v0, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;-><init>(I)V
    :try_end_29
    .catch Ljava/lang/OutOfMemoryError; {:try_start_24 .. :try_end_29} :catch_5a

    .line 474
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/ByteArrayBuffer;
    const/16 v11, 0x1000

    :try_start_2b
    new-array v10, v11, [B

    .line 475
    .local v10, "tmp":[B
    const-wide/16 v4, 0x0

    .line 478
    .local v4, "count":J
    :goto_2f
    invoke-virtual {v7, v10}, Ljava/io/InputStream;->read([B)I

    move-result v8

    .local v8, "l":I
    const/4 v11, -0x1

    if-eq v8, v11, :cond_6a

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v11

    if-nez v11, :cond_6a

    .line 479
    int-to-long v11, v8

    add-long/2addr v4, v11

    .line 480
    const/4 v11, 0x0

    invoke-virtual {v0, v10, v11, v8}, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;->append([BII)V

    .line 481
    const-wide/16 v11, 0x0

    cmp-long v11, v2, v11

    if-gtz v11, :cond_68

    const-wide/16 v11, 0x1

    :goto_4e
    invoke-virtual {p0, v4, v5, v11, v12}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendProgressMessage(JJ)V
    :try_end_51
    .catchall {:try_start_2b .. :try_end_51} :catchall_52

    goto :goto_2f

    .line 484
    .end local v4    # "count":J
    .end local v8    # "l":I
    .end local v10    # "tmp":[B
    :catchall_52
    move-exception v11

    :try_start_53
    invoke-static {v7}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 485
    invoke-static {p1}, Lcom/loopj/android/http/AsyncHttpClient;->endEntityViaReflection(Lcz/msebera/android/httpclient/HttpEntity;)V

    throw v11
    :try_end_5a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_53 .. :try_end_5a} :catch_5a

    .line 488
    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/ByteArrayBuffer;
    :catch_5a
    move-exception v6

    .line 489
    .local v6, "e":Ljava/lang/OutOfMemoryError;
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 490
    new-instance v11, Ljava/io/IOException;

    const-string v12, "File too large to fit into available memory"

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 470
    .end local v1    # "buffersize":I
    .end local v6    # "e":Ljava/lang/OutOfMemoryError;
    :cond_66
    long-to-int v1, v2

    goto :goto_24

    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/ByteArrayBuffer;
    .restart local v1    # "buffersize":I
    .restart local v4    # "count":J
    .restart local v8    # "l":I
    .restart local v10    # "tmp":[B
    :cond_68
    move-wide v11, v2

    .line 481
    goto :goto_4e

    .line 484
    :cond_6a
    :try_start_6a
    invoke-static {v7}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 485
    invoke-static {p1}, Lcom/loopj/android/http/AsyncHttpClient;->endEntityViaReflection(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 487
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;->toByteArray()[B
    :try_end_73
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6a .. :try_end_73} :catch_5a

    move-result-object v9

    .line 494
    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/ByteArrayBuffer;
    .end local v1    # "buffersize":I
    .end local v2    # "contentLength":J
    .end local v4    # "count":J
    .end local v7    # "instream":Ljava/io/InputStream;
    .end local v8    # "l":I
    .end local v10    # "tmp":[B
    :cond_74
    return-object v9
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->TAG:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getUsePoolThread()Z
    .registers 2

    .prologue
    .line 206
    iget-boolean v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->usePoolThread:Z

    return v0
.end method

.method public getUseSynchronousMode()Z
    .registers 2

    .prologue
    .line 181
    iget-boolean v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->useSynchronousMode:Z

    return v0
.end method

.method protected handleMessage(Landroid/os/Message;)V
    .registers 11
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 347
    :try_start_3
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_e6

    .line 397
    :goto_8
    return-void

    .line 349
    :pswitch_9
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    move-object v0, v4

    check-cast v0, [Ljava/lang/Object;

    move-object v2, v0

    .line 350
    .local v2, "response":[Ljava/lang/Object;
    if-eqz v2, :cond_36

    array-length v4, v2

    if-lt v4, v7, :cond_36

    .line 351
    const/4 v4, 0x0

    aget-object v4, v2, v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v4, 0x1

    aget-object v4, v2, v4

    check-cast v4, [Lcz/msebera/android/httpclient/Header;

    check-cast v4, [Lcz/msebera/android/httpclient/Header;

    const/4 v5, 0x2

    aget-object v5, v2, v5

    check-cast v5, [B

    check-cast v5, [B

    invoke-virtual {p0, v6, v4, v5}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onSuccess(I[Lcz/msebera/android/httpclient/Header;[B)V
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_30} :catch_31

    goto :goto_8

    .line 394
    .end local v2    # "response":[Ljava/lang/Object;
    :catch_31
    move-exception v1

    .line 395
    .local v1, "error":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onUserException(Ljava/lang/Throwable;)V

    goto :goto_8

    .line 353
    .end local v1    # "error":Ljava/lang/Throwable;
    .restart local v2    # "response":[Ljava/lang/Object;
    :cond_36
    :try_start_36
    sget-object v4, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v5, "AsyncHttpRH"

    const-string v6, "SUCCESS_MESSAGE didn\'t got enough params"

    invoke-interface {v4, v5, v6}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 357
    .end local v2    # "response":[Ljava/lang/Object;
    :pswitch_40
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    move-object v0, v4

    check-cast v0, [Ljava/lang/Object;

    move-object v2, v0

    .line 358
    .restart local v2    # "response":[Ljava/lang/Object;
    if-eqz v2, :cond_6e

    array-length v4, v2

    const/4 v5, 0x4

    if-lt v4, v5, :cond_6e

    .line 359
    const/4 v4, 0x0

    aget-object v4, v2, v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v4, 0x1

    aget-object v4, v2, v4

    check-cast v4, [Lcz/msebera/android/httpclient/Header;

    check-cast v4, [Lcz/msebera/android/httpclient/Header;

    const/4 v5, 0x2

    aget-object v5, v2, v5

    check-cast v5, [B

    check-cast v5, [B

    const/4 v6, 0x3

    aget-object v6, v2, v6

    check-cast v6, Ljava/lang/Throwable;

    invoke-virtual {p0, v7, v4, v5, v6}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onFailure(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V

    goto :goto_8

    .line 361
    :cond_6e
    sget-object v4, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v5, "AsyncHttpRH"

    const-string v6, "FAILURE_MESSAGE didn\'t got enough params"

    invoke-interface {v4, v5, v6}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 365
    .end local v2    # "response":[Ljava/lang/Object;
    :pswitch_78
    invoke-virtual {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onStart()V

    goto :goto_8

    .line 368
    :pswitch_7c
    invoke-virtual {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onFinish()V

    goto :goto_8

    .line 371
    :pswitch_80
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    move-object v0, v4

    check-cast v0, [Ljava/lang/Object;

    move-object v2, v0

    .line 372
    .restart local v2    # "response":[Ljava/lang/Object;
    if-eqz v2, :cond_b0

    array-length v4, v2
    :try_end_8b
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_8b} :catch_31

    if-lt v4, v6, :cond_b0

    .line 374
    const/4 v4, 0x0

    :try_start_8e
    aget-object v4, v2, v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    const/4 v4, 0x1

    aget-object v4, v2, v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {p0, v5, v6, v7, v8}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onProgress(JJ)V
    :try_end_a2
    .catch Ljava/lang/Throwable; {:try_start_8e .. :try_end_a2} :catch_a4

    goto/16 :goto_8

    .line 375
    :catch_a4
    move-exception v3

    .line 376
    .local v3, "t":Ljava/lang/Throwable;
    :try_start_a5
    sget-object v4, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v5, "AsyncHttpRH"

    const-string v6, "custom onProgress contains an error"

    invoke-interface {v4, v5, v6, v3}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_8

    .line 379
    .end local v3    # "t":Ljava/lang/Throwable;
    :cond_b0
    sget-object v4, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v5, "AsyncHttpRH"

    const-string v6, "PROGRESS_MESSAGE didn\'t got enough params"

    invoke-interface {v4, v5, v6}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    .line 383
    .end local v2    # "response":[Ljava/lang/Object;
    :pswitch_bb
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    move-object v0, v4

    check-cast v0, [Ljava/lang/Object;

    move-object v2, v0

    .line 384
    .restart local v2    # "response":[Ljava/lang/Object;
    if-eqz v2, :cond_d6

    array-length v4, v2

    if-ne v4, v5, :cond_d6

    .line 385
    const/4 v4, 0x0

    aget-object v4, v2, v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onRetry(I)V

    goto/16 :goto_8

    .line 387
    :cond_d6
    sget-object v4, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v5, "AsyncHttpRH"

    const-string v6, "RETRY_MESSAGE didn\'t get enough params"

    invoke-interface {v4, v5, v6}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8

    .line 391
    .end local v2    # "response":[Ljava/lang/Object;
    :pswitch_e1
    invoke-virtual {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->onCancel()V
    :try_end_e4
    .catch Ljava/lang/Throwable; {:try_start_a5 .. :try_end_e4} :catch_31

    goto/16 :goto_8

    .line 347
    :pswitch_data_e6
    .packed-switch 0x0
        :pswitch_9
        :pswitch_40
        :pswitch_78
        :pswitch_7c
        :pswitch_80
        :pswitch_bb
        :pswitch_e1
    .end packed-switch
.end method

.method protected obtainMessage(ILjava/lang/Object;)Landroid/os/Message;
    .registers 4
    .param p1, "responseMessageId"    # I
    .param p2, "responseMessageData"    # Ljava/lang/Object;

    .prologue
    .line 433
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    invoke-static {v0, p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    return-object v0
.end method

.method public onCancel()V
    .registers 4

    .prologue
    .line 299
    sget-object v0, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v1, "AsyncHttpRH"

    const-string v2, "Request got cancelled"

    invoke-interface {v0, v1, v2}, Lcom/loopj/android/http/LogInterface;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    return-void
.end method

.method public abstract onFailure(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V
.end method

.method public onFinish()V
    .registers 1

    .prologue
    .line 258
    return-void
.end method

.method public onPostProcessResponse(Lcom/loopj/android/http/ResponseHandlerInterface;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "instance"    # Lcom/loopj/android/http/ResponseHandlerInterface;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 268
    return-void
.end method

.method public onPreProcessResponse(Lcom/loopj/android/http/ResponseHandlerInterface;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "instance"    # Lcom/loopj/android/http/ResponseHandlerInterface;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 263
    return-void
.end method

.method public onProgress(JJ)V
    .registers 14
    .param p1, "bytesWritten"    # J
    .param p3, "totalSize"    # J

    .prologue
    .line 242
    sget-object v2, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v3, "AsyncHttpRH"

    const-string v4, "Progress %d from %d (%2.0f%%)"

    const/4 v0, 0x3

    new-array v5, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v0, 0x1

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v5, v0

    const/4 v6, 0x2

    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-lez v0, :cond_35

    long-to-double v0, p1

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v0, v7

    long-to-double v7, p3

    div-double/2addr v0, v7

    const-wide/high16 v7, 0x4059000000000000L    # 100.0

    mul-double/2addr v0, v7

    :goto_27
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Lcom/loopj/android/http/LogInterface;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    return-void

    .line 242
    :cond_35
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    goto :goto_27
.end method

.method public onRetry(I)V
    .registers 8
    .param p1, "retryNo"    # I

    .prologue
    .line 295
    sget-object v0, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v1, "AsyncHttpRH"

    const-string v2, "Request retry no. %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/loopj/android/http/LogInterface;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 250
    return-void
.end method

.method public abstract onSuccess(I[Lcz/msebera/android/httpclient/Header;[B)V
.end method

.method public onUserException(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 303
    sget-object v0, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v1, "AsyncHttpRH"

    const-string v2, "User-space exception detected!"

    invoke-interface {v0, v1, v2, p1}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 304
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method protected postRunnable(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 414
    if-eqz p1, :cond_f

    .line 415
    invoke-virtual {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->getUseSynchronousMode()Z

    move-result v0

    if-nez v0, :cond_c

    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    if-nez v0, :cond_10

    .line 417
    :cond_c
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 423
    :cond_f
    :goto_f
    return-void

    .line 420
    :cond_10
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_f
.end method

.method public final sendCancelMessage()V
    .registers 3

    .prologue
    .line 339
    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 340
    return-void
.end method

.method public final sendFailureMessage(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V
    .registers 9
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBody"    # [B
    .param p4, "throwable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v3, 0x1

    .line 319
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    aput-object p2, v0, v3

    const/4 v1, 0x2

    aput-object p3, v0, v1

    const/4 v1, 0x3

    aput-object p4, v0, v1

    invoke-virtual {p0, v3, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 320
    return-void
.end method

.method public final sendFinishMessage()V
    .registers 3

    .prologue
    .line 329
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 330
    return-void
.end method

.method protected sendMessage(Landroid/os/Message;)V
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 400
    invoke-virtual {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->getUseSynchronousMode()Z

    move-result v0

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    if-nez v0, :cond_e

    .line 401
    :cond_a
    invoke-virtual {p0, p1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handleMessage(Landroid/os/Message;)V

    .line 406
    :cond_d
    :goto_d
    return-void

    .line 402
    :cond_e
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_d

    .line 403
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_28

    const/4 v0, 0x1

    :goto_1d
    const-string v1, "handler should not be null!"

    invoke-static {v0, v1}, Lcom/loopj/android/http/Utils;->asserts(ZLjava/lang/String;)V

    .line 404
    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_d

    .line 403
    :cond_28
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public final sendProgressMessage(JJ)V
    .registers 9
    .param p1, "bytesWritten"    # J
    .param p3, "bytesTotal"    # J

    .prologue
    .line 309
    const/4 v0, 0x4

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 310
    return-void
.end method

.method public sendResponseMessage(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 9
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 439
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_40

    .line 440
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v1

    .line 442
    .local v1, "status":Lcz/msebera/android/httpclient/StatusLine;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->getResponseData(Lcz/msebera/android/httpclient/HttpEntity;)[B

    move-result-object v0

    .line 444
    .local v0, "responseBody":[B
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_40

    .line 445
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0x12c

    if-lt v2, v3, :cond_41

    .line 446
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    new-instance v4, Lcz/msebera/android/httpclient/client/HttpResponseException;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v5

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcz/msebera/android/httpclient/client/HttpResponseException;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v2, v3, v0, v4}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendFailureMessage(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V

    .line 452
    .end local v0    # "responseBody":[B
    .end local v1    # "status":Lcz/msebera/android/httpclient/StatusLine;
    :cond_40
    :goto_40
    return-void

    .line 448
    .restart local v0    # "responseBody":[B
    .restart local v1    # "status":Lcz/msebera/android/httpclient/StatusLine;
    :cond_41
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    invoke-virtual {p0, v2, v3, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendSuccessMessage(I[Lcz/msebera/android/httpclient/Header;[B)V

    goto :goto_40
.end method

.method public final sendRetryMessage(I)V
    .registers 6
    .param p1, "retryNo"    # I

    .prologue
    .line 334
    const/4 v0, 0x5

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 335
    return-void
.end method

.method public final sendStartMessage()V
    .registers 3

    .prologue
    .line 324
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 325
    return-void
.end method

.method public final sendSuccessMessage(I[Lcz/msebera/android/httpclient/Header;[B)V
    .registers 7
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBytes"    # [B

    .prologue
    const/4 v2, 0x0

    .line 314
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    const/4 v1, 0x1

    aput-object p2, v0, v1

    const/4 v1, 0x2

    aput-object p3, v0, v1

    invoke-virtual {p0, v2, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;->sendMessage(Landroid/os/Message;)V

    .line 315
    return-void
.end method

.method public setCharset(Ljava/lang/String;)V
    .registers 2
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 232
    iput-object p1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->responseCharset:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public setRequestHeaders([Lcz/msebera/android/httpclient/Header;)V
    .registers 2
    .param p1, "requestHeaders"    # [Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 176
    iput-object p1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestHeaders:[Lcz/msebera/android/httpclient/Header;

    .line 177
    return-void
.end method

.method public setRequestURI(Ljava/net/URI;)V
    .registers 2
    .param p1, "requestURI"    # Ljava/net/URI;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->requestURI:Ljava/net/URI;

    .line 167
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .registers 3
    .param p1, "TAG"    # Ljava/lang/Object;

    .prologue
    .line 156
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->TAG:Ljava/lang/ref/WeakReference;

    .line 157
    return-void
.end method

.method public setUsePoolThread(Z)V
    .registers 3
    .param p1, "pool"    # Z

    .prologue
    const/4 v0, 0x0

    .line 213
    if-eqz p1, :cond_7

    .line 214
    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->looper:Landroid/os/Looper;

    .line 215
    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    .line 218
    :cond_7
    iput-boolean p1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->usePoolThread:Z

    .line 219
    return-void
.end method

.method public setUseSynchronousMode(Z)V
    .registers 5
    .param p1, "sync"    # Z

    .prologue
    .line 187
    if-nez p1, :cond_10

    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->looper:Landroid/os/Looper;

    if-nez v0, :cond_10

    .line 188
    const/4 p1, 0x1

    .line 189
    sget-object v0, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v1, "AsyncHttpRH"

    const-string v2, "Current thread has not called Looper.prepare(). Forcing synchronous mode."

    invoke-interface {v0, v1, v2}, Lcom/loopj/android/http/LogInterface;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    :cond_10
    if-nez p1, :cond_22

    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    if-nez v0, :cond_22

    .line 195
    new-instance v0, Lcom/loopj/android/http/AsyncHttpResponseHandler$ResponderHandler;

    iget-object v1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->looper:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/loopj/android/http/AsyncHttpResponseHandler$ResponderHandler;-><init>(Lcom/loopj/android/http/AsyncHttpResponseHandler;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    .line 201
    :cond_1f
    :goto_1f
    iput-boolean p1, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->useSynchronousMode:Z

    .line 202
    return-void

    .line 196
    :cond_22
    if-eqz p1, :cond_1f

    iget-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_1f

    .line 198
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/loopj/android/http/AsyncHttpResponseHandler;->handler:Landroid/os/Handler;

    goto :goto_1f
.end method
