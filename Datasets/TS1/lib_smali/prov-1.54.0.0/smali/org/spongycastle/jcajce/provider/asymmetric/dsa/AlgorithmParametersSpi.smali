.class public Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;
.super Ljava/security/AlgorithmParametersSpi;
.source "AlgorithmParametersSpi.java"


# instance fields
.field currentSpec:Ljava/security/spec/DSAParameterSpec;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/security/AlgorithmParametersSpi;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGetEncoded()[B
    .registers 6

    .prologue
    .line 45
    new-instance v0, Lorg/spongycastle/asn1/x509/DSAParameter;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->currentSpec:Ljava/security/spec/DSAParameterSpec;

    invoke-virtual {v2}, Ljava/security/spec/DSAParameterSpec;->getP()Ljava/math/BigInteger;

    move-result-object v2

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->currentSpec:Ljava/security/spec/DSAParameterSpec;

    invoke-virtual {v3}, Ljava/security/spec/DSAParameterSpec;->getQ()Ljava/math/BigInteger;

    move-result-object v3

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->currentSpec:Ljava/security/spec/DSAParameterSpec;

    invoke-virtual {v4}, Ljava/security/spec/DSAParameterSpec;->getG()Ljava/math/BigInteger;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/asn1/x509/DSAParameter;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 49
    .local v0, "dsaP":Lorg/spongycastle/asn1/x509/DSAParameter;
    :try_start_17
    const-string v2, "DER"

    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/x509/DSAParameter;->getEncoded(Ljava/lang/String;)[B
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1c} :catch_1e

    move-result-object v2

    return-object v2

    .line 51
    :catch_1e
    move-exception v1

    .line 53
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Error encoding DSAParameters"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineGetEncoded(Ljava/lang/String;)[B
    .registers 3
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 62
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->engineGetEncoded()[B

    move-result-object v0

    .line 65
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected engineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 4
    .param p1, "paramSpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 26
    if-nez p1, :cond_a

    .line 28
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "argument to getParameterSpec must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_a
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;

    move-result-object v0

    return-object v0
.end method

.method protected engineInit(Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 4
    .param p1, "paramSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 84
    instance-of v0, p1, Ljava/security/spec/DSAParameterSpec;

    if-nez v0, :cond_c

    .line 86
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    const-string v1, "DSAParameterSpec required to initialise a DSA algorithm parameters object"

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_c
    check-cast p1, Ljava/security/spec/DSAParameterSpec;

    .end local p1    # "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->currentSpec:Ljava/security/spec/DSAParameterSpec;

    .line 90
    return-void
.end method

.method protected engineInit([B)V
    .registers 8
    .param p1, "params"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    :try_start_0
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x509/DSAParameter;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/DSAParameter;

    move-result-object v0

    .line 100
    .local v0, "dsaP":Lorg/spongycastle/asn1/x509/DSAParameter;
    new-instance v2, Ljava/security/spec/DSAParameterSpec;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DSAParameter;->getP()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DSAParameter;->getQ()Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/DSAParameter;->getG()Ljava/math/BigInteger;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Ljava/security/spec/DSAParameterSpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->currentSpec:Ljava/security/spec/DSAParameterSpec;
    :try_end_1b
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_1b} :catch_1c
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_1b} :catch_25

    .line 110
    return-void

    .line 102
    .end local v0    # "dsaP":Lorg/spongycastle/asn1/x509/DSAParameter;
    :catch_1c
    move-exception v1

    .line 104
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Not a valid DSA Parameter encoding."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 106
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :catch_25
    move-exception v1

    .line 108
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Not a valid DSA Parameter encoding."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineInit([BLjava/lang/String;)V
    .registers 6
    .param p1, "params"    # [B
    .param p2, "format"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0, p2}, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "X.509"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 119
    :cond_e
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->engineInit([B)V

    .line 125
    return-void

    .line 123
    :cond_12
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown parameter format "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineToString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 129
    const-string v0, "DSA Parameters"

    return-object v0
.end method

.method protected isASN1FormatString(Ljava/lang/String;)Z
    .registers 3
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 19
    if-eqz p1, :cond_a

    const-string v0, "ASN.1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 4
    .param p1, "paramSpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 72
    const-class v0, Ljava/security/spec/DSAParameterSpec;

    if-eq p1, v0, :cond_8

    const-class v0, Ljava/security/spec/AlgorithmParameterSpec;

    if-ne p1, v0, :cond_b

    .line 74
    :cond_8
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/dsa/AlgorithmParametersSpi;->currentSpec:Ljava/security/spec/DSAParameterSpec;

    return-object v0

    .line 77
    :cond_b
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    const-string v1, "unknown parameter spec passed to DSA parameters object."

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
