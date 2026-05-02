.class public Lorg/spongycastle/asn1/smime/SMIMECapability;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SMIMECapability.java"


# static fields
.field public static final aES128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final aES192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final aES256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final canNotDecryptAny:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dES_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dES_EDE3_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final preferSignedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final rC2_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final sMIMECapabilitiesVersions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# instance fields
.field private capabilityID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private parameters:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 19
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->preferSignedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->preferSignedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 20
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->canNotDecryptAny:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->canNotDecryptAny:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 21
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->sMIMECapabilitiesVersions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->sMIMECapabilitiesVersions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 26
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.14.3.2.7"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->dES_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 27
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->des_EDE3_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->dES_EDE3_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 28
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->RC2_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->rC2_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 29
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->aES128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 30
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->aES192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 31
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sput-object v0, Lorg/spongycastle/asn1/smime/SMIMECapability;->aES256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 3
    .param p1, "capabilityID"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "parameters"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->capabilityID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 52
    iput-object p2, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->parameters:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 53
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 4
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v1, 0x1

    .line 38
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iput-object v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->capabilityID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 41
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-le v0, v1, :cond_1b

    .line 43
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Primitive;

    iput-object v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->parameters:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 45
    :cond_1b
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/smime/SMIMECapability;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 58
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;

    if-eqz v0, :cond_9

    .line 60
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/smime/SMIMECapability;

    .line 65
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 63
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_16

    .line 65
    new-instance v0, Lorg/spongycastle/asn1/smime/SMIMECapability;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/smime/SMIMECapability;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8

    .line 68
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid SMIMECapability"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getCapabilityID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->capabilityID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getParameters()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->parameters:Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 92
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 94
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->capabilityID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 96
    iget-object v1, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->parameters:Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v1, :cond_13

    .line 98
    iget-object v1, p0, Lorg/spongycastle/asn1/smime/SMIMECapability;->parameters:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 101
    :cond_13
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
