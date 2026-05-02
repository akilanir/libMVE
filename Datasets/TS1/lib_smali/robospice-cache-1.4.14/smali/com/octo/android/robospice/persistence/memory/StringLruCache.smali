.class public Lcom/octo/android/robospice/persistence/memory/StringLruCache;
.super Lcom/octo/android/robospice/persistence/memory/LruCache;
.source "StringLruCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/persistence/memory/LruCache",
        "<",
        "Ljava/lang/Object;",
        "Lcom/octo/android/robospice/persistence/memory/CacheItem",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "maxSize"    # I

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/memory/LruCache;-><init>(I)V

    .line 15
    return-void
.end method


# virtual methods
.method protected sizeOf(Ljava/lang/Object;Lcom/octo/android/robospice/persistence/memory/CacheItem;)I
    .registers 5
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
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 20
    .local p2, "value":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<Ljava/lang/String;>;"
    invoke-virtual {p2}, Lcom/octo/android/robospice/persistence/memory/CacheItem;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 21
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    return v1
.end method

.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 12
    check-cast p2, Lcom/octo/android/robospice/persistence/memory/CacheItem;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/octo/android/robospice/persistence/memory/StringLruCache;->sizeOf(Ljava/lang/Object;Lcom/octo/android/robospice/persistence/memory/CacheItem;)I

    move-result v0

    return v0
.end method
