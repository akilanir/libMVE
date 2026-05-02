.class public Lzmq/Pull$PullSession;
.super Lzmq/SessionBase;
.source "Pull.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Pull;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PullSession"
.end annotation


# direct methods
.method public constructor <init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V
    .registers 6
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "connect"    # Z
    .param p3, "socket"    # Lzmq/SocketBase;
    .param p4, "options"    # Lzmq/Options;
    .param p5, "addr"    # Lzmq/Address;

    .prologue
    .line 30
    invoke-direct/range {p0 .. p5}, Lzmq/SessionBase;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 31
    return-void
.end method


# virtual methods
.method public bridge synthetic acceptEvent()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->acceptEvent()V

    return-void
.end method

.method public bridge synthetic attachPipe(Lzmq/Pipe;)V
    .registers 2
    .param p1, "x0"    # Lzmq/Pipe;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->attachPipe(Lzmq/Pipe;)V

    return-void
.end method

.method public bridge synthetic connectEvent()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->connectEvent()V

    return-void
.end method

.method public bridge synthetic destroy()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->destroy()V

    return-void
.end method

.method public bridge synthetic detach()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->detach()V

    return-void
.end method

.method public bridge synthetic flush()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->flush()V

    return-void
.end method

.method public bridge synthetic getSocket()Lzmq/SocketBase;
    .registers 2

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->getSocket()Lzmq/SocketBase;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hiccuped(Lzmq/Pipe;)V
    .registers 2
    .param p1, "x0"    # Lzmq/Pipe;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->hiccuped(Lzmq/Pipe;)V

    return-void
.end method

.method public bridge synthetic inEvent()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->inEvent()V

    return-void
.end method

.method public bridge synthetic outEvent()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->outEvent()V

    return-void
.end method

.method public bridge synthetic pipeTerminated(Lzmq/Pipe;)V
    .registers 2
    .param p1, "x0"    # Lzmq/Pipe;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->pipeTerminated(Lzmq/Pipe;)V

    return-void
.end method

.method public bridge synthetic pullMsg()Lzmq/Msg;
    .registers 2

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->pullMsg()Lzmq/Msg;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic pushMsg(Lzmq/Msg;)I
    .registers 3
    .param p1, "x0"    # Lzmq/Msg;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->pushMsg(Lzmq/Msg;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic readActivated(Lzmq/Pipe;)V
    .registers 2
    .param p1, "x0"    # Lzmq/Pipe;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->readActivated(Lzmq/Pipe;)V

    return-void
.end method

.method public bridge synthetic registerTermAcks(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->registerTermAcks(I)V

    return-void
.end method

.method public bridge synthetic timerEvent(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->timerEvent(I)V

    return-void
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic unregisterTermAck()V
    .registers 1

    .prologue
    .line 24
    invoke-super {p0}, Lzmq/SessionBase;->unregisterTermAck()V

    return-void
.end method

.method public bridge synthetic writeActivated(Lzmq/Pipe;)V
    .registers 2
    .param p1, "x0"    # Lzmq/Pipe;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lzmq/SessionBase;->writeActivated(Lzmq/Pipe;)V

    return-void
.end method
