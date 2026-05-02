.class public Lcom/octo/android/robospice/persistence/memory/BitmapLruCache;
.super Lcom/octo/android/robospice/persistence/memory/LruCache;
.source "BitmapLruCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/persistence/memory/LruCache",
        "<",
        "Ljava/lang/Object;",
        "Lcom/octo/android/robospice/persistence/memory/CacheItem",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "maxSize"    # I

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/memory/LruCache;-><init>(I)V

    .line 16
    return-void
.end method


# virtual methods
.method protected sizeOf(Ljava/lang/Object;Lcom/octo/android/robospice/persistence/memory/CacheItem;)I
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/octo/android/robospice/persistence/memory/CacheItem",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 21
    .local p2, "value":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<Landroid/graphics/Bitmap;>;"
    invoke-virtual {p2}, Lcom/octo/android/robospice/persistence/memory/CacheItem;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 22
    .local v0, "data":Landroid/graphics/Bitmap;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xc

    if-ge v1, v2, :cond_16

    .line 23
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    .line 25
    :goto_15
    return v1

    :cond_16
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v1

    goto :goto_15
.end method

.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 13
    check-cast p2, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/octo/android/robospice/persistence/memory/BitmapLruCache;->sizeOf(Ljava/lang/Object;Lcom/octo/android/robospice/persistence/memory/CacheItem;)I

    move-result v0

    return v0
.end method
