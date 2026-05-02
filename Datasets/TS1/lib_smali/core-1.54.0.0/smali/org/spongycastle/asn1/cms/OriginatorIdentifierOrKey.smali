.class public Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "OriginatorIdentifierOrKey.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private id:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 4
    .param p1, "id"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    .line 44
    new-instance v0, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;-><init>([B)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;-><init>(Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Primitive;)V
    .registers 2
    .param p1, "id"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 66
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V
    .registers 2
    .param p1, "id"    # Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/OriginatorPublicKey;)V
    .registers 5
    .param p1, "id"    # Lorg/spongycastle/asn1/cms/OriginatorPublicKey;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 56
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 57
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;)V
    .registers 4
    .param p1, "id"    # Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 50
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    invoke-direct {v0, v1, v1, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 51
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;
    .registers 5
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 107
    if-eqz p0, :cond_7

    instance-of v1, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;

    if-eqz v1, :cond_a

    .line 109
    :cond_7
    check-cast p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;

    .line 127
    .end local p0    # "o":Ljava/lang/Object;
    .local v0, "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :goto_9
    return-object p0

    .line 112
    .end local v0    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_a
    instance-of v1, p0, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    if-nez v1, :cond_12

    instance-of v1, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_1d

    .line 114
    :cond_12
    new-instance v1, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;

    invoke-static {p0}, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;-><init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V

    move-object p0, v1

    goto :goto_9

    .line 117
    :cond_1d
    instance-of v1, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v1, :cond_45

    move-object v0, p0

    .line 119
    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 121
    .restart local v0    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v1

    if-nez v1, :cond_34

    .line 123
    new-instance p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-static {v0, v3}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;-><init>(Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;)V

    goto :goto_9

    .line 125
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_34
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_45

    .line 127
    new-instance p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-static {v0, v3}, Lorg/spongycastle/asn1/cms/OriginatorPublicKey;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/OriginatorPublicKey;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;-><init>(Lorg/spongycastle/asn1/cms/OriginatorPublicKey;)V

    goto :goto_9

    .line 131
    .end local v0    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_45
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid OriginatorIdentifierOrKey: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;
    .registers 4
    .param p0, "o"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 81
    if-nez p1, :cond_a

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t implicitly tag OriginatorIdentifierOrKey"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_a
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getId()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public getIssuerAndSerialNumber()Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    if-eqz v0, :cond_b

    .line 143
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .line 146
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getOriginatorKey()Lorg/spongycastle/asn1/cms/OriginatorPublicKey;
    .registers 3

    .prologue
    .line 161
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 163
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/asn1/cms/OriginatorPublicKey;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/OriginatorPublicKey;

    move-result-object v0

    .line 166
    :goto_1a
    return-object v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public getSubjectKeyIdentifier()Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;
    .registers 3

    .prologue
    .line 151
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    if-nez v0, :cond_1a

    .line 153
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/SubjectKeyIdentifier;

    move-result-object v0

    .line 156
    :goto_19
    return-object v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/OriginatorIdentifierOrKey;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
