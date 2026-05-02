.class public Lorg/spongycastle/asn1/ocsp/TBSRequest;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "TBSRequest.java"


# static fields
.field private static final V1:Lorg/spongycastle/asn1/ASN1Integer;


# instance fields
.field requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

.field requestList:Lorg/spongycastle/asn1/ASN1Sequence;

.field requestorName:Lorg/spongycastle/asn1/x509/GeneralName;

.field version:Lorg/spongycastle/asn1/ASN1Integer;

.field versionSet:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 18
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    sput-object v0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 8
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 57
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 58
    const/4 v0, 0x0

    .line 60
    .local v0, "index":I
    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    instance-of v3, v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v3, :cond_65

    .line 62
    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 64
    .local v2, "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v3

    if-nez v3, :cond_60

    .line 66
    iput-boolean v5, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->versionSet:Z

    .line 67
    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-static {v3, v5}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 68
    add-int/lit8 v0, v0, 0x1

    .line 80
    .end local v2    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :goto_2a
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    instance-of v3, v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v3, :cond_41

    .line 82
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .local v1, "index":I
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-static {v3, v5}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestorName:Lorg/spongycastle/asn1/x509/GeneralName;

    move v0, v1

    .line 85
    .end local v1    # "index":I
    .restart local v0    # "index":I
    :cond_41
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .restart local v1    # "index":I
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1Sequence;

    iput-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestList:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 87
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v3

    add-int/lit8 v4, v1, 0x1

    if-ne v3, v4, :cond_5f

    .line 89
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-static {v3, v5}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 91
    :cond_5f
    return-void

    .line 72
    .end local v1    # "index":I
    .restart local v0    # "index":I
    .restart local v2    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_60
    sget-object v3, Lorg/spongycastle/asn1/ocsp/TBSRequest;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    iput-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_2a

    .line 77
    .end local v2    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_65
    sget-object v3, Lorg/spongycastle/asn1/ocsp/TBSRequest;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    iput-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_2a
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/GeneralName;Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/x509/Extensions;)V
    .registers 5
    .param p1, "requestorName"    # Lorg/spongycastle/asn1/x509/GeneralName;
    .param p2, "requestList"    # Lorg/spongycastle/asn1/ASN1Sequence;
    .param p3, "requestExtensions"    # Lorg/spongycastle/asn1/x509/Extensions;

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 49
    sget-object v0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 50
    iput-object p1, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestorName:Lorg/spongycastle/asn1/x509/GeneralName;

    .line 51
    iput-object p2, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestList:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 52
    iput-object p3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 53
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/GeneralName;Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/x509/X509Extensions;)V
    .registers 5
    .param p1, "requestorName"    # Lorg/spongycastle/asn1/x509/GeneralName;
    .param p2, "requestList"    # Lorg/spongycastle/asn1/ASN1Sequence;
    .param p3, "requestExtensions"    # Lorg/spongycastle/asn1/x509/X509Extensions;

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 38
    sget-object v0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 39
    iput-object p1, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestorName:Lorg/spongycastle/asn1/x509/GeneralName;

    .line 40
    iput-object p2, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestList:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 41
    invoke-static {p3}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    .line 42
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/TBSRequest;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 103
    instance-of v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;

    if-eqz v0, :cond_7

    .line 105
    check-cast p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;

    .line 112
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 107
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 109
    new-instance v0, Lorg/spongycastle/asn1/ocsp/TBSRequest;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ocsp/TBSRequest;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 112
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ocsp/TBSRequest;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 97
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ocsp/TBSRequest;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/TBSRequest;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getRequestExtensions()Lorg/spongycastle/asn1/x509/Extensions;
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    return-object v0
.end method

.method public getRequestList()Lorg/spongycastle/asn1/ASN1Sequence;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestList:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method

.method public getRequestorName()Lorg/spongycastle/asn1/x509/GeneralName;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestorName:Lorg/spongycastle/asn1/x509/GeneralName;

    return-object v0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 147
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 153
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    sget-object v2, Lorg/spongycastle/asn1/ocsp/TBSRequest;->V1:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    iget-boolean v1, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->versionSet:Z

    if-eqz v1, :cond_1f

    .line 155
    :cond_14
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->version:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 158
    :cond_1f
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestorName:Lorg/spongycastle/asn1/x509/GeneralName;

    if-eqz v1, :cond_2d

    .line 160
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestorName:Lorg/spongycastle/asn1/x509/GeneralName;

    invoke-direct {v1, v4, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 163
    :cond_2d
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestList:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 165
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    if-eqz v1, :cond_41

    .line 167
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x2

    iget-object v3, p0, Lorg/spongycastle/asn1/ocsp/TBSRequest;->requestExtensions:Lorg/spongycastle/asn1/x509/Extensions;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 170
    :cond_41
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
