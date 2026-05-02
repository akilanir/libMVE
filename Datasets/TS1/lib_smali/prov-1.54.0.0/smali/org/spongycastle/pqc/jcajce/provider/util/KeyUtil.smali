.class public Lorg/spongycastle/pqc/jcajce/provider/util/KeyUtil;
.super Ljava/lang/Object;
.source "KeyUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getEncodedPrivateKeyInfo(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)[B
    .registers 3
    .param p0, "info"    # Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    .prologue
    .line 65
    :try_start_0
    const-string v1, "DER"

    invoke-virtual {p0, v1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getEncoded(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 69
    :goto_6
    return-object v1

    .line 67
    :catch_7
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public static getEncodedPrivateKeyInfo(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)[B
    .registers 5
    .param p0, "algId"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .param p1, "privKey"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 51
    :try_start_0
    new-instance v1, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 53
    .local v1, "info":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    invoke-static {v1}, Lorg/spongycastle/pqc/jcajce/provider/util/KeyUtil;->getEncodedPrivateKeyInfo(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)[B
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    move-result-object v2

    .line 57
    .end local v1    # "info":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :goto_d
    return-object v2

    .line 55
    :catch_e
    move-exception v0

    .line 57
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_d
.end method

.method public static getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)[B
    .registers 4
    .param p0, "algId"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .param p1, "keyData"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 15
    :try_start_0
    new-instance v1, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    invoke-direct {v1, p0, p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-static {v1}, Lorg/spongycastle/pqc/jcajce/provider/util/KeyUtil;->getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)[B
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v1

    .line 19
    :goto_9
    return-object v1

    .line 17
    :catch_a
    move-exception v0

    .line 19
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public static getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B)[B
    .registers 4
    .param p0, "algId"    # Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .param p1, "keyData"    # [B

    .prologue
    .line 27
    :try_start_0
    new-instance v1, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    invoke-direct {v1, p0, p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B)V

    invoke-static {v1}, Lorg/spongycastle/pqc/jcajce/provider/util/KeyUtil;->getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)[B
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v1

    .line 31
    :goto_9
    return-object v1

    .line 29
    :catch_a
    move-exception v0

    .line 31
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public static getEncodedSubjectPublicKeyInfo(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)[B
    .registers 3
    .param p0, "info"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    .prologue
    .line 39
    :try_start_0
    const-string v1, "DER"

    invoke-virtual {p0, v1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getEncoded(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 43
    :goto_6
    return-object v1

    .line 41
    :catch_7
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_6
.end method
