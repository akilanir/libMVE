.class public Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;
.super Ljava/lang/Object;
.source "JSONRPCThreadedClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/alexd/jsonrpc/JSONRPCThreadedClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MessageObject"
.end annotation


# instance fields
.field public content:Ljava/lang/Object;

.field public description:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

.field final synthetic this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;


# direct methods
.method public constructor <init>(Lorg/alexd/jsonrpc/JSONRPCThreadedClient;Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;Ljava/lang/Object;)V
    .registers 4
    .param p2, "description"    # Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;
    .param p3, "content"    # Ljava/lang/Object;

    .prologue
    .line 26
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->this$0:Lorg/alexd/jsonrpc/JSONRPCThreadedClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->description:Lorg/alexd/jsonrpc/JSONRPCThreadedClient$Description;

    .line 28
    iput-object p3, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject;->content:Ljava/lang/Object;

    .line 29
    return-void
.end method
