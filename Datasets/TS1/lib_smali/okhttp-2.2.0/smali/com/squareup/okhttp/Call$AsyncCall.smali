.class final Lcom/squareup/okhttp/Call$AsyncCall;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "Call.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/Call;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "AsyncCall"
.end annotation


# instance fields
.field private final responseCallback:Lcom/squareup/okhttp/Callback;

.field final synthetic this$0:Lcom/squareup/okhttp/Call;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;)V
    .registers 7
    .param p1, "this$0"    # Lcom/squareup/okhttp/Call;
    .param p2, "responseCallback"    # Lcom/squareup/okhttp/Callback;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    .line 129
    const-string v0, "OkHttp %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p1, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 130
    iput-object p2, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    .line 131
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;Lcom/squareup/okhttp/Call$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/squareup/okhttp/Call;
    .param p2, "x1"    # Lcom/squareup/okhttp/Callback;
    .param p3, "x2"    # Lcom/squareup/okhttp/Call$1;

    .prologue
    .line 125
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/Call$AsyncCall;-><init>(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;)V

    return-void
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Call;->cancel()V

    .line 147
    return-void
.end method

.method protected execute()V
    .registers 8

    .prologue
    .line 154
    const/4 v2, 0x0

    .line 156
    .local v2, "signalledCallback":Z
    :try_start_1
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    # invokes: Lcom/squareup/okhttp/Call;->getResponseWithInterceptorChain()Lcom/squareup/okhttp/Response;
    invoke-static {v3}, Lcom/squareup/okhttp/Call;->access$100(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/Response;

    move-result-object v1

    .line 157
    .local v1, "response":Lcom/squareup/okhttp/Response;
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-boolean v3, v3, Lcom/squareup/okhttp/Call;->canceled:Z

    if-eqz v3, :cond_2c

    .line 158
    const/4 v2, 0x1

    .line 159
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    iget-object v4, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v4, v4, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    new-instance v5, Ljava/io/IOException;

    const-string v6, "Canceled"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4, v5}, Lcom/squareup/okhttp/Callback;->onFailure(Lcom/squareup/okhttp/Request;Ljava/io/IOException;)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1e} :catch_33
    .catchall {:try_start_1 .. :try_end_1e} :catchall_72

    .line 172
    :goto_1e
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    # getter for: Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;
    invoke-static {v3}, Lcom/squareup/okhttp/Call;->access$300(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call$AsyncCall;)V

    .line 174
    .end local v1    # "response":Lcom/squareup/okhttp/Response;
    :goto_2b
    return-void

    .line 161
    .restart local v1    # "response":Lcom/squareup/okhttp/Response;
    :cond_2c
    const/4 v2, 0x1

    .line 162
    :try_start_2d
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    invoke-interface {v3, v1}, Lcom/squareup/okhttp/Callback;->onResponse(Lcom/squareup/okhttp/Response;)V
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_32} :catch_33
    .catchall {:try_start_2d .. :try_end_32} :catchall_72

    goto :goto_1e

    .line 164
    .end local v1    # "response":Lcom/squareup/okhttp/Response;
    :catch_33
    move-exception v0

    .line 165
    .local v0, "e":Ljava/io/IOException;
    if-eqz v2, :cond_64

    .line 167
    :try_start_36
    sget-object v3, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Callback failure for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    # invokes: Lcom/squareup/okhttp/Call;->toLoggableString()Ljava/lang/String;
    invoke-static {v6}, Lcom/squareup/okhttp/Call;->access$200(Lcom/squareup/okhttp/Call;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_56
    .catchall {:try_start_36 .. :try_end_56} :catchall_72

    .line 172
    :goto_56
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    # getter for: Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;
    invoke-static {v3}, Lcom/squareup/okhttp/Call;->access$300(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call$AsyncCall;)V

    goto :goto_2b

    .line 169
    :cond_64
    :try_start_64
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    iget-object v4, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v4, v4, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRequest()Lcom/squareup/okhttp/Request;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Lcom/squareup/okhttp/Callback;->onFailure(Lcom/squareup/okhttp/Request;Ljava/io/IOException;)V
    :try_end_71
    .catchall {:try_start_64 .. :try_end_71} :catchall_72

    goto :goto_56

    .line 172
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_72
    move-exception v3

    iget-object v4, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    # getter for: Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;
    invoke-static {v4}, Lcom/squareup/okhttp/Call;->access$300(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call$AsyncCall;)V

    throw v3
.end method

.method get()Lcom/squareup/okhttp/Call;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    return-object v0
.end method

.method host()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v0, v0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method request()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v0, v0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method tag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v0, v0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->tag()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
