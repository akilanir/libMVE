.class public Lorg/spongycastle/crypto/engines/RC564Engine;
.super Ljava/lang/Object;
.source "RC564Engine.java"

# interfaces
.implements Lorg/spongycastle/crypto/BlockCipher;


# static fields
.field private static final P64:J = -0x481eae9d7512d595L

.field private static final Q64:J = -0x61c8864680b583ebL

.field private static final bytesPerWord:I = 0x8

.field private static final wordSize:I = 0x40


# instance fields
.field private _S:[J

.field private _noRounds:I

.field private forEncryption:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/16 v0, 0xc

    iput v0, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 54
    return-void
.end method

.method private bytesToWord([BI)J
    .registers 10
    .param p1, "src"    # [B
    .param p2, "srcOff"    # I

    .prologue
    .line 267
    const-wide/16 v1, 0x0

    .line 269
    .local v1, "word":J
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_3
    if-ltz v0, :cond_15

    .line 271
    const/16 v3, 0x8

    shl-long v3, v1, v3

    add-int v5, v0, p2

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    add-long v1, v3, v5

    .line 269
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 274
    :cond_15
    return-wide v1
.end method

.method private decryptBlock([BI[BI)I
    .registers 13
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "out"    # [B
    .param p4, "outOff"    # I

    .prologue
    const/4 v7, 0x1

    .line 211
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    move-result-wide v0

    .line 212
    .local v0, "A":J
    add-int/lit8 v5, p2, 0x8

    invoke-direct {p0, p1, v5}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    move-result-wide v2

    .line 214
    .local v2, "B":J
    iget v4, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .local v4, "i":I
    :goto_d
    if-lt v4, v7, :cond_30

    .line 216
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    mul-int/lit8 v6, v4, 0x2

    add-int/lit8 v6, v6, 0x1

    aget-wide v5, v5, v6

    sub-long v5, v2, v5

    invoke-direct {p0, v5, v6, v0, v1}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateRight(JJ)J

    move-result-wide v5

    xor-long v2, v5, v0

    .line 217
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    mul-int/lit8 v6, v4, 0x2

    aget-wide v5, v5, v6

    sub-long v5, v0, v5

    invoke-direct {p0, v5, v6, v2, v3}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateRight(JJ)J

    move-result-wide v5

    xor-long v0, v5, v2

    .line 214
    add-int/lit8 v4, v4, -0x1

    goto :goto_d

    .line 220
    :cond_30
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    const/4 v6, 0x0

    aget-wide v5, v5, v6

    sub-long v5, v0, v5

    invoke-direct {p0, v5, v6, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 221
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    aget-wide v5, v5, v7

    sub-long v5, v2, v5

    add-int/lit8 v7, p4, 0x8

    invoke-direct {p0, v5, v6, p3, v7}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 223
    const/16 v5, 0x10

    return v5
.end method

.method private encryptBlock([BI[BI)I
    .registers 14
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "out"    # [B
    .param p4, "outOff"    # I

    .prologue
    .line 190
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    move-result-wide v5

    iget-object v7, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    const/4 v8, 0x0

    aget-wide v7, v7, v8

    add-long v0, v5, v7

    .line 191
    .local v0, "A":J
    add-int/lit8 v5, p2, 0x8

    invoke-direct {p0, p1, v5}, Lorg/spongycastle/crypto/engines/RC564Engine;->bytesToWord([BI)J

    move-result-wide v5

    iget-object v7, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    const/4 v8, 0x1

    aget-wide v7, v7, v8

    add-long v2, v5, v7

    .line 193
    .local v2, "B":J
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_19
    iget v5, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    if-gt v4, v5, :cond_3e

    .line 195
    xor-long v5, v0, v2

    invoke-direct {p0, v5, v6, v2, v3}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    move-result-wide v5

    iget-object v7, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    mul-int/lit8 v8, v4, 0x2

    aget-wide v7, v7, v8

    add-long v0, v5, v7

    .line 196
    xor-long v5, v2, v0

    invoke-direct {p0, v5, v6, v0, v1}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    move-result-wide v5

    iget-object v7, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    mul-int/lit8 v8, v4, 0x2

    add-int/lit8 v8, v8, 0x1

    aget-wide v7, v7, v8

    add-long v2, v5, v7

    .line 193
    add-int/lit8 v4, v4, 0x1

    goto :goto_19

    .line 199
    :cond_3e
    invoke-direct {p0, v0, v1, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 200
    add-int/lit8 v5, p4, 0x8

    invoke-direct {p0, v2, v3, p3, v5}, Lorg/spongycastle/crypto/engines/RC564Engine;->wordToBytes(J[BI)V

    .line 202
    const/16 v5, 0x10

    return v5
.end method

.method private rotateLeft(JJ)J
    .registers 11
    .param p1, "x"    # J
    .param p3, "y"    # J

    .prologue
    const-wide/16 v4, 0x3f

    .line 245
    and-long v0, p3, v4

    long-to-int v0, v0

    shl-long v0, p1, v0

    const-wide/16 v2, 0x40

    and-long/2addr v4, p3

    sub-long/2addr v2, v4

    long-to-int v2, v2

    ushr-long v2, p1, v2

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private rotateRight(JJ)J
    .registers 11
    .param p1, "x"    # J
    .param p3, "y"    # J

    .prologue
    const-wide/16 v4, 0x3f

    .line 260
    and-long v0, p3, v4

    long-to-int v0, v0

    ushr-long v0, p1, v0

    const-wide/16 v2, 0x40

    and-long/2addr v4, p3

    sub-long/2addr v2, v4

    long-to-int v2, v2

    shl-long v2, p1, v2

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private setKey([B)V
    .registers 18
    .param p1, "key"    # [B

    .prologue
    .line 126
    move-object/from16 v0, p1

    array-length v10, v0

    add-int/lit8 v10, v10, 0x7

    div-int/lit8 v10, v10, 0x8

    new-array v5, v10, [J

    .line 128
    .local v5, "L":[J
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_a
    move-object/from16 v0, p1

    array-length v10, v0

    if-eq v6, v10, :cond_23

    .line 130
    div-int/lit8 v10, v6, 0x8

    aget-wide v11, v5, v10

    aget-byte v13, p1, v6

    and-int/lit16 v13, v13, 0xff

    int-to-long v13, v13

    rem-int/lit8 v15, v6, 0x8

    mul-int/lit8 v15, v15, 0x8

    shl-long/2addr v13, v15

    add-long/2addr v11, v13

    aput-wide v11, v5, v10

    .line 128
    add-int/lit8 v6, v6, 0x1

    goto :goto_a

    .line 139
    :cond_23
    move-object/from16 v0, p0

    iget v10, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    add-int/lit8 v10, v10, 0x1

    mul-int/lit8 v10, v10, 0x2

    new-array v10, v10, [J

    move-object/from16 v0, p0

    iput-object v10, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    .line 141
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    const/4 v11, 0x0

    const-wide v12, -0x481eae9d7512d595L    # -1.590398847350152E-39

    aput-wide v12, v10, v11

    .line 142
    const/4 v6, 0x1

    :goto_3e
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    array-length v10, v10

    if-ge v6, v10, :cond_5c

    .line 144
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    add-int/lit8 v12, v6, -0x1

    aget-wide v11, v11, v12

    const-wide v13, -0x61c8864680b583ebL

    add-long/2addr v11, v13

    aput-wide v11, v10, v6

    .line 142
    add-int/lit8 v6, v6, 0x1

    goto :goto_3e

    .line 154
    :cond_5c
    array-length v10, v5

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    array-length v11, v11

    if-le v10, v11, :cond_a5

    .line 156
    array-length v10, v5

    mul-int/lit8 v7, v10, 0x3

    .line 163
    .local v7, "iter":I
    :goto_67
    const-wide/16 v1, 0x0

    .local v1, "A":J
    const-wide/16 v3, 0x0

    .line 164
    .local v3, "B":J
    const/4 v6, 0x0

    const/4 v8, 0x0

    .line 166
    .local v8, "j":I
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_6e
    if-ge v9, v7, :cond_ad

    .line 168
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    aget-wide v11, v11, v6

    add-long/2addr v11, v1

    add-long/2addr v11, v3

    const-wide/16 v13, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12, v13, v14}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    move-result-wide v1

    .end local v1    # "A":J
    aput-wide v1, v10, v6

    .line 169
    .restart local v1    # "A":J
    aget-wide v10, v5, v8

    add-long/2addr v10, v1

    add-long/2addr v10, v3

    add-long v12, v1, v3

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11, v12, v13}, Lorg/spongycastle/crypto/engines/RC564Engine;->rotateLeft(JJ)J

    move-result-wide v3

    .end local v3    # "B":J
    aput-wide v3, v5, v8

    .line 170
    .restart local v3    # "B":J
    add-int/lit8 v10, v6, 0x1

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    array-length v11, v11

    rem-int v6, v10, v11

    .line 171
    add-int/lit8 v10, v8, 0x1

    array-length v11, v5

    rem-int v8, v10, v11

    .line 166
    add-int/lit8 v9, v9, 0x1

    goto :goto_6e

    .line 160
    .end local v1    # "A":J
    .end local v3    # "B":J
    .end local v7    # "iter":I
    .end local v8    # "j":I
    .end local v9    # "k":I
    :cond_a5
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/spongycastle/crypto/engines/RC564Engine;->_S:[J

    array-length v10, v10

    mul-int/lit8 v7, v10, 0x3

    .restart local v7    # "iter":I
    goto :goto_67

    .line 173
    .restart local v1    # "A":J
    .restart local v3    # "B":J
    .restart local v8    # "j":I
    .restart local v9    # "k":I
    :cond_ad
    return-void
.end method

.method private wordToBytes(J[BI)V
    .registers 9
    .param p1, "word"    # J
    .param p3, "dst"    # [B
    .param p4, "dstOff"    # I

    .prologue
    const/16 v3, 0x8

    .line 282
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, v3, :cond_f

    .line 284
    add-int v1, v0, p4

    long-to-int v2, p1

    int-to-byte v2, v2

    aput-byte v2, p3, v1

    .line 285
    ushr-long/2addr p1, v3

    .line 282
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 287
    :cond_f
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    const-string v0, "RC5-64"

    return-object v0
.end method

.method public getBlockSize()I
    .registers 2

    .prologue
    .line 63
    const/16 v0, 0x10

    return v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 7
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 78
    instance-of v1, p2, Lorg/spongycastle/crypto/params/RC5Parameters;

    if-nez v1, :cond_25

    .line 80
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid parameter passed to RC564 init - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_25
    move-object v0, p2

    .line 83
    check-cast v0, Lorg/spongycastle/crypto/params/RC5Parameters;

    .line 85
    .local v0, "p":Lorg/spongycastle/crypto/params/RC5Parameters;
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->forEncryption:Z

    .line 87
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/RC5Parameters;->getRounds()I

    move-result v1

    iput v1, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->_noRounds:I

    .line 89
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/RC5Parameters;->getKey()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/engines/RC564Engine;->setKey([B)V

    .line 90
    return-void
.end method

.method public processBlock([BI[BI)I
    .registers 6
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "out"    # [B
    .param p4, "outOff"    # I

    .prologue
    .line 98
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RC564Engine;->forEncryption:Z

    if-eqz v0, :cond_9

    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->encryptBlock([BI[BI)I

    move-result v0

    .line 99
    :goto_8
    return v0

    :cond_9
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/engines/RC564Engine;->decryptBlock([BI[BI)I

    move-result v0

    goto :goto_8
.end method

.method public reset()V
    .registers 1

    .prologue
    .line 104
    return-void
.end method
