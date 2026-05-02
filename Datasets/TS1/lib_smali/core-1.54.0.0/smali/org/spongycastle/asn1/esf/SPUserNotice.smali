.class public Lorg/spongycastle/asn1/esf/SPUserNotice;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SPUserNotice.java"


# instance fields
.field private explicitText:Lorg/spongycastle/asn1/x509/DisplayText;

.field private noticeRef:Lorg/spongycastle/asn1/x509/NoticeReference;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 7
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 39
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 40
    .local v0, "e":Ljava/util/Enumeration;
    :goto_7
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_52

    .line 42
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Encodable;

    .line 43
    .local v1, "object":Lorg/spongycastle/asn1/ASN1Encodable;
    instance-of v2, v1, Lorg/spongycastle/asn1/x509/DisplayText;

    if-nez v2, :cond_1b

    instance-of v2, v1, Lorg/spongycastle/asn1/ASN1String;

    if-eqz v2, :cond_22

    .line 45
    :cond_1b
    invoke-static {v1}, Lorg/spongycastle/asn1/x509/DisplayText;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DisplayText;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->explicitText:Lorg/spongycastle/asn1/x509/DisplayText;

    goto :goto_7

    .line 47
    :cond_22
    instance-of v2, v1, Lorg/spongycastle/asn1/x509/NoticeReference;

    if-nez v2, :cond_2a

    instance-of v2, v1, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v2, :cond_31

    .line 49
    :cond_2a
    invoke-static {v1}, Lorg/spongycastle/asn1/x509/NoticeReference;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/NoticeReference;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->noticeRef:Lorg/spongycastle/asn1/x509/NoticeReference;

    goto :goto_7

    .line 53
    :cond_31
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid element in \'SPUserNotice\': "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 56
    .end local v1    # "object":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_52
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/NoticeReference;Lorg/spongycastle/asn1/x509/DisplayText;)V
    .registers 3
    .param p1, "noticeRef"    # Lorg/spongycastle/asn1/x509/NoticeReference;
    .param p2, "explicitText"    # Lorg/spongycastle/asn1/x509/DisplayText;

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 62
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->noticeRef:Lorg/spongycastle/asn1/x509/NoticeReference;

    .line 63
    iput-object p2, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->explicitText:Lorg/spongycastle/asn1/x509/DisplayText;

    .line 64
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/SPUserNotice;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 24
    instance-of v0, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;

    if-eqz v0, :cond_7

    .line 26
    check-cast p0, Lorg/spongycastle/asn1/esf/SPUserNotice;

    .line 33
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 28
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 30
    new-instance v0, Lorg/spongycastle/asn1/esf/SPUserNotice;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/esf/SPUserNotice;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 33
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getExplicitText()Lorg/spongycastle/asn1/x509/DisplayText;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->explicitText:Lorg/spongycastle/asn1/x509/DisplayText;

    return-object v0
.end method

.method public getNoticeRef()Lorg/spongycastle/asn1/x509/NoticeReference;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->noticeRef:Lorg/spongycastle/asn1/x509/NoticeReference;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 85
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 87
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->noticeRef:Lorg/spongycastle/asn1/x509/NoticeReference;

    if-eqz v1, :cond_e

    .line 89
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->noticeRef:Lorg/spongycastle/asn1/x509/NoticeReference;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 92
    :cond_e
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->explicitText:Lorg/spongycastle/asn1/x509/DisplayText;

    if-eqz v1, :cond_17

    .line 94
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/SPUserNotice;->explicitText:Lorg/spongycastle/asn1/x509/DisplayText;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 97
    :cond_17
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
