.class public Lcom/jcraft/jsch/jce/AES128CTR;
.super Ljava/lang/Object;
.source "AES128CTR.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x10

.field private static final ivsize:I = 0x10


# instance fields
.field private cipher:Ljavax/crypto/Cipher;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBlockSize()I
    .registers 2

    .prologue
    .line 40
    const/16 v0, 0x10

    return v0
.end method

.method public getIVSize()I
    .registers 2

    .prologue
    .line 39
    const/16 v0, 0x10

    return v0
.end method

.method public init(I[B[B)V
    .registers 12
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

    .line 42
    const-string v2, "NoPadding"

    .line 44
    .local v2, "pad":Ljava/lang/String;
    array-length v4, p3

    if-le v4, v6, :cond_f

    .line 45
    new-array v3, v6, [B

    .line 46
    .local v3, "tmp":[B
    array-length v4, v3

    invoke-static {p3, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    move-object p3, v3

    .line 49
    .end local v3    # "tmp":[B
    :cond_f
    array-length v4, p2

    if-le v4, v6, :cond_19

    .line 50
    new-array v3, v6, [B

    .line 51
    .restart local v3    # "tmp":[B
    array-length v4, v3

    invoke-static {p2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    move-object p2, v3

    .line 56
    .end local v3    # "tmp":[B
    :cond_19
    :try_start_19
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "AES"

    invoke-direct {v1, p2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 57
    .local v1, "keyspec":Ljavax/crypto/spec/SecretKeySpec;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AES/CTR/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/jce/AES128CTR;->cipher:Ljavax/crypto/Cipher;

    .line 58
    const-class v5, Ljavax/crypto/Cipher;

    monitor-enter v5
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_3c} :catch_50

    .line 59
    :try_start_3c
    iget-object v6, p0, Lcom/jcraft/jsch/jce/AES128CTR;->cipher:Ljavax/crypto/Cipher;

    if-nez p1, :cond_4b

    const/4 v4, 0x1

    :goto_41
    new-instance v7, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v7, p3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v6, v4, v1, v7}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 63
    monitor-exit v5

    .line 69
    return-void

    .line 59
    :cond_4b
    const/4 v4, 0x2

    goto :goto_41

    .line 63
    :catchall_4d
    move-exception v4

    monitor-exit v5
    :try_end_4f
    .catchall {:try_start_3c .. :try_end_4f} :catchall_4d

    :try_start_4f
    throw v4
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_50} :catch_50

    .line 65
    .end local v1    # "keyspec":Ljavax/crypto/spec/SecretKeySpec;
    :catch_50
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/jcraft/jsch/jce/AES128CTR;->cipher:Ljavax/crypto/Cipher;

    .line 67
    throw v0
.end method

.method public isCBC()Z
    .registers 2

    .prologue
    .line 74
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
    .line 71
    iget-object v0, p0, Lcom/jcraft/jsch/jce/AES128CTR;->cipher:Ljavax/crypto/Cipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 72
    return-void
.end method
