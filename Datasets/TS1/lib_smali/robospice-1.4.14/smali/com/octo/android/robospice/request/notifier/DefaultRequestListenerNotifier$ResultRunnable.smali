.class Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;
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
    name = "ResultRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
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

.field private result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private spiceException:Lcom/octo/android/robospice/persistence/exception/SpiceException;


# direct methods
.method public constructor <init>(Ljava/util/Set;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
    .registers 3
    .param p2, "spiceException"    # Lcom/octo/android/robospice/persistence/exception/SpiceException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;",
            "Lcom/octo/android/robospice/persistence/exception/SpiceException;",
            ")V"
        }
    .end annotation

    .prologue
    .line 154
    .local p0, "this":Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;, "Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable<TT;>;"
    .local p1, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput-object p2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->spiceException:Lcom/octo/android/robospice/persistence/exception/SpiceException;

    .line 156
    iput-object p1, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->listeners:Ljava/util/Set;

    .line 157
    return-void
.end method

.method public constructor <init>(Ljava/util/Set;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "this":Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;, "Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable<TT;>;"
    .local p1, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput-object p2, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->result:Ljava/lang/Object;

    .line 151
    iput-object p1, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->listeners:Ljava/util/Set;

    .line 152
    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;, "Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable<TT;>;"
    const/4 v6, 0x0

    .line 161
    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->listeners:Ljava/util/Set;

    if-nez v4, :cond_6

    .line 181
    :goto_5
    return-void

    .line 165
    :cond_6
    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->spiceException:Lcom/octo/android/robospice/persistence/exception/SpiceException;

    if-nez v4, :cond_6c

    const-string v3, "success"

    .line 166
    .local v3, "resultMsg":Ljava/lang/String;
    :goto_c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Notifying "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->listeners:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " listeners of request "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 167
    iget-object v5, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->listeners:Ljava/util/Set;

    monitor-enter v5

    .line 168
    :try_start_37
    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->listeners:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_3d
    :goto_3d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_75

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/octo/android/robospice/request/listener/RequestListener;

    .line 169
    .local v1, "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    if-eqz v1, :cond_3d

    .line 171
    move-object v2, v1

    .line 172
    .local v2, "listenerOfT":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    const-string v4, "Notifying %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 173
    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->spiceException:Lcom/octo/android/robospice/persistence/exception/SpiceException;

    if-nez v4, :cond_6f

    .line 174
    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->result:Ljava/lang/Object;

    invoke-interface {v2, v4}, Lcom/octo/android/robospice/request/listener/RequestListener;->onRequestSuccess(Ljava/lang/Object;)V

    goto :goto_3d

    .line 180
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    .end local v2    # "listenerOfT":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    :catchall_69
    move-exception v4

    monitor-exit v5
    :try_end_6b
    .catchall {:try_start_37 .. :try_end_6b} :catchall_69

    throw v4

    .line 165
    .end local v3    # "resultMsg":Ljava/lang/String;
    :cond_6c
    const-string v3, "failure"

    goto :goto_c

    .line 176
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    .restart local v2    # "listenerOfT":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    .restart local v3    # "resultMsg":Ljava/lang/String;
    :cond_6f
    :try_start_6f
    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;->spiceException:Lcom/octo/android/robospice/persistence/exception/SpiceException;

    invoke-interface {v1, v4}, Lcom/octo/android/robospice/request/listener/RequestListener;->onRequestFailure(Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    goto :goto_3d

    .line 180
    .end local v1    # "listener":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<*>;"
    .end local v2    # "listenerOfT":Lcom/octo/android/robospice/request/listener/RequestListener;, "Lcom/octo/android/robospice/request/listener/RequestListener<TT;>;"
    :cond_75
    monitor-exit v5
    :try_end_76
    .catchall {:try_start_6f .. :try_end_76} :catchall_69

    goto :goto_5
.end method
