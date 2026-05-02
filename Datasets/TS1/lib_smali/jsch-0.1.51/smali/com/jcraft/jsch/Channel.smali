.class public abstract Lcom/jcraft/jsch/Channel;
.super Ljava/lang/Object;
.source "Channel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/Channel$PassiveOutputStream;,
        Lcom/jcraft/jsch/Channel$PassiveInputStream;,
        Lcom/jcraft/jsch/Channel$MyPipedInputStream;
    }
.end annotation


# static fields
.field static final SSH_MSG_CHANNEL_OPEN_CONFIRMATION:I = 0x5b

.field static final SSH_MSG_CHANNEL_OPEN_FAILURE:I = 0x5c

.field static final SSH_MSG_CHANNEL_WINDOW_ADJUST:I = 0x5d

.field static final SSH_OPEN_ADMINISTRATIVELY_PROHIBITED:I = 0x1

.field static final SSH_OPEN_CONNECT_FAILED:I = 0x2

.field static final SSH_OPEN_RESOURCE_SHORTAGE:I = 0x4

.field static final SSH_OPEN_UNKNOWN_CHANNEL_TYPE:I = 0x3

.field static index:I

.field private static pool:Ljava/util/Vector;


# instance fields
.field volatile close:Z

.field volatile connectTimeout:I

.field volatile connected:Z

.field volatile eof_local:Z

.field volatile eof_remote:Z

.field volatile exitstatus:I

.field id:I

.field io:Lcom/jcraft/jsch/IO;

.field volatile lmpsize:I

.field volatile lwsize:I

.field volatile lwsize_max:I

.field notifyme:I

.field volatile open_confirmation:Z

.field volatile recipient:I

.field volatile reply:I

.field volatile rmpsize:I

.field volatile rwsize:J

.field private session:Lcom/jcraft/jsch/Session;

.field thread:Ljava/lang/Thread;

.field protected type:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 50
    const/4 v0, 0x0

    sput v0, Lcom/jcraft/jsch/Channel;->index:I

    .line 51
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    return-void
.end method

