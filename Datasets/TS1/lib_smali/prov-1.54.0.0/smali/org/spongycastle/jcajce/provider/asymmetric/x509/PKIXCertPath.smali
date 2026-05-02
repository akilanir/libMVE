.class public Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;
.super Ljava/security/cert/CertPath;
.source "PKIXCertPath.java"


# static fields
.field static final certPathEncodings:Ljava/util/List;


# instance fields
.field private certificates:Ljava/util/List;

.field private final helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .local v0, "encodings":Ljava/util/List;
    const-string v1, "PkiPath"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    const-string v1, "PEM"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    const-string v1, "PKCS7"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certPathEncodings:Ljava/util/List;

    .line 60
    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 15
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 173
    const-string v9, "X.509"

    invoke-direct {p0, v9}, Ljava/security/cert/CertPath;-><init>(Ljava/lang/String;)V

    .line 49
    new-instance v9, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v9}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 176
    :try_start_c
    const-string v9, "PkiPath"

    invoke-virtual {p2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a0

    .line 178
    new-instance v2, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v2, p1}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;)V

    .line 179
    .local v2, "derInStream":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    .line 180
    .local v3, "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    instance-of v9, v3, Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v9, :cond_47

    .line 182
    new-instance v9, Ljava/security/cert/CertificateException;

    const-string v10, "input stream does not contain a ASN1 SEQUENCE while reading PkiPath encoded data to load CertPath"

    invoke-direct {v9, v10}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_29} :catch_29
    .catch Ljava/security/NoSuchProviderException; {:try_start_c .. :try_end_29} :catch_82

    .line 211
    .end local v2    # "derInStream":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v3    # "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    :catch_29
    move-exception v7

    .line 213
    .local v7, "ex":Ljava/io/IOException;
    :goto_2a
    new-instance v9, Ljava/security/cert/CertificateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IOException throw while decoding CertPath:\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 184
    .end local v7    # "ex":Ljava/io/IOException;
    .restart local v2    # "derInStream":Lorg/spongycastle/asn1/ASN1InputStream;
    .restart local v3    # "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_47
    :try_start_47
    check-cast v3, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local v3    # "derObject":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v4

    .line 185
    .local v4, "e":Ljava/util/Enumeration;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    .line 186
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    const-string v10, "X.509"

    invoke-interface {v9, v10}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createCertificateFactory(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 187
    .local v1, "certFactory":Ljava/security/cert/CertificateFactory;
    :goto_5c
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_d5

    .line 189
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/ASN1Encodable;

    .line 190
    .local v5, "element":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-interface {v5}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v9

    const-string v10, "DER"

    invoke-virtual {v9, v10}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B

    move-result-object v6

    .line 191
    .local v6, "encoded":[B
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    const/4 v10, 0x0

    new-instance v11, Ljava/io/ByteArrayInputStream;

    invoke-direct {v11, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v1, v11}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v11

    invoke-interface {v9, v10, v11}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_81} :catch_29
    .catch Ljava/security/NoSuchProviderException; {:try_start_47 .. :try_end_81} :catch_82

    goto :goto_5c

    .line 215
    .end local v1    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v2    # "derInStream":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v4    # "e":Ljava/util/Enumeration;
    .end local v5    # "element":Lorg/spongycastle/asn1/ASN1Encodable;
    .end local v6    # "encoded":[B
    :catch_82
    move-exception v7

    .line 217
    .local v7, "ex":Ljava/security/NoSuchProviderException;
    :goto_83
    new-instance v9, Ljava/security/cert/CertificateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "BouncyCastle provider not found while trying to get a CertificateFactory:\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Ljava/security/NoSuchProviderException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 195
    .end local v7    # "ex":Ljava/security/NoSuchProviderException;
    :cond_a0
    :try_start_a0
    const-string v9, "PKCS7"

    invoke-virtual {p2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_b0

    const-string v9, "PEM"

    invoke-virtual {p2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_de

    .line 197
    :cond_b0
    new-instance v8, Ljava/io/BufferedInputStream;

    invoke-direct {v8, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b5
    .catch Ljava/io/IOException; {:try_start_a0 .. :try_end_b5} :catch_29
    .catch Ljava/security/NoSuchProviderException; {:try_start_a0 .. :try_end_b5} :catch_82

    .line 198
    .end local p1    # "inStream":Ljava/io/InputStream;
    .local v8, "inStream":Ljava/io/InputStream;
    :try_start_b5
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    .line 199
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    const-string v10, "X.509"

    invoke-interface {v9, v10}, Lorg/spongycastle/jcajce/util/JcaJceHelper;->createCertificateFactory(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 201
    .restart local v1    # "certFactory":Ljava/security/cert/CertificateFactory;
    :goto_c4
    invoke-virtual {v1, v8}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    .local v0, "cert":Ljava/security/cert/Certificate;
    if-eqz v0, :cond_d4

    .line 203
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_b5 .. :try_end_cf} :catch_d0
    .catch Ljava/security/NoSuchProviderException; {:try_start_b5 .. :try_end_cf} :catch_f7

    goto :goto_c4

    .line 211
    .end local v0    # "cert":Ljava/security/cert/Certificate;
    .end local v1    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_d0
    move-exception v7

    move-object p1, v8

    .end local v8    # "inStream":Ljava/io/InputStream;
    .restart local p1    # "inStream":Ljava/io/InputStream;
    goto/16 :goto_2a

    .end local p1    # "inStream":Ljava/io/InputStream;
    .restart local v0    # "cert":Ljava/security/cert/Certificate;
    .restart local v1    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v8    # "inStream":Ljava/io/InputStream;
    :cond_d4
    move-object p1, v8

    .line 220
    .end local v0    # "cert":Ljava/security/cert/Certificate;
    .end local v8    # "inStream":Ljava/io/InputStream;
    .restart local p1    # "inStream":Ljava/io/InputStream;
    :cond_d5
    iget-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-direct {p0, v9}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->sortCerts(Ljava/util/List;)Ljava/util/List;

    move-result-object v9

    iput-object v9, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    .line 221
    return-void

    .line 208
    .end local v1    # "certFactory":Ljava/security/cert/CertificateFactory;
    :cond_de
    :try_start_de
    new-instance v9, Ljava/security/cert/CertificateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "unsupported encoding: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_f7
    .catch Ljava/io/IOException; {:try_start_de .. :try_end_f7} :catch_29
    .catch Ljava/security/NoSuchProviderException; {:try_start_de .. :try_end_f7} :catch_82

    .line 215
    .end local p1    # "inStream":Ljava/io/InputStream;
    .restart local v8    # "inStream":Ljava/io/InputStream;
    :catch_f7
    move-exception v7

    move-object p1, v8

    .end local v8    # "inStream":Ljava/io/InputStream;
    .restart local p1    # "inStream":Ljava/io/InputStream;
    goto :goto_83
.end method

.method constructor <init>(Ljava/util/List;)V
    .registers 3
    .param p1, "certificates"    # Ljava/util/List;

    .prologue
    .line 159
    const-string v0, "X.509"

    invoke-direct {p0, v0}, Ljava/security/cert/CertPath;-><init>(Ljava/lang/String;)V

    .line 49
    new-instance v0, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;

    invoke-direct {v0}, Lorg/spongycastle/jcajce/util/BCJcaJceHelper;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->helper:Lorg/spongycastle/jcajce/util/JcaJceHelper;

    .line 160
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->sortCerts(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    .line 161
    return-void
.end method

.method private sortCerts(Ljava/util/List;)Ljava/util/List;
    .registers 14
    .param p1, "certs"    # Ljava/util/List;

    .prologue
    .line 70
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    const/4 v11, 0x2

    if-ge v10, v11, :cond_8

    .line 154
    .end local p1    # "certs":Ljava/util/List;
    :cond_7
    :goto_7
    return-object p1

    .line 75
    .restart local p1    # "certs":Ljava/util/List;
    :cond_8
    const/4 v10, 0x0

    invoke-interface {p1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/security/cert/X509Certificate;

    invoke-virtual {v10}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v4

    .line 76
    .local v4, "issuer":Ljavax/security/auth/x500/X500Principal;
    const/4 v6, 0x1

    .line 78
    .local v6, "okay":Z
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_15
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    if-eq v3, v10, :cond_39

    .line 80
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 82
    .local v1, "cert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_38

    .line 84
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/security/cert/X509Certificate;

    invoke-virtual {v10}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v4

    .line 78
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 88
    :cond_38
    const/4 v6, 0x0

    .line 93
    .end local v1    # "cert":Ljava/security/cert/X509Certificate;
    :cond_39
    if-nez v6, :cond_7

    .line 99
    new-instance v8, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    invoke-direct {v8, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 100
    .local v8, "retList":Ljava/util/List;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 102
    .local v7, "orig":Ljava/util/List;
    const/4 v3, 0x0

    :goto_4a
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    if-ge v3, v10, :cond_81

    .line 104
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 105
    .restart local v1    # "cert":Ljava/security/cert/X509Certificate;
    const/4 v2, 0x0

    .line 107
    .local v2, "found":Z
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v9

    .line 109
    .local v9, "subject":Ljavax/security/auth/x500/X500Principal;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_5c
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    if-eq v5, v10, :cond_73

    .line 111
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 112
    .local v0, "c":Ljava/security/cert/X509Certificate;
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7e

    .line 114
    const/4 v2, 0x1

    .line 119
    .end local v0    # "c":Ljava/security/cert/X509Certificate;
    :cond_73
    if-nez v2, :cond_7b

    .line 121
    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    invoke-interface {p1, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 102
    :cond_7b
    add-int/lit8 v3, v3, 0x1

    goto :goto_4a

    .line 109
    .restart local v0    # "c":Ljava/security/cert/X509Certificate;
    :cond_7e
    add-int/lit8 v5, v5, 0x1

    goto :goto_5c

    .line 127
    .end local v0    # "c":Ljava/security/cert/X509Certificate;
    .end local v1    # "cert":Ljava/security/cert/X509Certificate;
    .end local v2    # "found":Z
    .end local v5    # "j":I
    .end local v9    # "subject":Ljavax/security/auth/x500/X500Principal;
    :cond_81
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_8b

    move-object p1, v7

    .line 129
    goto/16 :goto_7

    .line 132
    :cond_8b
    const/4 v3, 0x0

    :goto_8c
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v10

    if-eq v3, v10, :cond_bf

    .line 134
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/security/cert/X509Certificate;

    invoke-virtual {v10}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v4

    .line 136
    const/4 v5, 0x0

    .restart local v5    # "j":I
    :goto_9d
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    if-ge v5, v10, :cond_b9

    .line 138
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 139
    .restart local v0    # "c":Ljava/security/cert/X509Certificate;
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljavax/security/auth/x500/X500Principal;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_bc

    .line 141
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    invoke-interface {p1, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 132
    .end local v0    # "c":Ljava/security/cert/X509Certificate;
    :cond_b9
    add-int/lit8 v3, v3, 0x1

    goto :goto_8c

    .line 136
    .restart local v0    # "c":Ljava/security/cert/X509Certificate;
    :cond_bc
    add-int/lit8 v5, v5, 0x1

    goto :goto_9d

    .line 149
    .end local v0    # "c":Ljava/security/cert/X509Certificate;
    .end local v5    # "j":I
    :cond_bf
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_c8

    move-object p1, v7

    .line 151
    goto/16 :goto_7

    :cond_c8
    move-object p1, v8

    .line 154
    goto/16 :goto_7
.end method

.method private toASN1Object(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 355
    :try_start_0
    new-instance v1, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    move-result-object v1

    return-object v1

    .line 357
    :catch_e
    move-exception v0

    .line 359
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/security/cert/CertificateEncodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception while encoding certificate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private toDEREncoded(Lorg/spongycastle/asn1/ASN1Encodable;)[B
    .registers 6
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 368
    :try_start_0
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 370
    :catch_b
    move-exception v0

    .line 372
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/cert/CertificateEncodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception thrown: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getCertificates()Ljava/util/List;
    .registers 3

    .prologue
    .line 339
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getEncoded()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->getEncodings()Ljava/util/Iterator;

    move-result-object v1

    .line 247
    .local v1, "iter":Ljava/util/Iterator;
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 249
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 250
    .local v0, "enc":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_19

    .line 252
    check-cast v0, Ljava/lang/String;

    .end local v0    # "enc":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->getEncoded(Ljava/lang/String;)[B

    move-result-object v2

    .line 255
    :goto_18
    return-object v2

    :cond_19
    const/4 v2, 0x0

    goto :goto_18
.end method

.method public getEncoded(Ljava/lang/String;)[B
    .registers 15
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 271
    const-string v1, "PkiPath"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 273
    new-instance v12, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v12}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 275
    .local v12, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1, v2}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v10

    .line 276
    .local v10, "iter":Ljava/util/ListIterator;
    :goto_19
    invoke-interface {v10}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 278
    invoke-interface {v10}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    invoke-direct {p0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->toASN1Object(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-virtual {v12, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_19

    .line 281
    :cond_2d
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v12}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-direct {p0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->toDEREncoded(Lorg/spongycastle/asn1/ASN1Encodable;)[B

    move-result-object v1

    .line 323
    .end local v10    # "iter":Ljava/util/ListIterator;
    .end local v12    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :goto_36
    return-object v1

    .line 283
    :cond_37
    const-string v1, "PKCS7"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8f

    .line 285
    new-instance v3, Lorg/spongycastle/asn1/pkcs/ContentInfo;

    sget-object v1, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->data:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const/4 v2, 0x0

    invoke-direct {v3, v1, v2}, Lorg/spongycastle/asn1/pkcs/ContentInfo;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 287
    .local v3, "encInfo":Lorg/spongycastle/asn1/pkcs/ContentInfo;
    new-instance v12, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v12}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 288
    .restart local v12    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_4d
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v9, v1, :cond_67

    .line 290
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    invoke-direct {p0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->toASN1Object(Ljava/security/cert/X509Certificate;)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-virtual {v12, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 288
    add-int/lit8 v9, v9, 0x1

    goto :goto_4d

    .line 293
    :cond_67
    new-instance v0, Lorg/spongycastle/asn1/pkcs/SignedData;

    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v4, 0x1

    invoke-direct {v1, v4, v5}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    new-instance v2, Lorg/spongycastle/asn1/DERSet;

    invoke-direct {v2}, Lorg/spongycastle/asn1/DERSet;-><init>()V

    new-instance v4, Lorg/spongycastle/asn1/DERSet;

    invoke-direct {v4, v12}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    const/4 v5, 0x0

    new-instance v6, Lorg/spongycastle/asn1/DERSet;

    invoke-direct {v6}, Lorg/spongycastle/asn1/DERSet;-><init>()V

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/asn1/pkcs/SignedData;-><init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/pkcs/ContentInfo;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;Lorg/spongycastle/asn1/ASN1Set;)V

    .line 301
    .local v0, "sd":Lorg/spongycastle/asn1/pkcs/SignedData;
    new-instance v1, Lorg/spongycastle/asn1/pkcs/ContentInfo;

    sget-object v2, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->signedData:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/asn1/pkcs/ContentInfo;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-direct {p0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->toDEREncoded(Lorg/spongycastle/asn1/ASN1Encodable;)[B

    move-result-object v1

    goto :goto_36

    .line 304
    .end local v0    # "sd":Lorg/spongycastle/asn1/pkcs/SignedData;
    .end local v3    # "encInfo":Lorg/spongycastle/asn1/pkcs/ContentInfo;
    .end local v9    # "i":I
    .end local v12    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_8f
    const-string v1, "PEM"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_da

    .line 306
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 307
    .local v7, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v11, Lorg/spongycastle/util/io/pem/PemWriter;

    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v11, v1}, Lorg/spongycastle/util/io/pem/PemWriter;-><init>(Ljava/io/Writer;)V

    .line 311
    .local v11, "pWrt":Lorg/spongycastle/util/io/pem/PemWriter;
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_a7
    :try_start_a7
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v9, v1, :cond_c8

    .line 313
    new-instance v2, Lorg/spongycastle/util/io/pem/PemObject;

    const-string v4, "CERTIFICATE"

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certificates:Ljava/util/List;

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v1

    invoke-direct {v2, v4, v1}, Lorg/spongycastle/util/io/pem/PemObject;-><init>(Ljava/lang/String;[B)V

    invoke-virtual {v11, v2}, Lorg/spongycastle/util/io/pem/PemWriter;->writeObject(Lorg/spongycastle/util/io/pem/PemObjectGenerator;)V

    .line 311
    add-int/lit8 v9, v9, 0x1

    goto :goto_a7

    .line 316
    :cond_c8
    invoke-virtual {v11}, Lorg/spongycastle/util/io/pem/PemWriter;->close()V
    :try_end_cb
    .catch Ljava/lang/Exception; {:try_start_a7 .. :try_end_cb} :catch_d1

    .line 323
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    goto/16 :goto_36

    .line 318
    :catch_d1
    move-exception v8

    .line 320
    .local v8, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/security/cert/CertificateEncodingException;

    const-string v2, "can\'t encode certificate for PEM encoded path"

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 327
    .end local v7    # "bOut":Ljava/io/ByteArrayOutputStream;
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v9    # "i":I
    .end local v11    # "pWrt":Lorg/spongycastle/util/io/pem/PemWriter;
    :cond_da
    new-instance v1, Ljava/security/cert/CertificateEncodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unsupported encoding: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getEncodings()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 233
    sget-object v0, Lorg/spongycastle/jcajce/provider/asymmetric/x509/PKIXCertPath;->certPathEncodings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
