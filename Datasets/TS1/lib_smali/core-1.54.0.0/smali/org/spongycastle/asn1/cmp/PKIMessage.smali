.class public Lorg/spongycastle/asn1/cmp/PKIMessage;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "PKIMessage.java"


# instance fields
.field private body:Lorg/spongycastle/asn1/cmp/PKIBody;

.field private extraCerts:Lorg/spongycastle/asn1/ASN1Sequence;

.field private header:Lorg/spongycastle/asn1/cmp/PKIHeader;

.field private protection:Lorg/spongycastle/asn1/DERBitString;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 6
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v3, 0x1

    .line 24
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 25
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 27
    .local v0, "en":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/cmp/PKIHeader;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIHeader;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->header:Lorg/spongycastle/asn1/cmp/PKIHeader;

    .line 28
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/cmp/PKIBody;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIBody;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->body:Lorg/spongycastle/asn1/cmp/PKIBody;

    .line 30
    :goto_1c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 32
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 34
    .local v1, "tObj":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v2

    if-nez v2, :cond_35

    .line 36
    invoke-static {v1, v3}, Lorg/spongycastle/asn1/DERBitString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/DERBitString;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->protection:Lorg/spongycastle/asn1/DERBitString;

    goto :goto_1c

    .line 40
    :cond_35
    invoke-static {v1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->extraCerts:Lorg/spongycastle/asn1/ASN1Sequence;

    goto :goto_1c

    .line 43
    .end local v1    # "tObj":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_3c
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cmp/PKIHeader;Lorg/spongycastle/asn1/cmp/PKIBody;)V
    .registers 4
    .param p1, "header"    # Lorg/spongycastle/asn1/cmp/PKIHeader;
    .param p2, "body"    # Lorg/spongycastle/asn1/cmp/PKIBody;

    .prologue
    const/4 v0, 0x0

    .line 99
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/spongycastle/asn1/cmp/PKIMessage;-><init>(Lorg/spongycastle/asn1/cmp/PKIHeader;Lorg/spongycastle/asn1/cmp/PKIBody;Lorg/spongycastle/asn1/DERBitString;[Lorg/spongycastle/asn1/cmp/CMPCertificate;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cmp/PKIHeader;Lorg/spongycastle/asn1/cmp/PKIBody;Lorg/spongycastle/asn1/DERBitString;)V
    .registers 5
    .param p1, "header"    # Lorg/spongycastle/asn1/cmp/PKIHeader;
    .param p2, "body"    # Lorg/spongycastle/asn1/cmp/PKIBody;
    .param p3, "protection"    # Lorg/spongycastle/asn1/DERBitString;

    .prologue
    .line 92
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/spongycastle/asn1/cmp/PKIMessage;-><init>(Lorg/spongycastle/asn1/cmp/PKIHeader;Lorg/spongycastle/asn1/cmp/PKIBody;Lorg/spongycastle/asn1/DERBitString;[Lorg/spongycastle/asn1/cmp/CMPCertificate;)V

    .line 93
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cmp/PKIHeader;Lorg/spongycastle/asn1/cmp/PKIBody;Lorg/spongycastle/asn1/DERBitString;[Lorg/spongycastle/asn1/cmp/CMPCertificate;)V
    .registers 8
    .param p1, "header"    # Lorg/spongycastle/asn1/cmp/PKIHeader;
    .param p2, "body"    # Lorg/spongycastle/asn1/cmp/PKIBody;
    .param p3, "protection"    # Lorg/spongycastle/asn1/DERBitString;
    .param p4, "extraCerts"    # [Lorg/spongycastle/asn1/cmp/CMPCertificate;

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->header:Lorg/spongycastle/asn1/cmp/PKIHeader;

    .line 74
    iput-object p2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->body:Lorg/spongycastle/asn1/cmp/PKIBody;

    .line 75
    iput-object p3, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->protection:Lorg/spongycastle/asn1/DERBitString;

    .line 76
    if-eqz p4, :cond_23

    .line 78
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 79
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    array-length v2, p4

    if-ge v0, v2, :cond_1c

    .line 81
    aget-object v2, p4, v0

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 83
    :cond_1c
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    iput-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->extraCerts:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 85
    .end local v0    # "i":I
    .end local v1    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_23
    return-void
.end method

.method private addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 6
    .param p1, "v"    # Lorg/spongycastle/asn1/ASN1EncodableVector;
    .param p2, "tagNo"    # I
    .param p3, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 161
    if-eqz p3, :cond_b

    .line 163
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p2, p3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 165
    :cond_b
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIMessage;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 47
    instance-of v0, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;

    if-eqz v0, :cond_7

    .line 49
    check-cast p0, Lorg/spongycastle/asn1/cmp/PKIMessage;

    .line 56
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 51
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 53
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIMessage;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIMessage;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 56
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getBody()Lorg/spongycastle/asn1/cmp/PKIBody;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->body:Lorg/spongycastle/asn1/cmp/PKIBody;

    return-object v0
.end method

.method public getExtraCerts()[Lorg/spongycastle/asn1/cmp/CMPCertificate;
    .registers 4

    .prologue
    .line 119
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->extraCerts:Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v2, :cond_6

    .line 121
    const/4 v1, 0x0

    .line 130
    :cond_5
    return-object v1

    .line 124
    :cond_6
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->extraCerts:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/cmp/CMPCertificate;

    .line 126
    .local v1, "results":[Lorg/spongycastle/asn1/cmp/CMPCertificate;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    array-length v2, v1

    if-ge v0, v2, :cond_5

    .line 128
    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->extraCerts:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v2, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/cmp/CMPCertificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CMPCertificate;

    move-result-object v2

    aput-object v2, v1, v0

    .line 126
    add-int/lit8 v0, v0, 0x1

    goto :goto_f
.end method

.method public getHeader()Lorg/spongycastle/asn1/cmp/PKIHeader;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->header:Lorg/spongycastle/asn1/cmp/PKIHeader;

    return-object v0
.end method

.method public getProtection()Lorg/spongycastle/asn1/DERBitString;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->protection:Lorg/spongycastle/asn1/DERBitString;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 4

    .prologue
    .line 148
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 150
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->header:Lorg/spongycastle/asn1/cmp/PKIHeader;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 151
    iget-object v1, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->body:Lorg/spongycastle/asn1/cmp/PKIBody;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 153
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->protection:Lorg/spongycastle/asn1/DERBitString;

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIMessage;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 154
    const/4 v1, 0x1

    iget-object v2, p0, Lorg/spongycastle/asn1/cmp/PKIMessage;->extraCerts:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/asn1/cmp/PKIMessage;->addOptional(Lorg/spongycastle/asn1/ASN1EncodableVector;ILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 156
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