.method constructor <init>()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput v3, p0, Lcom/jcraft/jsch/Channel;->recipient:I

    .line 99
    const-string v0, "foo"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/Channel;->type:[B

    .line 100
    const/high16 v0, 0x100000

    iput v0, p0, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    .line 101
    iget v0, p0, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    iput v0, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    .line 102
    const/16 v0, 0x4000

    iput v0, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    .line 104
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 105
    iput v2, p0, Lcom/jcraft/jsch/Channel;->rmpsize:I

    .line 107
    iput-object v4, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    .line 108
    iput-object v4, p0, Lcom/jcraft/jsch/Channel;->thread:Ljava/lang/Thread;

    .line 110
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    .line 111
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 113
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->close:Z

    .line 114
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 115
    iput-boolean v2, p0, Lcom/jcraft/jsch/Channel;->open_confirmation:Z

    .line 117
    iput v3, p0, Lcom/jcraft/jsch/Channel;->exitstatus:I

    .line 119
    iput v2, p0, Lcom/jcraft/jsch/Channel;->reply:I

    .line 120
    iput v2, p0, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    .line 124
    iput v2, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 127
    sget-object v1, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v1

    .line 128
    :try_start_3b
    sget v0, Lcom/jcraft/jsch/Channel;->index:I

    add-int/lit8 v2, v0, 0x1

    sput v2, Lcom/jcraft/jsch/Channel;->index:I

    iput v0, p0, Lcom/jcraft/jsch/Channel;->id:I

    .line 129
    sget-object v0, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 130
    monitor-exit v1

    .line 131
    return-void

    .line 130
    :catchall_4a
    move-exception v0

    monitor-exit v1
    :try_end_4c
    .catchall {:try_start_3b .. :try_end_4c} :catchall_4a

    throw v0
.end method

.method static del(Lcom/jcraft/jsch/Channel;)V
    .registers 3
    .param p0, "c"    # Lcom/jcraft/jsch/Channel;

    .prologue
    .line 92
    sget-object v1, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v1

    .line 93
    :try_start_3
    sget-object v0, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 94
    monitor-exit v1

    .line 95
    return-void

    .line 94
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method static disconnect(Lcom/jcraft/jsch/Session;)V
    .registers 9
    .param p0, "session"    # Lcom/jcraft/jsch/Session;

    .prologue
    .line 544
    const/4 v2, 0x0

    .line 545
    .local v2, "channels":[Lcom/jcraft/jsch/Channel;
    const/4 v3, 0x0

    .line 546
    .local v3, "count":I
    sget-object v7, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v7

    .line 547
    :try_start_5
    sget-object v6, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v2, v6, [Lcom/jcraft/jsch/Channel;
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_3b

    .line 548
    const/4 v5, 0x0

    .local v5, "i":I
    move v4, v3

    .end local v3    # "count":I
    .local v4, "count":I
    :goto_f
    :try_start_f
    sget-object v6, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I
    :try_end_14
    .catchall {:try_start_f .. :try_end_14} :catchall_3f

    move-result v6

    if-ge v5, v6, :cond_2f

    .line 550
    :try_start_17
    sget-object v6, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v6, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/jcraft/jsch/Channel;

    move-object v0, v6

    check-cast v0, Lcom/jcraft/jsch/Channel;

    move-object v1, v0

    .line 551
    .local v1, "c":Lcom/jcraft/jsch/Channel;
    iget-object v6, v1, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_25} :catch_42
    .catchall {:try_start_17 .. :try_end_25} :catchall_3f

    if-ne v6, p0, :cond_47

    .line 552
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "count":I
    .restart local v3    # "count":I
    :try_start_29
    aput-object v1, v2, v4
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_2b} :catch_45
    .catchall {:try_start_29 .. :try_end_2b} :catchall_3b

    .line 548
    .end local v1    # "c":Lcom/jcraft/jsch/Channel;
    :goto_2b
    add-int/lit8 v5, v5, 0x1

    move v4, v3

    .end local v3    # "count":I
    .restart local v4    # "count":I
    goto :goto_f

    .line 558
    :cond_2f
    :try_start_2f
    monitor-exit v7
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_3f

    .line 559
    const/4 v5, 0x0

    :goto_31
    if-ge v5, v4, :cond_3e

    .line 560
    aget-object v6, v2, v5

    invoke-virtual {v6}, Lcom/jcraft/jsch/Channel;->disconnect()V

    .line 559
    add-int/lit8 v5, v5, 0x1

    goto :goto_31

    .line 558
    .end local v4    # "count":I
    .end local v5    # "i":I
    .restart local v3    # "count":I
    :catchall_3b
    move-exception v6

    :goto_3c
    :try_start_3c
    monitor-exit v7
    :try_end_3d
    .catchall {:try_start_3c .. :try_end_3d} :catchall_3b

    throw v6

    .line 562
    .end local v3    # "count":I
    .restart local v4    # "count":I
    .restart local v5    # "i":I
    :cond_3e
    return-void

    .line 558
    :catchall_3f
    move-exception v6

    move v3, v4

    .end local v4    # "count":I
    .restart local v3    # "count":I
    goto :goto_3c

    .line 555
    .end local v3    # "count":I
    .restart local v4    # "count":I
    :catch_42
    move-exception v6

    move v3, v4

    .end local v4    # "count":I
    .restart local v3    # "count":I
    goto :goto_2b

    .restart local v1    # "c":Lcom/jcraft/jsch/Channel;
    :catch_45
    move-exception v6

    goto :goto_2b

    .end local v3    # "count":I
    .restart local v4    # "count":I
    :cond_47
    move v3, v4

    .end local v4    # "count":I
    .restart local v3    # "count":I
    goto :goto_2b
.end method

.method static getChannel(ILcom/jcraft/jsch/Session;)Lcom/jcraft/jsch/Channel;
    .registers 7
    .param p0, "id"    # I
    .param p1, "session"    # Lcom/jcraft/jsch/Session;

    .prologue
    .line 83
    sget-object v4, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    monitor-enter v4

    .line 84
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    :try_start_4
    sget-object v3, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_25

    .line 85
    sget-object v3, Lcom/jcraft/jsch/Channel;->pool:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Channel;

    move-object v0, v3

    check-cast v0, Lcom/jcraft/jsch/Channel;

    move-object v1, v0

    .line 86
    .local v1, "c":Lcom/jcraft/jsch/Channel;
    iget v3, v1, Lcom/jcraft/jsch/Channel;->id:I

    if-ne v3, p0, :cond_22

    iget-object v3, v1, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    if-ne v3, p1, :cond_22

    monitor-exit v4

    .line 89
    .end local v1    # "c":Lcom/jcraft/jsch/Channel;
    :goto_21
    return-object v1

    .line 84
    .restart local v1    # "c":Lcom/jcraft/jsch/Channel;
    :cond_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 88
    .end local v1    # "c":Lcom/jcraft/jsch/Channel;
    :cond_25
    monitor-exit v4

    .line 89
    const/4 v1, 0x0

    goto :goto_21

    .line 88
    :catchall_28
    move-exception v3

    monitor-exit v4
    :try_end_2a
    .catchall {:try_start_4 .. :try_end_2a} :catchall_28

    throw v3
.end method

.method static getChannel(Ljava/lang/String;)Lcom/jcraft/jsch/Channel;
    .registers 2
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 53
    const-string v0, "session"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 54
    new-instance v0, Lcom/jcraft/jsch/ChannelSession;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 80
    :goto_d
    return-object v0

    .line 56
    :cond_e
    const-string v0, "shell"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 57
    new-instance v0, Lcom/jcraft/jsch/ChannelShell;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelShell;-><init>()V

    goto :goto_d

    .line 59
    :cond_1c
    const-string v0, "exec"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 60
    new-instance v0, Lcom/jcraft/jsch/ChannelExec;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelExec;-><init>()V

    goto :goto_d

    .line 62
    :cond_2a
    const-string v0, "x11"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 63
    new-instance v0, Lcom/jcraft/jsch/ChannelX11;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelX11;-><init>()V

    goto :goto_d

    .line 65
    :cond_38
    const-string v0, "auth-agent@openssh.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 66
    new-instance v0, Lcom/jcraft/jsch/ChannelAgentForwarding;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelAgentForwarding;-><init>()V

    goto :goto_d

    .line 68
    :cond_46
    const-string v0, "direct-tcpip"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    .line 69
    new-instance v0, Lcom/jcraft/jsch/ChannelDirectTCPIP;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelDirectTCPIP;-><init>()V

    goto :goto_d

    .line 71
    :cond_54
    const-string v0, "forwarded-tcpip"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    .line 72
    new-instance v0, Lcom/jcraft/jsch/ChannelForwardedTCPIP;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelForwardedTCPIP;-><init>()V

    goto :goto_d

    .line 74
    :cond_62
    const-string v0, "sftp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 75
    new-instance v0, Lcom/jcraft/jsch/ChannelSftp;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelSftp;-><init>()V

    goto :goto_d

    .line 77
    :cond_70
    const-string v0, "subsystem"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7e

    .line 78
    new-instance v0, Lcom/jcraft/jsch/ChannelSubsystem;

    invoke-direct {v0}, Lcom/jcraft/jsch/ChannelSubsystem;-><init>()V

    goto :goto_d

    .line 80
    :cond_7e
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method declared-synchronized addRemoteWindowSize(J)V
    .registers 5
    .param p1, "foo"    # J

    .prologue
    .line 424
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lcom/jcraft/jsch/Channel;->rwsize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/jcraft/jsch/Channel;->rwsize:J

    .line 425
    iget v0, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    if-lez v0, :cond_d

    .line 426
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 427
    :cond_d
    monitor-exit p0

    return-void

    .line 424
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method close()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 519
    iget-boolean v3, p0, Lcom/jcraft/jsch/Channel;->close:Z

    if-eqz v3, :cond_6

    .line 539
    :cond_5
    :goto_5
    return-void

    .line 520
    :cond_6
    iput-boolean v4, p0, Lcom/jcraft/jsch/Channel;->close:Z

    .line 521
    iput-boolean v4, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    iput-boolean v4, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    .line 523
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v1

    .line 524
    .local v1, "i":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_5

    .line 527
    :try_start_13
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v3, 0x64

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 528
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v2, Lcom/jcraft/jsch/Packet;

    invoke-direct {v2, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 529
    .local v2, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v2}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 530
    const/16 v3, 0x61

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 531
    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 532
    monitor-enter p0
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_2b} :catch_37

    .line 533
    :try_start_2b
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 534
    monitor-exit p0

    goto :goto_5

    :catchall_34
    move-exception v3

    monitor-exit p0
    :try_end_36
    .catchall {:try_start_2b .. :try_end_36} :catchall_34

    :try_start_36
    throw v3
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_37} :catch_37

    .line 536
    .end local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v2    # "packet":Lcom/jcraft/jsch/Packet;
    :catch_37
    move-exception v3

    goto :goto_5
