.class public Lorg/spongycastle/asn1/cmp/PKIBody;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "PKIBody.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# static fields
.field public static final TYPE_CA_KEY_UPDATE_ANN:I = 0xf

.field public static final TYPE_CERT_ANN:I = 0x10

.field public static final TYPE_CERT_CONFIRM:I = 0x18

.field public static final TYPE_CERT_REP:I = 0x3

.field public static final TYPE_CERT_REQ:I = 0x2

.field public static final TYPE_CONFIRM:I = 0x13

.field public static final TYPE_CRL_ANN:I = 0x12

.field public static final TYPE_CROSS_CERT_REP:I = 0xe

.field public static final TYPE_CROSS_CERT_REQ:I = 0xd

.field public static final TYPE_ERROR:I = 0x17

.field public static final TYPE_GEN_MSG:I = 0x15

.field public static final TYPE_GEN_REP:I = 0x16

.field public static final TYPE_INIT_REP:I = 0x1

.field public static final TYPE_INIT_REQ:I = 0x0

.field public static final TYPE_KEY_RECOVERY_REP:I = 0xa

.field public static final TYPE_KEY_RECOVERY_REQ:I = 0x9

.field public static final TYPE_KEY_UPDATE_REP:I = 0x8

.field public static final TYPE_KEY_UPDATE_REQ:I = 0x7

.field public static final TYPE_NESTED:I = 0x14

.field public static final TYPE_P10_CERT_REQ:I = 0x4

.field public static final TYPE_POLL_REP:I = 0x1a

.field public static final TYPE_POLL_REQ:I = 0x19

.field public static final TYPE_POPO_CHALL:I = 0x5

.field public static final TYPE_POPO_REP:I = 0x6

.field public static final TYPE_REVOCATION_ANN:I = 0x11

.field public static final TYPE_REVOCATION_REP:I = 0xc

.field public static final TYPE_REVOCATION_REQ:I = 0xb


# instance fields
.field private body:Lorg/spongycastle/asn1/ASN1Encodable;

.field private tagNo:I


