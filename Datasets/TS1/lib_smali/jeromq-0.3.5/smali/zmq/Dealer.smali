.class public Lzmq/Dealer;
.super Lzmq/SocketBase;
.source "Dealer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Dealer$DealerSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final fq:Lzmq/FQ;

.field private final lb:Lzmq/LB;

.field private prefetched:Z

.field private prefetchedMsg:Lzmq/Msg;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lzmq/Dealer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Dealer;->$assertionsDisabled:Z

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
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lzmq/SocketBase;-><init>(Lzmq/Ctx;II)V

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/Dealer;->prefetched:Z

    .line 50
    iget-object v0, p0, Lzmq/Dealer;->options:Lzmq/Options;

    const/4 v1, 0x5

    iput v1, v0, Lzmq/Options;->type:I

    .line 52
    new-instance v0, Lzmq/FQ;

    invoke-direct {v0}, Lzmq/FQ;-><init>()V

    iput-object v0, p0, Lzmq/Dealer;->fq:Lzmq/FQ;

    .line 53
    new-instance v0, Lzmq/LB;

    invoke-direct {v0}, Lzmq/LB;-><init>()V

    iput-object v0, p0, Lzmq/Dealer;->lb:Lzmq/LB;

    .line 60
    iget-object v0, p0, Lzmq/Dealer;->options:Lzmq/Options;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lzmq/Options;->recvIdentity:Z

    .line 61
    return-void
.end method

.method private xxrecv()Lzmq/Msg;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 85
    const/4 v0, 0x0

    .line 87
    .local v0, "msg":Lzmq/Msg;
    iget-boolean v2, p0, Lzmq/Dealer;->prefetched:Z

    if-eqz v2, :cond_f

    .line 88
    iget-object v0, p0, Lzmq/Dealer;->prefetchedMsg:Lzmq/Msg;

    .line 89
    const/4 v2, 0x0

    iput-boolean v2, p0, Lzmq/Dealer;->prefetched:Z

    .line 90
    iput-object v1, p0, Lzmq/Dealer;->prefetchedMsg:Lzmq/Msg;

    move-object v1, v0

    .line 104
    :cond_e
    :goto_e
    return-object v1

    .line 96
    :cond_f
    iget-object v2, p0, Lzmq/Dealer;->fq:Lzmq/FQ;

    iget-object v3, p0, Lzmq/Dealer;->errno:Lzmq/ValueReference;

    invoke-virtual {v2, v3}, Lzmq/FQ;->recv(Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v0

    .line 97
    if-eqz v0, :cond_e

    .line 100
    invoke-virtual {v0}, Lzmq/Msg;->flags()I

    move-result v2

    and-int/lit8 v2, v2, 0x40

    if-nez v2, :cond_f

    move-object v1, v0

    .line 104
    goto :goto_e
.end method


# virtual methods
.method protected xattachPipe(Lzmq/Pipe;Z)V
    .registers 4
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "icanhasall"    # Z

    .prologue
    .line 66
    sget-boolean v0, Lzmq/Dealer;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 67
    :cond_c
    iget-object v0, p0, Lzmq/Dealer;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->attach(Lzmq/Pipe;)V

    .line 68
    iget-object v0, p0, Lzmq/Dealer;->lb:Lzmq/LB;

    invoke-virtual {v0, p1}, Lzmq/LB;->attach(Lzmq/Pipe;)V

    .line 69
    return-void
.end method

.method protected xhasIn()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 111
    iget-boolean v1, p0, Lzmq/Dealer;->prefetched:Z

    if-eqz v1, :cond_6

    .line 121
    :goto_5
    return v0

    .line 116
    :cond_6
    invoke-direct {p0}, Lzmq/Dealer;->xxrecv()Lzmq/Msg;

    move-result-object v1

    iput-object v1, p0, Lzmq/Dealer;->prefetchedMsg:Lzmq/Msg;

    .line 117
    iget-object v1, p0, Lzmq/Dealer;->prefetchedMsg:Lzmq/Msg;

    if-nez v1, :cond_12

    .line 118
    const/4 v0, 0x0

    goto :goto_5

    .line 120
    :cond_12
    iput-boolean v0, p0, Lzmq/Dealer;->prefetched:Z

    goto :goto_5
.end method

.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lzmq/Dealer;->lb:Lzmq/LB;

    invoke-virtual {v0}, Lzmq/LB;->hasOut()Z

    move-result v0

    return v0
.end method

.method protected xpipeTerminated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 145
    iget-object v0, p0, Lzmq/Dealer;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->terminated(Lzmq/Pipe;)V

    .line 146
    iget-object v0, p0, Lzmq/Dealer;->lb:Lzmq/LB;

    invoke-virtual {v0, p1}, Lzmq/LB;->terminated(Lzmq/Pipe;)V

    .line 147
    return-void
.end method

.method protected xreadActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 133
    iget-object v0, p0, Lzmq/Dealer;->fq:Lzmq/FQ;

    invoke-virtual {v0, p1}, Lzmq/FQ;->activated(Lzmq/Pipe;)V

    .line 134
    return-void
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 2

    .prologue
    .line 80
    invoke-direct {p0}, Lzmq/Dealer;->xxrecv()Lzmq/Msg;

    move-result-object v0

    return-object v0
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 74
    iget-object v0, p0, Lzmq/Dealer;->lb:Lzmq/LB;

    iget-object v1, p0, Lzmq/Dealer;->errno:Lzmq/ValueReference;

    invoke-virtual {v0, p1, v1}, Lzmq/LB;->send(Lzmq/Msg;Lzmq/ValueReference;)Z

    move-result v0

    return v0
.end method

.method protected xwriteActivated(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 139
    iget-object v0, p0, Lzmq/Dealer;->lb:Lzmq/LB;

    invoke-virtual {v0, p1}, Lzmq/LB;->activated(Lzmq/Pipe;)V

    .line 140
    return-void
.end method