.end method

.method public connect()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 145
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Channel;->connect(I)V

    .line 146
    return-void
.end method

.method public connect(I)V
    .registers 5
    .param p1, "connectTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 149
    iput p1, p0, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    .line 151
    :try_start_2
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->sendChannelOpen()V

    .line 152
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->start()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_8} :catch_9

    .line 161
    return-void

    .line 154
    :catch_9
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 156
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->disconnect()V

    .line 157
    instance-of v1, v0, Lcom/jcraft/jsch/JSchException;

    if-eqz v1, :cond_17

    .line 158
    check-cast v0, Lcom/jcraft/jsch/JSchException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 159
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_17
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public disconnect()V
    .registers 2

    .prologue
    .line 570
    :try_start_0
    monitor-enter p0
    :try_end_1
    .catchall {:try_start_0 .. :try_end_1} :catchall_29

    .line 571
    :try_start_1
    iget-boolean v0, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    if-nez v0, :cond_a

    .line 572
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_26

    .line 594
    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->del(Lcom/jcraft/jsch/Channel;)V

    .line 596
    :goto_9
    return-void

    .line 574
    :cond_a
    const/4 v0, 0x0

    :try_start_b
    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 575
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_26

    .line 577
    :try_start_e
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->close()V

    .line 579
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 581
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/Channel;->thread:Ljava/lang/Thread;
    :try_end_19
    .catchall {:try_start_e .. :try_end_19} :catchall_29

    .line 584
    :try_start_19
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    if-eqz v0, :cond_22

    .line 585
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0}, Lcom/jcraft/jsch/IO;->close()V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_22} :catch_2e
    .catchall {:try_start_19 .. :try_end_22} :catchall_29

    .line 594
    :cond_22
    :goto_22
    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->del(Lcom/jcraft/jsch/Channel;)V

    goto :goto_9

    .line 575
    :catchall_26
    move-exception v0

    :try_start_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_26

    :try_start_28
    throw v0
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_29

    .line 594
    :catchall_29
    move-exception v0

    invoke-static {p0}, Lcom/jcraft/jsch/Channel;->del(Lcom/jcraft/jsch/Channel;)V

    throw v0

    .line 588
    :catch_2e
    move-exception v0

    goto :goto_22
