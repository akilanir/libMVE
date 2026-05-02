.class Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "SpdyMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->exchangeHeaders(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<",
        "Lcom/koushikdutta/async/http/Headers;",
        "Ljava/util/List",
        "<",
        "Lcom/koushikdutta/async/http/spdy/Header;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

.field final synthetic val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    .prologue
    .line 404
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iput-object p2, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 404
    check-cast p1, Ljava/util/List;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->transform(Ljava/util/List;)V

    return-void
.end method

.method protected transform(Ljava/util/List;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/koushikdutta/async/http/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/async/http/spdy/Header;>;"
    const/4 v9, 0x2

    .line 407
    new-instance v1, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v1}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    .line 408
    .local v1, "headers":Lcom/koushikdutta/async/http/Headers;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_26

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/spdy/Header;

    .line 409
    .local v0, "header":Lcom/koushikdutta/async/http/spdy/Header;
    iget-object v7, v0, Lcom/koushikdutta/async/http/spdy/Header;->name:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/spdy/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    .line 410
    .local v3, "key":Ljava/lang/String;
    iget-object v7, v0, Lcom/koushikdutta/async/http/spdy/Header;->value:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/spdy/ByteString;->utf8()Ljava/lang/String;

    move-result-object v6

    .line 411
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v1, v3, v6}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_a

    .line 413
    .end local v0    # "header":Lcom/koushikdutta/async/http/spdy/Header;
    .end local v3    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_26
    sget-object v7, Lcom/koushikdutta/async/http/spdy/Header;->RESPONSE_STATUS:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/spdy/ByteString;->utf8()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/koushikdutta/async/http/Headers;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 414
    .local v4, "status":Ljava/lang/String;
    const-string v7, " "

    invoke-virtual {v4, v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    .line 415
    .local v5, "statusParts":[Ljava/lang/String;
    iget-object v7, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v7, v7, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    const/4 v8, 0x0

    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-interface {v7, v8}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->code(I)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 416
    array-length v7, v5

    if-ne v7, v9, :cond_51

    .line 417
    iget-object v7, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v7, v7, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-interface {v7, v8}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->message(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 418
    :cond_51
    iget-object v7, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v7, v7, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    sget-object v8, Lcom/koushikdutta/async/http/spdy/Header;->VERSION:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-virtual {v8}, Lcom/koushikdutta/async/http/spdy/ByteString;->utf8()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Lcom/koushikdutta/async/http/Headers;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->protocol(Ljava/lang/String;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 419
    iget-object v7, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    iget-object v7, v7, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v7, v1}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->headers(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 420
    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->setComplete(Ljava/lang/Object;)Z

    .line 421
    return-void
.end method
