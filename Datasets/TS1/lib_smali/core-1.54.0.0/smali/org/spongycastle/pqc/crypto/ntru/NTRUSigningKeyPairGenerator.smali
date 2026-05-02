.class public Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;
.super Ljava/lang/Object;
.source "NTRUSigningKeyPairGenerator.java"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$FGBasis;,
        Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$BasisGenerationTask;
    }
.end annotation


# instance fields
.field private params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private generateBasis()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$FGBasis;
    .registers 48

    .prologue
    .line 167
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v3, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->N:I

    .line 168
    .local v3, "N":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v0, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->q:I

    move/from16 v41, v0

    .line 169
    .local v41, "q":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v0, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->d:I

    move/from16 v29, v0

    .line 170
    .local v29, "d":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v4, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->d1:I

    .line 171
    .local v4, "d1":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v5, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->d2:I

    .line 172
    .local v5, "d2":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v7, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->d3:I

    .line 173
    .local v7, "d3":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v0, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->basisType:I

    move/from16 v28, v0

    .line 184
    .local v28, "basisType":I
    mul-int/lit8 v6, v3, 0x2

    add-int/lit8 v27, v6, 0x1

    .line 185
    .local v27, "_2n1":I
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget-boolean v0, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->primeCheck:Z

    move/from16 v40, v0

    .line 191
    .local v40, "primeCheck":Z
    :cond_3c
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v6, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->polyType:I

    if-nez v6, :cond_138

    add-int/lit8 v6, v29, 0x1

    new-instance v8, Ljava/security/SecureRandom;

    invoke-direct {v8}, Ljava/security/SecureRandom;-><init>()V

    move/from16 v0, v29

    invoke-static {v3, v6, v0, v8}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->generateRandom(IIILjava/security/SecureRandom;)Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;

    move-result-object v15

    .line 192
    .local v15, "f":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    :goto_51
    invoke-interface {v15}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v9

    .line 194
    .local v9, "fInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    if-eqz v40, :cond_67

    move/from16 v0, v27

    invoke-virtual {v9, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->resultant(I)Lorg/spongycastle/pqc/math/ntru/polynomial/ModularResultant;

    move-result-object v6

    iget-object v6, v6, Lorg/spongycastle/pqc/math/ntru/polynomial/ModularResultant;->res:Ljava/math/BigInteger;

    sget-object v8, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v6, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3c

    .line 195
    :cond_67
    move/from16 v0, v41

    invoke-virtual {v9, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->invertFq(I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v33

    .line 197
    .local v33, "fq":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    if-eqz v33, :cond_3c

    .line 198
    invoke-virtual {v9}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->resultant()Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;

    move-result-object v43

    .line 206
    .local v43, "rf":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    :cond_73
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v6, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->polyType:I

    if-nez v6, :cond_145

    add-int/lit8 v6, v29, 0x1

    new-instance v8, Ljava/security/SecureRandom;

    invoke-direct {v8}, Ljava/security/SecureRandom;-><init>()V

    move/from16 v0, v29

    invoke-static {v3, v6, v0, v8}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;->generateRandom(IIILjava/security/SecureRandom;)Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;

    move-result-object v34

    .line 207
    .local v34, "g":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    :goto_88
    invoke-interface/range {v34 .. v34}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v10

    .line 209
    .local v10, "gInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    if-eqz v40, :cond_9e

    move/from16 v0, v27

    invoke-virtual {v10, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->resultant(I)Lorg/spongycastle/pqc/math/ntru/polynomial/ModularResultant;

    move-result-object v6

    iget-object v6, v6, Lorg/spongycastle/pqc/math/ntru/polynomial/ModularResultant;->res:Ljava/math/BigInteger;

    sget-object v8, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v6, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_73

    .line 211
    :cond_9e
    move/from16 v0, v41

    invoke-virtual {v10, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->invertFq(I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v6

    if-eqz v6, :cond_73

    .line 212
    invoke-virtual {v10}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->resultant()Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;

    move-result-object v44

    .line 213
    .local v44, "rg":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    move-object/from16 v0, v43

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->res:Ljava/math/BigInteger;

    move-object/from16 v0, v44

    iget-object v8, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->res:Ljava/math/BigInteger;

    invoke-static {v6, v8}, Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;->calculate(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;

    move-result-object v42

    .line 215
    .local v42, "r":Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;
    move-object/from16 v0, v42

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;->gcd:Ljava/math/BigInteger;

    sget-object v8, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v6, v8}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_73

    .line 217
    move-object/from16 v0, v43

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->rho:Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->clone()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    .line 218
    .local v21, "A":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    move-object/from16 v0, v42

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;->x:Ljava/math/BigInteger;

    move/from16 v0, v41

    int-to-long v13, v0

    invoke-static {v13, v14}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->mult(Ljava/math/BigInteger;)V

    .line 219
    move-object/from16 v0, v44

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->rho:Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->clone()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    .line 220
    .local v22, "B":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    move-object/from16 v0, v42

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;->y:Ljava/math/BigInteger;

    move/from16 v0, v41

    neg-int v8, v0

    int-to-long v13, v8

    invoke-static {v13, v14}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->mult(Ljava/math/BigInteger;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v6, v6, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->keyGenAlg:I

    if-nez v6, :cond_1fa

    .line 225
    new-array v0, v3, [I

    move-object/from16 v32, v0

    .line 226
    .local v32, "fRevCoeffs":[I
    new-array v0, v3, [I

    move-object/from16 v37, v0

    .line 227
    .local v37, "gRevCoeffs":[I
    const/4 v6, 0x0

    iget-object v8, v9, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    const/4 v13, 0x0

    aget v8, v8, v13

    aput v8, v32, v6

    .line 228
    const/4 v6, 0x0

    iget-object v8, v10, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    const/4 v13, 0x0

    aget v8, v8, v13

    aput v8, v37, v6

    .line 229
    const/16 v38, 0x1

    .local v38, "i":I
    :goto_121
    move/from16 v0, v38

    if-ge v0, v3, :cond_152

    .line 231
    iget-object v6, v9, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    sub-int v8, v3, v38

    aget v6, v6, v8

    aput v6, v32, v38

    .line 232
    iget-object v6, v10, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    sub-int v8, v3, v38

    aget v6, v6, v8

    aput v6, v37, v38

    .line 229
    add-int/lit8 v38, v38, 0x1

    goto :goto_121

    .line 191
    .end local v9    # "fInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v10    # "gInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v15    # "f":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .end local v21    # "A":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .end local v22    # "B":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .end local v32    # "fRevCoeffs":[I
    .end local v33    # "fq":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v34    # "g":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .end local v37    # "gRevCoeffs":[I
    .end local v38    # "i":I
    .end local v42    # "r":Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;
    .end local v43    # "rf":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    .end local v44    # "rg":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    :cond_138
    add-int/lit8 v6, v7, 0x1

    new-instance v8, Ljava/security/SecureRandom;

    invoke-direct {v8}, Ljava/security/SecureRandom;-><init>()V

    invoke-static/range {v3 .. v8}, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;->generateRandom(IIIIILjava/security/SecureRandom;)Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    move-result-object v15

    goto/16 :goto_51

    .line 206
    .restart local v9    # "fInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .restart local v15    # "f":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .restart local v33    # "fq":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .restart local v43    # "rf":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    :cond_145
    add-int/lit8 v6, v7, 0x1

    new-instance v8, Ljava/security/SecureRandom;

    invoke-direct {v8}, Ljava/security/SecureRandom;-><init>()V

    invoke-static/range {v3 .. v8}, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;->generateRandom(IIIIILjava/security/SecureRandom;)Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    move-result-object v34

    goto/16 :goto_88

    .line 234
    .restart local v10    # "gInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .restart local v21    # "A":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .restart local v22    # "B":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .restart local v32    # "fRevCoeffs":[I
    .restart local v34    # "g":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .restart local v37    # "gRevCoeffs":[I
    .restart local v38    # "i":I
    .restart local v42    # "r":Lorg/spongycastle/pqc/math/ntru/euclid/BigIntEuclidean;
    .restart local v44    # "rg":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    :cond_152
    new-instance v31, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-direct/range {v31 .. v32}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>([I)V

    .line 235
    .local v31, "fRev":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    new-instance v36, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-direct/range {v36 .. v37}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>([I)V

    .line 237
    .local v36, "gRev":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    move-object/from16 v0, v31

    invoke-interface {v15, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v46

    .line 238
    .local v46, "t":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    move-object/from16 v0, v34

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v6

    move-object/from16 v0, v46

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->add(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    .line 239
    invoke-virtual/range {v46 .. v46}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->resultant()Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;

    move-result-object v45

    .line 240
    .local v45, "rt":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    move-object/from16 v0, v31

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    move-result-object v23

    .line 241
    .local v23, "C":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    move-object/from16 v0, v36

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    move-result-object v6

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->add(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)V

    .line 242
    move-object/from16 v0, v45

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->rho:Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    move-result-object v23

    .line 243
    move-object/from16 v0, v45

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->res:Ljava/math/BigInteger;

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->div(Ljava/math/BigInteger;)V

    .line 267
    .end local v31    # "fRev":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v32    # "fRevCoeffs":[I
    .end local v36    # "gRev":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v37    # "gRevCoeffs":[I
    .end local v45    # "rt":Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;
    .end local v46    # "t":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    :goto_19b
    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->clone()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    .line 268
    .local v25, "F":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    move-object/from16 v0, v23

    invoke-interface {v15, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    move-result-object v6

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->sub(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)V

    .line 269
    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->clone()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    .line 270
    .local v26, "G":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    move-object/from16 v0, v34

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    move-result-object v6

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->sub(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)V

    .line 272
    new-instance v11, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-object/from16 v0, v25

    invoke-direct {v11, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)V

    .line 273
    .local v11, "FInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    new-instance v12, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-object/from16 v0, v26

    invoke-direct {v12, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)V

    .local v12, "GInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    move-object/from16 v8, p0

    move v13, v3

    .line 274
    invoke-direct/range {v8 .. v13}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->minimizeFG(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;I)V

    .line 278
    if-nez v28, :cond_257

    .line 280
    move-object/from16 v16, v11

    .line 281
    .local v16, "fPrime":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    move-object/from16 v0, v34

    move-object/from16 v1, v33

    move/from16 v2, v41

    invoke-interface {v0, v1, v2}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v17

    .line 288
    .local v17, "h":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    :goto_1e1
    move-object/from16 v0, v17

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->modPositive(I)V

    .line 290
    new-instance v13, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$FGBasis;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    move-object/from16 v20, v0

    move-object/from16 v14, p0

    move-object/from16 v18, v11

    move-object/from16 v19, v12

    invoke-direct/range {v13 .. v20}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$FGBasis;-><init>(Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;)V

    return-object v13

    .line 248
    .end local v11    # "FInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v12    # "GInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v16    # "fPrime":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .end local v17    # "h":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .end local v23    # "C":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .end local v25    # "F":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .end local v26    # "G":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .end local v38    # "i":I
    :cond_1fa
    const/16 v39, 0x0

    .line 249
    .local v39, "log10N":I
    const/16 v38, 0x1

    .restart local v38    # "i":I
    :goto_1fe
    move/from16 v0, v38

    if-ge v0, v3, :cond_207

    .line 251
    add-int/lit8 v39, v39, 0x1

    .line 249
    mul-int/lit8 v38, v38, 0xa

    goto :goto_1fe

    .line 258
    :cond_207
    move-object/from16 v0, v43

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->rho:Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    new-instance v8, Ljava/math/BigDecimal;

    move-object/from16 v0, v43

    iget-object v13, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->res:Ljava/math/BigInteger;

    invoke-direct {v8, v13}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    invoke-virtual/range {v22 .. v22}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->getMaxCoeffLength()I

    move-result v13

    add-int/lit8 v13, v13, 0x1

    add-int v13, v13, v39

    invoke-virtual {v6, v8, v13}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->div(Ljava/math/BigDecimal;I)Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;

    move-result-object v30

    .line 259
    .local v30, "fInv":Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;
    move-object/from16 v0, v44

    iget-object v6, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->rho:Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    new-instance v8, Ljava/math/BigDecimal;

    move-object/from16 v0, v44

    iget-object v13, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/Resultant;->res:Ljava/math/BigInteger;

    invoke-direct {v8, v13}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    invoke-virtual/range {v21 .. v21}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->getMaxCoeffLength()I

    move-result v13

    add-int/lit8 v13, v13, 0x1

    add-int v13, v13, v39

    invoke-virtual {v6, v8, v13}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;->div(Ljava/math/BigDecimal;I)Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;

    move-result-object v35

    .line 261
    .local v35, "gInv":Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;
    move-object/from16 v0, v30

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;

    move-result-object v24

    .line 262
    .local v24, "Cdec":Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;
    move-object/from16 v0, v35

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;)Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;

    move-result-object v6

    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;->add(Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;)V

    .line 263
    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;->halve()V

    .line 264
    invoke-virtual/range {v24 .. v24}, Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;->round()Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;

    move-result-object v23

    .restart local v23    # "C":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    goto/16 :goto_19b

    .line 285
    .end local v24    # "Cdec":Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;
    .end local v30    # "fInv":Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;
    .end local v35    # "gInv":Lorg/spongycastle/pqc/math/ntru/polynomial/BigDecimalPolynomial;
    .end local v39    # "log10N":I
    .restart local v11    # "FInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .restart local v12    # "GInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .restart local v25    # "F":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    .restart local v26    # "G":Lorg/spongycastle/pqc/math/ntru/polynomial/BigIntPolynomial;
    :cond_257
    move-object/from16 v16, v34

    .line 286
    .restart local v16    # "fPrime":Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    move-object/from16 v0, v33

    move/from16 v1, v41

    invoke-virtual {v11, v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->mult(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v17

    .restart local v17    # "h":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    goto :goto_1e1
.end method

.method private minimizeFG(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;I)V
    .registers 22
    .param p1, "f"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p2, "g"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p3, "F"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p4, "G"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p5, "N"    # I

    .prologue
    .line 109
    const/4 v5, 0x0

    .line 110
    .local v5, "E":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    move/from16 v0, p5

    if-ge v7, v0, :cond_28

    .line 112
    mul-int/lit8 v12, p5, 0x2

    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v13, v13, v7

    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v14, v14, v7

    mul-int/2addr v13, v14

    move-object/from16 v0, p2

    iget-object v14, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v14, v14, v7

    move-object/from16 v0, p2

    iget-object v15, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v15, v15, v7

    mul-int/2addr v14, v15

    add-int/2addr v13, v14

    mul-int/2addr v12, v13

    add-int/2addr v5, v12

    .line 110
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 116
    :cond_28
    add-int/lit8 v5, v5, -0x4

    .line 118
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->clone()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 119
    .local v10, "u":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    invoke-virtual/range {p2 .. p2}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->clone()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 120
    .local v11, "v":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    const/4 v7, 0x0

    .line 121
    const/4 v8, 0x0

    .line 122
    .local v8, "k":I
    move/from16 v9, p5

    .line 123
    .local v9, "maxAdjustment":I
    :goto_3a
    if-ge v8, v9, :cond_a1

    move/from16 v0, p5

    if-ge v7, v0, :cond_a1

    .line 125
    const/4 v1, 0x0

    .line 126
    .local v1, "D":I
    const/4 v6, 0x0

    .line 127
    .local v6, "i":I
    :goto_42
    move/from16 v0, p5

    if-ge v6, v0, :cond_6c

    .line 129
    move-object/from16 v0, p3

    iget-object v12, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v12, v12, v6

    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v13, v13, v6

    mul-int v2, v12, v13

    .line 130
    .local v2, "D1":I
    move-object/from16 v0, p4

    iget-object v12, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v12, v12, v6

    move-object/from16 v0, p2

    iget-object v13, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    aget v13, v13, v6

    mul-int v3, v12, v13

    .line 131
    .local v3, "D2":I
    mul-int/lit8 v12, p5, 0x4

    add-int v13, v2, v3

    mul-int v4, v12, v13

    .line 132
    .local v4, "D3":I
    add-int/2addr v1, v4

    .line 133
    add-int/lit8 v6, v6, 0x1

    .line 134
    goto :goto_42

    .line 136
    .end local v2    # "D1":I
    .end local v3    # "D2":I
    .end local v4    # "D3":I
    :cond_6c
    invoke-virtual/range {p3 .. p3}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->sumCoeffs()I

    move-result v12

    invoke-virtual/range {p4 .. p4}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->sumCoeffs()I

    move-result v13

    add-int/2addr v12, v13

    mul-int/lit8 v2, v12, 0x4

    .line 137
    .restart local v2    # "D1":I
    sub-int/2addr v1, v2

    .line 139
    if-le v1, v5, :cond_90

    .line 141
    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->sub(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    .line 142
    move-object/from16 v0, p4

    invoke-virtual {v0, v11}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->sub(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    .line 143
    add-int/lit8 v8, v8, 0x1

    .line 144
    const/4 v7, 0x0

    .line 153
    :cond_87
    :goto_87
    add-int/lit8 v7, v7, 0x1

    .line 154
    invoke-virtual {v10}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->rotate1()V

    .line 155
    invoke-virtual {v11}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->rotate1()V

    goto :goto_3a

    .line 146
    :cond_90
    neg-int v12, v5

    if-ge v1, v12, :cond_87

    .line 148
    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->add(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    .line 149
    move-object/from16 v0, p4

    invoke-virtual {v0, v11}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->add(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    .line 150
    add-int/lit8 v8, v8, 0x1

    .line 151
    const/4 v7, 0x0

    goto :goto_87

    .line 157
    .end local v1    # "D":I
    .end local v2    # "D1":I
    .end local v6    # "i":I
    :cond_a1
    return-void
.end method


# virtual methods
.method public generateBoundedBasis()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    .registers 3

    .prologue
    .line 302
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->generateBasis()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$FGBasis;

    move-result-object v0

    .line 303
    .local v0, "basis":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$FGBasis;
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$FGBasis;->isNormOk()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 305
    return-object v0
.end method

.method public generateKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .registers 12

    .prologue
    .line 45
    const/4 v8, 0x0

    .line 46
    .local v8, "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    .line 47
    .local v4, "executor":Ljava/util/concurrent/ExecutorService;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .local v0, "bases":Ljava/util/List;, "Ljava/util/List<Ljava/util/concurrent/Future<Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;>;>;"
    iget-object v9, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v5, v9, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->B:I

    .local v5, "k":I
    :goto_e
    if-ltz v5, :cond_20

    .line 50
    new-instance v9, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$BasisGenerationTask;

    const/4 v10, 0x0

    invoke-direct {v9, p0, v10}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$BasisGenerationTask;-><init>(Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator$1;)V

    invoke-interface {v4, v9}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v9

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    add-int/lit8 v5, v5, -0x1

    goto :goto_e

    .line 52
    :cond_20
    invoke-interface {v4}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 54
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .local v2, "basises":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;>;"
    iget-object v9, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v5, v9, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->B:I

    :goto_2c
    if-ltz v5, :cond_5e

    .line 58
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/Future;

    .line 61
    .local v1, "basis":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;>;"
    :try_start_34
    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    iget-object v9, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v9, v9, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->B:I

    if-ne v5, v9, :cond_54

    .line 64
    new-instance v8, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;

    .end local v8    # "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    iget-object v9, v9, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v10, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    invoke-virtual {v10}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->getSigningParameters()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningParameters;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningParameters;)V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_54} :catch_57

    .line 56
    .restart local v8    # "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    :cond_54
    add-int/lit8 v5, v5, -0x1

    goto :goto_2c

    .line 67
    .end local v8    # "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    :catch_57
    move-exception v3

    .line 69
    .local v3, "e":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/IllegalStateException;

    invoke-direct {v9, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 72
    .end local v1    # "basis":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;>;"
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v8    # "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    :cond_5e
    new-instance v7, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;

    invoke-direct {v7, v2, v8}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;-><init>(Ljava/util/List;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;)V

    .line 73
    .local v7, "priv":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;
    new-instance v6, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    invoke-direct {v6, v8, v7}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;-><init>(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)V

    .line 74
    .local v6, "kp":Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    return-object v6
.end method

.method public generateKeyPairSingleThread()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .registers 8

    .prologue
    .line 84
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .local v1, "basises":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;>;"
    const/4 v4, 0x0

    .line 86
    .local v4, "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    iget-object v5, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget v2, v5, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->B:I

    .local v2, "k":I
    :goto_a
    if-ltz v2, :cond_25

    .line 88
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->generateBoundedBasis()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    move-result-object v0

    .line 89
    .local v0, "basis":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    if-nez v2, :cond_22

    .line 92
    new-instance v4, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;

    .end local v4    # "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    invoke-virtual {v6}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->getSigningParameters()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningParameters;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningParameters;)V

    .line 86
    .restart local v4    # "pub":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    :cond_22
    add-int/lit8 v2, v2, -0x1

    goto :goto_a

    .line 95
    .end local v0    # "basis":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    :cond_25
    new-instance v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;

    invoke-direct {v3, v1, v4}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;-><init>(Ljava/util/List;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;)V

    .line 96
    .local v3, "priv":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;
    new-instance v5, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    invoke-direct {v5, v4, v3}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;-><init>(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)V

    return-object v5
.end method

.method public init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V
    .registers 2
    .param p1, "param"    # Lorg/spongycastle/crypto/KeyGenerationParameters;

    .prologue
    .line 35
    check-cast p1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    .end local p1    # "param":Lorg/spongycastle/crypto/KeyGenerationParameters;
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyPairGenerator;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    .line 36
    return-void
.end method
