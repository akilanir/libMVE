.class public Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;
.super Ljava/lang/Object;
.source "McEliecePrivateKeySpec.java"

# interfaces
.implements Ljava/security/spec/KeySpec;


# instance fields
.field private field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

.field private goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

.field private h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

.field private k:I

.field private n:I

.field private oid:Ljava/lang/String;

.field private p1:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

.field private p2:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

.field private qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

.field private sInv:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;


# direct methods
.method public constructor <init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V
    .registers 11
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "k"    # I
    .param p4, "field"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .param p5, "goppaPoly"    # Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .param p6, "sInv"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .param p7, "p1"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .param p8, "p2"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .param p9, "h"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .param p10, "qInv"    # [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->oid:Ljava/lang/String;

    .line 73
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->k:I

    .line 74
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->n:I

    .line 75
    iput-object p4, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 76
    iput-object p5, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 77
    iput-object p6, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->sInv:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 78
    iput-object p7, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->p1:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 79
    iput-object p8, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->p2:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 80
    iput-object p9, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 81
    iput-object p10, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II[B[B[B[B[B[B[[B)V
    .registers 16
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "k"    # I
    .param p4, "encField"    # [B
    .param p5, "encGoppaPoly"    # [B
    .param p6, "encSInv"    # [B
    .param p7, "encP1"    # [B
    .param p8, "encP2"    # [B
    .param p9, "encH"    # [B
    .param p10, "encQInv"    # [[B

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->oid:Ljava/lang/String;

    .line 107
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->n:I

    .line 108
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->k:I

    .line 109
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v1, p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 110
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-direct {v1, v2, p5}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 111
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v1, p6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->sInv:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 112
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    invoke-direct {v1, p7}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->p1:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 113
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    invoke-direct {v1, p8}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->p2:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 114
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v1, p9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 115
    array-length v1, p10

    new-array v1, v1, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iput-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 116
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3b
    array-length v1, p10

    if-ge v0, v1, :cond_4e

    .line 118
    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    aget-object v4, p10, v0

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    aput-object v2, v1, v0

    .line 116
    add-int/lit8 v0, v0, 0x1

    goto :goto_3b

    .line 120
    :cond_4e
    return-void
.end method


# virtual methods
.method public getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    return-object v0
.end method

.method public getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 183
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 135
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->k:I

    return v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 127
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->n:I

    return v0
.end method

.method public getOIDString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 197
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->oid:Ljava/lang/String;

    return-object v0
.end method

.method public getP1()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->p1:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    return-object v0
.end method

.method public getP2()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->p2:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    return-object v0
.end method

.method public getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getSInv()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec;->sInv:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method
