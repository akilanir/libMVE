.class public Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;
.super Ljava/lang/Object;
.source "BCECGOST3410PrivateKey.java"

# interfaces
.implements Ljava/security/interfaces/ECPrivateKey;
.implements Lorg/spongycastle/jce/interfaces/ECPrivateKey;
.implements Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;
.implements Lorg/spongycastle/jce/interfaces/ECPointEncoder;


# static fields
.field static final serialVersionUID:J = 0x648ee5f4b1b13042L


# instance fields
.field private algorithm:Ljava/lang/String;

.field private transient attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

.field private transient d:Ljava/math/BigInteger;

.field private transient ecSpec:Ljava/security/spec/ECParameterSpec;

.field private transient gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

.field private transient publicKey:Lorg/spongycastle/asn1/DERBitString;

.field private withCompression:Z


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v0, "ECGOST3410"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;)V
    .registers 4
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .prologue
    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v0, "ECGOST3410"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 190
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 191
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getD()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 192
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 193
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;Ljava/security/spec/ECParameterSpec;)V
    .registers 11
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .param p3, "pubKey"    # Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;
    .param p4, "spec"    # Ljava/security/spec/ECParameterSpec;

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v2, "ECGOST3410"

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v2, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 118
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    .line 120
    .local v0, "dp":Lorg/spongycastle/crypto/params/ECDomainParameters;
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 121
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getD()Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 123
    if-nez p4, :cond_65

    .line 125
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getSeed()[B

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 127
    .local v1, "ellipticCurve":Ljava/security/spec/EllipticCurve;
    new-instance v2, Ljava/security/spec/ECParameterSpec;

    new-instance v3, Ljava/security/spec/ECPoint;

    .line 130
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    .line 131
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 132
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getN()Ljava/math/BigInteger;

    move-result-object v4

    .line 133
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getH()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I

    move-result v5

    invoke-direct {v2, v1, v3, v4, v5}, Ljava/security/spec/ECParameterSpec;-><init>(Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;I)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 140
    .end local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    :goto_58
    invoke-virtual {p3}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;->getGostParams()Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    .line 142
    invoke-direct {p0, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getPublicKeyDetails(Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;)Lorg/spongycastle/asn1/DERBitString;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->publicKey:Lorg/spongycastle/asn1/DERBitString;

    .line 143
    return-void

    .line 137
    :cond_65
    iput-object p4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_58
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;Lorg/spongycastle/jce/spec/ECParameterSpec;)V
    .registers 11
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;
    .param p3, "pubKey"    # Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;
    .param p4, "spec"    # Lorg/spongycastle/jce/spec/ECParameterSpec;

    .prologue
    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v2, "ECGOST3410"

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v2, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 151
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v0

    .line 153
    .local v0, "dp":Lorg/spongycastle/crypto/params/ECDomainParameters;
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 154
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;->getD()Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 156
    if-nez p4, :cond_65

    .line 158
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getSeed()[B

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 160
    .local v1, "ellipticCurve":Ljava/security/spec/EllipticCurve;
    new-instance v2, Ljava/security/spec/ECParameterSpec;

    new-instance v3, Ljava/security/spec/ECPoint;

    .line 163
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    .line 164
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 165
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getN()Ljava/math/BigInteger;

    move-result-object v4

    .line 166
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getH()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I

    move-result v5

    invoke-direct {v2, v1, v3, v4, v5}, Ljava/security/spec/ECParameterSpec;-><init>(Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;I)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 181
    :goto_58
    invoke-virtual {p3}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;->getGostParams()Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    .line 183
    invoke-direct {p0, p3}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getPublicKeyDetails(Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;)Lorg/spongycastle/asn1/DERBitString;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->publicKey:Lorg/spongycastle/asn1/DERBitString;

    .line 184
    return-void

    .line 170
    .end local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    :cond_65
    invoke-virtual {p4}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v2

    invoke-virtual {p4}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 172
    .restart local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    new-instance v2, Ljava/security/spec/ECParameterSpec;

    new-instance v3, Ljava/security/spec/ECPoint;

    .line 175
    invoke-virtual {p4}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    .line 176
    invoke-virtual {p4}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 177
    invoke-virtual {p4}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v4

    .line 178
    invoke-virtual {p4}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I

    move-result v5

    invoke-direct {v2, v1, v3, v4, v5}, Ljava/security/spec/ECParameterSpec;-><init>(Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;I)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_58
.end method

.method public constructor <init>(Ljava/security/interfaces/ECPrivateKey;)V
    .registers 3
    .param p1, "key"    # Ljava/security/interfaces/ECPrivateKey;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v0, "ECGOST3410"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 68
    invoke-interface {p1}, Ljava/security/interfaces/ECPrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 69
    invoke-interface {p1}, Ljava/security/interfaces/ECPrivateKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 70
    invoke-interface {p1}, Ljava/security/interfaces/ECPrivateKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/security/spec/ECPrivateKeySpec;)V
    .registers 3
    .param p1, "spec"    # Ljava/security/spec/ECPrivateKeySpec;

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v0, "ECGOST3410"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 97
    invoke-virtual {p1}, Ljava/security/spec/ECPrivateKeySpec;->getS()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 98
    invoke-virtual {p1}, Ljava/security/spec/ECPrivateKeySpec;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 99
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)V
    .registers 3
    .param p1, "info"    # Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v0, "ECGOST3410"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 199
    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->populateFromPrivKeyInfo(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)V

    .line 200
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;)V
    .registers 3
    .param p1, "key"    # Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v0, "ECGOST3410"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v0, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 104
    iget-object v0, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 105
    iget-object v0, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 106
    iget-boolean v0, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->withCompression:Z

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->withCompression:Z

    .line 107
    iget-object v0, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 108
    iget-object v0, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->publicKey:Lorg/spongycastle/asn1/DERBitString;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->publicKey:Lorg/spongycastle/asn1/DERBitString;

    .line 109
    iget-object v0, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    .line 110
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/jce/spec/ECPrivateKeySpec;)V
    .registers 5
    .param p1, "spec"    # Lorg/spongycastle/jce/spec/ECPrivateKeySpec;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string v2, "ECGOST3410"

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    .line 59
    new-instance v2, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 76
    invoke-virtual {p1}, Lorg/spongycastle/jce/spec/ECPrivateKeySpec;->getD()Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 78
    invoke-virtual {p1}, Lorg/spongycastle/jce/spec/ECPrivateKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v2

    if-eqz v2, :cond_39

    .line 80
    invoke-virtual {p1}, Lorg/spongycastle/jce/spec/ECPrivateKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    .line 83
    .local v0, "curve":Lorg/spongycastle/math/ec/ECCurve;
    invoke-virtual {p1}, Lorg/spongycastle/jce/spec/ECPrivateKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/ECParameterSpec;->getSeed()[B

    move-result-object v2

    invoke-static {v0, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v1

    .line 85
    .local v1, "ellipticCurve":Ljava/security/spec/EllipticCurve;
    invoke-virtual {p1}, Lorg/spongycastle/jce/spec/ECPrivateKeySpec;->getParams()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/EllipticCurve;Lorg/spongycastle/jce/spec/ECParameterSpec;)Ljava/security/spec/ECParameterSpec;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 91
    .end local v0    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v1    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    :goto_38
    return-void

    .line 89
    :cond_39
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_38
.end method

.method private extractBytes([BILjava/math/BigInteger;)V
    .registers 11
    .param p1, "encKey"    # [B
    .param p2, "offSet"    # I
    .param p3, "bI"    # Ljava/math/BigInteger;

    .prologue
    const/16 v6, 0x20

    .line 418
    invoke-virtual {p3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    .line 419
    .local v2, "val":[B
    array-length v3, v2

    if-ge v3, v6, :cond_14

    .line 421
    new-array v1, v6, [B

    .line 422
    .local v1, "tmp":[B
    const/4 v3, 0x0

    array-length v4, v1

    array-length v5, v2

    sub-int/2addr v4, v5

    array-length v5, v2

    invoke-static {v2, v3, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 423
    move-object v2, v1

    .line 426
    .end local v1    # "tmp":[B
    :cond_14
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    if-eq v0, v6, :cond_24

    .line 428
    add-int v3, p2, v0

    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    sub-int/2addr v4, v0

    aget-byte v4, v2, v4

    aput-byte v4, p1, v3

    .line 426
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 430
    :cond_24
    return-void
.end method

.method private getPublicKeyDetails(Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;)Lorg/spongycastle/asn1/DERBitString;
    .registers 5
    .param p1, "pub"    # Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;

    .prologue
    .line 523
    :try_start_0
    invoke-virtual {p1}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PublicKey;->getEncoded()[B

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v1

    .line 525
    .local v1, "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getPublicKeyData()Lorg/spongycastle/asn1/DERBitString;
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v2

    .line 529
    .end local v1    # "info":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :goto_10
    return-object v2

    .line 527
    :catch_11
    move-exception v0

    .line 529
    .local v0, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    goto :goto_10
.end method

.method private populateFromPrivKeyInfo(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)V
    .registers 22
    .param p1, "info"    # Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getPrivateKeyAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-interface {v1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v16

    .line 207
    .local v16, "p":Lorg/spongycastle/asn1/ASN1Primitive;
    move-object/from16 v0, v16

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_ca

    invoke-static/range {v16 .. v16}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_28

    invoke-static/range {v16 .. v16}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_ca

    .line 209
    :cond_28
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getPrivateKeyAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    .line 211
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;->getPublicKeyParamSet()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jce/ECGOST3410NamedCurveTable;->getParameterSpec(Ljava/lang/String;)Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;

    move-result-object v19

    .line 213
    .local v19, "spec":Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v7

    .line 214
    .local v7, "curve":Lorg/spongycastle/math/ec/ECCurve;
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;->getSeed()[B

    move-result-object v1

    invoke-static {v7, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v3

    .line 216
    .local v3, "ellipticCurve":Ljava/security/spec/EllipticCurve;
    new-instance v1, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    .line 217
    invoke-virtual {v2}, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;->getPublicKeyParamSet()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/security/spec/ECPoint;

    .line 220
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    .line 221
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 222
    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;->getN()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual/range {v19 .. v19}, Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;->getH()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;-><init>(Ljava/lang/String;Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 224
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->parsePrivateKey()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v18

    .line 226
    .local v18, "privKey":Lorg/spongycastle/asn1/ASN1Encodable;
    move-object/from16 v0, v18

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_a5

    .line 228
    invoke-static/range {v18 .. v18}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 314
    .end local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    .end local v7    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v19    # "spec":Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;
    :goto_a4
    return-void

    .line 232
    .restart local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    .restart local v7    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .restart local v19    # "spec":Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;
    :cond_a5
    invoke-static/range {v18 .. v18}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v12

    .line 233
    .local v12, "encVal":[B
    array-length v1, v12

    new-array v8, v1, [B

    .line 235
    .local v8, "dVal":[B
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_b1
    array-length v1, v12

    if-eq v14, v1, :cond_bf

    .line 237
    array-length v1, v12

    add-int/lit8 v1, v1, -0x1

    sub-int/2addr v1, v14

    aget-byte v1, v12, v1

    aput-byte v1, v8, v14

    .line 235
    add-int/lit8 v14, v14, 0x1

    goto :goto_b1

    .line 240
    :cond_bf
    new-instance v1, Ljava/math/BigInteger;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v8}, Ljava/math/BigInteger;-><init>(I[B)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    goto :goto_a4

    .line 246
    .end local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    .end local v7    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    .end local v8    # "dVal":[B
    .end local v12    # "encVal":[B
    .end local v14    # "i":I
    .end local v18    # "privKey":Lorg/spongycastle/asn1/ASN1Encodable;
    .end local v19    # "spec":Lorg/spongycastle/jce/spec/ECNamedCurveParameterSpec;
    :cond_ca
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getPrivateKeyAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x9/X962Parameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x9/X962Parameters;

    move-result-object v17

    .line 248
    .local v17, "params":Lorg/spongycastle/asn1/x9/X962Parameters;
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/x9/X962Parameters;->isNamedCurve()Z

    move-result v1

    if-eqz v1, :cond_183

    .line 250
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/x9/X962Parameters;->getParameters()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v15

    .line 251
    .local v15, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-static {v15}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getNamedCurveByOid(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v11

    .line 253
    .local v11, "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    if-nez v11, :cond_144

    .line 255
    invoke-static {v15}, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/crypto/params/ECDomainParameters;

    move-result-object v13

    .line 256
    .local v13, "gParam":Lorg/spongycastle/crypto/params/ECDomainParameters;
    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getSeed()[B

    move-result-object v2

    invoke-static {v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v3

    .line 258
    .restart local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    new-instance v1, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    .line 259
    invoke-static {v15}, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/security/spec/ECPoint;

    .line 262
    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    .line 263
    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 264
    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getN()Ljava/math/BigInteger;

    move-result-object v5

    .line 265
    invoke-virtual {v13}, Lorg/spongycastle/crypto/params/ECDomainParameters;->getH()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;-><init>(Ljava/lang/String;Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 299
    .end local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    .end local v11    # "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    .end local v13    # "gParam":Lorg/spongycastle/crypto/params/ECDomainParameters;
    .end local v15    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :goto_12c
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->parsePrivateKey()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v18

    .line 300
    .restart local v18    # "privKey":Lorg/spongycastle/asn1/ASN1Encodable;
    move-object/from16 v0, v18

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v1, :cond_1d7

    .line 302
    invoke-static/range {v18 .. v18}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v9

    .line 304
    .local v9, "derD":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    goto/16 :goto_a4

    .line 269
    .end local v9    # "derD":Lorg/spongycastle/asn1/ASN1Integer;
    .end local v18    # "privKey":Lorg/spongycastle/asn1/ASN1Encodable;
    .restart local v11    # "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    .restart local v15    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_144
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getSeed()[B

    move-result-object v2

    invoke-static {v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v3

    .line 271
    .restart local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    new-instance v1, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    .line 272
    invoke-static {v15}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getCurveName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/security/spec/ECPoint;

    .line 275
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    .line 276
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 277
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getN()Ljava/math/BigInteger;

    move-result-object v5

    .line 278
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getH()Ljava/math/BigInteger;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;-><init>(Ljava/lang/String;Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_12c

    .line 281
    .end local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    .end local v11    # "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    .end local v15    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_183
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/x9/X962Parameters;->isImplicitlyCA()Z

    move-result v1

    if-eqz v1, :cond_18f

    .line 283
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto :goto_12c

    .line 287
    :cond_18f
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/asn1/x9/X962Parameters;->getParameters()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v11

    .line 288
    .restart local v11    # "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getSeed()[B

    move-result-object v2

    invoke-static {v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Lorg/spongycastle/math/ec/ECCurve;[B)Ljava/security/spec/EllipticCurve;

    move-result-object v3

    .line 290
    .restart local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    new-instance v1, Ljava/security/spec/ECParameterSpec;

    new-instance v2, Ljava/security/spec/ECPoint;

    .line 293
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v4

    .line 294
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getG()Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Ljava/security/spec/ECPoint;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 295
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getN()Ljava/math/BigInteger;

    move-result-object v4

    .line 296
    invoke-virtual {v11}, Lorg/spongycastle/asn1/x9/X9ECParameters;->getH()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I

    move-result v5

    invoke-direct {v1, v3, v2, v4, v5}, Ljava/security/spec/ECParameterSpec;-><init>(Ljava/security/spec/EllipticCurve;Ljava/security/spec/ECPoint;Ljava/math/BigInteger;I)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    goto/16 :goto_12c

    .line 308
    .end local v3    # "ellipticCurve":Ljava/security/spec/EllipticCurve;
    .end local v11    # "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    .restart local v18    # "privKey":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_1d7
    invoke-static/range {v18 .. v18}, Lorg/spongycastle/asn1/sec/ECPrivateKey;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/sec/ECPrivateKey;

    move-result-object v10

    .line 310
    .local v10, "ec":Lorg/spongycastle/asn1/sec/ECPrivateKey;
    invoke-virtual {v10}, Lorg/spongycastle/asn1/sec/ECPrivateKey;->getKey()Ljava/math/BigInteger;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    .line 311
    invoke-virtual {v10}, Lorg/spongycastle/asn1/sec/ECPrivateKey;->getPublicKey()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->publicKey:Lorg/spongycastle/asn1/DERBitString;

    goto/16 :goto_a4
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
    .line 537
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 539
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    move-object v0, v1

    check-cast v0, [B

    .line 541
    .local v0, "enc":[B
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->populateFromPrivKeyInfo(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)V

    .line 543
    new-instance v1, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    .line 544
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
    .line 550
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 552
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getEncoded()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 553
    return-void
.end method


# virtual methods
.method engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;
    .registers 3

    .prologue
    .line 449
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-eqz v0, :cond_d

    .line 451
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    iget-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->withCompression:Z

    invoke-static {v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/ECParameterSpec;Z)Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    .line 454
    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->CONFIGURATION:Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;

    invoke-interface {v0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfiguration;->getEcImplicitlyCa()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    goto :goto_c
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 492
    instance-of v2, p1, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;

    if-nez v2, :cond_6

    .line 499
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 497
    check-cast v0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;

    .line 499
    .local v0, "other":Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getD()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getD()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v2

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;

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
    .line 318
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->algorithm:Ljava/lang/String;

    return-object v0
.end method

.method public getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 3
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 477
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-virtual {v0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    return-object v0
.end method

.method public getBagAttributeKeys()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 482
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;->getBagAttributeKeys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getD()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 464
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getEncoded()[B
    .registers 15

    .prologue
    const/4 v13, 0x0

    .line 339
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    if-eqz v2, :cond_2e

    .line 341
    const/16 v2, 0x20

    new-array v8, v2, [B

    .line 343
    .local v8, "encKey":[B
    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {p0, v8, v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->extractBytes([BILjava/math/BigInteger;)V

    .line 347
    :try_start_11
    new-instance v9, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    new-instance v2, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v3, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3410_2001:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->gostParams:Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v3, v8}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v9, v2, v3}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 349
    .local v9, "info":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    const-string v2, "DER"

    invoke-virtual {v9, v2}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getEncoded(Ljava/lang/String;)[B
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_29} :catch_2b

    move-result-object v2

    .line 411
    .end local v8    # "encKey":[B
    .end local v9    # "info":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :goto_2a
    return-object v2

    .line 351
    .restart local v8    # "encKey":[B
    :catch_2b
    move-exception v7

    .local v7, "e":Ljava/io/IOException;
    move-object v2, v13

    .line 353
    goto :goto_2a

    .line 361
    .end local v7    # "e":Ljava/io/IOException;
    .end local v8    # "encKey":[B
    :cond_2e
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    instance-of v2, v2, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    if-eqz v2, :cond_8c

    .line 363
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    check-cast v2, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getNamedCurveOid(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v6

    .line 364
    .local v6, "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    if-nez v6, :cond_4f

    .line 366
    new-instance v6, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .end local v6    # "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    check-cast v2, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;

    invoke-virtual {v2}, Lorg/spongycastle/jce/spec/ECNamedCurveSpec;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 368
    .restart local v6    # "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_4f
    new-instance v12, Lorg/spongycastle/asn1/x9/X962Parameters;

    invoke-direct {v12, v6}, Lorg/spongycastle/asn1/x9/X962Parameters;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 369
    .local v12, "params":Lorg/spongycastle/asn1/x9/X962Parameters;
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    invoke-virtual {v2}, Ljava/security/spec/ECParameterSpec;->getOrder()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getOrderBitLength(Ljava/math/BigInteger;Ljava/math/BigInteger;)I

    move-result v11

    .line 394
    .end local v6    # "curveOid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .local v11, "orderBitLength":I
    :goto_62
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->publicKey:Lorg/spongycastle/asn1/DERBitString;

    if-eqz v2, :cond_eb

    .line 396
    new-instance v10, Lorg/spongycastle/asn1/sec/ECPrivateKey;

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->publicKey:Lorg/spongycastle/asn1/DERBitString;

    invoke-direct {v10, v11, v2, v3, v12}, Lorg/spongycastle/asn1/sec/ECPrivateKey;-><init>(ILjava/math/BigInteger;Lorg/spongycastle/asn1/DERBitString;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 405
    .local v10, "keyStructure":Lorg/spongycastle/asn1/sec/ECPrivateKey;
    :goto_71
    :try_start_71
    new-instance v9, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    new-instance v2, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v3, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3410_2001:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v12}, Lorg/spongycastle/asn1/x9/X962Parameters;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v10}, Lorg/spongycastle/asn1/sec/ECPrivateKey;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-direct {v9, v2, v3}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 407
    .restart local v9    # "info":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    const-string v2, "DER"

    invoke-virtual {v9, v2}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getEncoded(Ljava/lang/String;)[B
    :try_end_8a
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_8a} :catch_f6

    move-result-object v2

    goto :goto_2a

    .line 371
    .end local v9    # "info":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .end local v10    # "keyStructure":Lorg/spongycastle/asn1/sec/ECPrivateKey;
    .end local v11    # "orderBitLength":I
    .end local v12    # "params":Lorg/spongycastle/asn1/x9/X962Parameters;
    :cond_8c
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-nez v2, :cond_a0

    .line 373
    new-instance v12, Lorg/spongycastle/asn1/x9/X962Parameters;

    sget-object v2, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-direct {v12, v2}, Lorg/spongycastle/asn1/x9/X962Parameters;-><init>(Lorg/spongycastle/asn1/ASN1Null;)V

    .line 374
    .restart local v12    # "params":Lorg/spongycastle/asn1/x9/X962Parameters;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v2

    invoke-static {v13, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getOrderBitLength(Ljava/math/BigInteger;Ljava/math/BigInteger;)I

    move-result v11

    .restart local v11    # "orderBitLength":I
    goto :goto_62

    .line 378
    .end local v11    # "orderBitLength":I
    .end local v12    # "params":Lorg/spongycastle/asn1/x9/X962Parameters;
    :cond_a0
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    invoke-virtual {v2}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertCurve(Ljava/security/spec/EllipticCurve;)Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v1

    .line 380
    .local v1, "curve":Lorg/spongycastle/math/ec/ECCurve;
    new-instance v0, Lorg/spongycastle/asn1/x9/X9ECParameters;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 382
    invoke-virtual {v2}, Ljava/security/spec/ECParameterSpec;->getGenerator()Ljava/security/spec/ECPoint;

    move-result-object v2

    iget-boolean v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->withCompression:Z

    invoke-static {v1, v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertPoint(Lorg/spongycastle/math/ec/ECCurve;Ljava/security/spec/ECPoint;Z)Lorg/spongycastle/math/ec/ECPoint;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 383
    invoke-virtual {v3}, Ljava/security/spec/ECParameterSpec;->getOrder()Ljava/math/BigInteger;

    move-result-object v3

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 384
    invoke-virtual {v4}, Ljava/security/spec/ECParameterSpec;->getCofactor()I

    move-result v4

    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    .line 385
    invoke-virtual {v5}, Ljava/security/spec/ECParameterSpec;->getCurve()Ljava/security/spec/EllipticCurve;

    move-result-object v5

    invoke-virtual {v5}, Ljava/security/spec/EllipticCurve;->getSeed()[B

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    .line 387
    .local v0, "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    new-instance v12, Lorg/spongycastle/asn1/x9/X962Parameters;

    invoke-direct {v12, v0}, Lorg/spongycastle/asn1/x9/X962Parameters;-><init>(Lorg/spongycastle/asn1/x9/X9ECParameters;)V

    .line 388
    .restart local v12    # "params":Lorg/spongycastle/asn1/x9/X962Parameters;
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    invoke-virtual {v2}, Ljava/security/spec/ECParameterSpec;->getOrder()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/jcajce/provider/asymmetric/util/ECUtil;->getOrderBitLength(Ljava/math/BigInteger;Ljava/math/BigInteger;)I

    move-result v11

    .restart local v11    # "orderBitLength":I
    goto/16 :goto_62

    .line 400
    .end local v0    # "ecP":Lorg/spongycastle/asn1/x9/X9ECParameters;
    .end local v1    # "curve":Lorg/spongycastle/math/ec/ECCurve;
    :cond_eb
    new-instance v10, Lorg/spongycastle/asn1/sec/ECPrivateKey;

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getS()Ljava/math/BigInteger;

    move-result-object v2

    invoke-direct {v10, v11, v2, v12}, Lorg/spongycastle/asn1/sec/ECPrivateKey;-><init>(ILjava/math/BigInteger;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .restart local v10    # "keyStructure":Lorg/spongycastle/asn1/sec/ECPrivateKey;
    goto/16 :goto_71

    .line 409
    :catch_f6
    move-exception v7

    .restart local v7    # "e":Ljava/io/IOException;
    move-object v2, v13

    .line 411
    goto/16 :goto_2a
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 328
    const-string v0, "PKCS#8"

    return-object v0
.end method

.method public getParameters()Lorg/spongycastle/jce/spec/ECParameterSpec;
    .registers 3

    .prologue
    .line 439
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    if-nez v0, :cond_6

    .line 441
    const/4 v0, 0x0

    .line 444
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    iget-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->withCompression:Z

    invoke-static {v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/EC5Util;->convertSpec(Ljava/security/spec/ECParameterSpec;Z)Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v0

    goto :goto_5
.end method

.method public getParams()Ljava/security/spec/ECParameterSpec;
    .registers 2

    .prologue
    .line 434
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->ecSpec:Ljava/security/spec/ECParameterSpec;

    return-object v0
.end method

.method public getS()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 459
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 504
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->getD()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->engineGetSpec()Lorg/spongycastle/jce/spec/ECParameterSpec;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/jce/spec/ECParameterSpec;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 4
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "attribute"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 471
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->attrCarrier:Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-virtual {v0, p1, p2}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 472
    return-void
.end method

.method public setPointFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "style"    # Ljava/lang/String;

    .prologue
    .line 487
    const-string v0, "UNCOMPRESSED"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->withCompression:Z

    .line 488
    return-void

    .line 487
    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 509
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 510
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v1

    .line 512
    .local v1, "nl":Ljava/lang/String;
    const-string v2, "EC Private Key"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 513
    const-string v2, "             S: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/ecgost/BCECGOST3410PrivateKey;->d:Ljava/math/BigInteger;

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 515
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
