.class public Lorg/spongycastle/asn1/ocsp/CertStatus;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "CertStatus.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private tagNo:I

.field private value:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->tagNo:I

    .line 24
    sget-object v0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 25
    return-void
.end method

.method public constructor <init>(ILorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 3
    .param p1, "tagNo"    # I
    .param p2, "value"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 38
    iput p1, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->tagNo:I

    .line 39
    iput-object p2, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .registers 3
    .param p1, "choice"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 45
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->tagNo:I

    .line 47
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    packed-switch v0, :pswitch_data_24

    .line 58
    :goto_10
    return-void

    .line 50
    :pswitch_11
    sget-object v0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_10

    .line 53
    :pswitch_16
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/spongycastle/asn1/ocsp/RevokedInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ocsp/RevokedInfo;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_10

    .line 56
    :pswitch_1e
    sget-object v0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    iput-object v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_10

    .line 47
    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_11
        :pswitch_16
        :pswitch_1e
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ocsp/RevokedInfo;)V
    .registers 3
    .param p1, "info"    # Lorg/spongycastle/asn1/ocsp/RevokedInfo;

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 30
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->tagNo:I

    .line 31
    iput-object p1, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 32
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/CertStatus;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 63
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;

    if-eqz v0, :cond_9

    .line 65
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ocsp/CertStatus;

    .line 69
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 67
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_16

    .line 69
    new-instance v0, Lorg/spongycastle/asn1/ocsp/CertStatus;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ocsp/CertStatus;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    move-object p0, v0

    goto :goto_8

    .line 72
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object in factory: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ocsp/CertStatus;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ocsp/CertStatus;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ocsp/CertStatus;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getStatus()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public getTagNo()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->tagNo:I

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 103
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    iget v2, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->tagNo:I

    iget-object v3, p0, Lorg/spongycastle/asn1/ocsp/CertStatus;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    return-object v0
.end method
