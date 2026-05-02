.class public Lorg/spongycastle/asn1/ess/ContentIdentifier;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "ContentIdentifier.java"


# instance fields
.field value:Lorg/spongycastle/asn1/ASN1OctetString;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 2
    .param p1, "value"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/spongycastle/asn1/ess/ContentIdentifier;->value:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 34
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "value"    # [B

    .prologue
    .line 42
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/ess/ContentIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 43
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ess/ContentIdentifier;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 15
    instance-of v0, p0, Lorg/spongycastle/asn1/ess/ContentIdentifier;

    if-eqz v0, :cond_7

    .line 17
    check-cast p0, Lorg/spongycastle/asn1/ess/ContentIdentifier;

    .line 24
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 19
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 21
    new-instance v0, Lorg/spongycastle/asn1/ess/ContentIdentifier;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ess/ContentIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    move-object p0, v0

    goto :goto_6

    .line 24
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getValue()Lorg/spongycastle/asn1/ASN1OctetString;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lorg/spongycastle/asn1/ess/ContentIdentifier;->value:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/spongycastle/asn1/ess/ContentIdentifier;->value:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object v0
.end method
