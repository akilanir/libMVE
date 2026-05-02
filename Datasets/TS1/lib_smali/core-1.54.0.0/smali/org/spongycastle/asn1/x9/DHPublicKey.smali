.class public Lorg/spongycastle/asn1/x9/DHPublicKey;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DHPublicKey.java"


# instance fields
.field private y:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "y"    # Ljava/math/BigInteger;

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 71
    if-nez p1, :cond_d

    .line 73
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'y\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_d
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x9/DHPublicKey;->y:Lorg/spongycastle/asn1/ASN1Integer;

    .line 77
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Integer;)V
    .registers 4
    .param p1, "y"    # Lorg/spongycastle/asn1/ASN1Integer;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 56
    if-nez p1, :cond_d

    .line 58
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'y\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_d
    iput-object p1, p0, Lorg/spongycastle/asn1/x9/DHPublicKey;->y:Lorg/spongycastle/asn1/ASN1Integer;

    .line 62
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x9/DHPublicKey;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 41
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/x9/DHPublicKey;

    if-eqz v0, :cond_9

    .line 43
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/x9/DHPublicKey;

    .line 48
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 46
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v0, :cond_16

    .line 48
    new-instance v0, Lorg/spongycastle/asn1/x9/DHPublicKey;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Integer;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x9/DHPublicKey;-><init>(Lorg/spongycastle/asn1/ASN1Integer;)V

    move-object p0, v0

    goto :goto_8

    .line 51
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid DHPublicKey: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x9/DHPublicKey;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 30
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x9/DHPublicKey;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x9/DHPublicKey;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getY()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/spongycastle/asn1/x9/DHPublicKey;->y:Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lorg/spongycastle/asn1/x9/DHPublicKey;->y:Lorg/spongycastle/asn1/ASN1Integer;

    return-object v0
.end method
