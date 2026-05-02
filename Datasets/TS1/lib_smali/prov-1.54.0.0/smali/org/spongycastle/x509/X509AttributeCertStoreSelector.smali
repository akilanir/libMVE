.class public Lorg/spongycastle/x509/X509AttributeCertStoreSelector;
.super Ljava/lang/Object;
.source "X509AttributeCertStoreSelector.java"

# interfaces
.implements Lorg/spongycastle/util/Selector;


# instance fields
.field private attributeCert:Lorg/spongycastle/x509/X509AttributeCertificate;

.field private attributeCertificateValid:Ljava/util/Date;

.field private holder:Lorg/spongycastle/x509/AttributeCertificateHolder;

.field private issuer:Lorg/spongycastle/x509/AttributeCertificateIssuer;

.field private serialNumber:Ljava/math/BigInteger;

.field private targetGroups:Ljava/util/Collection;

.field private targetNames:Ljava/util/Collection;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    .line 50
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    .line 55
    return-void
.end method

.method private extractGeneralNames(Ljava/util/Collection;)Ljava/util/Set;
    .registers 6
    .param p1, "names"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 465
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 467
    :cond_8
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 482
    :cond_d
    return-object v2

    .line 469
    :cond_e
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 470
    .local v2, "temp":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 472
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 473
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Lorg/spongycastle/asn1/x509/GeneralName;

    if-eqz v3, :cond_29

    .line 475
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 479
    :cond_29
    check-cast v1, [B

    .end local v1    # "o":Ljava/lang/Object;
    check-cast v1, [B

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_17
.end method


# virtual methods
.method public addTargetGroup(Lorg/spongycastle/asn1/x509/GeneralName;)V
    .registers 3
    .param p1, "group"    # Lorg/spongycastle/asn1/x509/GeneralName;

    .prologue
    .line 409
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 410
    return-void
.end method

.method public addTargetGroup([B)V
    .registers 3
    .param p1, "name"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 427
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->addTargetGroup(Lorg/spongycastle/asn1/x509/GeneralName;)V

    .line 428
    return-void
.end method

.method public addTargetName(Lorg/spongycastle/asn1/x509/GeneralName;)V
    .registers 3
    .param p1, "name"    # Lorg/spongycastle/asn1/x509/GeneralName;

    .prologue
    .line 343
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 344
    return-void
.end method

.method public addTargetName([B)V
    .registers 3
    .param p1, "name"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 361
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->addTargetName(Lorg/spongycastle/asn1/x509/GeneralName;)V

    .line 362
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 200
    new-instance v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;

    invoke-direct {v0}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;-><init>()V

    .line 201
    .local v0, "sel":Lorg/spongycastle/x509/X509AttributeCertStoreSelector;
    iget-object v1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCert:Lorg/spongycastle/x509/X509AttributeCertificate;

    iput-object v1, v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCert:Lorg/spongycastle/x509/X509AttributeCertificate;

    .line 202
    invoke-virtual {p0}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->getAttributeCertificateValid()Ljava/util/Date;

    move-result-object v1

    iput-object v1, v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCertificateValid:Ljava/util/Date;

    .line 203
    iget-object v1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->holder:Lorg/spongycastle/x509/AttributeCertificateHolder;

    iput-object v1, v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->holder:Lorg/spongycastle/x509/AttributeCertificateHolder;

    .line 204
    iget-object v1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->issuer:Lorg/spongycastle/x509/AttributeCertificateIssuer;

    iput-object v1, v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->issuer:Lorg/spongycastle/x509/AttributeCertificateIssuer;

    .line 205
    iget-object v1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->serialNumber:Ljava/math/BigInteger;

    iput-object v1, v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->serialNumber:Ljava/math/BigInteger;

    .line 206
    invoke-virtual {p0}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->getTargetGroups()Ljava/util/Collection;

    move-result-object v1

    iput-object v1, v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    .line 207
    invoke-virtual {p0}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->getTargetNames()Ljava/util/Collection;

    move-result-object v1

    iput-object v1, v0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    .line 208
    return-object v0
.end method

.method public getAttributeCert()Lorg/spongycastle/x509/X509AttributeCertificate;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCert:Lorg/spongycastle/x509/X509AttributeCertificate;

    return-object v0
.end method

.method public getAttributeCertificateValid()Ljava/util/Date;
    .registers 4

    .prologue
    .line 239
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCertificateValid:Ljava/util/Date;

    if-eqz v0, :cond_10

    .line 241
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCertificateValid:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 244
    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getHolder()Lorg/spongycastle/x509/AttributeCertificateHolder;
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->holder:Lorg/spongycastle/x509/AttributeCertificateHolder;

    return-object v0
.end method

.method public getIssuer()Lorg/spongycastle/x509/AttributeCertificateIssuer;
    .registers 2

    .prologue
    .line 294
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->issuer:Lorg/spongycastle/x509/AttributeCertificateIssuer;

    return-object v0
.end method

.method public getSerialNumber()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 315
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->serialNumber:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getTargetGroups()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 459
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getTargetNames()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 392
    iget-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/Object;)Z
    .registers 15
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v11, 0x0

    .line 66
    instance-of v10, p1, Lorg/spongycastle/x509/X509AttributeCertificate;

    if-nez v10, :cond_7

    move v10, v11

    .line 190
    :goto_6
    return v10

    :cond_7
    move-object v0, p1

    .line 71
    check-cast v0, Lorg/spongycastle/x509/X509AttributeCertificate;

    .line 73
    .local v0, "attrCert":Lorg/spongycastle/x509/X509AttributeCertificate;
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCert:Lorg/spongycastle/x509/X509AttributeCertificate;

    if-eqz v10, :cond_18

    .line 75
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCert:Lorg/spongycastle/x509/X509AttributeCertificate;

    invoke-virtual {v10, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_18

    move v10, v11

    .line 77
    goto :goto_6

    .line 80
    :cond_18
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->serialNumber:Ljava/math/BigInteger;

    if-eqz v10, :cond_2a

    .line 82
    invoke-interface {v0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v10

    iget-object v12, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->serialNumber:Ljava/math/BigInteger;

    invoke-virtual {v10, v12}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2a

    move v10, v11

    .line 84
    goto :goto_6

    .line 87
    :cond_2a
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->holder:Lorg/spongycastle/x509/AttributeCertificateHolder;

    if-eqz v10, :cond_3c

    .line 89
    invoke-interface {v0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getHolder()Lorg/spongycastle/x509/AttributeCertificateHolder;

    move-result-object v10

    iget-object v12, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->holder:Lorg/spongycastle/x509/AttributeCertificateHolder;

    invoke-virtual {v10, v12}, Lorg/spongycastle/x509/AttributeCertificateHolder;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3c

    move v10, v11

    .line 91
    goto :goto_6

    .line 94
    :cond_3c
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->issuer:Lorg/spongycastle/x509/AttributeCertificateIssuer;

    if-eqz v10, :cond_4e

    .line 96
    invoke-interface {v0}, Lorg/spongycastle/x509/X509AttributeCertificate;->getIssuer()Lorg/spongycastle/x509/AttributeCertificateIssuer;

    move-result-object v10

    iget-object v12, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->issuer:Lorg/spongycastle/x509/AttributeCertificateIssuer;

    invoke-virtual {v10, v12}, Lorg/spongycastle/x509/AttributeCertificateIssuer;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4e

    move v10, v11

    .line 98
    goto :goto_6

    .line 102
    :cond_4e
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCertificateValid:Ljava/util/Date;

    if-eqz v10, :cond_57

    .line 106
    :try_start_52
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCertificateValid:Ljava/util/Date;

    invoke-interface {v0, v10}, Lorg/spongycastle/x509/X509AttributeCertificate;->checkValidity(Ljava/util/Date;)V
    :try_end_57
    .catch Ljava/security/cert/CertificateExpiredException; {:try_start_52 .. :try_end_57} :catch_bb
    .catch Ljava/security/cert/CertificateNotYetValidException; {:try_start_52 .. :try_end_57} :catch_bf

    .line 117
    :cond_57
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_67

    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_108

    .line 120
    :cond_67
    sget-object v10, Lorg/spongycastle/asn1/x509/X509Extensions;->TargetInformation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 121
    invoke-virtual {v10}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0, v10}, Lorg/spongycastle/x509/X509AttributeCertificate;->getExtensionValue(Ljava/lang/String;)[B

    move-result-object v6

    .line 122
    .local v6, "targetInfoExt":[B
    if-eqz v6, :cond_108

    .line 127
    :try_start_73
    new-instance v12, Lorg/spongycastle/asn1/ASN1InputStream;

    .line 130
    invoke-static {v6}, Lorg/spongycastle/asn1/DEROctetString;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v10

    check-cast v10, Lorg/spongycastle/asn1/DEROctetString;

    invoke-virtual {v10}, Lorg/spongycastle/asn1/DEROctetString;->getOctets()[B

    move-result-object v10

    invoke-direct {v12, v10}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 131
    invoke-virtual {v12}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v10

    .line 128
    invoke-static {v10}, Lorg/spongycastle/asn1/x509/TargetInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/TargetInformation;
    :try_end_89
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_89} :catch_c3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_73 .. :try_end_89} :catch_c7

    move-result-object v7

    .line 141
    .local v7, "targetinfo":Lorg/spongycastle/asn1/x509/TargetInformation;
    invoke-virtual {v7}, Lorg/spongycastle/asn1/x509/TargetInformation;->getTargetsObjects()[Lorg/spongycastle/asn1/x509/Targets;

    move-result-object v9

    .line 142
    .local v9, "targetss":[Lorg/spongycastle/asn1/x509/Targets;
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_d3

    .line 144
    const/4 v2, 0x0

    .line 146
    .local v2, "found":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_98
    array-length v10, v9

    if-ge v3, v10, :cond_ce

    .line 148
    aget-object v5, v9, v3

    .line 149
    .local v5, "t":Lorg/spongycastle/asn1/x509/Targets;
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Targets;->getTargets()[Lorg/spongycastle/asn1/x509/Target;

    move-result-object v8

    .line 150
    .local v8, "targets":[Lorg/spongycastle/asn1/x509/Target;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_a2
    array-length v10, v8

    if-ge v4, v10, :cond_b8

    .line 152
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    aget-object v12, v8, v4

    .line 153
    invoke-virtual {v12}, Lorg/spongycastle/asn1/x509/Target;->getTargetName()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v12

    .line 152
    invoke-static {v12}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v12

    invoke-interface {v10, v12}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_cb

    .line 155
    const/4 v2, 0x1

    .line 146
    :cond_b8
    add-int/lit8 v3, v3, 0x1

    goto :goto_98

    .line 108
    .end local v2    # "found":Z
    .end local v3    # "i":I
    .end local v4    # "j":I
    .end local v5    # "t":Lorg/spongycastle/asn1/x509/Targets;
    .end local v6    # "targetInfoExt":[B
    .end local v7    # "targetinfo":Lorg/spongycastle/asn1/x509/TargetInformation;
    .end local v8    # "targets":[Lorg/spongycastle/asn1/x509/Target;
    .end local v9    # "targetss":[Lorg/spongycastle/asn1/x509/Targets;
    :catch_bb
    move-exception v1

    .local v1, "e":Ljava/security/cert/CertificateExpiredException;
    move v10, v11

    .line 110
    goto/16 :goto_6

    .line 112
    .end local v1    # "e":Ljava/security/cert/CertificateExpiredException;
    :catch_bf
    move-exception v1

    .local v1, "e":Ljava/security/cert/CertificateNotYetValidException;
    move v10, v11

    .line 114
    goto/16 :goto_6

    .line 133
    .end local v1    # "e":Ljava/security/cert/CertificateNotYetValidException;
    .restart local v6    # "targetInfoExt":[B
    :catch_c3
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    move v10, v11

    .line 135
    goto/16 :goto_6

    .line 137
    .end local v1    # "e":Ljava/io/IOException;
    :catch_c7
    move-exception v1

    .local v1, "e":Ljava/lang/IllegalArgumentException;
    move v10, v11

    .line 139
    goto/16 :goto_6

    .line 150
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v2    # "found":Z
    .restart local v3    # "i":I
    .restart local v4    # "j":I
    .restart local v5    # "t":Lorg/spongycastle/asn1/x509/Targets;
    .restart local v7    # "targetinfo":Lorg/spongycastle/asn1/x509/TargetInformation;
    .restart local v8    # "targets":[Lorg/spongycastle/asn1/x509/Target;
    .restart local v9    # "targetss":[Lorg/spongycastle/asn1/x509/Targets;
    :cond_cb
    add-int/lit8 v4, v4, 0x1

    goto :goto_a2

    .line 160
    .end local v4    # "j":I
    .end local v5    # "t":Lorg/spongycastle/asn1/x509/Targets;
    .end local v8    # "targets":[Lorg/spongycastle/asn1/x509/Target;
    :cond_ce
    if-nez v2, :cond_d3

    move v10, v11

    .line 162
    goto/16 :goto_6

    .line 165
    .end local v2    # "found":Z
    .end local v3    # "i":I
    :cond_d3
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_108

    .line 167
    const/4 v2, 0x0

    .line 169
    .restart local v2    # "found":Z
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_dd
    array-length v10, v9

    if-ge v3, v10, :cond_103

    .line 171
    aget-object v5, v9, v3

    .line 172
    .restart local v5    # "t":Lorg/spongycastle/asn1/x509/Targets;
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/Targets;->getTargets()[Lorg/spongycastle/asn1/x509/Target;

    move-result-object v8

    .line 173
    .restart local v8    # "targets":[Lorg/spongycastle/asn1/x509/Target;
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_e7
    array-length v10, v8

    if-ge v4, v10, :cond_fd

    .line 175
    iget-object v10, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    aget-object v12, v8, v4

    .line 176
    invoke-virtual {v12}, Lorg/spongycastle/asn1/x509/Target;->getTargetGroup()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v12

    .line 175
    invoke-static {v12}, Lorg/spongycastle/asn1/x509/GeneralName;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v12

    invoke-interface {v10, v12}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_100

    .line 178
    const/4 v2, 0x1

    .line 169
    :cond_fd
    add-int/lit8 v3, v3, 0x1

    goto :goto_dd

    .line 173
    :cond_100
    add-int/lit8 v4, v4, 0x1

    goto :goto_e7

    .line 183
    .end local v4    # "j":I
    .end local v5    # "t":Lorg/spongycastle/asn1/x509/Targets;
    .end local v8    # "targets":[Lorg/spongycastle/asn1/x509/Target;
    :cond_103
    if-nez v2, :cond_108

    move v10, v11

    .line 185
    goto/16 :goto_6

    .line 190
    .end local v2    # "found":Z
    .end local v3    # "i":I
    .end local v6    # "targetInfoExt":[B
    .end local v7    # "targetinfo":Lorg/spongycastle/asn1/x509/TargetInformation;
    .end local v9    # "targetss":[Lorg/spongycastle/asn1/x509/Targets;
    :cond_108
    const/4 v10, 0x1

    goto/16 :goto_6
.end method

.method public setAttributeCert(Lorg/spongycastle/x509/X509AttributeCertificate;)V
    .registers 2
    .param p1, "attributeCert"    # Lorg/spongycastle/x509/X509AttributeCertificate;

    .prologue
    .line 229
    iput-object p1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCert:Lorg/spongycastle/x509/X509AttributeCertificate;

    .line 230
    return-void
.end method

.method public setAttributeCertificateValid(Ljava/util/Date;)V
    .registers 5
    .param p1, "attributeCertificateValid"    # Ljava/util/Date;

    .prologue
    .line 256
    if-eqz p1, :cond_e

    .line 258
    new-instance v0, Ljava/util/Date;

    .line 259
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCertificateValid:Ljava/util/Date;

    .line 265
    :goto_d
    return-void

    .line 263
    :cond_e
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->attributeCertificateValid:Ljava/util/Date;

    goto :goto_d
.end method

.method public setHolder(Lorg/spongycastle/x509/AttributeCertificateHolder;)V
    .registers 2
    .param p1, "holder"    # Lorg/spongycastle/x509/AttributeCertificateHolder;

    .prologue
    .line 284
    iput-object p1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->holder:Lorg/spongycastle/x509/AttributeCertificateHolder;

    .line 285
    return-void
.end method

.method public setIssuer(Lorg/spongycastle/x509/AttributeCertificateIssuer;)V
    .registers 2
    .param p1, "issuer"    # Lorg/spongycastle/x509/AttributeCertificateIssuer;

    .prologue
    .line 305
    iput-object p1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->issuer:Lorg/spongycastle/x509/AttributeCertificateIssuer;

    .line 306
    return-void
.end method

.method public setSerialNumber(Ljava/math/BigInteger;)V
    .registers 2
    .param p1, "serialNumber"    # Ljava/math/BigInteger;

    .prologue
    .line 326
    iput-object p1, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->serialNumber:Ljava/math/BigInteger;

    .line 327
    return-void
.end method

.method public setTargetGroups(Ljava/util/Collection;)V
    .registers 3
    .param p1, "names"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 444
    invoke-direct {p0, p1}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->extractGeneralNames(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetGroups:Ljava/util/Collection;

    .line 445
    return-void
.end method

.method public setTargetNames(Ljava/util/Collection;)V
    .registers 3
    .param p1, "names"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 378
    invoke-direct {p0, p1}, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->extractGeneralNames(Ljava/util/Collection;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/x509/X509AttributeCertStoreSelector;->targetNames:Ljava/util/Collection;

    .line 379
    return-void
.end method
