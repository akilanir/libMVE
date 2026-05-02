.class Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;
.super Ljava/lang/Object;
.source "DefaultRequestListenerNotifier.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NotFoundRunnable"
.end annotation


# instance fields
.field private final listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-object p1, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;->listeners:Ljava/util/Set;

    .line 94
    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 99
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;->listeners:Ljava/util/Set;

    if-nez v2, :cond_6

    .line 112
    :goto_5
    return-void

    .line 103
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Notifying "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;->listeners:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " listeners of request not found"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 104
    iget-object v3, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;->listeners:Ljava/util/Set;

    monitor-enter v3

    .line 105
    :try_start_2d
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;->listeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_33
    :goto_33
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_61

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/octo/android/robospice/request/listener/RequestListener;

    .line 106
    .local v1, "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    if-eqz v1, :cond_33

    instance-of v2, v1, Lcom/octo/android/robospice/request/listener/PendingRequestListener;

    if-eqz v2, :cond_33

    .line 107
    const-string v2, "Notifying %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v4}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 108
    check-cast v1, Lcom/octo/android/robospice/request/listener/PendingRequestListener;

    .end local v1    # "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    invoke-interface {v1}, Lcom/octo/android/robospice/request/listener/PendingRequestListener;->onRequestNotFound()V

    goto :goto_33

    .line 111
    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_5e
    move-exception v2

    monitor-exit v3
    :try_end_60
    .catchall {:try_start_2d .. :try_end_60} :catchall_5e

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_61
    :try_start_61
    monitor-exit v3
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_5e

    goto :goto_5
.end method
