.class Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;
.super Ljava/lang/Object;
.source "SocketIOConnection.java"

# interfaces
.implements Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport$StringCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->attach()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;)V
    .registers 2

    .prologue
    .line 380
    iput-object p1, p0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStringAvailable(Ljava/lang/String;)V
    .registers 20
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 385
    :try_start_0
    const-string v12, ":"

    const/4 v13, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v11

    .line 386
    .local v11, "parts":[Ljava/lang/String;
    const/4 v12, 0x0

    aget-object v12, v11, v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 387
    .local v5, "code":I
    packed-switch v5, :pswitch_data_112

    .line 440
    new-instance v12, Lcom/koushikdutta/async/http/socketio/SocketIOException;

    const-string v13, "unknown code"

    invoke-direct {v12, v13}, Lcom/koushikdutta/async/http/socketio/SocketIOException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1b

    .line 443
    .end local v5    # "code":I
    .end local v11    # "parts":[Ljava/lang/String;
    :catch_1b
    move-exception v9

    .line 444
    .local v9, "ex":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v12, v12, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    const/4 v13, 0x0

    invoke-interface {v12, v13}, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 445
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v12, v12, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    invoke-interface {v12}, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;->disconnect()V

    .line 446
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v13, 0x0

    iput-object v13, v12, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    .line 447
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportDisconnect(Ljava/lang/Exception;)V
    invoke-static {v12, v9}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$000(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/Exception;)V

    .line 449
    .end local v9    # "ex":Ljava/lang/Exception;
    :cond_3d
    :goto_3d
    :pswitch_3d
    return-void

    .line 390
    .restart local v5    # "code":I
    .restart local v11    # "parts":[Ljava/lang/String;
    :pswitch_3e
    :try_start_3e
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v12, v12, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    invoke-interface {v12}, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;->disconnect()V

    .line 391
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v13, 0x0

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportDisconnect(Ljava/lang/Exception;)V
    invoke-static {v12, v13}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$000(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/Exception;)V

    goto :goto_3d

    .line 395
    :pswitch_50
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v13, 0x2

    aget-object v13, v11, v13

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportConnect(Ljava/lang/String;)V
    invoke-static {v12, v13}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$300(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;)V

    goto :goto_3d

    .line 399
    :pswitch_5b
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v12, v12, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->transport:Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;

    const-string v13, "2::"

    invoke-interface {v12, v13}, Lcom/koushikdutta/async/http/socketio/transport/SocketIOTransport;->send(Ljava/lang/String;)V

    goto :goto_3d

    .line 403
    :pswitch_67
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v13, 0x2

    aget-object v13, v11, v13

    const/4 v14, 0x3

    aget-object v14, v11, v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/16 v16, 0x1

    aget-object v16, v11, v16

    const/16 v17, 0x2

    aget-object v17, v11, v17

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->acknowledge(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/socketio/Acknowledge;
    invoke-static/range {v15 .. v17}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$400(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/socketio/Acknowledge;

    move-result-object v15

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportString(Ljava/lang/String;Ljava/lang/String;Lcom/koushikdutta/async/http/socketio/Acknowledge;)V
    invoke-static {v12, v13, v14, v15}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$500(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;Ljava/lang/String;Lcom/koushikdutta/async/http/socketio/Acknowledge;)V

    goto :goto_3d

    .line 408
    :pswitch_85
    const/4 v12, 0x3

    aget-object v7, v11, v12

    .line 409
    .local v7, "dataString":Ljava/lang/String;
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 410
    .local v10, "jsonMessage":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v13, 0x2

    aget-object v13, v11, v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v15, 0x1

    aget-object v15, v11, v15

    const/16 v16, 0x2

    aget-object v16, v11, v16

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->acknowledge(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/socketio/Acknowledge;
    invoke-static/range {v14 .. v16}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$400(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/socketio/Acknowledge;

    move-result-object v14

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportJson(Ljava/lang/String;Lorg/json/JSONObject;Lcom/koushikdutta/async/http/socketio/Acknowledge;)V
    invoke-static {v12, v13, v10, v14}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$600(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;Lorg/json/JSONObject;Lcom/koushikdutta/async/http/socketio/Acknowledge;)V

    goto :goto_3d

    .line 414
    .end local v7    # "dataString":Ljava/lang/String;
    .end local v10    # "jsonMessage":Lorg/json/JSONObject;
    :pswitch_a7
    const/4 v12, 0x3

    aget-object v7, v11, v12

    .line 415
    .restart local v7    # "dataString":Ljava/lang/String;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 416
    .local v6, "data":Lorg/json/JSONObject;
    const-string v12, "name"

    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 417
    .local v8, "event":Ljava/lang/String;
    const-string v12, "args"

    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 418
    .local v3, "args":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v13, 0x2

    aget-object v13, v11, v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v15, 0x1

    aget-object v15, v11, v15

    const/16 v16, 0x2

    aget-object v16, v11, v16

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->acknowledge(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/socketio/Acknowledge;
    invoke-static/range {v14 .. v16}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$400(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/socketio/Acknowledge;

    move-result-object v14

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportEvent(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lcom/koushikdutta/async/http/socketio/Acknowledge;)V
    invoke-static {v12, v13, v8, v3, v14}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$700(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lcom/koushikdutta/async/http/socketio/Acknowledge;)V

    goto/16 :goto_3d

    .line 423
    .end local v3    # "args":Lorg/json/JSONArray;
    .end local v6    # "data":Lorg/json/JSONObject;
    .end local v7    # "dataString":Ljava/lang/String;
    .end local v8    # "event":Ljava/lang/String;
    :pswitch_d6
    const/4 v12, 0x3

    aget-object v12, v11, v12

    const-string v13, "\\+"

    const/4 v14, 0x2

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 424
    .local v2, "ackParts":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    iget-object v12, v12, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->acknowledges:Ljava/util/Hashtable;

    const/4 v13, 0x0

    aget-object v13, v2, v13

    invoke-virtual {v12, v13}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/socketio/Acknowledge;

    .line 425
    .local v1, "ack":Lcom/koushikdutta/async/http/socketio/Acknowledge;
    if-eqz v1, :cond_3d

    .line 427
    const/4 v4, 0x0

    .line 428
    .local v4, "arguments":Lorg/json/JSONArray;
    array-length v12, v2

    const/4 v13, 0x2

    if-ne v12, v13, :cond_fe

    .line 429
    new-instance v4, Lorg/json/JSONArray;

    .end local v4    # "arguments":Lorg/json/JSONArray;
    const/4 v12, 0x1

    aget-object v12, v2, v12

    invoke-direct {v4, v12}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 430
    .restart local v4    # "arguments":Lorg/json/JSONArray;
    :cond_fe
    invoke-interface {v1, v4}, Lcom/koushikdutta/async/http/socketio/Acknowledge;->acknowledge(Lorg/json/JSONArray;)V

    goto/16 :goto_3d

    .line 434
    .end local v1    # "ack":Lcom/koushikdutta/async/http/socketio/Acknowledge;
    .end local v2    # "ackParts":[Ljava/lang/String;
    .end local v4    # "arguments":Lorg/json/JSONArray;
    :pswitch_103
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/koushikdutta/async/http/socketio/SocketIOConnection$13;->this$0:Lcom/koushikdutta/async/http/socketio/SocketIOConnection;

    const/4 v13, 0x2

    aget-object v13, v11, v13

    const/4 v14, 0x3

    aget-object v14, v11, v14

    # invokes: Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->reportError(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v12, v13, v14}, Lcom/koushikdutta/async/http/socketio/SocketIOConnection;->access$800(Lcom/koushikdutta/async/http/socketio/SocketIOConnection;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_110
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_110} :catch_1b

    goto/16 :goto_3d

    .line 387
    :pswitch_data_112
    .packed-switch 0x0
        :pswitch_3e
        :pswitch_50
        :pswitch_5b
        :pswitch_67
        :pswitch_85
        :pswitch_a7
        :pswitch_d6
        :pswitch_103
        :pswitch_3d
    .end packed-switch
.end method
