.class public Lorg/spongycastle/crypto/macs/OldHMac;
.super Ljava/lang/Object;
.source "OldHMac.java"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# static fields
.field private static final BLOCK_LENGTH:I = 0x40

.field private static final IPAD:B = 0x36t

.field private static final OPAD:B = 0x5ct


# instance fields
.field private digest:Lorg/spongycastle/crypto/Digest;

.field private digestSize:I

.field private inputPad:[B

.field private outputPad:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .registers 4
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    const/16 v1, 0x40

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    .line 24
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    .line 32
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    .line 33
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    .line 34
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 9
    .param p1, "out"    # [B
    .param p2, "outOff"    # I

    .prologue
    const/4 v5, 0x0

    .line 110
    iget v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    new-array v1, v2, [B

    .line 111
    .local v1, "tmp":[B
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v2, v1, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 113
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v3, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    array-length v4, v4

    invoke-interface {v2, v3, v5, v4}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 114
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    array-length v3, v1

    invoke-interface {v2, v1, v5, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 116
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v2, p1, p2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    move-result v0

    .line 118
    .local v0, "len":I
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/OldHMac;->reset()V

    .line 120
    return v0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/HMAC"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMacSize()I
    .registers 2

    .prologue
    .line 89
    iget v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    return v0
.end method

.method public getUnderlyingDigest()Lorg/spongycastle/crypto/Digest;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    return-object v0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .registers 8
    .param p1, "params"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    const/4 v5, 0x0

    .line 49
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 51
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .end local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v1

    .line 53
    .local v1, "key":[B
    array-length v2, v1

    const/16 v3, 0x40

    if-le v2, v3, :cond_2c

    .line 55
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    array-length v3, v1

    invoke-interface {v2, v1, v5, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 56
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v3, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    invoke-interface {v2, v3, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 57
    iget v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digestSize:I

    .local v0, "i":I
    :goto_20
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_3f

    .line 59
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    aput-byte v5, v2, v0

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 64
    .end local v0    # "i":I
    :cond_2c
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v3, v1

    invoke-static {v1, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    array-length v0, v1

    .restart local v0    # "i":I
    :goto_33
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_3f

    .line 67
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    aput-byte v5, v2, v0

    .line 65
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    .line 71
    :cond_3f
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v2, v2

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    .line 72
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    iget-object v3, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v4, v4

    invoke-static {v2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 74
    const/4 v0, 0x0

    :goto_51
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_62

    .line 76
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    aget-byte v3, v2, v0

    xor-int/lit8 v3, v3, 0x36

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_51

    .line 79
    :cond_62
    const/4 v0, 0x0

    :goto_63
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_74

    .line 81
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->outputPad:[B

    aget-byte v3, v2, v0

    xor-int/lit8 v3, v3, 0x5c

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_63

    .line 84
    :cond_74
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v3, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    iget-object v4, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v4, v4

    invoke-interface {v2, v3, v5, v4}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 85
    return-void
.end method

.method public reset()V
    .registers 5

    .prologue
    .line 131
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 136
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/spongycastle/crypto/macs/OldHMac;->inputPad:[B

    array-length v3, v3

    invoke-interface {v0, v1, v2, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 137
    return-void
.end method

.method public update(B)V
    .registers 3
    .param p1, "in"    # B

    .prologue
    .line 95
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 96
    return-void
.end method

.method public update([BII)V
    .registers 5
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I

    .prologue
    .line 103
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/OldHMac;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 104
    return-void
.end method
