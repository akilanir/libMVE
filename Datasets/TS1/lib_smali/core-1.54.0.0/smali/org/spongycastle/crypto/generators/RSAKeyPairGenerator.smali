.class public Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;
.super Ljava/lang/Object;
.source "RSAKeyPairGenerator.java"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;


# static fields
.field private static final ONE:Ljava/math/BigInteger;


# instance fields
.field private iterations:I

.field private param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 20
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getNumberOfIterations(II)I
    .registers 7
    .param p0, "bits"    # I
    .param p1, "certainty"    # I

    .prologue
    const/16 v4, 0x50

    const/4 v1, 0x5

    const/4 v0, 0x4

    const/16 v3, 0x64

    .line 207
    const/16 v2, 0x600

    if-lt p0, v2, :cond_1b

    .line 209
    if-gt p1, v3, :cond_e

    const/4 v0, 0x3

    .line 227
    :cond_d
    :goto_d
    return v0

    .line 209
    :cond_e
    const/16 v1, 0x80

    if-le p1, v1, :cond_d

    add-int/lit8 v0, p1, -0x80

    add-int/lit8 v0, v0, 0x1

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x4

    goto :goto_d

    .line 213
    :cond_1b
    const/16 v2, 0x400

    if-lt p0, v2, :cond_30

    .line 215
    if-le p1, v3, :cond_d

    const/16 v0, 0x70

    if-gt p1, v0, :cond_27

    move v0, v1

    goto :goto_d

    :cond_27
    add-int/lit8 v0, p1, -0x70

    add-int/lit8 v0, v0, 0x1

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x5

    goto :goto_d

    .line 219
    :cond_30
    const/16 v0, 0x200

    if-lt p0, v0, :cond_45

    .line 221
    if-gt p1, v4, :cond_38

    :goto_36
    move v0, v1

    goto :goto_d

    :cond_38
    if-gt p1, v3, :cond_3c

    const/4 v1, 0x7

    goto :goto_36

    :cond_3c
    add-int/lit8 v0, p1, -0x64

    add-int/lit8 v0, v0, 0x1

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v1, v0, 0x7

    goto :goto_36

    .line 227
    :cond_45
    if-gt p1, v4, :cond_4a

    const/16 v0, 0x28

    goto :goto_d

    :cond_4a
    add-int/lit8 v0, p1, -0x50

    add-int/lit8 v0, v0, 0x1

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x28

    goto :goto_d
.end method


