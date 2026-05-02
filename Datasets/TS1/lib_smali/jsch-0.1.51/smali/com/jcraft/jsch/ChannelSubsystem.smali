.class public Lcom/jcraft/jsch/ChannelSubsystem;
.super Lcom/jcraft/jsch/ChannelSession;
.source "ChannelSubsystem.java"


# instance fields
.field pty:Z

.field subsystem:Ljava/lang/String;

.field want_reply:Z

.field xforwading:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 33
    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->xforwading:Z

    .line 34
    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->pty:Z

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->want_reply:Z

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->subsystem:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getErrStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getExtInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method init()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 74
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSubsystem;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 75
    return-void
.end method

.method public bridge synthetic run()V
    .registers 1

    .prologue
    .line 32
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->run()V

    return-void
.end method

.method public bridge synthetic setAgentForwarding(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/util/Hashtable;)V
    .registers 2
    .param p1, "x0"    # Ljava/util/Hashtable;

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/util/Hashtable;)V

    return-void
.end method

.method public bridge synthetic setEnv([B[B)V
    .registers 3
    .param p1, "x0"    # [B
    .param p2, "x1"    # [B

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv([B[B)V

    return-void
.end method

.method public setErrStream(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 78
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/ChannelSubsystem;->setExtOutputStream(Ljava/io/OutputStream;)V

    .line 79
    return-void
.end method

.method public setPty(Z)V
    .registers 2
    .param p1, "foo"    # Z

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->pty:Z

    return-void
.end method

.method public bridge synthetic setPtySize(IIII)V
    .registers 5
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I

    .prologue
    .line 32
    invoke-super {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSession;->setPtySize(IIII)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;IIII)V
    .registers 6
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # I

    .prologue
    .line 32
    invoke-super/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    return-void
.end method

.method public setSubsystem(Ljava/lang/String;)V
    .registers 2
    .param p1, "foo"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->subsystem:Ljava/lang/String;

    return-void
.end method

.method public bridge synthetic setTerminalMode([B)V
    .registers 2
    .param p1, "x0"    # [B

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setTerminalMode([B)V

    return-void
.end method

.method public setWantReply(Z)V
    .registers 2
    .param p1, "foo"    # Z

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->want_reply:Z

    return-void
.end method

.method public setXForwarding(Z)V
    .registers 2
    .param p1, "foo"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSubsystem;->xforwading:Z

    return-void
.end method

.method public start()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSubsystem;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 45
    .local v0, "_session":Lcom/jcraft/jsch/Session;
    :try_start_4
    iget-boolean v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->xforwading:Z

    if-eqz v3, :cond_10

    .line 46
    new-instance v2, Lcom/jcraft/jsch/RequestX11;

    invoke-direct {v2}, Lcom/jcraft/jsch/RequestX11;-><init>()V

    .line 47
    .local v2, "request":Lcom/jcraft/jsch/Request;
    invoke-virtual {v2, v0, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 49
    .end local v2    # "request":Lcom/jcraft/jsch/Request;
    :cond_10
    iget-boolean v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->pty:Z

    if-eqz v3, :cond_1c

    .line 50
    new-instance v2, Lcom/jcraft/jsch/RequestPtyReq;

    invoke-direct {v2}, Lcom/jcraft/jsch/RequestPtyReq;-><init>()V

    .line 51
    .restart local v2    # "request":Lcom/jcraft/jsch/Request;
    invoke-virtual {v2, v0, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 53
    .end local v2    # "request":Lcom/jcraft/jsch/Request;
    :cond_1c
    new-instance v2, Lcom/jcraft/jsch/RequestSubsystem;

    invoke-direct {v2}, Lcom/jcraft/jsch/RequestSubsystem;-><init>()V

    .line 54
    .restart local v2    # "request":Lcom/jcraft/jsch/Request;
    check-cast v2, Lcom/jcraft/jsch/RequestSubsystem;

    .end local v2    # "request":Lcom/jcraft/jsch/Request;
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->subsystem:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/jcraft/jsch/ChannelSubsystem;->want_reply:Z

    invoke-virtual {v2, v0, p0, v3, v4}, Lcom/jcraft/jsch/RequestSubsystem;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;Ljava/lang/String;Z)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_2a} :catch_62

    .line 62
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->io:Lcom/jcraft/jsch/IO;

    iget-object v3, v3, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v3, :cond_61

    .line 63
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    .line 64
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Subsystem for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 65
    iget-boolean v3, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    if-eqz v3, :cond_5c

    .line 66
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    iget-boolean v4, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 68
    :cond_5c
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelSubsystem;->thread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 70
    :cond_61
    return-void

    .line 56
    :catch_62
    move-exception v1

    .line 57
    .local v1, "e":Ljava/lang/Exception;
    instance-of v3, v1, Lcom/jcraft/jsch/JSchException;

    if-eqz v3, :cond_6a

    check-cast v1, Lcom/jcraft/jsch/JSchException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 58
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_6a
    instance-of v3, v1, Ljava/lang/Throwable;

    if-eqz v3, :cond_76

    .line 59
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelSubsystem"

    invoke-direct {v3, v4, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 60
    :cond_76
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelSubsystem"

    invoke-direct {v3, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
