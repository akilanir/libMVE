.class public Lorg/spongycastle/asn1/x509/Holder;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "Holder.java"


# static fields
.field public static final V1_CERTIFICATE_HOLDER:I = 0x0

.field public static final V2_CERTIFICATE_HOLDER:I = 0x1


# instance fields
.field baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

.field entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

.field objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

.field private version:I


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 8
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 99
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    iput v5, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 100
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_2b

    .line 102
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad sequence size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 103
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 106
    :cond_2b
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2c
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eq v0, v2, :cond_60

    .line 109
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 108
    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v1

    .line 111
    .local v1, "tObj":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v2

    packed-switch v2, :pswitch_data_64

    .line 123
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "unknown tag in Holder"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 114
    :pswitch_49
    invoke-static {v1, v4}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 106
    :goto_4f
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 117
    :pswitch_52
    invoke-static {v1, v4}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    goto :goto_4f

    .line 120
    :pswitch_59
    invoke-static {v1, v4}, Lorg/spongycastle/asn1/x509/ObjectDigestInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    goto :goto_4f

    .line 126
    .end local v1    # "tObj":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_60
    iput v5, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 127
    return-void

    .line 111
    nop

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_49
        :pswitch_52
        :pswitch_59
    .end packed-switch
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .registers 4
    .param p1, "tagObj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    const/4 v1, 0x1

    .line 78
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    iput v1, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 79
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    packed-switch v0, :pswitch_data_26

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unknown tag in Holder"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :pswitch_15
    invoke-static {p1, v1}, Lorg/spongycastle/asn1/x509/IssuerSerial;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/IssuerSerial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 90
    :goto_1b
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 91
    return-void

    .line 85
    :pswitch_1f
    invoke-static {p1, v1}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    goto :goto_1b

    .line 79
    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_15
        :pswitch_1f
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/GeneralNames;)V
    .registers 3
    .param p1, "entityName"    # Lorg/spongycastle/asn1/x509/GeneralNames;

    .prologue
    .line 163
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/GeneralNames;I)V

    .line 164
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/GeneralNames;I)V
    .registers 4
    .param p1, "entityName"    # Lorg/spongycastle/asn1/x509/GeneralNames;
    .param p2, "version"    # I

    .prologue
    .line 174
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 175
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 176
    iput p2, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 177
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/IssuerSerial;)V
    .registers 3
    .param p1, "baseCertificateID"    # Lorg/spongycastle/asn1/x509/IssuerSerial;

    .prologue
    .line 131
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/x509/IssuerSerial;I)V

    .line 132
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/IssuerSerial;I)V
    .registers 4
    .param p1, "baseCertificateID"    # Lorg/spongycastle/asn1/x509/IssuerSerial;
    .param p2, "version"    # I

    .prologue
    .line 141
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 142
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    .line 143
    iput p2, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 144
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/ObjectDigestInfo;)V
    .registers 3
    .param p1, "objectDigestInfo"    # Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    .prologue
    .line 185
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    .line 186
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    .line 187
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Holder;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 56
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/Holder;

    if-eqz v0, :cond_7

    .line 58
    check-cast p0, Lorg/spongycastle/asn1/x509/Holder;

    .line 69
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 60
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_16

    .line 62
    new-instance v0, Lorg/spongycastle/asn1/x509/Holder;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    move-object p0, v0

    goto :goto_6

    .line 64
    :cond_16
    if-eqz p0, :cond_23

    .line 66
    new-instance v0, Lorg/spongycastle/asn1/x509/Holder;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/Holder;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 69
    :cond_23
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getBaseCertificateID()Lorg/spongycastle/asn1/x509/IssuerSerial;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    return-object v0
.end method

.method public getEntityName()Lorg/spongycastle/asn1/x509/GeneralNames;
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    return-object v0
.end method

.method public getObjectDigestInfo()Lorg/spongycastle/asn1/x509/ObjectDigestInfo;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    return-object v0
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 153
    iget v0, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 212
    iget v1, p0, Lorg/spongycastle/asn1/x509/Holder;->version:I

    if-ne v1, v3, :cond_3c

    .line 214
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 216
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    if-eqz v1, :cond_19

    .line 218
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    invoke-direct {v1, v4, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 221
    :cond_19
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    if-eqz v1, :cond_27

    .line 223
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    invoke-direct {v1, v4, v3, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 226
    :cond_27
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    if-eqz v1, :cond_36

    .line 228
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x2

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/Holder;->objectDigestInfo:Lorg/spongycastle/asn1/x509/ObjectDigestInfo;

    invoke-direct {v1, v4, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 231
    :cond_36
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 241
    .end local v0    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :goto_3b
    return-object v1

    .line 235
    :cond_3c
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    if-eqz v1, :cond_48

    .line 237
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->entityName:Lorg/spongycastle/asn1/x509/GeneralNames;

    invoke-direct {v1, v3, v3, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_3b

    .line 241
    :cond_48
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/Holder;->baseCertificateID:Lorg/spongycastle/asn1/x509/IssuerSerial;

    invoke-direct {v1, v3, v4, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_3b
.end method
