.class public Lfreemarker/cache/NullCacheStorage;
.super Ljava/lang/Object;
.source "NullCacheStorage.java"

# interfaces
.implements Lfreemarker/cache/ConcurrentCacheStorage;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .prologue
    .line 83
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 70
    const/4 v0, 0x0

    return-object v0
.end method

.method public isConcurrent()Z
    .registers 2

    .prologue
    .line 66
    const/4 v0, 0x1

    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 75
    return-void
.end method

.method public remove(Ljava/lang/Object;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 79
    return-void
.end method
