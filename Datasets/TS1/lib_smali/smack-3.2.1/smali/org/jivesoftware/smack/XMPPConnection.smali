.class public Lorg/jivesoftware/smack/XMPPConnection;
.super Lorg/jivesoftware/smack/Connection;
.source "XMPPConnection.java"


# instance fields
.field private anonymous:Z

.field private authenticated:Z

.field private compressionMethods:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private connected:Z

.field connectionID:Ljava/lang/String;

.field packetReader:Lorg/jivesoftware/smack/PacketReader;

.field packetWriter:Lorg/jivesoftware/smack/PacketWriter;

.field roster:Lorg/jivesoftware/smack/Roster;

.field socket:Ljava/net/Socket;

.field private user:Ljava/lang/String;

.field private usingCompression:Z

.field private usingTLS:Z

.field private wasAuthenticated:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "serviceName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 131
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 60
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 61
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 62
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 66
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 71
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 73
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 78
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 132
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 133
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 134
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 135
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)V
    .registers 6
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "callbackHandler"    # Ljavax/security/auth/callback/CallbackHandler;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 114
    new-instance v0, Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 60
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 61
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 62
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 66
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 71
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 73
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 78
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 115
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCompressionEnabled(Z)V

    .line 116
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setSASLAuthenticationEnabled(Z)V

    .line 117
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    sget-boolean v1, Lorg/jivesoftware/smack/XMPPConnection;->DEBUG_ENABLED:Z

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setDebuggerEnabled(Z)V

    .line 118
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v0, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCallbackHandler(Ljavax/security/auth/callback/CallbackHandler;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .registers 4
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 147
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 60
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 61
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 62
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 71
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 72
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 73
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 78
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 148
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/ConnectionConfiguration;Ljavax/security/auth/callback/CallbackHandler;)V
    .registers 5
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;
    .param p2, "callbackHandler"    # Ljavax/security/auth/callback/CallbackHandler;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 169
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/Connection;-><init>(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 60
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    .line 61
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 62
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 71
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 72
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 73
    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 78
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 170
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setCallbackHandler(Ljavax/security/auth/callback/CallbackHandler;)V

    .line 171
    return-void
.end method

.method private connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .registers 10
    .param p1, "config"    # Lorg/jivesoftware/smack/ConnectionConfiguration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 505
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 506
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getPort()I

    move-result v3

    .line 508
    .local v3, "port":I
    :try_start_8
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v5

    if-nez v5, :cond_19

    .line 509
    new-instance v5, Ljava/net/Socket;

    invoke-direct {v5, v1, v3}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;
    :try_end_15
    .catch Ljava/net/UnknownHostException; {:try_start_8 .. :try_end_15} :catch_24
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_15} :catch_55

    .line 527
    :goto_15
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initConnection()V

    .line 528
    return-void

    .line 512
    :cond_19
    :try_start_19
    invoke-virtual {p1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v5

    invoke-virtual {v5, v1, v3}, Ljavax/net/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v5

    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;
    :try_end_23
    .catch Ljava/net/UnknownHostException; {:try_start_19 .. :try_end_23} :catch_24
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_23} :catch_55

    goto :goto_15

    .line 515
    :catch_24
    move-exception v4

    .line 516
    .local v4, "uhe":Ljava/net/UnknownHostException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not connect to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 517
    .local v0, "errorMessage":Ljava/lang/String;
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    new-instance v6, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v7, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v6, v7, v0}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    invoke-direct {v5, v0, v6, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    throw v5

    .line 521
    .end local v0    # "errorMessage":Ljava/lang/String;
    .end local v4    # "uhe":Ljava/net/UnknownHostException;
    :catch_55
    move-exception v2

    .line 522
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "XMPPError connecting to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 524
    .restart local v0    # "errorMessage":Ljava/lang/String;
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    new-instance v6, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v7, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v6, v7, v0}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    invoke-direct {v5, v0, v6, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private hasAvailableCompressionMethod(Ljava/lang/String;)Z
    .registers 3
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 841
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private initConnection()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v7, 0x0

    .line 537
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    if-eqz v5, :cond_b

    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    if-nez v5, :cond_b4

    .line 538
    .local v2, "isFirstInitialization":Z
    :cond_b
    :goto_b
    if-nez v2, :cond_f

    .line 539
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    .line 543
    :cond_f
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 546
    if-eqz v2, :cond_b7

    .line 547
    :try_start_14
    new-instance v5, Lorg/jivesoftware/smack/PacketWriter;

    invoke-direct {v5, p0}, Lorg/jivesoftware/smack/PacketWriter;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    .line 548
    new-instance v5, Lorg/jivesoftware/smack/PacketReader;

    invoke-direct {v5, p0}, Lorg/jivesoftware/smack/PacketReader;-><init>(Lorg/jivesoftware/smack/XMPPConnection;)V

    iput-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    .line 552
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v5

    if-eqz v5, :cond_46

    .line 553
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v5}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getReaderListener()Lorg/jivesoftware/smack/PacketListener;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 554
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v5}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getWriterListener()Lorg/jivesoftware/smack/PacketListener;

    move-result-object v5

    if-eqz v5, :cond_46

    .line 555
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    invoke-interface {v5}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->getWriterListener()Lorg/jivesoftware/smack/PacketListener;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p0, v5, v6}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketSendingListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 565
    :cond_46
    :goto_46
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketWriter;->startup()V

    .line 568
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketReader;->startup()V

    .line 571
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 574
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketWriter;->startKeepAliveProcess()V

    .line 577
    if-eqz v2, :cond_c2

    .line 579
    invoke-static {}, Lorg/jivesoftware/smack/XMPPConnection;->getConnectionCreationListeners()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_62
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_cb

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/ConnectionCreationListener;

    .line 580
    .local v3, "listener":Lorg/jivesoftware/smack/ConnectionCreationListener;
    invoke-interface {v3, p0}, Lorg/jivesoftware/smack/ConnectionCreationListener;->connectionCreated(Lorg/jivesoftware/smack/Connection;)V
    :try_end_71
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_14 .. :try_end_71} :catch_72

    goto :goto_62

    .line 588
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "listener":Lorg/jivesoftware/smack/ConnectionCreationListener;
    :catch_72
    move-exception v0

    .line 592
    .local v0, "ex":Lorg/jivesoftware/smack/XMPPException;
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    if-eqz v5, :cond_7e

    .line 594
    :try_start_77
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketWriter;->shutdown()V
    :try_end_7c
    .catch Ljava/lang/Throwable; {:try_start_77 .. :try_end_7c} :catch_d4

    .line 597
    :goto_7c
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    .line 599
    :cond_7e
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    if-eqz v5, :cond_89

    .line 601
    :try_start_82
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketReader;->shutdown()V
    :try_end_87
    .catch Ljava/lang/Throwable; {:try_start_82 .. :try_end_87} :catch_d2

    .line 604
    :goto_87
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    .line 606
    :cond_89
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    if-eqz v5, :cond_94

    .line 608
    :try_start_8d
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    invoke-virtual {v5}, Ljava/io/Reader;->close()V
    :try_end_92
    .catch Ljava/lang/Throwable; {:try_start_8d .. :try_end_92} :catch_d0

    .line 611
    :goto_92
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 613
    :cond_94
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    if-eqz v5, :cond_9f

    .line 615
    :try_start_98
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v5}, Ljava/io/Writer;->close()V
    :try_end_9d
    .catch Ljava/lang/Throwable; {:try_start_98 .. :try_end_9d} :catch_ce

    .line 618
    :goto_9d
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    .line 620
    :cond_9f
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    if-eqz v5, :cond_aa

    .line 622
    :try_start_a3
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->close()V
    :try_end_a8
    .catch Ljava/lang/Exception; {:try_start_a3 .. :try_end_a8} :catch_cc

    .line 625
    :goto_a8
    iput-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 627
    :cond_aa
    iget-boolean v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    invoke-direct {p0, v5}, Lorg/jivesoftware/smack/XMPPConnection;->setWasAuthenticated(Z)V

    .line 628
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 629
    iput-boolean v4, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 631
    throw v0

    .end local v0    # "ex":Lorg/jivesoftware/smack/XMPPException;
    .end local v2    # "isFirstInitialization":Z
    :cond_b4
    move v2, v4

    .line 537
    goto/16 :goto_b

    .line 560
    .restart local v2    # "isFirstInitialization":Z
    :cond_b7
    :try_start_b7
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketWriter;->init()V

    .line 561
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketReader;->init()V

    goto :goto_46

    .line 583
    :cond_c2
    iget-boolean v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    if-nez v5, :cond_cb

    .line 584
    iget-object v5, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/PacketReader;->notifyReconnection()V
    :try_end_cb
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_b7 .. :try_end_cb} :catch_72

    .line 633
    :cond_cb
    return-void

    .line 624
    .restart local v0    # "ex":Lorg/jivesoftware/smack/XMPPException;
    :catch_cc
    move-exception v5

    goto :goto_a8

    .line 617
    :catch_ce
    move-exception v5

    goto :goto_9d

    .line 610
    :catch_d0
    move-exception v5

    goto :goto_92

    .line 603
    :catch_d2
    move-exception v5

    goto :goto_87

    .line 596
    :catch_d4
    move-exception v5

    goto :goto_7c
