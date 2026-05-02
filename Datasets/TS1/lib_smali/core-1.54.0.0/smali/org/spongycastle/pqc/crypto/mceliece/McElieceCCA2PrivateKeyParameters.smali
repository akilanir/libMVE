.class public Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;
.super Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2KeyParameters;
.source "McElieceCCA2PrivateKeyParameters.java"


# instance fields
.field private field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

.field private goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

.field private h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

.field private k:I

.field private n:I

.field private oid:Ljava/lang/String;

.field private p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

.field private qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;


# direct methods
.method public constructor <init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;)V
    .registers 11
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "k"    # I
    .param p4, "field"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .param p5, "gp"    # Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .param p6, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .param p7, "h"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .param p8, "qInv"    # [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .param p9, "params"    # Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    .prologue
    .line 59
    const/4 v0, 0x1

    invoke-direct {p0, v0, p9}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2KeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;)V

    .line 60
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->oid:Ljava/lang/String;

    .line 61
    iput p2, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->n:I

    .line 62
    iput p3, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->k:I

    .line 63
    iput-object p4, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 64
    iput-object p5, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 65
    iput-object p6, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 66
    iput-object p7, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 67
    iput-object p8, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II[B[B[B[B[[BLorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;)V
    .registers 15
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "k"    # I
    .param p4, "encFieldPoly"    # [B
    .param p5, "encGoppaPoly"    # [B
    .param p6, "encP"    # [B
    .param p7, "encH"    # [B
    .param p8, "encQInv"    # [[B
    .param p9, "params"    # Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    .prologue
    .line 87
    const/4 v1, 0x1

    invoke-direct {p0, v1, p9}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2KeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;)V

    .line 88
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->oid:Ljava/lang/String;

    .line 89
    iput p2, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->n:I

    .line 90
    iput p3, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->k:I

    .line 91
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v1, p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 92
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v1, v2, p5}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 93
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    invoke-direct {v1, p6}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 94
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v1, p7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 95
    array-length v1, p8

    new-array v1, v1, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 96
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2e
    array-length v1, p8

    if-ge v0, v1, :cond_41

    .line 98
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    aget-object v4, p8, v0

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    aput-object v2, v1, v0

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    .line 100
    :cond_41
    return-void
.end method


# virtual methods
.method public getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    return-object v0
.end method

.method public getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->k:I

    return v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 107
    iget v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->n:I

    return v0
.end method

.method public getOIDString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->oid:Ljava/lang/String;

    return-object v0
.end method

.method public getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    return-object v0
.end method

.method public getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getT()I
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getDegree()I

    move-result v0

    return v0
.end method
