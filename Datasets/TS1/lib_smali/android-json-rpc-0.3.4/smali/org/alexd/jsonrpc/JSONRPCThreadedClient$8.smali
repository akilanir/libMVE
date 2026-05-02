.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;
.super Ljava/lang/Thread;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->callString(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener;Lorg/json/JSONObject;)V
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
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->val$method:Ljava/lang/String;

    iput-object p3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->val$params:Lorg/json/JSONObject;

    iput-object p4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->val$handler:Landroid/os/Handler;

    .line 335
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    .line 338
    const/4 v1, 0x0

    .line 340
    .local v1, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :try_start_1
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .end local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 341
    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->val$method:Ljava/lang/String;

    iget-object v6, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->val$params:Lorg/json/JSONObject;

    invoke-virtual {v4, v5, v6}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "result"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 340
    invoke-direct {v1, v2, v3, v4}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1a} :catch_27
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_1 .. :try_end_1a} :catch_32

    .line 347
    .restart local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :goto_1a
    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->val$handler:Landroid/os/Handler;

    iget-object v3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->val$handler:Landroid/os/Handler;

    const/4 v4, 0x5

    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 348
    return-void

    .line 342
    .end local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_27
    move-exception v0

    .line 343
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v1, v2, v3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_1a

    .line 344
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_32
    move-exception v0

    .line 345
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$8;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v1, v2, v3, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_1a
.end method
