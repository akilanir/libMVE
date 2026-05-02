.class public Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;
.super Ljava/lang/Object;
.source "McElieceCCA2PrivateKeySpec.java"

# interfaces
.implements Ljava/security/spec/KeySpec;


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
.method public constructor <init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V
    .registers 9
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "k"    # I
    .param p4, "field"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .param p5, "gp"    # Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .param p6, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .param p7, "h"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .param p8, "qInv"    # [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->oid:Ljava/lang/String;

    .line 58
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->n:I

    .line 59
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->k:I

    .line 60
    iput-object p4, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 61
    iput-object p5, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 62
    iput-object p6, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 63
    iput-object p7, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 64
    iput-object p8, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II[B[B[B[B[[B)V
    .registers 14
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "k"    # I
    .param p4, "encFieldPoly"    # [B
    .param p5, "encGoppaPoly"    # [B
    .param p6, "encP"    # [B
    .param p7, "encH"    # [B
    .param p8, "encQInv"    # [[B

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->oid:Ljava/lang/String;

    .line 84
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->n:I

    .line 85
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->k:I

    .line 86
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v1, p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 87
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v1, v2, p5}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 88
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    invoke-direct {v1, p6}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 89
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v1, p7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 90
    array-length v1, p8

    new-array v1, v1, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 91
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2d
    array-length v1, p8

    if-ge v0, v1, :cond_40

    .line 93
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    aget-object v4, p8, v0

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    aput-object v2, v1, v0

    .line 91
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 95
    :cond_40
    return-void
.end method


# virtual methods
.method public getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    return-object v0
.end method

.method public getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->k:I

    return v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 102
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->n:I

    return v0
.end method

.method public getOIDString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->oid:Ljava/lang/String;

    return-object v0
.end method

.method public getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    return-object v0
.end method

.method public getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method
