.class public Lorg/spongycastle/asn1/crmf/EncryptedKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "EncryptedKey.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private encryptedValue:Lorg/spongycastle/asn1/crmf/EncryptedValue;

.field private envelopedData:Lorg/spongycastle/asn1/cms/EnvelopedData;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/cms/EnvelopedData;)V
    .registers 2
    .param p1, "envelopedData"    # Lorg/spongycastle/asn1/cms/EnvelopedData;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->envelopedData:Lorg/spongycastle/asn1/cms/EnvelopedData;

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/crmf/EncryptedValue;)V
    .registers 2
    .param p1, "encryptedValue"    # Lorg/spongycastle/asn1/crmf/EncryptedValue;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->encryptedValue:Lorg/spongycastle/asn1/crmf/EncryptedValue;

    .line 46
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/EncryptedKey;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 20
    instance-of v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;

    if-eqz v0, :cond_7

    .line 22
    check-cast p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;

    .line 34
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 24
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_19

    .line 26
    new-instance v0, Lorg/spongycastle/asn1/crmf/EncryptedKey;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "o":Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lorg/spongycastle/asn1/cms/EnvelopedData;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/EnvelopedData;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/crmf/EncryptedKey;-><init>(Lorg/spongycastle/asn1/cms/EnvelopedData;)V

    move-object p0, v0

    goto :goto_6

    .line 28
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_19
    instance-of v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedValue;

    if-eqz v0, :cond_26

    .line 30
    new-instance v0, Lorg/spongycastle/asn1/crmf/EncryptedKey;

    check-cast p0, Lorg/spongycastle/asn1/crmf/EncryptedValue;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/crmf/EncryptedKey;-><init>(Lorg/spongycastle/asn1/crmf/EncryptedValue;)V

    move-object p0, v0

    goto :goto_6

    .line 34
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_26
    new-instance v0, Lorg/spongycastle/asn1/crmf/EncryptedKey;

    invoke-static {p0}, Lorg/spongycastle/asn1/crmf/EncryptedValue;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/EncryptedValue;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/crmf/EncryptedKey;-><init>(Lorg/spongycastle/asn1/crmf/EncryptedValue;)V

    move-object p0, v0

    goto :goto_6
.end method


# virtual methods
.method public getValue()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->encryptedValue:Lorg/spongycastle/asn1/crmf/EncryptedValue;

    if-eqz v0, :cond_7

    .line 57
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->encryptedValue:Lorg/spongycastle/asn1/crmf/EncryptedValue;

    .line 60
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->envelopedData:Lorg/spongycastle/asn1/cms/EnvelopedData;

    goto :goto_6
.end method

.method public isEncryptedValue()Z
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->encryptedValue:Lorg/spongycastle/asn1/crmf/EncryptedValue;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 74
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->encryptedValue:Lorg/spongycastle/asn1/crmf/EncryptedValue;

    if-eqz v0, :cond_c

    .line 76
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->encryptedValue:Lorg/spongycastle/asn1/crmf/EncryptedValue;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/crmf/EncryptedValue;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 79
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v1, p0, Lorg/spongycastle/asn1/crmf/EncryptedKey;->envelopedData:Lorg/spongycastle/asn1/cms/EnvelopedData;

    invoke-direct {v0, v2, v2, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_b
.end method