.end method

.method private initReaderAndWriter()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 637
    :try_start_0
    iget-boolean v8, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    if-nez v8, :cond_30

    .line 638
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    iget-object v10, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    const-string v11, "UTF-8"

    invoke-direct {v9, v10, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v8, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 640
    new-instance v8, Ljava/io/BufferedWriter;

    new-instance v9, Ljava/io/OutputStreamWriter;

    iget-object v10, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    const-string v11, "UTF-8"

    invoke-direct {v9, v10, v11}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v8, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_2c} :catch_10a

    .line 679
    :goto_2c
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initDebugger()V

    .line 680
    return-void

    .line 645
    :cond_30
    :try_start_30
    const-string v8, "com.jcraft.jzlib.ZOutputStream"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 646
    .local v7, "zoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Ljava/io/OutputStream;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v10, v8, v9

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 648
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const/16 v10, 0x9

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 649
    .local v5, "out":Ljava/lang/Object;
    const-string v8, "setFlushMode"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 650
    .local v4, "method":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v4, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    new-instance v8, Ljava/io/BufferedWriter;

    new-instance v9, Ljava/io/OutputStreamWriter;

    check-cast v5, Ljava/io/OutputStream;

    .end local v5    # "out":Ljava/lang/Object;
    const-string v10, "UTF-8"

    invoke-direct {v9, v5, v10}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v8, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    .line 654
    const-string v8, "com.jcraft.jzlib.ZInputStream"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 655
    .local v6, "ziClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Ljava/io/InputStream;

    aput-object v10, v8, v9

    invoke-virtual {v6, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 656
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v0, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 657
    .local v2, "in":Ljava/lang/Object;
    const-string v8, "setFlushMode"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v11, v9, v10

    invoke-virtual {v6, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 658
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v4, v2, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    check-cast v2, Ljava/io/InputStream;

    .end local v2    # "in":Ljava/lang/Object;
    const-string v10, "UTF-8"

    invoke-direct {v9, v2, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v8, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;
    :try_end_da
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_da} :catch_dc
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_da} :catch_10a

    goto/16 :goto_2c

    .line 661
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v6    # "ziClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "zoClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_dc
    move-exception v1

    .line 662
    .local v1, "e":Ljava/lang/Exception;
    :try_start_dd
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 663
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    iget-object v10, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    const-string v11, "UTF-8"

    invoke-direct {v9, v10, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v8, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 665
    new-instance v8, Ljava/io/BufferedWriter;

    new-instance v9, Ljava/io/OutputStreamWriter;

    iget-object v10, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    const-string v11, "UTF-8"

    invoke-direct {v9, v10, v11}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v8, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;
    :try_end_108
    .catch Ljava/io/IOException; {:try_start_dd .. :try_end_108} :catch_10a

    goto/16 :goto_2c

    .line 670
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_10a
    move-exception v3

    .line 671
    .local v3, "ioe":Ljava/io/IOException;
    new-instance v8, Lorg/jivesoftware/smack/XMPPException;

    const-string v9, "XMPPError establishing connection with server."

    new-instance v10, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v11, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    const-string v12, "XMPPError establishing connection with server."

    invoke-direct {v10, v11, v12}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    invoke-direct {v8, v9, v10, v3}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V

    throw v8
.end method

.method private requestStreamCompression()V
    .registers 4

    .prologue
    .line 897
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    const-string v2, "<compress xmlns=\'http://jabber.org/protocol/compress\'>"

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 898
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    const-string v2, "<method>zlib</method></compress>"

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 899
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_13} :catch_14

    .line 904
    :goto_13
    return-void

    .line 901
    :catch_14
    move-exception v0

    .line 902
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_13
.end method

.method private setWasAuthenticated(Z)V
    .registers 3
    .param p1, "wasAuthenticated"    # Z

    .prologue
    .line 981
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    if-nez v0, :cond_6

    .line 982
    iput-boolean p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 984
    :cond_6
    return-void
.end method

.method private useCompression()Z
    .registers 4

    .prologue
    .line 865
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v1, :cond_c

    .line 866
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Compression should be negotiated before authentication."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 869
    :cond_c
    :try_start_c
    const-string v1, "com.jcraft.jzlib.ZOutputStream"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_11
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_11} :catch_2b

    .line 874
    const-string v1, "zlib"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->hasAvailableCompressionMethod(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 875
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->requestStreamCompression()V

    .line 877
    monitor-enter p0

    .line 879
    :try_start_1d
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v1

    mul-int/lit8 v1, v1, 0x5

    int-to-long v1, v1

    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_27
    .catch Ljava/lang/InterruptedException; {:try_start_1d .. :try_end_27} :catch_39
    .catchall {:try_start_1d .. :try_end_27} :catchall_34

    .line 884
    :goto_27
    :try_start_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_34

    .line 885
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    .line 887
    :goto_2a
    return v1

    .line 871
    :catch_2b
    move-exception v0

    .line 872
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot use compression. Add smackx.jar to the classpath"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 884
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_34
    move-exception v1

    :try_start_35
    monitor-exit p0
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    throw v1

    .line 887
    :cond_37
    const/4 v1, 0x0

    goto :goto_2a

    .line 881
    :catch_39
    move-exception v1

    goto :goto_27
.end method


# virtual methods
.method public addPacketWriterInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 3
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 465
    invoke-virtual {p0, p1, p2}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 466
    return-void
.end method

.method public addPacketWriterListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 3
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;
    .param p2, "packetFilter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 491
    invoke-virtual {p0, p1, p2}, Lorg/jivesoftware/smack/XMPPConnection;->addPacketSendingListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 492
    return-void
.end method

.method public connect()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 953
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/XMPPConnection;->connectUsingConfiguration(Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    .line 956
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    if-eqz v1, :cond_1b

    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    if-eqz v1, :cond_1b

    .line 959
    :try_start_d
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAnonymous()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 961
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->loginAnonymously()V

    .line 967
    :goto_16
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketReader;->notifyReconnection()V

    .line 973
    :cond_1b
    :goto_1b
    return-void

    .line 964
    :cond_1c
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getUsername()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getPassword()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getResource()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v2, v3}, Lorg/jivesoftware/smack/XMPPConnection;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_31
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_d .. :try_end_31} :catch_32

    goto :goto_16

    .line 969
    :catch_32
    move-exception v0

    .line 970
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_1b
.end method

