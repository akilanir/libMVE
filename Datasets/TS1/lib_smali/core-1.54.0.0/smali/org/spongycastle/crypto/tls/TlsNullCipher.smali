.class public Lorg/spongycastle/crypto/tls/TlsNullCipher;
.super Ljava/lang/Object;
.source "TlsNullCipher.java"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsCipher;


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected readMac:Lorg/spongycastle/crypto/tls/TlsMac;

.field protected writeMac:Lorg/spongycastle/crypto/tls/TlsMac;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;)V
    .registers 3
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;

    .prologue
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 22
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 23
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;)V
    .registers 16
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "clientWriteDigest"    # Lorg/spongycastle/crypto/Digest;
    .param p3, "serverWriteDigest"    # Lorg/spongycastle/crypto/Digest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    if-nez p2, :cond_14

    const/4 v1, 0x1

    move v2, v1

    :goto_7
    if-nez p3, :cond_17

    const/4 v1, 0x1

    :goto_a
    if-eq v2, v1, :cond_19

    .line 31
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 29
    :cond_14
    const/4 v1, 0x0

    move v2, v1

    goto :goto_7

    :cond_17
    const/4 v1, 0x0

    goto :goto_a

    .line 34
    :cond_19
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 36
    const/4 v0, 0x0

    .local v0, "clientWriteMac":Lorg/spongycastle/crypto/tls/TlsMac;
    const/4 v5, 0x0

    .line 38
    .local v5, "serverWriteMac":Lorg/spongycastle/crypto/tls/TlsMac;
    if-eqz p2, :cond_5a

    .line 40
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v1

    .line 41
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    add-int v11, v1, v2

    .line 42
    .local v11, "key_block_size":I
    invoke-static {p1, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateKeyBlock(Lorg/spongycastle/crypto/tls/TlsContext;I)[B

    move-result-object v3

    .line 44
    .local v3, "key_block":[B
    const/4 v4, 0x0

    .line 46
    .local v4, "offset":I
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 47
    .end local v0    # "clientWriteMac":Lorg/spongycastle/crypto/tls/TlsMac;
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v5

    .end local v5    # "serverWriteMac":Lorg/spongycastle/crypto/tls/TlsMac;
    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 48
    .restart local v0    # "clientWriteMac":Lorg/spongycastle/crypto/tls/TlsMac;
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v1

    add-int/2addr v4, v1

    .line 50
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 51
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v10

    move-object v6, p1

    move-object v7, p3

    move-object v8, v3

    move v9, v4

    invoke-direct/range {v5 .. v10}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 52
    .restart local v5    # "serverWriteMac":Lorg/spongycastle/crypto/tls/TlsMac;
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v1

    add-int/2addr v4, v1

    .line 54
    if-eq v4, v11, :cond_5a

    .line 56
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 60
    .end local v3    # "key_block":[B
    .end local v4    # "offset":I
    .end local v11    # "key_block_size":I
    :cond_5a
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    move-result v1

    if-eqz v1, :cond_65

    .line 62
    iput-object v5, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 63
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 70
    :goto_64
    return-void

    .line 67
    :cond_65
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 68
    iput-object v5, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    goto :goto_64
.end method


# virtual methods
.method public decodeCiphertext(JS[BII)[B
    .registers 18
    .param p1, "seqNo"    # J
    .param p3, "type"    # S
    .param p4, "ciphertext"    # [B
    .param p5, "offset"    # I
    .param p6, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    if-nez v1, :cond_d

    .line 102
    add-int v1, p5, p6

    move/from16 v0, p5

    invoke-static {p4, v0, v1}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    .line 121
    :goto_c
    return-object v1

    .line 105
    :cond_d
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    move-result v9

    .line 106
    .local v9, "macSize":I
    move/from16 v0, p6

    if-ge v0, v9, :cond_1f

    .line 108
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x32

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 111
    :cond_1f
    sub-int v7, p6, v9

    .line 113
    .local v7, "macInputLen":I
    add-int v1, p5, v7

    add-int v2, p5, p6

    invoke-static {p4, v1, v2}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v10

    .line 114
    .local v10, "receivedMac":[B
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    move-wide v2, p1

    move v4, p3

    move-object v5, p4

    move/from16 v6, p5

    invoke-virtual/range {v1 .. v7}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    move-result-object v8

    .line 116
    .local v8, "computedMac":[B
    invoke-static {v10, v8}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    move-result v1

    if-nez v1, :cond_42

    .line 118
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 121
    :cond_42
    add-int v1, p5, v7

    move/from16 v0, p5

    invoke-static {p4, v0, v1}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    goto :goto_c
.end method

.method public encodePlaintext(JS[BII)[B
    .registers 16
    .param p1, "seqNo"    # J
    .param p3, "type"    # S
    .param p4, "plaintext"    # [B
    .param p5, "offset"    # I
    .param p6, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    if-nez v0, :cond_b

    .line 87
    add-int v0, p5, p6

    invoke-static {p4, p5, v0}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v7

    .line 94
    :goto_a
    return-object v7

    .line 90
    :cond_b
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    move-wide v1, p1

    move v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    move-result-object v8

    .line 91
    .local v8, "mac":[B
    array-length v0, v8

    add-int/2addr v0, p6

    new-array v7, v0, [B

    .line 92
    .local v7, "ciphertext":[B
    const/4 v0, 0x0

    invoke-static {p4, p5, v7, v0, p6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    const/4 v0, 0x0

    array-length v1, v8

    invoke-static {v8, v0, v7, p6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_a
.end method

.method public getPlaintextLimit(I)I
    .registers 4
    .param p1, "ciphertextLimit"    # I

    .prologue
    .line 74
    move v0, p1

    .line 75
    .local v0, "result":I
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    if-eqz v1, :cond_c

    .line 77
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    move-result v1

    sub-int/2addr v0, v1

    .line 79
    :cond_c
    return v0
.end method
