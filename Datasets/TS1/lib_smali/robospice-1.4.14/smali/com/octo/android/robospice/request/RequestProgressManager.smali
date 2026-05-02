.class public Lcom/octo/android/robospice/request/RequestProgressManager;
.super Ljava/lang/Object;
.source "RequestProgressManager.java"


# instance fields
.field private mapRequestToRequestListener:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private final requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

.field private final requestProcessorListener:Lcom/octo/android/robospice/request/RequestProcessorListener;

.field private final spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/request/RequestProcessorListener;Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;)V
    .registers 4
    .param p1, "requestProcessorListener"    # Lcom/octo/android/robospice/request/RequestProcessorListener;
    .param p2, "requestListenerNotifier"    # Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;
    .param p3, "spiceServiceListenerNotifier"    # Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestProcessorListener:Lcom/octo/android/robospice/request/RequestProcessorListener;

    .line 40
    iput-object p2, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    .line 41
    iput-object p3, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/octo/android/robospice/request/RequestProgressManager;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/request/RequestProgressManager;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 154
    return-void
.end method

.method protected checkAllRequestComplete()V
    .registers 3

    .prologue
    .line 90
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 91
    const-string v0, "Sending all request complete."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 92
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestProcessorListener:Lcom/octo/android/robospice/request/RequestProcessorListener;

    invoke-interface {v0}, Lcom/octo/android/robospice/request/RequestProcessorListener;->allRequestComplete()V

    .line 94
    :cond_15
    return-void
.end method

.method public createProgressListener(Lcom/octo/android/robospice/request/CachedSpiceRequest;)Lcom/octo/android/robospice/request/listener/RequestProgressListener;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;)",
            "Lcom/octo/android/robospice/request/listener/RequestProgressListener;"
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/RequestProgressManager$1;

    invoke-direct {v0, p0, p1}, Lcom/octo/android/robospice/request/RequestProgressManager$1;-><init>(Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 182
    .local v0, "requestProgressListener":Lcom/octo/android/robospice/request/listener/RequestProgressListener;
    return-object v0
.end method

.method public dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Collection",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listRequestListener":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 144
    .local v0, "setRequestListener":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v1, p1, v0}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->clearNotificationsForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 146
    if-eqz v0, :cond_3f

    if-eqz p2, :cond_3f

    .line 147
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Removing listeners of request : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 148
    invoke-interface {v0, p2}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 150
    :cond_3f
    return-void
.end method

.method public getPendingRequestCount()I
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method

.method public notifyListenersOfRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
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
    .line 61
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    const-string v0, "Request was added to queue."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 63
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 64
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v0, p1, p2}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 65
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getProgress()Lcom/octo/android/robospice/request/listener/RequestProgress;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 66
    return-void
.end method

.method public notifyListenersOfRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
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
    .line 69
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    const-string v0, "Request was aggregated in queue."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 71
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 72
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v0, p1, p2}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 73
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getProgress()Lcom/octo/android/robospice/request/listener/RequestProgress;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 74
    return-void
.end method

.method public notifyListenersOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not calling network request : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " as it is cancelled. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 123
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 124
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->COMPLETE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {p0, p1, v0, v1}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 126
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 127
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v1, p1, v0}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 128
    invoke-virtual {p0, p1, v0}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyOfRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 129
    return-void
.end method

.method public notifyListenersOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
    .registers 5
    .param p2, "e"    # Lcom/octo/android/robospice/persistence/exception/SpiceException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;",
            "Lcom/octo/android/robospice/persistence/exception/SpiceException;",
            ")V"
        }
    .end annotation

    .prologue
    .line 113
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 114
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->COMPLETE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {p0, p1, v0, v1}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 116
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 117
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v1, p1, p2, v0}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;Ljava/util/Set;)V

    .line 118
    invoke-virtual {p0, p1, v0}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyOfRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 119
    return-void
.end method

.method public notifyListenersOfRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    const-string v0, "Request was *NOT* found when adding request listeners to existing requests."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 56
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 57
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v0, p1, p2}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 58
    return-void
.end method

.method public notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V
    .registers 8
    .param p3, "progress"    # Lcom/octo/android/robospice/request/listener/RequestProgress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;",
            "Lcom/octo/android/robospice/request/listener/RequestProgress;",
            ")V"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    const-string v0, "Sending progress %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p3}, Lcom/octo/android/robospice/request/listener/RequestProgress;->getStatus()Lcom/octo/android/robospice/request/listener/RequestStatus;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 84
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v0, p1, p3}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 85
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v0, p1, p2, p3}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 86
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/RequestProgressManager;->checkAllRequestComplete()V

    .line 87
    return-void
.end method

.method protected notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestStatus;)V
    .registers 5
    .param p3, "status"    # Lcom/octo/android/robospice/request/listener/RequestStatus;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;",
            "Lcom/octo/android/robospice/request/listener/RequestStatus;",
            ")V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestProgress;

    invoke-direct {v0, p3}, Lcom/octo/android/robospice/request/listener/RequestProgress;-><init>(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 78
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/RequestProgressManager;->checkAllRequestComplete()V

    .line 79
    return-void
.end method

.method public notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 105
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->COMPLETE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {p0, p1, v0, v1}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 107
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 108
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v1, p1, p2, v0}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;Ljava/util/Set;)V

    .line 109
    invoke-virtual {p0, p1, v0}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyOfRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 110
    return-void
.end method

.method public notifyListenersOfRequestSuccessButDontCompleteRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    .local p2, "result":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 99
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 100
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->requestListenerNotifier:Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    invoke-interface {v1, p1, p2, v0}, Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;->notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;Ljava/util/Set;)V

    .line 101
    return-void
.end method

.method public notifyOfRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    const-string v0, "Removing %s  size is %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 162
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/RequestProgressManager;->checkAllRequestComplete()V

    .line 165
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->notifyObserversOfRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 166
    return-void
.end method

.method public removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->spiceServiceListenerNotifier:Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 158
    return-void
.end method

.method public setMapRequestToRequestListener(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;>;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "mapRequestToRequestListener":Ljava/util/Map;, "Ljava/util/Map<Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;

    .line 50
    return-void
.end method
