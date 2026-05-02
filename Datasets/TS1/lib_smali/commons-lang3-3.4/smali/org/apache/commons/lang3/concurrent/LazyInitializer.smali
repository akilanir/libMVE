.class public abstract Lorg/apache/commons/lang3/concurrent/LazyInitializer;
.super Ljava/lang/Object;
.source "LazyInitializer.java"

# interfaces
.implements Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private volatile object:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 81
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/LazyInitializer;, "Lorg/apache/commons/lang3/concurrent/LazyInitializer<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lorg/apache/commons/lang3/concurrent/LazyInitializer;, "Lorg/apache/commons/lang3/concurrent/LazyInitializer<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/LazyInitializer;->object:Ljava/lang/Object;

    .line 99
    .local v0, "result":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_10

    .line 100
    monitor-enter p0

    .line 101
    :try_start_5
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/LazyInitializer;->object:Ljava/lang/Object;

    .line 102
    if-nez v0, :cond_f

    .line 103
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/LazyInitializer;->initialize()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang3/concurrent/LazyInitializer;->object:Ljava/lang/Object;

    .line 105
    :cond_f
    monitor-exit p0

    .line 108
    :cond_10
    return-object v0

    .line 105
    :catchall_11
    move-exception v1

    monitor-exit p0
    :try_end_13
    .catchall {:try_start_5 .. :try_end_13} :catchall_11

    throw v1
.end method

.method protected abstract initialize()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation
.end method
