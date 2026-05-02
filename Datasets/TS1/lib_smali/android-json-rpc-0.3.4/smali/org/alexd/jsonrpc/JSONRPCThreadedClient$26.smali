.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;
.super Ljava/lang/Thread;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->callJSONObject(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;Lorg/json/JSONObject;)V
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
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->val$method:Ljava/lang/String;

    iput-object p3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->val$params:Lorg/json/JSONObject;

    iput-object p4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->val$handler:Landroid/os/Handler;

    .line 814
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 817
    const/4 v1, 0x0

    .line 818
    .local v1, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    const/4 v2, 0x0

    .line 820
    .local v2, "response":Lorg/json/JSONObject;
    :try_start_2
    iget-object v3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->val$method:Ljava/lang/String;

    iget-object v5, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->val$params:Lorg/json/JSONObject;

    invoke-virtual {v3, v4, v5}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->doRequest(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 821
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .end local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v4, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->NORMAL_RESPONSE:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 822
    const-string v5, "result"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 821
    invoke-direct {v1, v3, v4, v5}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    :try_end_1b
    .catch Lorg/alexd/jsonrpc/JSONRPCException; {:try_start_2 .. :try_end_1b} :catch_28
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_1b} :catch_33

    .line 828
    .restart local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :goto_1b
    iget-object v3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->val$handler:Landroid/os/Handler;

    iget-object v4, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->val$handler:Landroid/os/Handler;

    const/4 v5, 0x5

    invoke-virtual {v4, v5, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 829
    return-void

    .line 823
    .end local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_28
    move-exception v0

    .line 824
    .local v0, "e":Lorg/alexd/jsonrpc/JSONRPCException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v4, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v1, v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_1b

    .line 825
    .end local v0    # "e":Lorg/alexd/jsonrpc/JSONRPCException;
    .end local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    :catch_33
    move-exception v0

    .line 826
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    iget-object v3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$26;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    sget-object v4, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    invoke-direct {v1, v3, v4, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;-><init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V

    .restart local v1    # "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    goto :goto_1b
.end method
