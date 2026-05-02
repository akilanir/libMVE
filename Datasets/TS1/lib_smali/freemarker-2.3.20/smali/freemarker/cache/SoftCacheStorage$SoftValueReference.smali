.class final Lfreemarker/cache/SoftCacheStorage$SoftValueReference;
.super Ljava/lang/ref/SoftReference;
.source "SoftCacheStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/cache/SoftCacheStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SoftValueReference"
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "queue"    # Ljava/lang/ref/ReferenceQueue;

    .prologue
    .line 148
    invoke-direct {p0, p2, p3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 149
    iput-object p1, p0, Lfreemarker/cache/SoftCacheStorage$SoftValueReference;->key:Ljava/lang/Object;

    .line 150
    return-void
.end method


# virtual methods
.method getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lfreemarker/cache/SoftCacheStorage$SoftValueReference;->key:Ljava/lang/Object;

    return-object v0
.end method
