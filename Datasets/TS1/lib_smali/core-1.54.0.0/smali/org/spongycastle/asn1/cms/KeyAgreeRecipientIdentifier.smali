.class public Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "KeyAgreeRecipientIdentifier.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private issuerSerial:Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

.field private rKeyID:Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V
    .registers 3
    .param p1, "issuerSerial"    # Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .prologue
    .line 82
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 83
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->issuerSerial:Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->rKeyID:Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;

    .line 85
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;)V
    .registers 3
    .param p1, "rKeyID"    # Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 90
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->issuerSerial:Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    .line 91
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->rKeyID:Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;

    .line 92
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 61
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;

    if-eqz v0, :cond_9

    .line 63
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;

    .line 73
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 66
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_18

    .line 68
    new-instance v0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;

    invoke-static {p0}, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;-><init>(Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;)V

    move-object p0, v0

    goto :goto_8

    .line 71
    :cond_18
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_33

    move-object v0, p0

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    if-nez v0, :cond_33

    .line 73
    new-instance v0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;-><init>(Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;)V

    move-object p0, v0

    goto :goto_8

    .line 77
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid KeyAgreeRecipientIdentifier: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 40
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getIssuerAndSerialNumber()Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->issuerSerial:Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    return-object v0
.end method

.method public getRKeyID()Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->rKeyID:Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 109
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->issuerSerial:Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    if-eqz v0, :cond_c

    .line 111
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->issuerSerial:Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/cms/IssuerAndSerialNumber;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 114
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v1, p0, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientIdentifier;->rKeyID:Lorg/spongycastle/asn1/cms/RecipientKeyIdentifier;

    invoke-direct {v0, v2, v2, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_b
.end method
