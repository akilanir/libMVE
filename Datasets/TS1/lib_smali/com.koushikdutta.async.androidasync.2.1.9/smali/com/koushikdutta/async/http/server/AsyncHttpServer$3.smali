.class Lcom/koushikdutta/async/http/server/AsyncHttpServer$3;
.super Ljava/lang/Object;
.source "AsyncHttpServer.java"

# interfaces
.implements Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/server/AsyncHttpServer;->websocket(Ljava/lang/String;Ljava/lang/String;Lcom/koushikdutta/async/http/server/AsyncHttpServer$WebSocketRequestCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

.field final synthetic val$callback:Lcom/koushikdutta/async/http/server/AsyncHttpServer$WebSocketRequestCallback;

.field final synthetic val$protocol:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer;Ljava/lang/String;Lcom/koushikdutta/async/http/server/AsyncHttpServer$WebSocketRequestCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    .prologue
    .line 326
    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$3;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iput-object p2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$3;->val$protocol:Ljava/lang/String;

    iput-object p3, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$3;->val$callback:Lcom/koushikdutta/async/http/server/AsyncHttpServer$WebSocketRequestCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)V
    .registers 15
    .param p1, "request"    # Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;
    .param p2, "response"    # Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .prologue
    const/16 v11, 0x194

    .line 329
    const/4 v4, 0x0

    .line 330
    .local v4, "hasUpgrade":Z
    invoke-interface {p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v8

    const-string v9, "Connection"

    invoke-virtual {v8, v9}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 331
    .local v2, "connection":Ljava/lang/String;
    if-eqz v2, :cond_29

    .line 332
    const-string v8, ","

    invoke-virtual {v2, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 333
    .local v3, "connections":[Ljava/lang/String;
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_18
    if-ge v5, v6, :cond_29

    aget-object v1, v0, v5

    .line 334
    .local v1, "c":Ljava/lang/String;
    const-string v8, "Upgrade"

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_44

    .line 335
    const/4 v4, 0x1

    .line 340
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "c":Ljava/lang/String;
    .end local v3    # "connections":[Ljava/lang/String;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_29
    const-string v8, "websocket"

    invoke-interface {p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v9

    const-string v10, "Upgrade"

    invoke-virtual {v9, v10}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3d

    if-nez v4, :cond_47

    .line 341
    :cond_3d
    invoke-interface {p2, v11}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 342
    invoke-interface {p2}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->end()V

    .line 352
    :goto_43
    return-void

    .line 333
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "c":Ljava/lang/String;
    .restart local v3    # "connections":[Ljava/lang/String;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    :cond_44
    add-int/lit8 v5, v5, 0x1

    goto :goto_18

    .line 345
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "c":Ljava/lang/String;
    .end local v3    # "connections":[Ljava/lang/String;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_47
    invoke-interface {p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v8

    const-string v9, "Sec-WebSocket-Protocol"

    invoke-virtual {v8, v9}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 346
    .local v7, "peerProtocol":Ljava/lang/String;
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$3;->val$protocol:Ljava/lang/String;

    invoke-static {v8, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_60

    .line 347
    invoke-interface {p2, v11}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 348
    invoke-interface {p2}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;->end()V

    goto :goto_43

    .line 351
    :cond_60
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$3;->val$callback:Lcom/koushikdutta/async/http/server/AsyncHttpServer$WebSocketRequestCallback;

    new-instance v9, Lcom/koushikdutta/async/http/WebSocketImpl;

    invoke-direct {v9, p1, p2}, Lcom/koushikdutta/async/http/WebSocketImpl;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)V

    invoke-interface {v8, v9, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$WebSocketRequestCallback;->onConnected(Lcom/koushikdutta/async/http/WebSocket;Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;)V

    goto :goto_43
.end method
