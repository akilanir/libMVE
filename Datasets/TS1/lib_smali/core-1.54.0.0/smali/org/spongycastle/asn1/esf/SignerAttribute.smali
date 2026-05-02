.class public Lorg/spongycastle/asn1/esf/SignerAttribute;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SignerAttribute.java"


# instance fields
.field private values:[Ljava/lang/Object;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 11
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v8, 0x1

    .line 38
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 39
    const/4 v4, 0x0

    .line 40
    .local v4, "index":I
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/Object;

    iput-object v6, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    .line 42
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "e":Ljava/util/Enumeration;
    :goto_11
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_77

    .line 44
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v5

    .line 46
    .local v5, "taggedObject":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v6

    if-nez v6, :cond_47

    .line 48
    invoke-static {v5, v8}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    .line 49
    .local v1, "attrs":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v6

    new-array v0, v6, [Lorg/spongycastle/asn1/x509/Attribute;

    .line 51
    .local v0, "attributes":[Lorg/spongycastle/asn1/x509/Attribute;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_30
    array-length v6, v0

    if-eq v3, v6, :cond_40

    .line 53
    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x509/Attribute;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Attribute;

    move-result-object v6

    aput-object v6, v0, v3

    .line 51
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 55
    :cond_40
    iget-object v6, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    aput-object v0, v6, v4

    .line 65
    .end local v0    # "attributes":[Lorg/spongycastle/asn1/x509/Attribute;
    .end local v1    # "attrs":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v3    # "i":I
    :goto_44
    add-int/lit8 v4, v4, 0x1

    .line 66
    goto :goto_11

    .line 57
    :cond_47
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v6

    if-ne v6, v8, :cond_5a

    .line 59
    iget-object v6, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    invoke-static {v5, v8}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x509/AttributeCertificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AttributeCertificate;

    move-result-object v7

    aput-object v7, v6, v4

    goto :goto_44

    .line 63
    :cond_5a
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "illegal tag: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 67
    .end local v5    # "taggedObject":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_77
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/AttributeCertificate;)V
    .registers 4
    .param p1, "certifiedAttributes"    # Lorg/spongycastle/asn1/x509/AttributeCertificate;

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 79
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    .line 80
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 81
    return-void
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/x509/Attribute;)V
    .registers 4
    .param p1, "claimedAttributes"    # [Lorg/spongycastle/asn1/x509/Attribute;

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 72
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    .line 73
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 74
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/SignerAttribute;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 24
    instance-of v0, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;

    if-eqz v0, :cond_7

    .line 26
    check-cast p0, Lorg/spongycastle/asn1/esf/SignerAttribute;

    .line 33
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 28
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 30
    new-instance v0, Lorg/spongycastle/asn1/esf/SignerAttribute;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/esf/SignerAttribute;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 33
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getValues()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 7

    .prologue
    .line 107
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 109
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    array-length v2, v2

    if-eq v0, v2, :cond_3c

    .line 111
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    aget-object v2, v2, v0

    instance-of v2, v2, [Lorg/spongycastle/asn1/x509/Attribute;

    if-eqz v2, :cond_2c

    .line 113
    new-instance v3, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v4, 0x0

    new-instance v5, Lorg/spongycastle/asn1/DERSequence;

    iget-object v2, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    aget-object v2, v2, v0

    check-cast v2, [Lorg/spongycastle/asn1/x509/Attribute;

    check-cast v2, [Lorg/spongycastle/asn1/x509/Attribute;

    invoke-direct {v5, v2}, Lorg/spongycastle/asn1/DERSequence;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 109
    :goto_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 117
    :cond_2c
    new-instance v3, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v4, 0x1

    iget-object v2, p0, Lorg/spongycastle/asn1/esf/SignerAttribute;->values:[Ljava/lang/Object;

    aget-object v2, v2, v0

    check-cast v2, Lorg/spongycastle/asn1/x509/AttributeCertificate;

    invoke-direct {v3, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_29

    .line 121
    :cond_3c
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v2
.end method
