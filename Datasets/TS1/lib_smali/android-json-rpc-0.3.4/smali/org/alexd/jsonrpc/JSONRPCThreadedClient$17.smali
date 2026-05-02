.class Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;
.super Landroid/os/Handler;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;->callBoolean(Ljava/lang/String;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;[Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

.field private final synthetic val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;


# direct methods
.method constructor <init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;

    .line 588
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 590
    if-eqz p1, :cond_6

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v2, :cond_c

    .line 591
    :cond_6
    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;

    invoke-interface {v2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;->sendErrorMessageNull()V

    .line 603
    :goto_b
    return-void

    .line 594
    :cond_c
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;

    .line 595
    .local v1, "mo":Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
    iget-object v2, v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->description:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    sget-object v3, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;->ERROR:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    if-ne v2, v3, :cond_20

    .line 596
    iget-object v0, v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->content:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Exception;

    .line 597
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;

    invoke-interface {v2, v0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;->sendError(Ljava/lang/Exception;)V

    goto :goto_b

    .line 600
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_20
    iget-object v3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$17;->val$listener:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;

    iget-object v2, v1, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->content:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v3, v2}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener;->manageResult(Z)V

    goto :goto_b
.end method
