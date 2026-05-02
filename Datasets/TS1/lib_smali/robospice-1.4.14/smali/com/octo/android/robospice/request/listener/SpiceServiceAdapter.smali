.class public Lcom/octo/android/robospice/request/listener/SpiceServiceAdapter;
.super Ljava/lang/Object;
.source "SpiceServiceAdapter.java"

# interfaces
.implements Lcom/octo/android/robospice/request/listener/SpiceServiceListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onRequestCancelled(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onRequestFailed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 18
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onRequestProgressUpdated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onRequestSucceeded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 3
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 14
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    return-void
.end method

.method public onServiceStopped()V
    .registers 1

    .prologue
    .line 46
    return-void
.end method
