.class public Lorg/osmdroid/tileprovider/BitmapPool;
.super Ljava/lang/Object;
.source "BitmapPool.java"


# static fields
.field private static sInstance:Lorg/osmdroid/tileprovider/BitmapPool;


# instance fields
.field final mPool:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    return-void
.end method

.method public static getInstance()Lorg/osmdroid/tileprovider/BitmapPool;
    .registers 1

    .prologue
    .line 15
    sget-object v0, Lorg/osmdroid/tileprovider/BitmapPool;->sInstance:Lorg/osmdroid/tileprovider/BitmapPool;

    if-nez v0, :cond_b

    .line 16
    new-instance v0, Lorg/osmdroid/tileprovider/BitmapPool;

    invoke-direct {v0}, Lorg/osmdroid/tileprovider/BitmapPool;-><init>()V

    sput-object v0, Lorg/osmdroid/tileprovider/BitmapPool;->sInstance:Lorg/osmdroid/tileprovider/BitmapPool;

    .line 18
    :cond_b
    sget-object v0, Lorg/osmdroid/tileprovider/BitmapPool;->sInstance:Lorg/osmdroid/tileprovider/BitmapPool;

    return-object v0
.end method


# virtual methods
.method public applyReusableOptions(Landroid/graphics/BitmapFactory$Options;)V
    .registers 5
    .param p1, "aBitmapOptions"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v2, 0x1

    .line 30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_11

    .line 31
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/BitmapPool;->obtainBitmapFromPool()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 32
    iput v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 33
    iput-boolean v2, p1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    .line 35
    :cond_11
    return-void
.end method

.method public clearBitmapPool()V
    .registers 4

    .prologue
    .line 73
    sget-object v1, Lorg/osmdroid/tileprovider/BitmapPool;->sInstance:Lorg/osmdroid/tileprovider/BitmapPool;

    iget-object v2, v1, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    monitor-enter v2

    .line 74
    :goto_5
    :try_start_5
    sget-object v1, Lorg/osmdroid/tileprovider/BitmapPool;->sInstance:Lorg/osmdroid/tileprovider/BitmapPool;

    iget-object v1, v1, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_20

    .line 75
    sget-object v1, Lorg/osmdroid/tileprovider/BitmapPool;->sInstance:Lorg/osmdroid/tileprovider/BitmapPool;

    iget-object v1, v1, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 76
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_5

    .line 78
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_1d
    move-exception v1

    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_5 .. :try_end_1f} :catchall_1d

    throw v1

    :cond_20
    :try_start_20
    monitor-exit v2
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1d

    .line 79
    return-void
.end method

.method public obtainBitmapFromPool()Landroid/graphics/Bitmap;
    .registers 4

    .prologue
    .line 38
    iget-object v2, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    monitor-enter v2

    .line 39
    :try_start_3
    iget-object v1, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 40
    const/4 v0, 0x0

    monitor-exit v2

    .line 46
    :goto_d
    return-object v0

    .line 42
    :cond_e
    iget-object v1, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 43
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_25

    .line 44
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/BitmapPool;->obtainBitmapFromPool()Landroid/graphics/Bitmap;

    move-result-object v0

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    monitor-exit v2

    goto :goto_d

    .line 49
    :catchall_22
    move-exception v1

    monitor-exit v2
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_22

    throw v1

    .line 46
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_25
    :try_start_25
    monitor-exit v2
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_22

    goto :goto_d
.end method

.method public obtainSizedBitmapFromPool(II)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "aWidth"    # I
    .param p2, "aHeight"    # I

    .prologue
    const/4 v2, 0x0

    .line 53
    iget-object v3, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    monitor-enter v3

    .line 54
    :try_start_4
    iget-object v4, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_f

    .line 55
    monitor-exit v3

    move-object v0, v2

    .line 69
    :goto_e
    return-object v0

    .line 57
    :cond_f
    iget-object v4, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_48

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 58
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    if-eqz v4, :cond_35

    .line 59
    iget-object v2, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 60
    invoke-virtual {p0, p1, p2}, Lorg/osmdroid/tileprovider/BitmapPool;->obtainSizedBitmapFromPool(II)Landroid/graphics/Bitmap;

    move-result-object v0

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    monitor-exit v3

    goto :goto_e

    .line 67
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_32
    move-exception v2

    monitor-exit v3
    :try_end_34
    .catchall {:try_start_4 .. :try_end_34} :catchall_32

    throw v2

    .line 61
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_35
    :try_start_35
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v4, p1, :cond_15

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-ne v4, p2, :cond_15

    .line 62
    iget-object v2, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 63
    monitor-exit v3

    goto :goto_e

    .line 67
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_48
    monitor-exit v3
    :try_end_49
    .catchall {:try_start_35 .. :try_end_49} :catchall_32

    move-object v0, v2

    .line 69
    goto :goto_e
.end method

.method public returnDrawableToPool(Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;)V
    .registers 5
    .param p1, "drawable"    # Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    .prologue
    .line 22
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;->tryRecycle()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 23
    .local v0, "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_15

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 24
    iget-object v2, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    monitor-enter v2

    .line 25
    :try_start_f
    iget-object v1, p0, Lorg/osmdroid/tileprovider/BitmapPool;->mPool:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 26
    monitor-exit v2

    .line 27
    :cond_15
    return-void

    .line 26
    :catchall_16
    move-exception v1

    monitor-exit v2
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_16

    throw v1
.end method
