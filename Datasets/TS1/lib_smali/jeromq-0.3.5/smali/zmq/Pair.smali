.class public Lzmq/Pair;
.super Lzmq/SocketBase;
.source "Pair.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Pair$PairSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private pipe:Lzmq/Pipe;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lzmq/Pair;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Pair;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/Ctx;II)V
    .registers 6
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lzmq/SocketBase;-><init>(Lzmq/Ctx;II)V

    .line 39
    iget-object v0, p0, Lzmq/Pair;->options:Lzmq/Options;

    const/4 v1, 0x0

    iput v1, v0, Lzmq/Options;->type:I

    .line 40
    return-void
.end method


# virtual methods
.method protected xattachPipe(Lzmq/Pipe;Z)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "icanhasall"    # Z

    .prologue
    .line 45
    sget-boolean v0, Lzmq/Pair;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_c
    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    if-nez v0, :cond_13

    .line 50
    iput-object p1, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    .line 55
    :goto_12
    return-void

    .line 53
    :cond_13
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lzmq/Pipe;->terminate(Z)V

    goto :goto_12
.end method

.method protected xhasIn()Z
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->checkRead()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->checkWrite()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected xpipeTerminated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 60
    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    if-ne v0, p1, :cond_7

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    .line 63
    :cond_7
    return-void
.end method

.method protected xreadActivated(Lzmq/Pipe;)V
    .registers 2
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 70
    return-void
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 98
    iget-object v2, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    if-nez v2, :cond_15

    move-object v0, v1

    .line 99
    .local v0, "msg":Lzmq/Msg;
    :goto_6
    if-nez v0, :cond_14

    .line 101
    iget-object v2, p0, Lzmq/Pair;->errno:Lzmq/ValueReference;

    const/16 v3, 0x23

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move-object v0, v1

    .line 104
    .end local v0    # "msg":Lzmq/Msg;
    :cond_14
    return-object v0

    .line 98
    :cond_15
    iget-object v2, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    invoke-virtual {v2}, Lzmq/Pipe;->read()Lzmq/Msg;

    move-result-object v0

    goto :goto_6
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 82
    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    invoke-virtual {v0, p1}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v0

    if-nez v0, :cond_19

    .line 83
    :cond_c
    iget-object v0, p0, Lzmq/Pair;->errno:Lzmq/ValueReference;

    const/16 v1, 0x23

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    .line 84
    const/4 v0, 0x0

    .line 91
    :goto_18
    return v0

    .line 87
    :cond_19
    invoke-virtual {p1}, Lzmq/Msg;->flags()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_26

    .line 88
    iget-object v0, p0, Lzmq/Pair;->pipe:Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->flush()V

    .line 91
    :cond_26
    const/4 v0, 0x1

    goto :goto_18
.end method

.method protected xwriteActivated(Lzmq/Pipe;)V
    .registers 2
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 77
    return-void
.end method
