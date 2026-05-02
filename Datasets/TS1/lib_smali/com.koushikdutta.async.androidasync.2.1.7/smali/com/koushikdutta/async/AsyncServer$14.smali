.class Lcom/koushikdutta/async/AsyncServer$14;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->dump()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncServer;)V
    .registers 2

    .prologue
    .line 835
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$14;->this$0:Lcom/koushikdutta/async/AsyncServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 838
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$14;->this$0:Lcom/koushikdutta/async/AsyncServer;

    # getter for: Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;
    invoke-static {v2}, Lcom/koushikdutta/async/AsyncServer;->access$300(Lcom/koushikdutta/async/AsyncServer;)Lcom/koushikdutta/async/SelectorWrapper;

    move-result-object v2

    if-nez v2, :cond_10

    .line 839
    const-string v2, "NIO"

    const-string v3, "Server dump not possible. No selector?"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 847
    :cond_f
    return-void

    .line 842
    :cond_10
    const-string v2, "NIO"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Key Count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/koushikdutta/async/AsyncServer$14;->this$0:Lcom/koushikdutta/async/AsyncServer;

    # getter for: Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;
    invoke-static {v4}, Lcom/koushikdutta/async/AsyncServer;->access$300(Lcom/koushikdutta/async/AsyncServer;)Lcom/koushikdutta/async/SelectorWrapper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/koushikdutta/async/SelectorWrapper;->keys()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 844
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$14;->this$0:Lcom/koushikdutta/async/AsyncServer;

    # getter for: Lcom/koushikdutta/async/AsyncServer;->mSelector:Lcom/koushikdutta/async/SelectorWrapper;
    invoke-static {v2}, Lcom/koushikdutta/async/AsyncServer;->access$300(Lcom/koushikdutta/async/AsyncServer;)Lcom/koushikdutta/async/SelectorWrapper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/koushikdutta/async/SelectorWrapper;->keys()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_44
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/channels/SelectionKey;

    .line 845
    .local v1, "key":Ljava/nio/channels/SelectionKey;
    const-string v2, "NIO"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_44
.end method
