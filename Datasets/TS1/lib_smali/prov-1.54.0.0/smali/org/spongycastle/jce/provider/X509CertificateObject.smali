.class public Lorg/spongycastle/jce/provider/X509CertificateObject;
.super Ljava/security/cert/X509Certificate;
.source "X509CertificateObject.java"

# interfaces
.implements Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;


# instance fields
.field private attrCarrier:Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

.field private basicConstraints:Lorg/spongycastle/asn1/x509/BasicConstraints;

.field private c:Lorg/spongycastle/asn1/x509/Certificate;

.field private hashValue:I

.field private hashValueSet:Z

.field private keyUsage:[Z


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/x509/Certificate;)V
    .registers 11
    .param p1, "c"    # Lorg/spongycastle/asn1/x509/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x9

    .line 84
    invoke-direct {p0}, Ljava/security/cert/X509Certificate;-><init>()V

    .line 79
    new-instance v6, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;

    invoke-direct {v6}, Lorg/spongycastle/jcajce/provider/asymmetric/util/PKCS12BagAttributeCarrierImpl;-><init>()V

    iput-object v6, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->attrCarrier:Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    .line 85
    iput-object p1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    .line 89
    :try_start_e
    const-string v6, "2.5.29.19"

    invoke-direct {p0, v6}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getExtensionBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 91
    .local v1, "bytes":[B
    if-eqz v1, :cond_20

    .line 93
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/BasicConstraints;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->basicConstraints:Lorg/spongycastle/asn1/x509/BasicConstraints;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_20} :catch_5a

    .line 103
    :cond_20
    :try_start_20
    const-string v6, "2.5.29.15"

    invoke-direct {p0, v6}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getExtensionBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 104
    if-eqz v1, :cond_78

    .line 106
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/DERBitString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERBitString;

    move-result-object v0

    .line 108
    .local v0, "bits":Lorg/spongycastle/asn1/ASN1BitString;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1BitString;->getBytes()[B

    move-result-object v1

    .line 109
    array-length v6, v1

    mul-int/lit8 v6, v6, 0x8

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1BitString;->getPadBits()I

    move-result v7

    sub-int v4, v6, v7

    .line 111
    .local v4, "length":I
    if-ge v4, v5, :cond_74

    :goto_3f
    new-array v5, v5, [Z

    iput-object v5, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->keyUsage:[Z

    .line 113
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_44
    if-eq v3, v4, :cond_7b

    .line 115
    iget-object v6, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->keyUsage:[Z

    div-int/lit8 v5, v3, 0x8

    aget-byte v5, v1, v5

    const/16 v7, 0x80

    rem-int/lit8 v8, v3, 0x8

    ushr-int/2addr v7, v8

    and-int/2addr v5, v7

    if-eqz v5, :cond_76

    const/4 v5, 0x1

    :goto_55
    aput-boolean v5, v6, v3
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_57} :catch_7c

    .line 113
    add-int/lit8 v3, v3, 0x1

    goto :goto_44

    .line 96
    .end local v0    # "bits":Lorg/spongycastle/asn1/ASN1BitString;
    .end local v1    # "bytes":[B
    .end local v3    # "i":I
    .end local v4    # "length":I
    :catch_5a
    move-exception v2

    .line 98
    .local v2, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/security/cert/CertificateParsingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cannot construct BasicConstraints: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/security/cert/CertificateParsingException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "bits":Lorg/spongycastle/asn1/ASN1BitString;
    .restart local v1    # "bytes":[B
    .restart local v4    # "length":I
    :cond_74
    move v5, v4

    .line 111
    goto :goto_3f

    .line 115
    .restart local v3    # "i":I
    :cond_76
    const/4 v5, 0x0

    goto :goto_55

    .line 120
    .end local v0    # "bits":Lorg/spongycastle/asn1/ASN1BitString;
    .end local v3    # "i":I
    .end local v4    # "length":I
    :cond_78
    const/4 v5, 0x0

    :try_start_79
    iput-object v5, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->keyUsage:[Z
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_79 .. :try_end_7b} :catch_7c

    .line 127
    :cond_7b
    return-void

    .line 123
    :catch_7c
    move-exception v2

    .line 125
    .restart local v2    # "e":Ljava/lang/Exception;
    new-instance v5, Ljava/security/cert/CertificateParsingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cannot construct KeyUsage: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/security/cert/CertificateParsingException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private calculateHashCode()I
    .registers 6

    .prologue
    .line 623
    const/4 v2, 0x0

    .line 624
    .local v2, "hashCode":I
    :try_start_1
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getEncoded()[B

    move-result-object v0

    .line 625
    .local v0, "certData":[B
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_6
    array-length v4, v0

    if-ge v3, v4, :cond_12

    .line 627
    aget-byte v4, v0, v3
    :try_end_b
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_1 .. :try_end_b} :catch_10

    mul-int/2addr v4, v3

    add-int/2addr v2, v4

    .line 625
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 631
    .end local v0    # "certData":[B
    .end local v3    # "i":I
    :catch_10
    move-exception v1

    .line 633
    .local v1, "e":Ljava/security/cert/CertificateEncodingException;
    const/4 v2, 0x0

    .end local v1    # "e":Ljava/security/cert/CertificateEncodingException;
    .end local v2    # "hashCode":I
    :cond_12
    return v2
.end method

.method private checkSignature(Ljava/security/PublicKey;Ljava/security/Signature;)V
    .registers 6
    .param p1, "key"    # Ljava/security/PublicKey;
    .param p2, "signature"    # Ljava/security/Signature;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 819
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getSignature()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/spongycastle/jce/provider/X509CertificateObject;->isAlgIdEqual(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 821
    new-instance v1, Ljava/security/cert/CertificateException;

    const-string v2, "signature algorithm in TBS cert not same as outer cert"

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 824
    :cond_1e
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    .line 827
    .local v0, "params":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-static {p2, v0}, Lorg/spongycastle/jce/provider/X509SignatureUtil;->setSignatureParameters(Ljava/security/Signature;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 829
    invoke-virtual {p2, p1}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 831
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getTBSCertificate()[B

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/security/Signature;->update([B)V

    .line 833
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSignature()[B

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/security/Signature;->verify([B)Z

    move-result v1

    if-nez v1, :cond_47

    .line 835
    new-instance v1, Ljava/security/SignatureException;

    const-string v2, "certificate does not verify with supplied key"

    invoke-direct {v1, v2}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 837
    :cond_47
    return-void
.end method

.method private static getAlternativeNames([B)Ljava/util/Collection;
    .registers 11
    .param p0, "extVal"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 872
    if-nez p0, :cond_5

    move-object v7, v8

    .line 926
    :goto_4
    return-object v7

    .line 878
    :cond_5
    :try_start_5
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 879
    .local v6, "temp":Ljava/util/Collection;
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v4

    .line 880
    .local v4, "it":Ljava/util/Enumeration;
    :goto_12
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_b9

    .line 882
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v3

    .line 883
    .local v3, "genName":Lorg/spongycastle/asn1/x509/GeneralName;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 884
    .local v5, "list":Ljava/util/List;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v7

    invoke-static {v7}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 885
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v7

    packed-switch v7, :pswitch_data_c8

    .line 917
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Bad tag number: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_54} :catch_54

    .line 928
    .end local v3    # "genName":Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v4    # "it":Ljava/util/Enumeration;
    .end local v5    # "list":Ljava/util/List;
    .end local v6    # "temp":Ljava/util/Collection;
    :catch_54
    move-exception v2

    .line 930
    .local v2, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/security/cert/CertificateParsingException;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/cert/CertificateParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 890
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "genName":Lorg/spongycastle/asn1/x509/GeneralName;
    .restart local v4    # "it":Ljava/util/Enumeration;
    .restart local v5    # "list":Ljava/util/List;
    .restart local v6    # "temp":Ljava/util/Collection;
    :pswitch_5f
    :try_start_5f
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getEncoded()[B

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 920
    :goto_66
    invoke-static {v5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 893
    :pswitch_6e
    sget-object v7, Lorg/spongycastle/asn1/x500/style/RFC4519Style;->INSTANCE:Lorg/spongycastle/asn1/x500/X500NameStyle;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v9

    invoke-static {v7, v9}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Lorg/spongycastle/asn1/x500/X500NameStyle;Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/x500/X500Name;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 898
    :pswitch_80
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    check-cast v7, Lorg/spongycastle/asn1/ASN1String;

    invoke-interface {v7}, Lorg/spongycastle/asn1/ASN1String;->getString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 901
    :pswitch_8e
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 904
    :pswitch_9e
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v7

    invoke-static {v7}, Lorg/spongycastle/asn1/DEROctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v7

    invoke-virtual {v7}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B
    :try_end_a9
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_a9} :catch_54

    move-result-object v1

    .line 908
    .local v1, "addrBytes":[B
    :try_start_aa
    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;
    :try_end_b1
    .catch Ljava/net/UnknownHostException; {:try_start_aa .. :try_end_b1} :catch_b6
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_b1} :catch_54

    move-result-object v0

    .line 914
    .local v0, "addr":Ljava/lang/String;
    :try_start_b2
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 910
    .end local v0    # "addr":Ljava/lang/String;
    :catch_b6
    move-exception v2

    .line 912
    .local v2, "e":Ljava/net/UnknownHostException;
    goto/16 :goto_12

    .line 922
    .end local v1    # "addrBytes":[B
    .end local v2    # "e":Ljava/net/UnknownHostException;
    .end local v3    # "genName":Lorg/spongycastle/asn1/x509/GeneralName;
    .end local v5    # "list":Ljava/util/List;
    :cond_b9
    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v7

    if-nez v7, :cond_c2

    move-object v7, v8

    .line 924
    goto/16 :goto_4

    .line 926
    :cond_c2
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;
    :try_end_c5
    .catch Ljava/lang/Exception; {:try_start_b2 .. :try_end_c5} :catch_54

    move-result-object v7

    goto/16 :goto_4

    .line 885
    :pswitch_data_c8
    .packed-switch 0x0
        :pswitch_5f
        :pswitch_80
        :pswitch_80
        :pswitch_5f
        :pswitch_6e
        :pswitch_5f
        :pswitch_80
        :pswitch_9e
        :pswitch_8e
    .end packed-switch
.end method

.method private getExtensionBytes(Ljava/lang/String;)[B
    .registers 5
    .param p1, "oid"    # Ljava/lang/String;

    .prologue
    .line 445
    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v1

    .line 447
    .local v1, "exts":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v1, :cond_20

    .line 449
    new-instance v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v2, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v0

    .line 450
    .local v0, "ext":Lorg/spongycastle/asn1/x509/Extension;
    if-eqz v0, :cond_20

    .line 452
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Extension;->getExtnValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    .line 456
    .end local v0    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    :goto_1f
    return-object v2

    :cond_20
    const/4 v2, 0x0

    goto :goto_1f
.end method

.method private isAlgIdEqual(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Z
    .registers 7
    .param p1, "id1"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .param p2, "id2"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 841
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 866
    :cond_10
    :goto_10
    return v0

    .line 846
    :cond_11
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    if-nez v2, :cond_2b

    .line 848
    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    if-eqz v2, :cond_29

    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    sget-object v3, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    :cond_29
    move v0, v1

    .line 853
    goto :goto_10

    .line 856
    :cond_2b
    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    if-nez v2, :cond_45

    .line 858
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    if-eqz v2, :cond_43

    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    sget-object v3, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    :cond_43
    move v0, v1

    .line 863
    goto :goto_10

    .line 866
    :cond_45
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-virtual {p2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_10
.end method


# virtual methods
.method public checkValidity()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateExpiredException;,
            Ljava/security/cert/CertificateNotYetValidException;
        }
    .end annotation

    .prologue
    .line 132
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0, v0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->checkValidity(Ljava/util/Date;)V

    .line 133
    return-void
.end method

.method public checkValidity(Ljava/util/Date;)V
    .registers 6
    .param p1, "date"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateExpiredException;,
            Ljava/security/cert/CertificateNotYetValidException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getNotAfter()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_33

    .line 141
    new-instance v0, Ljava/security/cert/CertificateExpiredException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "certificate expired on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getEndDate()Lorg/spongycastle/asn1/x509/Time;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Time;->getTime()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/cert/CertificateExpiredException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_33
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getNotBefore()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_66

    .line 146
    new-instance v0, Ljava/security/cert/CertificateNotYetValidException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "certificate not valid till "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getStartDate()Lorg/spongycastle/asn1/x509/Time;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Time;->getTime()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/cert/CertificateNotYetValidException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_66
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 583
    if-ne p1, p0, :cond_5

    .line 585
    const/4 v4, 0x1

    .line 604
    :cond_4
    :goto_4
    return v4

    .line 588
    :cond_5
    instance-of v5, p1, Ljava/security/cert/Certificate;

    if-eqz v5, :cond_4

    move-object v3, p1

    .line 593
    check-cast v3, Ljava/security/cert/Certificate;

    .line 597
    .local v3, "other":Ljava/security/cert/Certificate;
    :try_start_c
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getEncoded()[B

    move-result-object v0

    .line 598
    .local v0, "b1":[B
    invoke-virtual {v3}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v1

    .line 600
    .local v1, "b2":[B
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z
    :try_end_17
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_c .. :try_end_17} :catch_19

    move-result v4

    goto :goto_4

    .line 602
    .end local v0    # "b1":[B
    .end local v1    # "b2":[B
    :catch_19
    move-exception v2

    .line 604
    .local v2, "e":Ljava/security/cert/CertificateEncodingException;
    goto :goto_4
.end method

.method public getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 3
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 647
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->attrCarrier:Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    invoke-interface {v0, p1}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    return-object v0
.end method

.method public getBagAttributeKeys()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 652
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->attrCarrier:Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    invoke-interface {v0}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->getBagAttributeKeys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getBasicConstraints()I
    .registers 3

    .prologue
    const/4 v0, -0x1

    .line 380
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->basicConstraints:Lorg/spongycastle/asn1/x509/BasicConstraints;

    if-eqz v1, :cond_18

    .line 382
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->basicConstraints:Lorg/spongycastle/asn1/x509/BasicConstraints;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/BasicConstraints;->isCA()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 384
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->basicConstraints:Lorg/spongycastle/asn1/x509/BasicConstraints;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getPathLenConstraint()Ljava/math/BigInteger;

    move-result-object v0

    if-nez v0, :cond_19

    .line 386
    const v0, 0x7fffffff

    .line 399
    :cond_18
    :goto_18
    return v0

    .line 390
    :cond_19
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->basicConstraints:Lorg/spongycastle/asn1/x509/BasicConstraints;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getPathLenConstraint()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    goto :goto_18
.end method

.method public getCriticalExtensionOIDs()Ljava/util/Set;
    .registers 8

    .prologue
    .line 416
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getVersion()I

    move-result v5

    const/4 v6, 0x3

    if-ne v5, v6, :cond_3a

    .line 418
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 419
    .local v4, "set":Ljava/util/Set;
    iget-object v5, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v2

    .line 421
    .local v2, "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_3a

    .line 423
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    move-result-object v0

    .line 425
    .local v0, "e":Ljava/util/Enumeration;
    :cond_1c
    :goto_1c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 427
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 428
    .local v3, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v1

    .line 430
    .local v1, "ext":Lorg/spongycastle/asn1/x509/Extension;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Extension;->isCritical()Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 432
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 440
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    .end local v2    # "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    .end local v3    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v4    # "set":Ljava/util/Set;
    :cond_3a
    const/4 v4, 0x0

    :cond_3b
    return-object v4
.end method

.method public getEncoded()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 572
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/Certificate;->getEncoded(Ljava/lang/String;)[B
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 574
    :catch_9
    move-exception v0

    .line 576
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/cert/CertificateEncodingException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getExtendedKeyUsage()Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    .line 352
    const-string v6, "2.5.29.37"

    invoke-direct {p0, v6}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getExtensionBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 354
    .local v0, "bytes":[B
    if-eqz v0, :cond_3d

    .line 358
    :try_start_8
    new-instance v1, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 359
    .local v1, "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 360
    .local v5, "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 362
    .local v4, "list":Ljava/util/List;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_19
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v6

    if-eq v3, v6, :cond_2f

    .line 364
    invoke-virtual {v5, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    check-cast v6, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 367
    :cond_2f
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_32} :catch_34

    move-result-object v6

    .line 375
    .end local v1    # "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v3    # "i":I
    .end local v4    # "list":Ljava/util/List;
    .end local v5    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :goto_33
    return-object v6

    .line 369
    :catch_34
    move-exception v2

    .line 371
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/security/cert/CertificateParsingException;

    const-string v7, "error processing extended key usage extension"

    invoke-direct {v6, v7}, Ljava/security/cert/CertificateParsingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 375
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3d
    const/4 v6, 0x0

    goto :goto_33
.end method

.method public getExtensionValue(Ljava/lang/String;)[B
    .registers 8
    .param p1, "oid"    # Ljava/lang/String;

    .prologue
    .line 461
    iget-object v3, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v2

    .line 463
    .local v2, "exts":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_3e

    .line 465
    new-instance v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v3, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v1

    .line 467
    .local v1, "ext":Lorg/spongycastle/asn1/x509/Extension;
    if-eqz v1, :cond_3e

    .line 471
    :try_start_17
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Extension;->getExtnValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1OctetString;->getEncoded()[B
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1e} :catch_20

    move-result-object v3

    .line 480
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    :goto_1f
    return-object v3

    .line 473
    .restart local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    :catch_20
    move-exception v0

    .line 475
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "error parsing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 480
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    :cond_3e
    const/4 v3, 0x0

    goto :goto_1f
.end method

.method public getIssuerAlternativeNames()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    .line 411
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->issuerAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getExtensionBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getAlternativeNames([B)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getIssuerDN()Ljava/security/Principal;
    .registers 4

    .prologue
    .line 164
    :try_start_0
    new-instance v1, Lorg/spongycastle/jce/X509Principal;

    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getIssuer()Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x500/X500Name;->getEncoded()[B

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/jce/X509Principal;-><init>(Lorg/spongycastle/asn1/x500/X500Name;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_13} :catch_14

    .line 168
    :goto_13
    return-object v1

    .line 166
    :catch_14
    move-exception v0

    .line 168
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public getIssuerUniqueID()[Z
    .registers 8

    .prologue
    .line 306
    iget-object v4, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getIssuerUniqueId()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v3

    .line 308
    .local v3, "id":Lorg/spongycastle/asn1/DERBitString;
    if-eqz v3, :cond_32

    .line 310
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v1

    .line 311
    .local v1, "bytes":[B
    array-length v4, v1

    mul-int/lit8 v4, v4, 0x8

    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERBitString;->getPadBits()I

    move-result v5

    sub-int/2addr v4, v5

    new-array v0, v4, [Z

    .line 313
    .local v0, "boolId":[Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    array-length v4, v0

    if-eq v2, v4, :cond_33

    .line 315
    div-int/lit8 v4, v2, 0x8

    aget-byte v4, v1, v4

    const/16 v5, 0x80

    rem-int/lit8 v6, v2, 0x8

    ushr-int/2addr v5, v6

    and-int/2addr v4, v5

    if-eqz v4, :cond_30

    const/4 v4, 0x1

    :goto_2b
    aput-boolean v4, v0, v2

    .line 313
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 315
    :cond_30
    const/4 v4, 0x0

    goto :goto_2b

    .line 321
    .end local v0    # "boolId":[Z
    .end local v1    # "bytes":[B
    .end local v2    # "i":I
    :cond_32
    const/4 v0, 0x0

    :cond_33
    return-object v0
.end method

.method public getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;
    .registers 6

    .prologue
    .line 176
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 177
    .local v1, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lorg/spongycastle/asn1/ASN1OutputStream;

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 179
    .local v0, "aOut":Lorg/spongycastle/asn1/ASN1OutputStream;
    iget-object v3, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getIssuer()Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeObject(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 181
    new-instance v3, Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljavax/security/auth/x500/X500Principal;-><init>([B)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1c} :catch_1d

    return-object v3

    .line 183
    .end local v0    # "aOut":Lorg/spongycastle/asn1/ASN1OutputStream;
    .end local v1    # "bOut":Ljava/io/ByteArrayOutputStream;
    :catch_1d
    move-exception v2

    .line 185
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "can\'t encode issuer DN"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getKeyUsage()[Z
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->keyUsage:[Z

    return-object v0
.end method

.method public getNonCriticalExtensionOIDs()Ljava/util/Set;
    .registers 8

    .prologue
    .line 485
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getVersion()I

    move-result v5

    const/4 v6, 0x3

    if-ne v5, v6, :cond_3a

    .line 487
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 488
    .local v4, "set":Ljava/util/Set;
    iget-object v5, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v2

    .line 490
    .local v2, "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_3a

    .line 492
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    move-result-object v0

    .line 494
    .local v0, "e":Ljava/util/Enumeration;
    :cond_1c
    :goto_1c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 496
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 497
    .local v3, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v1

    .line 499
    .local v1, "ext":Lorg/spongycastle/asn1/x509/Extension;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Extension;->isCritical()Z

    move-result v5

    if-nez v5, :cond_1c

    .line 501
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 509
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    .end local v2    # "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    .end local v3    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v4    # "set":Ljava/util/Set;
    :cond_3a
    const/4 v4, 0x0

    :cond_3b
    return-object v4
.end method

.method public getNotAfter()Ljava/util/Date;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Certificate;->getEndDate()Lorg/spongycastle/asn1/x509/Time;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Time;->getDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getNotBefore()Ljava/util/Date;
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Certificate;->getStartDate()Lorg/spongycastle/asn1/x509/Time;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Time;->getDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getPublicKey()Ljava/security/PublicKey;
    .registers 3

    .prologue
    .line 559
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Certificate;->getSubjectPublicKeyInfo()Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/jce/provider/BouncyCastleProvider;->getPublicKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Ljava/security/PublicKey;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    .line 563
    :goto_a
    return-object v1

    .line 561
    :catch_b
    move-exception v0

    .line 563
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public getSerialNumber()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Certificate;->getSerialNumber()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getSigAlgName()Ljava/lang/String;
    .registers 8

    .prologue
    .line 245
    const-string v4, "SC"

    invoke-static {v4}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v2

    .line 247
    .local v2, "prov":Ljava/security/Provider;
    if-eqz v2, :cond_26

    .line 249
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Alg.Alias.Signature."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSigAlgOID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/security/Provider;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, "algName":Ljava/lang/String;
    if-eqz v0, :cond_26

    .line 271
    .end local v0    # "algName":Ljava/lang/String;
    :cond_25
    :goto_25
    return-object v0

    .line 257
    :cond_26
    invoke-static {}, Ljava/security/Security;->getProviders()[Ljava/security/Provider;

    move-result-object v3

    .line 262
    .local v3, "provs":[Ljava/security/Provider;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2b
    array-length v4, v3

    if-eq v1, v4, :cond_50

    .line 264
    aget-object v4, v3, v1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Alg.Alias.Signature."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSigAlgOID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/security/Provider;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 265
    .restart local v0    # "algName":Ljava/lang/String;
    if-nez v0, :cond_25

    .line 262
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 271
    .end local v0    # "algName":Ljava/lang/String;
    :cond_50
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSigAlgOID()Ljava/lang/String;

    move-result-object v0

    goto :goto_25
.end method

.method public getSigAlgOID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 279
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSigAlgParams()[B
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 287
    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    if-eqz v2, :cond_21

    .line 291
    :try_start_d
    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getParameters()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    const-string v3, "DER"

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_20} :catch_22

    move-result-object v1

    .line 300
    :cond_21
    :goto_21
    return-object v1

    .line 293
    :catch_22
    move-exception v0

    .line 295
    .local v0, "e":Ljava/io/IOException;
    goto :goto_21
.end method

.method public getSignature()[B
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Certificate;->getSignature()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERBitString;->getOctets()[B

    move-result-object v0

    return-object v0
.end method

.method public getSubjectAlternativeNames()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateParsingException;
        }
    .end annotation

    .prologue
    .line 405
    sget-object v0, Lorg/spongycastle/asn1/x509/Extension;->subjectAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getExtensionBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getAlternativeNames([B)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getSubjectDN()Ljava/security/Principal;
    .registers 3

    .prologue
    .line 191
    new-instance v0, Lorg/spongycastle/jce/X509Principal;

    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Certificate;->getSubject()Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x500/X500Name;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/jce/X509Principal;-><init>(Lorg/spongycastle/asn1/x500/X500Name;)V

    return-object v0
.end method

.method public getSubjectUniqueID()[Z
    .registers 8

    .prologue
    .line 326
    iget-object v4, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getSubjectUniqueId()Lorg/spongycastle/asn1/DERBitString;

    move-result-object v3

    .line 328
    .local v3, "id":Lorg/spongycastle/asn1/DERBitString;
    if-eqz v3, :cond_32

    .line 330
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v1

    .line 331
    .local v1, "bytes":[B
    array-length v4, v1

    mul-int/lit8 v4, v4, 0x8

    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERBitString;->getPadBits()I

    move-result v5

    sub-int/2addr v4, v5

    new-array v0, v4, [Z

    .line 333
    .local v0, "boolId":[Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    array-length v4, v0

    if-eq v2, v4, :cond_33

    .line 335
    div-int/lit8 v4, v2, 0x8

    aget-byte v4, v1, v4

    const/16 v5, 0x80

    rem-int/lit8 v6, v2, 0x8

    ushr-int/2addr v5, v6

    and-int/2addr v4, v5

    if-eqz v4, :cond_30

    const/4 v4, 0x1

    :goto_2b
    aput-boolean v4, v0, v2

    .line 333
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 335
    :cond_30
    const/4 v4, 0x0

    goto :goto_2b

    .line 341
    .end local v0    # "boolId":[Z
    .end local v1    # "bytes":[B
    .end local v2    # "i":I
    :cond_32
    const/4 v0, 0x0

    :cond_33
    return-object v0
.end method

.method public getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;
    .registers 6

    .prologue
    .line 198
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 199
    .local v1, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lorg/spongycastle/asn1/ASN1OutputStream;

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 201
    .local v0, "aOut":Lorg/spongycastle/asn1/ASN1OutputStream;
    iget-object v3, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getSubject()Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeObject(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 203
    new-instance v3, Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljavax/security/auth/x500/X500Principal;-><init>([B)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1c} :catch_1d

    return-object v3

    .line 205
    .end local v0    # "aOut":Lorg/spongycastle/asn1/ASN1OutputStream;
    .end local v1    # "bOut":Ljava/io/ByteArrayOutputStream;
    :catch_1d
    move-exception v2

    .line 207
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "can\'t encode issuer DN"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getTBSCertificate()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    .line 226
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v1

    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getEncoded(Ljava/lang/String;)[B
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 228
    :catch_d
    move-exception v0

    .line 230
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/cert/CertificateEncodingException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/Certificate;->getVersionNumber()I

    move-result v0

    return v0
.end method

.method public hasUnsupportedCriticalExtension()Z
    .registers 8

    .prologue
    .line 514
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getVersion()I

    move-result v5

    const/4 v6, 0x3

    if-ne v5, v6, :cond_8b

    .line 516
    iget-object v5, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v2

    .line 518
    .local v2, "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v2, :cond_8b

    .line 520
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    move-result-object v0

    .line 522
    .local v0, "e":Ljava/util/Enumeration;
    :cond_17
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_8b

    .line 524
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 525
    .local v3, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v4

    .line 527
    .local v4, "oidId":Ljava/lang/String;
    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->KEY_USAGE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->CERTIFICATE_POLICIES:Ljava/lang/String;

    .line 528
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->POLICY_MAPPINGS:Ljava/lang/String;

    .line 529
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->INHIBIT_ANY_POLICY:Ljava/lang/String;

    .line 530
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->CRL_DISTRIBUTION_POINTS:Ljava/lang/String;

    .line 531
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->ISSUING_DISTRIBUTION_POINT:Ljava/lang/String;

    .line 532
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->DELTA_CRL_INDICATOR:Ljava/lang/String;

    .line 533
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->POLICY_CONSTRAINTS:Ljava/lang/String;

    .line 534
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->BASIC_CONSTRAINTS:Ljava/lang/String;

    .line 535
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->SUBJECT_ALTERNATIVE_NAME:Ljava/lang/String;

    .line 536
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    sget-object v5, Lorg/spongycastle/jce/provider/RFC3280CertPathUtilities;->NAME_CONSTRAINTS:Ljava/lang/String;

    .line 537
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_17

    .line 542
    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v1

    .line 544
    .local v1, "ext":Lorg/spongycastle/asn1/x509/Extension;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/Extension;->isCritical()Z

    move-result v5

    if-eqz v5, :cond_17

    .line 546
    const/4 v5, 0x1

    .line 552
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    .end local v2    # "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    .end local v3    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v4    # "oidId":Ljava/lang/String;
    :goto_8a
    return v5

    :cond_8b
    const/4 v5, 0x0

    goto :goto_8a
.end method

.method public declared-synchronized hashCode()I
    .registers 2

    .prologue
    .line 610
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->hashValueSet:Z

    if-nez v0, :cond_e

    .line 612
    invoke-direct {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->calculateHashCode()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->hashValue:I

    .line 613
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->hashValueSet:Z

    .line 616
    :cond_e
    iget v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->hashValue:I
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    monitor-exit p0

    return v0

    .line 610
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 4
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "attribute"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 641
    iget-object v0, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->attrCarrier:Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;

    invoke-interface {v0, p1, p2}, Lorg/spongycastle/jce/interfaces/PKCS12BagAttributeCarrier;->setBagAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 642
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 16

    .prologue
    const/16 v14, 0x14

    .line 657
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 658
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v7

    .line 660
    .local v7, "nl":Ljava/lang/String;
    const-string v11, "  [0]         Version: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getVersion()I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 661
    const-string v11, "         SerialNumber: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 662
    const-string v11, "             IssuerDN: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getIssuerDN()Ljava/security/Principal;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 663
    const-string v11, "           Start Date: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getNotBefore()Ljava/util/Date;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 664
    const-string v11, "           Final Date: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getNotAfter()Ljava/util/Date;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 665
    const-string v11, "            SubjectDN: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSubjectDN()Ljava/security/Principal;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 666
    const-string v11, "           Public Key: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 667
    const-string v11, "  Signature Algorithm: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSigAlgName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 669
    invoke-virtual {p0}, Lorg/spongycastle/jce/provider/X509CertificateObject;->getSignature()[B

    move-result-object v10

    .line 671
    .local v10, "sig":[B
    const-string v11, "            Signature: "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    const/4 v13, 0x0

    invoke-static {v10, v13, v14}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 672
    const/16 v6, 0x14

    .local v6, "i":I
    :goto_b0
    array-length v11, v10

    if-ge v6, v11, :cond_ea

    .line 674
    array-length v11, v10

    add-int/lit8 v11, v11, -0x14

    if-ge v6, v11, :cond_d1

    .line 676
    const-string v11, "                       "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    invoke-static {v10, v6, v14}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 672
    :goto_ce
    add-int/lit8 v6, v6, 0x14

    goto :goto_b0

    .line 680
    :cond_d1
    const-string v11, "                       "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    array-length v13, v10

    sub-int/2addr v13, v6

    invoke-static {v10, v6, v13}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_ce

    .line 684
    :cond_ea
    iget-object v11, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v11}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v11

    invoke-virtual {v11}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v5

    .line 686
    .local v5, "extensions":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v5, :cond_1fa

    .line 688
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Extensions;->oids()Ljava/util/Enumeration;

    move-result-object v2

    .line 690
    .local v2, "e":Ljava/util/Enumeration;
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_105

    .line 692
    const-string v11, "       Extensions: \n"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 695
    :cond_105
    :goto_105
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_1fa

    .line 697
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 698
    .local v9, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {v5, v9}, Lorg/spongycastle/asn1/x509/Extensions;->getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/Extension;

    move-result-object v4

    .line 700
    .local v4, "ext":Lorg/spongycastle/asn1/x509/Extension;
    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/Extension;->getExtnValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v11

    if-eqz v11, :cond_1f5

    .line 702
    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/Extension;->getExtnValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v11

    invoke-virtual {v11}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v8

    .line 703
    .local v8, "octs":[B
    new-instance v1, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v1, v8}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 704
    .local v1, "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    const-string v11, "                       critical("

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v4}, Lorg/spongycastle/asn1/x509/Extension;->isCritical()Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, ") "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 707
    :try_start_13b
    sget-object v11, Lorg/spongycastle/asn1/x509/Extension;->basicConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v9, v11}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_16b

    .line 709
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v11

    invoke-static {v11}, Lorg/spongycastle/asn1/x509/BasicConstraints;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/BasicConstraints;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_152
    .catch Ljava/lang/Exception; {:try_start_13b .. :try_end_152} :catch_153

    goto :goto_105

    .line 734
    :catch_153
    move-exception v3

    .line 736
    .local v3, "ex":Ljava/lang/Exception;
    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 738
    const-string v11, " value = "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string v12, "*****"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_105

    .line 711
    .end local v3    # "ex":Ljava/lang/Exception;
    :cond_16b
    :try_start_16b
    sget-object v11, Lorg/spongycastle/asn1/x509/Extension;->keyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v9, v11}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_183

    .line 713
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v11

    invoke-static {v11}, Lorg/spongycastle/asn1/x509/KeyUsage;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/KeyUsage;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_105

    .line 715
    :cond_183
    sget-object v11, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeCertType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v9, v11}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_19f

    .line 717
    new-instance v12, Lorg/spongycastle/asn1/misc/NetscapeCertType;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v11

    check-cast v11, Lorg/spongycastle/asn1/DERBitString;

    invoke-direct {v12, v11}, Lorg/spongycastle/asn1/misc/NetscapeCertType;-><init>(Lorg/spongycastle/asn1/DERBitString;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_105

    .line 719
    :cond_19f
    sget-object v11, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeRevocationURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v9, v11}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1bb

    .line 721
    new-instance v12, Lorg/spongycastle/asn1/misc/NetscapeRevocationURL;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v11

    check-cast v11, Lorg/spongycastle/asn1/DERIA5String;

    invoke-direct {v12, v11}, Lorg/spongycastle/asn1/misc/NetscapeRevocationURL;-><init>(Lorg/spongycastle/asn1/DERIA5String;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_105

    .line 723
    :cond_1bb
    sget-object v11, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisignCzagExtension:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v9, v11}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1d7

    .line 725
    new-instance v12, Lorg/spongycastle/asn1/misc/VerisignCzagExtension;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v11

    check-cast v11, Lorg/spongycastle/asn1/DERIA5String;

    invoke-direct {v12, v11}, Lorg/spongycastle/asn1/misc/VerisignCzagExtension;-><init>(Lorg/spongycastle/asn1/DERIA5String;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_105

    .line 729
    :cond_1d7
    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 730
    const-string v11, " value = "

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v12

    invoke-static {v12}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1f3
    .catch Ljava/lang/Exception; {:try_start_16b .. :try_end_1f3} :catch_153

    goto/16 :goto_105

    .line 743
    .end local v1    # "dIn":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v8    # "octs":[B
    :cond_1f5
    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_105

    .line 748
    .end local v2    # "e":Ljava/util/Enumeration;
    .end local v4    # "ext":Lorg/spongycastle/asn1/x509/Extension;
    .end local v9    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_1fa
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    return-object v11
.end method

.method public final verify(Ljava/security/PublicKey;)V
    .registers 6
    .param p1, "key"    # Ljava/security/PublicKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 757
    iget-object v3, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/jce/provider/X509SignatureUtil;->getSignatureName(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljava/lang/String;

    move-result-object v1

    .line 761
    .local v1, "sigName":Ljava/lang/String;
    :try_start_a
    const-string v3, "SC"

    invoke-static {v1, v3}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/Signature;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_f} :catch_14

    move-result-object v2

    .line 768
    .local v2, "signature":Ljava/security/Signature;
    :goto_10
    invoke-direct {p0, p1, v2}, Lorg/spongycastle/jce/provider/X509CertificateObject;->checkSignature(Ljava/security/PublicKey;Ljava/security/Signature;)V

    .line 769
    return-void

    .line 763
    .end local v2    # "signature":Ljava/security/Signature;
    :catch_14
    move-exception v0

    .line 765
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v2

    .restart local v2    # "signature":Ljava/security/Signature;
    goto :goto_10
.end method

.method public final verify(Ljava/security/PublicKey;Ljava/lang/String;)V
    .registers 6
    .param p1, "key"    # Ljava/security/PublicKey;
    .param p2, "sigProvider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchProviderException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 777
    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jce/provider/X509SignatureUtil;->getSignatureName(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljava/lang/String;

    move-result-object v0

    .line 780
    .local v0, "sigName":Ljava/lang/String;
    if-eqz p2, :cond_14

    .line 782
    invoke-static {v0, p2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1

    .line 789
    .local v1, "signature":Ljava/security/Signature;
    :goto_10
    invoke-direct {p0, p1, v1}, Lorg/spongycastle/jce/provider/X509CertificateObject;->checkSignature(Ljava/security/PublicKey;Ljava/security/Signature;)V

    .line 790
    return-void

    .line 786
    .end local v1    # "signature":Ljava/security/Signature;
    :cond_14
    invoke-static {v0}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1

    .restart local v1    # "signature":Ljava/security/Signature;
    goto :goto_10
.end method

.method public final verify(Ljava/security/PublicKey;Ljava/security/Provider;)V
    .registers 6
    .param p1, "key"    # Ljava/security/PublicKey;
    .param p2, "sigProvider"    # Ljava/security/Provider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .prologue
    .line 798
    iget-object v2, p0, Lorg/spongycastle/jce/provider/X509CertificateObject;->c:Lorg/spongycastle/asn1/x509/Certificate;

    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/Certificate;->getSignatureAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/jce/provider/X509SignatureUtil;->getSignatureName(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;)Ljava/lang/String;

    move-result-object v0

    .line 801
    .local v0, "sigName":Ljava/lang/String;
    if-eqz p2, :cond_14

    .line 803
    invoke-static {v0, p2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/Signature;

    move-result-object v1

    .line 810
    .local v1, "signature":Ljava/security/Signature;
    :goto_10
    invoke-direct {p0, p1, v1}, Lorg/spongycastle/jce/provider/X509CertificateObject;->checkSignature(Ljava/security/PublicKey;Ljava/security/Signature;)V

    .line 811
    return-void

    .line 807
    .end local v1    # "signature":Ljava/security/Signature;
    :cond_14
    invoke-static {v0}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1

    .restart local v1    # "signature":Ljava/security/Signature;
    goto :goto_10
.end method
