.class Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;
.super Ljava/lang/Object;
.source "SpdyMiddleware.java"

# interfaces
.implements Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->createHandshakeCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

.field final synthetic val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

.field final synthetic val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;)V
    .registers 5
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iput-object p2, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iput-object p3, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHandshakeCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    .registers 17
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "socket"    # Lcom/koushikdutta/async/AsyncSSLSocket;

    .prologue
    .line 192
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$data:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    iget-object v9, v9, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    const-string v10, "checking spdy handshake"

    invoke-virtual {v9, v10}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 193
    if-nez p1, :cond_11

    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v9, v9, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetAlpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    if-nez v9, :cond_24

    .line 194
    :cond_11
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v10, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    iget-object v11, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    move-object/from16 v0, p2

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->invokeConnect(Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    invoke-static {v9, v10, v11, p1, v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$200(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V

    .line 195
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v10, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->noSpdy(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$300(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;)V

    .line 244
    :goto_23
    return-void

    .line 200
    :cond_24
    :try_start_24
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v9, v9, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslNativePointer:Ljava/lang/reflect/Field;

    invoke-interface/range {p2 .. p2}, Lcom/koushikdutta/async/AsyncSSLSocket;->getSSLEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .line 201
    .local v7, "ptr":J
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v9, v9, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetAlpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    const/4 v10, 0x0

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v9, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    move-object v0, v9

    check-cast v0, [B

    move-object v5, v0

    .line 202
    .local v5, "proto":[B
    if-nez v5, :cond_6c

    .line 203
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v10, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    iget-object v11, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    const/4 v12, 0x0

    move-object/from16 v0, p2

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->invokeConnect(Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    invoke-static {v9, v10, v11, v12, v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$200(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V

    .line 204
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v10, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->noSpdy(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$300(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;)V
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_64} :catch_65

    goto :goto_23

    .line 215
    .end local v5    # "proto":[B
    .end local v7    # "ptr":J
    :catch_65
    move-exception v3

    .line 216
    .local v3, "ex":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/AssertionError;

    invoke-direct {v9, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v9

    .line 207
    .end local v3    # "ex":Ljava/lang/Exception;
    .restart local v5    # "proto":[B
    .restart local v7    # "ptr":J
    :cond_6c
    :try_start_6c
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v5}, Ljava/lang/String;-><init>([B)V

    .line 208
    .local v6, "protoString":Ljava/lang/String;
    invoke-static {v6}, Lcom/koushikdutta/async/http/Protocol;->get(Ljava/lang/String;)Lcom/koushikdutta/async/http/Protocol;

    move-result-object v4

    .line 209
    .local v4, "p":Lcom/koushikdutta/async/http/Protocol;
    if-eqz v4, :cond_7d

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/Protocol;->needsSpdyConnection()Z

    move-result v9

    if-nez v9, :cond_91

    .line 210
    :cond_7d
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v10, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    iget-object v11, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$callback:Lcom/koushikdutta/async/callback/ConnectCallback;

    const/4 v12, 0x0

    move-object/from16 v0, p2

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->invokeConnect(Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    invoke-static {v9, v10, v11, v12, v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$200(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V

    .line 211
    iget-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->this$0:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;

    iget-object v10, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;->val$key:Ljava/lang/String;

    # invokes: Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->noSpdy(Ljava/lang/String;)V
    invoke-static {v9, v10}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->access$300(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;)V
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_90} :catch_65

    goto :goto_23

    .line 219
    :cond_91
    new-instance v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;

    invoke-static {v6}, Lcom/koushikdutta/async/http/Protocol;->get(Ljava/lang/String;)Lcom/koushikdutta/async/http/Protocol;

    move-result-object v9

    move-object/from16 v0, p2

    invoke-direct {v1, p0, v0, v9}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2$1;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/Protocol;)V

    .line 240
    .local v1, "connection":Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;
    :try_start_9c
    invoke-virtual {v1}, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->sendConnectionPreface()V
    :try_end_9f
    .catch Ljava/io/IOException; {:try_start_9c .. :try_end_9f} :catch_a0

    goto :goto_23

    .line 241
    :catch_a0
    move-exception v2

    .line 242
    .local v2, "e1":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_23
.end method
