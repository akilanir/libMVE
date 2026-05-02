.class Lorg/jivesoftware/smack/ServerTrustManager;
.super Ljava/lang/Object;
.source "ServerTrustManager.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# static fields
.field private static cnPattern:Ljava/util/regex/Pattern;


# instance fields
.field private configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

.field private server:Ljava/lang/String;

.field private trustStore:Ljava/security/KeyStore;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    const-string v0, "(?i)(cn=)([^,]*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/ServerTrustManager;->cnPattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .registers 8
    .param p1, "server"    # Ljava/lang/String;
    .param p2, "configuration"    # Lorg/jivesoftware/smack/ConnectionConfiguration;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p2, p0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    .line 57
    iput-object p1, p0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    .line 59
    const/4 v1, 0x0

    .line 61
    .local v1, "in":Ljava/io/InputStream;
    :try_start_8
    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststoreType()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    .line 62
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststorePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1b} :catch_32
    .catchall {:try_start_8 .. :try_end_1b} :catchall_42

    .line 63
    .end local v1    # "in":Ljava/io/InputStream;
    .local v2, "in":Ljava/io/InputStream;
    :try_start_1b
    iget-object v3, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststorePassword()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_28} :catch_4e
    .catchall {:try_start_1b .. :try_end_28} :catchall_4b

    .line 71
    if-eqz v2, :cond_51

    .line 73
    :try_start_2a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2d} :catch_2f

    move-object v1, v2

    .line 80
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    :cond_2e
    :goto_2e
    return-void

    .line 75
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catch_2f
    move-exception v3

    move-object v1, v2

    .line 77
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_2e

    .line 65
    :catch_32
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    :goto_33
    :try_start_33
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 68
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setVerifyRootCAEnabled(Z)V
    :try_end_3a
    .catchall {:try_start_33 .. :try_end_3a} :catchall_42

    .line 71
    if-eqz v1, :cond_2e

    .line 73
    :try_start_3c
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3f} :catch_40

    goto :goto_2e

    .line 75
    :catch_40
    move-exception v3

    goto :goto_2e

    .line 71
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_42
    move-exception v3

    :goto_43
    if-eqz v1, :cond_48

    .line 73
    :try_start_45
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_49

    .line 77
    :cond_48
    :goto_48
    throw v3

    .line 75
    :catch_49
    move-exception v4

    goto :goto_48

    .line 71
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_4b
    move-exception v3

    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_43

    .line 65
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catch_4e
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_33

    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :cond_51
    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_2e
.end method

.method public static getPeerIdentity(Ljava/security/cert/X509Certificate;)Ljava/util/List;
    .registers 5
    .param p0, "x509Certificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/cert/X509Certificate;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 193
    invoke-static {p0}, Lorg/jivesoftware/smack/ServerTrustManager;->getSubjectAlternativeNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object v2

    .line 194
    .local v2, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 195
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v1

    .line 196
    .local v1, "name":Ljava/lang/String;
    sget-object v3, Lorg/jivesoftware/smack/ServerTrustManager;->cnPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 197
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 198
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 201
    :cond_23
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .restart local v2    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .end local v0    # "matcher":Ljava/util/regex/Matcher;
    .end local v1    # "name":Ljava/lang/String;
    :cond_2b
    return-object v2
.end method

