.class abstract Lcom/google/common/cache/LocalCache$AbstractCacheSet;
.super Ljava/util/AbstractSet;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "AbstractCacheSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractSet",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final map:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<**>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/cache/LocalCache;


# direct methods
.method constructor <init>(Lcom/google/common/cache/LocalCache;Ljava/util/concurrent/ConcurrentMap;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentMap",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 4435
    .local p0, "this":Lcom/google/common/cache/LocalCache$AbstractCacheSet;, "Lcom/google/common/cache/LocalCache<TK;TV;>.AbstractCacheSet<TT;>;"
    .local p2, "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<**>;"
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$AbstractCacheSet;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 4436
    iput-object p2, p0, Lcom/google/common/cache/LocalCache$AbstractCacheSet;->map:Ljava/util/concurrent/ConcurrentMap;

    .line 4437
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 4451
    .local p0, "this":Lcom/google/common/cache/LocalCache$AbstractCacheSet;, "Lcom/google/common/cache/LocalCache<TK;TV;>.AbstractCacheSet<TT;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$AbstractCacheSet;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 4452
    return-void
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 4446
    .local p0, "this":Lcom/google/common/cache/LocalCache$AbstractCacheSet;, "Lcom/google/common/cache/LocalCache<TK;TV;>.AbstractCacheSet<TT;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$AbstractCacheSet;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 4441
    .local p0, "this":Lcom/google/common/cache/LocalCache$AbstractCacheSet;, "Lcom/google/common/cache/LocalCache<TK;TV;>.AbstractCacheSet<TT;>;"
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$AbstractCacheSet;->map:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    return v0
.end method
