.class public Lcom/jcraft/jsch/jcraft/HMACMD5;
.super Lcom/jcraft/jsch/jcraft/HMAC;
.source "HMACMD5.java"

# interfaces
.implements Lcom/jcraft/jsch/MAC;


# static fields
.field private static final name:Ljava/lang/String; = "hmac-md5"


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/jcraft/jsch/jcraft/HMAC;-><init>()V

    .line 40
    const/4 v1, 0x0

    .line 41
    .local v1, "md":Ljava/security/MessageDigest;
    :try_start_4
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_e

    move-result-object v1

    .line 45
    :goto_a
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/jcraft/HMACMD5;->setH(Ljava/security/MessageDigest;)V

    .line 46
    return-void

    .line 42
    :catch_e
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_a
.end method


# virtual methods
.method public bridge synthetic doFinal([BI)V
    .registers 3
    .param p1, "x0"    # [B
    .param p2, "x1"    # I

    .prologue
    .line 35
    invoke-super {p0, p1, p2}, Lcom/jcraft/jsch/jcraft/HMAC;->doFinal([BI)V

    return-void
.end method

.method public bridge synthetic getBlockSize()I
    .registers 2

    .prologue
    .line 35
    invoke-super {p0}, Lcom/jcraft/jsch/jcraft/HMAC;->getBlockSize()I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 49
    const-string v0, "hmac-md5"

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
    .line 35
    invoke-super {p0, p1}, Lcom/jcraft/jsch/jcraft/HMAC;->init([B)V

    return-void
.end method

.method public bridge synthetic update(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 35
    invoke-super {p0, p1}, Lcom/jcraft/jsch/jcraft/HMAC;->update(I)V

    return-void
.end method

.method public bridge synthetic update([BII)V
    .registers 4
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 35
    invoke-super {p0, p1, p2, p3}, Lcom/jcraft/jsch/jcraft/HMAC;->update([BII)V

    return-void
.end method
