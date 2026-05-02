.class public Lzmq/Reaper;
.super Lzmq/ZObject;
.source "Reaper.java"

# interfaces
.implements Lzmq/IPollEvents;
.implements Ljava/io/Closeable;


# instance fields
.field private final mailbox:Lzmq/Mailbox;

.field private mailboxHandle:Ljava/nio/channels/SelectableChannel;

.field private name:Ljava/lang/String;

.field private final poller:Lzmq/Poller;

.field private sockets:I

.field private volatile terminating:Z


# direct methods
.method public constructor <init>(Lzmq/Ctx;I)V
    .registers 5
    .param p1, "ctx"    # Lzmq/Ctx;
    .param p2, "tid"    # I

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, p2}, Lzmq/ZObject;-><init>(Lzmq/Ctx;I)V

    .line 48
    iput v0, p0, Lzmq/Reaper;->sockets:I

    .line 49
    iput-boolean v0, p0, Lzmq/Reaper;->terminating:Z

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "reaper-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lzmq/Reaper;->name:Ljava/lang/String;

    .line 51
    new-instance v0, Lzmq/Poller;

    iget-object v1, p0, Lzmq/Reaper;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Lzmq/Poller;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    .line 53
    new-instance v0, Lzmq/Mailbox;

    iget-object v1, p0, Lzmq/Reaper;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Lzmq/Mailbox;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lzmq/Reaper;->mailbox:Lzmq/Mailbox;

    .line 55
    iget-object v0, p0, Lzmq/Reaper;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v0}, Lzmq/Mailbox;->getFd()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    iput-object v0, p0, Lzmq/Reaper;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    .line 56
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/Reaper;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1, p0}, Lzmq/Poller;->addHandle(Ljava/nio/channels/SelectableChannel;Lzmq/IPollEvents;)V

    .line 57
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/Reaper;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1}, Lzmq/Poller;->setPollIn(Ljava/nio/channels/SelectableChannel;)V

    .line 58
    return-void
.end method


# virtual methods
.method public acceptEvent()V
    .registers 2

    .prologue
    .line 114
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->destroy()V

    .line 64
    iget-object v0, p0, Lzmq/Reaper;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v0}, Lzmq/Mailbox;->close()V

    .line 65
    return-void
.end method

.method public connectEvent()V
    .registers 2

    .prologue
    .line 108
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getMailbox()Lzmq/Mailbox;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lzmq/Reaper;->mailbox:Lzmq/Mailbox;

    return-object v0
.end method

.method public inEvent()V
    .registers 5

    .prologue
    .line 89
    :goto_0
    iget-object v1, p0, Lzmq/Reaper;->mailbox:Lzmq/Mailbox;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lzmq/Mailbox;->recv(J)Lzmq/Command;

    move-result-object v0

    .line 90
    .local v0, "cmd":Lzmq/Command;
    if-nez v0, :cond_b

    .line 97
    return-void

    .line 95
    :cond_b
    invoke-virtual {v0}, Lzmq/Command;->destination()Lzmq/ZObject;

    move-result-object v1

    invoke-virtual {v1, v0}, Lzmq/ZObject;->processCommand(Lzmq/Command;)V

    goto :goto_0
.end method

.method public outEvent()V
    .registers 2

    .prologue
    .line 102
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processReap(Lzmq/SocketBase;)V
    .registers 3
    .param p1, "socket"    # Lzmq/SocketBase;

    .prologue
    .line 140
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    invoke-virtual {p1, v0}, Lzmq/SocketBase;->startReaping(Lzmq/Poller;)V

    .line 142
    iget v0, p0, Lzmq/Reaper;->sockets:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/Reaper;->sockets:I

    .line 143
    return-void
.end method

.method protected processReaped()V
    .registers 3

    .prologue
    .line 148
    iget v0, p0, Lzmq/Reaper;->sockets:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Reaper;->sockets:I

    .line 152
    iget v0, p0, Lzmq/Reaper;->sockets:I

    if-nez v0, :cond_1d

    iget-boolean v0, p0, Lzmq/Reaper;->terminating:Z

    if-eqz v0, :cond_1d

    .line 153
    invoke-virtual {p0}, Lzmq/Reaper;->sendDone()V

    .line 154
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/Reaper;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1}, Lzmq/Poller;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 155
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->stop()V

    .line 157
    :cond_1d
    return-void
.end method

.method protected processStop()V
    .registers 3

    .prologue
    .line 126
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Reaper;->terminating:Z

    .line 129
    iget v0, p0, Lzmq/Reaper;->sockets:I

    if-nez v0, :cond_16

    .line 130
    invoke-virtual {p0}, Lzmq/Reaper;->sendDone()V

    .line 131
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/Reaper;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1}, Lzmq/Poller;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 132
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->stop()V

    .line 134
    :cond_16
    return-void
.end method

.method public start()V
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lzmq/Reaper;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->start()V

    .line 75
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 79
    iget-boolean v0, p0, Lzmq/Reaper;->terminating:Z

    if-nez v0, :cond_7

    .line 80
    invoke-virtual {p0}, Lzmq/Reaper;->sendStop()V

    .line 82
    :cond_7
    return-void
.end method

.method public timerEvent(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 120
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
