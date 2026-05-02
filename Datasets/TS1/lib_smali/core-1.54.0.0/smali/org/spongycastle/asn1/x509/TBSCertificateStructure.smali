.class public Lorg/spongycastle/asn1/x509/TBSCertificateStructure;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "TBSCertificateStructure.java"

# interfaces
.implements Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;
.implements Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;


# instance fields
.field endDate:Lorg/spongycastle/asn1/x509/Time;

.field extensions:Lorg/spongycastle/asn1/x509/X509Extensions;

.field issuer:Lorg/spongycastle/asn1/x500/X500Name;

.field issuerUniqueId:Lorg/spongycastle/asn1/DERBitString;

.field seq:Lorg/spongycastle/asn1/ASN1Sequence;

.field serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

.field signature:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field startDate:Lorg/spongycastle/asn1/x509/Time;

.field subject:Lorg/spongycastle/asn1/x500/X500Name;

.field subjectPublicKeyInfo:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

.field subjectUniqueId:Lorg/spongycastle/asn1/DERBitString;

.field version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 11
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 74
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 75
    const/4 v3, 0x0

    .line 77
    .local v3, "seqStart":I
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 82
    invoke-virtual {p1, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    instance-of v4, v4, Lorg/spongycastle/asn1/DERTaggedObject;

    if-eqz v4, :cond_92

    .line 84
    invoke-virtual {p1, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-static {v4, v8}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 92
    :goto_1c
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 94
    add-int/lit8 v4, v3, 0x2

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->signature:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 95
    add-int/lit8 v4, v3, 0x3

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    .line 100
    add-int/lit8 v4, v3, 0x4

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 102
    .local v0, "dates":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v0, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x509/Time;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Time;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->startDate:Lorg/spongycastle/asn1/x509/Time;

    .line 103
    invoke-virtual {v0, v8}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x509/Time;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Time;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->endDate:Lorg/spongycastle/asn1/x509/Time;

    .line 105
    add-int/lit8 v4, v3, 0x5

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    .line 110
    add-int/lit8 v4, v3, 0x6

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->subjectPublicKeyInfo:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .line 112
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    add-int/lit8 v5, v3, 0x6

    sub-int/2addr v4, v5

    add-int/lit8 v2, v4, -0x1

    .local v2, "extras":I
    :goto_7d
    if-lez v2, :cond_b2

    .line 114
    add-int/lit8 v4, v3, 0x6

    add-int/2addr v4, v2

    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 116
    .local v1, "extra":Lorg/spongycastle/asn1/DERTaggedObject;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v4

    packed-switch v4, :pswitch_data_b4

    .line 112
    :goto_8f
    add-int/lit8 v2, v2, -0x1

    goto :goto_7d

    .line 88
    .end local v0    # "dates":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v1    # "extra":Lorg/spongycastle/asn1/DERTaggedObject;
    .end local v2    # "extras":I
    :cond_92
    const/4 v3, -0x1

    .line 89
    new-instance v4, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v5, 0x0

    invoke-direct {v4, v5, v6}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->version:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_1c

    .line 119
    .restart local v0    # "dates":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v1    # "extra":Lorg/spongycastle/asn1/DERTaggedObject;
    .restart local v2    # "extras":I
    :pswitch_9d
    invoke-static {v1, v7}, Lorg/spongycastle/asn1/DERBitString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/DERBitString;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->issuerUniqueId:Lorg/spongycastle/asn1/DERBitString;

    goto :goto_8f

    .line 122
    :pswitch_a4
    invoke-static {v1, v7}, Lorg/spongycastle/asn1/DERBitString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/DERBitString;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->subjectUniqueId:Lorg/spongycastle/asn1/DERBitString;

    goto :goto_8f

    .line 125
    :pswitch_ab
    invoke-static {v1}, Lorg/spongycastle/asn1/x509/X509Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/X509Extensions;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->extensions:Lorg/spongycastle/asn1/x509/X509Extensions;

    goto :goto_8f

    .line 128
    .end local v1    # "extra":Lorg/spongycastle/asn1/DERTaggedObject;
    :cond_b2
    return-void

    .line 116
    nop

    :pswitch_data_b4
    .packed-switch 0x1
        :pswitch_9d
        :pswitch_a4
        :pswitch_ab
    .end packed-switch
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/TBSCertificateStructure;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 60
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;

    if-eqz v0, :cond_7

    .line 62
    check-cast p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;

    .line 69
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 64
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 66
    new-instance v0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 69
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/TBSCertificateStructure;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 54
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/TBSCertificateStructure;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getEndDate()Lorg/spongycastle/asn1/x509/Time;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->endDate:Lorg/spongycastle/asn1/x509/Time;

    return-object v0
.end method

.method public getExtensions()Lorg/spongycastle/asn1/x509/X509Extensions;
    .registers 2

    .prologue
    .line 187
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->extensions:Lorg/spongycastle/asn1/x509/X509Extensions;

    return-object v0
.end method

.method public getIssuer()Lorg/spongycastle/asn1/x500/X500Name;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->issuer:Lorg/spongycastle/asn1/x500/X500Name;

    return-object v0
.end method

.method public getIssuerUniqueId()Lorg/spongycastle/asn1/DERBitString;
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->issuerUniqueId:Lorg/spongycastle/asn1/DERBitString;

    return-object v0
.end method

.method public getSerialNumber()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public getSignature()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->signature:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    return-object v0
.end method

.method public getStartDate()Lorg/spongycastle/asn1/x509/Time;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->startDate:Lorg/spongycastle/asn1/x509/Time;

    return-object v0
.end method

.method public getSubject()Lorg/spongycastle/asn1/x500/X500Name;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->subject:Lorg/spongycastle/asn1/x500/X500Name;

    return-object v0
.end method

.method public getSubjectPublicKeyInfo()Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->subjectPublicKeyInfo:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    return-object v0
.end method

.method public getSubjectUniqueId()Lorg/spongycastle/asn1/DERBitString;
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->subjectUniqueId:Lorg/spongycastle/asn1/DERBitString;

    return-object v0
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->version:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getVersionNumber()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->version:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/TBSCertificateStructure;->seq:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method
