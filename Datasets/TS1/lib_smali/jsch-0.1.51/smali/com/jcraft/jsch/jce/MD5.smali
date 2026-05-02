.class public Lcom/jcraft/jsch/jce/MD5;
.super Ljava/lang/Object;
.source "MD5.java"

# interfaces
.implements Lcom/jcraft/jsch/HASH;


# instance fields
.field md:Ljava/security/MessageDigest;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public digest()[B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/jcraft/jsch/jce/MD5;->md:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    return-object v0
.end method

.method public getBlockSize()I
    .registers 2

    .prologue
    .line 38
    const/16 v0, 0x10

    return v0
.end method

.method public init()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    :try_start_0
    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    iput-object v1, p0, Lcom/jcraft/jsch/jce/MD5;->md:Ljava/security/MessageDigest;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    .line 44
    :goto_8
    return-void

    .line 41
    :catch_9
    move-exception v0

    .line 42
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_8
.end method

.method public update([BII)V
    .registers 5
    .param p1, "foo"    # [B
    .param p2, "start"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lcom/jcraft/jsch/jce/MD5;->md:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 47
    return-void
.end method
