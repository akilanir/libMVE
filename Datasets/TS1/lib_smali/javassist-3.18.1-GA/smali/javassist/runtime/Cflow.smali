.class public Ljavassist/runtime/Cflow;
.super Ljava/lang/ThreadLocal;
.source "Cflow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/runtime/Cflow$Depth;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 27
    return-void
.end method


# virtual methods
.method public enter()V
    .registers 2

    .prologue
    .line 42
    invoke-virtual {p0}, Ljavassist/runtime/Cflow;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/runtime/Cflow$Depth;

    invoke-virtual {v0}, Ljavassist/runtime/Cflow$Depth;->inc()V

    return-void
.end method

.method public exit()V
    .registers 2

    .prologue
    .line 47
    invoke-virtual {p0}, Ljavassist/runtime/Cflow;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/runtime/Cflow$Depth;

    invoke-virtual {v0}, Ljavassist/runtime/Cflow$Depth;->dec()V

    return-void
.end method

.method protected declared-synchronized initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 36
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljavassist/runtime/Cflow$Depth;

    invoke-direct {v0}, Ljavassist/runtime/Cflow$Depth;-><init>()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-object v0

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public value()I
    .registers 2

    .prologue
    .line 52
    invoke-virtual {p0}, Ljavassist/runtime/Cflow;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/runtime/Cflow$Depth;

    invoke-virtual {v0}, Ljavassist/runtime/Cflow$Depth;->get()I

    move-result v0

    return v0
.end method
