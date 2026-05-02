.class Lorg/zeromq/ZThread$ShimThread;
.super Ljava/lang/Thread;
.source "ZThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ShimThread"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private args:[Ljava/lang/Object;

.field private attachedRunnable:Lorg/zeromq/ZThread$IAttachedRunnable;

.field private ctx:Lorg/zeromq/ZContext;

.field private detachedRunnable:Lorg/zeromq/ZThread$IDetachedRunnable;

.field private pipe:Lorg/zeromq/ZMQ$Socket;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    const-class v0, Lorg/zeromq/ZThread;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZThread$ShimThread;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZThread$IAttachedRunnable;[Ljava/lang/Object;Lorg/zeromq/ZMQ$Socket;)V
    .registers 6
    .param p1, "ctx"    # Lorg/zeromq/ZContext;
    .param p2, "runnable"    # Lorg/zeromq/ZThread$IAttachedRunnable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "pipe"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 50
    sget-boolean v0, Lorg/zeromq/ZThread$ShimThread;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 51
    :cond_f
    sget-boolean v0, Lorg/zeromq/ZThread$ShimThread;->$assertionsDisabled:Z

    if-nez v0, :cond_1b

    if-nez p4, :cond_1b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 52
    :cond_1b
    sget-boolean v0, Lorg/zeromq/ZThread$ShimThread;->$assertionsDisabled:Z

    if-nez v0, :cond_27

    if-nez p2, :cond_27

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 54
    :cond_27
    iput-object p1, p0, Lorg/zeromq/ZThread$ShimThread;->ctx:Lorg/zeromq/ZContext;

    .line 55
    iput-object p2, p0, Lorg/zeromq/ZThread$ShimThread;->attachedRunnable:Lorg/zeromq/ZThread$IAttachedRunnable;

    .line 56
    iput-object p3, p0, Lorg/zeromq/ZThread$ShimThread;->args:[Ljava/lang/Object;

    .line 57
    iput-object p4, p0, Lorg/zeromq/ZThread$ShimThread;->pipe:Lorg/zeromq/ZMQ$Socket;

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZThread$IDetachedRunnable;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "runnable"    # Lorg/zeromq/ZThread$IDetachedRunnable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 62
    sget-boolean v0, Lorg/zeromq/ZThread$ShimThread;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 63
    :cond_f
    iput-object p1, p0, Lorg/zeromq/ZThread$ShimThread;->detachedRunnable:Lorg/zeromq/ZThread$IDetachedRunnable;

    .line 64
    iput-object p2, p0, Lorg/zeromq/ZThread$ShimThread;->args:[Ljava/lang/Object;

    .line 65
    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 70
    iget-object v0, p0, Lorg/zeromq/ZThread$ShimThread;->attachedRunnable:Lorg/zeromq/ZThread$IAttachedRunnable;

    if-eqz v0, :cond_15

    .line 71
    iget-object v0, p0, Lorg/zeromq/ZThread$ShimThread;->attachedRunnable:Lorg/zeromq/ZThread$IAttachedRunnable;

    iget-object v1, p0, Lorg/zeromq/ZThread$ShimThread;->args:[Ljava/lang/Object;

    iget-object v2, p0, Lorg/zeromq/ZThread$ShimThread;->ctx:Lorg/zeromq/ZContext;

    iget-object v3, p0, Lorg/zeromq/ZThread$ShimThread;->pipe:Lorg/zeromq/ZMQ$Socket;

    invoke-interface {v0, v1, v2, v3}, Lorg/zeromq/ZThread$IAttachedRunnable;->run([Ljava/lang/Object;Lorg/zeromq/ZContext;Lorg/zeromq/ZMQ$Socket;)V

    .line 72
    iget-object v0, p0, Lorg/zeromq/ZThread$ShimThread;->ctx:Lorg/zeromq/ZContext;

    invoke-virtual {v0}, Lorg/zeromq/ZContext;->destroy()V

    .line 77
    :goto_14
    return-void

    .line 75
    :cond_15
    iget-object v0, p0, Lorg/zeromq/ZThread$ShimThread;->detachedRunnable:Lorg/zeromq/ZThread$IDetachedRunnable;

    iget-object v1, p0, Lorg/zeromq/ZThread$ShimThread;->args:[Ljava/lang/Object;

    invoke-interface {v0, v1}, Lorg/zeromq/ZThread$IDetachedRunnable;->run([Ljava/lang/Object;)V

    goto :goto_14
.end method
