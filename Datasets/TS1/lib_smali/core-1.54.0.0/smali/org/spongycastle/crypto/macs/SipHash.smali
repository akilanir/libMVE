.class public Lorg/spongycastle/crypto/macs/SipHash;
.super Ljava/lang/Object;
.source "SipHash.java"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# instance fields
.field protected final c:I

.field protected final d:I

.field protected k0:J

.field protected k1:J

.field protected m:J

.field protected v0:J

.field protected v1:J

.field protected v2:J

.field protected v3:J

.field protected wordCount:I

.field protected wordPos:I


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 27
    iput v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 28
    iput v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 36
    const/4 v0, 0x2

    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    .line 37
    const/4 v0, 0x4

    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    .line 38
    return-void
.end method

.method public constructor <init>(II)V
    .registers 6
    .param p1, "c"    # I
    .param p2, "d"    # I

    .prologue
    const/4 v2, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 27
    iput v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 28
    iput v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 48
    iput p1, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    .line 49
    iput p2, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    .line 50
    return-void
.end method

.method protected static rotateLeft(JI)J
    .registers 7
    .param p0, "x"    # J
    .param p2, "n"    # I

    .prologue
    .line 214
    shl-long v0, p0, p2

    neg-int v2, p2

    ushr-long v2, p0, v2

    or-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method protected applySipRounds(I)V
    .registers 13
    .param p1, "n"    # I

    .prologue
    const/16 v10, 0x20

    .line 189
    iget-wide v1, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .local v1, "r0":J
    iget-wide v3, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    .local v3, "r1":J
    iget-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .local v5, "r2":J
    iget-wide v7, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 191
    .local v7, "r3":J
    const/4 v0, 0x0

    .local v0, "r":I
    :goto_b
    if-ge v0, p1, :cond_38

    .line 193
    add-long/2addr v1, v3

    .line 194
    add-long/2addr v5, v7

    .line 195
    const/16 v9, 0xd

    invoke-static {v3, v4, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    move-result-wide v3

    .line 196
    const/16 v9, 0x10

    invoke-static {v7, v8, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    move-result-wide v7

    .line 197
    xor-long/2addr v3, v1

    .line 198
    xor-long/2addr v7, v5

    .line 199
    invoke-static {v1, v2, v10}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    move-result-wide v1

    .line 200
    add-long/2addr v5, v3

    .line 201
    add-long/2addr v1, v7

    .line 202
    const/16 v9, 0x11

    invoke-static {v3, v4, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    move-result-wide v3

    .line 203
    const/16 v9, 0x15

    invoke-static {v7, v8, v9}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    move-result-wide v7

    .line 204
    xor-long/2addr v3, v5

    .line 205
    xor-long/2addr v7, v1

    .line 206
    invoke-static {v5, v6, v10}, Lorg/spongycastle/crypto/macs/SipHash;->rotateLeft(JI)J

    move-result-wide v5

    .line 191
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 209
    :cond_38
    iput-wide v1, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    iput-wide v3, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    iput-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    iput-wide v7, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 210
    return-void
.end method

.method public doFinal([BI)I
    .registers 6
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 162
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->doFinal()J

    move-result-wide v0

    .line 163
    .local v0, "result":J
    invoke-static {v0, v1, p1, p2}, Lorg/spongycastle/util/Pack;->longToLittleEndian(J[BI)V

    .line 164
    const/16 v2, 0x8

    return v2
.end method

.method public doFinal()J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0xff

    .line 142
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    iget v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    rsub-int/lit8 v4, v4, 0x7

    shl-int/lit8 v4, v4, 0x3

    ushr-long/2addr v2, v4

    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 143
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    const/16 v4, 0x8

    ushr-long/2addr v2, v4

    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 144
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    iget v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    shl-int/lit8 v4, v4, 0x3

    iget v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    add-int/2addr v4, v5

    int-to-long v4, v4

    and-long/2addr v4, v7

    const/16 v6, 0x38

    shl-long/2addr v4, v6

    or-long/2addr v2, v4

    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 146
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 148
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    xor-long/2addr v2, v7

    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 150
    iget v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/macs/SipHash;->applySipRounds(I)V

    .line 152
    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    iget-wide v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    xor-long/2addr v2, v4

    iget-wide v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    xor-long/2addr v2, v4

    iget-wide v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    xor-long v0, v2, v4

    .line 154
    .local v0, "result":J
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->reset()V

    .line 156
    return-wide v0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SipHash-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/spongycastle/crypto/macs/SipHash;->d:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMacSize()I
    .registers 2

    .prologue
    .line 59
    const/16 v0, 0x8

    return v0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .registers 6
    .param p1, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 65
    instance-of v2, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    if-nez v2, :cond_c

    .line 67
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'params\' must be an instance of KeyParameter"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_c
    move-object v1, p1

    .line 69
    check-cast v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 70
    .local v1, "keyParameter":Lorg/spongycastle/crypto/params/KeyParameter;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v0

    .line 71
    .local v0, "key":[B
    array-length v2, v0

    const/16 v3, 0x10

    if-eq v2, v3, :cond_20

    .line 73
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'params\' must be a 128-bit key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 76
    :cond_20
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->k0:J

    .line 77
    const/16 v2, 0x8

    invoke-static {v0, v2}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->k1:J

    .line 79
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->reset()V

    .line 80
    return-void
.end method

.method protected processMessageWord()V
    .registers 5

    .prologue
    .line 181
    iget v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 182
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 183
    iget v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->c:I

    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/macs/SipHash;->applySipRounds(I)V

    .line 184
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    iget-wide v2, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 185
    return-void
.end method

.method public reset()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 169
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->k0:J

    const-wide v2, 0x736f6d6570736575L    # 1.0986868386607877E248

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v0:J

    .line 170
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->k1:J

    const-wide v2, 0x646f72616e646f6dL    # 6.222199573468475E175

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v1:J

    .line 171
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->k0:J

    const-wide v2, 0x6c7967656e657261L    # 3.4208747916531402E214

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v2:J

    .line 172
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->k1:J

    const-wide v2, 0x7465646279746573L    # 4.901176695720602E252

    xor-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->v3:J

    .line 174
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 175
    iput v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 176
    iput v4, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordCount:I

    .line 177
    return-void
.end method

.method public update(B)V
    .registers 9
    .param p1, "input"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x8

    .line 85
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    ushr-long/2addr v0, v6

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 86
    iget-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    int-to-long v2, p1

    const-wide/16 v4, 0xff

    and-long/2addr v2, v4

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iput-wide v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 88
    iget v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    if-ne v0, v6, :cond_21

    .line 90
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 91
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 93
    :cond_21
    return-void
.end method

.method public update([BII)V
    .registers 15
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 99
    const/4 v2, 0x0

    .local v2, "i":I
    and-int/lit8 v1, p3, -0x8

    .line 100
    .local v1, "fullWords":I
    iget v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    if-nez v5, :cond_38

    .line 102
    :goto_7
    if-ge v2, v1, :cond_17

    .line 104
    add-int v5, p2, v2

    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    move-result-wide v5

    iput-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 105
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 102
    add-int/lit8 v2, v2, 0x8

    goto :goto_7

    .line 107
    :cond_17
    :goto_17
    if-ge v2, p3, :cond_33

    .line 109
    iget-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    const/16 v7, 0x8

    ushr-long/2addr v5, v7

    iput-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 110
    iget-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    add-int v7, p2, v2

    aget-byte v7, p1, v7

    int-to-long v7, v7

    const-wide/16 v9, 0xff

    and-long/2addr v7, v9

    const/16 v9, 0x38

    shl-long/2addr v7, v9

    or-long/2addr v5, v7

    iput-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 107
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 112
    :cond_33
    sub-int v5, p3, v1

    iput v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 136
    :cond_37
    return-void

    .line 116
    :cond_38
    iget v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    shl-int/lit8 v0, v5, 0x3

    .line 117
    .local v0, "bits":I
    :goto_3c
    if-ge v2, v1, :cond_55

    .line 119
    add-int v5, p2, v2

    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToLong([BI)J

    move-result-wide v3

    .line 120
    .local v3, "n":J
    shl-long v5, v3, v0

    iget-wide v7, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    neg-int v9, v0

    ushr-long/2addr v7, v9

    or-long/2addr v5, v7

    iput-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 121
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 122
    iput-wide v3, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 117
    add-int/lit8 v2, v2, 0x8

    goto :goto_3c

    .line 124
    .end local v3    # "n":J
    :cond_55
    :goto_55
    if-ge v2, p3, :cond_37

    .line 126
    iget-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    const/16 v7, 0x8

    ushr-long/2addr v5, v7

    iput-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 127
    iget-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    add-int v7, p2, v2

    aget-byte v7, p1, v7

    int-to-long v7, v7

    const-wide/16 v9, 0xff

    and-long/2addr v7, v9

    const/16 v9, 0x38

    shl-long/2addr v7, v9

    or-long/2addr v5, v7

    iput-wide v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->m:J

    .line 129
    iget v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    const/16 v6, 0x8

    if-ne v5, v6, :cond_7e

    .line 131
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/SipHash;->processMessageWord()V

    .line 132
    const/4 v5, 0x0

    iput v5, p0, Lorg/spongycastle/crypto/macs/SipHash;->wordPos:I

    .line 124
    :cond_7e
    add-int/lit8 v2, v2, 0x1

    goto :goto_55
.end method
