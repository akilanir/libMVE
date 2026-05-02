.class abstract Lcom/jcraft/jsch/Request;
.super Ljava/lang/Object;
.source "Request.java"


# instance fields
.field private channel:Lcom/jcraft/jsch/Channel;

.field private reply:Z

.field private session:Lcom/jcraft/jsch/Session;


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/jcraft/jsch/Request;->reply:Z

    .line 34
    iput-object v1, p0, Lcom/jcraft/jsch/Request;->session:Lcom/jcraft/jsch/Session;

    .line 35
    iput-object v1, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    return-void
.end method


# virtual methods
.method request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V
    .registers 4
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .param p2, "channel"    # Lcom/jcraft/jsch/Channel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    iput-object p1, p0, Lcom/jcraft/jsch/Request;->session:Lcom/jcraft/jsch/Session;

    .line 38
    iput-object p2, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    .line 39
    iget v0, p2, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    if-lez v0, :cond_c

    .line 40
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/Request;->setReply(Z)V

    .line 42
    :cond_c
    return-void
.end method

.method setReply(Z)V
    .registers 2
    .param p1, "reply"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/jcraft/jsch/Request;->reply:Z

    return-void
.end method

.method waitForReply()Z
    .registers 2

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/jcraft/jsch/Request;->reply:Z

    return v0
.end method

.method write(Lcom/jcraft/jsch/Packet;)V
    .registers 9
    .param p1, "packet"    # Lcom/jcraft/jsch/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 46
    iget-boolean v4, p0, Lcom/jcraft/jsch/Request;->reply:Z

    if-eqz v4, :cond_9

    .line 47
    iget-object v4, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    iput v6, v4, Lcom/jcraft/jsch/Channel;->reply:I

    .line 49
    :cond_9
    iget-object v4, p0, Lcom/jcraft/jsch/Request;->session:Lcom/jcraft/jsch/Session;

    invoke-virtual {v4, p1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;)V

    .line 50
    iget-boolean v4, p0, Lcom/jcraft/jsch/Request;->reply:Z

    if-eqz v4, :cond_5a

    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 52
    .local v0, "start":J
    iget-object v4, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    iget v4, v4, Lcom/jcraft/jsch/Channel;->connectTimeout:I

    int-to-long v2, v4

    .line 53
    .local v2, "timeout":J
    :cond_1b
    iget-object v4, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    invoke-virtual {v4}, Lcom/jcraft/jsch/Channel;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_4a

    iget-object v4, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    iget v4, v4, Lcom/jcraft/jsch/Channel;->reply:I

    if-ne v4, v6, :cond_4a

    .line 54
    const-wide/16 v4, 0xa

    :try_start_2b
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2e} :catch_58

    .line 57
    :goto_2e
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_1b

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    cmp-long v4, v4, v2

    if-lez v4, :cond_1b

    .line 59
    iget-object v4, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    const/4 v5, 0x0

    iput v5, v4, Lcom/jcraft/jsch/Channel;->reply:I

    .line 60
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    const-string v5, "channel request: timeout"

    invoke-direct {v4, v5}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 64
    :cond_4a
    iget-object v4, p0, Lcom/jcraft/jsch/Request;->channel:Lcom/jcraft/jsch/Channel;

    iget v4, v4, Lcom/jcraft/jsch/Channel;->reply:I

    if-nez v4, :cond_5a

    .line 65
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    const-string v5, "failed to send channel request"

    invoke-direct {v4, v5}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 55
    :catch_58
    move-exception v4

    goto :goto_2e

    .line 68
    .end local v0    # "start":J
    .end local v2    # "timeout":J
    :cond_5a
    return-void
.end method
