.class Lzmq/Pull;
.super Lzmq/SocketBase;
.source "Pull.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Pull$PullSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final fq:Lzmq/FQ;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lzmq/Pull;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Pull;->$assertionsDisabled:Z

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
    .line 39
    invoke-direct {p0, p1, p2, p3}, Lzmq/SocketBase;-><init>(Lzmq/Ctx;II)V

    .line 40
    iget-object v0, p0, Lzmq/Pull;->options:Lzmq/Options;

    const/4 v1, 0x7

    iput v1, v0, Lzmq/Options;->type:I

    .line 42
    new-instance v0, Lzmq/FQ;

    invoke-direct {v0}, Lzmq/FQ;-><init>()V

    iput-object v0, p0, Lzmq/Pull;->fq:Lzmq/FQ;

    .line 43
    return-void
.end method


# virtual methods
.method protected xattachPipe(Lzmq/Pipe;Z)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "icanhasall"    # Z

    .prologue
    .line 48
    sget-boolean v0, Lzmq/Pull;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_c
    iget-object v0, p0, Lzmq/Pull;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->attach(Lzmq/Pipe;)V

    .line 50
    return-void
.end method

.method protected xhasIn()Z
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lzmq/Pull;->fq:Lzmq/FQ;

    invoke-virtual {v0}, Lzmq/FQ;->hasIn()Z

    move-result v0

    return v0
.end method

.method protected xpipeTerminated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 61
    iget-object v0, p0, Lzmq/Pull;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->terminated(Lzmq/Pipe;)V

    .line 62
    return-void
.end method

.method protected xreadActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 55
    iget-object v0, p0, Lzmq/Pull;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->activated(Lzmq/Pipe;)V

    .line 56
    return-void
.end method

.method public xrecv()Lzmq/Msg;
    .registers 3

    .prologue
    .line 67
    iget-object v0, p0, Lzmq/Pull;->fq:Lzmq/FQ;

    iget-object v1, p0, Lzmq/Pull;->errno:Lzmq/ValueReference;

    invoke-virtual {v0, v1}, Lzmq/FQ;->recv(Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v0

    return-object v0
.end method
