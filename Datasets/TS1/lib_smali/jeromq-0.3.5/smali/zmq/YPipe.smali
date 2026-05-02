.class public Lzmq/YPipe;
.super Ljava/lang/Object;
.source "YPipe.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final c:Ljava/util/concurrent/atomic/AtomicInteger;

.field private f:I

.field private final queue:Lzmq/YQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YQueue",
            "<TT;>;"
        }
    .end annotation
.end field

.field private r:I

.field private w:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    const-class v0, Lzmq/YPipe;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/YPipe;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(I)V
    .registers 5
    .param p1, "qsize"    # I

    .prologue
    .line 50
    .local p0, "this":Lzmq/YPipe;, "Lzmq/YPipe<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v1, Lzmq/YQueue;

    invoke-direct {v1, p1}, Lzmq/YQueue;-><init>(I)V

    iput-object v1, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    .line 52
    iget-object v1, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v1}, Lzmq/YQueue;->backPos()I

    move-result v0

    .line 53
    .local v0, "pos":I
    iput v0, p0, Lzmq/YPipe;->f:I

    .line 54
    iput v0, p0, Lzmq/YPipe;->r:I

    .line 55
    iput v0, p0, Lzmq/YPipe;->w:I

    .line 56
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v2, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v2}, Lzmq/YQueue;->backPos()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lzmq/YPipe;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    return-void
.end method


# virtual methods
.method public checkRead()Z
    .registers 5

    .prologue
    .local p0, "this":Lzmq/YPipe;, "Lzmq/YPipe<TT;>;"
    const/4 v1, 0x1

    const/4 v3, -0x1

    .line 117
    iget-object v2, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v2}, Lzmq/YQueue;->frontPos()I

    move-result v0

    .line 118
    .local v0, "h":I
    iget v2, p0, Lzmq/YPipe;->r:I

    if-eq v0, v2, :cond_d

    .line 143
    :cond_c
    :goto_c
    return v1

    .line 126
    :cond_d
    iget-object v2, p0, Lzmq/YPipe;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, v0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 138
    :goto_15
    iget v2, p0, Lzmq/YPipe;->r:I

    if-eq v0, v2, :cond_1d

    iget v2, p0, Lzmq/YPipe;->r:I

    if-ne v2, v3, :cond_c

    .line 139
    :cond_1d
    const/4 v1, 0x0

    goto :goto_c

    .line 131
    :cond_1f
    iget-object v2, p0, Lzmq/YPipe;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    iput v2, p0, Lzmq/YPipe;->r:I

    goto :goto_15
.end method

.method public flush()Z
    .registers 5

    .prologue
    .local p0, "this":Lzmq/YPipe;, "Lzmq/YPipe<TT;>;"
    const/4 v0, 0x1

    .line 91
    iget v1, p0, Lzmq/YPipe;->w:I

    iget v2, p0, Lzmq/YPipe;->f:I

    if-ne v1, v2, :cond_8

    .line 110
    :goto_7
    return v0

    .line 96
    :cond_8
    iget-object v1, p0, Lzmq/YPipe;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    iget v2, p0, Lzmq/YPipe;->w:I

    iget v3, p0, Lzmq/YPipe;->f:I

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-nez v1, :cond_21

    .line 102
    iget-object v0, p0, Lzmq/YPipe;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    iget v1, p0, Lzmq/YPipe;->f:I

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 103
    iget v0, p0, Lzmq/YPipe;->f:I

    iput v0, p0, Lzmq/YPipe;->w:I

    .line 104
    const/4 v0, 0x0

    goto :goto_7

    .line 109
    :cond_21
    iget v1, p0, Lzmq/YPipe;->f:I

    iput v1, p0, Lzmq/YPipe;->w:I

    goto :goto_7
.end method

.method public probe()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lzmq/YPipe;, "Lzmq/YPipe<TT;>;"
    invoke-virtual {p0}, Lzmq/YPipe;->checkRead()Z

    move-result v0

    .line 167
    .local v0, "rc":Z
    sget-boolean v1, Lzmq/YPipe;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    if-nez v0, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 169
    :cond_10
    iget-object v1, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v1}, Lzmq/YQueue;->front()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public read()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "this":Lzmq/YPipe;, "Lzmq/YPipe<TT;>;"
    invoke-virtual {p0}, Lzmq/YPipe;->checkRead()Z

    move-result v0

    if-nez v0, :cond_8

    .line 152
    const/4 v0, 0x0

    .line 158
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v0}, Lzmq/YQueue;->pop()Ljava/lang/Object;

    move-result-object v0

    goto :goto_7
.end method

.method public unwrite()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lzmq/YPipe;, "Lzmq/YPipe<TT;>;"
    iget v0, p0, Lzmq/YPipe;->f:I

    iget-object v1, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v1}, Lzmq/YQueue;->backPos()I

    move-result v1

    if-ne v0, v1, :cond_c

    .line 79
    const/4 v0, 0x0

    .line 82
    :goto_b
    return-object v0

    .line 81
    :cond_c
    iget-object v0, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v0}, Lzmq/YQueue;->unpush()V

    .line 82
    iget-object v0, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v0}, Lzmq/YQueue;->back()Ljava/lang/Object;

    move-result-object v0

    goto :goto_b
.end method

.method public write(Ljava/lang/Object;Z)V
    .registers 4
    .param p2, "incomplete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lzmq/YPipe;, "Lzmq/YPipe<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v0, p1}, Lzmq/YQueue;->push(Ljava/lang/Object;)V

    .line 69
    if-nez p2, :cond_f

    .line 70
    iget-object v0, p0, Lzmq/YPipe;->queue:Lzmq/YQueue;

    invoke-virtual {v0}, Lzmq/YQueue;->backPos()I

    move-result v0

    iput v0, p0, Lzmq/YPipe;->f:I

    .line 72
    :cond_f
    return-void
.end method
