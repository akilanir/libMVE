.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;
.super Ljava/lang/Thread;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->callDouble(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener;[Ljava/lang/Object;)V
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
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->val$method:Ljava/lang/String;

    iput-object p3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->val$params:[Ljava/lang/Object;

    iput-object p4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->val$handler:Landroid/os/Handler;

    .line 709
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    .line 711
    const/4 v2, 0x0

    .line 712
    .local v2, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    const/4 v3, 0x0

    .line 714
    .local v3, "response":Lorg/json/JSONObject;
    :try_start_2
    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->val$method:Ljava/lang/String;

    iget-object v6, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->val$params:[Ljava/lang/Object;

    invoke-virtual {v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doRequest(Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    .line 715
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 716
    new-instance v6, Ljava/lang/Double;

    const-string v7, "result"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v7

    invoke-direct {v6, v7, v8}, Ljava/lang/Double;-><init>(D)V

    .line 715
    invoke-direct {v2, v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_20
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_2 .. :try_end_20} :catch_2d
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_20} :catch_38

    .line 729
    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :goto_20
    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->val$handler:Landroid/os/Handler;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->val$handler:Landroid/os/Handler;

    const/4 v6, 0x5

    invoke-virtual {v5, v6, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 730
    return-void

    .line 717
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_2d
    move-exception v0

    .line 718
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v4, v5, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_20

    .line 719
    .end local v0    # "e":Lorg/alexd/jsonrpc/JSONRPCException;
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_38
    move-exception v0

    .line 721
    .local v0, "e":Lorg/json/JSONException;
    :try_start_39
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 722
    new-instance v6, Ljava/lang/Double;

    const-string v7, "result"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Double;-><init>(Ljava/lang/String;)V

    .line 721
    invoke-direct {v2, v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_4d
    .catch Ljava/lang/NumberFormatException; {:try_start_39 .. :try_end_4d} :catch_4e
    .catch Lorg/json/JSONException; {:try_start_39 .. :try_end_4d} :catch_59

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_20

    .line 723
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_4e
    move-exception v1

    .line 724
    .local v1, "e1":Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v4, v5, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_20

    .line 725
    .end local v1    # "e1":Ljava/lang/NumberFormatException;
    .end local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_59
    move-exception v1

    .line 726
    .local v1, "e1":Lorg/json/JSONException;
    new-instance v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$22;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v5, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v2, v4, v5, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v2    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_20
.end method
