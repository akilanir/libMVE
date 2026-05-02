.class public Lorg/spongycastle/asn1/eac/ECDSAPublicKey;
.super Lorg/spongycastle/asn1/eac/PublicKeyDataObject;
.source "ECDSAPublicKey.java"


# static fields
.field private static final A:I = 0x2

.field private static final B:I = 0x4

.field private static final F:I = 0x40

.field private static final G:I = 0x8

.field private static final P:I = 0x1

.field private static final R:I = 0x10

.field private static final Y:I = 0x20


# instance fields
.field private basePointG:[B

.field private cofactorF:Ljava/math/BigInteger;

.field private firstCoefA:Ljava/math/BigInteger;

.field private options:I

.field private orderOfBasePointR:Ljava/math/BigInteger;

.field private primeModulusP:Ljava/math/BigInteger;

.field private publicPointY:[B

.field private secondCoefB:Ljava/math/BigInteger;

.field private usage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;[BLjava/math/BigInteger;[BI)V
    .registers 11
    .param p1, "usage"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "p"    # Ljava/math/BigInteger;
    .param p3, "a"    # Ljava/math/BigInteger;
    .param p4, "b"    # Ljava/math/BigInteger;
    .param p5, "basePoint"    # [B
    .param p6, "order"    # Ljava/math/BigInteger;
    .param p7, "publicPoint"    # [B
    .param p8, "cofactor"    # I

    .prologue
    .line 112
    invoke-direct {p0}, Lorg/spongycastle/asn1/eac/PublicKeyDataObject;-><init>()V

    .line 113
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->usage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 114
    invoke-direct {p0, p2}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setPrimeModulusP(Ljava/math/BigInteger;)V

    .line 115
    invoke-direct {p0, p3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setFirstCoefA(Ljava/math/BigInteger;)V

    .line 116
    invoke-direct {p0, p4}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setSecondCoefB(Ljava/math/BigInteger;)V

    .line 117
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p5}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setBasePointG(Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 118
    invoke-direct {p0, p6}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setOrderOfBasePointR(Ljava/math/BigInteger;)V

    .line 119
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p7}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setPublicPointY(Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 120
    int-to-long v0, p8

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setCofactorF(Ljava/math/BigInteger;)V

    .line 121
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;[B)V
    .registers 4
    .param p1, "usage"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "ppY"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-direct {p0}, Lorg/spongycastle/asn1/eac/PublicKeyDataObject;-><init>()V

    .line 107
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->usage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 108
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p2}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setPublicPointY(Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 109
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 7
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 52
    invoke-direct {p0}, Lorg/spongycastle/asn1/eac/PublicKeyDataObject;-><init>()V

    .line 53
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 55
    .local v0, "en":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->usage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 57
    iput v4, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 58
    :goto_14
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_8a

    .line 60
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 62
    .local v1, "obj":Ljava/lang/Object;
    instance-of v3, v1, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v3, :cond_82

    move-object v2, v1

    .line 64
    check-cast v2, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 65
    .local v2, "to":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v3

    packed-switch v3, :pswitch_data_a0

    .line 89
    iput v4, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 90
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unknown Object Identifier!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 68
    :pswitch_36
    invoke-static {v2}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/UnsignedInteger;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setPrimeModulusP(Ljava/math/BigInteger;)V

    goto :goto_14

    .line 71
    :pswitch_42
    invoke-static {v2}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/UnsignedInteger;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setFirstCoefA(Ljava/math/BigInteger;)V

    goto :goto_14

    .line 74
    :pswitch_4e
    invoke-static {v2}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/UnsignedInteger;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setSecondCoefB(Ljava/math/BigInteger;)V

    goto :goto_14

    .line 77
    :pswitch_5a
    invoke-static {v2, v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setBasePointG(Lorg/spongycastle/asn1/ASN1OctetString;)V

    goto :goto_14

    .line 80
    :pswitch_62
    invoke-static {v2}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/UnsignedInteger;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setOrderOfBasePointR(Ljava/math/BigInteger;)V

    goto :goto_14

    .line 83
    :pswitch_6e
    invoke-static {v2, v4}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setPublicPointY(Lorg/spongycastle/asn1/ASN1OctetString;)V

    goto :goto_14

    .line 86
    :pswitch_76
    invoke-static {v2}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/UnsignedInteger;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->setCofactorF(Ljava/math/BigInteger;)V

    goto :goto_14

    .line 95
    .end local v2    # "to":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_82
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unknown Object Identifier!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 98
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_8a
    iget v3, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    const/16 v4, 0x20

    if-eq v3, v4, :cond_9e

    iget v3, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    const/16 v4, 0x7f

    if-eq v3, v4, :cond_9e

    .line 100
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "All options must be either present or absent!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 102
    :cond_9e
    return-void

    .line 65
    nop

    :pswitch_data_a0
    .packed-switch 0x1
        :pswitch_36
        :pswitch_42
        :pswitch_4e
        :pswitch_5a
        :pswitch_62
        :pswitch_6e
        :pswitch_76
    .end packed-switch
.end method

.method private setBasePointG(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 4
    .param p1, "basePointG"    # Lorg/spongycastle/asn1/ASN1OctetString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 143
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x8

    if-nez v0, :cond_13

    .line 145
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 146
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->basePointG:[B

    .line 152
    return-void

    .line 150
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Base Point G already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setCofactorF(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "cofactorF"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 169
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_f

    .line 171
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 172
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->cofactorF:Ljava/math/BigInteger;

    .line 178
    return-void

    .line 176
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cofactor F already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setFirstCoefA(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "firstCoefA"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 195
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_f

    .line 197
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 198
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->firstCoefA:Ljava/math/BigInteger;

    .line 204
    return-void

    .line 202
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "First Coef A already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setOrderOfBasePointR(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "orderOfBasePointR"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 221
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x10

    if-nez v0, :cond_f

    .line 223
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 224
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->orderOfBasePointR:Ljava/math/BigInteger;

    .line 230
    return-void

    .line 228
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Order of base point R already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setPrimeModulusP(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "primeModulusP"    # Ljava/math/BigInteger;

    .prologue
    .line 246
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_f

    .line 248
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 249
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->primeModulusP:Ljava/math/BigInteger;

    .line 255
    return-void

    .line 253
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Prime Modulus P already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setPublicPointY(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 4
    .param p1, "publicPointY"    # Lorg/spongycastle/asn1/ASN1OctetString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 272
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x20

    if-nez v0, :cond_13

    .line 274
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 275
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->publicPointY:[B

    .line 281
    return-void

    .line 279
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Public Point Y already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setSecondCoefB(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "secondCoefB"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 298
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_f

    .line 300
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    .line 301
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->secondCoefB:Ljava/math/BigInteger;

    .line 307
    return-void

    .line 305
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Second Coef B already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getASN1EncodableVector(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Z)Lorg/spongycastle/asn1/ASN1EncodableVector;
    .registers 9
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "publicPointOnly"    # Z

    .prologue
    const/4 v5, 0x0

    .line 316
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 317
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 319
    if-nez p2, :cond_51

    .line 321
    new-instance v1, Lorg/spongycastle/asn1/eac/UnsignedInteger;

    const/4 v2, 0x1

    invoke-virtual {p0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getPrimeModulusP()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;-><init>(ILjava/math/BigInteger;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 322
    new-instance v1, Lorg/spongycastle/asn1/eac/UnsignedInteger;

    const/4 v2, 0x2

    invoke-virtual {p0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getFirstCoefA()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;-><init>(ILjava/math/BigInteger;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 323
    new-instance v1, Lorg/spongycastle/asn1/eac/UnsignedInteger;

    const/4 v2, 0x3

    invoke-virtual {p0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getSecondCoefB()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;-><init>(ILjava/math/BigInteger;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 324
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x4

    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getBasePointG()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v1, v5, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 325
    new-instance v1, Lorg/spongycastle/asn1/eac/UnsignedInteger;

    const/4 v2, 0x5

    invoke-virtual {p0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getOrderOfBasePointR()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;-><init>(ILjava/math/BigInteger;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 327
    :cond_51
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v2, 0x6

    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getPublicPointY()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v1, v5, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 328
    if-nez p2, :cond_72

    .line 330
    new-instance v1, Lorg/spongycastle/asn1/eac/UnsignedInteger;

    const/4 v2, 0x7

    invoke-virtual {p0}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getCofactorF()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/eac/UnsignedInteger;-><init>(ILjava/math/BigInteger;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 333
    :cond_72
    return-object v0
.end method

.method public getBasePointG()[B
    .registers 2

    .prologue
    .line 130
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_9

    .line 132
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->basePointG:[B

    .line 136
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getCofactorF()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 156
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_9

    .line 158
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->cofactorF:Ljava/math/BigInteger;

    .line 162
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getFirstCoefA()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 182
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_9

    .line 184
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->firstCoefA:Ljava/math/BigInteger;

    .line 188
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getOrderOfBasePointR()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_9

    .line 210
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->orderOfBasePointR:Ljava/math/BigInteger;

    .line 214
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getPrimeModulusP()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 234
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_9

    .line 236
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->primeModulusP:Ljava/math/BigInteger;

    .line 240
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getPublicPointY()[B
    .registers 2

    .prologue
    .line 259
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_9

    .line 261
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->publicPointY:[B

    .line 265
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getSecondCoefB()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 285
    iget v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->options:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_9

    .line 287
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->secondCoefB:Ljava/math/BigInteger;

    .line 291
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getUsage()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->usage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public hasParameters()Z
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->primeModulusP:Ljava/math/BigInteger;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 4

    .prologue
    .line 338
    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    iget-object v1, p0, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->usage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/spongycastle/asn1/eac/ECDSAPublicKey;->getASN1EncodableVector(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Z)Lorg/spongycastle/asn1/ASN1EncodableVector;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v0
.end method
