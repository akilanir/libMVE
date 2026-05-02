.class public Lorg/spongycastle/asn1/x509/CertPolicyId;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "CertPolicyId.java"


# instance fields
.field private id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .registers 2
    .param p1, "id"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/CertPolicyId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 32
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/CertPolicyId;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 36
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/CertPolicyId;

    if-eqz v0, :cond_7

    .line 38
    check-cast p0, Lorg/spongycastle/asn1/x509/CertPolicyId;

    .line 45
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 40
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 42
    new-instance v0, Lorg/spongycastle/asn1/x509/CertPolicyId;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/CertPolicyId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    move-object p0, v0

    goto :goto_6

    .line 45
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/CertPolicyId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/CertPolicyId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method
