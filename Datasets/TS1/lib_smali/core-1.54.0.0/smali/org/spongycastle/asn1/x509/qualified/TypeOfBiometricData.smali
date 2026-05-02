.class public Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "TypeOfBiometricData.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# static fields
.field public static final HANDWRITTEN_SIGNATURE:I = 0x1

.field public static final PICTURE:I


# instance fields
.field obj:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(I)V
    .registers 5
    .param p1, "predefinedBiometricType"    # I

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 56
    if-eqz p1, :cond_8

    const/4 v0, 0x1

    if-ne p1, v0, :cond_11

    .line 58
    :cond_8
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    int-to-long v1, p1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 64
    return-void

    .line 62
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknow PredefinedBiometricType : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .registers 2
    .param p1, "BiometricDataID"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 67
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 69
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 33
    if-eqz p0, :cond_6

    instance-of v3, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    if-eqz v3, :cond_9

    .line 35
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 48
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 38
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v3, p0, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v3, :cond_1f

    .line 40
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    .line 41
    .local v2, "predefinedBiometricTypeObj":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    .line 43
    .local v1, "predefinedBiometricType":I
    new-instance p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;-><init>(I)V

    goto :goto_8

    .line 45
    .end local v1    # "predefinedBiometricType":I
    .end local v2    # "predefinedBiometricTypeObj":Lorg/spongycastle/asn1/ASN1Integer;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1f
    instance-of v3, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v3, :cond_2d

    .line 47
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    .line 48
    .local v0, "BiometricDataID":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    new-instance p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    goto :goto_8

    .line 51
    .end local v0    # "BiometricDataID":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2d
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "unknown object in getInstance"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public getBiometricDataOid()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method

.method public getPredefinedBiometricType()I
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    return v0
.end method

.method public isPredefined()Z
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/ASN1Integer;

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
