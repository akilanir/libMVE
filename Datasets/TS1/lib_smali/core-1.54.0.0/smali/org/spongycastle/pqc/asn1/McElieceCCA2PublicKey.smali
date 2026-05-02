.class public Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "McElieceCCA2PublicKey.java"


# instance fields
.field private matrixG:[B

.field private n:I

.field private oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private t:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V
    .registers 6
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "n"    # I
    .param p3, "t"    # I
    .param p4, "g"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 28
    iput p2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->n:I

    .line 29
    iput p3, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->t:I

    .line 30
    invoke-virtual {p4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getEncoded()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->matrixG:[B

    .line 31
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 5
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 35
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iput-object v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 36
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    .line 37
    .local v0, "bigN":Ljava/math/BigInteger;
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->n:I

    .line 39
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v1

    .line 40
    .local v1, "bigT":Ljava/math/BigInteger;
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->t:I

    .line 42
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->matrixG:[B

    .line 43
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 85
    instance-of v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;

    if-eqz v0, :cond_7

    .line 87
    check-cast p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;

    .line 94
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 89
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 91
    new-instance v0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 94
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 3

    .prologue
    .line 62
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->matrixG:[B

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>([B)V

    return-object v0
.end method

.method public getN()I
    .registers 2

    .prologue
    .line 52
    iget v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->n:I

    return v0
.end method

.method public getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getT()I
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->t:I

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 67
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 69
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->oid:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 72
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    iget v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->n:I

    int-to-long v2, v2

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 75
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    iget v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->t:I

    int-to-long v2, v2

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 78
    new-instance v1, Lorg/spongycastle/asn1/DEROctetString;

    iget-object v2, p0, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->matrixG:[B

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 80
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
