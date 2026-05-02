.class public Lorg/spongycastle/asn1/pkcs/CRLBag;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "CRLBag.java"


# instance fields
.field private crlId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private crlValue:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 3
    .param p1, "crlId"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "crlValue"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 46
    iput-object p1, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 47
    iput-object p2, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlValue:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 48
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 24
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 25
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/DERTaggedObject;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERTaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlValue:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 26
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/CRLBag;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 30
    instance-of v0, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;

    if-eqz v0, :cond_7

    .line 32
    check-cast p0, Lorg/spongycastle/asn1/pkcs/CRLBag;

    .line 39
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 34
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 36
    new-instance v0, Lorg/spongycastle/asn1/pkcs/CRLBag;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/pkcs/CRLBag;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 39
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getCrlId()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getCrlValue()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlValue:Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 78
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 80
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 81
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/spongycastle/asn1/pkcs/CRLBag;->crlValue:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 83
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
