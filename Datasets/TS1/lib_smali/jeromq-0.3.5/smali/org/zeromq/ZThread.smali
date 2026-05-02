.class public Lorg/zeromq/ZThread;
.super Ljava/lang/Object;
.source "ZThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZThread$ShimThread;,
        Lorg/zeromq/ZThread$IDetachedRunnable;,
        Lorg/zeromq/ZThread$IAttachedRunnable;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static varargs fork(Lorg/zeromq/ZContext;Lorg/zeromq/ZThread$IAttachedRunnable;[Ljava/lang/Object;)Lorg/zeromq/ZMQ$Socket;
    .registers 13
    .param p0, "ctx"    # Lorg/zeromq/ZContext;
    .param p1, "runnable"    # Lorg/zeromq/ZThread$IAttachedRunnable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 100
    invoke-virtual {p0, v8}, Lorg/zeromq/ZContext;->createSocket(I)Lorg/zeromq/ZMQ$Socket;

    move-result-object v2

    .line 102
    .local v2, "pipe":Lorg/zeromq/ZMQ$Socket;
    if-eqz v2, :cond_2a

    .line 103
    const-string v5, "inproc://zctx-pipe-%d"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/zeromq/ZMQ$Socket;->bind(Ljava/lang/String;)V

    .line 110
    invoke-static {p0}, Lorg/zeromq/ZContext;->shadow(Lorg/zeromq/ZContext;)Lorg/zeromq/ZContext;

    move-result-object v0

    .line 111
    .local v0, "ccontext":Lorg/zeromq/ZContext;
    invoke-virtual {v0, v8}, Lorg/zeromq/ZContext;->createSocket(I)Lorg/zeromq/ZMQ$Socket;

    move-result-object v1

    .line 112
    .local v1, "cpipe":Lorg/zeromq/ZMQ$Socket;
    if-nez v1, :cond_2c

    move-object v2, v4

    .line 121
    .end local v0    # "ccontext":Lorg/zeromq/ZContext;
    .end local v1    # "cpipe":Lorg/zeromq/ZMQ$Socket;
    .end local v2    # "pipe":Lorg/zeromq/ZMQ$Socket;
    :goto_29
    return-object v2

    .restart local v2    # "pipe":Lorg/zeromq/ZMQ$Socket;
    :cond_2a
    move-object v2, v4

    .line 106
    goto :goto_29

    .line 115
    .restart local v0    # "ccontext":Lorg/zeromq/ZContext;
    .restart local v1    # "cpipe":Lorg/zeromq/ZMQ$Socket;
    :cond_2c
    const-string v4, "inproc://zctx-pipe-%d"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/zeromq/ZMQ$Socket;->connect(Ljava/lang/String;)V

    .line 118
    new-instance v3, Lorg/zeromq/ZThread$ShimThread;

    invoke-direct {v3, v0, p1, p2, v1}, Lorg/zeromq/ZThread$ShimThread;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZThread$IAttachedRunnable;[Ljava/lang/Object;Lorg/zeromq/ZMQ$Socket;)V

    .line 119
    .local v3, "shim":Ljava/lang/Thread;
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_29
.end method

.method public static varargs start(Lorg/zeromq/ZThread$IDetachedRunnable;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "runnable"    # Lorg/zeromq/ZThread$IDetachedRunnable;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 88
    new-instance v0, Lorg/zeromq/ZThread$ShimThread;

    invoke-direct {v0, p0, p1}, Lorg/zeromq/ZThread$ShimThread;-><init>(Lorg/zeromq/ZThread$IDetachedRunnable;[Ljava/lang/Object;)V

    .line 89
    .local v0, "shim":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 90
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 91
    return-void
.end method
