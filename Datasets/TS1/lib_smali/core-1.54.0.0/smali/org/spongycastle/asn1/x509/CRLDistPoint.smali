.class public Lorg/spongycastle/asn1/x509/CRLDistPoint;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "CRLDistPoint.java"


# instance fields
.field seq:Lorg/spongycastle/asn1/ASN1Sequence;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 41
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 42
    return-void
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/x509/DistributionPoint;)V
    .registers 5
    .param p1, "points"    # [Lorg/spongycastle/asn1/x509/DistributionPoint;

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 14
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 47
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 49
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    array-length v2, p1

    if-eq v0, v2, :cond_17

    .line 51
    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 49
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 54
    :cond_17
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 55
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;

    if-eqz v0, :cond_7

    .line 28
    check-cast p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;

    .line 35
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 30
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 32
    new-instance v0, Lorg/spongycastle/asn1/x509/CRLDistPoint;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/CRLDistPoint;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 35
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/CRLDistPoint;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 20
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CRLDistPoint;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDistributionPoints()[Lorg/spongycastle/asn1/x509/DistributionPoint;
    .registers 4

    .prologue
    .line 64
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v0, v2, [Lorg/spongycastle/asn1/x509/DistributionPoint;

    .line 66
    .local v0, "dp":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eq v1, v2, :cond_20

    .line 68
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/DistributionPoint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DistributionPoint;

    move-result-object v2

    aput-object v2, v0, v1

    .line 66
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 71
    :cond_20
    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/CRLDistPoint;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 87
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 88
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v3

    .line 90
    .local v3, "sep":Ljava/lang/String;
    const-string v4, "CRLDistPoint:"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/CRLDistPoint;->getDistributionPoints()[Lorg/spongycastle/asn1/x509/DistributionPoint;

    move-result-object v1

    .line 93
    .local v1, "dp":[Lorg/spongycastle/asn1/x509/DistributionPoint;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    array-length v4, v1

    if-eq v2, v4, :cond_29

    .line 95
    const-string v4, "    "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 96
    aget-object v4, v1, v2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 97
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 93
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 99
    :cond_29
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
