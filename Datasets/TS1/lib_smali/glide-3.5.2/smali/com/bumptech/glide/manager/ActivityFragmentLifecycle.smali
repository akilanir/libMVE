.class Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;
.super Ljava/lang/Object;
.source "ActivityFragmentLifecycle.java"

# interfaces
.implements Lcom/bumptech/glide/manager/Lifecycle;


# instance fields
.field private isDestroyed:Z

.field private isStarted:Z

.field private final lifecycleListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/bumptech/glide/manager/LifecycleListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->lifecycleListeners:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public addListener(Lcom/bumptech/glide/manager/LifecycleListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/bumptech/glide/manager/LifecycleListener;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->lifecycleListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 36
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->isDestroyed:Z

    if-eqz v0, :cond_d

    .line 37
    invoke-interface {p1}, Lcom/bumptech/glide/manager/LifecycleListener;->onDestroy()V

    .line 43
    :goto_c
    return-void

    .line 38
    :cond_d
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->isStarted:Z

    if-eqz v0, :cond_15

    .line 39
    invoke-interface {p1}, Lcom/bumptech/glide/manager/LifecycleListener;->onStart()V

    goto :goto_c

    .line 41
    :cond_15
    invoke-interface {p1}, Lcom/bumptech/glide/manager/LifecycleListener;->onStop()V

    goto :goto_c
.end method

.method onDestroy()V
    .registers 4

    .prologue
    .line 60
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->isDestroyed:Z

    .line 61
    iget-object v2, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->lifecycleListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/manager/LifecycleListener;

    .line 62
    .local v1, "lifecycleListener":Lcom/bumptech/glide/manager/LifecycleListener;
    invoke-interface {v1}, Lcom/bumptech/glide/manager/LifecycleListener;->onDestroy()V

    goto :goto_9

    .line 64
    .end local v1    # "lifecycleListener":Lcom/bumptech/glide/manager/LifecycleListener;
    :cond_19
    return-void
.end method

.method onStart()V
    .registers 4

    .prologue
    .line 46
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->isStarted:Z

    .line 47
    iget-object v2, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->lifecycleListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/manager/LifecycleListener;

    .line 48
    .local v1, "lifecycleListener":Lcom/bumptech/glide/manager/LifecycleListener;
    invoke-interface {v1}, Lcom/bumptech/glide/manager/LifecycleListener;->onStart()V

    goto :goto_9

    .line 50
    .end local v1    # "lifecycleListener":Lcom/bumptech/glide/manager/LifecycleListener;
    :cond_19
    return-void
.end method

.method onStop()V
    .registers 4

    .prologue
    .line 53
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->isStarted:Z

    .line 54
    iget-object v2, p0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->lifecycleListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/manager/LifecycleListener;

    .line 55
    .local v1, "lifecycleListener":Lcom/bumptech/glide/manager/LifecycleListener;
    invoke-interface {v1}, Lcom/bumptech/glide/manager/LifecycleListener;->onStop()V

    goto :goto_9

    .line 57
    .end local v1    # "lifecycleListener":Lcom/bumptech/glide/manager/LifecycleListener;
    :cond_19
    return-void
.end method
