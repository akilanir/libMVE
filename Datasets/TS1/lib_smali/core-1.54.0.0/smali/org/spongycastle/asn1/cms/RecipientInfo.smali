.class public Lorg/spongycastle/asn1/cms/RecipientInfo;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "RecipientInfo.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field info:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Primitive;)V
    .registers 2
    .param p1, "info"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 63
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 64
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/KEKRecipientInfo;)V
    .registers 5
    .param p1, "info"    # Lorg/spongycastle/asn1/cms/KEKRecipientInfo;

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 46
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 47
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/KeyAgreeRecipientInfo;)V
    .registers 5
    .param p1, "info"    # Lorg/spongycastle/asn1/cms/KeyAgreeRecipientInfo;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/KeyTransRecipientInfo;)V
    .registers 2
    .param p1, "info"    # Lorg/spongycastle/asn1/cms/KeyTransRecipientInfo;

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 35
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/OtherRecipientInfo;)V
    .registers 5
    .param p1, "info"    # Lorg/spongycastle/asn1/cms/OtherRecipientInfo;

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 58
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 59
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/PasswordRecipientInfo;)V
    .registers 5
    .param p1, "info"    # Lorg/spongycastle/asn1/cms/PasswordRecipientInfo;

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 53
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/RecipientInfo;
    .registers 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 84
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;

    if-eqz v0, :cond_9

    .line 86
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/cms/RecipientInfo;

    .line 94
    .end local p0    # "o":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 88
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_16

    .line 90
    new-instance v0, Lorg/spongycastle/asn1/cms/RecipientInfo;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/RecipientInfo;-><init>(Lorg/spongycastle/asn1/ASN1Primitive;)V

    move-object p0, v0

    goto :goto_8

    .line 92
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_16
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_23

    .line 94
    new-instance v0, Lorg/spongycastle/asn1/cms/RecipientInfo;

    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cms/RecipientInfo;-><init>(Lorg/spongycastle/asn1/ASN1Primitive;)V

    move-object p0, v0

    goto :goto_8

    .line 97
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object in factory: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 98
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

.method private getKEKInfo(Lorg/spongycastle/asn1/ASN1TaggedObject;)Lorg/spongycastle/asn1/cms/KEKRecipientInfo;
    .registers 3
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    .line 156
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 158
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lorg/spongycastle/asn1/cms/KEKRecipientInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/KEKRecipientInfo;

    move-result-object v0

    .line 162
    :goto_b
    return-object v0

    :cond_c
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/spongycastle/asn1/cms/KEKRecipientInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/KEKRecipientInfo;

    move-result-object v0

    goto :goto_b
.end method


# virtual methods
.method public getInfo()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 132
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v1, v1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v1, :cond_2e

    .line 134
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 136
    .local v0, "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v1

    packed-switch v1, :pswitch_data_36

    .line 147
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "unknown tag"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 139
    :pswitch_1a
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/KeyAgreeRecipientInfo;

    move-result-object v1

    .line 151
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :goto_1e
    return-object v1

    .line 141
    .restart local v0    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :pswitch_1f
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/cms/RecipientInfo;->getKEKInfo(Lorg/spongycastle/asn1/ASN1TaggedObject;)Lorg/spongycastle/asn1/cms/KEKRecipientInfo;

    move-result-object v1

    goto :goto_1e

    .line 143
    :pswitch_24
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/cms/PasswordRecipientInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/PasswordRecipientInfo;

    move-result-object v1

    goto :goto_1e

    .line 145
    :pswitch_29
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/cms/OtherRecipientInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/OtherRecipientInfo;

    move-result-object v1

    goto :goto_1e

    .line 151
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_2e
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-static {v1}, Lorg/spongycastle/asn1/cms/KeyTransRecipientInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/KeyTransRecipientInfo;

    move-result-object v1

    goto :goto_1e

    .line 136
    nop

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_1f
        :pswitch_24
        :pswitch_29
    .end packed-switch
.end method

.method public getVersion()Lorg/spongycastle/asn1/ASN1Integer;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 103
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v1, v1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v1, :cond_3d

    .line 105
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 107
    .local v0, "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v1

    packed-switch v1, :pswitch_data_48

    .line 118
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "unknown tag"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 110
    :pswitch_1a
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/KeyAgreeRecipientInfo;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/cms/KeyAgreeRecipientInfo;->getVersion()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    .line 122
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :goto_22
    return-object v1

    .line 112
    .restart local v0    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :pswitch_23
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/cms/RecipientInfo;->getKEKInfo(Lorg/spongycastle/asn1/ASN1TaggedObject;)Lorg/spongycastle/asn1/cms/KEKRecipientInfo;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/cms/KEKRecipientInfo;->getVersion()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    goto :goto_22

    .line 114
    :pswitch_2c
    invoke-static {v0, v2}, Lorg/spongycastle/asn1/cms/PasswordRecipientInfo;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/PasswordRecipientInfo;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/cms/PasswordRecipientInfo;->getVersion()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    goto :goto_22

    .line 116
    :pswitch_35
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    goto :goto_22

    .line 122
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_3d
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-static {v1}, Lorg/spongycastle/asn1/cms/KeyTransRecipientInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/KeyTransRecipientInfo;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/cms/KeyTransRecipientInfo;->getVersion()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    goto :goto_22

    .line 107
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_23
        :pswitch_2c
        :pswitch_35
    .end packed-switch
.end method

.method public isTagged()Z
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/RecipientInfo;->info:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
