.class public Lzmq/Mailbox;
.super Ljava/lang/Object;
.source "Mailbox.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private active:Z

.field private final cpipe:Lzmq/YPipe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YPipe",
            "<",
            "Lzmq/Command;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;

.field private final signaler:Lzmq/Signaler;

.field private final sync:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-class v0, Lzmq/Mailbox;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Mailbox;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v1, Lzmq/YPipe;

    sget-object v2, Lzmq/Config;->COMMAND_PIPE_GRANULARITY:Lzmq/Config;

    invoke-virtual {v2}, Lzmq/Config;->getValue()I

    move-result v2

    invoke-direct {v1, v2}, Lzmq/YPipe;-><init>(I)V

    iput-object v1, p0, Lzmq/Mailbox;->cpipe:Lzmq/YPipe;

    .line 53
    new-instance v1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v1, p0, Lzmq/Mailbox;->sync:Ljava/util/concurrent/locks/Lock;

    .line 54
    new-instance v1, Lzmq/Signaler;

    invoke-direct {v1}, Lzmq/Signaler;-><init>()V

    iput-object v1, p0, Lzmq/Mailbox;->signaler:Lzmq/Signaler;

    .line 60
    iget-object v1, p0, Lzmq/Mailbox;->cpipe:Lzmq/YPipe;

    invoke-virtual {v1}, Lzmq/YPipe;->read()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Command;

    .line 61
    .local v0, "cmd":Lzmq/Command;
    sget-boolean v1, Lzmq/Mailbox;->$assertionsDisabled:Z

    if-nez v1, :cond_32

    if-eqz v0, :cond_32

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 62
    :cond_32
    const/4 v1, 0x0

    iput-boolean v1, p0, Lzmq/Mailbox;->active:Z

    .line 64
    iput-object p1, p0, Lzmq/Mailbox;->name:Ljava/lang/String;

    .line 65
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    iget-object v0, p0, Lzmq/Mailbox;->sync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 128
    iget-object v0, p0, Lzmq/Mailbox;->sync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 130
    iget-object v0, p0, Lzmq/Mailbox;->signaler:Lzmq/Signaler;

    invoke-virtual {v0}, Lzmq/Signaler;->close()V

    .line 131
    return-void
.end method

.method public getFd()Ljava/nio/channels/SelectableChannel;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lzmq/Mailbox;->signaler:Lzmq/Signaler;

    invoke-virtual {v0}, Lzmq/Signaler;->getFd()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    return-object v0
.end method

.method public recv(J)Lzmq/Command;
    .registers 6
    .param p1, "timeout"    # J

    .prologue
    .line 91
    const/4 v0, 0x0

    .line 93
    .local v0, "cmd":Lzmq/Command;
    iget-boolean v2, p0, Lzmq/Mailbox;->active:Z

    if-eqz v2, :cond_19

    .line 94
    iget-object v2, p0, Lzmq/Mailbox;->cpipe:Lzmq/YPipe;

    invoke-virtual {v2}, Lzmq/YPipe;->read()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cmd":Lzmq/Command;
    check-cast v0, Lzmq/Command;

    .line 95
    .restart local v0    # "cmd":Lzmq/Command;
    if-eqz v0, :cond_11

    move-object v2, v0

    .line 117
    :goto_10
    return-object v2

    .line 100
    :cond_11
    const/4 v2, 0x0

    iput-boolean v2, p0, Lzmq/Mailbox;->active:Z

    .line 101
    iget-object v2, p0, Lzmq/Mailbox;->signaler:Lzmq/Signaler;

    invoke-virtual {v2}, Lzmq/Signaler;->recv()V

    .line 105
    :cond_19
    iget-object v2, p0, Lzmq/Mailbox;->signaler:Lzmq/Signaler;

    invoke-virtual {v2, p1, p2}, Lzmq/Signaler;->waitEvent(J)Z

    move-result v1

    .line 106
    .local v1, "rc":Z
    if-nez v1, :cond_23

    .line 107
    const/4 v2, 0x0

    goto :goto_10

    .line 111
    :cond_23
    const/4 v2, 0x1

    iput-boolean v2, p0, Lzmq/Mailbox;->active:Z

    .line 114
    iget-object v2, p0, Lzmq/Mailbox;->cpipe:Lzmq/YPipe;

    invoke-virtual {v2}, Lzmq/YPipe;->read()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cmd":Lzmq/Command;
    check-cast v0, Lzmq/Command;

    .line 115
    .restart local v0    # "cmd":Lzmq/Command;
    sget-boolean v2, Lzmq/Mailbox;->$assertionsDisabled:Z

    if-nez v2, :cond_3a

    if-nez v0, :cond_3a

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    :cond_3a
    move-object v2, v0

    .line 117
    goto :goto_10
.end method

.method public send(Lzmq/Command;)V
    .registers 5
    .param p1, "cmd"    # Lzmq/Command;

    .prologue
    .line 74
    const/4 v0, 0x0

    .line 75
    .local v0, "ok":Z
    iget-object v1, p0, Lzmq/Mailbox;->sync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 77
    :try_start_6
    iget-object v1, p0, Lzmq/Mailbox;->cpipe:Lzmq/YPipe;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lzmq/YPipe;->write(Ljava/lang/Object;Z)V

    .line 78
    iget-object v1, p0, Lzmq/Mailbox;->cpipe:Lzmq/YPipe;

    invoke-virtual {v1}, Lzmq/YPipe;->flush()Z
    :try_end_11
    .catchall {:try_start_6 .. :try_end_11} :catchall_1f

    move-result v0

    .line 81
    iget-object v1, p0, Lzmq/Mailbox;->sync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 84
    if-nez v0, :cond_1e

    .line 85
    iget-object v1, p0, Lzmq/Mailbox;->signaler:Lzmq/Signaler;

    invoke-virtual {v1}, Lzmq/Signaler;->send()V

    .line 87
    :cond_1e
    return-void

    .line 81
    :catchall_1f
    move-exception v1

    iget-object v2, p0, Lzmq/Mailbox;->sync:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lzmq/Mailbox;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
