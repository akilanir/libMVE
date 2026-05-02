.class public Lorg/spongycastle/asn1/cms/EncryptedData;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "EncryptedData.java"


# instance fields
.field private encryptedContentInfo:Lorg/spongycastle/asn1/cms/EncryptedContentInfo;

.field private unprotectedAttrs:Lorg/spongycastle/asn1/ASN1Set;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 5
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 72
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 73
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/cms/EncryptedContentInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/EncryptedContentInfo;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->encryptedContentInfo:Lorg/spongycastle/asn1/cms/EncryptedContentInfo;

    .line 75
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2d

    .line 77
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-static {v0, v2}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->unprotectedAttrs:Lorg/spongycastle/asn1/ASN1Set;

    .line 79
    :cond_2d
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/EncryptedContentInfo;)V
    .registers 3
    .param p1, "encInfo"    # Lorg/spongycastle/asn1/cms/EncryptedContentInfo;

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/cms/EncryptedData;-><init>(Lorg/spongycastle/asn1/cms/EncryptedContentInfo;Lorg/spongycastle/asn1/ASN1Set;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/EncryptedContentInfo;Lorg/spongycastle/asn1/ASN1Set;)V
    .registers 6
    .param p1, "encInfo"    # Lorg/spongycastle/asn1/cms/EncryptedContentInfo;
    .param p2, "unprotectedAttrs"    # Lorg/spongycastle/asn1/ASN1Set;

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 65
    new-instance v2, Lorg/spongycastle/asn1/ASN1Integer;

    if-nez p2, :cond_13

    const-wide/16 v0, 0x0

    :goto_9
    invoke-direct {v2, v0, v1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v2, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 66
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->encryptedContentInfo:Lorg/spongycastle/asn1/cms/EncryptedContentInfo;

    .line 67
    iput-object p2, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->unprotectedAttrs:Lorg/spongycastle/asn1/ASN1Set;

    .line 68
    return-void

    .line 65
    :cond_13
    const-wide/16 v0, 0x2

    goto :goto_9
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/EncryptedData;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 45
    instance-of v0, p0, Lorg/spongycastle/asn1/cms/EncryptedData;

    if-eqz v0, :cond_7

    .line 47
    check-cast p0, Lorg/spongycastle/asn1/cms/EncryptedData;

    .line 55
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 50
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 52
    new-instance v0, Lorg/spongycastle/asn1/cms/EncryptedData;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/EncryptedData;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 55
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getEncryptedContentInfo()Lorg/spongycastle/asn1/cms/EncryptedContentInfo;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->encryptedContentInfo:Lorg/spongycastle/asn1/cms/EncryptedContentInfo;

    return-object v0
.end method

.method public getUnprotectedAttrs()Lorg/spongycastle/asn1/ASN1Set;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->unprotectedAttrs:Lorg/spongycastle/asn1/ASN1Set;

    return-object v0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    .line 101
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 103
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 104
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->encryptedContentInfo:Lorg/spongycastle/asn1/cms/EncryptedContentInfo;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 105
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->unprotectedAttrs:Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_1f

    .line 107
    new-instance v1, Lorg/spongycastle/asn1/BERTaggedObject;

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lorg/spongycastle/asn1/cms/EncryptedData;->unprotectedAttrs:Lorg/spongycastle/asn1/ASN1Set;

    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 110
    :cond_1f
    new-instance v1, Lorg/spongycastle/asn1/BERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/BERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
