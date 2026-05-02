.class public Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;
.super Ljava/lang/Object;
.source "GOST3410ValidationParameters.java"


# instance fields
.field private c:I

.field private cL:J

.field private x0:I

.field private x0L:J


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "x0"    # I
    .param p2, "c"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    .line 16
    iput p2, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    .line 17
    return-void
.end method

.method public constructor <init>(JJ)V
    .registers 5
    .param p1, "x0L"    # J
    .param p3, "cL"    # J

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-wide p1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    .line 24
    iput-wide p3, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    .line 25
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 50
    instance-of v2, p1, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    if-nez v2, :cond_6

    .line 77
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 55
    check-cast v0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    .line 57
    .local v0, "other":Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;
    iget v2, v0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    iget v3, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    if-ne v2, v3, :cond_5

    .line 62
    iget v2, v0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    iget v3, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    if-ne v2, v3, :cond_5

    .line 67
    iget-wide v2, v0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    iget-wide v4, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_5

    .line 72
    iget-wide v2, v0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    iget-wide v4, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_5

    .line 77
    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getC()I
    .registers 2

    .prologue
    .line 29
    iget v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    return v0
.end method

.method public getCL()J
    .registers 3

    .prologue
    .line 39
    iget-wide v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    return-wide v0
.end method

.method public getX0()I
    .registers 2

    .prologue
    .line 34
    iget v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    return v0
.end method

.method public getX0L()J
    .registers 3

    .prologue
    .line 44
    iget-wide v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/16 v3, 0x20

    .line 82
    iget v0, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0:I

    iget v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->c:I

    xor-int/2addr v0, v1

    iget-wide v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    long-to-int v1, v1

    xor-int/2addr v0, v1

    iget-wide v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->x0L:J

    shr-long/2addr v1, v3

    long-to-int v1, v1

    xor-int/2addr v0, v1

    iget-wide v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    long-to-int v1, v1

    xor-int/2addr v0, v1

    iget-wide v1, p0, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;->cL:J

    shr-long/2addr v1, v3

    long-to-int v1, v1

    xor-int/2addr v0, v1

    return v0
.end method
