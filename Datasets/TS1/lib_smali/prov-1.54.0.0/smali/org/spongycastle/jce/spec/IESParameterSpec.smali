.class public Lorg/spongycastle/jce/spec/IESParameterSpec;
.super Ljava/lang/Object;
.source "IESParameterSpec.java"

# interfaces
.implements Ljava/security/spec/AlgorithmParameterSpec;


# instance fields
.field private cipherKeySize:I

.field private derivation:[B

.field private encoding:[B

.field private macKeySize:I

.field private nonce:[B

.field private usePointCompression:Z


# direct methods
.method public constructor <init>([B[BI)V
    .registers 11
    .param p1, "derivation"    # [B
    .param p2, "encoding"    # [B
    .param p3, "macKeySize"    # I

    .prologue
    .line 33
    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BII[BZ)V

    .line 34
    return-void
.end method

.method public constructor <init>([B[BII)V
    .registers 12
    .param p1, "derivation"    # [B
    .param p2, "encoding"    # [B
    .param p3, "macKeySize"    # I
    .param p4, "cipherKeySize"    # I

    .prologue
    .line 51
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BII[BZ)V

    .line 52
    return-void
.end method

.method public constructor <init>([B[BII[B)V
    .registers 13
    .param p1, "derivation"    # [B
    .param p2, "encoding"    # [B
    .param p3, "macKeySize"    # I
    .param p4, "cipherKeySize"    # I
    .param p5, "nonce"    # [B

    .prologue
    .line 70
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/jce/spec/IESParameterSpec;-><init>([B[BII[BZ)V

    .line 71
    return-void
.end method

.method public constructor <init>([B[BII[BZ)V
    .registers 11
    .param p1, "derivation"    # [B
    .param p2, "encoding"    # [B
    .param p3, "macKeySize"    # I
    .param p4, "cipherKeySize"    # I
    .param p5, "nonce"    # [B
    .param p6, "usePointCompression"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    if-eqz p1, :cond_2c

    .line 93
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->derivation:[B

    .line 94
    iget-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->derivation:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    :goto_12
    if-eqz p2, :cond_2f

    .line 103
    array-length v0, p2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->encoding:[B

    .line 104
    iget-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->encoding:[B

    array-length v1, p2

    invoke-static {p2, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    :goto_1f
    iput p3, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->macKeySize:I

    .line 112
    iput p4, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->cipherKeySize:I

    .line 113
    invoke-static {p5}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->nonce:[B

    .line 114
    iput-boolean p6, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->usePointCompression:Z

    .line 115
    return-void

    .line 98
    :cond_2c
    iput-object v3, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->derivation:[B

    goto :goto_12

    .line 108
    :cond_2f
    iput-object v3, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->encoding:[B

    goto :goto_1f
.end method


# virtual methods
.method public getCipherKeySize()I
    .registers 2

    .prologue
    .line 146
    iget v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->cipherKeySize:I

    return v0
.end method

.method public getDerivationV()[B
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->derivation:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getEncodingV()[B
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->encoding:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getMacKeySize()I
    .registers 2

    .prologue
    .line 138
    iget v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->macKeySize:I

    return v0
.end method

.method public getNonce()[B
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->nonce:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getPointCompression()Z
    .registers 2

    .prologue
    .line 174
    iget-boolean v0, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->usePointCompression:Z

    return v0
.end method

.method public setPointCompression(Z)V
    .registers 2
    .param p1, "usePointCompression"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lorg/spongycastle/jce/spec/IESParameterSpec;->usePointCompression:Z

    .line 165
    return-void
.end method
