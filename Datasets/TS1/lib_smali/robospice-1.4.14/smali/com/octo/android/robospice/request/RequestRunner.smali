.class public interface abstract Lcom/octo/android/robospice/request/RequestRunner;
.super Ljava/lang/Object;
.source "RequestRunner.java"


# virtual methods
.method public abstract executeRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;)V"
        }
    .end annotation
.end method

.method public abstract isFailOnCacheError()Z
.end method

.method public abstract setFailOnCacheError(Z)V
.end method

.method public abstract shouldStop()V
.end method
