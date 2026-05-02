.class public Lorg/spongycastle/crypto/macs/GOST28147Mac;
.super Ljava/lang/Object;
.source "GOST28147Mac.java"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# instance fields
.field private S:[B

.field private blockSize:I

.field private buf:[B

.field private bufOff:I

.field private firstStep:Z

.field private mac:[B

.field private macSize:I

.field private workingKey:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/16 v0, 0x8

    iput v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    .line 16
    const/4 v0, 0x4

    iput v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->macSize:I

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->workingKey:[I

    .line 25
    const/16 v0, 0x80

    new-array v0, v0, [B

    fill-array-data v0, :array_2a

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    .line 38
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    .line 40
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    .line 42
    return-void

    .line 25
    nop

    :array_2a
    .array-data 1
        0x9t
        0x6t
        0x3t
        0x2t
        0x8t
        0xbt
        0x1t
        0x7t
        0xat
        0x4t
        0xet
        0xft
        0xct
        0x0t
        0xdt
        0x5t
        0x3t
        0x7t
        0xet
        0x9t
        0x8t
        0xat
        0xft
        0x0t
        0x5t
        0x2t
        0x6t
        0xct
        0xbt
        0x4t
        0xdt
        0x1t
        0xet
        0x4t
        0x6t
        0x2t
        0xbt
        0x3t
        0xdt
        0x8t
        0xct
        0xft
        0x5t
        0xat
        0x0t
        0x7t
        0x1t
        0x9t
        0xet
        0x7t
        0xat
        0xct
        0xdt
        0x1t
        0x3t
        0x9t
        0x0t
        0x2t
        0xbt
        0x4t
        0xft
        0x8t
        0x5t
        0x6t
        0xbt
        0x5t
        0x1t
        0x9t
        0x8t
        0xdt
        0xft
        0x0t
        0xet
        0x4t
        0x2t
        0x3t
        0xct
        0x7t
        0xat
        0x6t
        0x3t
        0xat
        0xdt
        0xct
        0x1t
        0x2t
        0x0t
        0xbt
        0x7t
        0x5t
        0x9t
        0x4t
        0x8t
        0xft
        0xet
        0x6t
        0x1t
        0xdt
        0x2t
        0x9t
        0x7t
        0xat
        0x6t
        0x0t
        0x8t
        0xct
        0x4t
        0x5t
        0xft
        0x3t
        0xbt
        0xet
        0xbt
        0xat
        0xft
        0x5t
        0x0t
        0xct
        0xet
        0x8t
        0x6t
        0x2t
        0x3t
        0x9t
        0x1t
        0x7t
        0xdt
        0x4t
    .end array-data
.end method

.method private CM5func([BI[B)[B
    .registers 8
    .param p1, "buf"    # [B
    .param p2, "bufOff"    # I
    .param p3, "mac"    # [B

    .prologue
    .line 170
    array-length v2, p1

    sub-int/2addr v2, p2

    new-array v1, v2, [B

    .line 172
    .local v1, "sum":[B
    const/4 v2, 0x0

    array-length v3, p3

    invoke-static {p1, p2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 174
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    array-length v2, p3

    if-eq v0, v2, :cond_18

    .line 176
    aget-byte v2, v1, v0

    aget-byte v3, p3, v0

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 174
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 179
    :cond_18
    return-object v1
.end method

.method private bytesToint([BI)I
    .registers 6
    .param p1, "in"    # [B
    .param p2, "inOff"    # I

    .prologue
    .line 152
    add-int/lit8 v0, p2, 0x3

    aget-byte v0, p1, v0

    shl-int/lit8 v0, v0, 0x18

    const/high16 v1, -0x1000000

    and-int/2addr v0, v1

    add-int/lit8 v1, p2, 0x2

    aget-byte v1, p1, v1

    shl-int/lit8 v1, v1, 0x10

    const/high16 v2, 0xff0000

    and-int/2addr v1, v2

    add-int/2addr v0, v1

    add-int/lit8 v1, p2, 0x1

    aget-byte v1, p1, v1

    shl-int/lit8 v1, v1, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    add-int/2addr v0, v1

    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    return v0
.end method

.method private generateWorkingKey([B)[I
    .registers 7
    .param p1, "userKey"    # [B

    .prologue
    const/16 v4, 0x8

    .line 47
    array-length v2, p1

    const/16 v3, 0x20

    if-eq v2, v3, :cond_f

    .line 49
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Key length invalid. Key needs to be 32 byte - 256 bit!!!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 52
    :cond_f
    new-array v1, v4, [I

    .line 53
    .local v1, "key":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    if-eq v0, v4, :cond_1f

    .line 55
    mul-int/lit8 v2, v0, 0x4

    invoke-direct {p0, p1, v2}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bytesToint([BI)I

    move-result v2

    aput v2, v1, v0

    .line 53
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 58
    :cond_1f
    return-object v1
.end method

.method private gost28147MacFunc([I[BI[BI)V
    .registers 12
    .param p1, "workingKey"    # [I
    .param p2, "in"    # [B
    .param p3, "inOff"    # I
    .param p4, "out"    # [B
    .param p5, "outOff"    # I

    .prologue
    .line 130
    invoke-direct {p0, p2, p3}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bytesToint([BI)I

    move-result v0

    .line 131
    .local v0, "N1":I
    add-int/lit8 v5, p3, 0x4

    invoke-direct {p0, p2, v5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bytesToint([BI)I

    move-result v1

    .line 133
    .local v1, "N2":I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_b
    const/4 v5, 0x2

    if-ge v3, v5, :cond_23

    .line 135
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_f
    const/16 v5, 0x8

    if-ge v2, v5, :cond_20

    .line 137
    move v4, v0

    .line 138
    .local v4, "tmp":I
    aget v5, p1, v2

    invoke-direct {p0, v0, v5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->gost28147_mainStep(II)I

    move-result v5

    xor-int v0, v1, v5

    .line 139
    move v1, v4

    .line 135
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 133
    .end local v4    # "tmp":I
    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 143
    .end local v2    # "j":I
    :cond_23
    invoke-direct {p0, v0, p4, p5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->intTobytes(I[BI)V

    .line 144
    add-int/lit8 v5, p5, 0x4

    invoke-direct {p0, v1, p4, v5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->intTobytes(I[BI)V

    .line 145
    return-void
.end method

.method private gost28147_mainStep(II)I
    .registers 7
    .param p1, "n1"    # I
    .param p2, "key"    # I

    .prologue
    .line 106
    add-int v0, p2, p1

    .line 110
    .local v0, "cm":I
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0x0

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x0

    aget-byte v2, v2, v3

    shl-int/lit8 v1, v2, 0x0

    .line 111
    .local v1, "om":I
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0x4

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x10

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x4

    add-int/2addr v1, v2

    .line 112
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0x8

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x20

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x8

    add-int/2addr v1, v2

    .line 113
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0xc

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x30

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0xc

    add-int/2addr v1, v2

    .line 114
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0x10

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x40

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x10

    add-int/2addr v1, v2

    .line 115
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0x14

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x50

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x14

    add-int/2addr v1, v2

    .line 116
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0x18

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x60

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x18

    add-int/2addr v1, v2

    .line 117
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    shr-int/lit8 v3, v0, 0x1c

    and-int/lit8 v3, v3, 0xf

    add-int/lit8 v3, v3, 0x70

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x1c

    add-int/2addr v1, v2

    .line 119
    shl-int/lit8 v2, v1, 0xb

    ushr-int/lit8 v3, v1, 0x15

    or-int/2addr v2, v3

    return v2
.end method

.method private intTobytes(I[BI)V
    .registers 6
    .param p1, "num"    # I
    .param p2, "out"    # [B
    .param p3, "outOff"    # I

    .prologue
    .line 162
    add-int/lit8 v0, p3, 0x3

    ushr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 163
    add-int/lit8 v0, p3, 0x2

    ushr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 164
    add-int/lit8 v0, p3, 0x1

    ushr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 165
    int-to-byte v0, p1

    aput-byte v0, p2, p3

    .line 166
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 9
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 257
    :goto_1
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    iget v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    if-ge v0, v1, :cond_14

    .line 259
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    aput-byte v3, v0, v1

    .line 260
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    goto :goto_1

    .line 263
    :cond_14
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    array-length v0, v0

    new-array v2, v0, [B

    .line 264
    .local v2, "sumbuf":[B
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    array-length v1, v1

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 266
    iget-boolean v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    if-eqz v0, :cond_45

    .line 268
    iput-boolean v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    .line 275
    :goto_27
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->workingKey:[I

    iget-object v4, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    move-object v0, p0

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->gost28147MacFunc([I[BI[BI)V

    .line 277
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    array-length v1, v1

    div-int/lit8 v1, v1, 0x2

    iget v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->macSize:I

    sub-int/2addr v1, v3

    iget v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->macSize:I

    invoke-static {v0, v1, p1, p2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 279
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->reset()V

    .line 281
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->macSize:I

    return v0

    .line 272
    :cond_45
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    invoke-direct {p0, v0, v3, v1}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->CM5func([BI[B)[B

    move-result-object v2

    goto :goto_27
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    const-string v0, "GOST28147Mac"

    return-object v0
.end method

.method public getMacSize()I
    .registers 2

    .prologue
    .line 101
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->macSize:I

    return v0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .registers 7
    .param p1, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 65
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->reset()V

    .line 66
    iget v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    .line 67
    instance-of v1, p1, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    if-eqz v1, :cond_36

    move-object v0, p1

    .line 69
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    .line 74
    .local v0, "param":Lorg/spongycastle/crypto/params/ParametersWithSBox;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithSBox;->getSBox()[B

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->S:[B

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithSBox;->getSBox()[B

    move-result-object v3

    array-length v3, v3

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithSBox;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v1

    if-eqz v1, :cond_35

    .line 81
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithSBox;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->generateWorkingKey([B)[I

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->workingKey:[I

    .line 92
    .end local v0    # "param":Lorg/spongycastle/crypto/params/ParametersWithSBox;
    .end local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    :cond_35
    :goto_35
    return-void

    .line 84
    .restart local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    :cond_36
    instance-of v1, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    if-eqz v1, :cond_47

    .line 86
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .end local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->generateWorkingKey([B)[I

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->workingKey:[I

    goto :goto_35

    .line 90
    .restart local p1    # "params":Lorg/spongycastle/crypto/CipherParameters;
    :cond_47
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid parameter passed to GOST28147 init - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 289
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_e

    .line 291
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    aput-byte v2, v1, v0

    .line 289
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 294
    :cond_e
    iput v2, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    .line 296
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    .line 297
    return-void
.end method

.method public update(B)V
    .registers 8
    .param p1, "in"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 185
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    array-length v1, v1

    if-ne v0, v1, :cond_26

    .line 187
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    array-length v0, v0

    new-array v2, v0, [B

    .line 188
    .local v2, "sumbuf":[B
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    array-length v1, v1

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 190
    iget-boolean v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    if-eqz v0, :cond_31

    .line 192
    iput-boolean v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    .line 199
    :goto_1b
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->workingKey:[I

    iget-object v4, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    move-object v0, p0

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->gost28147MacFunc([I[BI[BI)V

    .line 200
    iput v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    .line 203
    .end local v2    # "sumbuf":[B
    :cond_26
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    aput-byte p1, v0, v1

    .line 204
    return-void

    .line 196
    .restart local v2    # "sumbuf":[B
    :cond_31
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    invoke-direct {p0, v0, v3, v1}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->CM5func([BI[B)[B

    move-result-object v2

    goto :goto_1b
.end method

.method public update([BII)V
    .registers 11
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 209
    if-gez p3, :cond_b

    .line 211
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t have a negative input length!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_b
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    iget v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    sub-int v6, v0, v1

    .line 216
    .local v6, "gapLen":I
    if-le p3, v6, :cond_5d

    .line 218
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    invoke-static {p1, p2, v0, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 220
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    array-length v0, v0

    new-array v2, v0, [B

    .line 221
    .local v2, "sumbuf":[B
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    array-length v1, v1

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 223
    iget-boolean v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    if-eqz v0, :cond_54

    .line 225
    iput-boolean v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->firstStep:Z

    .line 232
    :goto_2d
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->workingKey:[I

    iget-object v4, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    move-object v0, p0

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->gost28147MacFunc([I[BI[BI)V

    .line 234
    iput v3, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    .line 235
    sub-int/2addr p3, v6

    .line 236
    add-int/2addr p2, v6

    .line 238
    :goto_3a
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    if-le p3, v0, :cond_5d

    .line 240
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->CM5func([BI[B)[B

    move-result-object v2

    .line 241
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->workingKey:[I

    iget-object v4, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    move-object v0, p0

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->gost28147MacFunc([I[BI[BI)V

    .line 243
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    sub-int/2addr p3, v0

    .line 244
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->blockSize:I

    add-int/2addr p2, v0

    goto :goto_3a

    .line 229
    :cond_54
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->mac:[B

    invoke-direct {p0, v0, v3, v1}, Lorg/spongycastle/crypto/macs/GOST28147Mac;->CM5func([BI[B)[B

    move-result-object v2

    goto :goto_2d

    .line 248
    .end local v2    # "sumbuf":[B
    :cond_5d
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 250
    iget v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/spongycastle/crypto/macs/GOST28147Mac;->bufOff:I

    .line 251
    return-void
.end method
