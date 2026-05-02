.class public Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;
.super Ljava/lang/Object;
.source "BCRSAPublicKey.java"

# interfaces
.implements Ljava/security/interfaces/RSAPublicKey;


# static fields
.field private static final DEFAULT_ALGORITHM_IDENTIFIER:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field static final serialVersionUID:J = 0x25226a0e5bfa6c84L


# instance fields
.field private transient algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private modulus:Ljava/math/BigInteger;

.field private publicExponent:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 23
    new-instance v0, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v1, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->rsaEncryption:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    sput-object v0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->DEFAULT_ALGORITHM_IDENTIFIER:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    return-void
.end method

.method constructor <init>(Ljava/security/interfaces/RSAPublicKey;)V
    .registers 3
    .param p1, "key"    # Ljava/security/interfaces/RSAPublicKey;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    sget-object v0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->DEFAULT_ALGORITHM_IDENTIFIER:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 51
    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->modulus:Ljava/math/BigInteger;

    .line 52
    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->publicExponent:Ljava/math/BigInteger;

    .line 53
    return-void
.end method

.method constructor <init>(Ljava/security/spec/RSAPublicKeySpec;)V
    .registers 3
    .param p1, "spec"    # Ljava/security/spec/RSAPublicKeySpec;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    sget-object v0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->DEFAULT_ALGORITHM_IDENTIFIER:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 43
    invoke-virtual {p1}, Ljava/security/spec/RSAPublicKeySpec;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->modulus:Ljava/math/BigInteger;

    .line 44
    invoke-virtual {p1}, Ljava/security/spec/RSAPublicKeySpec;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->publicExponent:Ljava/math/BigInteger;

    .line 45
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V
    .registers 2
    .param p1, "info"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->populateFromPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V

    .line 59
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/crypto/params/RSAKeyParameters;)V
    .registers 3
    .param p1, "key"    # Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    sget-object v0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->DEFAULT_ALGORITHM_IDENTIFIER:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 35
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->modulus:Ljava/math/BigInteger;

    .line 36
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getExponent()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->publicExponent:Ljava/math/BigInteger;

    .line 37
    return-void
.end method

.method private populateFromPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V
    .registers 6
    .param p1, "info"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .prologue
    .line 65
    :try_start_0
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->parsePublicKey()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/pkcs/RSAPublicKey;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/RSAPublicKey;

    move-result-object v1

    .line 67
    .local v1, "pubKey":Lorg/spongycastle/asn1/pkcs/RSAPublicKey;
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 68
    invoke-virtual {v1}, Lorg/spongycastle/asn1/pkcs/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->modulus:Ljava/math/BigInteger;

    .line 69
    invoke-virtual {v1}, Lorg/spongycastle/asn1/pkcs/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->publicExponent:Ljava/math/BigInteger;
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1a} :catch_1b

    .line 75
    return-void

    .line 71
    .end local v1    # "pubKey":Lorg/spongycastle/asn1/pkcs/RSAPublicKey;
    :catch_1b
    move-exception v0

    .line 73
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "invalid info structure in RSA public key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
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
    .line 151
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 155
    :try_start_3
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_d} :catch_e

    .line 161
    :goto_d
    return-void

    .line 157
    :catch_e
    move-exception v0

    .line 159
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->DEFAULT_ALGORITHM_IDENTIFIER:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    goto :goto_d
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 169
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v1, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->DEFAULT_ALGORITHM_IDENTIFIER:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 171
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getEncoded()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 173
    :cond_16
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 119
    if-ne p1, p0, :cond_5

    .line 132
    :cond_4
    :goto_4
    return v1

    .line 124
    :cond_5
    instance-of v3, p1, Ljava/security/interfaces/RSAPublicKey;

    if-nez v3, :cond_b

    move v1, v2

    .line 126
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 129
    check-cast v0, Ljava/security/interfaces/RSAPublicKey;

    .line 131
    .local v0, "key":Ljava/security/interfaces/RSAPublicKey;
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v3

    invoke-interface {v0}, Ljava/security/interfaces/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 132
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v3

    invoke-interface {v0}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_2a
    move v1, v2

    goto :goto_4
.end method

.method public getAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    const-string v0, "RSA"

    return-object v0
.end method

.method public getEncoded()[B
    .registers 5

    .prologue
    .line 109
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->algorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    new-instance v1, Lorg/spongycastle/asn1/pkcs/RSAPublicKey;

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/pkcs/RSAPublicKey;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-static {v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/KeyUtil;->getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)[B

    move-result-object v0

    return-object v0
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    const-string v0, "X.509"

    return-object v0
.end method

.method public getModulus()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->modulus:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getPublicExponent()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->publicExponent:Ljava/math/BigInteger;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    const/16 v4, 0x10

    .line 137
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 138
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "nl":Ljava/lang/String;
    const-string v2, "RSA Public Key"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    const-string v2, "            modulus: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 142
    const-string v2, "    public exponent: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/BCRSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 144
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
