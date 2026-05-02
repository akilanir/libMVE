.class Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;
.super Ljava/lang/Object;
.source "Futures.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/Futures$CombinedFuture;->init(Ljava/util/concurrent/Executor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/Futures$CombinedFuture;)V
    .registers 2

    .prologue
    .line 1485
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;, "Lcom/google/common/util/concurrent/Futures$CombinedFuture.1;"
    iput-object p1, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .local p0, "this":Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;, "Lcom/google/common/util/concurrent/Futures$CombinedFuture.1;"
    const/4 v3, 0x0

    .line 1489
    iget-object v2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 1490
    iget-object v2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    iget-object v2, v2, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->futures:Lcom/google/common/collect/ImmutableCollection;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ListenableFuture;

    .line 1491
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<*>;"
    iget-object v2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    invoke-virtual {v2}, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->wasInterrupted()Z

    move-result v2

    invoke-interface {v0, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    goto :goto_11

    .line 1496
    .end local v0    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<*>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_27
    iget-object v2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    iput-object v3, v2, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->futures:Lcom/google/common/collect/ImmutableCollection;

    .line 1500
    iget-object v2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    iput-object v3, v2, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->values:Ljava/util/List;

    .line 1503
    iget-object v2, p0, Lcom/google/common/util/concurrent/Futures$CombinedFuture$1;->this$0:Lcom/google/common/util/concurrent/Futures$CombinedFuture;

    iput-object v3, v2, Lcom/google/common/util/concurrent/Futures$CombinedFuture;->combiner:Lcom/google/common/util/concurrent/Futures$FutureCombiner;

    .line 1504
    return-void
.end method