.method public declared-synchronized disconnect(Lorg/jivesoftware/smack/packet/Presence;)V
    .registers 3
    .param p1, "unavailablePresence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 424
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_2e

    if-nez v0, :cond_b

    .line 441
    :cond_9
    :goto_9
    monitor-exit p0

    return-void

    .line 428
    :cond_b
    :try_start_b
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->shutdown(Lorg/jivesoftware/smack/packet/Presence;)V

    .line 430
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    if-eqz v0, :cond_1a

    .line 431
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Roster;->cleanup()V

    .line 432
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 435
    :cond_1a
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->wasAuthenticated:Z

    .line 437
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->cleanup()V

    .line 438
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    .line 439
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketReader;->cleanup()V

    .line 440
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;
    :try_end_2d
    .catchall {:try_start_b .. :try_end_2d} :catchall_2e

    goto :goto_9

    .line 424
    :catchall_2e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getConnectionID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 174
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_8

    .line 175
    const/4 v0, 0x0

    .line 177
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connectionID:Ljava/lang/String;

    goto :goto_7
.end method

.method public getRoster()Lorg/jivesoftware/smack/Roster;
    .registers 11

    .prologue
    .line 309
    monitor-enter p0

    .line 312
    :try_start_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAuthenticated()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAnonymous()Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 313
    :cond_d
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    if-nez v6, :cond_18

    .line 314
    new-instance v6, Lorg/jivesoftware/smack/Roster;

    invoke-direct {v6, p0}, Lorg/jivesoftware/smack/Roster;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 316
    :cond_18
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    monitor-exit p0

    .line 350
    :goto_1b
    return-object v6

    .line 318
    :cond_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_4c

    .line 320
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isRosterLoadedAtLogin()Z

    move-result v6

    if-nez v6, :cond_2a

    .line 321
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/Roster;->reload()V

    .line 330
    :cond_2a
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    iget-boolean v6, v6, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    if-nez v6, :cond_49

    .line 332
    :try_start_30
    iget-object v7, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    monitor-enter v7
    :try_end_33
    .catch Ljava/lang/InterruptedException; {:try_start_30 .. :try_end_33} :catch_60

    .line 333
    :try_start_33
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v4, v6

    .line 334
    .local v4, "waitTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 335
    .local v2, "start":J
    :goto_3c
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    iget-boolean v6, v6, Lorg/jivesoftware/smack/Roster;->rosterInitialized:Z

    if-nez v6, :cond_48

    .line 336
    const-wide/16 v8, 0x0

    cmp-long v6, v4, v8

    if-gtz v6, :cond_4f

    .line 344
    :cond_48
    monitor-exit v7
    :try_end_49
    .catchall {:try_start_33 .. :try_end_49} :catchall_5d

    .line 350
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :cond_49
    :goto_49
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    goto :goto_1b

    .line 318
    :catchall_4c
    move-exception v6

    :try_start_4d
    monitor-exit p0
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4c

    throw v6

    .line 339
    .restart local v2    # "start":J
    .restart local v4    # "waitTime":J
    :cond_4f
    :try_start_4f
    iget-object v6, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v6, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 340
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 341
    .local v0, "now":J
    sub-long v8, v0, v2

    sub-long/2addr v4, v8

    .line 342
    move-wide v2, v0

    .line 343
    goto :goto_3c

    .line 344
    .end local v0    # "now":J
    .end local v2    # "start":J
    .end local v4    # "waitTime":J
    :catchall_5d
    move-exception v6

    monitor-exit v7
    :try_end_5f
    .catchall {:try_start_4f .. :try_end_5f} :catchall_5d

    :try_start_5f
    throw v6
    :try_end_60
    .catch Ljava/lang/InterruptedException; {:try_start_5f .. :try_end_60} :catch_60

    .line 346
    :catch_60
    move-exception v6

    goto :goto_49
