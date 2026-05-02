.class public Lorg/spongycastle/asn1/x509/PolicyInformation;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "PolicyInformation.java"


# instance fields
.field private policyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .registers 2
    .param p1, "policyIdentifier"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 37
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "policyIdentifier"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "policyQualifiers"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 44
    iput-object p2, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 45
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 5
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v2, 0x1

    .line 18
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 19
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-lt v0, v2, :cond_11

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_2e

    .line 21
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad sequence size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 22
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_2e
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 27
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-le v0, v2, :cond_49

    .line 29
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 31
    :cond_49
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 50
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;

    if-eqz v0, :cond_9

    .line 52
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/x509/PolicyInformation;

    .line 55
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    new-instance v0, Lorg/spongycastle/asn1/x509/PolicyInformation;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/PolicyInformation;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8
.end method


# virtual methods
.method public getPolicyIdentifier()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getPolicyQualifiers()Lorg/spongycastle/asn1/ASN1Sequence;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 78
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 80
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 82
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_13

    .line 84
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 87
    :cond_13
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 92
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 94
    .local v2, "sb":Ljava/lang/StringBuffer;
    const-string v3, "Policy information: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 97
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v3, :cond_49

    .line 99
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 100
    .local v1, "p":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v3

    if-ge v0, v3, :cond_3c

    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-eqz v3, :cond_2c

    .line 104
    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 106
    :cond_2c
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PolicyInformation;->policyQualifiers:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v3, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/x509/PolicyQualifierInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyQualifierInfo;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 109
    :cond_3c
    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 110
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 111
    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    .end local v0    # "i":I
    .end local v1    # "p":Ljava/lang/StringBuffer;
    :cond_49
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
