.class public Lorg/spongycastle/jce/ECNamedCurveTable;
.super Ljava/lang/Object;
.source "ECNamedCurveTable.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNames()Ljava/util/Enumeration;
    .registers 1

    .prologue
    .line 74
    invoke-static {}, Lorg/spongycastle/asn1/x9/ECNamedCurveTable;->getNames()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public static getParameterSpec(Ljava/lang/String;)Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;
    .registers 9
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-static {p0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v7

    .line 25
    .local v7, "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    if-nez v7, :cond_20

    .line 29
    :try_start_6
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    :try_end_e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_e} :catch_41

    move-result-object v7

    .line 36
    :goto_f
    if-nez v7, :cond_20

    .line 38
    invoke-static {p0}, Lorg/spongycastle/asn1/x9/ECNamedCurveTable;->getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v7

    .line 39
    if-nez v7, :cond_20

    .line 43
    :try_start_17
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/spongycastle/asn1/x9/ECNamedCurveTable;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    :try_end_1f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_17 .. :try_end_1f} :catch_3f

    move-result-object v7

    .line 53
    :cond_20
    :goto_20
    if-nez v7, :cond_24

    .line 55
    const/4 v0, 0x0

    .line 64
    :goto_23
    return-object v0

    .line 58
    :cond_24
    new-instance v0, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;

    .line 60
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    .line 61
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    .line 62
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getN()Ljava/math/BigInteger;

    move-result-object v4

    .line 63
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getH()Ljava/math/BigInteger;

    move-result-object v5

    .line 64
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getSeed()[B

    move-result-object v6

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;-><init>(Ljava/lang/String;Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    goto :goto_23

    .line 45
    :catch_3f
    move-exception v0

    goto :goto_20

    .line 31
    :catch_41
    move-exception v0

    goto :goto_f
.end method