.end method

.method public getUser()Ljava/lang/String;
    .registers 2

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_8

    .line 182
    const/4 v0, 0x0

    .line 184
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    goto :goto_7
.end method

.method public isAnonymous()Z
    .registers 2

    .prologue
    .line 366
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    return v0
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 362
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    return v0
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 354
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    return v0
.end method

.method public isSecureConnection()Z
    .registers 2

    .prologue
    .line 358
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isUsingTLS()Z

    move-result v0

    return v0
.end method

.method public isUsingCompression()Z
    .registers 2

    .prologue
    .line 845
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    return v0
.end method

.method public isUsingTLS()Z
    .registers 2

    .prologue
    .line 693
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    return v0
.end method

.method public declared-synchronized login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 189
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v1

    if-nez v1, :cond_12

    .line 190
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Not connected to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 189
    :catchall_f
    move-exception v1

    monitor-exit p0

    throw v1

    .line 192
    :cond_12
    :try_start_12
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v1, :cond_1e

    .line 193
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Already logged in to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 196
    :cond_1e
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 199
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSASLAuthenticationEnabled()Z

    move-result v1

    if-eqz v1, :cond_af

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->hasNonAnonymousAuthentication()Z

    move-result v1

    if-eqz v1, :cond_af

    .line 202
    if-eqz p2, :cond_a2

    .line 203
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1, p1, p2, p3}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "response":Ljava/lang/String;
    :goto_3e
    if-eqz v0, :cond_b9

    .line 217
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 219
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setServiceName(Ljava/lang/String;)V

    .line 229
    :cond_4b
    :goto_4b
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isCompressionEnabled()Z

    move-result v1

    if-eqz v1, :cond_56

    .line 230
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->useCompression()Z

    .line 234
    :cond_56
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 235
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 238
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    if-nez v1, :cond_67

    .line 239
    new-instance v1, Lorg/jivesoftware/smack/Roster;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/Roster;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    .line 241
    :cond_67
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isRosterLoadedAtLogin()Z

    move-result v1

    if-eqz v1, :cond_74

    .line 242
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->roster:Lorg/jivesoftware/smack/Roster;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Roster;->reload()V

    .line 246
    :cond_74
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSendPresence()Z

    move-result v1

    if-eqz v1, :cond_88

    .line 247
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 251
    :cond_88
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1, p1, p2, p3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setLoginInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v1

    if-eqz v1, :cond_a0

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    if-eqz v1, :cond_a0

    .line 258
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->userHasLogged(Ljava/lang/String;)V
    :try_end_a0
    .catchall {:try_start_12 .. :try_end_a0} :catchall_f

    .line 260
    :cond_a0
    monitor-exit p0

    return-void

    .line 206
    .end local v0    # "response":Ljava/lang/String;
    :cond_a2
    :try_start_a2
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v2

    invoke-virtual {v1, p1, p3, v2}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "response":Ljava/lang/String;
    goto :goto_3e

    .line 212
    .end local v0    # "response":Ljava/lang/String;
    :cond_af
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "response":Ljava/lang/String;
    goto :goto_3e

    .line 222
    :cond_b9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->getServiceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 223
    if-eqz p3, :cond_4b

    .line 224
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;
    :try_end_f3
    .catchall {:try_start_a2 .. :try_end_f3} :catchall_f

    goto/16 :goto_4b
