.class public Lorg/spongycastle/asn1/cms/SignerIdentifier;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SignerIdentifier.java"

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

    .line 40
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 41
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    invoke-direct {v0, v1, v1, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 42
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Primitive;)V
    .registers 2
    .param p1, "id"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 47
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 48
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V
    .registers 2
    .param p1, "id"    # Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 36
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/SignerIdentifier;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 68
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;

    if-eqz v0, :cond_9

    .line 70
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;

    .line 85
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 73
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    if-eqz v0, :cond_16

    .line 75
    new-instance v0, Lorg/spongycastle/asn1/cms/SignerIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/SignerIdentifier;-><init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V

    move-object p0, v0

    goto :goto_8

    .line 78
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_23

    .line 80
    new-instance v0, Lorg/spongycastle/asn1/cms/SignerIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/SignerIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    move-object p0, v0

    goto :goto_8

    .line 83
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_23
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Primitive;

    if-eqz v0, :cond_30

    .line 85
    new-instance v0, Lorg/spongycastle/asn1/cms/SignerIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Primitive;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/SignerIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1Primitive;)V

    move-object p0, v0

    goto :goto_8

    .line 88
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal object in SignerIdentifier: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 89
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
    .line 99
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_10

    .line 101
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    .line 104
    :goto_f
    return-object v0

    :cond_10
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_f
.end method

.method public isTagged()Z
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignerIdentifier;->id:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