.end method

.method eof()V
    .registers 5

    .prologue
    .line 456
    iget-boolean v3, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    if-eqz v3, :cond_5

    .line 480
    :cond_4
    :goto_4
    return-void

    .line 457
    :cond_5
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/jcraft/jsch/Channel;->eof_local:Z

    .line 459
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v1

    .line 460
    .local v1, "i":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_4

    .line 463
    :try_start_f
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v3, 0x64

    invoke-direct {v0, v3}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 464
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v2, Lcom/jcraft/jsch/Packet;

    invoke-direct {v2, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 465
    .local v2, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v2}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 466
    const/16 v3, 0x60

    invoke-virtual {v0, v3}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 467
    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 468
    monitor-enter p0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_27} :catch_37

    .line 469
    :try_start_27
    iget-boolean v3, p0, Lcom/jcraft/jsch/Channel;->close:Z

    if-nez v3, :cond_32

    .line 470
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 471
    :cond_32
    monitor-exit p0

    goto :goto_4

    :catchall_34
    move-exception v3

    monitor-exit p0
    :try_end_36
    .catchall {:try_start_27 .. :try_end_36} :catchall_34

    :try_start_36
    throw v3
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_37} :catch_37

    .line 473
    .end local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v2    # "packet":Lcom/jcraft/jsch/Packet;
    :catch_37
    move-exception v3

    goto :goto_4
