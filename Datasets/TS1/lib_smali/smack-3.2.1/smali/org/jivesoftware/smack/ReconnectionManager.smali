.class public Lorg/jivesoftware/smack/ReconnectionManager;
.super Ljava/lang/Object;
.source "ReconnectionManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field done:Z

.field private randomBase:I

.field private reconnectionThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lorg/jivesoftware/smack/ReconnectionManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smack/ReconnectionManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 38
    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .registers 4
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    iput v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->randomBase:I

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    .line 41
    iput-object p1, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 42
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/ReconnectionManager$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "x1"    # Lorg/jivesoftware/smack/ReconnectionManager$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/ReconnectionManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/ReconnectionManager;

    .prologue
    .line 19
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->randomBase:I

    return v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/ReconnectionManager;

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/ReconnectionManager;)Lorg/jivesoftware/smack/Connection;
    .registers 2
    .param p0, "x0"    # Lorg/jivesoftware/smack/ReconnectionManager;

    .prologue
    .line 19
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method private isReconnectionAllowed()Z
    .registers 2

    .prologue
    .line 51
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isReconnectionAllowed()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method


# virtual methods
.method public connectionClosed()V
    .registers 2

    .prologue
    .line 171
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    .line 172
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 175
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    .line 176
    instance-of v3, p1, Lorg/jivesoftware/smack/XMPPException;

    if-eqz v3, :cond_1d

    move-object v2, p1

    .line 177
    check-cast v2, Lorg/jivesoftware/smack/XMPPException;

    .line 178
    .local v2, "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPException;->getStreamError()Lorg/jivesoftware/smack/packet/StreamError;

    move-result-object v0

    .line 181
    .local v0, "error":Lorg/jivesoftware/smack/packet/StreamError;
    if-eqz v0, :cond_1d

    .line 182
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/StreamError;->getCode()Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, "reason":Ljava/lang/String;
    const-string v3, "conflict"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 193
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/StreamError;
    .end local v1    # "reason":Ljava/lang/String;
    .end local v2    # "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    :cond_1c
    :goto_1c
    return-void

    .line 190
    :cond_1d
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 191
    invoke-virtual {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->reconnect()V

    goto :goto_1c
.end method

.method protected notifyAttemptToReconnectIn(I)V
    .registers 5
    .param p1, "seconds"    # I

    .prologue
    .line 163
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 164
    iget-object v2, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v2, v2, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/ConnectionListener;

    .line 165
    .local v1, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smack/ConnectionListener;->reconnectingIn(I)V

    goto :goto_e

    .line 168
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_1e
    return-void
.end method

.method protected notifyReconnectionFailed(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 150
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 151
    iget-object v2, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v2, v2, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/ConnectionListener;

    .line 152
    .local v1, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smack/ConnectionListener;->reconnectionFailed(Ljava/lang/Exception;)V

    goto :goto_e

    .line 155
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_1e
    return-void
.end method

.method protected declared-synchronized reconnect()V
    .registers 3

    .prologue
    .line 67
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_2f

    move-result v0

    if-eqz v0, :cond_15

    .line 142
    :cond_13
    :goto_13
    monitor-exit p0

    return-void

    .line 73
    :cond_15
    :try_start_15
    new-instance v0, Lorg/jivesoftware/smack/ReconnectionManager$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/ReconnectionManager$2;-><init>(Lorg/jivesoftware/smack/ReconnectionManager;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    .line 138
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    const-string v1, "Smack Reconnection Manager"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 140
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_2e
    .catchall {:try_start_15 .. :try_end_2e} :catchall_2f

    goto :goto_13

    .line 67
    :catchall_2f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public reconnectingIn(I)V
    .registers 2
    .param p1, "seconds"    # I

    .prologue
    .line 197
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 201
    return-void
.end method

.method public reconnectionSuccessful()V
    .registers 1

    .prologue
    .line 208
    return-void
.end method
