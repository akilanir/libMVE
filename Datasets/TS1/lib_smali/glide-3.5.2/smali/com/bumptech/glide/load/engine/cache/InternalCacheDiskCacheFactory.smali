.class public final Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;
.super Ljava/lang/Object;
.source "InternalCacheDiskCacheFactory.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;


# instance fields
.field private final context:Landroid/content/Context;

.field private final diskCacheName:Ljava/lang/String;

.field private final diskCacheSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "diskCacheSize"    # I

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "diskCacheName"    # Ljava/lang/String;
    .param p3, "diskCacheSize"    # I

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->context:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->diskCacheName:Ljava/lang/String;

    .line 25
    iput p3, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->diskCacheSize:I

    .line 26
    return-void
.end method


# virtual methods
.method public build()Lcom/bumptech/glide/load/engine/cache/DiskCache;
    .registers 5

    .prologue
    .line 30
    const/4 v1, 0x0

    .line 33
    .local v1, "diskCache":Lcom/bumptech/glide/load/engine/cache/DiskCache;
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->diskCacheName:Ljava/lang/String;

    if-eqz v2, :cond_1d

    .line 34
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->diskCacheName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/bumptech/glide/Glide;->getPhotoCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 39
    .local v0, "cacheDir":Ljava/io/File;
    :goto_d
    if-eqz v0, :cond_15

    .line 40
    iget v2, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->diskCacheSize:I

    invoke-static {v0, v2}, Lcom/bumptech/glide/load/engine/cache/DiskLruCacheWrapper;->get(Ljava/io/File;I)Lcom/bumptech/glide/load/engine/cache/DiskCache;

    move-result-object v1

    .line 43
    :cond_15
    if-nez v1, :cond_1c

    .line 44
    new-instance v1, Lcom/bumptech/glide/load/engine/cache/DiskCacheAdapter;

    .end local v1    # "diskCache":Lcom/bumptech/glide/load/engine/cache/DiskCache;
    invoke-direct {v1}, Lcom/bumptech/glide/load/engine/cache/DiskCacheAdapter;-><init>()V

    .line 46
    .restart local v1    # "diskCache":Lcom/bumptech/glide/load/engine/cache/DiskCache;
    :cond_1c
    return-object v1

    .line 36
    .end local v0    # "cacheDir":Ljava/io/File;
    :cond_1d
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/bumptech/glide/Glide;->getPhotoCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .restart local v0    # "cacheDir":Ljava/io/File;
    goto :goto_d
.end method