.end method

.method eof_remote()V
    .registers 2

    .prologue
    .line 448
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    .line 450
    :try_start_3
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0}, Lcom/jcraft/jsch/IO;->out_close()V
    :try_end_8
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_8} :catch_9

    .line 453
    :goto_8
    return-void

    .line 452
    :catch_9
    move-exception v0

    goto :goto_8
.end method

.method protected genChannelOpenPacket()Lcom/jcraft/jsch/Packet;
    .registers 4

    .prologue
    .line 709
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 710
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 716
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 717
    const/16 v2, 0x5a

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 718
    iget-object v2, p0, Lcom/jcraft/jsch/Channel;->type:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 719
    iget v2, p0, Lcom/jcraft/jsch/Channel;->id:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 720
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 721
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 722
    return-object v1
.end method

.method getData(Lcom/jcraft/jsch/Buffer;)V
    .registers 4
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;

    .prologue
    .line 171
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Channel;->setRecipient(I)V

    .line 172
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getUInt()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/jcraft/jsch/Channel;->setRemoteWindowSize(J)V

    .line 173
    invoke-virtual {p1}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Channel;->setRemotePacketSize(I)V

    .line 174
    return-void
.end method

.method public getExitStatus()I
    .registers 2

    .prologue
    .line 665
    iget v0, p0, Lcom/jcraft/jsch/Channel;->exitstatus:I

    return v0
.end method

.method public getExtInputStream()Ljava/io/InputStream;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v6, 0x8000

    const/4 v3, 0x0

    .line 211
    const v1, 0x8000

    .line 213
    .local v1, "max_input_buffer_size":I
    :try_start_7
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v4

    const-string v5, "max_input_buffer_size"

    invoke-virtual {v4, v5}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_14} :catch_2a

    move-result v1

    .line 217
    :goto_15
    new-instance v0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-direct {v0, p0, v6, v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;II)V

    .line 222
    .local v0, "in":Ljava/io/PipedInputStream;
    if-ge v6, v1, :cond_28

    const/4 v2, 0x1

    .line 223
    .local v2, "resizable":Z
    :goto_1d
    iget-object v4, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    new-instance v5, Lcom/jcraft/jsch/Channel$PassiveOutputStream;

    invoke-direct {v5, p0, v0, v2}, Lcom/jcraft/jsch/Channel$PassiveOutputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedInputStream;Z)V

    invoke-virtual {v4, v5, v3}, Lcom/jcraft/jsch/IO;->setExtOutputStream(Ljava/io/OutputStream;Z)V

    .line 224
    return-object v0

    .end local v2    # "resizable":Z
    :cond_28
    move v2, v3

    .line 222
    goto :goto_1d

    .line 216
    .end local v0    # "in":Ljava/io/PipedInputStream;
    :catch_2a
    move-exception v4

    goto :goto_15
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 678
    iget v0, p0, Lcom/jcraft/jsch/Channel;->id:I

    return v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v6, 0x8000

    const/4 v3, 0x0

    .line 195
    const v1, 0x8000

    .line 197
    .local v1, "max_input_buffer_size":I
    :try_start_7
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v4

    const-string v5, "max_input_buffer_size"

    invoke-virtual {v4, v5}, Lcom/jcraft/jsch/Session;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_14} :catch_2a

    move-result v1

    .line 201
    :goto_15
    new-instance v0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-direct {v0, p0, v6, v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;II)V

    .line 206
    .local v0, "in":Ljava/io/PipedInputStream;
    if-ge v6, v1, :cond_28

    const/4 v2, 0x1

    .line 207
    .local v2, "resizable":Z
    :goto_1d
    iget-object v4, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    new-instance v5, Lcom/jcraft/jsch/Channel$PassiveOutputStream;

    invoke-direct {v5, p0, v0, v2}, Lcom/jcraft/jsch/Channel$PassiveOutputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedInputStream;Z)V

    invoke-virtual {v4, v5, v3}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;Z)V

    .line 208
    return-object v0

    .end local v2    # "resizable":Z
    :cond_28
    move v2, v3

    .line 206
    goto :goto_1d

    .line 200
    .end local v0    # "in":Ljava/io/PipedInputStream;
    :catch_2a
    move-exception v4

    goto :goto_15
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    move-object v0, p0

    .line 229
    .local v0, "channel":Lcom/jcraft/jsch/Channel;
    new-instance v1, Lcom/jcraft/jsch/Channel$1;

    invoke-direct {v1, p0, v0}, Lcom/jcraft/jsch/Channel$1;-><init>(Lcom/jcraft/jsch/Channel;Lcom/jcraft/jsch/Channel;)V

    .line 325
    .local v1, "out":Ljava/io/OutputStream;
    return-object v1