# direct methods
.method public constructor <init>(ILorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 4
    .param p1, "type"    # I
    .param p2, "content"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 77
    iput p1, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->tagNo:I

    .line 78
    invoke-static {p1, p2}, Lorg/spongycastle/asn1/cmp/PKIBody;->getBodyForType(ILorg/spongycastle/asn1/ASN1Encodable;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->body:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 79
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .registers 4
    .param p1, "tagged"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    .line 63
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 64
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->tagNo:I

    .line 65
    iget v0, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->tagNo:I

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/spongycastle/asn1/cmp/PKIBody;->getBodyForType(ILorg/spongycastle/asn1/ASN1Encodable;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->body:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 66
    return-void
.end method

.method private static getBodyForType(ILorg/spongycastle/asn1/ASN1Encodable;)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 5
    .param p0, "type"    # I
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 85
    packed-switch p0, :pswitch_data_a4

    .line 142
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown tag number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :pswitch_1c
    invoke-static {p1}, Lorg/spongycastle/asn1/crmf/CertReqMessages;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/CertReqMessages;

    move-result-object v0

    .line 140
    :goto_20
    return-object v0

    .line 90
    :pswitch_21
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CertRepMessage;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CertRepMessage;

    move-result-object v0

    goto :goto_20

    .line 92
    :pswitch_26
    invoke-static {p1}, Lorg/spongycastle/asn1/crmf/CertReqMessages;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/CertReqMessages;

    move-result-object v0

    goto :goto_20

    .line 94
    :pswitch_2b
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CertRepMessage;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CertRepMessage;

    move-result-object v0

    goto :goto_20

    .line 96
    :pswitch_30
    invoke-static {p1}, Lorg/spongycastle/asn1/pkcs/CertificationRequest;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/CertificationRequest;

    move-result-object v0

    goto :goto_20

    .line 98
    :pswitch_35
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/POPODecKeyChallContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/POPODecKeyChallContent;

    move-result-object v0

    goto :goto_20

    .line 100
    :pswitch_3a
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/POPODecKeyRespContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/POPODecKeyRespContent;

    move-result-object v0

    goto :goto_20

    .line 102
    :pswitch_3f
    invoke-static {p1}, Lorg/spongycastle/asn1/crmf/CertReqMessages;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/CertReqMessages;

    move-result-object v0

    goto :goto_20

    .line 104
    :pswitch_44
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CertRepMessage;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CertRepMessage;

    move-result-object v0

    goto :goto_20

    .line 106
    :pswitch_49
    invoke-static {p1}, Lorg/spongycastle/asn1/crmf/CertReqMessages;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/CertReqMessages;

    move-result-object v0

    goto :goto_20

    .line 108
    :pswitch_4e
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/KeyRecRepContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/KeyRecRepContent;

    move-result-object v0

    goto :goto_20

    .line 110
    :pswitch_53
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/RevReqContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/RevReqContent;

    move-result-object v0

    goto :goto_20

    .line 112
    :pswitch_58
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/RevRepContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/RevRepContent;

    move-result-object v0

    goto :goto_20

    .line 114
    :pswitch_5d
    invoke-static {p1}, Lorg/spongycastle/asn1/crmf/CertReqMessages;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/crmf/CertReqMessages;

    move-result-object v0

    goto :goto_20

    .line 116
    :pswitch_62
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CertRepMessage;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CertRepMessage;

    move-result-object v0

    goto :goto_20

    .line 118
    :pswitch_67
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CAKeyUpdAnnContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CAKeyUpdAnnContent;

    move-result-object v0

    goto :goto_20

    .line 120
    :pswitch_6c
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CMPCertificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CMPCertificate;

    move-result-object v0

    goto :goto_20

    .line 122
    :pswitch_71
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/RevAnnContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/RevAnnContent;

    move-result-object v0

    goto :goto_20

    .line 124
    :pswitch_76
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CRLAnnContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CRLAnnContent;

    move-result-object v0

    goto :goto_20

    .line 126
    :pswitch_7b
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/PKIConfirmContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIConfirmContent;

    move-result-object v0

    goto :goto_20

    .line 128
    :pswitch_80
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/PKIMessages;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIMessages;

    move-result-object v0

    goto :goto_20

    .line 130
    :pswitch_85
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/GenMsgContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/GenMsgContent;

    move-result-object v0

    goto :goto_20

    .line 132
    :pswitch_8a
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/GenRepContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/GenRepContent;

    move-result-object v0

    goto :goto_20

    .line 134
    :pswitch_8f
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/ErrorMsgContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/ErrorMsgContent;

    move-result-object v0

    goto :goto_20

    .line 136
    :pswitch_94
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/CertConfirmContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CertConfirmContent;

    move-result-object v0

    goto :goto_20

    .line 138
    :pswitch_99
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/PollReqContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PollReqContent;

    move-result-object v0

    goto :goto_20

    .line 140
    :pswitch_9e
    invoke-static {p1}, Lorg/spongycastle/asn1/cmp/PollRepContent;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PollRepContent;

    move-result-object v0

    goto/16 :goto_20

    .line 85
    :pswitch_data_a4
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_21
        :pswitch_26
        :pswitch_2b
        :pswitch_30
        :pswitch_35
        :pswitch_3a
        :pswitch_3f
        :pswitch_44
        :pswitch_49
        :pswitch_4e
        :pswitch_53
        :pswitch_58
        :pswitch_5d
        :pswitch_62
        :pswitch_67
        :pswitch_6c
        :pswitch_71
        :pswitch_76
        :pswitch_7b
        :pswitch_80
        :pswitch_85
        :pswitch_8a
        :pswitch_8f
        :pswitch_94
        :pswitch_99
        :pswitch_9e
    .end packed-switch
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/PKIBody;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 49
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/cmp/PKIBody;

    if-eqz v0, :cond_9

    .line 51
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/cmp/PKIBody;

    .line 56
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 54
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_16

    .line 56
    new-instance v0, Lorg/spongycastle/asn1/cmp/PKIBody;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cmp/PKIBody;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    move-object p0, v0

    goto :goto_8

    .line 59
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
.method public getContent()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->body:Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 148
    iget v0, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->tagNo:I

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    .line 192
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x1

    iget v2, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->tagNo:I

    iget-object v3, p0, Lorg/spongycastle/asn1/cmp/PKIBody;->body:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    return-object v0
.end method
