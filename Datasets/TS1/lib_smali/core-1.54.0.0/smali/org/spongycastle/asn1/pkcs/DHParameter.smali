.class public Lorg/spongycastle/asn1/pkcs/DHParameter;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DHParameter.java"


# instance fields
.field g:Lorg/spongycastle/asn1/ASN1Integer;

.field l:Lorg/spongycastle/asn1/ASN1Integer;

.field p:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;I)V
    .registers 7
    .param p1, "p"    # Ljava/math/BigInteger;
    .param p2, "g"    # Ljava/math/BigInteger;
    .param p3, "l"    # I

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 23
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->p:Lorg/spongycastle/asn1/ASN1Integer;

    .line 24
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->g:Lorg/spongycastle/asn1/ASN1Integer;

    .line 26
    if-eqz p3, :cond_1c

    .line 28
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    int-to-long v1, p3

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->l:Lorg/spongycastle/asn1/ASN1Integer;

    .line 34
    :goto_1b
    return-void

    .line 32
    :cond_1c
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->l:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_1b
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 4
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 55
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 57
    .local v0, "e":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->p:Lorg/spongycastle/asn1/ASN1Integer;

    .line 58
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->g:Lorg/spongycastle/asn1/ASN1Integer;

    .line 60
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 62
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Integer;

    iput-object v1, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->l:Lorg/spongycastle/asn1/ASN1Integer;

    .line 68
    :goto_29
    return-void

    .line 66
    :cond_2a
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->l:Lorg/spongycastle/asn1/ASN1Integer;

    goto :goto_29
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/DHParameter;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 39
    instance-of v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;

    if-eqz v0, :cond_7

    .line 41
    check-cast p0, Lorg/spongycastle/asn1/pkcs/DHParameter;

    .line 49
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 44
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 46
    new-instance v0, Lorg/spongycastle/asn1/pkcs/DHParameter;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/pkcs/DHParameter;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 49
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getG()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->g:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getL()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->l:Lorg/spongycastle/asn1/ASN1Integer;

    if-nez v0, :cond_6

    .line 84
    const/4 v0, 0x0

    .line 87
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->l:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_5
.end method

.method public getP()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->p:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 92
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 94
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->p:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 95
    iget-object v1, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->g:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 97
    invoke-virtual {p0}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getL()Ljava/math/BigInteger;

    move-result-object v1

    if-eqz v1, :cond_1a

    .line 99
    iget-object v1, p0, Lorg/spongycastle/asn1/pkcs/DHParameter;->l:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 102
    :cond_1a
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
