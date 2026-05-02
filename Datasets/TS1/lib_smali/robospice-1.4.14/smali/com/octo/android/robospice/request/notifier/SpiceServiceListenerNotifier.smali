.class public Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;
.super Ljava/lang/Object;
.source "SpiceServiceListenerNotifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;,
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProgressNotifier;,
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestCancelledNotifier;,
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestSucceededNotifier;,
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestFailedNotifier;,
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestNotFoundNotifier;,
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;,
        Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAddedNotifier;
    }
.end annotation


# instance fields
.field private messageQueue:Landroid/os/Handler;

.field private final spiceServiceListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    .line 352
    return-void
.end method


# virtual methods
.method public addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 4
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->messageQueue:Landroid/os/Handler;

    if-nez v0, :cond_1c

    .line 33
    const-string v0, "Message Queue starting"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 34
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->messageQueue:Landroid/os/Handler;

    .line 36
    :cond_1c
    return-void
.end method

.method protected createMessageQueue()V
    .registers 3

    .prologue
    .line 48
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->messageQueue:Landroid/os/Handler;

    .line 49
    return-void
.end method

.method getRequestToObserverMapCount()I
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public notifyObserversOfRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 6
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
    .line 68
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "requestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 69
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 70
    invoke-virtual {v0, p2}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setRequestListeners(Ljava/util/Set;)V

    .line 71
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAddedNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAddedNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 72
    return-void
.end method

.method public notifyObserversOfRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 6
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
    .line 80
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "requestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 81
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 82
    invoke-virtual {v0, p2}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setRequestListeners(Ljava/util/Set;)V

    .line 83
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 84
    return-void
.end method

.method public notifyObserversOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 113
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 114
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestCancelledNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestCancelledNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 115
    return-void
.end method

.method public notifyObserversOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 93
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 94
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestFailedNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestFailedNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 95
    return-void
.end method

.method public notifyObserversOfRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 58
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 59
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestNotFoundNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestNotFoundNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 60
    return-void
.end method

.method public notifyObserversOfRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 6
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
    .line 135
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "requestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 136
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 137
    invoke-virtual {v0, p2}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setRequestListeners(Ljava/util/Set;)V

    .line 138
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 139
    return-void
.end method

.method public notifyObserversOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/RequestProgress;)V
    .registers 6
    .param p2, "requestProgress"    # Lcom/octo/android/robospice/request/listener/RequestProgress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/RequestProgress;",
            ")V"
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 124
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 125
    invoke-virtual {v0, p2}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setRequestProgress(Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 126
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProgressNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProgressNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 127
    return-void
.end method

.method public notifyObserversOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;-><init>()V

    .line 103
    .local v0, "requestProcessingContext":Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->setExecutionThread(Ljava/lang/Thread;)V

    .line 104
    new-instance v1, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestSucceededNotifier;

    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-direct {v1, p1, v2, v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestSucceededNotifier;-><init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    invoke-virtual {p0, v1}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->post(Ljava/lang/Runnable;)V

    .line 105
    return-void
.end method

.method protected onStopped()V
    .registers 1

    .prologue
    .line 155
    return-void
.end method

.method protected post(Ljava/lang/Runnable;)V
    .registers 5
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Message queue is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->messageQueue:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 148
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->messageQueue:Landroid/os/Handler;

    if-nez v0, :cond_20

    .line 152
    :goto_1f
    return-void

    .line 151
    :cond_20
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->messageQueue:Landroid/os/Handler;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    goto :goto_1f
.end method

.method public removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 40
    return-void
.end method
