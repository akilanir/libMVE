.class Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;
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
    name = "ProgressRunnable"
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

.field private final progress:Lcom/octo/android/robospice/request/listener/RequestProgress;


# direct methods
.method public constructor <init>(Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V
    .registers 3
    .param p2, "progress"    # Lcom/octo/android/robospice/request/listener/RequestProgress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;",
            "Lcom/octo/android/robospice/request/listener/RequestProgress;",
            ")V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput-object p2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    .line 121
    iput-object p1, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->listeners:Ljava/util/Set;

    .line 122
    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 127
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->listeners:Ljava/util/Set;

    if-nez v2, :cond_6

    .line 140
    :goto_5
    return-void

    .line 131
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Notifying "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->listeners:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " listeners of progress "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 132
    iget-object v3, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->listeners:Ljava/util/Set;

    monitor-enter v3

    .line 133
    :try_start_33
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->listeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_39
    :goto_39
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_69

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/octo/android/robospice/request/listener/RequestListener;

    .line 134
    .local v1, "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    if-eqz v1, :cond_39

    instance-of v2, v1, Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    if-eqz v2, :cond_39

    .line 135
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

    .line 136
    check-cast v1, Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    .end local v1    # "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    invoke-interface {v1, v2}, Lcom/octo/android/robospice/request/listener/RequestProgressListener;->onRequestProgressUpdate(Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    goto :goto_39

    .line 139
    .end local v0    # "i$":Ljava/util/Iterator;
    :catchall_66
    move-exception v2

    monitor-exit v3
    :try_end_68
    .catchall {:try_start_33 .. :try_end_68} :catchall_66

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_69
    :try_start_69
    monitor-exit v3
    :try_end_6a
    .catchall {:try_start_69 .. :try_end_6a} :catchall_66

    goto :goto_5
.end method
