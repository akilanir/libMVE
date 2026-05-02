.class public Lzmq/IOObject;
.super Ljava/lang/Object;
.source "IOObject.java"

# interfaces
.implements Lzmq/IPollEvents;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private handler:Lzmq/IPollEvents;

.field private poller:Lzmq/Poller;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-class v0, Lzmq/IOObject;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/IOObject;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/IOThread;)V
    .registers 2
    .param p1, "ioThread"    # Lzmq/IOThread;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    if-eqz p1, :cond_8

    .line 36
    invoke-virtual {p0, p1}, Lzmq/IOObject;->plug(Lzmq/IOThread;)V

    .line 38
    :cond_8
    return-void
.end method


# virtual methods
.method public final acceptEvent()V
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lzmq/IOObject;->handler:Lzmq/IPollEvents;

    invoke-interface {v0}, Lzmq/IPollEvents;->acceptEvent()V

    .line 124
    return-void
.end method

.method public final addHandle(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 64
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1, p0}, Lzmq/Poller;->addHandle(Ljava/nio/channels/SelectableChannel;Lzmq/IPollEvents;)V

    .line 65
    return-void
.end method

.method public final addTimer(JI)V
    .registers 5
    .param p1, "timeout"    # J
    .param p3, "id"    # I

    .prologue
    .line 134
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1, p2, p0, p3}, Lzmq/Poller;->addTimer(JLzmq/IPollEvents;I)V

    .line 135
    return-void
.end method

.method public cancelTimer(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 144
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p0, p1}, Lzmq/Poller;->cancelTimer(Lzmq/IPollEvents;I)V

    .line 145
    return-void
.end method

.method public final connectEvent()V
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lzmq/IOObject;->handler:Lzmq/IPollEvents;

    invoke-interface {v0}, Lzmq/IPollEvents;->connectEvent()V

    .line 118
    return-void
.end method

.method public final inEvent()V
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lzmq/IOObject;->handler:Lzmq/IPollEvents;

    invoke-interface {v0}, Lzmq/IPollEvents;->inEvent()V

    .line 106
    return-void
.end method

.method public final outEvent()V
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lzmq/IOObject;->handler:Lzmq/IPollEvents;

    invoke-interface {v0}, Lzmq/IPollEvents;->outEvent()V

    .line 112
    return-void
.end method

.method public plug(Lzmq/IOThread;)V
    .registers 3
    .param p1, "ioThread"    # Lzmq/IOThread;

    .prologue
    .line 45
    sget-boolean v0, Lzmq/IOObject;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 46
    :cond_c
    sget-boolean v0, Lzmq/IOObject;->$assertionsDisabled:Z

    if-nez v0, :cond_1a

    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    if-eqz v0, :cond_1a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_1a
    invoke-virtual {p1}, Lzmq/IOThread;->getPoller()Lzmq/Poller;

    move-result-object v0

    iput-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    .line 50
    return-void
.end method

.method public final removeHandle(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 69
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1}, Lzmq/Poller;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 70
    return-void
.end method

.method public final resetPollIn(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 94
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1}, Lzmq/Poller;->resetPollOn(Ljava/nio/channels/SelectableChannel;)V

    .line 95
    return-void
.end method

.method public final resetPollOut(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 99
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1}, Lzmq/Poller;->resetPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 100
    return-void
.end method

.method public final setHandler(Lzmq/IPollEvents;)V
    .registers 2
    .param p1, "handler"    # Lzmq/IPollEvents;

    .prologue
    .line 139
    iput-object p1, p0, Lzmq/IOObject;->handler:Lzmq/IPollEvents;

    .line 140
    return-void
.end method

.method public final setPollAccept(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 89
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1}, Lzmq/Poller;->setPollAccept(Ljava/nio/channels/SelectableChannel;)V

    .line 90
    return-void
.end method

.method public final setPollConnect(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 84
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1}, Lzmq/Poller;->setPollConnect(Ljava/nio/channels/SelectableChannel;)V

    .line 85
    return-void
.end method

.method public final setPollIn(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 74
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1}, Lzmq/Poller;->setPollIn(Ljava/nio/channels/SelectableChannel;)V

    .line 75
    return-void
.end method

.method public final setPollOut(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 79
    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    invoke-virtual {v0, p1}, Lzmq/Poller;->setPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 80
    return-void
.end method

.method public final timerEvent(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 129
    iget-object v0, p0, Lzmq/IOObject;->handler:Lzmq/IPollEvents;

    invoke-interface {v0, p1}, Lzmq/IPollEvents;->timerEvent(I)V

    .line 130
    return-void
.end method

.method public unplug()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 54
    sget-boolean v0, Lzmq/IOObject;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    if-nez v0, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 58
    :cond_f
    iput-object v1, p0, Lzmq/IOObject;->poller:Lzmq/Poller;

    .line 59
    iput-object v1, p0, Lzmq/IOObject;->handler:Lzmq/IPollEvents;

    .line 60
    return-void
.end method