.end method

.method getRecipient()I
    .registers 2

    .prologue
    .line 138
    iget v0, p0, Lcom/jcraft/jsch/Channel;->recipient:I

    return v0
.end method

.method public getSession()Lcom/jcraft/jsch/Session;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 672
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    .line 673
    .local v0, "_session":Lcom/jcraft/jsch/Session;
    if-nez v0, :cond_c

    .line 674
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    const-string v2, "session is not available"

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 676
    :cond_c
    return-object v0
.end method

.method init()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 142
    return-void
.end method

.method public isClosed()Z
    .registers 2

    .prologue
    .line 541
    iget-boolean v0, p0, Lcom/jcraft/jsch/Channel;->close:Z

    return v0
.end method

.method public isConnected()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 599
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    .line 600
    .local v0, "_session":Lcom/jcraft/jsch/Session;
    if-eqz v0, :cond_10

    .line 601
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_10

    iget-boolean v2, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    if-eqz v2, :cond_10

    const/4 v1, 0x1

    .line 603
    :cond_10
    return v1
.end method

.method public isEOF()Z
    .registers 2

    .prologue
    .line 168
    iget-boolean v0, p0, Lcom/jcraft/jsch/Channel;->eof_remote:Z

    return v0
.end method

.method public run()V
    .registers 1

    .prologue
    .line 431
    return-void
.end method

