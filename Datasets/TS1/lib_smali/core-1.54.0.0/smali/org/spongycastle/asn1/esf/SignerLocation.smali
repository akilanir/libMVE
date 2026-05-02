.class public Lorg/spongycastle/asn1/esf/SignerLocation;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SignerLocation.java"


# instance fields
.field private countryName:Lorg/spongycastle/asn1/DERUTF8String;

.field private localityName:Lorg/spongycastle/asn1/DERUTF8String;

.field private postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 9
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v6, 0x1

    .line 35
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 36
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 38
    .local v1, "e":Ljava/util/Enumeration;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_6c

    .line 40
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 42
    .local v3, "o":Lorg/spongycastle/asn1/DERTaggedObject;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v4

    packed-switch v4, :pswitch_data_6e

    .line 67
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "illegal tag"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 45
    :pswitch_23
    invoke-static {v3, v6}, Lorg/spongycastle/asn1/x500/DirectoryString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x500/DirectoryString;

    move-result-object v0

    .line 46
    .local v0, "countryNameDirectoryString":Lorg/spongycastle/asn1/x500/DirectoryString;
    new-instance v4, Lorg/spongycastle/asn1/DERUTF8String;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x500/DirectoryString;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERUTF8String;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->countryName:Lorg/spongycastle/asn1/DERUTF8String;

    goto :goto_8

    .line 49
    .end local v0    # "countryNameDirectoryString":Lorg/spongycastle/asn1/x500/DirectoryString;
    :pswitch_33
    invoke-static {v3, v6}, Lorg/spongycastle/asn1/x500/DirectoryString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x500/DirectoryString;

    move-result-object v2

    .line 50
    .local v2, "localityNameDirectoryString":Lorg/spongycastle/asn1/x500/DirectoryString;
    new-instance v4, Lorg/spongycastle/asn1/DERUTF8String;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x500/DirectoryString;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DERUTF8String;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->localityName:Lorg/spongycastle/asn1/DERUTF8String;

    goto :goto_8

    .line 53
    .end local v2    # "localityNameDirectoryString":Lorg/spongycastle/asn1/x500/DirectoryString;
    :pswitch_43
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERTaggedObject;->isExplicit()Z

    move-result v4

    if-eqz v4, :cond_64

    .line 55
    invoke-static {v3, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 61
    :goto_4f
    iget-object v4, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v4, :cond_8

    iget-object v4, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    const/4 v5, 0x6

    if-le v4, v5, :cond_8

    .line 63
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "postal address must contain less than 6 strings"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 59
    :cond_64
    const/4 v4, 0x0

    invoke-static {v3, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    goto :goto_4f

    .line 70
    .end local v3    # "o":Lorg/spongycastle/asn1/DERTaggedObject;
    :cond_6c
    return-void

    .line 42
    nop

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_23
        :pswitch_33
        :pswitch_43
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/DERUTF8String;Lorg/spongycastle/asn1/DERUTF8String;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 6
    .param p1, "countryName"    # Lorg/spongycastle/asn1/DERUTF8String;
    .param p2, "localityName"    # Lorg/spongycastle/asn1/DERUTF8String;
    .param p3, "postalAddress"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 77
    if-eqz p3, :cond_14

    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x6

    if-le v0, v1, :cond_14

    .line 79
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "postal address must contain less than 6 strings"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_14
    if-eqz p1, :cond_20

    .line 84
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DERUTF8String;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/DERUTF8String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERUTF8String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->countryName:Lorg/spongycastle/asn1/DERUTF8String;

    .line 87
    :cond_20
    if-eqz p2, :cond_2c

    .line 89
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERUTF8String;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/DERUTF8String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERUTF8String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->localityName:Lorg/spongycastle/asn1/DERUTF8String;

    .line 92
    :cond_2c
    if-eqz p3, :cond_38

    .line 94
    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Sequence;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 96
    :cond_38
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/SignerLocation;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 101
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/esf/SignerLocation;

    if-eqz v0, :cond_9

    .line 103
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/esf/SignerLocation;

    .line 106
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    new-instance v0, Lorg/spongycastle/asn1/esf/SignerLocation;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/esf/SignerLocation;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8
.end method


# virtual methods
.method public getCountryName()Lorg/spongycastle/asn1/DERUTF8String;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->countryName:Lorg/spongycastle/asn1/DERUTF8String;

    return-object v0
.end method

.method public getLocalityName()Lorg/spongycastle/asn1/DERUTF8String;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->localityName:Lorg/spongycastle/asn1/DERUTF8String;

    return-object v0
.end method

.method public getPostalAddress()Lorg/spongycastle/asn1/ASN1Sequence;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 143
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 145
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->countryName:Lorg/spongycastle/asn1/DERUTF8String;

    if-eqz v1, :cond_15

    .line 147
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->countryName:Lorg/spongycastle/asn1/DERUTF8String;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 150
    :cond_15
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->localityName:Lorg/spongycastle/asn1/DERUTF8String;

    if-eqz v1, :cond_23

    .line 152
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->localityName:Lorg/spongycastle/asn1/DERUTF8String;

    invoke-direct {v1, v4, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 155
    :cond_23
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_32

    .line 157
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x2

    iget-object v3, p0, Lorg/spongycastle/asn1/esf/SignerLocation;->postalAddress:Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 160
    :cond_32
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
