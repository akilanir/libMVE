.class public Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "McEliecePrivateKey.java"


# instance fields
.field private encField:[B

.field private encGp:[B

.field private encH:[B

.field private encP1:[B

.field private encP2:[B

.field private encSInv:[B

.field private encqInv:[[B

.field private k:I

.field private n:I

.field private oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V
    .registers 14
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
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
    .line 35
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 37
    iput p2, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->n:I

    .line 38
    iput p3, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->k:I

    .line 39
    invoke-virtual {p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encField:[B

    .line 40
    invoke-virtual {p5}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encGp:[B

    .line 41
    invoke-virtual {p6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encSInv:[B

    .line 42
    invoke-virtual {p7}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP1:[B

    .line 43
    invoke-virtual {p8}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP2:[B

    .line 44
    invoke-virtual {p9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getEncoded()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encH:[B

    .line 45
    array-length v1, p10

    new-array v1, v1, [[B

    iput-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    .line 47
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_33
    array-length v1, p10

    if-eq v0, v1, :cond_43

    .line 49
    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    aget-object v2, p10, v0

    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;->getEncoded()[B

    move-result-object v2

    aput-object v2, v1, v0

    .line 47
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    .line 51
    :cond_43
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 8
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 70
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 72
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    .line 73
    .local v2, "bigN":Ljava/math/BigInteger;
    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    iput v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->n:I

    .line 75
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v1

    .line 76
    .local v1, "bigK":Ljava/math/BigInteger;
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    iput v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->k:I

    .line 78
    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encField:[B

    .line 80
    const/4 v4, 0x4

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encGp:[B

    .line 82
    const/4 v4, 0x5

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encSInv:[B

    .line 84
    const/4 v4, 0x6

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP1:[B

    .line 86
    const/4 v4, 0x7

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP2:[B

    .line 88
    const/16 v4, 0x8

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encH:[B

    .line 90
    const/16 v4, 0x9

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 91
    .local v0, "asnQInv":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    new-array v4, v4, [[B

    iput-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    .line 92
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8e
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    if-ge v3, v4, :cond_a5

    .line 94
    iget-object v5, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v4

    aput-object v4, v5, v3

    .line 92
    add-int/lit8 v3, v3, 0x1

    goto :goto_8e

    .line 96
    :cond_a5
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 55
    instance-of v0, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;

    if-eqz v0, :cond_7

    .line 57
    check-cast p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;

    .line 64
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 59
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 61
    new-instance v0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 64
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    .registers 3

    .prologue
    .line 115
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encField:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;-><init>([B)V

    return-object v0
.end method

.method public getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 4

    .prologue
    .line 120
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    invoke-virtual {p0}, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encGp:[B

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    return-object v0
.end method

.method public getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 3

    .prologue
    .line 140
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encH:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    return-object v0
.end method

.method public getK()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->k:I

    return v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 105
    iget v0, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->n:I

    return v0
.end method

.method public getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getP1()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 3

    .prologue
    .line 130
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP1:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>([B)V

    return-object v0
.end method

.method public getP2()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    .registers 3

    .prologue
    .line 135
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP2:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>([B)V

    return-object v0
.end method

.method public getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    .registers 6

    .prologue
    .line 145
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    array-length v3, v3

    new-array v2, v3, [Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    .line 146
    .local v2, "qInv":[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;
    invoke-virtual {p0}, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v0

    .line 148
    .local v0, "field":Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    array-length v3, v3

    if-ge v1, v3, :cond_1d

    .line 150
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    aget-object v4, v4, v1

    invoke-direct {v3, v0, v4}, Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[B)V

    aput-object v3, v2, v1

    .line 148
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 153
    :cond_1d
    return-object v2
.end method

.method public getSInv()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 3

    .prologue
    .line 125
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encSInv:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 7

    .prologue
    .line 159
    new-instance v2, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 161
    .local v2, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 163
    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    iget v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->n:I

    int-to-long v4, v4

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 166
    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    iget v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->k:I

    int-to-long v4, v4

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 169
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encField:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 172
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encGp:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 175
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encSInv:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 178
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP1:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 181
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encP2:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 184
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encH:[B

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 187
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 188
    .local v0, "asnQInv":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_62
    iget-object v3, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    array-length v3, v3

    if-ge v1, v3, :cond_76

    .line 190
    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/McEliecePrivateKey;->encqInv:[[B

    aget-object v4, v4, v1

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 188
    add-int/lit8 v1, v1, 0x1

    goto :goto_62

    .line 193
    :cond_76
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 195
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v2}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v3
.end method
