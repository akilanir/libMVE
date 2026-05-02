.class public Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;
.super Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;
.source "McEliecePublicKeyParameters.java"


# instance fields
.field private g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

.field private n:I

.field private oid:Ljava/lang/String;

.field private t:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;Lorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;)V
    .registers 7
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "t"    # I
    .param p4, "g"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .param p5, "params"    # Lorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, v0, p5}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;)V

    .line 34
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->oid:Ljava/lang/String;

    .line 35
    iput p2, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->n:I

    .line 36
    iput p3, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->t:I

    .line 37
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v0, p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II[BLorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;)V
    .registers 7
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "t"    # I
    .param p3, "n"    # I
    .param p4, "encG"    # [B
    .param p5, "params"    # Lorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0, p5}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/mceliece/McElieceParameters;)V

    .line 52
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->oid:Ljava/lang/String;

    .line 53
    iput p3, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->n:I

    .line 54
    iput p2, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->t:I

    .line 55
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v0, p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 56
    return-void
.end method


# virtual methods
.method public getG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getNumRows()I

    move-result v0

    return v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 63
    iget v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->n:I

    return v0
.end method

.method public getOIDString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->oid:Ljava/lang/String;

    return-object v0
.end method

.method public getT()I
    .registers 2

    .prologue
    .line 71
    iget v0, p0, Lorg/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters;->t:I

    return v0
.end method
