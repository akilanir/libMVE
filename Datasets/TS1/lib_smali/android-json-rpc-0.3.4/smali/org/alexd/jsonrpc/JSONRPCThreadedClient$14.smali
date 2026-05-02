.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;
.super Ljava/lang/Thread;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->callLong(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener;[Ljava/lang/Object;)V
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
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$method:Ljava/lang/String;

    iput-object p3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$params:[Ljava/lang/Object;

    iput-object p4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$handler:Landroid/os/Handler;

    .line 492
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    .line 495
    const/4 v4, 0x0

    .line 496
    .local v4, "response":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 498
    .local v3, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :try_start_2
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iget-object v6, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$method:Ljava/lang/String;

    iget-object v7, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$params:[Ljava/lang/Object;

    invoke-virtual {v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    .line 499
    if-nez v4, :cond_3a

    .line 500
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 501
    new-instance v7, Lorg/alexd/jsonrpc/JSONRPCException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Cannot call method: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$method:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    .line 500
    invoke-direct {v3, v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2d} :catch_4f
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_2 .. :try_end_2d} :catch_7e

    .line 519
    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :goto_2d
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$handler:Landroid/os/Handler;

    iget-object v6, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->val$handler:Landroid/os/Handler;

    const/4 v7, 0x5

    invoke-virtual {v6, v7, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 520
    return-void

    .line 504
    :cond_3a
    :try_start_3a
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 505
    new-instance v7, Ljava/lang/Long;

    const-string v8, "result"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-direct {v7, v8, v9}, Ljava/lang/Long;-><init>(J)V

    .line 504
    invoke-direct {v3, v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_4e
    .catch Lorg/json/JSONException; {:try_start_3a .. :try_end_4e} :catch_4f
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_3a .. :try_end_4e} :catch_7e

    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2d

    .line 507
    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_4f
    move-exception v0

    .line 509
    .local v0, "e":Lorg/json/JSONException;
    :try_start_50
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 510
    const-string v7, "result"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 509
    invoke-direct {v3, v5, v6, v7}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_67
    .catch Ljava/lang/NumberFormatException; {:try_start_50 .. :try_end_67} :catch_68
    .catch Lorg/json/JSONException; {:try_start_50 .. :try_end_67} :catch_73

    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2d

    .line 511
    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_68
    move-exception v1

    .line 512
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v3, v5, v6, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2d

    .line 513
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_73
    move-exception v2

    .line 514
    .local v2, "e2":Lorg/json/JSONException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v3, v5, v6, v2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2d

    .line 516
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "e2":Lorg/json/JSONException;
    .end local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_7e
    move-exception v0

    .line 517
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    new-instance v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$14;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v6, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v3, v5, v6, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v3    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_2d
.end method