.end method

.method public declared-synchronized loginAnonymously()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 264
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v1

    if-nez v1, :cond_12

    .line 265
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Not connected to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 264
    :catchall_f
    move-exception v1

    monitor-exit p0

    throw v1

    .line 267
    :cond_12
    :try_start_12
    iget-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    if-eqz v1, :cond_1e

    .line 268
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Already logged in to server."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 272
    :cond_1e
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSASLAuthenticationEnabled()Z

    move-result v1

    if-eqz v1, :cond_71

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->hasAnonymousAuthentication()Z

    move-result v1

    if-eqz v1, :cond_71

    .line 274
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticateAnonymously()Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, "response":Ljava/lang/String;
    :goto_34
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    .line 284
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-static {v0}, Lorg/jivesoftware/smack/util/StringUtils;->parseServer(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setServiceName(Ljava/lang/String;)V

    .line 287
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isCompressionEnabled()Z

    move-result v1

    if-eqz v1, :cond_4a

    .line 288
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->useCompression()Z

    .line 292
    :cond_4a
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    new-instance v2, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v3, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 295
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 296
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->anonymous:Z

    .line 302
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isDebuggerEnabled()Z

    move-result v1

    if-eqz v1, :cond_6f

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    if-eqz v1, :cond_6f

    .line 303
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->debugger:Lorg/jivesoftware/smack/debugger/SmackDebugger;

    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->user:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/jivesoftware/smack/debugger/SmackDebugger;->userHasLogged(Ljava/lang/String;)V
    :try_end_6f
    .catchall {:try_start_12 .. :try_end_6f} :catchall_f

    .line 305
    :cond_6f
    monitor-exit p0

    return-void

    .line 278
    .end local v0    # "response":Ljava/lang/String;
    :cond_71
    :try_start_71
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticateAnonymously()Ljava/lang/String;
    :try_end_79
    .catchall {:try_start_71 .. :try_end_79} :catchall_f

    move-result-object v0

    .restart local v0    # "response":Ljava/lang/String;
    goto :goto_34
.end method

.method proceedTLSReceived()V
    .registers 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 731
    const-string v18, "TLS"

    invoke-static/range {v18 .. v18}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v7

    .line 732
    .local v7, "context":Ljavax/net/ssl/SSLContext;
    const/4 v11, 0x0

    .line 733
    .local v11, "ks":Ljava/security/KeyStore;
    const/4 v10, 0x0

    .line 734
    .local v10, "kms":[Ljavax/net/ssl/KeyManager;
    const/4 v14, 0x0

    .line 736
    .local v14, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v18

    if-nez v18, :cond_ae

    .line 737
    const/4 v11, 0x0

    .line 794
    :goto_16
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    new-instance v20, Lorg/jivesoftware/smack/ServerTrustManager;

    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smack/XMPPConnection;->getServiceName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v22, v0

    invoke-direct/range {v20 .. v22}, Lorg/jivesoftware/smack/ServerTrustManager;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/ConnectionConfiguration;)V

    aput-object v20, v18, v19

    new-instance v19, Ljava/security/SecureRandom;

    invoke-direct/range {v19 .. v19}, Ljava/security/SecureRandom;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v10, v0, v1}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 797
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v17, v0

    .line 799
    .local v17, "plain":Ljava/net/Socket;
    invoke-virtual {v7}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v18

    invoke-virtual/range {v17 .. v17}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v17}, Ljava/net/Socket;->getPort()I

    move-result v20

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    move/from16 v3, v20

    move/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    .line 801
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 802
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 804
    invoke-direct/range {p0 .. p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 806
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    move-object/from16 v18, v0

    check-cast v18, Ljavax/net/ssl/SSLSocket;

    invoke-virtual/range {v18 .. v18}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 817
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/jivesoftware/smack/XMPPConnection;->usingTLS:Z

    .line 820
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lorg/jivesoftware/smack/PacketWriter;->setWriter(Ljava/io/Writer;)V

    .line 822
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 823
    return-void

    .line 740
    .end local v17    # "plain":Ljava/net/Socket;
    :cond_ae
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    const-string v19, "NONE"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_d7

    .line 741
    const/4 v11, 0x0

    .line 742
    const/4 v14, 0x0

    .line 779
    :goto_c2
    const-string v18, "SunX509"

    invoke-static/range {v18 .. v18}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v9

    .line 781
    .local v9, "kmf":Ljavax/net/ssl/KeyManagerFactory;
    if-nez v14, :cond_200

    .line 782
    const/16 v18, 0x0

    :try_start_cc
    move-object/from16 v0, v18

    invoke-virtual {v9, v11, v0}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 787
    :goto_d1
    invoke-virtual {v9}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;
    :try_end_d4
    .catch Ljava/lang/NullPointerException; {:try_start_cc .. :try_end_d4} :catch_20e

    move-result-object v10

    goto/16 :goto_16

    .line 744
    .end local v9    # "kmf":Ljavax/net/ssl/KeyManagerFactory;
    :cond_d7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    const-string v19, "PKCS11"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_183

    .line 746
    :try_start_e9
    const-string v18, "sun.security.pkcs11.SunPKCS11"

    invoke-static/range {v18 .. v18}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-class v21, Ljava/io/InputStream;

    aput-object v21, v19, v20

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 747
    .local v5, "c":Ljava/lang/reflect/Constructor;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "name = SmartCard\nlibrary = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getPKCS11Library()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 748
    .local v16, "pkcs11Config":Ljava/lang/String;
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->getBytes()[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v6, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 749
    .local v6, "config":Ljava/io/ByteArrayInputStream;
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v6, v18, v19

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/security/Provider;

    .line 750
    .local v13, "p":Ljava/security/Provider;
    invoke-static {v13}, Ljava/security/Security;->addProvider(Ljava/security/Provider;)I

    .line 751
    const-string v18, "PKCS11"

    move-object/from16 v0, v18

    invoke-static {v0, v13}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/KeyStore;

    move-result-object v11

    .line 752
    new-instance v15, Ljavax/security/auth/callback/PasswordCallback;

    const-string v18, "PKCS11 Password: "

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v15, v0, v1}, Ljavax/security/auth/callback/PasswordCallback;-><init>(Ljava/lang/String;Z)V
    :try_end_155
    .catch Ljava/lang/Exception; {:try_start_e9 .. :try_end_155} :catch_17e

    .line 753
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .local v15, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :try_start_155
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljavax/security/auth/callback/Callback;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v15, v19, v20

    invoke-interface/range {v18 .. v19}, Ljavax/security/auth/callback/CallbackHandler;->handle([Ljavax/security/auth/callback/Callback;)V

    .line 754
    const/16 v18, 0x0

    invoke-virtual {v15}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_17b
    .catch Ljava/lang/Exception; {:try_start_155 .. :try_end_17b} :catch_215

    move-object v14, v15

    .line 759
    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto/16 :goto_c2

    .line 756
    .end local v5    # "c":Ljava/lang/reflect/Constructor;
    .end local v6    # "config":Ljava/io/ByteArrayInputStream;
    .end local v13    # "p":Ljava/security/Provider;
    .end local v16    # "pkcs11Config":Ljava/lang/String;
    :catch_17e
    move-exception v8

    .line 757
    .local v8, "e":Ljava/lang/Exception;
    :goto_17f
    const/4 v11, 0x0

    .line 758
    const/4 v14, 0x0

    .line 759
    goto/16 :goto_c2

    .line 761
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_183
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    const-string v19, "Apple"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1aa

    .line 762
    const-string v18, "KeychainStore"

    const-string v19, "Apple"

    invoke-static/range {v18 .. v19}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v11

    .line 763
    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    goto/16 :goto_c2

    .line 768
    :cond_1aa
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystoreType()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v11

    .line 770
    :try_start_1b8
    new-instance v15, Ljavax/security/auth/callback/PasswordCallback;

    const-string v18, "Keystore Password: "

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v15, v0, v1}, Ljavax/security/auth/callback/PasswordCallback;-><init>(Ljava/lang/String;Z)V
    :try_end_1c5
    .catch Ljava/lang/Exception; {:try_start_1b8 .. :try_end_1c5} :catch_1fb

    .line 771
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :try_start_1c5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljavax/security/auth/callback/Callback;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v15, v19, v20

    invoke-interface/range {v18 .. v19}, Ljavax/security/auth/callback/CallbackHandler;->handle([Ljavax/security/auth/callback/Callback;)V

    .line 772
    new-instance v18, Ljava/io/FileInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getKeystorePath()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_1f8
    .catch Ljava/lang/Exception; {:try_start_1c5 .. :try_end_1f8} :catch_212

    move-object v14, v15

    .line 777
    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto/16 :goto_c2

    .line 774
    :catch_1fb
    move-exception v8

    .line 775
    .restart local v8    # "e":Ljava/lang/Exception;
    :goto_1fc
    const/4 v11, 0x0

    .line 776
    const/4 v14, 0x0

    goto/16 :goto_c2

    .line 784
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v9    # "kmf":Ljavax/net/ssl/KeyManagerFactory;
    :cond_200
    :try_start_200
    invoke-virtual {v14}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v9, v11, v0}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 785
    invoke-virtual {v14}, Ljavax/security/auth/callback/PasswordCallback;->clearPassword()V
    :try_end_20c
    .catch Ljava/lang/NullPointerException; {:try_start_200 .. :try_end_20c} :catch_20e

    goto/16 :goto_d1

    .line 788
    :catch_20e
    move-exception v12

    .line 789
    .local v12, "npe":Ljava/lang/NullPointerException;
    const/4 v10, 0x0

    goto/16 :goto_16

    .line 774
    .end local v9    # "kmf":Ljavax/net/ssl/KeyManagerFactory;
    .end local v12    # "npe":Ljava/lang/NullPointerException;
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :catch_212
    move-exception v8

    move-object v14, v15

    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto :goto_1fc

    .line 756
    .end local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v5    # "c":Ljava/lang/reflect/Constructor;
    .restart local v6    # "config":Ljava/io/ByteArrayInputStream;
    .restart local v13    # "p":Ljava/security/Provider;
    .restart local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v16    # "pkcs11Config":Ljava/lang/String;
    :catch_215
    move-exception v8

    move-object v14, v15

    .end local v15    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    .restart local v14    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    goto/16 :goto_17f
.end method

.method public removePacketWriterInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V
    .registers 2
    .param p1, "packetInterceptor"    # Lorg/jivesoftware/smack/PacketInterceptor;

    .prologue
    .line 475
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->removePacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;)V

    .line 476
    return-void
