.class public Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DVCSCertInfo.java"


# static fields
.field private static final DEFAULT_VERSION:I = 0x1

.field private static final TAG_CERTS:I = 0x3

.field private static final TAG_DV_STATUS:I = 0x0

.field private static final TAG_POLICY:I = 0x1

.field private static final TAG_REQ_SIGNATURE:I = 0x2


# instance fields
.field private certs:Lorg/spongycastle/asn1/ASN1Sequence;

.field private dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

.field private dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

.field private extensions:Lorg/spongycastle/asn1/x509/Extensions;

.field private messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

.field private policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

.field private reqSignature:Lorg/spongycastle/asn1/ASN1Set;

.field private responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

.field private serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

.field private version:I


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 9
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    const/4 v6, 0x1

    iput v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    .line 71
    const/4 v1, 0x0

    .line 72
    .local v1, "i":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 73
    .local v5, "x":Lorg/spongycastle/asn1/ASN1Encodable;
    instance-of v6, v5, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v6, :cond_9a

    .line 75
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    .line 76
    .local v0, "encVersion":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    iput v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    .line 77
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 80
    .end local v0    # "encVersion":Lorg/spongycastle/asn1/ASN1Integer;
    :goto_25
    invoke-static {v5}, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .line 81
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 82
    invoke-static {v5}, Lorg/spongycastle/asn1/x509/DigestInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DigestInfo;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    .line 83
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 84
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 85
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 86
    invoke-static {v5}, Lorg/spongycastle/asn1/dvcs/DVCSTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSTime;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    move v1, v2

    .line 88
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :goto_50
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v6

    if-ge v1, v6, :cond_99

    .line 91
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 95
    :try_start_5c
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v3

    .line 96
    .local v3, "t":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v4

    .line 98
    .local v4, "tagNo":I
    packed-switch v4, :pswitch_data_9c

    :goto_67
    move v1, v2

    .line 114
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_50

    .line 101
    .end local v1    # "i":I
    .restart local v2    # "i":I
    :pswitch_69
    const/4 v6, 0x0

    invoke-static {v3, v6}, Lorg/spongycastle/asn1/cmp/PKIStatusInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;
    :try_end_70
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5c .. :try_end_70} :catch_71

    goto :goto_67

    .line 117
    .end local v3    # "t":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .end local v4    # "tagNo":I
    :catch_71
    move-exception v6

    .line 123
    :try_start_72
    invoke-static {v5}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->extensions:Lorg/spongycastle/asn1/x509/Extensions;
    :try_end_78
    .catch Ljava/lang/IllegalArgumentException; {:try_start_72 .. :try_end_78} :catch_96

    move v1, v2

    .line 127
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_50

    .line 104
    .end local v1    # "i":I
    .restart local v2    # "i":I
    .restart local v3    # "t":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .restart local v4    # "tagNo":I
    :pswitch_7a
    const/4 v6, 0x0

    :try_start_7b
    invoke-static {v3, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    goto :goto_67

    .line 107
    :pswitch_86
    const/4 v6, 0x0

    invoke-static {v3, v6}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    goto :goto_67

    .line 110
    :pswitch_8e
    const/4 v6, 0x0

    invoke-static {v3, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->certs:Lorg/spongycastle/asn1/ASN1Sequence;
    :try_end_95
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7b .. :try_end_95} :catch_71

    goto :goto_67

    .line 125
    .end local v3    # "t":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .end local v4    # "tagNo":I
    :catch_96
    move-exception v6

    move v1, v2

    .line 127
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_50

    .line 131
    :cond_99
    return-void

    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_9a
    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_25

    .line 98
    :pswitch_data_9c
    .packed-switch 0x0
        :pswitch_69
        :pswitch_7a
        :pswitch_86
        :pswitch_8e
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;Lorg/spongycastle/asn1/x509/DigestInfo;Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/dvcs/DVCSTime;)V
    .registers 6
    .param p1, "dvReqInfo"    # Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;
    .param p2, "messageImprint"    # Lorg/spongycastle/asn1/x509/DigestInfo;
    .param p3, "serialNumber"    # Lorg/spongycastle/asn1/ASN1Integer;
    .param p4, "responseTime"    # Lorg/spongycastle/asn1/dvcs/DVCSTime;

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    .line 63
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .line 64
    iput-object p2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    .line 65
    iput-object p3, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    .line 66
    iput-object p4, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    .line 67
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 135
    instance-of v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;

    if-eqz v0, :cond_7

    .line 137
    check-cast p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;

    .line 144
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 139
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 141
    new-instance v0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 144
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 151
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;

    move-result-object v0

    return-object v0
