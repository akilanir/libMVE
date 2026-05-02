.class Lorg/spongycastle/jcajce/provider/asymmetric/ec/ECUtils;
.super Ljava/lang/Object;
.source "ECUtils.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getDomainParametersFromGenSpec(Ljava/security/spec/ECGenParameterSpec;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    .registers 2
    .param p0, "genSpec"    # Ljava/security/spec/ECGenParameterSpec;

    .prologue
    .line 13
    invoke-virtual {p0}, Ljava/security/spec/ECGenParameterSpec;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/ECUtils;->getDomainParametersFromName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    return-object v0
.end method

.method static getDomainParametersFromName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    .registers 6
    .param p0, "curveName"    # Ljava/lang/String;

    .prologue
    .line 21
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-lt v3, v4, :cond_1c

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x32

    if-gt v3, v4, :cond_1c

    .line 23
    new-instance v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v2, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 24
    .local v2, "oidID":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getNamedCurveByOid(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .line 43
    .end local v2    # "oidID":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .local v0, "domainParameters":Lorg/spongycastle/asn1/x9/X9ECParameters;
    :goto_1b
    return-object v0

    .line 28
    .end local v0    # "domainParameters":Lorg/spongycastle/asn1/x9/X9ECParameters;
    :cond_1c
    const/16 v3, 0x20

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-lez v3, :cond_35

    .line 30
    const/16 v3, 0x20

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 31
    invoke-static {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getNamedCurveByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .restart local v0    # "domainParameters":Lorg/spongycastle/asn1/x9/X9ECParameters;
    goto :goto_1b

    .line 35
    .end local v0    # "domainParameters":Lorg/spongycastle/asn1/x9/X9ECParameters;
    :cond_35
    invoke-static {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getNamedCurveByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_38} :catch_3a

    move-result-object v0

    .restart local v0    # "domainParameters":Lorg/spongycastle/asn1/x9/X9ECParameters;
    goto :goto_1b

    .line 39
    .end local v0    # "domainParameters":Lorg/spongycastle/asn1/x9/X9ECParameters;
    :catch_3a
    move-exception v1

    .line 41
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    invoke-static {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getNamedCurveByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v0

    .restart local v0    # "domainParameters":Lorg/spongycastle/asn1/x9/X9ECParameters;
    goto :goto_1b
.end method
