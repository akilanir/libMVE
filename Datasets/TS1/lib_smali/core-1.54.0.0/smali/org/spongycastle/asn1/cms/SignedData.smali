.class public Lorg/spongycastle/asn1/cms/SignedData;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SignedData.java"


# static fields
.field private static final VERSION_1:Lorg/spongycastle/asn1/ASN1Integer;

.field private static final VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

.field private static final VERSION_4:Lorg/spongycastle/asn1/ASN1Integer;

.field private static final VERSION_5:Lorg/spongycastle/asn1/ASN1Integer;


# instance fields
.field private certificates:Lorg/spongycastle/asn1/ASN1Set;

.field private certsBer:Z

.field private contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

.field private crls:Lorg/spongycastle/asn1/ASN1Set;

.field private crlsBer:Z

.field private digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

.field private signerInfos:Lorg/spongycastle/asn1/ASN1Set;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 61
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_1:Lorg/spongycastle/asn1/ASN1Integer;

    .line 62
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x3

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    .line 63
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x4

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_4:Lorg/spongycastle/asn1/ASN1Integer;

    .line 64
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x5

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    sput-object v0, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_5:Lorg/spongycastle/asn1/ASN1Integer;

    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 8
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v4, 0x0

    .line 220
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 221
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 223
    .local v0, "e":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 224
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1Set;

    iput-object v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    .line 225
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/cms/ContentInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/ContentInfo;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 227
    :goto_24
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_76

    .line 229
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 236
    .local v1, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    instance-of v3, v1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v3, :cond_71

    move-object v2, v1

    .line 238
    check-cast v2, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 240
    .local v2, "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v3

    packed-switch v3, :pswitch_data_78

    .line 251
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unknown tag value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 243
    :pswitch_5b
    instance-of v3, v2, Lorg/spongycastle/asn1/BERTaggedObject;

    iput-boolean v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->certsBer:Z

    .line 244
    invoke-static {v2, v4}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    goto :goto_24

    .line 247
    :pswitch_66
    instance-of v3, v2, Lorg/spongycastle/asn1/BERTaggedObject;

    iput-boolean v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->crlsBer:Z

    .line 248
    invoke-static {v2, v4}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    goto :goto_24

    .line 256
    .end local v2    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_71
    check-cast v1, Lorg/spongycastle/asn1/ASN1Set;

    .end local v1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    iput-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    goto :goto_24

    .line 259
    :cond_76
    return-void

    .line 240
    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_66
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/cms/ContentInfo;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)V
    .registers 7
    .param p1, "digestAlgorithms"    # Lorg/spongycastle/asn1/ASN1Set;
    .param p2, "contentInfo"    # Lorg/spongycastle/asn1/cms/ContentInfo;
    .param p3, "certificates"    # Lorg/spongycastle/asn1/ASN1Set;
    .param p4, "crls"    # Lorg/spongycastle/asn1/ASN1Set;
    .param p5, "signerInfos"    # Lorg/spongycastle/asn1/ASN1Set;

    .prologue
    .line 110
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 111
    invoke-virtual {p2}, Lorg/spongycastle/asn1/cms/ContentInfo;->getContentType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    invoke-direct {p0, v0, p3, p4, p5}, Lorg/spongycastle/asn1/cms/SignedData;->calculateVersion(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 112
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    .line 113
    iput-object p2, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 114
    iput-object p3, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    .line 115
    iput-object p4, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    .line 116
    iput-object p5, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    .line 117
    instance-of v0, p4, Lorg/spongycastle/asn1/BERSet;

    iput-boolean v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->crlsBer:Z

    .line 118
    instance-of v0, p3, Lorg/spongycastle/asn1/BERSet;

    iput-boolean v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->certsBer:Z

    .line 119
    return-void
.end method

.method private calculateVersion(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)Lorg/spongycastle/asn1/ASN1Integer;
    .registers 15
    .param p1, "contentOid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "certs"    # Lorg/spongycastle/asn1/ASN1Set;
    .param p3, "crls"    # Lorg/spongycastle/asn1/ASN1Set;
    .param p4, "signerInfs"    # Lorg/spongycastle/asn1/ASN1Set;

    .prologue
    .line 128
    const/4 v4, 0x0

    .line 129
    .local v4, "otherCert":Z
    const/4 v5, 0x0

    .line 130
    .local v5, "otherCrl":Z
    const/4 v0, 0x0

    .line 131
    .local v0, "attrCertV1Found":Z
    const/4 v1, 0x0

    .line 133
    .local v1, "attrCertV2Found":Z
    if-eqz p2, :cond_37

    .line 135
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_a
    :goto_a
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_37

    .line 137
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    .line 138
    .local v3, "obj":Ljava/lang/Object;
    instance-of v7, v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v7, :cond_a

    .line 140
    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v6

    .line 142
    .local v6, "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_25

    .line 144
    const/4 v0, 0x1

    goto :goto_a

    .line 146
    :cond_25
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v7

    const/4 v8, 0x2

    if-ne v7, v8, :cond_2e

    .line 148
    const/4 v1, 0x1

    goto :goto_a

    .line 150
    :cond_2e
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v7

    const/4 v8, 0x3

    if-ne v7, v8, :cond_a

    .line 152
    const/4 v4, 0x1

    goto :goto_a

    .line 158
    .end local v2    # "en":Ljava/util/Enumeration;
    .end local v3    # "obj":Ljava/lang/Object;
    .end local v6    # "tagged":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_37
    if-eqz v4, :cond_41

    .line 160
    new-instance v7, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v8, 0x5

    invoke-direct {v7, v8, v9}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 200
    :goto_40
    return-object v7

    .line 163
    :cond_41
    if-eqz p3, :cond_57

    .line 165
    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .restart local v2    # "en":Ljava/util/Enumeration;
    :cond_47
    :goto_47
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_57

    .line 167
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    .line 168
    .restart local v3    # "obj":Ljava/lang/Object;
    instance-of v7, v3, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v7, :cond_47

    .line 170
    const/4 v5, 0x1

    goto :goto_47

    .line 175
    .end local v2    # "en":Ljava/util/Enumeration;
    .end local v3    # "obj":Ljava/lang/Object;
    :cond_57
    if-eqz v5, :cond_5c

    .line 177
    sget-object v7, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_5:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_40

    .line 180
    :cond_5c
    if-eqz v1, :cond_61

    .line 182
    sget-object v7, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_4:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_40

    .line 185
    :cond_61
    if-eqz v0, :cond_66

    .line 187
    sget-object v7, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_40

    .line 190
    :cond_66
    invoke-direct {p0, p4}, Lorg/spongycastle/asn1/cms/SignedData;->checkForVersion3(Lorg/spongycastle/asn1/ASN1Set;)Z

    move-result v7

    if-eqz v7, :cond_6f

    .line 192
    sget-object v7, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_40

    .line 195
    :cond_6f
    sget-object v7, Lorg/spongycastle/asn1/cms/CMSObjectIdentifiers;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v7, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7a

    .line 197
    sget-object v7, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_3:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_40

    .line 200
    :cond_7a
    sget-object v7, Lorg/spongycastle/asn1/cms/SignedData;->VERSION_1:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_40
.end method

.method private checkForVersion3(Lorg/spongycastle/asn1/ASN1Set;)Z
    .registers 6
    .param p1, "signerInfs"    # Lorg/spongycastle/asn1/ASN1Set;

    .prologue
    .line 205
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_4
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 207
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/cms/SignerInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/SignerInfo;

    move-result-object v1

    .line 209
    .local v1, "s":Lorg/spongycastle/asn1/cms/SignerInfo;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/cms/SignerInfo;->getVersion()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_4

    .line 211
    const/4 v2, 0x1

    .line 215
    .end local v1    # "s":Lorg/spongycastle/asn1/cms/SignerInfo;
    :goto_22
    return v2

    :cond_23
    const/4 v2, 0x0

    goto :goto_22
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/SignedData;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 92
    instance-of v0, p0, Lorg/spongycastle/asn1/cms/SignedData;

    if-eqz v0, :cond_7

    .line 94
    check-cast p0, Lorg/spongycastle/asn1/cms/SignedData;

    .line 101
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 96
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 98
    new-instance v0, Lorg/spongycastle/asn1/cms/SignedData;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/SignedData;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 101
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getCRLs()Lorg/spongycastle/asn1/ASN1Set;
    .registers 2

    .prologue
    .line 283
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    return-object v0
.end method

.method public getCertificates()Lorg/spongycastle/asn1/ASN1Set;
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    return-object v0
.end method

.method public getDigestAlgorithms()Lorg/spongycastle/asn1/ASN1Set;
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    return-object v0
.end method

.method public getEncapContentInfo()Lorg/spongycastle/asn1/cms/ContentInfo;
    .registers 2

    .prologue
    .line 273
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    return-object v0
.end method

.method public getSignerInfos()Lorg/spongycastle/asn1/ASN1Set;
    .registers 2

    .prologue
    .line 288
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    return-object v0
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 2

    .prologue
    .line 263
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 296
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 298
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->version:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 299
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->digestAlgorithms:Lorg/spongycastle/asn1/ASN1Set;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 300
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->contentInfo:Lorg/spongycastle/asn1/cms/ContentInfo;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 302
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_28

    .line 304
    iget-boolean v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->certsBer:Z

    if-eqz v1, :cond_45

    .line 306
    new-instance v1, Lorg/spongycastle/asn1/BERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    invoke-direct {v1, v3, v3, v2}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 314
    :cond_28
    :goto_28
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v1, :cond_3a

    .line 316
    iget-boolean v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->crlsBer:Z

    if-eqz v1, :cond_50

    .line 318
    new-instance v1, Lorg/spongycastle/asn1/BERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    invoke-direct {v1, v3, v4, v2}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 326
    :cond_3a
    :goto_3a
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/SignedData;->signerInfos:Lorg/spongycastle/asn1/ASN1Set;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 328
    new-instance v1, Lorg/spongycastle/asn1/BERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/BERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1

    .line 310
    :cond_45
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/cms/SignedData;->certificates:Lorg/spongycastle/asn1/ASN1Set;

    invoke-direct {v1, v3, v3, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_28

    .line 322
    :cond_50
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/cms/SignedData;->crls:Lorg/spongycastle/asn1/ASN1Set;

    invoke-direct {v1, v3, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_3a
.end method
