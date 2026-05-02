.class public Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;
.super Ljava/lang/Object;
.source "BCMcElieceCCA2PublicKey.java"

# interfaces
.implements Lorg/spongycastle/crypto/CipherParameters;
.implements Ljava/security/PublicKey;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private McElieceCCA2Params:Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

.field private g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

.field private n:I

.field private oid:Ljava/lang/String;

.field private t:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V
    .registers 5
    .param p1, "oid"    # Ljava/lang/String;
    .param p2, "n"    # I
    .param p3, "t"    # I
    .param p4, "g"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->oid:Ljava/lang/String;

    .line 57
    iput p2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->n:I

    .line 58
    iput p3, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->t:I

    .line 59
    iput-object p4, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 60
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters;)V
    .registers 6
    .param p1, "params"    # Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters;

    .prologue
    .line 74
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters;->getOIDString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters;->getN()I

    move-result v1

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters;->getT()I

    move-result v2

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters;->getMatrixG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V

    .line 75
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters;->getParameters()Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->McElieceCCA2Params:Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    .line 76
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;)V
    .registers 6
    .param p1, "keySpec"    # Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;

    .prologue
    .line 69
    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;->getOIDString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;->getN()I

    move-result v1

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;->getT()I

    move-result v2

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;->getMatrixG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V

    .line 70
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 140
    if-eqz p1, :cond_7

    instance-of v2, p1, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    if-nez v2, :cond_8

    .line 147
    :cond_7
    :goto_7
    return v1

    :cond_8
    move-object v0, p1

    .line 145
    check-cast v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    .line 147
    .local v0, "otherKey":Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;
    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->n:I

    iget v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->n:I

    if-ne v2, v3, :cond_7

    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->t:I

    iget v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->t:I

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget-object v3, v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method protected getAlgParams()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 180
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 85
    const-string v0, "McEliece"

    return-object v0
.end method

.method public getEncoded()[B
    .registers 9

    .prologue
    .line 199
    new-instance v2, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;

    new-instance v4, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->oid:Ljava/lang/String;

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->n:I

    iget v6, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->t:I

    iget-object v7, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-direct {v2, v4, v5, v6, v7}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V

    .line 200
    .local v2, "key":Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;
    new-instance v0, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {p0}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    sget-object v5, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-direct {v0, v4, v5}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 204
    .local v0, "algorithmIdentifier":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :try_start_1d
    new-instance v3, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    invoke-direct {v3, v0, v2}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 206
    .local v3, "subjectPublicKeyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getEncoded()[B
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_25} :catch_27

    move-result-object v4

    .line 210
    .end local v3    # "subjectPublicKeyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :goto_26
    return-object v4

    .line 208
    :catch_27
    move-exception v1

    .line 210
    .local v1, "e":Ljava/io/IOException;
    const/4 v4, 0x0

    goto :goto_26
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 218
    const/4 v0, 0x0

    return-object v0
.end method

.method public getG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getNumRows()I

    move-result v0

    return v0
.end method

.method public getMcElieceCCA2Parameters()Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->McElieceCCA2Params:Lorg/spongycastle/pqc/crypto/mceliece/McElieceCCA2Parameters;

    return-object v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 93
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->n:I

    return v0
.end method

.method protected getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 3

    .prologue
    .line 171
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.4.1.8301.3.1.3.4.2"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getOIDString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->oid:Ljava/lang/String;

    return-object v0
.end method

.method public getT()I
    .registers 2

    .prologue
    .line 109
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->t:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 155
    iget v0, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->n:I

    iget v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->t:I

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 125
    const-string v0, "McEliecePublicKey:\n"

    .line 126
    .local v0, "result":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " length of the code         : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->n:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " error correction capability: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->t:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " generator matrix           : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->g:Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 129
    return-object v0
.end method
