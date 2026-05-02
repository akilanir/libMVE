.class public Lorg/spongycastle/asn1/crmf/ProofOfPossession;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "ProofOfPossession.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# static fields
.field public static final TYPE_KEY_AGREEMENT:I = 0x3

.field public static final TYPE_KEY_ENCIPHERMENT:I = 0x2

.field public static final TYPE_RA_VERIFIED:I = 0x0

.field public static final TYPE_SIGNING_KEY:I = 0x1


# instance fields
.field private obj:Lorg/spongycastle/asn1/ASN1Encodable;

.field private tagNo:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    .line 62
    sget-object v0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 63
    return-void
.end method

.method public constructor <init>(ILorg/spongycastle/asn1/crmf/POPOPrivKey;)V
    .registers 3
    .param p1, "type"    # I
    .param p2, "privkey"    # Lorg/spongycastle/asn1/crmf/POPOPrivKey;

    .prologue
    .line 77
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 78
    iput p1, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    .line 79
    iput-object p2, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 80
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .registers 5
    .param p1, "tagged"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 25
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    .line 26
    iget v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    packed-switch v0, :pswitch_data_3e

    .line 39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown tag: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :pswitch_29
    sget-object v0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 41
    :goto_2d
    return-void

    .line 32
    :pswitch_2e
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/spongycastle/asn1/crmf/POPOSigningKey;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/crmf/POPOSigningKey;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_2d

    .line 36
    :pswitch_36
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lorg/spongycastle/asn1/crmf/POPOPrivKey;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/crmf/POPOPrivKey;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    goto :goto_2d

    .line 26
    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_29
        :pswitch_2e
        :pswitch_36
        :pswitch_36
    .end packed-switch
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/crmf/POPOSigningKey;)V
    .registers 3
    .param p1, "poposk"    # Lorg/spongycastle/asn1/crmf/POPOSigningKey;

    .prologue
    .line 67
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 68
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    .line 69
    iput-object p1, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 70
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/ProofOfPossession;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 45
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;

    if-eqz v0, :cond_9

    .line 47
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;

    .line 52
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 50
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_16

    .line 52
    new-instance v0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/crmf/ProofOfPossession;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    move-object p0, v0

    goto :goto_8

    .line 55
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid object: "

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


# virtual methods
.method public getObject()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 106
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    iget v2, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->tagNo:I

    iget-object v3, p0, Lorg/spongycastle/asn1/crmf/ProofOfPossession;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    return-object v0
.end method
