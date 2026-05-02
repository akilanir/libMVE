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
    .line 829
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 830
    iput p2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    .line 831
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->request:Lcom/squareup/okhttp/Request;

    .line 832
    return-void
.end method


# virtual methods
.method public connection()Lcom/squareup/okhttp/Connection;
    .registers 2

    .prologue
    .line 835
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$000(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Connection;

    move-result-object v0

    return-object v0
.end method

.method public proceed(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;
    .registers 15
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 843
    iget v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    .line 845
    iget v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    if-lez v9, :cond_8b

    .line 846
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v9, v9, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v9}, Lcom/squareup/okhttp/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v9

    iget v10, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    add-int/lit8 v10, v10, -0x1

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/okhttp/Interceptor;

    .line 847
    .local v2, "caller":Lcom/squareup/okhttp/Interceptor;
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->connection()Lcom/squareup/okhttp/Connection;

    move-result-object v9

    invoke-virtual {v9}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v9

    invoke-virtual {v9}, Lcom/squareup/okhttp/Route;->getAddress()Lcom/squareup/okhttp/Address;

    move-result-object v0

    .line 850
    .local v0, "address":Lcom/squareup/okhttp/Address;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v9

    invoke-virtual {v9}, Lcom/squareup/okhttp/HttpUrl;->host()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_49

    .line 851
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v9

    invoke-virtual {v9}, Lcom/squareup/okhttp/HttpUrl;->port()I

    move-result v9

    invoke-virtual {v0}, Lcom/squareup/okhttp/Address;->getUriPort()I

    move-result v10

    if-eq v9, v10, :cond_68

    .line 852
    :cond_49
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "network interceptor "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " must retain the same host and port"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 857
    :cond_68
    iget v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    if-le v9, v11, :cond_8b

    .line 858
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "network interceptor "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " must call proceed() exactly once"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 863
    .end local v0    # "address":Lcom/squareup/okhttp/Address;
    .end local v2    # "caller":Lcom/squareup/okhttp/Interceptor;
    :cond_8b
    iget v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    iget-object v10, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v10, v10, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v10}, Lcom/squareup/okhttp/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_fe

    .line 865
    new-instance v3, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;

    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget v10, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    add-int/lit8 v10, v10, 0x1

    invoke-direct {v3, v9, v10, p1}, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;-><init>(Lcom/squareup/okhttp/internal/http/HttpEngine;ILcom/squareup/okhttp/Request;)V

    .line 866
    .local v3, "chain":Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v9, v9, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v9}, Lcom/squareup/okhttp/OkHttpClient;->networkInterceptors()Ljava/util/List;

    move-result-object v9

    iget v10, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->index:I

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/squareup/okhttp/Interceptor;

    .line 867
    .local v6, "interceptor":Lcom/squareup/okhttp/Interceptor;
    invoke-interface {v6, v3}, Lcom/squareup/okhttp/Interceptor;->intercept(Lcom/squareup/okhttp/Interceptor$Chain;)Lcom/squareup/okhttp/Response;

    move-result-object v5

    .line 870
    .local v5, "interceptedResponse":Lcom/squareup/okhttp/Response;
    iget v9, v3, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->calls:I

    if-eq v9, v11, :cond_dd

    .line 871
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "network interceptor "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " must call proceed() exactly once"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 874
    :cond_dd
    if-nez v5, :cond_186

    .line 875
    new-instance v9, Ljava/lang/NullPointerException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "network interceptor "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " returned null"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 882
    .end local v3    # "chain":Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;
    .end local v5    # "interceptedResponse":Lcom/squareup/okhttp/Response;
    .end local v6    # "interceptor":Lcom/squareup/okhttp/Interceptor;
    :cond_fe
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;
    invoke-static {v9}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$100(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v9

    invoke-interface {v9, p1}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 885
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # setter for: Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;
    invoke-static {v9, p1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$202(Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Request;

    .line 887
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v9, p1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->permitsRequestBody(Lcom/squareup/okhttp/Request;)Z

    move-result v9

    if-eqz v9, :cond_13a

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v9

    if-eqz v9, :cond_13a

    .line 888
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;
    invoke-static {v9}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$100(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v9

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v10

    invoke-virtual {v10}, Lcom/squareup/okhttp/RequestBody;->contentLength()J

    move-result-wide v10

    invoke-interface {v9, p1, v10, v11}, Lcom/squareup/okhttp/internal/http/Transport;->createRequestBody(Lcom/squareup/okhttp/Request;J)Lokio/Sink;

    move-result-object v7

    .line 889
    .local v7, "requestBodyOut":Lokio/Sink;
    invoke-static {v7}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v1

    .line 890
    .local v1, "bufferedRequestBody":Lokio/BufferedSink;
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v9

    invoke-virtual {v9, v1}, Lcom/squareup/okhttp/RequestBody;->writeTo(Lokio/BufferedSink;)V

    .line 891
    invoke-interface {v1}, Lokio/BufferedSink;->close()V

    .line 894
    .end local v1    # "bufferedRequestBody":Lokio/BufferedSink;
    .end local v7    # "requestBodyOut":Lokio/Sink;
    :cond_13a
    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->this$0:Lcom/squareup/okhttp/internal/http/HttpEngine;

    # invokes: Lcom/squareup/okhttp/internal/http/HttpEngine;->readNetworkResponse()Lcom/squareup/okhttp/Response;
    invoke-static {v9}, Lcom/squareup/okhttp/internal/http/HttpEngine;->access$300(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Response;

    move-result-object v8

    .line 896
    .local v8, "response":Lcom/squareup/okhttp/Response;
    invoke-virtual {v8}, Lcom/squareup/okhttp/Response;->code()I

    move-result v4

    .line 897
    .local v4, "code":I
    const/16 v9, 0xcc

    if-eq v4, v9, :cond_14c

    const/16 v9, 0xcd

    if-ne v4, v9, :cond_185

    :cond_14c
    invoke-virtual {v8}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v9

    invoke-virtual {v9}, Lcom/squareup/okhttp/ResponseBody;->contentLength()J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-lez v9, :cond_185

    .line 898
    new-instance v9, Ljava/net/ProtocolException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "HTTP "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " had non-zero Content-Length: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 899
    invoke-virtual {v8}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v11

    invoke-virtual {v11}, Lcom/squareup/okhttp/ResponseBody;->contentLength()J

    move-result-wide v11

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v9

    :cond_185
    move-object v5, v8

    .line 902
    .end local v4    # "code":I
    .end local v8    # "response":Lcom/squareup/okhttp/Response;
    :cond_186
    return-object v5
.end method

.method public request()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 839
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine$NetworkInterceptorChain;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method
