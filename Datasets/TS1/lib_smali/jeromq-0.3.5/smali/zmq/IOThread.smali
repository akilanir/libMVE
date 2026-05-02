.class public Lzmq/IOThread;
.super Lzmq/ZObject;
.source "IOThread.java"

# interfaces
.implements Lzmq/IPollEvents;
.implements Ljava/io/Closeable;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mailbox:Lzmq/Mailbox;

.field private final mailboxHandle:Ljava/nio/channels/SelectableChannel;

.field final name:Ljava/lang/String;

.field private final poller:Lzmq/Poller;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const-class v0, Lzmq/IOThread;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/IOThread;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/Ctx;I)V
    .registers 5
    .param p1, "ctx"    # Lzmq/Ctx;
    .param p2, "tid"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lzmq/ZObject;-><init>(Lzmq/Ctx;I)V

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "iothread-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lzmq/IOThread;->name:Ljava/lang/String;

    .line 43
    new-instance v0, Lzmq/Poller;

    iget-object v1, p0, Lzmq/IOThread;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Lzmq/Poller;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    .line 45
    new-instance v0, Lzmq/Mailbox;

    iget-object v1, p0, Lzmq/IOThread;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Lzmq/Mailbox;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lzmq/IOThread;->mailbox:Lzmq/Mailbox;

    .line 46
    iget-object v0, p0, Lzmq/IOThread;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v0}, Lzmq/Mailbox;->getFd()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    iput-object v0, p0, Lzmq/IOThread;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    .line 47
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/IOThread;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1, p0}, Lzmq/Poller;->addHandle(Ljava/nio/channels/SelectableChannel;Lzmq/IPollEvents;)V

    .line 48
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/IOThread;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1}, Lzmq/Poller;->setPollIn(Ljava/nio/channels/SelectableChannel;)V

    .line 49
    return-void
.end method


# virtual methods
.method public acceptEvent()V
    .registers 2

    .prologue
    .line 112
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
    .line 59
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->destroy()V

    .line 60
    iget-object v0, p0, Lzmq/IOThread;->mailbox:Lzmq/Mailbox;

    invoke-virtual {v0}, Lzmq/Mailbox;->close()V

    .line 61
    return-void
.end method

.method public connectEvent()V
    .registers 2

    .prologue
    .line 106
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getLoad()I
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->getLoad()I

    move-result v0

    return v0
.end method

.method public getMailbox()Lzmq/Mailbox;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lzmq/IOThread;->mailbox:Lzmq/Mailbox;

    return-object v0
.end method

.method public getPoller()Lzmq/Poller;
    .registers 2

    .prologue
    .line 123
    sget-boolean v0, Lzmq/IOThread;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 124
    :cond_e
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    return-object v0
.end method

.method public inEvent()V
    .registers 5

    .prologue
    .line 86
    :goto_0
    iget-object v1, p0, Lzmq/IOThread;->mailbox:Lzmq/Mailbox;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lzmq/Mailbox;->recv(J)Lzmq/Command;

    move-result-object v0

    .line 87
    .local v0, "cmd":Lzmq/Command;
    if-nez v0, :cond_b

    .line 95
    return-void

    .line 93
    :cond_b
    invoke-virtual {v0}, Lzmq/Command;->destination()Lzmq/ZObject;

    move-result-object v1

    invoke-virtual {v1, v0}, Lzmq/ZObject;->processCommand(Lzmq/Command;)V

    goto :goto_0
.end method

.method public outEvent()V
    .registers 2

    .prologue
    .line 100
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected processStop()V
    .registers 3

    .prologue
    .line 129
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    iget-object v1, p0, Lzmq/IOThread;->mailboxHandle:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v0, v1}, Lzmq/Poller;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 131
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->stop()V

    .line 132
    return-void
.end method

.method public start()V
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lzmq/IOThread;->poller:Lzmq/Poller;

    invoke-virtual {v0}, Lzmq/Poller;->start()V

    .line 54
    return-void
.end method

.method public stop()V
    .registers 1

    .prologue
    .line 65
    invoke-virtual {p0}, Lzmq/IOThread;->sendStop()V

    .line 66
    return-void
.end method

.method public timerEvent(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 118
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
