.class public Lorg/spongycastle/asn1/x509/PolicyConstraints;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "PolicyConstraints.java"


# instance fields
.field private inhibitPolicyMapping:Ljava/math/BigInteger;

.field private requireExplicitPolicyMapping:Ljava/math/BigInteger;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V
    .registers 3
    .param p1, "requireExplicitPolicyMapping"    # Ljava/math/BigInteger;
    .param p2, "inhibitPolicyMapping"    # Ljava/math/BigInteger;

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->requireExplicitPolicyMapping:Ljava/math/BigInteger;

    .line 35
    iput-object p2, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->inhibitPolicyMapping:Ljava/math/BigInteger;

    .line 36
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 7
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v4, 0x0

    .line 39
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eq v0, v2, :cond_40

    .line 42
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v1

    .line 44
    .local v1, "to":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v2

    if-nez v2, :cond_26

    .line 46
    invoke-static {v1, v4}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->requireExplicitPolicyMapping:Ljava/math/BigInteger;

    .line 40
    :goto_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 48
    :cond_26
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_38

    .line 50
    invoke-static {v1, v4}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->inhibitPolicyMapping:Ljava/math/BigInteger;

    goto :goto_23

    .line 54
    :cond_38
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unknown tag encountered."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 57
    .end local v1    # "to":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_40
    return-void
.end method

.method public static fromExtensions(Lorg/spongycastle/asn1/x509/Extensions;)Lorg/spongycastle/asn1/x509/PolicyConstraints;
    .registers 2
    .param p0, "extensions"    # Lorg/spongycastle/asn1/x509/Extensions;

    .prologue
    .line 77
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->policyConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/x509/Extensions;->getExtensionParsedValue(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/PolicyConstraints;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyConstraints;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyConstraints;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 62
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;

    if-eqz v0, :cond_7

    .line 64
    check-cast p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;

    .line 72
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 67
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 69
    new-instance v0, Lorg/spongycastle/asn1/x509/PolicyConstraints;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/PolicyConstraints;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 72
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getInhibitPolicyMapping()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->inhibitPolicyMapping:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getRequireExplicitPolicyMapping()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->requireExplicitPolicyMapping:Ljava/math/BigInteger;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6

    .prologue
    .line 92
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 94
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->requireExplicitPolicyMapping:Ljava/math/BigInteger;

    if-eqz v1, :cond_19

    .line 96
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x0

    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    iget-object v4, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->requireExplicitPolicyMapping:Ljava/math/BigInteger;

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 99
    :cond_19
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->inhibitPolicyMapping:Ljava/math/BigInteger;

    if-eqz v1, :cond_2d

    .line 101
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x1

    new-instance v3, Lorg/spongycastle/asn1/ASN1Integer;

    iget-object v4, p0, Lorg/spongycastle/asn1/x509/PolicyConstraints;->inhibitPolicyMapping:Ljava/math/BigInteger;

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 104
    :cond_2d
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
