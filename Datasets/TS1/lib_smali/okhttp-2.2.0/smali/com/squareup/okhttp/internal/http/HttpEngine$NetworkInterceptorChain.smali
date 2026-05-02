.class Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;
.super Ljava/lang/Object;
.source "HttpEngine.java"

# interfaces
.implements Lcom/squareup/okhttp/Interceptor$Chain;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/HttpEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NetworkInterceptorChain"
.end annotation


# instance fields
.field private calls:I

.field private final index:I

.field private final request:Lcom/squareup/okhttp/Request;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/http/HttpEngine;ILcom/squareup/okhttp/Request;)V
    .registers 4
    .param p1, "this$0"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .param p2, "index"    # I
    .param p3, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 726
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 727
    iput p2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    .line 728
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->request:Lcom/squareup/okhttp/Request;

    .line 729
    return-void
.end method


# virtual methods
.method public connection()Lcom/squareup/okhttp/Connection;
    .registers 2

    .prologue
    .line 732
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$000(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Connection;

    move-result-object v0

    return-object v0
.end method

.method public proceed(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;
    .registers 12
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 740
    iget v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    .line 742
    iget v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    if-lez v7, :cond_8b

    .line 743
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v7

    iget v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    add-int/lit8 v8, v8, -0x1

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/okhttp/Interceptor;

    .line 744
    .local v2, "caller":Lcom/squareup/okhttp/Interceptor;
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->connection()Lcom/squareup/okhttp/Connection;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Route;->getAddress()Lcom/squareup/okhttp/Address;

    move-result-object v0

    .line 747
    .local v0, "address":Lcom/squareup/okhttp/Address;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_49

    .line 748
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v7

    invoke-static {v7}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v7

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getUriPort()I

    move-result v8

    if-eq v7, v8, :cond_68

    .line 749
    :cond_49
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "network interceptor "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " must retain the same host and port"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 754
    :cond_68
    iget v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    if-le v7, v9, :cond_8b

    .line 755
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "network interceptor "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " must call proceed() exactly once"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 760
    .end local v0    # "address":Lcom/squareup/okhttp/Address;
    .end local v2    # "caller":Lcom/squareup/okhttp/Interceptor;
    :cond_8b
    iget v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v8, v8, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v8}, Lcom/squareup/okhttp/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_dd

    .line 762
    new-instance v3, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    add-int/lit8 v8, v8, 0x1

    invoke-direct {v3, v7, v8, p1}, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;ILcom/squareup/okhttp/Request;)V

    .line 763
    .local v3, "chain":Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v7

    iget v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/squareup/okhttp/Interceptor;

    .line 764
    .local v5, "interceptor":Lcom/squareup/okhttp/Interceptor;
    invoke-interface {v5, v3}, Lcom/squareup/okhttp/Interceptor;->intercept(Lcom/squareup/okhttp/Interceptor$Chain;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    .line 767
    .local v4, "interceptedResponse":Lcom/squareup/okhttp/Response;
    iget v7, v3, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    if-eq v7, v9, :cond_11a

    .line 768
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "network interceptor "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " must call proceed() exactly once"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 775
    .end local v3    # "chain":Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;
    .end local v4    # "interceptedResponse":Lcom/squareup/okhttp/Response;
    .end local v5    # "interceptor":Lcom/squareup/okhttp/Interceptor;
    :cond_dd
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$100(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v7

    invoke-interface {v7, p1}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 777
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->permitsRequestBody()Z

    move-result v7

    if-eqz v7, :cond_114

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v7

    if-eqz v7, :cond_114

    .line 778
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$100(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v7

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v8

    invoke-virtual {v8}, Lcom/squareup/okhttp/RequestBody;->contentLength()J

    move-result-wide v8

    invoke-interface {v7, p1, v8, v9}, Lcom/squareup/okhttp/internal/http/Transport;->createRequestBody(Lcom/squareup/okhttp/Request;J)Lokio/Sink;

    move-result-object v6

    .line 779
    .local v6, "requestBodyOut":Lokio/Sink;
    invoke-static {v6}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v1

    .line 780
    .local v1, "bufferedRequestBody":Lokio/BufferedSink;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v7

    invoke-virtual {v7, v1}, Lcom/squareup/okhttp/RequestBody;->writeTo(Lokio/BufferedSink;)V

    .line 781
    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    .line 784
    .end local v1    # "bufferedRequestBody":Lokio/BufferedSink;
    .end local v6    # "requestBodyOut":Lokio/Sink;
    :cond_114
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # invokes: Lcom/squareup/okhttp/internal/http/HttpEngine;->readNetworkResponse()Lcom/squareup/okhttp/Response;
    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$200(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    :cond_11a
    return-object v4
.end method

.method public request()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 736
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method
