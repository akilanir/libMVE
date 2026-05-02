.class public Lorg/spongycastle/asn1/ess/SigningCertificateV2;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SigningCertificateV2.java"


# instance fields
.field certs:Lorg/spongycastle/asn1/ASN1Sequence;

.field policies:Lorg/spongycastle/asn1/ASN1Sequence;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 5
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v2, 0x1

    .line 33
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 34
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-lt v0, v2, :cond_11

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_2e

    .line 36
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad sequence size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_2e
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 41
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-le v0, v2, :cond_49

    .line 43
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 45
    :cond_49
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ess/ESSCertIDv2;)V
    .registers 3
    .param p1, "cert"    # Lorg/spongycastle/asn1/ess/ESSCertIDv2;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 50
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 51
    return-void
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/ess/ESSCertIDv2;)V
    .registers 5
    .param p1, "certs"    # [Lorg/spongycastle/asn1/ess/ESSCertIDv2;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 56
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 57
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v2, p1

    if-ge v0, v2, :cond_14

    .line 59
    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 61
    :cond_14
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    iput-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 62
    return-void
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/ess/ESSCertIDv2;[Lorg/spongycastle/asn1/x509/PolicyInformation;)V
    .registers 6
    .param p1, "certs"    # [Lorg/spongycastle/asn1/ess/ESSCertIDv2;
    .param p2, "policies"    # [Lorg/spongycastle/asn1/x509/PolicyInformation;

    .prologue
    .line 67
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 68
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 69
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v2, p1

    if-ge v0, v2, :cond_14

    .line 71
    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 73
    :cond_14
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    iput-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 75
    if-eqz p2, :cond_35

    .line 77
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .end local v1    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 78
    .restart local v1    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v0, 0x0

    :goto_23
    array-length v2, p2

    if-ge v0, v2, :cond_2e

    .line 80
    aget-object v2, p2, v0

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 82
    :cond_2e
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    iput-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 84
    :cond_35
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ess/SigningCertificateV2;
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 19
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;

    if-eqz v0, :cond_9

    .line 21
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;

    .line 28
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 23
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_16

    .line 25
    new-instance v0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ess/SigningCertificateV2;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8

    .line 28
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    const/4 p0, 0x0

    goto :goto_8
.end method


# virtual methods
.method public getCerts()[Lorg/spongycastle/asn1/ess/ESSCertIDv2;
    .registers 4

    .prologue
    .line 88
    iget-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v0, v2, [Lorg/spongycastle/asn1/ess/ESSCertIDv2;

    .line 89
    .local v0, "certIds":[Lorg/spongycastle/asn1/ess/ESSCertIDv2;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    iget-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eq v1, v2, :cond_20

    .line 91
    iget-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ess/ESSCertIDv2;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ess/ESSCertIDv2;

    move-result-object v2

    aput-object v2, v0, v1

    .line 89
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 93
    :cond_20
    return-object v0
.end method

.method public getPolicies()[Lorg/spongycastle/asn1/x509/PolicyInformation;
    .registers 4

    .prologue
    .line 98
    iget-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v2, :cond_6

    .line 100
    const/4 v1, 0x0

    .line 108
    :cond_5
    return-object v1

    .line 103
    :cond_6
    iget-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/x509/PolicyInformation;

    .line 104
    .local v1, "policyInformations":[Lorg/spongycastle/asn1/x509/PolicyInformation;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eq v0, v2, :cond_5

    .line 106
    iget-object v2, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;

    move-result-object v2

    aput-object v2, v1, v0

    .line 104
    add-int/lit8 v0, v0, 0x1

    goto :goto_f
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 125
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 127
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 129
    iget-object v1, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_13

    .line 131
    iget-object v1, p0, Lorg/spongycastle/asn1/ess/SigningCertificateV2;->policies:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 134
    :cond_13
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
