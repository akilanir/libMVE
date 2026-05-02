.class public Lorg/spongycastle/asn1/cms/RecipientIdentifier;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "RecipientIdentifier.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private id:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 4
    .param p1, "id"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 38
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    invoke-direct {v0, v1, v1, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 39
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Primitive;)V
    .registers 2
    .param p1, "id"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 44
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V
    .registers 2
    .param p1, "id"    # Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 33
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/RecipientIdentifier;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 65
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;

    if-eqz v0, :cond_9

    .line 67
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;

    .line 82
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 70
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    if-eqz v0, :cond_16

    .line 72
    new-instance v0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/RecipientIdentifier;-><init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V

    move-object p0, v0

    goto :goto_8

    .line 75
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_23

    .line 77
    new-instance v0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/RecipientIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    move-object p0, v0

    goto :goto_8

    .line 80
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_23
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Primitive;

    if-eqz v0, :cond_30

    .line 82
    new-instance v0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Primitive;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/RecipientIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1Primitive;)V

    move-object p0, v0

    goto :goto_8

    .line 85
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal object in RecipientIdentifier: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 86
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getId()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 3

    .prologue
    .line 96
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_10

    .line 98
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    .line 101
    :goto_f
    return-object v0

    :cond_10
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-static {v0}, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    move-result-object v0

    goto :goto_f
.end method

.method public isTagged()Z
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
