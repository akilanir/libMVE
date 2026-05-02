.class public Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;
.super Ljava/lang/Object;
.source "BCECPublicKey.java"

# interfaces
.implements Ljava/security/interfaces/ECPublicKey;
.implements Lorg/spongycastle/jce/interfaces/ECPublicKey;
.implements Lorg/spongycastle/jce/interfaces/ECPointEncoder;


# static fields
.field static final serialVersionUID:J = 0x219f7a8aa3ea4824L


# instance fields
.field private algorithm:Ljava/lang/String;

.field private transient configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

.field private transient ecSpec:Ljava/security/spec/ECParameterSpec;

.field private transient q:Lorg/spongycastle/math/ec/ECPoint;

.field private withCompression:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/security/spec/ECPublicKeySpec;Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;)V
    .registers 7
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "spec"    # Ljava/security/spec/ECPublicKeySpec;
    .param p3, "configuration"    # Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v0, "EC"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 67
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 68
    invoke-virtual {p2}, Ljava/security/spec/ECPublicKeySpec;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 69
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    invoke-virtual {p2}, Ljava/security/spec/ECPublicKeySpec;->getW()Ljava/security/spec/ECPoint;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertPoint(Ljava/security/spec/ECParameterSpec;Ljava/security/spec/ECPoint;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 70
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 71
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;)V
    .registers 5
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "info"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .param p3, "configuration"    # Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .prologue
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v0, "EC"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 185
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 186
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 187
    invoke-direct {p0, p2}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->populateFromPubKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V

    .line 188
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/crypto/params/ECPublicKeyParameters;Ljava/security/spec/ECParameterSpec;Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;)V
    .registers 9
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .param p3, "spec"    # Ljava/security/spec/ECParameterSpec;
    .param p4, "configuration"    # Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v2, "EC"

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 110
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    .line 112
    .local v0, "dp":Lorg/spongycastle/crypto/params/ECDomainParameters;
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 113
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 115
    if-nez p3, :cond_2a

    .line 117
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getSeed()[B

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 119
    .local v1, "ellipticCurve":Ljava/security/spec/EllipticCurve;
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->createSpec(Ljava/security/spec/EllipticCurve;Lorg/spongycastle/crypto/params/ECDomainParameters;)Ljava/security/spec/ECParameterSpec;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 126
    .end local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    :goto_27
    iput-object p4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 127
    return-void

    .line 123
    :cond_2a
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_27
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/crypto/params/ECPublicKeyParameters;Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;)V
    .registers 5
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .param p3, "configuration"    # Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .prologue
    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v0, "EC"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 165
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 166
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 167
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 168
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 169
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/crypto/params/ECPublicKeyParameters;Lorg/spongycastle/jce/spec/ECParameterSpec;Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;)V
    .registers 10
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/ECPublicKeyParameters;
    .param p3, "spec"    # Lorg/spongycastle/jce/spec/ECParameterSpec;
    .param p4, "configuration"    # Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v2, "EC"

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 135
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    .line 137
    .local v0, "dp":Lorg/spongycastle/crypto/params/ECDomainParameters;
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 139
    if-nez p3, :cond_4c

    .line 141
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getSeed()[B

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 143
    .local v1, "ellipticCurve":Ljava/security/spec/EllipticCurve;
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->createSpec(Ljava/security/spec/EllipticCurve;Lorg/spongycastle/crypto/params/ECDomainParameters;)Ljava/security/spec/ECParameterSpec;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 152
    :goto_21
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    invoke-virtual {v2}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Ljava/security/spec/EllipticCurve;)Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 154
    iput-object p4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 155
    return-void

    .line 147
    .end local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    :cond_4c
    invoke-virtual {p3}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {p3}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 149
    .restart local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    invoke-static {v1, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/EllipticCurve;Lorg/spongycastle/jce/spec/ECParameterSpec;)Ljava/security/spec/ECParameterSpec;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_21
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;)V
    .registers 4
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "key"    # Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v0, "EC"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 55
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 56
    iget-object v0, p2, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 57
    iget-object v0, p2, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 58
    iget-boolean v0, p2, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    .line 59
    iget-object v0, p2, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/jce/spec/ECPublicKeySpec;Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;)V
    .registers 11
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "spec"    # Lorg/spongycastle/jce/spec/ECPublicKeySpec;
    .param p3, "configuration"    # Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v3, "EC"

    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 78
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 79
    invoke-virtual {p2}, Lorg/spongycastle/jce/spec/ECPublicKeySpec;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 81
    invoke-virtual {p2}, Lorg/spongycastle/jce/spec/ECPublicKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v3

    if-eqz v3, :cond_58

    .line 83
    invoke-virtual {p2}, Lorg/spongycastle/jce/spec/ECPublicKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    .line 84
    .local v0, "curve":Lorg/spongycastle/math/ec/ECCurve;
    invoke-virtual {p2}, Lorg/spongycastle/jce/spec/ECPublicKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v3

    invoke-static {v0, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 87
    .local v1, "ellipticCurve":Ljava/security/spec/EllipticCurve;
    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Ljava/security/spec/EllipticCurve;)Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    invoke-virtual {p2}, Lorg/spongycastle/jce/spec/ECPublicKeySpec;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {p2}, Lorg/spongycastle/jce/spec/ECPublicKeySpec;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 88
    invoke-virtual {p2}, Lorg/spongycastle/jce/spec/ECPublicKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v3

    invoke-static {v1, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/EllipticCurve;Lorg/spongycastle/jce/spec/ECParameterSpec;)Ljava/security/spec/ECParameterSpec;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 101
    .end local v0    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    :goto_55
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 102
    return-void

    .line 92
    :cond_58
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    if-nez v3, :cond_83

    .line 94
    invoke-interface {p3}, Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;->getEcImplicitlyCa()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v2

    .line 96
    .local v2, "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v3

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v5, v6}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 98
    .end local v2    # "s":Lorg/spongycastle/jce/spec/ECParameterSpec;
    :cond_83
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_55
.end method

