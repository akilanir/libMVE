.class public Lcom/jcraft/jsch/jce/ARCFOUR128;
.super Ljava/lang/Object;
.source "ARCFOUR128.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x10

.field private static final ivsize:I = 0x8

.field private static final skip:I = 0x600


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
    .line 42
    const/16 v0, 0x10

    return v0
.end method

.method public getIVSize()I
    .registers 2

    .prologue
    .line 41
    const/16 v0, 0x8

    return v0
.end method

.method public init(I[B[B)V
    .registers 14
    .param p1, "mode"    # I
    .param p2, "key"    # [B
    .param p3, "iv"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v4, 0x10

    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 45
    array-length v2, p2

    if-le v2, v4, :cond_e

    .line 46
    new-array v9, v4, [B

    .line 47
    .local v9, "tmp":[B
    array-length v2, v9

    invoke-static {p2, v3, v9, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    move-object p2, v9

    .line 51
    .end local v9    # "tmp":[B
    :cond_e
    :try_start_e
    const-string v2, "RC4"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    iput-object v2, p0, Lcom/jcraft/jsch/jce/ARCFOUR128;->cipher:Ljavax/crypto/Cipher;

    .line 52
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    const-string v2, "RC4"

    invoke-direct {v6, p2, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 53
    .local v6, "_key":Ljavax/crypto/spec/SecretKeySpec;
    const-class v2, Ljavax/crypto/Cipher;

    monitor-enter v2
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_20} :catch_41

    .line 54
    :try_start_20
    iget-object v3, p0, Lcom/jcraft/jsch/jce/ARCFOUR128;->cipher:Ljavax/crypto/Cipher;

    if-nez p1, :cond_3c

    :goto_24
    invoke-virtual {v3, v0, v6}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 58
    monitor-exit v2
    :try_end_28
    .catchall {:try_start_20 .. :try_end_28} :catchall_3e

    .line 59
    const/4 v0, 0x1

    :try_start_29
    new-array v1, v0, [B

    .line 60
    .local v1, "foo":[B
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2c
    const/16 v0, 0x600

    if-ge v8, v0, :cond_46

    .line 61
    iget-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR128;->cipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v5, 0x0

    move-object v4, v1

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_39} :catch_41

    .line 60
    add-int/lit8 v8, v8, 0x1

    goto :goto_2c

    .line 54
    .end local v1    # "foo":[B
    .end local v8    # "i":I
    :cond_3c
    const/4 v0, 0x2

    goto :goto_24

    .line 58
    :catchall_3e
    move-exception v0

    :try_start_3f
    monitor-exit v2
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_3e

    :try_start_40
    throw v0
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_41} :catch_41

    .line 64
    .end local v6    # "_key":Ljavax/crypto/spec/SecretKeySpec;
    :catch_41
    move-exception v7

    .line 65
    .local v7, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR128;->cipher:Ljavax/crypto/Cipher;

    .line 66
    throw v7

    .line 68
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v1    # "foo":[B
    .restart local v6    # "_key":Ljavax/crypto/spec/SecretKeySpec;
    .restart local v8    # "i":I
    :cond_46
    return-void
.end method

.method public isCBC()Z
    .registers 2

    .prologue
    .line 72
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
    .line 70
    iget-object v0, p0, Lcom/jcraft/jsch/jce/ARCFOUR128;->cipher:Ljavax/crypto/Cipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 71
    return-void
.end method
