.class public Lcom/octo/android/robospice/request/CachedSpiceRequest;
.super Lcom/octo/android/robospice/request/SpiceRequest;
.source "CachedSpiceRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RESU",
        "LT:Ljava/lang/Object;",
        ">",
        "Lcom/octo/android/robospice/request/SpiceRequest",
        "<TRESU",
        "LT;",
        ">;"
    }
.end annotation


# instance fields
.field private final cacheDuration:J

.field private isAcceptingDirtyCache:Z

.field private isOffline:Z

.field private isProcessable:Z

.field private requestCacheKey:Ljava/lang/Object;

.field private final spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/lang/Object;J)V
    .registers 6
    .param p2, "requestCacheKey"    # Ljava/lang/Object;
    .param p3, "cacheDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TRESU",
            "LT;",
            ">;",
            "Ljava/lang/Object;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    .local p1, "spiceRequest":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isProcessable:Z

    .line 31
    iput-object p2, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    .line 32
    iput-wide p3, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->cacheDuration:J

    .line 33
    iput-object p1, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    .line 34
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 86
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->cancel()V

    .line 87
    return-void
.end method

.method public compareTo(Lcom/octo/android/robospice/request/SpiceRequest;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TRESU",
            "LT;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    .local p1, "other":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    if-ne p0, p1, :cond_4

    .line 206
    const/4 v0, 0x0

    .line 212
    :goto_3
    return v0

    .line 208
    :cond_4
    if-nez p1, :cond_8

    .line 209
    const/4 v0, -0x1

    goto :goto_3

    .line 212
    :cond_8
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->compareTo(Lcom/octo/android/robospice/request/SpiceRequest;)I

    move-result v0

    goto :goto_3
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 20
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    check-cast p1, Lcom/octo/android/robospice/request/SpiceRequest;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->compareTo(Lcom/octo/android/robospice/request/SpiceRequest;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 177
    if-ne p0, p1, :cond_5

    .line 200
    :cond_4
    :goto_4
    return v1

    .line 180
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 181
    goto :goto_4

    .line 184
    :cond_9
    instance-of v3, p1, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    if-nez v3, :cond_f

    move v1, v2

    .line 185
    goto :goto_4

    :cond_f
    move-object v0, p1

    .line 187
    check-cast v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 188
    .local v0, "other":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v3, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v3}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v3

    if-nez v3, :cond_24

    iget-object v3, v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v3}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v3

    if-eqz v3, :cond_24

    move v1, v2

    .line 189
    goto :goto_4

    .line 191
    :cond_24
    iget-object v3, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v3}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v3

    iget-object v4, v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v4}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_38

    move v1, v2

    .line 192
    goto :goto_4

    .line 194
    :cond_38
    iget-object v3, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v3}, Lcom/octo/android/robospice/request/SpiceRequest;->isAggregatable()Z

    move-result v3

    iget-object v4, v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v4}, Lcom/octo/android/robospice/request/SpiceRequest;->isAggregatable()Z

    move-result v4

    if-eq v3, v4, :cond_48

    move v1, v2

    .line 195
    goto :goto_4

    .line 197
    :cond_48
    iget-object v3, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    if-eqz v3, :cond_56

    iget-object v3, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    iget-object v4, v0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_56
    move v1, v2

    .line 198
    goto :goto_4
.end method

.method public getCacheDuration()J
    .registers 3

    .prologue
    .line 114
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-wide v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->cacheDuration:J

    return-wide v0
.end method

.method public getPriority()I
    .registers 2

    .prologue
    .line 138
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->getPriority()I

    move-result v0

    return v0
.end method

.method getProgress()Lcom/octo/android/robospice/request/listener/RequestProgress;
    .registers 2

    .prologue
    .line 128
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->getProgress()Lcom/octo/android/robospice/request/listener/RequestProgress;

    move-result-object v0

    return-object v0
.end method

.method public getRequestCacheKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 110
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    return-object v0
.end method

.method public getResultType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getRetryPolicy()Lcom/octo/android/robospice/retry/RetryPolicy;
    .registers 2

    .prologue
    .line 38
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->getRetryPolicy()Lcom/octo/android/robospice/retry/RetryPolicy;

    move-result-object v0

    return-object v0
.end method

