.class final Lokhttp3/RealCall$AsyncCall;
.super Lokhttp3/internal/NamedRunnable;
.source "RealCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/RealCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "AsyncCall"
.end annotation


# instance fields
.field private final forWebSocket:Z

.field private final responseCallback:Lokhttp3/Callback;

.field final synthetic this$0:Lokhttp3/RealCall;


# direct methods
.method private constructor <init>(Lokhttp3/RealCall;Lokhttp3/Callback;Z)V
    .registers 8
    .param p1, "this$0"    # Lokhttp3/RealCall;
    .param p2, "responseCallback"    # Lokhttp3/Callback;
    .param p3, "forWebSocket"    # Z

    .prologue
    .line 98
    iput-object p1, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    .line 99
    const-string v0, "OkHttp %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p1, Lokhttp3/RealCall;->originalRequest:Lokhttp3/Request;

    invoke-virtual {v3}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-direct {p0, v0, v1}, Lokhttp3/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 100
    iput-object p2, p0, Lokhttp3/RealCall$AsyncCall;->responseCallback:Lokhttp3/Callback;

    .line 101
    iput-boolean p3, p0, Lokhttp3/RealCall$AsyncCall;->forWebSocket:Z

    .line 102
    return-void
.end method

.method synthetic constructor <init>(Lokhttp3/RealCall;Lokhttp3/Callback;ZLokhttp3/RealCall$1;)V
    .registers 5
    .param p1, "x0"    # Lokhttp3/RealCall;
    .param p2, "x1"    # Lokhttp3/Callback;
    .param p3, "x2"    # Z
    .param p4, "x3"    # Lokhttp3/RealCall$1;

    .prologue
    .line 94
    invoke-direct {p0, p1, p2, p3}, Lokhttp3/RealCall$AsyncCall;-><init>(Lokhttp3/RealCall;Lokhttp3/Callback;Z)V

    return-void
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    invoke-virtual {v0}, Lokhttp3/RealCall;->cancel()V

    .line 118
    return-void
.end method

.method protected execute()V
    .registers 8

    .prologue
    .line 125
    const/4 v2, 0x0

    .line 127
    .local v2, "signalledCallback":Z
    :try_start_1
    iget-object v3, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    iget-boolean v4, p0, Lokhttp3/RealCall$AsyncCall;->forWebSocket:Z

    # invokes: Lokhttp3/RealCall;->getResponseWithInterceptorChain(Z)Lokhttp3/Response;
    invoke-static {v3, v4}, Lokhttp3/RealCall;->access$100(Lokhttp3/RealCall;Z)Lokhttp3/Response;

    move-result-object v1

    .line 128
    .local v1, "response":Lokhttp3/Response;
    iget-object v3, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    iget-boolean v3, v3, Lokhttp3/RealCall;->canceled:Z

    if-eqz v3, :cond_2c

    .line 129
    const/4 v2, 0x1

    .line 130
    iget-object v3, p0, Lokhttp3/RealCall$AsyncCall;->responseCallback:Lokhttp3/Callback;

    iget-object v4, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    new-instance v5, Ljava/io/IOException;

    const-string v6, "Canceled"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4, v5}, Lokhttp3/Callback;->onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1e} :catch_35
    .catchall {:try_start_1 .. :try_end_1e} :catchall_6e

    .line 143
    :goto_1e
    iget-object v3, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    # getter for: Lokhttp3/RealCall;->client:Lokhttp3/OkHttpClient;
    invoke-static {v3}, Lokhttp3/RealCall;->access$300(Lokhttp3/RealCall;)Lokhttp3/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/OkHttpClient;->dispatcher()Lokhttp3/Dispatcher;

    move-result-object v3

    invoke-virtual {v3, p0}, Lokhttp3/Dispatcher;->finished(Lokhttp3/RealCall$AsyncCall;)V

    .line 145
    .end local v1    # "response":Lokhttp3/Response;
    :goto_2b
    return-void

    .line 132
    .restart local v1    # "response":Lokhttp3/Response;
    :cond_2c
    const/4 v2, 0x1

    .line 133
    :try_start_2d
    iget-object v3, p0, Lokhttp3/RealCall$AsyncCall;->responseCallback:Lokhttp3/Callback;

    iget-object v4, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    invoke-interface {v3, v4, v1}, Lokhttp3/Callback;->onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_34} :catch_35
    .catchall {:try_start_2d .. :try_end_34} :catchall_6e

    goto :goto_1e

    .line 135
    .end local v1    # "response":Lokhttp3/Response;
    :catch_35
    move-exception v0

    .line 136
    .local v0, "e":Ljava/io/IOException;
    if-eqz v2, :cond_66

    .line 138
    :try_start_38
    sget-object v3, Lokhttp3/internal/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Callback failure for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    # invokes: Lokhttp3/RealCall;->toLoggableString()Ljava/lang/String;
    invoke-static {v6}, Lokhttp3/RealCall;->access$200(Lokhttp3/RealCall;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_58
    .catchall {:try_start_38 .. :try_end_58} :catchall_6e

    .line 143
    :goto_58
    iget-object v3, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    # getter for: Lokhttp3/RealCall;->client:Lokhttp3/OkHttpClient;
    invoke-static {v3}, Lokhttp3/RealCall;->access$300(Lokhttp3/RealCall;)Lokhttp3/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/OkHttpClient;->dispatcher()Lokhttp3/Dispatcher;

    move-result-object v3

    invoke-virtual {v3, p0}, Lokhttp3/Dispatcher;->finished(Lokhttp3/RealCall$AsyncCall;)V

    goto :goto_2b

    .line 140
    :cond_66
    :try_start_66
    iget-object v3, p0, Lokhttp3/RealCall$AsyncCall;->responseCallback:Lokhttp3/Callback;

    iget-object v4, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    invoke-interface {v3, v4, v0}, Lokhttp3/Callback;->onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    :try_end_6d
    .catchall {:try_start_66 .. :try_end_6d} :catchall_6e

    goto :goto_58

    .line 143
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_6e
    move-exception v3

    iget-object v4, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    # getter for: Lokhttp3/RealCall;->client:Lokhttp3/OkHttpClient;
    invoke-static {v4}, Lokhttp3/RealCall;->access$300(Lokhttp3/RealCall;)Lokhttp3/OkHttpClient;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/OkHttpClient;->dispatcher()Lokhttp3/Dispatcher;

    move-result-object v4

    invoke-virtual {v4, p0}, Lokhttp3/Dispatcher;->finished(Lokhttp3/RealCall$AsyncCall;)V

    throw v3
.end method

.method get()Lokhttp3/RealCall;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    return-object v0
.end method

.method host()Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    iget-object v0, v0, Lokhttp3/RealCall;->originalRequest:Lokhttp3/Request;

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method request()Lokhttp3/Request;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    iget-object v0, v0, Lokhttp3/RealCall;->originalRequest:Lokhttp3/Request;

    return-object v0
.end method

.method tag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lokhttp3/RealCall$AsyncCall;->this$0:Lokhttp3/RealCall;

    iget-object v0, v0, Lokhttp3/RealCall;->originalRequest:Lokhttp3/Request;

    invoke-virtual {v0}, Lokhttp3/Request;->tag()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
