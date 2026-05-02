.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;
.super Landroid/os/Handler;
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

.field private final synthetic val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;


# direct methods
.method constructor <init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;

    .line 796
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 799
    if-eqz p1, :cond_6

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v1, :cond_c

    .line 800
    :cond_6
    iget-object v1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;

    invoke-interface {v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;->sendErrorMessageNull()V

    .line 811
    :goto_b
    return-void

    .line 803
    :cond_c
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .line 804
    .local v0, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v1, v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->description:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    sget-object v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    if-ne v1, v2, :cond_20

    .line 805
    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;

    iget-object v1, v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->content:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Exception;

    invoke-interface {v2, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;->sendError(Ljava/lang/Exception;)V

    goto :goto_b

    .line 808
    :cond_20
    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$25;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;

    iget-object v1, v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->content:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONObject;

    invoke-interface {v2, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener;->manageResult(Lorg/json/JSONObject;)V

    goto :goto_b
.end method
