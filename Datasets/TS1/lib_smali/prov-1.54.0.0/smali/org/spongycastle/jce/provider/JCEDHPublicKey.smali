.class public Lorg/spongycastle/jce/provider/JCEDHPublicKey;
.super Ljava/lang/Object;
.source "JCEDHPublicKey.java"

# interfaces
.implements Ljavax/crypto/interfaces/DHPublicKey;


# static fields
.field static final serialVersionUID:J = -0x301d7d6f0dc1b04L


# instance fields
.field private dhSpec:Ljavax/crypto/spec/DHParameterSpec;

.field private info:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

.field private y:Ljava/math/BigInteger;


# direct methods
.method constructor <init>(Ljava/math/BigInteger;Ljavax/crypto/spec/DHParameterSpec;)V
    .registers 3
    .param p1, "y"    # Ljava/math/BigInteger;
    .param p2, "dhSpec"    # Ljavax/crypto/spec/DHParameterSpec;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    .line 59
    iput-object p2, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    .line 60
    return-void
.end method

.method constructor <init>(Ljavax/crypto/interfaces/DHPublicKey;)V
    .registers 3
    .param p1, "key"    # Ljavax/crypto/interfaces/DHPublicKey;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-interface {p1}, Ljavax/crypto/interfaces/DHPublicKey;->getY()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    .line 44
    invoke-interface {p1}, Ljavax/crypto/interfaces/DHPublicKey;->getParams()Ljavax/crypto/spec/DHParameterSpec;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    .line 45
    return-void
.end method

.method constructor <init>(Ljavax/crypto/spec/DHPublicKeySpec;)V
    .registers 5
    .param p1, "spec"    # Ljavax/crypto/spec/DHPublicKeySpec;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-virtual {p1}, Ljavax/crypto/spec/DHPublicKeySpec;->getY()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    .line 37
    new-instance v0, Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {p1}, Ljavax/crypto/spec/DHPublicKeySpec;->getP()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p1}, Ljavax/crypto/spec/DHPublicKeySpec;->getG()Ljava/math/BigInteger;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavax/crypto/spec/DHParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    iput-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    .line 38
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)V
    .registers 11
    .param p1, "info"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->info:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .line 70
    :try_start_5
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->parsePublicKey()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Integer;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_b} :catch_55

    .line 77
    .local v0, "derY":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v5

    iput-object v5, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    .line 79
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getAlgorithmId()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v4

    .line 80
    .local v4, "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getAlgorithmId()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    .line 83
    .local v2, "id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    sget-object v5, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->dhKeyAgreement:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_33

    invoke-direct {p0, v4}, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->isPKCSParam(Lorg/spongycastle/asn1/ASN1Sequence;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 85
    :cond_33
    invoke-static {v4}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/DHParameter;

    move-result-object v3

    .line 87
    .local v3, "params":Lorg/spongycastle/asn1/pkcs/DHParameter;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getL()Ljava/math/BigInteger;

    move-result-object v5

    if-eqz v5, :cond_5e

    .line 89
    new-instance v5, Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getP()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getG()Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getL()Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v8}, Ljava/math/BigInteger;->intValue()I

    move-result v8

    invoke-direct {v5, v6, v7, v8}, Ljavax/crypto/spec/DHParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;I)V

    iput-object v5, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    .line 106
    .end local v3    # "params":Lorg/spongycastle/asn1/pkcs/DHParameter;
    :goto_54
    return-void

    .line 72
    .end local v0    # "derY":Lorg/spongycastle/asn1/ASN1Integer;
    .end local v2    # "id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v4    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_55
    move-exception v1

    .line 74
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "invalid info structure in DH public key"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 93
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "derY":Lorg/spongycastle/asn1/ASN1Integer;
    .restart local v2    # "id":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .restart local v3    # "params":Lorg/spongycastle/asn1/pkcs/DHParameter;
    .restart local v4    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_5e
    new-instance v5, Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getP()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v3}, Lorg/spongycastle/asn1/pkcs/DHParameter;->getG()Ljava/math/BigInteger;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/DHParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    iput-object v5, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    goto :goto_54

    .line 96
    .end local v3    # "params":Lorg/spongycastle/asn1/pkcs/DHParameter;
    :cond_6e
    sget-object v5, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->dhpublicnumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v2, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_92

    .line 98
    invoke-static {v4}, Lorg/spongycastle/asn1/x9/DHDomainParameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x9/DHDomainParameters;

    move-result-object v3

    .line 100
    .local v3, "params":Lorg/spongycastle/asn1/x9/DHDomainParameters;
    new-instance v5, Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x9/DHDomainParameters;->getP()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x9/DHDomainParameters;->getG()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/DHParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    iput-object v5, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    goto :goto_54

    .line 104
    .end local v3    # "params":Lorg/spongycastle/asn1/x9/DHDomainParameters;
    :cond_92
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "unknown algorithm type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method constructor <init>(Lorg/spongycastle/crypto/params/DHPublicKeyParameters;)V
    .registers 6
    .param p1, "params"    # Lorg/spongycastle/crypto/params/DHPublicKeyParameters;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DHPublicKeyParameters;->getY()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    .line 51
    new-instance v0, Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DHPublicKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/DHParameters;->getP()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DHPublicKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/DHParameters;->getG()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DHPublicKeyParameters;->getParameters()Lorg/spongycastle/crypto/params/DHParameters;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/DHParameters;->getL()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Ljavax/crypto/spec/DHParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;I)V

    iput-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    .line 52
    return-void
