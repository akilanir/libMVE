.class public Lcom/jcraft/jsch/jce/HMACSHA1;
.super Lcom/jcraft/jsch/jce/HMAC;
.source "HMACSHA1.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/jcraft/jsch/jce/HMAC;-><init>()V

    .line 34
    const-string v0, "hmac-sha1"

    iput-object v0, p0, Lcom/jcraft/jsch/jce/HMACSHA1;->name:Ljava/lang/String;

    .line 35
    const/16 v0, 0x14

    iput v0, p0, Lcom/jcraft/jsch/jce/HMACSHA1;->bsize:I

    .line 36
    const-string v0, "HmacSHA1"

    iput-object v0, p0, Lcom/jcraft/jsch/jce/HMACSHA1;->algorithm:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public bridge synthetic doFinal([BI)V
    .registers 3
    .param p1, "x0"    # [B
    .param p2, "x1"    # I

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/jce/HMAC;->doFinal([BI)V

    return-void
.end method

.method public bridge synthetic getBlockSize()I
    .registers 2

    .prologue
    .line 32
    invoke-super {p0}, Lcom/jcraft/jsch/jce/HMAC;->getBlockSize()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 32
    invoke-super {p0}, Lcom/jcraft/jsch/jce/HMAC;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic init([B)V
    .registers 2
    .param p1, "x0"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/jce/HMAC;->init([B)V

    return-void
.end method

.method public bridge synthetic update(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 32
    invoke-super {p0, p1}, Lcom/jcraft/jsch/jce/HMAC;->update(I)V

    return-void
.end method

.method public bridge synthetic update([BII)V
    .registers 4
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 32
    invoke-super {p0, p1, p2, p3}, Lcom/jcraft/jsch/jce/HMAC;->update([BII)V

    return-void
.end method
