.class public Lcom/octo/android/robospice/persistence/memory/CacheItem;
.super Ljava/lang/Object;
.source "CacheItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final creationDate:J

.field private final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLjava/lang/Object;)V
    .registers 4
    .param p1, "creationDate"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTT;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    .local p3, "data":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-wide p1, p0, Lcom/octo/android/robospice/persistence/memory/CacheItem;->creationDate:J

    .line 20
    iput-object p3, p0, Lcom/octo/android/robospice/persistence/memory/CacheItem;->data:Ljava/lang/Object;

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/octo/android/robospice/persistence/memory/CacheItem;->creationDate:J

    .line 15
    iput-object p1, p0, Lcom/octo/android/robospice/persistence/memory/CacheItem;->data:Ljava/lang/Object;

    .line 16
    return-void
.end method


# virtual methods
.method public getCreationDate()J
    .registers 3

    .prologue
    .line 24
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    iget-wide v0, p0, Lcom/octo/android/robospice/persistence/memory/CacheItem;->creationDate:J

    return-wide v0
.end method

.method public getData()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/octo/android/robospice/persistence/memory/CacheItem;, "Lcom/octo/android/robospice/persistence/memory/CacheItem<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/persistence/memory/CacheItem;->data:Ljava/lang/Object;

    return-object v0
.end method
