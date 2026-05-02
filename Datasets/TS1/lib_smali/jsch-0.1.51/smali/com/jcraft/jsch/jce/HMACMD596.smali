.class public Lcom/jcraft/jsch/jce/HMACMD596;
.super Lcom/jcraft/jsch/jce/HMACMD5;
.source "HMACMD596.java"


# instance fields
.field private final _buf16:[B


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/jcraft/jsch/jce/HMACMD5;-><init>()V

    .line 41
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/jce/HMACMD596;->_buf16:[B

    .line 34
    const-string v0, "hmac-md5-96"

    iput-object v0, p0, Lcom/jcraft/jsch/jce/HMACMD596;->name:Ljava/lang/String;

    .line 35
    return-void
.end method


# virtual methods
.method public doFinal([BI)V
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    const/4 v2, 0x0

    .line 43
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMACMD596;->_buf16:[B

    invoke-super {p0, v0, v2}, Lcom/jcraft/jsch/jce/HMACMD5;->doFinal([BI)V

    .line 44
    iget-object v0, p0, Lcom/jcraft/jsch/jce/HMACMD596;->_buf16:[B

    const/16 v1, 0xc

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    return-void
.end method

.method public getBlockSize()I
    .registers 2

    .prologue
    .line 38
    const/16 v0, 0xc

    return v0
.end method