.method public constructor <init>(Ljava/security/interfaces/ECPublicKey;Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;)V
    .registers 6
    .param p1, "key"    # Ljava/security/interfaces/ECPublicKey;
    .param p2, "configuration"    # Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .prologue
    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v0, "EC"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 175
    invoke-interface {p1}, Ljava/security/interfaces/ECPublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    .line 176
    invoke-interface {p1}, Ljava/security/interfaces/ECPublicKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 177
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    invoke-interface {p1}, Ljava/security/interfaces/ECPublicKey;->getW()Ljava/security/spec/ECPoint;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertPoint(Ljava/security/spec/ECParameterSpec;Ljava/security/spec/ECPoint;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 178
    return-void
.end method

.method private createSpec(Ljava/security/spec/EllipticCurve;Lorg/spongycastle/crypto/params/ECDomainParameters;)Ljava/security/spec/ECParameterSpec;
    .registers 7
    .param p1, "ellipticCurve"    # Ljava/security/spec/EllipticCurve;
    .param p2, "dp"    # Lorg/spongycastle/crypto/params/ECDomainParameters;

    .prologue
    .line 192
    new-instance v0, Ljava/security/spec/ECParameterSpec;

    new-instance v1, Ljava/security/spec/ECPoint;

    .line 195
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v2

    .line 196
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 197
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getN()Ljava/math/BigInteger;

    move-result-object v2

    .line 198
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getH()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    invoke-direct {v0, p1, v1, v2, v3}, Ljava/security/spec/ECParameterSpec;-><init>(Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;I)V

    return-object v0
.end method

.method private extractBytes([BILjava/math/BigInteger;)V
    .registers 11
    .param p1, "encKey"    # [B
    .param p2, "offSet"    # I
    .param p3, "bI"    # Ljava/math/BigInteger;

    .prologue
    const/16 v6, 0x20

    .line 301
    invoke-virtual {p3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    .line 302
    .local v2, "val":[B
    array-length v3, v2

    if-ge v3, v6, :cond_14

    .line 304
    new-array v1, v6, [B

    .line 305
    .local v1, "tmp":[B
    const/4 v3, 0x0

    array-length v4, v1

    array-length v5, v2

    sub-int/2addr v4, v5

    array-length v5, v2

    invoke-static {v2, v3, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 306
    move-object v2, v1

    .line 309
    .end local v1    # "tmp":[B
    :cond_14
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    if-eq v0, v6, :cond_24

    .line 311
    add-int v3, p2, v0

    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    sub-int/2addr v4, v0

    aget-byte v4, v2, v4

    aput-byte v4, p1, v3

    .line 309
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 313
    :cond_24
    return-void
.end method

.method private populateFromPubKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V
    .registers 13
    .param p1, "info"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .prologue
    const/4 v10, 0x2

    .line 203
    new-instance v6, Lorg/spongycastle/asn1/x9/X962Parameters;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v8

    invoke-virtual {v8}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v8

    check-cast v8, Lorg/spongycastle/asn1/ASN1Primitive;

    invoke-direct {v6, v8}, Lorg/spongycastle/asn1/x9/X962Parameters;-><init>(Lorg/spongycastle/asn1/ASN1Primitive;)V

    .line 204
    .local v6, "params":Lorg/spongycastle/asn1/x9/X962Parameters;
    iget-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    invoke-static {v8, v6}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->getCurve(Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;Lorg/spongycastle/asn1/x9/X962Parameters;)Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    .line 205
    .local v1, "curve":Lorg/spongycastle/math/ec/ECCurve;
    invoke-static {v6, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertToSpec(Lorg/spongycastle/asn1/x9/X962Parameters;Lorg/spongycastle/math/ec/ECCurve;)Ljava/security/spec/ECParameterSpec;

    move-result-object v8

    iput-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 207
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getPublicKeyData()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v0

    .line 208
    .local v0, "bits":Lorg/spongycastle/asn1/DERBitString;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v2

    .line 209
    .local v2, "data":[B
    new-instance v5, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v5, v2}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 214
    .local v5, "key":Lorg/spongycastle/asn1/ASN1OctetString;
    const/4 v8, 0x0

    aget-byte v8, v2, v8

    const/4 v9, 0x4

    if-ne v8, v9, :cond_54

    const/4 v8, 0x1

    aget-byte v8, v2, v8

    array-length v9, v2

    add-int/lit8 v9, v9, -0x2

    if-ne v8, v9, :cond_54

    aget-byte v8, v2, v10

    if-eq v8, v10, :cond_40

    aget-byte v8, v2, v10

    const/4 v9, 0x3

    if-ne v8, v9, :cond_54

    .line 217
    :cond_40
    new-instance v8, Lorg/spongycastle/asn1/x9/X9IntegerConverter;

    invoke-direct {v8}, Lorg/spongycastle/asn1/x9/X9IntegerConverter;-><init>()V

    invoke-virtual {v8, v1}, Lorg/spongycastle/asn1/x9/X9IntegerConverter;->getByteLength(Lorg/spongycastle/math/ec/ECCurve;)I

    move-result v7

    .line 219
    .local v7, "qLength":I
    array-length v8, v2

    add-int/lit8 v8, v8, -0x3

    if-lt v7, v8, :cond_54

    .line 223
    :try_start_4e
    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    .end local v5    # "key":Lorg/spongycastle/asn1/ASN1OctetString;
    check-cast v5, Lorg/spongycastle/asn1/ASN1OctetString;
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_54} :catch_60

    .line 232
    .end local v7    # "qLength":I
    .restart local v5    # "key":Lorg/spongycastle/asn1/ASN1OctetString;
    :cond_54
    new-instance v3, Lorg/spongycastle/asn1/x9/X9ECPoint;

    invoke-direct {v3, v1, v5}, Lorg/spongycastle/asn1/x9/X9ECPoint;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 234
    .local v3, "derQ":Lorg/spongycastle/asn1/x9/X9ECPoint;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x9/X9ECPoint;->getPoint()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v8

    iput-object v8, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 235
    return-void

    .line 225
    .end local v3    # "derQ":Lorg/spongycastle/asn1/x9/X9ECPoint;
    .end local v5    # "key":Lorg/spongycastle/asn1/ASN1OctetString;
    .restart local v7    # "qLength":I
    :catch_60
    move-exception v4

    .line 227
    .local v4, "ex":Ljava/io/IOException;
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "error recovering public key"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 399
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 401
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    move-object v0, v1

    check-cast v0, [B

    .line 403
    .local v0, "enc":[B
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->populateFromPubKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V

    .line 405
    sget-object v1, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->CONFIGURATION:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    .line 406
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 412
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 414
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->getEncoded()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 415
    return-void
.end method


# virtual methods
.method public engineGetQ()Lorg/spongycastle/math/ec/ECPoint;
    .registers 2

    .prologue
    .line 347
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    return-object v0
.end method

.method engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;
    .registers 3

    .prologue
    .line 352
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-eqz v0, :cond_d

    .line 354
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    iget-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    invoke-static {v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/ECParameterSpec;Z)Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    .line 357
    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->configuration:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    invoke-interface {v0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;->getEcImplicitlyCa()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    goto :goto_c
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 380
    instance-of v2, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;

    if-nez v2, :cond_6

    .line 387
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 385
    check-cast v0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;

    .line 387
    .local v0, "other":Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/spongycastle/math/ec/ECPoint;->equals(Lorg/spongycastle/math/ec/ECPoint;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/spongycastle/jce/spec/ECParameterSpec;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 239
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->algorithm:Ljava/lang/String;

    return-object v0
.end method

.method public getEncoded()[B
    .registers 11

    .prologue
    .line 252
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    instance-of v2, v2, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    if-eqz v2, :cond_70

    .line 254
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    check-cast v2, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getNamedCurveOid(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v6

    .line 255
    .local v6, "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    if-nez v6, :cond_21

    .line 257
    new-instance v6, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .end local v6    # "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    check-cast v2, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 259
    .restart local v6    # "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_21
    new-instance v9, Lorg/spongycastle/asn1/x9/X962Parameters;

    invoke-direct {v9, v6}, Lorg/spongycastle/asn1/x9/X962Parameters;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 279
    .end local v6    # "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .local v9, "params":Lorg/spongycastle/asn1/ASN1Encodable;
    :goto_26
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    .line 283
    .local v1, "curve":Lorg/spongycastle/math/ec/ECCurve;
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-nez v2, :cond_b9

    .line 285
    new-instance v2, Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 286
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->getXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    iget-boolean v5, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    invoke-virtual {v1, v3, v4, v5}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x9/X9ECPoint;-><init>(Lorg/spongycastle/math/ec/ECPoint;)V

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x9/X9ECPoint;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    check-cast v8, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 294
    .local v8, "p":Lorg/spongycastle/asn1/ASN1OctetString;
    :goto_5b
    new-instance v7, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    new-instance v2, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v3, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->id_ecPublicKey:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v2, v3, v9}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v8}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-direct {v7, v2, v3}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B)V

    .line 296
    .local v7, "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    invoke-static {v7}, Lorg/spongycastle/jcajce/provider/asymmetric/util/KeyUtil;->getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)[B

    move-result-object v2

    return-object v2

    .line 261
    .end local v1    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v7    # "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .end local v8    # "p":Lorg/spongycastle/asn1/ASN1OctetString;
    .end local v9    # "params":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_70
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-nez v2, :cond_7c

    .line 263
    new-instance v9, Lorg/spongycastle/asn1/x9/X962Parameters;

    sget-object v2, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-direct {v9, v2}, Lorg/spongycastle/asn1/x9/X962Parameters;-><init>(Lorg/spongycastle/asn1/ASN1Null;)V

    .restart local v9    # "params":Lorg/spongycastle/asn1/ASN1Encodable;
    goto :goto_26

    .line 267
    .end local v9    # "params":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_7c
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    invoke-virtual {v2}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Ljava/security/spec/EllipticCurve;)Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    .line 269
    .restart local v1    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    new-instance v0, Lorg/spongycastle/asn1/x9/X9ECParameters;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 271
    invoke-virtual {v2}, Ljava/security/spec/ECParameterSpec;->getGenerator()Ljava/security/spec/ECPoint;

    move-result-object v2

    iget-boolean v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    invoke-static {v1, v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertPoint(Lorg/spongycastle/math/ec/ECCurve;Ljava/security/spec/ECPoint;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 272
    invoke-virtual {v3}, Ljava/security/spec/ECParameterSpec;->getOrder()Ljava/math/BigInteger;

    move-result-object v3

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 273
    invoke-virtual {v4}, Ljava/security/spec/ECParameterSpec;->getCofactor()I

    move-result v4

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 274
    invoke-virtual {v5}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v5

    invoke-virtual {v5}, Ljava/security/spec/EllipticCurve;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    .line 276
    .local v0, "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    new-instance v9, Lorg/spongycastle/asn1/x9/X962Parameters;

    invoke-direct {v9, v0}, Lorg/spongycastle/asn1/x9/X962Parameters;-><init>(Lorg/spongycastle/asn1/x9/X9ECParameters;)V

    .restart local v9    # "params":Lorg/spongycastle/asn1/ASN1Encodable;
    goto/16 :goto_26

    .line 290
    .end local v0    # "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    :cond_b9
    new-instance v2, Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 291
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->getQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    iget-boolean v5, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    invoke-virtual {v1, v3, v4, v5}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x9/X9ECPoint;-><init>(Lorg/spongycastle/math/ec/ECPoint;)V

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x9/X9ECPoint;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    check-cast v8, Lorg/spongycastle/asn1/ASN1OctetString;

    .restart local v8    # "p":Lorg/spongycastle/asn1/ASN1OctetString;
    goto/16 :goto_5b
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 244
    const-string v0, "X.509"

    return-object v0
.end method

.method public getParameters()Lorg/spongycastle/jce/spec/ECParameterSpec;
    .registers 3

    .prologue
    .line 322
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-nez v0, :cond_6

    .line 324
    const/4 v0, 0x0

    .line 327
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    iget-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    invoke-static {v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/ECParameterSpec;Z)Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    goto :goto_5
.end method

.method public getParams()Ljava/security/spec/ECParameterSpec;
    .registers 2

    .prologue
    .line 317
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    return-object v0
.end method

.method public getQ()Lorg/spongycastle/math/ec/ECPoint;
    .registers 2

    .prologue
    .line 337
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-nez v0, :cond_b

    .line 339
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECPoint;->getDetachedPoint()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    .line 342
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    goto :goto_a
.end method

.method public getW()Ljava/security/spec/ECPoint;
    .registers 4

    .prologue
    .line 332
    new-instance v0, Ljava/security/spec/ECPoint;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 392
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetQ()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECPoint;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/jce/spec/ECParameterSpec;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public setPointFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "style"    # Ljava/lang/String;

    .prologue
    .line 375
    const-string v0, "UNCOMPRESSED"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->withCompression:Z

    .line 376
    return-void

    .line 375
    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v4, 0x10

    .line 362
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 363
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v1

    .line 365
    .local v1, "nl":Ljava/lang/String;
    const-string v2, "EC Public Key"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 366
    const-string v2, "            X: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 367
    const-string v2, "            Y: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ec/BCECPublicKey;->q:Lorg/spongycastle/math/ec/ECPoint;

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 369
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