.end method

.method private setDvReqInfo(Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;)V
    .registers 2
    .param p1, "dvReqInfo"    # Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .prologue
    .line 247
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .line 248
    return-void
.end method

.method private setMessageImprint(Lorg/spongycastle/asn1/x509/DigestInfo;)V
    .registers 2
    .param p1, "messageImprint"    # Lorg/spongycastle/asn1/x509/DigestInfo;

    .prologue
    .line 257
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    .line 258
    return-void
.end method

.method private setVersion(I)V
    .registers 2
    .param p1, "version"    # I

    .prologue
    .line 237
    iput p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    .line 238
    return-void
.end method


# virtual methods
.method public getCerts()[Lorg/spongycastle/asn1/dvcs/TargetEtcChain;
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_b

    .line 289
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-static {v0}, Lorg/spongycastle/asn1/dvcs/TargetEtcChain;->arrayFromSequence(Lorg/spongycastle/asn1/ASN1Sequence;)[Lorg/spongycastle/asn1/dvcs/TargetEtcChain;

    move-result-object v0

    .line 292
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getDvReqInfo()Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    return-object v0
.end method

.method public getDvStatus()Lorg/spongycastle/asn1/cmp/PKIStatusInfo;
    .registers 2

    .prologue
    .line 272
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    return-object v0
.end method

.method public getExtensions()Lorg/spongycastle/asn1/x509/Extensions;
    .registers 2

    .prologue
    .line 297
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    return-object v0
.end method

.method public getMessageImprint()Lorg/spongycastle/asn1/x509/DigestInfo;
    .registers 2

    .prologue
    .line 252
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    return-object v0
.end method

.method public getPolicy()Lorg/spongycastle/asn1/x509/PolicyInformation;
    .registers 2

    .prologue
    .line 277
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    return-object v0
.end method

.method public getReqSignature()Lorg/spongycastle/asn1/ASN1Set;
    .registers 2

    .prologue
    .line 282
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    return-object v0
.end method

.method public getResponseTime()Lorg/spongycastle/asn1/dvcs/DVCSTime;
    .registers 2

    .prologue
    .line 267
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    return-object v0
.end method

.method public getSerialNumber()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 232
    iget v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 157
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 159
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    if-eq v1, v5, :cond_16

    .line 161
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    iget v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    int-to-long v2, v2

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 163
    :cond_16
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 164
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 165
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 166
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 167
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    if-eqz v1, :cond_38

    .line 169
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    invoke-direct {v1, v4, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 171
    :cond_38
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    if-eqz v1, :cond_46

    .line 173
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    invoke-direct {v1, v4, v5, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 175
    :cond_46
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_55

    .line 177
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x2

    iget-object v3, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 179
    :cond_55
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_64

    .line 181
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x3

    iget-object v3, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 183
    :cond_64
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    if-eqz v1, :cond_6d

    .line 185
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 188
    :cond_6d
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 193
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 195
    .local v0, "s":Ljava/lang/StringBuffer;
    const-string v1, "DVCSCertInfo {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 197
    iget v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2d

    .line 199
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->version:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 201
    :cond_2d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dvReqInfo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvReqInfo:Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 202
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "messageImprint: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->messageImprint:Lorg/spongycastle/asn1/x509/DigestInfo;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "serialNumber: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->serialNumber:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 204
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "responseTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->responseTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 205
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    if-eqz v1, :cond_c7

    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dvStatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->dvStatus:Lorg/spongycastle/asn1/cmp/PKIStatusInfo;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 209
    :cond_c7
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    if-eqz v1, :cond_e9

    .line 211
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "policy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->policy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 213
    :cond_e9
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_10b

    .line 215
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reqSignature: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->reqSignature:Lorg/spongycastle/asn1/ASN1Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 217
    :cond_10b
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_12d

    .line 219
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "certs: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->certs:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 221
    :cond_12d
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    if-eqz v1, :cond_14f

    .line 223
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "extensions: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSCertInfo;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 226
    :cond_14f
    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 227
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
