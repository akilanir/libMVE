.class public Lcom/jcraft/jsch/ChannelShell;
.super Lcom/jcraft/jsch/ChannelSession;
.source "ChannelShell.java"


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSession;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelShell;->pty:Z

    .line 39
    return-void
.end method


# virtual methods
.method init()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelShell;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelShell;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->in:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 68
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelShell;->io:Lcom/jcraft/jsch/IO;

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelShell;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    iget-object v1, v1, Lcom/jcraft/jsch/Session;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 69
    return-void
.end method

.method public bridge synthetic run()V
    .registers 1

    .prologue
    .line 34
    invoke-super {p0}, Lcom/jcraft/jsch/ChannelSession;->run()V

    return-void
.end method

.method public bridge synthetic setAgentForwarding(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setAgentForwarding(Z)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setEnv(Ljava/util/Hashtable;)V
    .registers 2
    .param p1, "x0"    # Ljava/util/Hashtable;

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setEnv(Ljava/util/Hashtable;)V

    return-void
.end method

.method public bridge synthetic setEnv([B[B)V
    .registers 3
    .param p1, "x0"    # [B
    .param p2, "x1"    # [B

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/ChannelSession;->setEnv([B[B)V

    return-void
.end method

.method public bridge synthetic setPty(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setPty(Z)V

    return-void
.end method

.method public bridge synthetic setPtySize(IIII)V
    .registers 5
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I

    .prologue
    .line 34
    invoke-super {p0, p1, p2, p3, p4}, Lcom/jcraft/jsch/ChannelSession;->setPtySize(IIII)V

    return-void
.end method

.method public bridge synthetic setPtyType(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 34
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
    .line 34
    invoke-super/range {p0 .. p5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    return-void
.end method

.method public bridge synthetic setTerminalMode([B)V
    .registers 2
    .param p1, "x0"    # [B

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setTerminalMode([B)V

    return-void
.end method

.method public bridge synthetic setXForwarding(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/jcraft/jsch/ChannelSession;->setXForwarding(Z)V

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
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelShell;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    .line 44
    .local v0, "_session":Lcom/jcraft/jsch/Session;
    :try_start_4
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelShell;->sendRequests()V

    .line 46
    new-instance v2, Lcom/jcraft/jsch/RequestShell;

    invoke-direct {v2}, Lcom/jcraft/jsch/RequestShell;-><init>()V

    .line 47
    .local v2, "request":Lcom/jcraft/jsch/Request;
    invoke-virtual {v2, v0, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_f} :catch_47

    .line 56
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelShell;->io:Lcom/jcraft/jsch/IO;

    iget-object v3, v3, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v3, :cond_46

    .line 57
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v3, p0, Lcom/jcraft/jsch/ChannelShell;->thread:Ljava/lang/Thread;

    .line 58
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelShell;->thread:Ljava/lang/Thread;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Shell for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/jcraft/jsch/Session;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 59
    iget-boolean v3, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    if-eqz v3, :cond_41

    .line 60
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelShell;->thread:Ljava/lang/Thread;

    iget-boolean v4, v0, Lcom/jcraft/jsch/Session;->daemon_thread:Z

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 62
    :cond_41
    iget-object v3, p0, Lcom/jcraft/jsch/ChannelShell;->thread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 64
    :cond_46
    return-void

    .line 49
    .end local v2    # "request":Lcom/jcraft/jsch/Request;
    :catch_47
    move-exception v1

    .line 50
    .local v1, "e":Ljava/lang/Exception;
    instance-of v3, v1, Lcom/jcraft/jsch/JSchException;

    if-eqz v3, :cond_4f

    check-cast v1, Lcom/jcraft/jsch/JSchException;

    .end local v1    # "e":Ljava/lang/Exception;
    throw v1

    .line 51
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_4f
    instance-of v3, v1, Ljava/lang/Throwable;

    if-eqz v3, :cond_5b

    .line 52
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelShell"

    invoke-direct {v3, v4, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 53
    :cond_5b
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v4, "ChannelShell"

    invoke-direct {v3, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
