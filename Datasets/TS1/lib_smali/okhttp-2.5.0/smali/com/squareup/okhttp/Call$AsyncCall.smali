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
.field private final forWebSocket:Z

.field private final responseCallback:Lcom/squareup/okhttp/Callback;

.field final synthetic this$0:Lcom/squareup/okhttp/Call;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;Z)V
    .registers 8
    .param p1, "this$0"    # Lcom/squareup/okhttp/Call;
    .param p2, "responseCallback"    # Lcom/squareup/okhttp/Callback;
    .param p3, "forWebSocket"    # Z

    .prologue
    .line 133
    iput-object p1, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    .line 134
    const-string v0, "OkHttp %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p1, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 135
    iput-object p2, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    .line 136
    iput-boolean p3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->forWebSocket:Z

    .line 137
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;ZLcom/squareup/okhttp/Call$1;)V
    .registers 5
    .param p1, "x0"    # Lcom/squareup/okhttp/Call;
    .param p2, "x1"    # Lcom/squareup/okhttp/Callback;
    .param p3, "x2"    # Z
    .param p4, "x3"    # Lcom/squareup/okhttp/Call$1;

    .prologue
    .line 129
    invoke-direct {p0, p1, p2, p3}, Lcom/squareup/okhttp/Call$AsyncCall;-><init>(Lcom/squareup/okhttp/Call;Lcom/squareup/okhttp/Callback;Z)V

    return-void
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Call;->cancel()V

    .line 153
    return-void
.end method

.method protected execute()V
    .registers 8

    .prologue
    .line 160
    const/4 v2, 0x0

    .line 162
    .local v2, "signalledCallback":Z
    :try_start_1
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-boolean v4, p0, Lcom/squareup/okhttp/Call$AsyncCall;->forWebSocket:Z

    # invokes: Lcom/squareup/okhttp/Call;->getResponseWithInterceptorChain(Z)Lcom/squareup/okhttp/Response;
    invoke-static {v3, v4}, Lcom/squareup/okhttp/Call;->access$100(Lcom/squareup/okhttp/Call;Z)Lcom/squareup/okhttp/Response;

    move-result-object v1

    .line 163
    .local v1, "response":Lcom/squareup/okhttp/Response;
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-boolean v3, v3, Lcom/squareup/okhttp/Call;->canceled:Z

    if-eqz v3, :cond_2e

    .line 164
    const/4 v2, 0x1

    .line 165
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    iget-object v4, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v4, v4, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    new-instance v5, Ljava/io/IOException;

    const-string v6, "Canceled"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4, v5}, Lcom/squareup/okhttp/Callback;->onFailure(Lcom/squareup/okhttp/Request;Ljava/io/IOException;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_20} :catch_35
    .catchall {:try_start_1 .. :try_end_20} :catchall_74

    .line 178
    :goto_20
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    # getter for: Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;
    invoke-static {v3}, Lcom/squareup/okhttp/Call;->access$300(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call$AsyncCall;)V

    .line 180
    .end local v1    # "response":Lcom/squareup/okhttp/Response;
    :goto_2d
    return-void

    .line 167
    .restart local v1    # "response":Lcom/squareup/okhttp/Response;
    :cond_2e
    const/4 v2, 0x1

    .line 168
    :try_start_2f
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    invoke-interface {v3, v1}, Lcom/squareup/okhttp/Callback;->onResponse(Lcom/squareup/okhttp/Response;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_34} :catch_35
    .catchall {:try_start_2f .. :try_end_34} :catchall_74

    goto :goto_20

    .line 170
    .end local v1    # "response":Lcom/squareup/okhttp/Response;
    :catch_35
    move-exception v0

    .line 171
    .local v0, "e":Ljava/io/IOException;
    if-eqz v2, :cond_66

    .line 173
    :try_start_38
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
    :try_end_58
    .catchall {:try_start_38 .. :try_end_58} :catchall_74

    .line 178
    :goto_58
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    # getter for: Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;
    invoke-static {v3}, Lcom/squareup/okhttp/Call;->access$300(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call$AsyncCall;)V

    goto :goto_2d

    .line 175
    :cond_66
    :try_start_66
    iget-object v3, p0, Lcom/squareup/okhttp/Call$AsyncCall;->responseCallback:Lcom/squareup/okhttp/Callback;

    iget-object v4, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v4, v4, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRequest()Lcom/squareup/okhttp/Request;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Lcom/squareup/okhttp/Callback;->onFailure(Lcom/squareup/okhttp/Request;Ljava/io/IOException;)V
    :try_end_73
    .catchall {:try_start_66 .. :try_end_73} :catchall_74

    goto :goto_58

    .line 178
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_74
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
    .line 156
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    return-object v0
.end method

.method host()Ljava/lang/String;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v0, v0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method request()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v0, v0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method tag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/squareup/okhttp/Call$AsyncCall;->this$0:Lcom/squareup/okhttp/Call;

    iget-object v0, v0, Lcom/squareup/okhttp/Call;->originalRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->tag()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
