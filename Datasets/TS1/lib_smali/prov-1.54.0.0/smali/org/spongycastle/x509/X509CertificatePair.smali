.class public Lorg/spongycastle/x509/X509CertificatePair;
.super Ljava/lang/Object;
.source "X509CertificatePair.java"


# instance fields
.field private forward:Ljava/security/cert/X509Certificate;

.field private reverse:Ljava/security/cert/X509Certificate;


# direct methods
.method public constructor <init>(Ljava/security/cert/X509Certificate;Ljava/security/cert/X509Certificate;)V
    .registers 3
    .param p1, "forward"    # Ljava/security/cert/X509Certificate;
    .param p2, "reverse"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    .line 36
    iput-object p2, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    .line 37
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/CertificatePair;)V
    .registers 4
    .param p1, "pair"    # Lorg/spongycastle/asn1/x509/CertificatePair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CertificatePair;->getForward()Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 50
    new-instance v0, Lorg/spongycastle/jce/provider/X509CertificateObject;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CertificatePair;->getForward()Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/jce/provider/X509CertificateObject;-><init>(Lorg/spongycastle/asn1/x509/Certificate;)V

    iput-object v0, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    .line 52
    :cond_14
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CertificatePair;->getReverse()Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v0

    if-eqz v0, :cond_25

    .line 54
    new-instance v0, Lorg/spongycastle/jce/provider/X509CertificateObject;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/CertificatePair;->getReverse()Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/jce/provider/X509CertificateObject;-><init>(Lorg/spongycastle/asn1/x509/Certificate;)V

    iput-object v0, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    .line 56
    :cond_25
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 117
    if-nez p1, :cond_4

    .line 150
    :cond_3
    :goto_3
    return v3

    .line 121
    :cond_4
    instance-of v4, p1, Lorg/spongycastle/x509/X509CertificatePair;

    if-eqz v4, :cond_3

    move-object v2, p1

    .line 125
    check-cast v2, Lorg/spongycastle/x509/X509CertificatePair;

    .line 126
    .local v2, "pair":Lorg/spongycastle/x509/X509CertificatePair;
    const/4 v1, 0x1

    .line 127
    .local v1, "equalReverse":Z
    const/4 v0, 0x1

    .line 128
    .local v0, "equalForward":Z
    iget-object v4, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    if-eqz v4, :cond_2b

    .line 130
    iget-object v4, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    iget-object v5, v2, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    invoke-virtual {v4, v5}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 139
    :cond_19
    :goto_19
    iget-object v4, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    if-eqz v4, :cond_31

    .line 141
    iget-object v4, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    iget-object v5, v2, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    invoke-virtual {v4, v5}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 150
    :cond_25
    :goto_25
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    const/4 v3, 0x1

    goto :goto_3

    .line 134
    :cond_2b
    iget-object v4, v2, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    if-eqz v4, :cond_19

    .line 136
    const/4 v0, 0x0

    goto :goto_19

    .line 145
    :cond_31
    iget-object v4, v2, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    if-eqz v4, :cond_25

    .line 147
    const/4 v1, 0x0

    goto :goto_25
.end method

.method public getEncoded()[B
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 61
    const/4 v1, 0x0

    .line 62
    .local v1, "f":Lorg/spongycastle/asn1/x509/Certificate;
    const/4 v2, 0x0

    .line 65
    .local v2, "r":Lorg/spongycastle/asn1/x509/Certificate;
    :try_start_2
    iget-object v3, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    if-eqz v3, :cond_2e

    .line 67
    new-instance v3, Lorg/spongycastle/asn1/ASN1InputStream;

    iget-object v4, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    .line 68
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    .line 67
    invoke-static {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v1

    .line 69
    if-nez v1, :cond_2e

    .line 71
    new-instance v3, Ljava/security/cert/CertificateEncodingException;

    const-string v4, "unable to get encoding for forward"

    invoke-direct {v3, v4}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_23
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_23} :catch_23
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_23} :catch_4f

    .line 85
    :catch_23
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Lorg/spongycastle/x509/ExtCertificateEncodingException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/x509/ExtCertificateEncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 74
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_2e
    :try_start_2e
    iget-object v3, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    if-eqz v3, :cond_5a

    .line 76
    new-instance v3, Lorg/spongycastle/asn1/ASN1InputStream;

    iget-object v4, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    .line 77
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    .line 76
    invoke-static {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v2

    .line 78
    if-nez v2, :cond_5a

    .line 80
    new-instance v3, Ljava/security/cert/CertificateEncodingException;

    const-string v4, "unable to get encoding for reverse"

    invoke-direct {v3, v4}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_4f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2e .. :try_end_4f} :catch_23
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_4f} :catch_4f

    .line 89
    :catch_4f
    move-exception v0

    .line 91
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/spongycastle/x509/ExtCertificateEncodingException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/x509/ExtCertificateEncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 83
    .end local v0    # "e":Ljava/io/IOException;
    :cond_5a
    :try_start_5a
    new-instance v3, Lorg/spongycastle/asn1/x509/CertificatePair;

    invoke-direct {v3, v1, v2}, Lorg/spongycastle/asn1/x509/CertificatePair;-><init>(Lorg/spongycastle/asn1/x509/Certificate;Lorg/spongycastle/asn1/x509/Certificate;)V

    const-string v4, "DER"

    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/x509/CertificatePair;->getEncoded(Ljava/lang/String;)[B
    :try_end_64
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5a .. :try_end_64} :catch_23
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_64} :catch_4f

    move-result-object v3

    return-object v3
.end method

.method public getForward()Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public getReverse()Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 155
    const/4 v0, -0x1

    .line 156
    .local v0, "hash":I
    iget-object v1, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    if-eqz v1, :cond_c

    .line 158
    iget-object v1, p0, Lorg/spongycastle/x509/X509CertificatePair;->forward:Ljava/security/cert/X509Certificate;

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 160
    :cond_c
    iget-object v1, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    if-eqz v1, :cond_19

    .line 162
    mul-int/lit8 v0, v0, 0x11

    .line 163
    iget-object v1, p0, Lorg/spongycastle/x509/X509CertificatePair;->reverse:Ljava/security/cert/X509Certificate;

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 165
    :cond_19
    return v0
.end method
