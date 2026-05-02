.class public Lorg/spongycastle/asn1/ocsp/ResponseBytes;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "ResponseBytes.java"


# instance fields
.field response:Lorg/spongycastle/asn1/ASN1OctetString;

.field responseType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 3
    .param p1, "responseType"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "response"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 22
    iput-object p1, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->responseType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 23
    iput-object p2, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->response:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->responseType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->response:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 34
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/ResponseBytes;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 46
    instance-of v0, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;

    if-eqz v0, :cond_7

    .line 48
    check-cast p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;

    .line 55
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 50
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 52
    new-instance v0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ocsp/ResponseBytes;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 55
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ocsp/ResponseBytes;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 40
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/ResponseBytes;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getResponse()Lorg/spongycastle/asn1/ASN1OctetString;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->response:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object v0
.end method

.method public getResponseType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->responseType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 78
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 80
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->responseType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 81
    iget-object v1, p0, Lorg/spongycastle/asn1/ocsp/ResponseBytes;->response:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 83
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
