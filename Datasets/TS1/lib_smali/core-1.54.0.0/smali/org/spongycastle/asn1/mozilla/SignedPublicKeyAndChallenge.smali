.class public Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SignedPublicKeyAndChallenge.java"


# instance fields
.field private final pkacSeq:Lorg/spongycastle/asn1/ASN1Sequence;

.field private final pubKeyAndChal:Lorg/spongycastle/asn1/mozilla/PublicKeyAndChallenge;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;->pkacSeq:Lorg/spongycastle/asn1/ASN1Sequence;

    .line 42
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/mozilla/PublicKeyAndChallenge;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/mozilla/PublicKeyAndChallenge;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;->pubKeyAndChal:Lorg/spongycastle/asn1/mozilla/PublicKeyAndChallenge;

    .line 43
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 27
    instance-of v0, p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;

    if-eqz v0, :cond_7

    .line 29
    check-cast p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;

    .line 36
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 31
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 33
    new-instance v0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 36
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getPublicKeyAndChallenge()Lorg/spongycastle/asn1/mozilla/PublicKeyAndChallenge;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;->pubKeyAndChal:Lorg/spongycastle/asn1/mozilla/PublicKeyAndChallenge;

    return-object v0
.end method

.method public getSignature()Lorg/spongycastle/asn1/DERBitString;
    .registers 3

    .prologue
    .line 62
    iget-object v0, p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;->pkacSeq:Lorg/spongycastle/asn1/ASN1Sequence;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/DERBitString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERBitString;

    move-result-object v0

    return-object v0
.end method

.method public getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .registers 3

    .prologue
    .line 57
    iget-object v0, p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;->pkacSeq:Lorg/spongycastle/asn1/ASN1Sequence;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lorg/spongycastle/asn1/mozilla/SignedPublicKeyAndChallenge;->pkacSeq:Lorg/spongycastle/asn1/ASN1Sequence;

    return-object v0
.end method