.method private static getSubjectAlternativeNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;
    .registers 4
    .param p0, "certificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/cert/X509Certificate;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 216
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .local v2, "identities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_5
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;

    move-result-object v0

    .line 220
    .local v0, "altNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    if-nez v0, :cond_f

    .line 221
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_e
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_5 .. :try_end_e} :catch_10

    move-result-object v2

    .line 256
    .end local v0    # "altNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    .end local v2    # "identities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_f
    :goto_f
    return-object v2

    .line 253
    .restart local v2    # "identities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_10
    move-exception v1

    .line 254
    .local v1, "e":Ljava/security/cert/CertificateParsingException;
    invoke-virtual {v1}, Ljava/security/cert/CertificateParsingException;->printStackTrace()V

    goto :goto_f
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 3
    .param p1, "arg0"    # [Ljava/security/cert/X509Certificate;
    .param p2, "arg1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 88
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 20
    .param p1, "x509Certificates"    # [Ljava/security/cert/X509Certificate;
    .param p2, "arg1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 93
    move-object/from16 v0, p1

    array-length v5, v0

    .line 95
    .local v5, "nSize":I
    const/4 v14, 0x0

    aget-object v14, p1, v14

    invoke-static {v14}, Lorg/jivesoftware/smack/ServerTrustManager;->getPeerIdentity(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object v6

    .line 97
    .local v6, "peerIdentities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isVerifyChainEnabled()Z

    move-result v14

    if-eqz v14, :cond_6f

    .line 101
    const/4 v9, 0x0

    .line 102
    .local v9, "principalLast":Ljava/security/Principal;
    add-int/lit8 v4, v5, -0x1

    .local v4, "i":I
    :goto_17
    if-ltz v4, :cond_6f

    .line 103
    aget-object v13, p1, v4

    .line 104
    .local v13, "x509certificate":Ljava/security/cert/X509Certificate;
    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v8

    .line 105
    .local v8, "principalIssuer":Ljava/security/Principal;
    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v10

    .line 106
    .local v10, "principalSubject":Ljava/security/Principal;
    if-eqz v9, :cond_38

    .line 107
    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_56

    .line 109
    add-int/lit8 v14, v4, 0x1

    :try_start_2d
    aget-object v14, p1, v14

    invoke-virtual {v14}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v11

    .line 111
    .local v11, "publickey":Ljava/security/PublicKey;
    aget-object v14, p1, v4

    invoke-virtual {v14, v11}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V
    :try_end_38
    .catch Ljava/security/GeneralSecurityException; {:try_start_2d .. :try_end_38} :catch_3c

    .line 123
    .end local v11    # "publickey":Ljava/security/PublicKey;
    :cond_38
    move-object v9, v10

    .line 102
    add-int/lit8 v4, v4, -0x1

    goto :goto_17

    .line 113
    :catch_3c
    move-exception v3

    .line 114
    .local v3, "generalsecurityexception":Ljava/security/GeneralSecurityException;
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "signature verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 119
    .end local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    :cond_56
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "subject/issuer verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 127
    .end local v4    # "i":I
    .end local v8    # "principalIssuer":Ljava/security/Principal;
    .end local v9    # "principalLast":Ljava/security/Principal;
    .end local v10    # "principalSubject":Ljava/security/Principal;
    .end local v13    # "x509certificate":Ljava/security/cert/X509Certificate;
    :cond_6f
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isVerifyRootCAEnabled()Z

    move-result v14

    if-eqz v14, :cond_d3

    .line 130
    const/4 v12, 0x0

    .line 132
    .local v12, "trusted":Z
    :try_start_7a
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    add-int/lit8 v15, v5, -0x1

    aget-object v15, p1, v15

    invoke-virtual {v14, v15}, Ljava/security/KeyStore;->getCertificateAlias(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_cc

    const/4 v12, 0x1

    .line 133
    :goto_89
    if-nez v12, :cond_b1

    const/4 v14, 0x1

    if-ne v5, v14, :cond_b1

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSelfSignedCertificateEnabled()Z

    move-result v14

    if-eqz v14, :cond_b1

    .line 135
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Accepting self-signed certificate of remote server: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_b0
    .catch Ljava/security/KeyStoreException; {:try_start_7a .. :try_end_b0} :catch_ce

    .line 137
    const/4 v12, 0x1

    .line 143
    :cond_b1
    :goto_b1
    if-nez v12, :cond_d3

    .line 144
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "root certificate not trusted of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 132
    :cond_cc
    const/4 v12, 0x0

    goto :goto_89

    .line 140
    :catch_ce
    move-exception v2

    .line 141
    .local v2, "e":Ljava/security/KeyStoreException;
    invoke-virtual {v2}, Ljava/security/KeyStoreException;->printStackTrace()V

    goto :goto_b1

    .line 148
    .end local v2    # "e":Ljava/security/KeyStoreException;
    .end local v12    # "trusted":Z
    :cond_d3
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isNotMatchingDomainCheckEnabled()Z

    move-result v14

    if-eqz v14, :cond_148

    .line 152
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_125

    const/4 v14, 0x0

    invoke-interface {v6, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    const-string v15, "*."

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_125

    .line 154
    const/4 v14, 0x0

    invoke-interface {v6, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    const-string v15, "*."

    const-string v16, ""

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .line 156
    .local v7, "peerIdentity":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    invoke-virtual {v14, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_148

    .line 157
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "target verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 160
    .end local v7    # "peerIdentity":Ljava/lang/String;
    :cond_125
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    invoke-interface {v6, v14}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_148

    .line 161
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "target verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 165
    :cond_148
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isExpiredCertificatesCheckEnabled()Z

    move-result v14

    if-eqz v14, :cond_182

    .line 168
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 169
    .local v1, "date":Ljava/util/Date;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_158
    if-ge v4, v5, :cond_182

    .line 171
    :try_start_15a
    aget-object v14, p1, v4

    invoke-virtual {v14, v1}, Ljava/security/cert/X509Certificate;->checkValidity(Ljava/util/Date;)V
    :try_end_15f
    .catch Ljava/security/GeneralSecurityException; {:try_start_15a .. :try_end_15f} :catch_162

    .line 169
    add-int/lit8 v4, v4, 0x1

    goto :goto_158

    .line 173
    :catch_162
    move-exception v3

    .line 174
    .restart local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "invalid date of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 179
    .end local v1    # "date":Ljava/util/Date;
    .end local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    .end local v4    # "i":I
    :cond_182
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 83
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    return-object v0
.end method
