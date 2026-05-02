.class public Lorg/spongycastle/asn1/x509/NoticeReference;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "NoticeReference.java"


# instance fields
.field private noticeNumbers:Lorg/spongycastle/asn1/ASN1Sequence;

.field private organization:Lorg/spongycastle/asn1/x509/DisplayText;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Vector;)V
    .registers 4
    .param p1, "organization"    # Ljava/lang/String;
    .param p2, "numbers"    # Ljava/util/Vector;

    .prologue
    .line 74
    invoke-static {p2}, Lorg/spongycastle/asn1/x509/NoticeReference;->convertVector(Ljava/util/Vector;)Lorg/spongycastle/asn1/ASN1EncodableVector;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/x509/NoticeReference;-><init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1EncodableVector;)V
    .registers 4
    .param p1, "organization"    # Ljava/lang/String;
    .param p2, "noticeNumbers"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 87
    new-instance v0, Lorg/spongycastle/asn1/x509/DisplayText;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/x509/DisplayText;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/NoticeReference;-><init>(Lorg/spongycastle/asn1/x509/DisplayText;Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 88
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 5
    .param p1, "as"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 116
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_27

    .line 118
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad sequence size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 119
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_27
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/DisplayText;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DisplayText;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->organization:Lorg/spongycastle/asn1/x509/DisplayText;

    .line 123
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->noticeNumbers:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 124
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/DisplayText;Lorg/spongycastle/asn1/ASN1EncodableVector;)V
    .registers 4
    .param p1, "organization"    # Lorg/spongycastle/asn1/x509/DisplayText;
    .param p2, "noticeNumbers"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 100
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->organization:Lorg/spongycastle/asn1/x509/DisplayText;

    .line 101
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->noticeNumbers:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 102
    return-void
.end method

.method private static convertVector(Ljava/util/Vector;)Lorg/spongycastle/asn1/ASN1EncodableVector;
    .registers 7
    .param p0, "numbers"    # Ljava/util/Vector;

    .prologue
    .line 37
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 39
    .local v0, "av":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-virtual {p0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .line 41
    .local v2, "it":Ljava/util/Enumeration;
    :goto_9
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_39

    .line 43
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    .line 46
    .local v3, "o":Ljava/lang/Object;
    instance-of v4, v3, Ljava/math/BigInteger;

    if-eqz v4, :cond_22

    .line 48
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    check-cast v3, Ljava/math/BigInteger;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-direct {v1, v3}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    .line 59
    .local v1, "di":Lorg/spongycastle/asn1/ASN1Integer;
    :goto_1e
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_9

    .line 50
    .end local v1    # "di":Lorg/spongycastle/asn1/ASN1Integer;
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_22
    instance-of v4, v3, Ljava/lang/Integer;

    if-eqz v4, :cond_33

    .line 52
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    invoke-direct {v1, v4, v5}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .restart local v1    # "di":Lorg/spongycastle/asn1/ASN1Integer;
    goto :goto_1e

    .line 56
    .end local v1    # "di":Lorg/spongycastle/asn1/ASN1Integer;
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_33
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 61
    .end local v3    # "o":Ljava/lang/Object;
    :cond_39
    return-object v0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/NoticeReference;
    .registers 3
    .param p0, "as"    # Ljava/lang/Object;

    .prologue
    .line 129
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/NoticeReference;

    if-eqz v0, :cond_7

    .line 131
    check-cast p0, Lorg/spongycastle/asn1/x509/NoticeReference;

    .line 138
    .end local p0    # "as":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 133
    .restart local p0    # "as":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 135
    new-instance v0, Lorg/spongycastle/asn1/x509/NoticeReference;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/NoticeReference;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 138
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getNoticeNumbers()[Lorg/spongycastle/asn1/ASN1Integer;
    .registers 4

    .prologue
    .line 148
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->noticeNumbers:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/ASN1Integer;

    .line 150
    .local v1, "tmp":[Lorg/spongycastle/asn1/ASN1Integer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->noticeNumbers:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eq v0, v2, :cond_20

    .line 152
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->noticeNumbers:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    aput-object v2, v1, v0

    .line 150
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 155
    :cond_20
    return-object v1
.end method

.method public getOrganization()Lorg/spongycastle/asn1/x509/DisplayText;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->organization:Lorg/spongycastle/asn1/x509/DisplayText;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 165
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 166
    .local v0, "av":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->organization:Lorg/spongycastle/asn1/x509/DisplayText;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 167
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/NoticeReference;->noticeNumbers:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 168
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