.method public getSpiceRequest()Lcom/octo/android/robospice/request/SpiceRequest;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    const/4 v3, 0x0

    .line 168
    const/16 v0, 0x1f

    .line 169
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 170
    .local v1, "result":I
    iget-object v2, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v2}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v2

    if-nez v2, :cond_18

    move v2, v3

    :goto_d
    add-int/lit8 v1, v2, 0x1f

    .line 171
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    if-nez v4, :cond_23

    :goto_15
    add-int v1, v2, v3

    .line 172
    return v1

    .line 170
    :cond_18
    iget-object v2, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v2}, Lcom/octo/android/robospice/request/SpiceRequest;->getResultType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_d

    .line 171
    :cond_23
    iget-object v3, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_15
.end method

.method public isAcceptingDirtyCache()Z
    .registers 2

    .prologue
    .line 142
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isAcceptingDirtyCache:Z

    return v0
.end method

.method public isAggregatable()Z
    .registers 2

    .prologue
    .line 58
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->isAggregatable()Z

    move-result v0

    return v0
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 91
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public isOffline()Z
    .registers 2

    .prologue
    .line 150
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isOffline:Z

    return v0
.end method

.method public isProcessable()Z
    .registers 2

    .prologue
    .line 67
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isProcessable:Z

    return v0
.end method

.method public loadDataFromNetwork()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TRESU",
            "LT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/SpiceRequest;->loadDataFromNetwork()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected publishProgress(F)V
    .registers 3
    .param p1, "progress"    # F

    .prologue
    .line 106
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->publishProgress(F)V

    .line 107
    return-void
.end method

.method public setAcceptingDirtyCache(Z)V
    .registers 2
    .param p1, "isAcceptingDirtyCache"    # Z

    .prologue
    .line 146
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iput-boolean p1, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isAcceptingDirtyCache:Z

    .line 147
    return-void
.end method

.method public setAggregatable(Z)V
    .registers 3
    .param p1, "isAggregatable"    # Z

    .prologue
    .line 63
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->setAggregatable(Z)V

    .line 64
    return-void
.end method

.method protected setFuture(Ljava/util/concurrent/Future;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->setFuture(Ljava/util/concurrent/Future;)V

    .line 82
    return-void
.end method

.method public setOffline(Z)V
    .registers 2
    .param p1, "isOffline"    # Z

    .prologue
    .line 154
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iput-boolean p1, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isOffline:Z

    .line 155
    return-void
.end method

.method public setPriority(I)V
    .registers 3
    .param p1, "priority"    # I

    .prologue
    .line 133
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->setPriority(I)V

    .line 134
    return-void
.end method

.method public setProcessable(Z)V
    .registers 2
    .param p1, "isProcessable"    # Z

    .prologue
    .line 71
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iput-boolean p1, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->isProcessable:Z

    .line 72
    return-void
.end method

.method public setRequestCancellationListener(Lcom/octo/android/robospice/request/listener/RequestCancellationListener;)V
    .registers 3
    .param p1, "requestCancellationListener"    # Lcom/octo/android/robospice/request/listener/RequestCancellationListener;

    .prologue
    .line 101
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->setRequestCancellationListener(Lcom/octo/android/robospice/request/listener/RequestCancellationListener;)V

    .line 102
    return-void
.end method

.method protected setRequestProgressListener(Lcom/octo/android/robospice/request/listener/RequestProgressListener;)V
    .registers 3
    .param p1, "requestProgressListener"    # Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    .prologue
    .line 96
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->setRequestProgressListener(Lcom/octo/android/robospice/request/listener/RequestProgressListener;)V

    .line 97
    return-void
.end method

.method public setRetryPolicy(Lcom/octo/android/robospice/retry/RetryPolicy;)V
    .registers 3
    .param p1, "retryPolicy"    # Lcom/octo/android/robospice/retry/RetryPolicy;

    .prologue
    .line 43
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->setRetryPolicy(Lcom/octo/android/robospice/retry/RetryPolicy;)V

    .line 44
    return-void
.end method

.method setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V
    .registers 3
    .param p1, "status"    # Lcom/octo/android/robospice/request/listener/RequestStatus;

    .prologue
    .line 123
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 124
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 159
    .local p0, "this":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<TRESULT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CachedSpiceRequest [requestCacheKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->requestCacheKey:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cacheDuration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->cacheDuration:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", spiceRequest="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/request/CachedSpiceRequest;->spiceRequest:Lcom/octo/android/robospice/request/SpiceRequest;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
