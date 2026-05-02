.class Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;
.super Ljava/lang/Object;
.source "HttpProxyCacheServer.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/danikula/videocache/HttpProxyCacheServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PingCallable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/danikula/videocache/HttpProxyCacheServer;


# direct methods
.method private constructor <init>(Lcom/danikula/videocache/HttpProxyCacheServer;)V
    .registers 2

    .prologue
    .line 335
    iput-object p1, p0, Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;->this$0:Lcom/danikula/videocache/HttpProxyCacheServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/danikula/videocache/HttpProxyCacheServer;Lcom/danikula/videocache/HttpProxyCacheServer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/danikula/videocache/HttpProxyCacheServer;
    .param p2, "x1"    # Lcom/danikula/videocache/HttpProxyCacheServer$1;

    .prologue
    .line 335
    invoke-direct {p0, p1}, Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;-><init>(Lcom/danikula/videocache/HttpProxyCacheServer;)V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 339
    iget-object v0, p0, Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;->this$0:Lcom/danikula/videocache/HttpProxyCacheServer;

    # invokes: Lcom/danikula/videocache/HttpProxyCacheServer;->pingServer()Z
    invoke-static {v0}, Lcom/danikula/videocache/HttpProxyCacheServer;->access$400(Lcom/danikula/videocache/HttpProxyCacheServer;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 335
    invoke-virtual {p0}, Lcom/danikula/videocache/HttpProxyCacheServer$PingCallable;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