.end method

.method private isPKCSParam(Lorg/spongycastle/asn1/ASN1Sequence;)Z
    .registers 9
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v6, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 140
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    if-ne v4, v6, :cond_a

    .line 158
    :cond_9
    :goto_9
    return v2

    .line 145
    :cond_a
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    const/4 v5, 0x3

    if-le v4, v5, :cond_13

    move v2, v3

    .line 147
    goto :goto_9

    .line 150
    :cond_13
    invoke-virtual {p1, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    .line 151
    .local v0, "l":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v1

    .line 153
    .local v1, "p":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigInteger;->bitLength()I

    move-result v5

    int-to-long v5, v5

    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v4

    if-lez v4, :cond_9

    move v2, v3

    .line 155
    goto :goto_9
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 6
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 165
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    iput-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    .line 166
    new-instance v2, Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/math/BigInteger;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v3

    invoke-direct {v2, v0, v1, v3}, Ljavax/crypto/spec/DHParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;I)V

    iput-object v2, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    .line 167
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
    .line 173
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->getY()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 174
    iget-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/DHParameterSpec;->getP()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 175
    iget-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/DHParameterSpec;->getG()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 176
    iget-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/DHParameterSpec;->getL()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 177
    return-void
.end method


# virtual methods
.method public getAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 110
    const-string v0, "DH"

    return-object v0
.end method

.method public getEncoded()[B
    .registers 7

    .prologue
    .line 120
    iget-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->info:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    if-eqz v0, :cond_b

    .line 122
    iget-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->info:Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    invoke-static {v0}, Lorg/spongycastle/jcajce/provider/asymmetric/util/KeyUtil;->getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)[B

    move-result-object v0

    .line 125
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v1, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->dhKeyAgreement:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    new-instance v2, Lorg/spongycastle/asn1/pkcs/DHParameter;

    iget-object v3, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v3}, Ljavax/crypto/spec/DHParameterSpec;->getP()Ljava/math/BigInteger;

    move-result-object v3

    iget-object v4, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v4}, Ljavax/crypto/spec/DHParameterSpec;->getG()Ljava/math/BigInteger;

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    invoke-virtual {v5}, Ljavax/crypto/spec/DHParameterSpec;->getL()I

    move-result v5

    invoke-direct {v2, v3, v4, v5}, Lorg/spongycastle/asn1/pkcs/DHParameter;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;I)V

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    iget-object v2, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    invoke-static {v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/util/KeyUtil;->getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)[B

    move-result-object v0

    goto :goto_a
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    const-string v0, "X.509"

    return-object v0
.end method

.method public getParams()Ljavax/crypto/spec/DHParameterSpec;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->dhSpec:Ljavax/crypto/spec/DHParameterSpec;

    return-object v0
.end method

.method public getY()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lorg/spongycastle/jce/provider/JCEDHPublicKey;->y:Ljava/math/BigInteger;

    return-object v0
.end method
