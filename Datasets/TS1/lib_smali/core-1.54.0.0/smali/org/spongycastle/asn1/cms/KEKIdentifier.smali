.class public Lorg/spongycastle/asn1/cms/KEKIdentifier;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "KEKIdentifier.java"


# instance fields
.field private date:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

.field private keyIdentifier:Lorg/spongycastle/asn1/ASN1OctetString;

.field private other:Lorg/spongycastle/asn1/cms/OtherKeyAttribute;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 4
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v1, 0x1

    .line 44
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 45
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->keyIdentifier:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 47
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    packed-switch v0, :pswitch_data_4c

    .line 66
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid KEKIdentifier"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :pswitch_1c
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v0, :cond_2d

    .line 54
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->date:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 68
    :goto_2c
    :pswitch_2c
    return-void

    .line 58
    :cond_2d
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/cms/OtherKeyAttribute;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->other:Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    goto :goto_2c

    .line 62
    :pswitch_38
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->date:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 63
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/cms/OtherKeyAttribute;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->other:Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    goto :goto_2c

    .line 47
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_1c
        :pswitch_38
    .end packed-switch
.end method

.method public constructor <init>([BLorg/spongycastle/asn1/ASN1GeneralizedTime;Lorg/spongycastle/asn1/cms/OtherKeyAttribute;)V
    .registers 5
    .param p1, "keyIdentifier"    # [B
    .param p2, "date"    # Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .param p3, "other"    # Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 37
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->keyIdentifier:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 38
    iput-object p2, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->date:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 39
    iput-object p3, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->other:Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    .line 40
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/KEKIdentifier;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 102
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;

    if-eqz v0, :cond_9

    .line 104
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;

    .line 109
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 107
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_16

    .line 109
    new-instance v0, Lorg/spongycastle/asn1/cms/KEKIdentifier;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/KEKIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8

    .line 112
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid KEKIdentifier: "

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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/KEKIdentifier;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 83
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/cms/KEKIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/KEKIdentifier;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDate()Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->date:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    return-object v0
.end method

.method public getKeyIdentifier()Lorg/spongycastle/asn1/ASN1OctetString;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->keyIdentifier:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object v0
.end method

.method public getOther()Lorg/spongycastle/asn1/cms/OtherKeyAttribute;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->other:Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 135
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 137
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->keyIdentifier:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 139
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->date:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v1, :cond_13

    .line 141
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->date:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 144
    :cond_13
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->other:Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    if-eqz v1, :cond_1c

    .line 146
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/KEKIdentifier;->other:Lorg/spongycastle/asn1/cms/OtherKeyAttribute;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 149
    :cond_1c
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