.end method

.method public removePacketWriterListener(Lorg/jivesoftware/smack/PacketListener;)V
    .registers 2
    .param p1, "packetListener"    # Lorg/jivesoftware/smack/PacketListener;

    .prologue
    .line 501
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/XMPPConnection;->removePacketSendingListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 502
    return-void
.end method

.method public sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .registers 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 444
    invoke-virtual {p0}, Lorg/jivesoftware/smack/XMPPConnection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_e

    .line 445
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected to server."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 447
    :cond_e
    if-nez p1, :cond_18

    .line 448
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Packet is null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 450
    :cond_18
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 451
    return-void
.end method

.method setAvailableCompressionMethods(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 831
    .local p1, "methods":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPConnection;->compressionMethods:Ljava/util/Collection;

    .line 832
    return-void
.end method

.method protected shutdown(Lorg/jivesoftware/smack/packet/Presence;)V
    .registers 5
    .param p1, "unavailablePresence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 380
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/PacketWriter;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 382
    iget-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/XMPPConnection;->setWasAuthenticated(Z)V

    .line 383
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->authenticated:Z

    .line 384
    iput-boolean v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->connected:Z

    .line 386
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketReader;->shutdown()V

    .line 387
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->shutdown()V

    .line 390
    const-wide/16 v0, 0x96

    :try_start_1c
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1f} :catch_40

    .line 397
    :goto_1f
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    if-eqz v0, :cond_2a

    .line 399
    :try_start_23
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_28} :catch_46

    .line 402
    :goto_28
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->reader:Ljava/io/Reader;

    .line 404
    :cond_2a
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    if-eqz v0, :cond_35

    .line 406
    :try_start_2e
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_33
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_33} :catch_44

    .line 409
    :goto_33
    iput-object v2, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    .line 413
    :cond_35
    :try_start_35
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_3a} :catch_42

    .line 419
    :goto_3a
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/SASLAuthentication;->init()V

    .line 420
    return-void

    .line 392
    :catch_40
    move-exception v0

    goto :goto_1f

    .line 415
    :catch_42
    move-exception v0

    goto :goto_3a

    .line 408
    :catch_44
    move-exception v0

    goto :goto_33

    .line 401
    :catch_46
    move-exception v0

    goto :goto_28
