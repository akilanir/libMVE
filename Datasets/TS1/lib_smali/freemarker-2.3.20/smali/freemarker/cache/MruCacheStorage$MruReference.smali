.class Lfreemarker/cache/MruCacheStorage$MruReference;
.super Ljava/lang/ref/SoftReference;
.source "MruCacheStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/cache/MruCacheStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MruReference"
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lfreemarker/cache/MruCacheStorage$MruEntry;Ljava/lang/ref/ReferenceQueue;)V
    .registers 4
    .param p1, "entry"    # Lfreemarker/cache/MruCacheStorage$MruEntry;
    .param p2, "queue"    # Ljava/lang/ref/ReferenceQueue;

    .prologue
    .line 303
    invoke-virtual {p1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 304
    invoke-virtual {p1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruReference;->key:Ljava/lang/Object;

    .line 305
    return-void
.end method


# virtual methods
.method getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 308
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage$MruReference;->key:Ljava/lang/Object;

    return-object v0
.end method
