.class Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;
.super Ljava/lang/Object;
.source "HttpTransportMiddleware.java"

# interfaces
.implements Lcom/koushikdutta/async/LineEmitter$StringCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/HttpTransportMiddleware;->exchangeHeaders(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mRawHeaders:Lcom/koushikdutta/async/http/Headers;

.field statusLine:Ljava/lang/String;

.field final synthetic this$0:Lcom/koushikdutta/async/http/HttpTransportMiddleware;

.field final synthetic val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/HttpTransportMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/HttpTransportMiddleware;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->this$0:Lcom/koushikdutta/async/http/HttpTransportMiddleware;

    iput-object p2, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    return-void
.end method


# virtual methods
.method public onStringAvailable(Ljava/lang/String;)V
    .registers 12
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    .line 88
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 89
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->statusLine:Ljava/lang/String;

    if-nez v5, :cond_d

    .line 90
    iput-object p1, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->statusLine:Ljava/lang/String;

    .line 126
    :cond_c
    :goto_c
    return-void

    .line 92
    :cond_d
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_22

    .line 93
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    invoke-virtual {v5, p1}, Lcom/koushikdutta/async/http/Headers;->addLine(Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_18} :catch_19

    goto :goto_c

    .line 123
    :catch_19
    move-exception v1

    .line 124
    .local v1, "ex":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->receiveHeadersCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-interface {v5, v1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_c

    .line 96
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_22
    :try_start_22
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->statusLine:Ljava/lang/String;

    const-string v6, " "

    const/4 v7, 0x3

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, "parts":[Ljava/lang/String;
    array-length v5, v2

    if-ge v5, v8, :cond_3b

    .line 98
    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/io/IOException;

    const-string v7, "Not HTTP"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 100
    :cond_3b
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    iget-object v6, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    invoke-interface {v5, v6}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 101
    const/4 v5, 0x0

    aget-object v3, v2, v5

    .line 102
    .local v3, "protocol":Ljava/lang/String;
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v5, v3}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->protocol(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 103
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    const/4 v6, 0x1

    aget-object v6, v2, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v5, v6}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->code(I)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 104
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v6, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    array-length v5, v2

    if-ne v5, v9, :cond_9d

    const/4 v5, 0x2

    aget-object v5, v2, v5

    :goto_66
    invoke-interface {v6, v5}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->message(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 105
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->receiveHeadersCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    .line 108
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v5}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->socket()Lcom/koushikdutta/async/AsyncSocket;

    move-result-object v4

    .line 109
    .local v4, "socket":Lcom/koushikdutta/async/AsyncSocket;
    if-eqz v4, :cond_c

    .line 114
    const-string v5, "HEAD"

    iget-object v6, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v6, v6, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getMethod()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a0

    .line 115
    invoke-interface {v4}, Lcom/koushikdutta/async/AsyncSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;->create(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/Exception;)Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;

    move-result-object v0

    .line 120
    .local v0, "emitter":Lcom/koushikdutta/async/DataEmitter;
    :goto_94
    iget-object v5, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v5, v5, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v5, v0}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->emitter(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    goto/16 :goto_c

    .line 104
    .end local v0    # "emitter":Lcom/koushikdutta/async/DataEmitter;
    .end local v4    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    :cond_9d
    const-string v5, ""

    goto :goto_66

    .line 118
    .restart local v4    # "socket":Lcom/koushikdutta/async/AsyncSocket;
    :cond_a0
    invoke-static {v3}, Lcom/koushikdutta/async/http/Protocol;->get(Ljava/lang/String;)Lcom/koushikdutta/async/http/Protocol;

    move-result-object v5

    iget-object v6, p0, Lcom/koushikdutta/async/http/HttpTransportMiddleware$2;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const/4 v7, 0x0

    invoke-static {v4, v5, v6, v7}, Lcom/koushikdutta/async/http/HttpUtil;->getBodyDecoder(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/http/Protocol;Lcom/koushikdutta/async/http/Headers;Z)Lcom/koushikdutta/async/DataEmitter;
    :try_end_aa
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_aa} :catch_19

    move-result-object v0

    .restart local v0    # "emitter":Lcom/koushikdutta/async/DataEmitter;
    goto :goto_94
.end method
