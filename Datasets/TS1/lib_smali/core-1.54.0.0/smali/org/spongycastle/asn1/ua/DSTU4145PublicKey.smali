.class public Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DSTU4145PublicKey.java"


# instance fields
.field private pubKey:Lorg/spongycastle/asn1/ASN1OctetString;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .registers 2
    .param p1, "ocStr"    # Lorg/spongycastle/asn1/ASN1OctetString;

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;->pubKey:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECPoint;)V
    .registers 4
    .param p1, "pubKey"    # Lorg/spongycastle/math/ec/ECPoint;

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 18
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-static {p1}, Lorg/spongycastle/asn1/ua/DSTU4145PointEncoder;->encodePoint(Lorg/spongycastle/math/ec/ECPoint;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;->pubKey:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 19
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 28
    instance-of v0, p0, Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;

    if-eqz v0, :cond_7

    .line 30
    check-cast p0, Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;

    .line 38
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 33
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 35
    new-instance v0, Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    move-object p0, v0

    goto :goto_6

    .line 38
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/spongycastle/asn1/ua/DSTU4145PublicKey;->pubKey:Lorg/spongycastle/asn1/ASN1OctetString;

    return-object v0
.end method