.end method

.method startStreamCompression()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 913
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->usingCompression:Z

    .line 915
    invoke-direct {p0}, Lorg/jivesoftware/smack/XMPPConnection;->initReaderAndWriter()V

    .line 918
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/PacketWriter;->setWriter(Ljava/io/Writer;)V

    .line 920
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetWriter:Lorg/jivesoftware/smack/PacketWriter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketWriter;->openStream()V

    .line 922
    monitor-enter p0

    .line 923
    :try_start_13
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 924
    monitor-exit p0

    .line 925
    return-void

    .line 924
    :catchall_18
    move-exception v0

    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_13 .. :try_end_1a} :catchall_18

    throw v0
.end method

.method startTLSReceived(Z)V
    .registers 6
    .param p1, "required"    # Z

    .prologue
    .line 703
    if-eqz p1, :cond_19

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->disabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    if-ne v1, v2, :cond_19

    .line 705
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "TLS required by server but not allowed by connection configuration"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    .line 721
    :cond_18
    :goto_18
    return-void

    .line 710
    :cond_19
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->config:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->disabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    if-eq v1, v2, :cond_18

    .line 715
    :try_start_23
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    const-string v2, "<starttls xmlns=\"urn:ietf:params:xml:ns:xmpp-tls\"/>"

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 716
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_2f} :catch_30

    goto :goto_18

    .line 718
    :catch_30
    move-exception v0

    .line 719
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPConnection;->packetReader:Lorg/jivesoftware/smack/PacketReader;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/PacketReader;->notifyConnectionError(Ljava/lang/Exception;)V

    goto :goto_18
.end method

.method streamCompressionDenied()V
    .registers 2

    .prologue
    .line 932
    monitor-enter p0

    .line 933
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 934
    monitor-exit p0

    .line 935
    return-void

    .line 934
    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_6

    throw v0
.end method
