.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;
.super Landroid/os/Handler;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->call(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;[Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

.field private final synthetic val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;


# direct methods
.method constructor <init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;

    .line 198
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 200
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v1, :cond_a

    iget-object v1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;

    invoke-interface {v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;->sendErrorMessageNull()V

    .line 210
    :goto_9
    return-void

    .line 202
    :cond_a
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .line 203
    .local v0, "object":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v1, v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->description:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    sget-object v2, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    if-ne v1, v2, :cond_1e

    .line 204
    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;

    iget-object v1, v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->content:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Exception;

    invoke-interface {v2, v1}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;->sendError(Ljava/lang/Exception;)V

    goto :goto_9

    .line 207
    :cond_1e
    iget-object v1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$1;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;

    iget-object v2, v0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->content:Ljava/lang/Object;

    invoke-interface {v1, v2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener;->manageResult(Ljava/lang/Object;)V

    goto :goto_9
.end method
