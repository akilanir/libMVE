.class public Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;
.super Ljava/lang/Object;
.source "BCMcElieceCCA2PrivateKey.java"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;
.implements Ljava/security/PrivateKey;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

.field private goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

.field private h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

.field private k:I

.field private mcElieceCCA2Params:Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

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
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->oid:Ljava/lang/String;

    .line 81
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->n:I

    .line 82
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->k:I

    .line 83
    iput-object p4, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 84
    iput-object p5, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 85
    iput-object p6, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 86
    iput-object p7, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 87
    iput-object p8, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 88
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;)V
    .registers 11
    .param p1, "params"    # Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;

    .prologue
    .line 104
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getOIDString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getN()I

    move-result v2

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getK()I

    move-result v3

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v4

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v5

    .line 105
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    move-result-object v6

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v7

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v8

    move-object v0, p0

    .line 104
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V

    .line 106
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PrivateKeyParameters;->getParameters()Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->mcElieceCCA2Params:Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    .line 107
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;)V
    .registers 11
    .param p1, "keySpec"    # Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;

    .prologue
    .line 97
    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getOIDString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getN()I

    move-result v2

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getK()I

    move-result v3

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v4

    .line 98
    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v5

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    move-result-object v6

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v7

    .line 99
    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;->getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v8

    move-object v0, p0

    .line 97
    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V

    .line 100
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 203
    if-eqz p1, :cond_7

    instance-of v2, p1, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    if-nez v2, :cond_8

    .line 213
    :cond_7
    :goto_7
    return v1

    :cond_8
    move-object v0, p1

    .line 208
    check-cast v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    .line 210
    .local v0, "otherKey":Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;
    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->n:I

    iget v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->n:I

    if-ne v2, v3, :cond_7

    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->k:I

    iget v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->k:I

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    iget-object v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    .line 211
    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 212
    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    iget-object v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget-object v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 213
    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method protected getAlgParams()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 247
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 116
    const-string v0, "McEliece"

    return-object v0
.end method

.method public getEncoded()[B
    .registers 14

    .prologue
    const/4 v11, 0x0

    .line 271
    new-instance v0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;

    new-instance v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->oid:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->n:I

    iget v3, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->k:I

    iget-object v4, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v6, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    iget-object v7, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget-object v8, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V

    .line 275
    .local v0, "privateKey":Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;
    :try_start_1b
    new-instance v9, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {p0}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    sget-object v2, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-direct {v9, v1, v2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 276
    .local v9, "algorithmIdentifier":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    new-instance v12, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    invoke-direct {v12, v9, v0}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_2b} :catch_30

    .line 285
    .local v12, "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :try_start_2b
    invoke-virtual {v12}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getEncoded()[B
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2e} :catch_35

    move-result-object v11

    .line 291
    .end local v9    # "algorithmIdentifier":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v12    # "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :goto_2f
    return-object v11

    .line 278
    :catch_30
    move-exception v10

    .line 280
    .local v10, "e":Ljava/io/IOException;
    invoke-virtual {v10}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2f

    .line 288
    .end local v10    # "e":Ljava/io/IOException;
    .restart local v9    # "algorithmIdentifier":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .restart local v12    # "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :catch_35
    move-exception v10

    .line 290
    .restart local v10    # "e":Ljava/io/IOException;
    invoke-virtual {v10}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2f
.end method

.method public getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    return-object v0
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 298
    const/4 v0, 0x0

    return-object v0
.end method

.method public getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->k:I

    return v0
.end method

.method public getMcElieceCCA2Parameters()Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->mcElieceCCA2Params:Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    return-object v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 124
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->n:I

    return v0
.end method

.method protected getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 3

    .prologue
    .line 238
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.4.1.8301.3.1.3.4.2"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getOIDString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->oid:Ljava/lang/String;

    return-object v0
.end method

.method public getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    return-object v0
.end method

.method public getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->qInv:[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    return-object v0
.end method

.method public getT()I
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getDegree()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 221
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->k:I

    iget v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->n:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->field:Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->p:Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->h:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 222
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 188
    const-string v0, ""

    .line 189
    .local v0, "result":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " extension degree of the field      : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dimension of the code              : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->k:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " irreducible Goppa polynomial       : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->goppaPoly:Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 192
    return-object v0
.end method
