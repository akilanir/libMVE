.class public interface abstract Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;
.super Ljava/lang/Object;
.source "RequestListenerNotifier.java"


# virtual methods
.method public abstract clearNotificationsForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
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
.end method

.method public abstract notifyListenersOfRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
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
.end method

.method public abstract notifyListenersOfRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
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
.end method

.method public abstract notifyListenersOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
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
.end method

.method public abstract notifyListenersOfRequestFailure(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;Ljava/util/Set;)V
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
.end method

.method public abstract notifyListenersOfRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
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
.end method

.method public abstract notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V
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
.end method

.method public abstract notifyListenersOfRequestSuccess(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/lang/Object;Ljava/util/Set;)V
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
.end method
