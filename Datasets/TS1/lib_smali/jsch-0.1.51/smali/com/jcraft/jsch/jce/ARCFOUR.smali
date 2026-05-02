.class public Lcom/jcraft/jsch/jce/ARCFOUR;
.super Ljava/lang/Object;
.source "ARCFOUR.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x10

.field private static final ivsize:I = 0x8


# instance fields
.field private cipher:Ljavax/crypto/Cipher;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBlockSize()I
    .registers 2

    .prologue
    .line 41
    const/16 v0, 0x10

    return v0
.end method

.method public getIVSize()I
    .registers 2

    .prologue
    .line 40
    const/16 v0, 0x8

    return v0
.end method

.method public init(I[B[B)V
    .registers 11
    .param p1, "mode"    # I
    .param p2, "key"    # [B
    .param p3, "iv"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v6, 0x10

    const/4 v5, 0x0

    .line 43
    const-string v2, "NoPadding"

    .line 45
    .local v2, "pad":Ljava/lang/String;
    array-length v4, p2

    if-le v4, v6, :cond_f

    .line 46
    new-array v3, v6, [B

    .line 47
    .local v3, "tmp":[B
    array-length v4, v3

    invoke-static {p2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    move-object p2, v3

    .line 52
    .end local v3    # "tmp":[B
    :cond_f
    :try_start_f
    const-string v4, "RC4"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    .line 53
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "RC4"

    invoke-direct {v0, p2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 54
    .local v0, "_key":Ljavax/crypto/spec/SecretKeySpec;
    const-class v5, Ljavax/crypto/Cipher;

    monitor-enter v5
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_21} :catch_30

    .line 55
    :try_start_21
    iget-object v6, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    if-nez p1, :cond_2b

    const/4 v4, 0x1

    :goto_26
    invoke-virtual {v6, v4, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 59
    monitor-exit v5

    .line 65
    return-void

    .line 55
    :cond_2b
    const/4 v4, 0x2

    goto :goto_26

    .line 59
    :catchall_2d
    move-exception v4

    monitor-exit v5
    :try_end_2f
    .catchall {:try_start_21 .. :try_end_2f} :catchall_2d

    :try_start_2f
    throw v4
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_30} :catch_30

    .line 61
    .end local v0    # "_key":Ljavax/crypto/spec/SecretKeySpec;
    :catch_30
    move-exception v1

    .line 62
    .local v1, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    .line 63
    throw v1
.end method

.method public isCBC()Z
    .registers 2

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method

.method public update([BII[BI)V
    .registers 12
    .param p1, "foo"    # [B
    .param p2, "s1"    # I
    .param p3, "len"    # I
    .param p4, "bar"    # [B
    .param p5, "s2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR;->cipher:Ljavax/crypto/Cipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 68
    return-void
.end method
