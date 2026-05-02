.class Lcom/jcraft/jsch/jcraft/HMAC;
.super Ljava/lang/Object;
.source "HMAC.java"


# static fields
.field private static final B:I = 0x40


# instance fields
.field private bsize:I

.field private k_ipad:[B

.field private k_opad:[B

.field private md:Ljava/security/MessageDigest;

.field private final tmp:[B


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_ipad:[B

    .line 48
    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_opad:[B

    .line 50
    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    .line 88
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->tmp:[B

    return-void
.end method


# virtual methods
.method public doFinal([BI)V
    .registers 8
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    const/16 v4, 0x40

    const/4 v3, 0x0

    .line 102
    iget-object v1, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 103
    .local v0, "result":[B
    iget-object v1, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_opad:[B

    invoke-virtual {v1, v2, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 104
    iget-object v1, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    iget v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    invoke-virtual {v1, v0, v3, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 105
    :try_start_17
    iget-object v1, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    iget v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    invoke-virtual {v1, p1, p2, v2}, Ljava/security/MessageDigest;->digest([BII)I
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1e} :catch_26

    .line 106
    :goto_1e
    iget-object v1, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_ipad:[B

    invoke-virtual {v1, v2, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 107
    return-void

    .line 105
    :catch_26
    move-exception v1

    goto :goto_1e
.end method

.method public getBlockSize()I
    .registers 2

    .prologue
    .line 59
    iget v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    return v0
.end method

.method public init([B)V
    .registers 8
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v5, 0x40

    const/4 v4, 0x0

    .line 61
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    invoke-virtual {v2}, Ljava/security/MessageDigest;->reset()V

    .line 62
    array-length v2, p1

    iget v3, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    if-le v2, v3, :cond_17

    .line 63
    iget v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    new-array v1, v2, [B

    .line 64
    .local v1, "tmp":[B
    iget v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    invoke-static {p1, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    move-object p1, v1

    .line 69
    .end local v1    # "tmp":[B
    :cond_17
    array-length v2, p1

    if-le v2, v5, :cond_26

    .line 70
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    array-length v3, p1

    invoke-virtual {v2, p1, v4, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 71
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    .line 74
    :cond_26
    new-array v2, v5, [B

    iput-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_ipad:[B

    .line 75
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_ipad:[B

    array-length v3, p1

    invoke-static {p1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    new-array v2, v5, [B

    iput-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_opad:[B

    .line 77
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_opad:[B

    array-length v3, p1

    invoke-static {p1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3b
    if-ge v0, v5, :cond_52

    .line 81
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_ipad:[B

    aget-byte v3, v2, v0

    xor-int/lit8 v3, v3, 0x36

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 82
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_opad:[B

    aget-byte v3, v2, v0

    xor-int/lit8 v3, v3, 0x5c

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_3b

    .line 85
    :cond_52
    iget-object v2, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    iget-object v3, p0, Lcom/jcraft/jsch/jcraft/HMAC;->k_ipad:[B

    invoke-virtual {v2, v3, v4, v5}, Ljava/security/MessageDigest;->update([BII)V

    .line 86
    return-void
.end method

.method protected setH(Ljava/security/MessageDigest;)V
    .registers 3
    .param p1, "md"    # Ljava/security/MessageDigest;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    .line 56
    invoke-virtual {p1}, Ljava/security/MessageDigest;->getDigestLength()I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->bsize:I

    .line 57
    return-void
.end method

.method public update(I)V
    .registers 6
    .param p1, "i"    # I

    .prologue
    const/4 v3, 0x0

    .line 90
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->tmp:[B

    ushr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 91
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->tmp:[B

    const/4 v1, 0x1

    ushr-int/lit8 v2, p1, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 92
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->tmp:[B

    const/4 v1, 0x2

    ushr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 93
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->tmp:[B

    const/4 v1, 0x3

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 94
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->tmp:[B

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v3, v1}, Lcom/jcraft/jsch/jcraft/HMAC;->update([BII)V

    .line 95
    return-void
.end method

.method public update([BII)V
    .registers 5
    .param p1, "foo"    # [B
    .param p2, "s"    # I
    .param p3, "l"    # I

    .prologue
    .line 98
    iget-object v0, p0, Lcom/jcraft/jsch/jcraft/HMAC;->md:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 99
    return-void
.end method
