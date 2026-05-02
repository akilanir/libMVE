.class public Lorg/spongycastle/asn1/tsp/TimeStampReq;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "TimeStampReq.java"


# instance fields
.field certReq:Lorg/spongycastle/asn1/ASN1Boolean;

.field extensions:Lorg/spongycastle/asn1/x509/Extensions;

.field messageImprint:Lorg/spongycastle/asn1/tsp/MessageImprint;

.field nonce:Lorg/spongycastle/asn1/ASN1Integer;

.field tsaPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 7
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 46
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    .line 48
    .local v0, "nbObjects":I
    const/4 v2, 0x0

    .line 51
    .local v2, "seqStart":I
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 56
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/tsp/MessageImprint;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/tsp/MessageImprint;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->messageImprint:Lorg/spongycastle/asn1/tsp/MessageImprint;

    .line 58
    add-int/lit8 v2, v2, 0x1

    .line 60
    move v1, v2

    .local v1, "opt":I
    :goto_21
    if-ge v1, v0, :cond_7a

    .line 63
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    instance-of v4, v4, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v4, :cond_38

    .line 65
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->tsaPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 60
    :cond_35
    :goto_35
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 68
    :cond_38
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    instance-of v4, v4, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v4, :cond_4b

    .line 70
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->nonce:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_35

    .line 73
    :cond_4b
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    instance-of v4, v4, Lorg/spongycastle/asn1/ASN1Boolean;

    if-eqz v4, :cond_5e

    .line 75
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1Boolean;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Boolean;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->certReq:Lorg/spongycastle/asn1/ASN1Boolean;

    goto :goto_35

    .line 78
    :cond_5e
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    instance-of v4, v4, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v4, :cond_35

    .line 80
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 81
    .local v3, "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v4

    if-nez v4, :cond_35

    .line 83
    const/4 v4, 0x0

    invoke-static {v3, v4}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    goto :goto_35

    .line 87
    .end local v3    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_7a
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/tsp/MessageImprint;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ASN1Boolean;Lorg/spongycastle/asn1/x509/Extensions;)V
    .registers 9
    .param p1, "messageImprint"    # Lorg/spongycastle/asn1/tsp/MessageImprint;
    .param p2, "tsaPolicy"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p3, "nonce"    # Lorg/spongycastle/asn1/ASN1Integer;
    .param p4, "certReq"    # Lorg/spongycastle/asn1/ASN1Boolean;
    .param p5, "extensions"    # Lorg/spongycastle/asn1/x509/Extensions;

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 97
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 99
    iput-object p1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->messageImprint:Lorg/spongycastle/asn1/tsp/MessageImprint;

    .line 100
    iput-object p2, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->tsaPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 101
    iput-object p3, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->nonce:Lorg/spongycastle/asn1/ASN1Integer;

    .line 102
    iput-object p4, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->certReq:Lorg/spongycastle/asn1/ASN1Boolean;

    .line 103
    iput-object p5, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 104
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/tsp/TimeStampReq;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 32
    instance-of v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;

    if-eqz v0, :cond_7

    .line 34
    check-cast p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;

    .line 41
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 36
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 38
    new-instance v0, Lorg/spongycastle/asn1/tsp/TimeStampReq;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/tsp/TimeStampReq;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 41
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getCertReq()Lorg/spongycastle/asn1/ASN1Boolean;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->certReq:Lorg/spongycastle/asn1/ASN1Boolean;

    return-object v0
.end method

.method public getExtensions()Lorg/spongycastle/asn1/x509/Extensions;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    return-object v0
.end method

.method public getMessageImprint()Lorg/spongycastle/asn1/tsp/MessageImprint;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->messageImprint:Lorg/spongycastle/asn1/tsp/MessageImprint;

    return-object v0
.end method

.method public getNonce()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->nonce:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public getReqPolicy()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->tsaPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->version:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 152
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 154
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->version:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 155
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->messageImprint:Lorg/spongycastle/asn1/tsp/MessageImprint;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 157
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->tsaPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v1, :cond_19

    .line 159
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->tsaPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 162
    :cond_19
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->nonce:Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_22

    .line 164
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->nonce:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 167
    :cond_22
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->certReq:Lorg/spongycastle/asn1/ASN1Boolean;

    if-eqz v1, :cond_33

    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->certReq:Lorg/spongycastle/asn1/ASN1Boolean;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Boolean;->isTrue()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 169
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->certReq:Lorg/spongycastle/asn1/ASN1Boolean;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 172
    :cond_33
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    if-eqz v1, :cond_41

    .line 174
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/tsp/TimeStampReq;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    invoke-direct {v1, v3, v3, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 177
    :cond_41
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
