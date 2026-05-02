.class public abstract Lorg/spongycastle/crypto/digests/GeneralDigest;
.super Ljava/lang/Object;
.source "GeneralDigest.java"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;
.implements Lorg/spongycastle/util/Memoable;


# static fields
.field private static final BYTE_LENGTH:I = 0x40


# instance fields
.field private byteCount:J

.field private final xBuf:[B

.field private xBufOff:I


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    .line 27
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/digests/GeneralDigest;)V
    .registers 3
    .param p1, "t"    # Lorg/spongycastle/crypto/digests/GeneralDigest;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    .line 36
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;->copyIn(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    .line 37
    return-void
.end method

.method protected constructor <init>([B)V
    .registers 6
    .param p1, "encodedState"    # [B

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-array v0, v3, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    .line 41
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    array-length v1, v1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    invoke-static {p1, v3}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    .line 43
    const/16 v0, 0x8

    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    .line 44
    return-void
.end method


# virtual methods
.method protected copyIn(Lorg/spongycastle/crypto/digests/GeneralDigest;)V
    .registers 6
    .param p1, "t"    # Lorg/spongycastle/crypto/digests/GeneralDigest;

    .prologue
    const/4 v3, 0x0

    .line 48
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    iget-object v2, p1, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 50
    iget v0, p1, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    .line 51
    iget-wide v0, p1, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    .line 52
    return-void
.end method

.method public finish()V
    .registers 6

    .prologue
    .line 115
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    const/4 v4, 0x3

    shl-long v0, v2, v4

    .line 120
    .local v0, "bitLength":J
    const/16 v2, -0x80

    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/digests/GeneralDigest;->update(B)V

    .line 122
    :goto_a
    iget v2, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    if-eqz v2, :cond_13

    .line 124
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/digests/GeneralDigest;->update(B)V

    goto :goto_a

    .line 127
    :cond_13
    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/digests/GeneralDigest;->processLength(J)V

    .line 129
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/GeneralDigest;->processBlock()V

    .line 130
    return-void
.end method

.method public getByteLength()I
    .registers 2

    .prologue
    .line 152
    const/16 v0, 0x40

    return v0
.end method

.method protected populateState([B)V
    .registers 5
    .param p1, "state"    # [B

    .prologue
    const/4 v2, 0x0

    .line 145
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 146
    iget v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    const/4 v1, 0x4

    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 147
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    const/16 v2, 0x8

    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 148
    return-void
.end method

.method protected abstract processBlock()V
.end method

.method protected abstract processLength(J)V
.end method

.method protected abstract processWord([BI)V
.end method

.method public reset()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 134
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    .line 136
    iput v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    .line 137
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 139
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    aput-byte v3, v1, v0

    .line 137
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 141
    :cond_14
    return-void
.end method

.method public update(B)V
    .registers 6
    .param p1, "in"    # B

    .prologue
    const/4 v3, 0x0

    .line 57
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    aput-byte p1, v0, v1

    .line 59
    iget v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    array-length v1, v1

    if-ne v0, v1, :cond_19

    .line 61
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    invoke-virtual {p0, v0, v3}, Lorg/spongycastle/crypto/digests/GeneralDigest;->processWord([BI)V

    .line 62
    iput v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    .line 65
    :cond_19
    iget-wide v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    .line 66
    return-void
.end method

.method public update([BII)V
    .registers 11
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I

    .prologue
    const/4 v6, 0x0

    .line 73
    invoke-static {v6, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    .line 78
    const/4 v0, 0x0

    .line 79
    .local v0, "i":I
    iget v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    if-eqz v3, :cond_29

    :cond_a
    move v1, v0

    .line 81
    .end local v0    # "i":I
    .local v1, "i":I
    if-ge v1, p3, :cond_56

    .line 83
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    iget v4, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    add-int v5, p2, v1

    aget-byte v5, p1, v5

    aput-byte v5, v3, v4

    .line 84
    iget v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_a

    .line 86
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    invoke-virtual {p0, v3, v6}, Lorg/spongycastle/crypto/digests/GeneralDigest;->processWord([BI)V

    .line 87
    iput v6, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    .line 96
    :cond_29
    :goto_29
    sub-int v3, p3, v0

    and-int/lit8 v3, v3, -0x4

    add-int v2, v3, v0

    .line 97
    .local v2, "limit":I
    :goto_2f
    if-ge v0, v2, :cond_54

    .line 99
    add-int v3, p2, v0

    invoke-virtual {p0, p1, v3}, Lorg/spongycastle/crypto/digests/GeneralDigest;->processWord([BI)V

    .line 97
    add-int/lit8 v0, v0, 0x4

    goto :goto_2f

    .line 105
    .end local v0    # "i":I
    .restart local v1    # "i":I
    :goto_39
    if-ge v1, p3, :cond_4d

    .line 107
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBuf:[B

    iget v4, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->xBufOff:I

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    add-int v5, p2, v1

    aget-byte v5, p1, v5

    aput-byte v5, v3, v4

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_39

    .line 110
    :cond_4d
    iget-wide v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    int-to-long v5, p3

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/GeneralDigest;->byteCount:J

    .line 111
    return-void

    .end local v1    # "i":I
    .restart local v0    # "i":I
    :cond_54
    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_39

    .end local v2    # "limit":I
    :cond_56
    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_29
.end method
