.class public Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "CommitmentTypeIndication.java"


# instance fields
.field private commitmentTypeId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private commitmentTypeQualifier:Lorg/spongycastle/asn1/ASN1Sequence;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .registers 2
    .param p1, "commitmentTypeId"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "commitmentTypeId"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "commitmentTypeQualifier"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 38
    iput-object p2, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeQualifier:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 39
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 4
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v1, 0x1

    .line 18
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 21
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-le v0, v1, :cond_1b

    .line 23
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeQualifier:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 25
    :cond_1b
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 44
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;

    if-eqz v0, :cond_9

    .line 46
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;

    .line 49
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    new-instance v0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8
.end method


# virtual methods
.method public getCommitmentTypeId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getCommitmentTypeQualifier()Lorg/spongycastle/asn1/ASN1Sequence;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeQualifier:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 72
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 74
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 76
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeQualifier:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_13

    .line 78
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/CommitmentTypeIndication;->commitmentTypeQualifier:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 81
    :cond_13
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
