.class public Lorg/spongycastle/asn1/smime/SMIMECapabilities;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SMIMECapabilities.java"


# static fields
.field public static final aes128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final aes192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final aes256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final canNotDecryptAny:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cast5_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dES_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dES_EDE3_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final idea_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final preferSignedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final rC2_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final sMIMECapabilitesVersions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# instance fields
.field private capabilities:Lorg/spongycastle/asn1/ASN1Sequence;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 23
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->preferSignedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->preferSignedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 24
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->canNotDecryptAny:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->canNotDecryptAny:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 25
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->sMIMECapabilitiesVersions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->sMIMECapabilitesVersions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 30
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->aes256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 31
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->aes192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 32
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->aes128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.4.1.188.7.1.1.2"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->idea_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 34
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.2.840.113533.7.66.10"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->cast5_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 35
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.14.3.2.7"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->dES_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 36
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->des_EDE3_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->dES_EDE3_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 37
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->RC2_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->rC2_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 2
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 72
    iput-object p1, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->capabilities:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 73
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/smime/SMIMECapabilities;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 50
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;

    if-eqz v0, :cond_9

    .line 52
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;

    .line 63
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 55
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_16

    .line 57
    new-instance v0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/smime/SMIMECapabilities;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8

    .line 60
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    instance-of v0, p0, Lorg/spongycastle/asn1/cms/Attribute;

    if-eqz v0, :cond_30

    .line 62
    new-instance v1, Lorg/spongycastle/asn1/smime/SMIMECapabilities;

    check-cast p0, Lorg/spongycastle/asn1/cms/Attribute;

    .line 63
    .end local p0    # "o":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/cms/Attribute;->getAttrValues()Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/smime/SMIMECapabilities;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v1

    goto :goto_8

    .line 66
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object in factory: "

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


# virtual methods
.method public getCapabilities(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/util/Vector;
    .registers 6
    .param p1, "capability"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 83
    iget-object v3, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->capabilities:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 84
    .local v1, "e":Ljava/util/Enumeration;
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 86
    .local v2, "list":Ljava/util/Vector;
    if-nez p1, :cond_1f

    .line 88
    :goto_d
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 90
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/smime/SMIMECapability;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/smime/SMIMECapability;

    move-result-object v0

    .line 92
    .local v0, "cap":Lorg/spongycastle/asn1/smime/SMIMECapability;
    invoke-virtual {v2, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_d

    .line 97
    .end local v0    # "cap":Lorg/spongycastle/asn1/smime/SMIMECapability;
    :cond_1f
    :goto_1f
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 99
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/smime/SMIMECapability;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/smime/SMIMECapability;

    move-result-object v0

    .line 101
    .restart local v0    # "cap":Lorg/spongycastle/asn1/smime/SMIMECapability;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/smime/SMIMECapability;->getCapabilityID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 103
    invoke-virtual {v2, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1f

    .line 108
    .end local v0    # "cap":Lorg/spongycastle/asn1/smime/SMIMECapability;
    :cond_3b
    return-object v2
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilities;->capabilities:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method