.method protected sendChannelOpen()V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    const/4 v13, -0x1

    const-wide/16 v11, 0x0

    .line 726
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 727
    .local v0, "_session":Lcom/jcraft/jsch/Session;
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v9

    if-nez v9, :cond_16

    .line 728
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "session is down"

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 731
    :cond_16
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->genChannelOpenPacket()Lcom/jcraft/jsch/Packet;

    move-result-object v1

    .line 732
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 734
    const/16 v2, 0x7d0

    .line 735
    .local v2, "retry":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 736
    .local v3, "start":J
    iget v9, p0, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    int-to-long v7, v9

    .line 737
    .local v7, "timeout":J
    cmp-long v9, v7, v11

    if-eqz v9, :cond_2b

    const/4 v2, 0x1

    .line 738
    :cond_2b
    monitor-enter p0

    .line 741
    :goto_2c
    :try_start_2c
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v9

    if-ne v9, v13, :cond_6a

    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_6a

    if-lez v2, :cond_6a

    .line 742
    cmp-long v9, v7, v11

    if-lez v9, :cond_49

    .line 743
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_41
    .catchall {:try_start_2c .. :try_end_41} :catchall_62

    move-result-wide v9

    sub-long/2addr v9, v3

    cmp-long v9, v9, v7

    if-lez v9, :cond_49

    .line 744
    const/4 v2, 0x0

    .line 745
    goto :goto_2c

    .line 749
    :cond_49
    cmp-long v9, v7, v11

    if-nez v9, :cond_5b

    const-wide/16 v5, 0xa

    .line 750
    .local v5, "t":J
    :goto_4f
    const/4 v9, 0x1

    :try_start_50
    iput v9, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 751
    invoke-virtual {p0, v5, v6}, Ljava/lang/Object;->wait(J)V
    :try_end_55
    .catch Ljava/lang/InterruptedException; {:try_start_50 .. :try_end_55} :catch_5d
    .catchall {:try_start_50 .. :try_end_55} :catchall_65

    .line 756
    const/4 v9, 0x0

    :try_start_56
    iput v9, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    .line 758
    :goto_58
    add-int/lit8 v2, v2, -0x1

    goto :goto_2c

    .end local v5    # "t":J
    :cond_5b
    move-wide v5, v7

    .line 749
    goto :goto_4f

    .line 753
    .restart local v5    # "t":J
    :catch_5d
    move-exception v9

    .line 756
    const/4 v9, 0x0

    iput v9, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    goto :goto_58

    .line 760
    .end local v5    # "t":J
    :catchall_62
    move-exception v9

    monitor-exit p0
    :try_end_64
    .catchall {:try_start_56 .. :try_end_64} :catchall_62

    throw v9

    .line 756
    .restart local v5    # "t":J
    :catchall_65
    move-exception v9

    const/4 v10, 0x0

    :try_start_67
    iput v10, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    throw v9

    .line 760
    .end local v5    # "t":J
    :cond_6a
    monitor-exit p0
    :try_end_6b
    .catchall {:try_start_67 .. :try_end_6b} :catchall_62

    .line 761
    invoke-virtual {v0}, Lcom/jcraft/jsch/Session;->isConnected()Z

    move-result v9

    if-nez v9, :cond_79

    .line 762
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "session is down"

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 764
    :cond_79
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v9

    if-ne v9, v13, :cond_87

    .line 765
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "channel is not opened."

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 767
    :cond_87
    iget-boolean v9, p0, Lcom/jcraft/jsch/Channel;->open_confirmation:Z

    if-nez v9, :cond_93

    .line 768
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    const-string v10, "channel is not opened."

    invoke-direct {v9, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 770
    :cond_93
    iput-boolean v14, p0, Lcom/jcraft/jsch/Channel;->connected:Z

    .line 771
    return-void
.end method

.method protected sendOpenConfirmation()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 681
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 682
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 683
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 684
    const/16 v2, 0x5b

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 685
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 686
    iget v2, p0, Lcom/jcraft/jsch/Channel;->id:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 687
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 688
    iget v2, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 689
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 690
    return-void
.end method

.method protected sendOpenFailure(I)V
    .registers 5
    .param p1, "reasoncode"    # I

    .prologue
    .line 694
    :try_start_0
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    const/16 v2, 0x64

    invoke-direct {v0, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 695
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 696
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 697
    const/16 v2, 0x5c

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 698
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 699
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 700
    const-string v2, "open failed"

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 701
    sget-object v2, Lcom/jcraft/jsch/Util;->empty:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 702
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_33} :catch_34

    .line 706
    .end local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v1    # "packet":Lcom/jcraft/jsch/Packet;
    :goto_33
    return-void

    .line 704
    :catch_34
    move-exception v2

    goto :goto_33
.end method

.method public sendSignal(Ljava/lang/String;)V
    .registers 4
    .param p1, "signal"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 607
    new-instance v0, Lcom/jcraft/jsch/RequestSignal;

    invoke-direct {v0}, Lcom/jcraft/jsch/RequestSignal;-><init>()V

    .line 608
    .local v0, "request":Lcom/jcraft/jsch/RequestSignal;
    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/RequestSignal;->setSignal(Ljava/lang/String;)V

    .line 609
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Lcom/jcraft/jsch/RequestSignal;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 610
    return-void
.end method

.method setExitStatus(I)V
    .registers 2
    .param p1, "status"    # I

    .prologue
    .line 664
    iput p1, p0, Lcom/jcraft/jsch/Channel;->exitstatus:I

    return-void
.end method

.method public setExtOutputStream(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/jcraft/jsch/IO;->setExtOutputStream(Ljava/io/OutputStream;Z)V

    .line 190
    return-void
.end method

.method public setExtOutputStream(Ljava/io/OutputStream;Z)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "dontclose"    # Z

    .prologue
    .line 192
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2}, Lcom/jcraft/jsch/IO;->setExtOutputStream(Ljava/io/OutputStream;Z)V

    .line 193
    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;Z)V

    .line 178
    return-void
