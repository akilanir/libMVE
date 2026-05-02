.class public abstract Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;
.super Ljava/lang/Object;
.source "AbstractVerifier.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final BAD_COUNTRY_2LDS:[Ljava/lang/String;


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 75
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "ac"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "co"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "com"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "ed"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "edu"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "go"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "gouv"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "gov"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "info"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "lg"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "ne"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "net"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "or"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "org"

    aput-object v2, v0, v1

    sput-object v0, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    .line 81
    sget-object v0, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 82
    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 88
    return-void
.end method

.method public static acceptableCountryWildcard(Ljava/lang/String;)Z
    .registers 6
    .param p0, "cn"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v1, 0x1

    .line 242
    const-string v2, "\\."

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 243
    .local v0, "parts":[Ljava/lang/String;
    array-length v2, v0

    const/4 v3, 0x3

    if-ne v2, v3, :cond_14

    aget-object v2, v0, v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v4, :cond_15

    .line 246
    :cond_14
    :goto_14
    return v1

    :cond_15
    sget-object v2, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    aget-object v3, v0, v1

    invoke-static {v2, v3}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_14

    const/4 v1, 0x0

    goto :goto_14
.end method

.method public static countDots(Ljava/lang/String;)I
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 377
    const/4 v0, 0x0

    .line 378
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_15

    .line 379
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_12

    .line 380
    add-int/lit8 v0, v0, 0x1

    .line 378
    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 383
    :cond_15
    return v0
.end method

.method static extractCNs(Ljava/lang/String;)[Ljava/lang/String;
    .registers 7
    .param p0, "subjectPrincipal"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 267
    if-nez p0, :cond_4

    .line 306
    :cond_3
    :goto_3
    return-object v1

    .line 270
    :cond_4
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 293
    .local v0, "cnList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v5, ","

    invoke-direct {v2, p0, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    .local v2, "st":Ljava/util/StringTokenizer;
    :cond_10
    :goto_10
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 295
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 296
    .local v3, "tok":Ljava/lang/String;
    const-string v5, "CN="

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 297
    .local v4, "x":I
    if-ltz v4, :cond_10

    .line 298
    add-int/lit8 v5, v4, 0x3

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 301
    .end local v3    # "tok":Ljava/lang/String;
    .end local v4    # "x":I
    :cond_2c
    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 302
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v5

    new-array v1, v5, [Ljava/lang/String;

    .line 303
    .local v1, "cns":[Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto :goto_3
.end method

.method public static getCNs(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;
    .registers 4
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 258
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/security/auth/x500/X500Principal;->toString()Ljava/lang/String;

    move-result-object v1

    .line 260
    .local v1, "subjectPrincipal":Ljava/lang/String;
    :try_start_8
    invoke-static {v1}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->extractCNs(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_b
    .catch Ljavax/net/ssl/SSLException; {:try_start_8 .. :try_end_b} :catch_d

    move-result-object v2

    .line 262
    :goto_c
    return-object v2

    .line 261
    :catch_d
    move-exception v0

    .line 262
    .local v0, "ex":Ljavax/net/ssl/SSLException;
    const/4 v2, 0x0

    goto :goto_c
.end method

.method public static getDNSSubjectAlts(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;
    .registers 2
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 368
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->getSubjectAlts(Ljava/security/cert/X509Certificate;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getSubjectAlts(Ljava/security/cert/X509Certificate;Ljava/lang/String;)[Ljava/lang/String;
    .registers 12
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 321
    invoke-static {p1}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->isIPAddress(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3c

    .line 322
    const/4 v6, 0x7

    .line 327
    .local v6, "subjectType":I
    :goto_7
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 328
    .local v4, "subjectAltList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 330
    .local v1, "c":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    :try_start_d
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;
    :try_end_10
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_d .. :try_end_10} :catch_50

    move-result-object v1

    .line 334
    :goto_11
    if-eqz v1, :cond_3e

    .line 335
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_17
    :goto_17
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3e

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 336
    .local v0, "aC":Ljava/util/List;, "Ljava/util/List<*>;"
    move-object v2, v0

    .line 337
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    const/4 v8, 0x0

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 338
    .local v7, "type":I
    if-ne v7, v6, :cond_17

    .line 339
    const/4 v8, 0x1

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 340
    .local v3, "s":Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 324
    .end local v0    # "aC":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v1    # "c":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "subjectAltList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .end local v6    # "subjectType":I
    .end local v7    # "type":I
    :cond_3c
    const/4 v6, 0x2

    .restart local v6    # "subjectType":I
    goto :goto_7

    .line 344
    .restart local v1    # "c":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    .restart local v4    # "subjectAltList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_3e
    invoke-virtual {v4}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_4e

    .line 345
    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v8

    new-array v5, v8, [Ljava/lang/String;

    .line 346
    .local v5, "subjectAlts":[Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 349
    .end local v5    # "subjectAlts":[Ljava/lang/String;
    :goto_4d
    return-object v5

    :cond_4e
    const/4 v5, 0x0

    goto :goto_4d

    .line 332
    :catch_50
    move-exception v8

    goto :goto_11
.end method

.method private static isIPAddress(Ljava/lang/String;)Z
    .registers 2
    .param p0, "hostname"    # Ljava/lang/String;

    .prologue
    .line 387
    if-eqz p0, :cond_10

    .line 388
    invoke-static {p0}, Lcz/msebera/android/httpclient/conn/util/InetAddressUtils;->isIPv4Address(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 389
    invoke-static {p0}, Lcz/msebera/android/httpclient/conn/util/InetAddressUtils;->isIPv6Address(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private normaliseIPv6Address(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 396
    if-eqz p1, :cond_8

    invoke-static {p1}, Lcz/msebera/android/httpclient/conn/util/InetAddressUtils;->isIPv6Address(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 404
    .end local p1    # "hostname":Ljava/lang/String;
    :cond_8
    :goto_8
    return-object p1

    .line 400
    .restart local p1    # "hostname":Ljava/lang/String;
    :cond_9
    :try_start_9
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 401
    .local v0, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;
    :try_end_10
    .catch Ljava/net/UnknownHostException; {:try_start_9 .. :try_end_10} :catch_12

    move-result-object p1

    goto :goto_8

    .line 402
    .end local v0    # "inetAddress":Ljava/net/InetAddress;
    :catch_12
    move-exception v1

    .line 403
    .local v1, "uhe":Ljava/net/UnknownHostException;
    iget-object v2, p0, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected error converting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_8
.end method


# virtual methods
.method validCountryWildcard(Ljava/lang/String;)Z
    .registers 7
    .param p1, "cn"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x2

    const/4 v1, 0x1

    .line 250
    const-string v2, "\\."

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, "parts":[Ljava/lang/String;
    array-length v2, v0

    const/4 v3, 0x3

    if-ne v2, v3, :cond_14

    aget-object v2, v0, v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v4, :cond_15

    .line 254
    :cond_14
    :goto_14
    return v1

    :cond_15
    sget-object v2, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->BAD_COUNTRY_2LDS:[Ljava/lang/String;

    aget-object v3, v0, v1

    invoke-static {v2, v3}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_14

    const/4 v1, 0x0

    goto :goto_14
.end method

.method public final verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-static {p2}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->getCNs(Ljava/security/cert/X509Certificate;)[Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "cns":[Ljava/lang/String;
    invoke-static {p2, p1}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->getSubjectAlts(Ljava/security/cert/X509Certificate;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "subjectAlts":[Ljava/lang/String;
    invoke-virtual {p0, p1, v0, v1}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method public final verify(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)V
    .registers 9
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "ssl"    # Ljavax/net/ssl/SSLSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    if-nez p1, :cond_a

    .line 93
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "host to verify is null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 96
    :cond_a
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 97
    .local v2, "session":Ljavax/net/ssl/SSLSession;
    if-nez v2, :cond_24

    .line 101
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 102
    .local v1, "in":Ljava/io/InputStream;
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    .line 121
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 122
    if-nez v2, :cond_24

    .line 125
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 129
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 133
    .end local v1    # "in":Ljava/io/InputStream;
    :cond_24
    invoke-interface {v2}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    .line 134
    .local v0, "certs":[Ljava/security/cert/Certificate;
    const/4 v4, 0x0

    aget-object v3, v0, v4

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 135
    .local v3, "x509":Ljava/security/cert/X509Certificate;
    invoke-virtual {p0, p1, v3}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V

    .line 136
    return-void
.end method

.method public final verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V
    .registers 24
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "cns"    # [Ljava/lang/String;
    .param p3, "subjectAlts"    # [Ljava/lang/String;
    .param p4, "strictWithSubDomains"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 166
    new-instance v11, Ljava/util/LinkedList;

    invoke-direct {v11}, Ljava/util/LinkedList;-><init>()V

    .line 167
    .local v11, "names":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    if-eqz p2, :cond_1d

    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v16, v0

    if-lez v16, :cond_1d

    const/16 v16, 0x0

    aget-object v16, p2, v16

    if-eqz v16, :cond_1d

    .line 168
    const/16 v16, 0x0

    aget-object v16, p2, v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 170
    :cond_1d
    if-eqz p3, :cond_36

    .line 171
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v17, v0

    const/16 v16, 0x0

    :goto_26
    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_36

    aget-object v14, p3, v16

    .line 172
    .local v14, "subjectAlt":Ljava/lang/String;
    if-eqz v14, :cond_33

    .line 173
    invoke-virtual {v11, v14}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_33
    add-int/lit8 v16, v16, 0x1

    goto :goto_26

    .line 178
    .end local v14    # "subjectAlt":Ljava/lang/String;
    :cond_36
    invoke-virtual {v11}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v16

    if-eqz v16, :cond_61

    .line 179
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Certificate for <"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "> doesn\'t contain CN or DNS subjectAlt"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 180
    .local v10, "msg":Ljava/lang/String;
    new-instance v16, Ljavax/net/ssl/SSLException;

    move-object/from16 v0, v16

    invoke-direct {v0, v10}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 184
    .end local v10    # "msg":Ljava/lang/String;
    :cond_61
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .local v2, "buf":Ljava/lang/StringBuilder;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    sget-object v17, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->normaliseIPv6Address(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 189
    .local v6, "hostName":Ljava/lang/String;
    const/4 v9, 0x0

    .line 190
    .local v9, "match":Z
    invoke-virtual {v11}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_7d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_135

    .line 192
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 193
    .local v3, "cn":Ljava/lang/String;
    sget-object v16, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 195
    const-string v16, " <"

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    const/16 v16, 0x3e

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 198
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_af

    .line 199
    const-string v16, " OR"

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    :cond_af
    const-string v16, "\\."

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 206
    .local v12, "parts":[Ljava/lang/String;
    array-length v0, v12

    move/from16 v16, v0

    const/16 v17, 0x3

    move/from16 v0, v16

    move/from16 v1, v17

    if-lt v0, v1, :cond_160

    const/16 v16, 0x0

    aget-object v16, v12, v16

    const-string v17, "*"

    .line 207
    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_160

    .line 208
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->validCountryWildcard(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_160

    invoke-static/range {p1 .. p1}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->isIPAddress(Ljava/lang/String;)Z

    move-result v16

    if-nez v16, :cond_160

    const/4 v4, 0x1

    .line 210
    .local v4, "doWildcard":Z
    :goto_dd
    if-eqz v4, :cond_176

    .line 211
    const/16 v16, 0x0

    aget-object v5, v12, v16

    .line 212
    .local v5, "firstpart":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_165

    .line 213
    const/16 v16, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 214
    .local v13, "prefix":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 215
    .local v15, "suffix":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 216
    .local v7, "hostSuffix":Ljava/lang/String;
    invoke-virtual {v6, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_163

    invoke-virtual {v7, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_163

    const/4 v9, 0x1

    .line 220
    .end local v7    # "hostSuffix":Ljava/lang/String;
    .end local v13    # "prefix":Ljava/lang/String;
    .end local v15    # "suffix":Ljava/lang/String;
    :goto_120
    if-eqz v9, :cond_133

    if-eqz p4, :cond_133

    .line 223
    invoke-static {v6}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->countDots(Ljava/lang/String;)I

    move-result v16

    invoke-static {v3}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->countDots(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_174

    const/4 v9, 0x1

    .line 228
    .end local v5    # "firstpart":Ljava/lang/String;
    :cond_133
    :goto_133
    if-eqz v9, :cond_7d

    .line 232
    .end local v3    # "cn":Ljava/lang/String;
    .end local v4    # "doWildcard":Z
    .end local v12    # "parts":[Ljava/lang/String;
    :cond_135
    if-nez v9, :cond_183

    .line 233
    new-instance v16, Ljavax/net/ssl/SSLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "hostname in certificate didn\'t match: <"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "> !="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 208
    .restart local v3    # "cn":Ljava/lang/String;
    .restart local v12    # "parts":[Ljava/lang/String;
    :cond_160
    const/4 v4, 0x0

    goto/16 :goto_dd

    .line 216
    .restart local v4    # "doWildcard":Z
    .restart local v5    # "firstpart":Ljava/lang/String;
    .restart local v7    # "hostSuffix":Ljava/lang/String;
    .restart local v13    # "prefix":Ljava/lang/String;
    .restart local v15    # "suffix":Ljava/lang/String;
    :cond_163
    const/4 v9, 0x0

    goto :goto_120

    .line 218
    .end local v7    # "hostSuffix":Ljava/lang/String;
    .end local v13    # "prefix":Ljava/lang/String;
    .end local v15    # "suffix":Ljava/lang/String;
    :cond_165
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    goto :goto_120

    .line 223
    :cond_174
    const/4 v9, 0x0

    goto :goto_133

    .line 226
    .end local v5    # "firstpart":Ljava/lang/String;
    :cond_176
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->normaliseIPv6Address(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    goto :goto_133

    .line 235
    .end local v3    # "cn":Ljava/lang/String;
    .end local v4    # "doWildcard":Z
    .end local v12    # "parts":[Ljava/lang/String;
    :cond_183
    return-void
.end method

.method public final verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .registers 8
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "session"    # Ljavax/net/ssl/SSLSession;

    .prologue
    const/4 v3, 0x0

    .line 140
    :try_start_1
    invoke-interface {p2}, Ljavax/net/ssl/SSLSession;->getPeerCertificates()[Ljava/security/cert/Certificate;

    move-result-object v0

    .line 141
    .local v0, "certs":[Ljava/security/cert/Certificate;
    const/4 v4, 0x0

    aget-object v2, v0, v4

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 142
    .local v2, "x509":Ljava/security/cert/X509Certificate;
    invoke-virtual {p0, p1, v2}, Lcz/msebera/android/httpclient/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V
    :try_end_d
    .catch Ljavax/net/ssl/SSLException; {:try_start_1 .. :try_end_d} :catch_f

    .line 143
    const/4 v3, 0x1

    .line 146
    .end local v0    # "certs":[Ljava/security/cert/Certificate;
    .end local v2    # "x509":Ljava/security/cert/X509Certificate;
    :goto_e
    return v3

    .line 145
    :catch_f
    move-exception v1

    .line 146
    .local v1, "e":Ljavax/net/ssl/SSLException;
    goto :goto_e
.end method
