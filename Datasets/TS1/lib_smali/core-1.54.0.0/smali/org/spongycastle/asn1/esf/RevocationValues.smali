.class public Lorg/spongycastle/asn1/esf/RevocationValues;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "RevocationValues.java"


# instance fields
.field private crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

.field private ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

.field private otherRevVals:Lorg/spongycastle/asn1/esf/OtherRevVals;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 11
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 46
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v6

    const/4 v7, 0x3

    if-le v6, v7, :cond_27

    .line 48
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Bad sequence size: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 49
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 51
    :cond_27
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .line 52
    .local v2, "e":Ljava/util/Enumeration;
    :goto_2b
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_9c

    .line 54
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 55
    .local v3, "o":Lorg/spongycastle/asn1/DERTaggedObject;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v6

    packed-switch v6, :pswitch_data_9e

    .line 79
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "invalid tag: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 80
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 58
    :pswitch_5b
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERTaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 59
    .local v1, "crlValsSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 60
    .local v0, "crlValsEnum":Ljava/util/Enumeration;
    :goto_65
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_73

    .line 62
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x509/CertificateList;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CertificateList;

    goto :goto_65

    .line 64
    :cond_73
    iput-object v1, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

    goto :goto_2b

    .line 67
    .end local v0    # "crlValsEnum":Ljava/util/Enumeration;
    .end local v1    # "crlValsSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    :pswitch_76
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERTaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 68
    .local v5, "ocspValsSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v4

    .line 69
    .local v4, "ocspValsEnum":Ljava/util/Enumeration;
    :goto_80
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_8e

    .line 71
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;

    goto :goto_80

    .line 73
    :cond_8e
    iput-object v5, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

    goto :goto_2b

    .line 76
    .end local v4    # "ocspValsEnum":Ljava/util/Enumeration;
    .end local v5    # "ocspValsSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    :pswitch_91
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERTaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/esf/OtherRevVals;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OtherRevVals;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->otherRevVals:Lorg/spongycastle/asn1/esf/OtherRevVals;

    goto :goto_2b

    .line 83
    .end local v3    # "o":Lorg/spongycastle/asn1/DERTaggedObject;
    :cond_9c
    return-void

    .line 55
    nop

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_5b
        :pswitch_76
        :pswitch_91
    .end packed-switch
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/x509/CertificateList;[Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;Lorg/spongycastle/asn1/esf/OtherRevVals;)V
    .registers 5
    .param p1, "crlVals"    # [Lorg/spongycastle/asn1/x509/CertificateList;
    .param p2, "ocspVals"    # [Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;
    .param p3, "otherRevVals"    # Lorg/spongycastle/asn1/esf/OtherRevVals;

    .prologue
    .line 87
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 88
    if-eqz p1, :cond_c

    .line 90
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERSequence;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 92
    :cond_c
    if-eqz p2, :cond_15

    .line 94
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DERSequence;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 96
    :cond_15
    iput-object p3, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->otherRevVals:Lorg/spongycastle/asn1/esf/OtherRevVals;

    .line 97
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/RevocationValues;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 32
    instance-of v0, p0, Lorg/spongycastle/asn1/esf/RevocationValues;

    if-eqz v0, :cond_7

    .line 34
    check-cast p0, Lorg/spongycastle/asn1/esf/RevocationValues;

    .line 41
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 36
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 38
    new-instance v0, Lorg/spongycastle/asn1/esf/RevocationValues;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/esf/RevocationValues;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 41
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getCrlVals()[Lorg/spongycastle/asn1/x509/CertificateList;
    .registers 4

    .prologue
    .line 101
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v2, :cond_8

    .line 103
    const/4 v2, 0x0

    new-array v1, v2, [Lorg/spongycastle/asn1/x509/CertificateList;

    .line 111
    :cond_7
    return-object v1

    .line 105
    :cond_8
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/x509/CertificateList;

    .line 106
    .local v1, "result":[Lorg/spongycastle/asn1/x509/CertificateList;
    const/4 v0, 0x0

    .local v0, "idx":I
    :goto_11
    array-length v2, v1

    if-ge v0, v2, :cond_7

    .line 108
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 109
    invoke-virtual {v2, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 108
    invoke-static {v2}, Lorg/spongycastle/asn1/x509/CertificateList;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CertificateList;

    move-result-object v2

    aput-object v2, v1, v0

    .line 106
    add-int/lit8 v0, v0, 0x1

    goto :goto_11
.end method

.method public getOcspVals()[Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;
    .registers 4

    .prologue
    .line 116
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v2, :cond_8

    .line 118
    const/4 v2, 0x0

    new-array v1, v2, [Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;

    .line 126
    :cond_7
    return-object v1

    .line 120
    :cond_8
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;

    .line 121
    .local v1, "result":[Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;
    const/4 v0, 0x0

    .local v0, "idx":I
    :goto_11
    array-length v2, v1

    if-ge v0, v2, :cond_7

    .line 123
    iget-object v2, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 124
    invoke-virtual {v2, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 123
    invoke-static {v2}, Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/BasicOCSPResponse;

    move-result-object v2

    aput-object v2, v1, v0

    .line 121
    add-int/lit8 v0, v0, 0x1

    goto :goto_11
.end method

.method public getOtherRevVals()Lorg/spongycastle/asn1/esf/OtherRevVals;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->otherRevVals:Lorg/spongycastle/asn1/esf/OtherRevVals;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 136
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 137
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_15

    .line 139
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->crlVals:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 141
    :cond_15
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_23

    .line 143
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->ocspVals:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v1, v4, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 145
    :cond_23
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->otherRevVals:Lorg/spongycastle/asn1/esf/OtherRevVals;

    if-eqz v1, :cond_36

    .line 147
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x2

    iget-object v3, p0, Lorg/spongycastle/asn1/esf/RevocationValues;->otherRevVals:Lorg/spongycastle/asn1/esf/OtherRevVals;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/esf/OtherRevVals;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 149
    :cond_36
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
