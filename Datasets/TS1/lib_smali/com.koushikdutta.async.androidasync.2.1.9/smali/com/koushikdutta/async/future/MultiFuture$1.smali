.class Lcom/koushikdutta/async/future/MultiFuture$1;
.super Ljava/lang/Object;
.source "MultiFuture.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/future/MultiFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/future/MultiFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/future/MultiFuture;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/future/MultiFuture;

    .prologue
    .line 11
    .local p0, "this":Lcom/koushikdutta/async/future/MultiFuture$1;, "Lcom/koushikdutta/async/future/MultiFuture.1;"
    iput-object p1, p0, Lcom/koushikdutta/async/future/MultiFuture$1;->this$0:Lcom/koushikdutta/async/future/MultiFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 9
    .param p1, "e"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p0, "this":Lcom/koushikdutta/async/future/MultiFuture$1;, "Lcom/koushikdutta/async/future/MultiFuture.1;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lcom/koushikdutta/async/future/MultiFuture$1;->this$0:Lcom/koushikdutta/async/future/MultiFuture;

    monitor-enter v4

    .line 16
    :try_start_3
    iget-object v3, p0, Lcom/koushikdutta/async/future/MultiFuture$1;->this$0:Lcom/koushikdutta/async/future/MultiFuture;

    iget-object v0, v3, Lcom/koushikdutta/async/future/MultiFuture;->callbacks:Ljava/util/ArrayList;

    .line 17
    .local v0, "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/future/FutureCallback<TT;>;>;"
    iget-object v3, p0, Lcom/koushikdutta/async/future/MultiFuture$1;->this$0:Lcom/koushikdutta/async/future/MultiFuture;

    const/4 v5, 0x0

    iput-object v5, v3, Lcom/koushikdutta/async/future/MultiFuture;->callbacks:Ljava/util/ArrayList;

    .line 18
    monitor-exit v4

    .line 20
    if-nez v0, :cond_13

    .line 25
    :cond_f
    return-void

    .line 18
    .end local v0    # "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/future/FutureCallback<TT;>;>;"
    :catchall_10
    move-exception v3

    monitor-exit v4
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v3

    .line 22
    .restart local v0    # "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/future/FutureCallback<TT;>;>;"
    :cond_13
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/future/FutureCallback;

    .line 23
    .local v1, "cb":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<TT;>;"
    invoke-interface {v1, p1, p2}, Lcom/koushikdutta/async/future/FutureCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_17
.end method
