.class public Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;
.super Ljava/lang/Object;
.source "ECCKeyGenParameterSpec.java"

# interfaces
.implements Ljava/security/spec/AlgorithmParameterSpec;


# static fields
.field public static final DEFAULT_M:I = 0xb

.field public static final DEFAULT_T:I = 0x32


# instance fields
.field private fieldPoly:I

.field private m:I

.field private n:I

.field private t:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 51
    const/16 v0, 0xb

    const/16 v1, 0x32

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;-><init>(II)V

    .line 52
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "keysize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    if-ge p1, v1, :cond_e

    .line 65
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "key size must be positive"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_e
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    .line 68
    iput v1, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    .line 69
    :goto_13
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    if-ge v0, p1, :cond_24

    .line 71
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    shl-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    .line 72
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    goto :goto_13

    .line 74
    :cond_24
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    ushr-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->t:I

    .line 75
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->t:I

    iget v1, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    div-int/2addr v0, v1

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->t:I

    .line 76
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    invoke-static {v0}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2;->getIrreduciblePolynomial(I)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->fieldPoly:I

    .line 77
    return-void
.end method

.method public constructor <init>(II)V
    .registers 5
    .param p1, "m"    # I
    .param p2, "t"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    if-ge p1, v1, :cond_e

    .line 92
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "m must be positive"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_e
    const/16 v0, 0x20

    if-le p1, v0, :cond_1a

    .line 96
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "m is too large"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_1a
    iput p1, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    .line 99
    shl-int v0, v1, p1

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    .line 100
    if-gez p2, :cond_2a

    .line 102
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "t must be positive"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_2a
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    if-le p2, v0, :cond_36

    .line 106
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "t must be less than n = 2^m"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_36
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->t:I

    .line 109
    invoke-static {p1}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2;->getIrreduciblePolynomial(I)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->fieldPoly:I

    .line 110
    return-void
.end method

.method public constructor <init>(III)V
    .registers 6
    .param p1, "m"    # I
    .param p2, "t"    # I
    .param p3, "poly"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidParameterException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    iput p1, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    .line 126
    if-ge p1, v1, :cond_10

    .line 128
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "m must be positive"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_10
    const/16 v0, 0x20

    if-le p1, v0, :cond_1c

    .line 132
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, " m is too large"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_1c
    shl-int v0, v1, p1

    iput v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    .line 135
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->t:I

    .line 136
    if-gez p2, :cond_2c

    .line 138
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "t must be positive"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_2c
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    if-le p2, v0, :cond_38

    .line 142
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "t must be less than n = 2^m"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_38
    invoke-static {p3}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2;->degree(I)I

    move-result v0

    if-ne v0, p1, :cond_47

    .line 145
    invoke-static {p3}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialRingGF2;->isIrreducible(I)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 147
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->fieldPoly:I

    .line 154
    return-void

    .line 151
    :cond_47
    new-instance v0, Ljava/security/InvalidParameterException;

    const-string v1, "polynomial is not a field polynomial for GF(2^m)"

    invoke-direct {v0, v1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getFieldPoly()I
    .registers 2

    .prologue
    .line 185
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->fieldPoly:I

    return v0
.end method

.method public getM()I
    .registers 2

    .prologue
    .line 161
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->m:I

    return v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 169
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->n:I

    return v0
.end method

.method public getT()I
    .registers 2

    .prologue
    .line 177
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec;->t:I

    return v0
.end method
