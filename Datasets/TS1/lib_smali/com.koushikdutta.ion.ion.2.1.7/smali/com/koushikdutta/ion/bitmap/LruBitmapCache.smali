.class Lcom/koushikdutta/ion/bitmap/LruBitmapCache;
.super Lcom/koushikdutta/async/util/LruCache;
.source "LruBitmapCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/util/LruCache",
        "<",
        "Ljava/lang/String;",
        "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private soft:Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable",
            "<",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "maxSize"    # I

    .prologue
    .line 13
    int-to-long v0, p1

    invoke-direct {p0, v0, v1}, Lcom/koushikdutta/async/util/LruCache;-><init>(J)V

    .line 6
    new-instance v0, Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;

    invoke-direct {v0}, Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->soft:Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;

    .line 14
    return-void
.end method


# virtual methods
.method protected bridge synthetic entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "x0"    # Z
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Ljava/lang/Object;
    .param p4, "x3"    # Ljava/lang/Object;

    .prologue
    .line 5
    check-cast p2, Ljava/lang/String;

    .end local p2    # "x1":Ljava/lang/Object;
    check-cast p3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local p3    # "x2":Ljava/lang/Object;
    check-cast p4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local p4    # "x3":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->entryRemoved(ZLjava/lang/String;Lcom/koushikdutta/ion/bitmap/BitmapInfo;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    return-void
.end method

.method protected entryRemoved(ZLjava/lang/String;Lcom/koushikdutta/ion/bitmap/BitmapInfo;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 6
    .param p1, "evicted"    # Z
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "oldValue"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .param p4, "newValue"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 48
    invoke-super {p0, p1, p2, p3, p4}, Lcom/koushikdutta/async/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    if-eqz p1, :cond_a

    .line 52
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->soft:Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;

    invoke-virtual {v0, p2, p3}, Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    :cond_a
    return-void
.end method

.method public evictAllBitmapInfo()V
    .registers 2

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->evictAll()V

    .line 43
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->soft:Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;

    invoke-virtual {v0}, Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;->clear()V

    .line 44
    return-void
.end method

.method public getBitmapInfo(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 23
    .local v0, "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v0, :cond_a

    move-object v1, v0

    .line 30
    .end local v0    # "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .local v1, "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :goto_9
    return-object v1

    .line 26
    .end local v1    # "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .restart local v0    # "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_a
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->soft:Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;

    invoke-virtual {v2, p1}, Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    check-cast v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 27
    .restart local v0    # "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v0, :cond_17

    .line 28
    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    move-object v1, v0

    .line 30
    .end local v0    # "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .restart local v1    # "ret":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    goto :goto_9
.end method

.method public putSoft(Ljava/lang/String;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 9
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->soft:Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    return-void
.end method

.method public removeBitmapInfo(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 34
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->soft:Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;

    invoke-virtual {v2, p1}, Lcom/koushikdutta/ion/bitmap/SoftReferenceHashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 35
    .local v0, "i1":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 36
    .local v1, "i2":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v1, :cond_11

    .line 38
    .end local v1    # "i2":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :goto_10
    return-object v1

    .restart local v1    # "i2":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_11
    move-object v1, v0

    goto :goto_10
.end method

.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)J
    .registers 5
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 5
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/bitmap/LruBitmapCache;->sizeOf(Ljava/lang/String;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected sizeOf(Ljava/lang/String;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)J
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "info"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 18
    invoke-virtual {p2}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->sizeOf()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method
