.class public Lorg/spongycastle/asn1/dvcs/DVCSTime;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DVCSTime.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private genTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

.field private time:Ljava/util/Date;

.field private timeStampToken:Lorg/spongycastle/asn1/cms/ContentInfo;


# direct methods
.method public constructor <init>(Ljava/util/Date;)V
    .registers 3
    .param p1, "time"    # Ljava/util/Date;

    .prologue
    .line 32
    new-instance v0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;-><init>(Ljava/util/Date;)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/dvcs/DVCSTime;-><init>(Lorg/spongycastle/asn1/ASN1GeneralizedTime;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1GeneralizedTime;)V
    .registers 2
    .param p1, "genTime"    # Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->genTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/ContentInfo;)V
    .registers 2
    .param p1, "timeStampToken"    # Lorg/spongycastle/asn1/cms/ContentInfo;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->timeStampToken:Lorg/spongycastle/asn1/cms/ContentInfo;

    .line 43
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSTime;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 47
    instance-of v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;

    if-eqz v0, :cond_7

    .line 49
    check-cast p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;

    .line 60
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 51
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v0, :cond_16

    .line 53
    new-instance v0, Lorg/spongycastle/asn1/dvcs/DVCSTime;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/dvcs/DVCSTime;-><init>(Lorg/spongycastle/asn1/ASN1GeneralizedTime;)V

    move-object p0, v0

    goto :goto_6

    .line 55
    :cond_16
    if-eqz p0, :cond_23

    .line 57
    new-instance v0, Lorg/spongycastle/asn1/dvcs/DVCSTime;

    invoke-static {p0}, Lorg/spongycastle/asn1/cms/ContentInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/ContentInfo;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/dvcs/DVCSTime;-><init>(Lorg/spongycastle/asn1/cms/ContentInfo;)V

    move-object p0, v0

    goto :goto_6

    .line 60
    :cond_23
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/dvcs/DVCSTime;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/dvcs/DVCSTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSTime;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getGenTime()Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->genTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    return-object v0
.end method

.method public getTimeStampToken()Lorg/spongycastle/asn1/cms/ContentInfo;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->timeStampToken:Lorg/spongycastle/asn1/cms/ContentInfo;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->genTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v0, :cond_7

    .line 88
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->genTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 96
    :goto_6
    return-object v0

    .line 91
    :cond_7
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->timeStampToken:Lorg/spongycastle/asn1/cms/ContentInfo;

    if-eqz v0, :cond_12

    .line 93
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->timeStampToken:Lorg/spongycastle/asn1/cms/ContentInfo;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/cms/ContentInfo;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    goto :goto_6

    .line 96
    :cond_12
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->genTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v0, :cond_b

    .line 103
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->genTime:Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    :goto_a
    return-object v0

    .line 105
    :cond_b
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->timeStampToken:Lorg/spongycastle/asn1/cms/ContentInfo;

    if-eqz v0, :cond_16

    .line 107
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSTime;->timeStampToken:Lorg/spongycastle/asn1/cms/ContentInfo;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 109
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method
