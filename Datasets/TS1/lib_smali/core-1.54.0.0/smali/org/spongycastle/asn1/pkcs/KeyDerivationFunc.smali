.class public Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "KeyDerivationFunc.java"


# instance fields
.field private algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 4
    .param p1, "objectId"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "parameters"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 19
    new-instance v0, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-direct {v0, p1, p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 20
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 3
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 25
    invoke-static {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 26
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 30
    instance-of v0, p0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;

    if-eqz v0, :cond_7

    .line 32
    check-cast p0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;

    .line 39
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 34
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 36
    new-instance v0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 39
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    return-object v0
.end method

.method public getParameters()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/KeyDerivationFunc;->algId:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