.end method

.method public setInputStream(Ljava/io/InputStream;Z)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "dontclose"    # Z

    .prologue
    .line 180
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;Z)V

    .line 181
    return-void
.end method

.method setLocalPacketSize(I)V
    .registers 2
    .param p1, "foo"    # I

    .prologue
    .line 421
    iput p1, p0, Lcom/jcraft/jsch/Channel;->lmpsize:I

    return-void
.end method

.method setLocalWindowSize(I)V
    .registers 2
    .param p1, "foo"    # I

    .prologue
    .line 420
    iput p1, p0, Lcom/jcraft/jsch/Channel;->lwsize:I

    return-void
.end method

.method setLocalWindowSizeMax(I)V
    .registers 2
    .param p1, "foo"    # I

    .prologue
    .line 419
    iput p1, p0, Lcom/jcraft/jsch/Channel;->lwsize_max:I

    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;Z)V

    .line 184
    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;Z)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "dontclose"    # Z

    .prologue
    .line 186
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;Z)V

    .line 187
    return-void
.end method

.method declared-synchronized setRecipient(I)V
    .registers 3
    .param p1, "foo"    # I

    .prologue
    .line 133
    monitor-enter p0

    :try_start_1
    iput p1, p0, Lcom/jcraft/jsch/Channel;->recipient:I

    .line 134
    iget v0, p0, Lcom/jcraft/jsch/Channel;->notifyme:I

    if-lez v0, :cond_a

    .line 135
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 136
    :cond_a
    monitor-exit p0

    return-void

    .line 133
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setRemotePacketSize(I)V
    .registers 2
    .param p1, "foo"    # I

    .prologue
    .line 428
    iput p1, p0, Lcom/jcraft/jsch/Channel;->rmpsize:I

    return-void
.end method

.method declared-synchronized setRemoteWindowSize(J)V
    .registers 4
    .param p1, "foo"    # J

    .prologue
    .line 422
    monitor-enter p0

    :try_start_1
    iput-wide p1, p0, Lcom/jcraft/jsch/Channel;->rwsize:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-void

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setSession(Lcom/jcraft/jsch/Session;)V
    .registers 2
    .param p1, "session"    # Lcom/jcraft/jsch/Session;

    .prologue
    .line 668
    iput-object p1, p0, Lcom/jcraft/jsch/Channel;->session:Lcom/jcraft/jsch/Session;

    .line 669
    return-void
.end method

.method public setXForwarding(Z)V
    .registers 2
    .param p1, "foo"    # Z

    .prologue
    .line 164
    return-void
.end method

.method public start()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 166
    return-void
.end method

.method write([B)V
    .registers 4
    .param p1, "foo"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 434
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/Channel;->write([BII)V

    .line 435
    return-void
.end method

.method write([BII)V
    .registers 5
    .param p1, "foo"    # [B
    .param p2, "s"    # I
    .param p3, "l"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 438
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2, p3}, Lcom/jcraft/jsch/IO;->put([BII)V
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_6

    .line 440
    :goto_5
    return-void

    .line 439
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method write_ext([BII)V
    .registers 5
    .param p1, "foo"    # [B
    .param p2, "s"    # I
    .param p3, "l"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 443
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/Channel;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {v0, p1, p2, p3}, Lcom/jcraft/jsch/IO;->put_ext([BII)V
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_6

    .line 445
    :goto_5
    return-void

    .line 444
    :catch_6
    move-exception v0

    goto :goto_5
.end method
