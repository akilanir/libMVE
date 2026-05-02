.class public Lorg/spongycastle/asn1/cms/Evidence;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "Evidence.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private tstEvidence:Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V
    .registers 3
    .param p1, "tagged"    # Lorg/spongycastle/asn1/ASN1TaggedObject;

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 34
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v0

    if-nez v0, :cond_10

    .line 36
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/Evidence;->tstEvidence:Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;

    .line 38
    :cond_10
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;)V
    .registers 2
    .param p1, "tstEvidence"    # Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/spongycastle/asn1/cms/Evidence;->tstEvidence:Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;

    .line 30
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/Evidence;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 54
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/cms/Evidence;

    if-eqz v0, :cond_9

    .line 56
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/cms/Evidence;

    .line 60
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 58
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_18

    .line 60
    new-instance v0, Lorg/spongycastle/asn1/cms/Evidence;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/Evidence;-><init>(Lorg/spongycastle/asn1/ASN1TaggedObject;)V

    move-object p0, v0

    goto :goto_8

    .line 63
    :cond_18
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unknown object in getInstance"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getTstEvidence()Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/Evidence;->tstEvidence:Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 73
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/Evidence;->tstEvidence:Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;

    if-eqz v0, :cond_d

    .line 75
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    iget-object v1, p0, Lorg/spongycastle/asn1/cms/Evidence;->tstEvidence:Lorg/spongycastle/asn1/cms/TimeStampTokenEvidence;

    invoke-direct {v0, v2, v2, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 78
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method
