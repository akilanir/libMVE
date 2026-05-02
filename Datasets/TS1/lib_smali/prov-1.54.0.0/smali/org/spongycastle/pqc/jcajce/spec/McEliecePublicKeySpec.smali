.class public Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;
.super Ljava/lang/Object;
.source "McEliecePublicKeySpec.java"

# interfaces
.implements Ljava/security/spec/KeySpec;


# instance fields
.field private g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

.field private n:I

.field private oid:Ljava/lang/String;

.field private t:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V
    .registers 6
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "t"    # I
    .param p4, "g"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->oid:Ljava/lang/String;

    .line 40
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->n:I

    .line 41
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->t:I

    .line 42
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v0, p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II[B)V
    .registers 6
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "t"    # I
    .param p3, "n"    # I
    .param p4, "encG"    # [B

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->oid:Ljava/lang/String;

    .line 56
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->n:I

    .line 57
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->t:I

    .line 58
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v0, p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 59
    return-void
.end method


# virtual methods
.method public getG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 66
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->n:I

    return v0
.end method

.method public getOIDString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->oid:Ljava/lang/String;

    return-object v0
.end method

.method public getT()I
    .registers 2

    .prologue
    .line 74
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec;->t:I

    return v0
.end method
