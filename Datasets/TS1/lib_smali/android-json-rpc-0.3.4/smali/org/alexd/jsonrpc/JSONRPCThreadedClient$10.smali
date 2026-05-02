.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;
.super Ljava/lang/Thread;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->callInt(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener;[Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

.field private final synthetic val$handler:Landroid/os/Handler;

.field private final synthetic val$method:Ljava/lang/String;

.field private final synthetic val$params:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Ljava/lang/String;[Ljava/lang/Object;Landroid/os/Handler;)V
    .registers 5

    .prologue
    .line 1
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$method:Ljava/lang/String;

    iput-object p3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$params:[Ljava/lang/Object;

    iput-object p4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$handler:Landroid/os/Handler;

    .line 376
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    .line 379
    const/4 v4, 0x0

    .line 380
    .local v4, "response":Lorg/json/JSONObject;
    const/4 v2, 0x0

    .line 382
    .local v2, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :try_start_2
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iget-object v6, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$method:Ljava/lang/String;

    iget-object v7, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$params:[Ljava/lang/Object;

    invoke-virtual {v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    .line 383
    if-nez v4, :cond_8b

    .line 384
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 385
    new-instance v7, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Cannot call method: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$method:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    .line 384
    invoke-direct {v3, v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2d} :catch_4e
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_2 .. :try_end_2d} :catch_7a

    .line 387
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    .local v3, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :goto_2d
    :try_start_2d
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 388
    new-instance v7, Ljava/lang/Integer;

    const-string v8, "result"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-direct {v7, v8}, Ljava/lang/Integer;-><init>(I)V

    .line 387
    invoke-direct {v2, v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_41
    .catch Lorg/json/JSONException; {:try_start_2d .. :try_end_41} :catch_88
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_2d .. :try_end_41} :catch_85

    .line 401
    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :goto_41
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$handler:Landroid/os/Handler;

    iget-object v6, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->val$handler:Landroid/os/Handler;

    const/4 v7, 0x5

    invoke-virtual {v6, v7, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 402
    return-void

    .line 389
    :catch_4e
    move-exception v0

    .line 391
    .local v0, "e":Lorg/json/JSONException;
    :goto_4f
    :try_start_4f
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 392
    new-instance v7, Ljava/lang/Integer;

    const-string v8, "result"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    .line 391
    invoke-direct {v2, v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_63
    .catch Ljava/lang/NumberFormatException; {:try_start_4f .. :try_end_63} :catch_64
    .catch Lorg/json/JSONException; {:try_start_4f .. :try_end_63} :catch_6f

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_41

    .line 393
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_64
    move-exception v1

    .line 394
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v5, v6, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_41

    .line 395
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_6f
    move-exception v1

    .line 396
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v5, v6, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_41

    .line 398
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "e1":Lorg/json/JSONException;
    :catch_7a
    move-exception v0

    .line 399
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    :goto_7b
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$10;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v5, v6, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_41

    .line 398
    .end local v0    # "e":Lorg/alexd/jsonrpc/JSONRPCException;
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_85
    move-exception v0

    move-object v2, v3

    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_7b

    .line 389
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_88
    move-exception v0

    move-object v2, v3

    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_4f

    :cond_8b
    move-object v3, v2

    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2d
.end method
