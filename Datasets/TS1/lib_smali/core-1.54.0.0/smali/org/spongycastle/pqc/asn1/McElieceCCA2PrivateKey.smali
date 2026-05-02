.class public Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "McElieceCCA2PrivateKey.java"


# instance fields
.field private encField:[B

.field private encGp:[B

.field private encH:[B

.field private encP:[B

.field private encqInv:[[B

.field private k:I

.field private n:I

.field private oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V
    .registers 12
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "n"    # I
    .param p3, "k"    # I
    .param p4, "field"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .param p5, "goppaPoly"    # Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .param p6, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .param p7, "h"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .param p8, "qInv"    # [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 36
    iput p2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->n:I

    .line 37
    iput p3, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->k:I

    .line 38
    invoke-virtual {p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encField:[B

    .line 39
    invoke-virtual {p5}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encGp:[B

    .line 40
    invoke-virtual {p6}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encP:[B

    .line 41
    invoke-virtual {p7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encH:[B

    .line 42
    array-length v1, p8

    new-array v1, v1, [[B

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    .line 44
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_27
    array-length v1, p8

    if-eq v0, v1, :cond_37

    .line 46
    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    aget-object v2, p8, v0

    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getEncoded()[B

    move-result-object v2

    aput-object v2, v1, v0

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 48
    :cond_37
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 8
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 54
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    .line 55
    .local v2, "bigN":Ljava/math/BigInteger;
    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    iput v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->n:I

    .line 57
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v1

    .line 58
    .local v1, "bigK":Ljava/math/BigInteger;
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    iput v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->k:I

    .line 60
    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encField:[B

    .line 62
    const/4 v4, 0x4

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encGp:[B

    .line 64
    const/4 v4, 0x5

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encP:[B

    .line 66
    const/4 v4, 0x6

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encH:[B

    .line 68
    const/4 v4, 0x7

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 69
    .local v0, "asnQInv":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    new-array v4, v4, [[B

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    .line 70
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_72
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    if-ge v3, v4, :cond_89

    .line 72
    iget-object v5, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    aput-object v4, v5, v3

    .line 70
    add-int/lit8 v3, v3, 0x1

    goto :goto_72

    .line 74
    :cond_89
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 162
    instance-of v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;

    if-eqz v0, :cond_7

    .line 164
    check-cast p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;

    .line 171
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 166
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 168
    new-instance v0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 171
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .registers 3

    .prologue
    .line 93
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encField:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;-><init>([B)V

    return-object v0
.end method

.method public getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 4

    .prologue
    .line 98
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {p0}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encGp:[B

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    return-object v0
.end method

.method public getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 3

    .prologue
    .line 108
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encH:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->k:I

    return v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->n:I

    return v0
.end method

.method public getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 3

    .prologue
    .line 103
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encP:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>([B)V

    return-object v0
.end method

.method public getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 6

    .prologue
    .line 113
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    array-length v3, v3

    new-array v2, v3, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 114
    .local v2, "qInv":[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    invoke-virtual {p0}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v0

    .line 116
    .local v0, "field":Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    array-length v3, v3

    if-ge v1, v3, :cond_1d

    .line 118
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    aget-object v4, v4, v1

    invoke-direct {v3, v0, v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    aput-object v3, v2, v1

    .line 116
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 121
    :cond_1d
    return-object v2
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 7

    .prologue
    .line 127
    new-instance v2, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 129
    .local v2, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 131
    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    iget v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->n:I

    int-to-long v4, v4

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 134
    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    iget v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->k:I

    int-to-long v4, v4

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 137
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encField:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 140
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encGp:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 143
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encP:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 146
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encH:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 149
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 150
    .local v0, "asnQInv":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4e
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    array-length v3, v3

    if-ge v1, v3, :cond_62

    .line 152
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->encqInv:[[B

    aget-object v4, v4, v1

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 150
    add-int/lit8 v1, v1, 0x1

    goto :goto_4e

    .line 155
    :cond_62
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 157
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v2}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v3
.end method
