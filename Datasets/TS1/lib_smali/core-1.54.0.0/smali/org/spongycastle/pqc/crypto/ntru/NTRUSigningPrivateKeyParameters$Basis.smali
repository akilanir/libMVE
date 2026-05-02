.class public Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
.super Ljava/lang/Object;
.source "NTRUSigningPrivateKeyParameters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Basis"
.end annotation


# instance fields
.field public f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

.field public fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

.field public h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

.field params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;Z)V
    .registers 16
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;
    .param p3, "include_h"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    iget v1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->N:I

    .line 228
    .local v1, "N":I
    iget v9, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->q:I

    .line 229
    .local v9, "q":I
    iget v2, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->d1:I

    .line 230
    .local v2, "d1":I
    iget v3, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->d2:I

    .line 231
    .local v3, "d2":I
    iget v5, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->d3:I

    .line 232
    .local v5, "d3":I
    iget-boolean v10, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->sparse:Z

    .line 233
    .local v10, "sparse":Z
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    .line 235
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->polyType:I

    if-ne v0, v11, :cond_39

    .line 237
    add-int/lit8 v4, v5, 0x1

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;->fromBinary(Ljava/io/InputStream;IIIII)Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    .line 245
    :goto_1f
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->basisType:I

    if-nez v0, :cond_58

    .line 247
    invoke-static {p1, v1, v9}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary(Ljava/io/InputStream;II)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v7

    .line 248
    .local v7, "fPrimeInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_28
    iget-object v0, v7, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    array-length v0, v0

    if-ge v8, v0, :cond_4d

    .line 250
    iget-object v0, v7, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v4, v0, v8

    div-int/lit8 v11, v9, 0x2

    sub-int/2addr v4, v11

    aput v4, v0, v8

    .line 248
    add-int/lit8 v8, v8, 0x1

    goto :goto_28

    .line 241
    .end local v7    # "fPrimeInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v8    # "i":I
    :cond_39
    invoke-static {p1, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary3Tight(Ljava/io/InputStream;I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v6

    .line 242
    .local v6, "fInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    if-eqz v10, :cond_47

    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/SparseTernaryPolynomial;

    invoke-direct {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/SparseTernaryPolynomial;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    :goto_44
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    goto :goto_1f

    :cond_47
    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;

    invoke-direct {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    goto :goto_44

    .line 252
    .end local v6    # "fInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .restart local v7    # "fPrimeInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .restart local v8    # "i":I
    :cond_4d
    iput-object v7, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    .line 263
    .end local v7    # "fPrimeInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v8    # "i":I
    :goto_4f
    if-eqz p3, :cond_57

    .line 265
    invoke-static {p1, v1, v9}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary(Ljava/io/InputStream;II)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 267
    :cond_57
    return-void

    .line 254
    :cond_58
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->polyType:I

    if-ne v0, v11, :cond_66

    .line 256
    add-int/lit8 v4, v5, 0x1

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;->fromBinary(Ljava/io/InputStream;IIIII)Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    goto :goto_4f

    .line 260
    :cond_66
    invoke-static {p1, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary3Tight(Ljava/io/InputStream;I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    goto :goto_4f
.end method

.method protected constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;)V
    .registers 5
    .param p1, "f"    # Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .param p2, "fPrime"    # Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .param p3, "h"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p4, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    .prologue
    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    .line 212
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    .line 213
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 214
    iput-object p4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    .line 215
    return-void
.end method

.method private getEncoded(Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;)[B
    .registers 3
    .param p1, "p"    # Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    .prologue
    .line 303
    instance-of v0, p1, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    if-eqz v0, :cond_b

    .line 305
    check-cast p1, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    .end local p1    # "p":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;->toBinary()[B

    move-result-object v0

    .line 309
    :goto_a
    return-object v0

    .restart local p1    # "p":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    :cond_b
    invoke-interface {p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->toBinary3Tight()[B

    move-result-object v0

    goto :goto_a
.end method


# virtual methods
.method encode(Ljava/io/OutputStream;Z)V
    .registers 9
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "include_h"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v2, v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->q:I

    .line 281
    .local v2, "q":I
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-direct {p0, v3}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->getEncoded(Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 282
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v3, v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->basisType:I

    if-nez v3, :cond_3e

    .line 284
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-interface {v3}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    .line 285
    .local v0, "fPrimeInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    iget-object v3, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    array-length v3, v3

    if-ge v1, v3, :cond_2b

    .line 287
    iget-object v3, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v4, v3, v1

    div-int/lit8 v5, v2, 0x2

    add-int/2addr v4, v5

    aput v4, v3, v1

    .line 285
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 289
    :cond_2b
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->toBinary(I)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 295
    .end local v0    # "fPrimeInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v1    # "i":I
    :goto_32
    if-eqz p2, :cond_3d

    .line 297
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v3, v2}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->toBinary(I)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 299
    :cond_3d
    return-void

    .line 293
    :cond_3e
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-direct {p0, v3}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->getEncoded(Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    goto :goto_32
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 328
    if-ne p0, p1, :cond_5

    .line 385
    :cond_4
    :goto_4
    return v1

    .line 332
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 334
    goto :goto_4

    .line 336
    :cond_9
    instance-of v3, p1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    if-nez v3, :cond_f

    move v1, v2

    .line 338
    goto :goto_4

    :cond_f
    move-object v0, p1

    .line 340
    check-cast v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    .line 341
    .local v0, "other":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-nez v3, :cond_1c

    .line 343
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-eqz v3, :cond_28

    move v1, v2

    .line 345
    goto :goto_4

    .line 348
    :cond_1c
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    move v1, v2

    .line 350
    goto :goto_4

    .line 352
    :cond_28
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-nez v3, :cond_32

    .line 354
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-eqz v3, :cond_3e

    move v1, v2

    .line 356
    goto :goto_4

    .line 359
    :cond_32
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3e

    move v1, v2

    .line 361
    goto :goto_4

    .line 363
    :cond_3e
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    if-nez v3, :cond_48

    .line 365
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    if-eqz v3, :cond_54

    move v1, v2

    .line 367
    goto :goto_4

    .line 370
    :cond_48
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_54

    move v1, v2

    .line 372
    goto :goto_4

    .line 374
    :cond_54
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    if-nez v3, :cond_5e

    .line 376
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    if-eqz v3, :cond_4

    move v1, v2

    .line 378
    goto :goto_4

    .line 381
    :cond_5e
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 383
    goto :goto_4
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 316
    const/16 v0, 0x1f

    .line 317
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 318
    .local v1, "result":I
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-nez v2, :cond_26

    move v2, v3

    :goto_9
    add-int/lit8 v1, v2, 0x1f

    .line 319
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-nez v2, :cond_2d

    move v2, v3

    :goto_12
    add-int v1, v4, v2

    .line 320
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    if-nez v2, :cond_34

    move v2, v3

    :goto_1b
    add-int v1, v4, v2

    .line 321
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    if-nez v4, :cond_3b

    :goto_23
    add-int v1, v2, v3

    .line 322
    return v1

    .line 318
    :cond_26
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_9

    .line 319
    :cond_2d
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_12

    .line 320
    :cond_34
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_1b

    .line 321
    :cond_3b
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    invoke-virtual {v3}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->hashCode()I

    move-result v3

    goto :goto_23
.end method
