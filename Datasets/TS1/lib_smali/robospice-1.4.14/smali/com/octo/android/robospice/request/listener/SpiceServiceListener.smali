.class public interface abstract Lcom/octo/android/robospice/request/listener/SpiceServiceListener;
.super Ljava/lang/Object;
.source "SpiceServiceListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    }
.end annotation


# virtual methods
.method public abstract onRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onRequestCancelled(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onRequestFailed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onRequestProgressUpdated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onRequestSucceeded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onServiceStopped()V
.end method
