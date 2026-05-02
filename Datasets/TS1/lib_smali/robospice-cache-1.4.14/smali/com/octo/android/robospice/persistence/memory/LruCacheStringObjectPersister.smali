.class public final Lcom/octo/android/robospice/persistence/memory/LruCacheStringObjectPersister;
.super Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;
.source "LruCacheStringObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "lruCacheSize"    # I

    .prologue
    .line 12
    const-class v0, Ljava/lang/String;

    new-instance v1, Lcom/octo/android/robospice/persistence/memory/StringLruCache;

    invoke-direct {v1, p1}, Lcom/octo/android/robospice/persistence/memory/StringLruCache;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;-><init>(Ljava/lang/Class;Lcom/octo/android/robospice/persistence/memory/LruCache;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/octo/android/robospice/persistence/ObjectPersister;I)V
    .registers 4
    .param p2, "lruCacheSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/persistence/ObjectPersister",
            "<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "decoratedPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<Ljava/lang/String;>;"
    new-instance v0, Lcom/octo/android/robospice/persistence/memory/StringLruCache;

    invoke-direct {v0, p2}, Lcom/octo/android/robospice/persistence/memory/StringLruCache;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;-><init>(Lcom/octo/android/robospice/persistence/ObjectPersister;Lcom/octo/android/robospice/persistence/memory/LruCache;)V

    .line 17
    return-void
.end method
