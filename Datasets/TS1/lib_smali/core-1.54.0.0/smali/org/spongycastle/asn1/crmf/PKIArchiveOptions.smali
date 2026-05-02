.class public Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "PKIArchiveOptions.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# static fields
.field public static final archiveRemGenPrivKey:I = 0x2

.field public static final encryptedPrivKey:I = 0x0

.field public static final keyGenParameters:I = 0x1


# instance fields
.field private value:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 2
    .param p1, "keyGenParameters"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 62
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .registers 5
    .param p1, "tagged"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 38
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    packed-switch v0, :pswitch_data_42

    .line 50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown tag number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :pswitch_28
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/crmf/EncryptedKey;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/EncryptedKey;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 52
    :goto_32
    return-void

    .line 44
    :pswitch_33
    invoke-static {p1, v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_32

    .line 47
    :pswitch_3a
    invoke-static {p1, v1}, Lorg/spongycastle/asn1/ASN1Boolean;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_32

    .line 38
    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_28
        :pswitch_33
        :pswitch_3a
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/crmf/EncryptedKey;)V
    .registers 2
    .param p1, "encKey"    # Lorg/spongycastle/asn1/crmf/EncryptedKey;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 57
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "archiveRemGenPrivKey"    # Z

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 66
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Boolean;->getInstance(Z)Lorg/spongycastle/asn1/ASN1Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 67
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 24
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;

    if-eqz v0, :cond_9

    .line 26
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;

    .line 30
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 28
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_16

    .line 30
    new-instance v0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    move-object p0, v0

    goto :goto_8

    .line 33
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getType()I
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/crmf/EncryptedKey;

    if-eqz v0, :cond_8

    .line 73
    const/4 v0, 0x0

    .line 81
    :goto_7
    return v0

    .line 76
    :cond_8
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_10

    .line 78
    const/4 v0, 0x1

    goto :goto_7

    .line 81
    :cond_10
    const/4 v0, 0x2

    goto :goto_7
.end method

.method public getValue()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 104
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/crmf/EncryptedKey;

    if-eqz v0, :cond_10

    .line 106
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v1, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v2, v3, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 114
    :goto_f
    return-object v0

    .line 109
    :cond_10
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_1e

    .line 111
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v1, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v3, v2, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_f

    .line 114
    :cond_1e
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x2

    iget-object v2, p0, Lorg/spongycastle/asn1/crmf/PKIArchiveOptions;->value:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v3, v1, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_f
.end method
