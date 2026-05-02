.class Lcom/jcraft/jsch/RequestExec;
.super Lcom/jcraft/jsch/Request;
.source "RequestExec.java"


# instance fields
.field private command:[B


# direct methods
.method constructor <init>([B)V
    .registers 3
    .param p1, "command"    # [B

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/jcraft/jsch/Request;-><init>()V

    .line 33
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/RequestExec;->command:[B

    .line 35
    iput-object p1, p0, Lcom/jcraft/jsch/RequestExec;->command:[B

    .line 36
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
    .line 38
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 40
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 41
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v1, Lcom/jcraft/jsch/Packet;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 49
    .local v1, "packet":Lcom/jcraft/jsch/Packet;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 50
    const/16 v2, 0x62

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 51
    invoke-virtual {p2}, Lcom/jcraft/jsch/Channel;->getRecipient()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 52
    const-string v2, "exec"

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 53
    invoke-virtual {p0}, Lcom/jcraft/jsch/RequestExec;->waitForReply()Z

    move-result v2

    if-eqz v2, :cond_41

    const/4 v2, 0x1

    :goto_2c
    int-to-byte v2, v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 54
    iget-object v2, p0, Lcom/jcraft/jsch/RequestExec;->command:[B

    array-length v2, v2

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->checkFreeSize(I)V

    .line 55
    iget-object v2, p0, Lcom/jcraft/jsch/RequestExec;->command:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 56
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/RequestExec;->write(Lcom/jcraft/jsch/Packet;)V

    .line 57
    return-void

    .line 53
    :cond_41
    const/4 v2, 0x0

    goto :goto_2c
.end method
