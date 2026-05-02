.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;
.super Ljava/lang/Thread;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->callInt(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

.field private final synthetic val$handler:Landroid/os/Handler;

.field private final synthetic val$method:Ljava/lang/String;

.field private final synthetic val$params:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;Lorg/json/JSONObject;Landroid/os/Handler;)V
    .registers 5

    .prologue
    .line 1
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$method:Ljava/lang/String;

    iput-object p3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$params:Lorg/json/JSONObject;

    iput-object p4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$handler:Landroid/os/Handler;

    .line 433
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    .line 436
    const/4 v3, 0x0

    .line 439
    .local v3, "response":Lorg/json/JSONObject;
    :try_start_1
    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$method:Ljava/lang/String;

    iget-object v6, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$params:Lorg/json/JSONObject;

    invoke-virtual {v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v3

    .line 440
    if-nez v3, :cond_39

    .line 441
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    new-instance v6, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Cannot call method: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$method:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    invoke-direct {v2, v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_2c} :catch_4e
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_1 .. :try_end_2c} :catch_7a

    .line 460
    .local v2, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :goto_2c
    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$handler:Landroid/os/Handler;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->val$handler:Landroid/os/Handler;

    const/4 v6, 0x5

    invoke-virtual {v5, v6, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 461
    return-void

    .line 444
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :cond_39
    :try_start_39
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 445
    new-instance v6, Ljava/lang/Integer;

    const-string v7, "result"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    .line 444
    invoke-direct {v2, v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_4d
    .catch Lorg/json/JSONException; {:try_start_39 .. :try_end_4d} :catch_4e
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_39 .. :try_end_4d} :catch_7a

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2c

    .line 448
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_4e
    move-exception v0

    .line 450
    .local v0, "e":Lorg/json/JSONException;
    :try_start_4f
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 451
    new-instance v6, Ljava/lang/Integer;

    const-string v7, "result"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    .line 450
    invoke-direct {v2, v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_63
    .catch Ljava/lang/NumberFormatException; {:try_start_4f .. :try_end_63} :catch_64
    .catch Lorg/json/JSONException; {:try_start_4f .. :try_end_63} :catch_6f

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2c

    .line 452
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_64
    move-exception v1

    .line 453
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v4, v5, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2c

    .line 454
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_6f
    move-exception v1

    .line 455
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v4, v5, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2c

    .line 457
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "e1":Lorg/json/JSONException;
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_7a
    move-exception v0

    .line 458
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$12;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v4, v5, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2c
.end method
