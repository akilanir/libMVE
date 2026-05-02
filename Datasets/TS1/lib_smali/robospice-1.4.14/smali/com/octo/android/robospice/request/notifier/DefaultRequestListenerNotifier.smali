.class public Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;
.super Ljava/lang/Object;
.source "DefaultRequestListenerNotifier.java"

# interfaces
.implements Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;,
        Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;,
        Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;
    }
.end annotation


# instance fields
.field private final handlerResponse:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->handlerResponse:Landroid/os/Handler;

    .line 34
    return-void
.end method

.method private post(Ljava/lang/Runnable;Ljava/lang/Object;)V
    .registers 6
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "token"    # Ljava/lang/Object;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->handlerResponse:Landroid/os/Handler;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 38
    return-void
.end method


# virtual methods
.method public clearNotificationsForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->handlerResponse:Landroid/os/Handler;

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public notifyListenersOfRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    return-void
.end method

.method public notifyListenersOfRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    return-void
.end method

.method public notifyListenersOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;

    new-instance v1, Lcom/octo/android/robospice/exception/RequestCancelledException;

    const-string v2, "Request has been cancelled explicitely."

    invoke-direct {v1, v2}, Lcom/octo/android/robospice/exception/RequestCancelledException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, p2, v1}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;-><init>(Ljava/util/Set;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->post(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 77
    return-void
.end method

.method public notifyListenersOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;Ljava/util/Set;)V
    .registers 6
    .param p2, "e"    # Lcom/octo/android/robospice/persistence/exception/SpiceException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Lcom/octo/android/robospice/persistence/exception/SpiceException;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p3, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;

    invoke-direct {v0, p3, p2}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;-><init>(Ljava/util/Set;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->post(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 71
    return-void
.end method

.method public notifyListenersOfRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listRequestListener":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;

    invoke-direct {v0, p2}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable;-><init>(Ljava/util/Set;)V

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->post(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 43
    return-void
.end method

.method public notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V
    .registers 6
    .param p3, "progress"    # Lcom/octo/android/robospice/request/listener/RequestProgress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;",
            "Lcom/octo/android/robospice/request/listener/RequestProgress;",
            ")V"
        }
    .end annotation

    .prologue
    .line 58
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;

    invoke-direct {v0, p2, p3}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable;-><init>(Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->post(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 59
    return-void
.end method

.method public notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;Ljava/util/Set;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;TT;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    .local p3, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;

    invoke-direct {v0, p3, p2}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable;-><init>(Ljava/util/Set;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRequestCacheKey()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;->post(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 65
    return-void
.end method
