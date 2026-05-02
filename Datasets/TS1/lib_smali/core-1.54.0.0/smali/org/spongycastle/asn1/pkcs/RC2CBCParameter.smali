.class public Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "RC2CBCParameter.java"


# instance fields
.field iv:Lorg/spongycastle/asn1/ASN1OctetString;

.field version:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>(I[B)V
    .registers 6
    .param p1, "parameterVersion"    # I
    .param p2, "iv"    # [B

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 46
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    int-to-long v1, p1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 47
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 48
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 5
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 53
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-ne v0, v2, :cond_17

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 56
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 63
    :goto_16
    return-void

    .line 60
    :cond_17
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Integer;

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 61
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    goto :goto_16
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "iv"    # [B

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 39
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 40
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 23
    instance-of v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;

    if-eqz v0, :cond_7

    .line 25
    check-cast p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;

    .line 32
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 27
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 29
    new-instance v0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 32
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getIV()[B
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    return-object v0
.end method

.method public getRC2ParameterVersion()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    if-nez v0, :cond_6

    .line 69
    const/4 v0, 0x0

    .line 72
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_5
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 82
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 84
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_e

    .line 86
    iget-object v1, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->version:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 89
    :cond_e
    iget-object v1, p0, Lorg/spongycastle/asn1/pkcs/RC2CBCParameter;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 91
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