# virtual methods
.method protected chooseRandomPrime(ILjava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 8
    .param p1, "bitlength"    # I
    .param p2, "e"    # Ljava/math/BigInteger;
    .param p3, "sqrdBound"    # Ljava/math/BigInteger;

    .prologue
    .line 162
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    mul-int/lit8 v2, p1, 0x5

    if-eq v0, v2, :cond_43

    .line 164
    new-instance v1, Ljava/math/BigInteger;

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;->getRandom()Ljava/security/SecureRandom;

    move-result-object v3

    invoke-direct {v1, p1, v2, v3}, Ljava/math/BigInteger;-><init>(IILjava/util/Random;)V

    .line 166
    .local v1, "p":Ljava/math/BigInteger;
    invoke-virtual {v1, p2}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    sget-object v3, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 162
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 171
    :cond_20
    invoke-virtual {v1, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    if-ltz v2, :cond_1d

    .line 176
    invoke-virtual {p0, v1}, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->isProbablePrime(Ljava/math/BigInteger;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 181
    sget-object v2, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    sget-object v3, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 186
    return-object v1

    .line 189
    .end local v1    # "p":Ljava/math/BigInteger;
    :cond_43
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "unable to generate prime number for RSA key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public generateKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .registers 30

    .prologue
    .line 33
    const/16 v24, 0x0

    .line 34
    .local v24, "result":Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    const/4 v14, 0x0

    .line 39
    .local v14, "done":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;->getStrength()I

    move-result v26

    .line 40
    .local v26, "strength":I
    add-int/lit8 v3, v26, 0x1

    div-int/lit8 v21, v3, 0x2

    .line 41
    .local v21, "pbitlength":I
    sub-int v23, v26, v21

    .line 42
    .local v23, "qbitlength":I
    div-int/lit8 v3, v26, 0x2

    add-int/lit8 v19, v3, -0x64

    .line 44
    .local v19, "mindiffbits":I
    div-int/lit8 v3, v26, 0x3

    move/from16 v0, v19

    if-ge v0, v3, :cond_1d

    .line 46
    div-int/lit8 v19, v26, 0x3

    .line 49
    :cond_1d
    shr-int/lit8 v18, v26, 0x2

    .line 52
    .local v18, "minWeight":I
    const-wide/16 v27, 0x2

    invoke-static/range {v27 .. v28}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    div-int/lit8 v27, v26, 0x2

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v12

    .line 54
    .local v12, "dLowerBound":Ljava/math/BigInteger;
    sget-object v3, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    add-int/lit8 v27, v26, -0x1

    move/from16 v0, v27

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v25

    .line 56
    .local v25, "squaredBound":Ljava/math/BigInteger;
    sget-object v3, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v17

    .line 58
    .local v17, "minDiff":Ljava/math/BigInteger;
    :cond_3f
    :goto_3f
    if-nez v14, :cond_f7

    .line 62
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v5

    .line 64
    .local v5, "e":Ljava/math/BigInteger;
    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v5, v2}, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->chooseRandomPrime(ILjava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 71
    .local v7, "p":Ljava/math/BigInteger;
    :cond_53
    :goto_53
    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v5, v2}, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->chooseRandomPrime(ILjava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    .line 74
    .local v8, "q":Ljava/math/BigInteger;
    invoke-virtual {v8, v7}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->abs()Ljava/math/BigInteger;

    move-result-object v13

    .line 75
    .local v13, "diff":Ljava/math/BigInteger;
    invoke-virtual {v13}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    move/from16 v0, v19

    if-lt v3, v0, :cond_53

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v3

    if-lez v3, :cond_53

    .line 83
    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    .line 85
    .local v4, "n":Ljava/math/BigInteger;
    invoke-virtual {v4}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    move/from16 v0, v26

    if-eq v3, v0, :cond_86

    .line 91
    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->max(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 92
    goto :goto_53

    .line 101
    :cond_86
    invoke-static {v4}, Lorg/spongycastle/math/ec/WNafUtil;->getNafWeight(Ljava/math/BigInteger;)I

    move-result v3

    move/from16 v0, v18

    if-ge v3, v0, :cond_99

    .line 103
    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v5, v2}, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->chooseRandomPrime(ILjava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 104
    goto :goto_53

    .line 110
    :cond_99
    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v3

    if-gez v3, :cond_a2

    .line 112
    move-object v15, v7

    .line 113
    .local v15, "gcd":Ljava/math/BigInteger;
    move-object v7, v8

    .line 114
    move-object v8, v15

    .line 117
    .end local v15    # "gcd":Ljava/math/BigInteger;
    :cond_a2
    sget-object v3, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v7, v3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v20

    .line 118
    .local v20, "pSub1":Ljava/math/BigInteger;
    sget-object v3, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v8, v3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v22

    .line 119
    .local v22, "qSub1":Ljava/math/BigInteger;
    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v15

    .line 120
    .restart local v15    # "gcd":Ljava/math/BigInteger;
    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v16

    .line 125
    .local v16, "lcm":Ljava/math/BigInteger;
    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 127
    .local v6, "d":Ljava/math/BigInteger;
    invoke-virtual {v6, v12}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v3

    if-lez v3, :cond_3f

    .line 133
    const/4 v14, 0x1

    .line 141
    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v9

    .line 142
    .local v9, "dP":Ljava/math/BigInteger;
    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v10

    .line 143
    .local v10, "dQ":Ljava/math/BigInteger;
    invoke-virtual {v8, v7}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v11

    .line 145
    .local v11, "qInv":Ljava/math/BigInteger;
    new-instance v24, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .end local v24    # "result":Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    new-instance v27, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    const/4 v3, 0x0

    move-object/from16 v0, v27

    invoke-direct {v0, v3, v4, v5}, Lorg/spongycastle/crypto/params/RSAKeyParameters;-><init>(ZLjava/math/BigInteger;Ljava/math/BigInteger;)V

    new-instance v3, Lorg/spongycastle/crypto/params/RSAPrivateCrtKeyParameters;

    invoke-direct/range {v3 .. v11}, Lorg/spongycastle/crypto/params/RSAPrivateCrtKeyParameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    invoke-direct {v0, v1, v3}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;-><init>(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)V

    .line 148
    .restart local v24    # "result":Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    goto/16 :goto_3f

    .line 150
    .end local v4    # "n":Ljava/math/BigInteger;
    .end local v5    # "e":Ljava/math/BigInteger;
    .end local v6    # "d":Ljava/math/BigInteger;
    .end local v7    # "p":Ljava/math/BigInteger;
    .end local v8    # "q":Ljava/math/BigInteger;
    .end local v9    # "dP":Ljava/math/BigInteger;
    .end local v10    # "dQ":Ljava/math/BigInteger;
    .end local v11    # "qInv":Ljava/math/BigInteger;
    .end local v13    # "diff":Ljava/math/BigInteger;
    .end local v15    # "gcd":Ljava/math/BigInteger;
    .end local v16    # "lcm":Ljava/math/BigInteger;
    .end local v20    # "pSub1":Ljava/math/BigInteger;
    .end local v22    # "qSub1":Ljava/math/BigInteger;
    :cond_f7
    return-object v24
.end method

.method public init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V
    .registers 4
    .param p1, "param"    # Lorg/spongycastle/crypto/KeyGenerationParameters;

    .prologue
    .line 27
    check-cast p1, Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    .end local p1    # "param":Lorg/spongycastle/crypto/KeyGenerationParameters;
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    .line 28
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;->getStrength()I

    move-result v0

    iget-object v1, p0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;->getCertainty()I

    move-result v1

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->getNumberOfIterations(II)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->iterations:I

    .line 29
    return-void
.end method

.method protected isProbablePrime(Ljava/math/BigInteger;)Z
    .registers 4
    .param p1, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 197
    invoke-static {p1}, Lorg/spongycastle/math/Primes;->hasAnySmallFactors(Ljava/math/BigInteger;)Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->param:Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/RSAKeyGenerationParameters;->getRandom()Ljava/security/SecureRandom;

    move-result-object v0

    iget v1, p0, Lorg/spongycastle/crypto/generators/RSAKeyPairGenerator;->iterations:I

    invoke-static {p1, v0, v1}, Lorg/spongycastle/math/Primes;->isMRProbablePrime(Ljava/math/BigInteger;Ljava/security/SecureRandom;I)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
