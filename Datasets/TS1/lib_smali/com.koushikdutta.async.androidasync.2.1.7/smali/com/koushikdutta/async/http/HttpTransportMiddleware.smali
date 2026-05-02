.class public Lcom/koushikdutta/async/http/HttpTransportMiddleware;
.super Lcom/koushikdutta/async/http/SimpleMiddleware;
.source "HttpTransportMiddleware.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/koushikdutta/async/http/SimpleMiddleware;-><init>()V

    return-void
.end method


# virtual methods
.method public exchangeHeaders(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)Z
    .registers 16
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    .prologue
    .line 23
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->protocol:Ljava/lang/String;

    invoke-static {v11}, Lcom/koushikdutta/async/http/Protocol;->get(Ljava/lang/String;)Lcom/koushikdutta/async/http/Protocol;

    move-result-object v4

    .line 24
    .local v4, "p":Lcom/koushikdutta/async/http/Protocol;
    if-eqz v4, :cond_15

    sget-object v11, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_0:Lcom/koushikdutta/async/http/Protocol;

    if-eq v4, v11, :cond_15

    sget-object v11, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    if-eq v4, v11, :cond_15

    .line 25
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/SimpleMiddleware;->exchangeHeaders(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)Z

    move-result v11

    .line 132
    :goto_14
    return v11

    .line 27
    :cond_15
    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 28
    .local v5, "request":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v11}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v6

    .line 30
    .local v6, "requestBody":Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    if-eqz v6, :cond_3d

    .line 31
    invoke-interface {v6}, Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;->length()I

    move-result v11

    if-ltz v11, :cond_b5

    .line 32
    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v11

    const-string v12, "Content-Length"

    invoke-interface {v6}, Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;->length()I

    move-result v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 33
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    iget-object v12, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v11, v12}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink(Lcom/koushikdutta/async/DataSink;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 46
    :cond_3d
    :goto_3d
    if-eqz v6, :cond_e9

    invoke-interface {v6}, Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;->length()I

    move-result v11

    if-ltz v11, :cond_e9

    invoke-interface {v6}, Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;->length()I

    move-result v11

    const/16 v12, 0x400

    if-ge v11, v12, :cond_e9

    const/4 v10, 0x1

    .line 49
    .local v10, "waitForBody":Z
    :goto_4e
    if-eqz v10, :cond_ec

    .line 51
    new-instance v0, Lcom/koushikdutta/async/BufferedDataSink;

    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v11}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink()Lcom/koushikdutta/async/DataSink;

    move-result-object v11

    invoke-direct {v0, v11}, Lcom/koushikdutta/async/BufferedDataSink;-><init>(Lcom/koushikdutta/async/DataSink;)V

    .line 52
    .local v0, "bsink":Lcom/koushikdutta/async/BufferedDataSink;
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Lcom/koushikdutta/async/BufferedDataSink;->forceBuffering(Z)V

    .line 53
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v11, v0}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink(Lcom/koushikdutta/async/DataSink;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 54
    move-object v2, v0

    .line 61
    .local v2, "headerSink":Lcom/koushikdutta/async/DataSink;
    :goto_65
    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getRequestLine()Lcom/koushikdutta/async/http/RequestLine;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 62
    .local v7, "rl":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v11

    invoke-virtual {v11, v7}, Lcom/koushikdutta/async/http/Headers;->toPrefixString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 63
    .local v8, "rs":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 65
    if-eqz v0, :cond_92

    .line 66
    const/16 v11, 0x400

    invoke-virtual {v0, v11}, Lcom/koushikdutta/async/BufferedDataSink;->setMaxBuffer(I)V

    .line 68
    :cond_92
    iget-object v9, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->sendHeadersCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    .line 69
    .local v9, "sentCallback":Lcom/koushikdutta/async/callback/CompletedCallback;
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v11

    new-instance v12, Lcom/koushikdutta/async/http/HttpTransportMiddleware$1;

    invoke-direct {v12, p0, v9, v0}, Lcom/koushikdutta/async/http/HttpTransportMiddleware$1;-><init>(Lcom/koushikdutta/async/http/HttpTransportMiddleware;Lcom/koushikdutta/async/callback/CompletedCallback;Lcom/koushikdutta/async/BufferedDataSink;)V

    invoke-static {v2, v11, v12}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 81
    new-instance v1, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;

    invoke-direct {v1, p0, p1}, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;-><init>(Lcom/koushikdutta/async/http/HttpTransportMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)V

    .line 129
    .local v1, "headerCallback":Lcom/koushikdutta/async/LineEmitter$StringCallback;
    new-instance v3, Lcom/koushikdutta/async/LineEmitter;

    invoke-direct {v3}, Lcom/koushikdutta/async/LineEmitter;-><init>()V

    .line 130
    .local v3, "liner":Lcom/koushikdutta/async/LineEmitter;
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v11, v3}, Lcom/koushikdutta/async/AsyncSocket;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 131
    invoke-virtual {v3, v1}, Lcom/koushikdutta/async/LineEmitter;->setLineCallback(Lcom/koushikdutta/async/LineEmitter$StringCallback;)V

    .line 132
    const/4 v11, 0x1

    goto/16 :goto_14

    .line 35
    .end local v0    # "bsink":Lcom/koushikdutta/async/BufferedDataSink;
    .end local v1    # "headerCallback":Lcom/koushikdutta/async/LineEmitter$StringCallback;
    .end local v2    # "headerSink":Lcom/koushikdutta/async/DataSink;
    .end local v3    # "liner":Lcom/koushikdutta/async/LineEmitter;
    .end local v7    # "rl":Ljava/lang/String;
    .end local v8    # "rs":Ljava/lang/String;
    .end local v9    # "sentCallback":Lcom/koushikdutta/async/callback/CompletedCallback;
    .end local v10    # "waitForBody":Z
    :cond_b5
    const-string v11, "close"

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v12

    const-string v13, "Connection"

    invoke-virtual {v12, v13}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d0

    .line 36
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    iget-object v12, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v11, v12}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink(Lcom/koushikdutta/async/DataSink;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    goto/16 :goto_3d

    .line 39
    :cond_d0
    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v11

    const-string v12, "Transfer-Encoding"

    const-string v13, "Chunked"

    invoke-virtual {v11, v12, v13}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 40
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    new-instance v12, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;

    iget-object v13, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-direct {v12, v13}, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;-><init>(Lcom/koushikdutta/async/DataSink;)V

    invoke-interface {v11, v12}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink(Lcom/koushikdutta/async/DataSink;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    goto/16 :goto_3d

    .line 46
    :cond_e9
    const/4 v10, 0x0

    goto/16 :goto_4e

    .line 57
    .restart local v10    # "waitForBody":Z
    :cond_ec
    const/4 v0, 0x0

    .line 58
    .restart local v0    # "bsink":Lcom/koushikdutta/async/BufferedDataSink;
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    .restart local v2    # "headerSink":Lcom/koushikdutta/async/DataSink;
    goto/16 :goto_65
.end method

.method public onRequestSent(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;)V
    .registers 4
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;

    .prologue
    .line 137
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;->protocol:Ljava/lang/String;

    invoke-static {v1}, Lcom/koushikdutta/async/http/Protocol;->get(Ljava/lang/String;)Lcom/koushikdutta/async/http/Protocol;

    move-result-object v0

    .line 138
    .local v0, "p":Lcom/koushikdutta/async/http/Protocol;
    if-eqz v0, :cond_11

    sget-object v1, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_0:Lcom/koushikdutta/async/http/Protocol;

    if-eq v0, v1, :cond_11

    sget-object v1, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    if-eq v0, v1, :cond_11

    .line 143
    :cond_10
    :goto_10
    return-void

    .line 141
    :cond_11
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v1}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink()Lcom/koushikdutta/async/DataSink;

    move-result-object v1

    instance-of v1, v1, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;

    if-eqz v1, :cond_10

    .line 142
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v1}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink()Lcom/koushikdutta/async/DataSink;

    move-result-object v1

    invoke-interface {v1}, Lcom/koushikdutta/async/DataSink;->end()V

    goto :goto_10
.end method
