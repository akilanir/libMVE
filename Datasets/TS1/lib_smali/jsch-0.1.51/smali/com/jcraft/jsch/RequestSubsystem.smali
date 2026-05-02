.class public Lcom/jcraft/jsch/RequestSubsystem;
.super Lcom/jcraft/jsch/Request;
.source "RequestSubsystem.java"


# instance fields
.field private subsystem:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/jcraft/jsch/Request;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/RequestSubsystem;->subsystem:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V
    .registers 6
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .param p2, "channel"    # Lcom/jcraft/jsch/Channel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 42
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 43
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 45
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 46
    const/16 v2, 0x62

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 47
    invoke-virtual {p2}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 48
    const-string v2, "subsystem"

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 49
    invoke-virtual {p0}, Lcom/jcraft/jsch/RequestSubsystem;->waitForReply()Z

    move-result v2

    if-eqz v2, :cond_3d

    const/4 v2, 0x1

    :goto_2c
    int-to-byte v2, v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 50
    iget-object v2, p0, Lcom/jcraft/jsch/RequestSubsystem;->subsystem:Ljava/lang/String;

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 51
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/RequestSubsystem;->write(Lcom/jcraft/jsch/Packet;)V

    .line 52
    return-void

    .line 49
    :cond_3d
    const/4 v2, 0x0

    goto :goto_2c
.end method

.method public request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "session"    # Lcom/jcraft/jsch/Session;
    .param p2, "channel"    # Lcom/jcraft/jsch/Channel;
    .param p3, "subsystem"    # Ljava/lang/String;
    .param p4, "want_reply"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    invoke-virtual {p0, p4}, Lcom/jcraft/jsch/RequestSubsystem;->setReply(Z)V

    .line 36
    iput-object p3, p0, Lcom/jcraft/jsch/RequestSubsystem;->subsystem:Ljava/lang/String;

    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/jcraft/jsch/RequestSubsystem;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 38
    return-void
.end method
