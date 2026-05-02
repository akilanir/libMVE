.class public Lcom/octo/android/robospice/persistence/memory/LruCacheBitmapObjectPersister;
.super Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;
.source "LruCacheBitmapObjectPersister.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "lruCacheSize"    # I

    .prologue
    .line 15
    const-class v0, Landroid/graphics/Bitmap;

    new-instance v1, Lcom/octo/android/robospice/persistence/memory/BitmapLruCache;

    invoke-direct {v1, p1}, Lcom/octo/android/robospice/persistence/memory/BitmapLruCache;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;-><init>(Ljava/lang/Class;Lcom/octo/android/robospice/persistence/memory/LruCache;)V

    .line 16
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
            "Landroid/graphics/Bitmap;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p1, "decoratedPersister":Lcom/octo/android/robospice/persistence/ObjectPersister;, "Lcom/octo/android/robospice/persistence/ObjectPersister<Landroid/graphics/Bitmap;>;"
    new-instance v0, Lcom/octo/android/robospice/persistence/memory/BitmapLruCache;

    invoke-direct {v0, p2}, Lcom/octo/android/robospice/persistence/memory/BitmapLruCache;-><init>(I)V

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/persistence/memory/LruCacheObjectPersister;-><init>(Lcom/octo/android/robospice/persistence/ObjectPersister;Lcom/octo/android/robospice/persistence/memory/LruCache;)V

    .line 20
    return-void
.end method
