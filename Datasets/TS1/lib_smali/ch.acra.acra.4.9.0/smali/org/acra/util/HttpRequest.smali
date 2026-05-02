.class public final Lorg/acra/util/HttpRequest;
.super Ljava/lang/Object;
.source "HttpRequest.java"


# static fields
.field private static final HTTP_CLIENT_ERROR:I = 0x190

.field private static final HTTP_CONFLICT:I = 0x199

.field private static final HTTP_FORBIDDEN:I = 0x193

.field private static final HTTP_METHOD_NOT_ALLOWED:I = 0x195

.field private static final HTTP_REDIRECT:I = 0x12c

.field private static final HTTP_SUCCESS:I = 0xc8

.field private static final HTTP_UNAUTHORIZED:I = 0x191

.field private static final MAX_HTTP_CODE:I = 0x258

.field private static final UTF8:Ljava/lang/String; = "UTF-8"


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private connectionTimeOut:I

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private login:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private socketTimeOut:I


# direct methods
.method public constructor <init>(Lorg/acra/config/ACRAConfiguration;)V
    .registers 3
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/16 v0, 0xbb8

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput v0, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    .line 54
    iput v0, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    .line 58
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->config:Lorg/acra/config/ACRAConfiguration;

    .line 59
    return-void
.end method

.method public static getParamsAsFormString(Ljava/util/Map;)Ljava/lang/String;
    .registers 8
    .param p0    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 199
    .local p0, "parameters":Ljava/util/Map;, "Ljava/util/Map<**>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .local v0, "dataBfr":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_52

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 201
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_24

    .line 202
    const/16 v5, 0x26

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 204
    :cond_24
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 205
    .local v2, "preliminaryValue":Ljava/lang/Object;
    if-nez v2, :cond_50

    const-string v3, ""

    .line 206
    .local v3, "value":Ljava/lang/Object;
    :goto_2c
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    const/16 v5, 0x3d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 208
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_d

    .end local v3    # "value":Ljava/lang/Object;
    :cond_50
    move-object v3, v2

    .line 205
    goto :goto_2c

    .line 211
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    .end local v2    # "preliminaryValue":Ljava/lang/Object;
    :cond_52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public send(Landroid/content/Context;Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)V
    .registers 26
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "method"    # Lorg/acra/sender/HttpSender$Method;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "content"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "type"    # Lorg/acra/sender/HttpSender$Type;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual/range {p2 .. p2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v14

    check-cast v14, Ljava/net/HttpURLConnection;

    .line 94
    .local v14, "urlConnection":Ljava/net/HttpURLConnection;
    instance-of v15, v14, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v15, :cond_3e

    .line 96
    :try_start_a
    move-object v0, v14

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    move-object v8, v0

    .line 98
    .local v8, "httpsUrlConnection":Ljavax/net/ssl/HttpsURLConnection;
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "algorithm":Ljava/lang/String;
    invoke-static {v2}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v13

    .line 100
    .local v13, "tmf":Ljavax/net/ssl/TrustManagerFactory;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/util/HttpRequest;->config:Lorg/acra/config/ACRAConfiguration;

    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lorg/acra/security/KeyStoreHelper;->getKeyStore(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Ljava/security/KeyStore;

    move-result-object v9

    .line 102
    .local v9, "keyStore":Ljava/security/KeyStore;
    invoke-virtual {v13, v9}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 104
    const-string v15, "TLS"

    invoke-static {v15}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v12

    .line 105
    .local v12, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v15, 0x0

    invoke-virtual {v13}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v16

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v12, v15, v0, v1}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 107
    invoke-virtual {v12}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v15

    invoke-virtual {v8, v15}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
    :try_end_3e
    .catch Ljava/security/GeneralSecurityException; {:try_start_a .. :try_end_3e} :catch_101

    .line 114
    .end local v2    # "algorithm":Ljava/lang/String;
    .end local v8    # "httpsUrlConnection":Ljavax/net/ssl/HttpsURLConnection;
    .end local v9    # "keyStore":Ljava/security/KeyStore;
    .end local v12    # "sslContext":Ljavax/net/ssl/SSLContext;
    .end local v13    # "tmf":Ljavax/net/ssl/TrustManagerFactory;
    :cond_3e
    :goto_3e
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    if-eqz v15, :cond_9c

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    if-eqz v15, :cond_9c

    .line 115
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x3a

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 116
    .local v4, "credentials":Ljava/lang/String;
    new-instance v6, Ljava/lang/String;

    const-string v15, "UTF-8"

    invoke-virtual {v4, v15}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    const/16 v16, 0x2

    invoke-static/range {v15 .. v16}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v15

    const-string v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-direct {v6, v15, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 117
    .local v6, "encoded":Ljava/lang/String;
    const-string v15, "Authorization"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Basic "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .end local v4    # "credentials":Ljava/lang/String;
    .end local v6    # "encoded":Ljava/lang/String;
    :cond_9c
    move-object/from16 v0, p0

    iget v15, v0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 121
    move-object/from16 v0, p0

    iget v15, v0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 124
    const-string v15, "User-Agent"

    const-string v16, "Android ACRA %1$s"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const-string v19, "4.9.0"

    aput-object v19, v17, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const-string v15, "Accept"

    const-string v16, "text/html,application/xml,application/json,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5"

    invoke-virtual/range {v14 .. v16}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string v15, "Content-Type"

    invoke-virtual/range {p5 .. p5}, Lorg/acra/sender/HttpSender$Type;->getContentType()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    if-eqz v15, :cond_126

    .line 130
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    invoke-interface {v15}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_e5
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_126

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 131
    .local v7, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    invoke-virtual/range {v14 .. v16}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e5

    .line 108
    .end local v7    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_101
    move-exception v5

    .line 109
    .local v5, "e":Ljava/security/GeneralSecurityException;
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Could not configure SSL for ACRA request to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-interface {v15, v0, v1, v5}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3e

    .line 135
    .end local v5    # "e":Ljava/security/GeneralSecurityException;
    :cond_126
    const-string v15, "UTF-8"

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 138
    .local v3, "contentAsBytes":[B
    invoke-virtual/range {p3 .. p3}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 139
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 140
    array-length v15, v3

    invoke-virtual {v14, v15}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 143
    const-string v15, "http.keepAlive"

    const-string v16, "false"

    invoke-static/range {v15 .. v16}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 145
    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->connect()V

    .line 147
    new-instance v10, Ljava/io/BufferedOutputStream;

    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v15

    invoke-direct {v10, v15}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 149
    .local v10, "outputStream":Ljava/io/OutputStream;
    :try_start_150
    invoke-virtual {v10, v3}, Ljava/io/OutputStream;->write([B)V

    .line 150
    invoke-virtual {v10}, Ljava/io/OutputStream;->flush()V
    :try_end_156
    .catchall {:try_start_150 .. :try_end_156} :catchall_1f9

    .line 152
    invoke-static {v10}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    .line 155
    sget-boolean v15, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v15, :cond_17b

    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Sending request to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :cond_17b
    sget-boolean v15, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v15, :cond_1a3

    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Http "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " content : "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    :cond_1a3
    sget-boolean v15, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v15, :cond_1b2

    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    move-object/from16 v0, v16

    move-object/from16 v1, p4

    invoke-interface {v15, v0, v1}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :cond_1b2
    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v11

    .line 160
    .local v11, "responseCode":I
    sget-boolean v15, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v15, :cond_1e4

    .line 161
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Request response : "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " : "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    :cond_1e4
    const/16 v15, 0xc8

    if-lt v11, v15, :cond_1fe

    const/16 v15, 0x12c

    if-ge v11, v15, :cond_1fe

    .line 164
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v17, "Request received by server"

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    :goto_1f5
    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 187
    return-void

    .line 152
    .end local v11    # "responseCode":I
    :catchall_1f9
    move-exception v15

    invoke-static {v10}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    throw v15

    .line 165
    .restart local v11    # "responseCode":I
    :cond_1fe
    const/16 v15, 0x191

    if-ne v11, v15, :cond_20c

    .line 168
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v17, "401: Login validation error on server - request will be discarded"

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1f5

    .line 169
    :cond_20c
    const/16 v15, 0x193

    if-ne v11, v15, :cond_21a

    .line 171
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v17, "403: Data validation error on server - request will be discarded"

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1f5

    .line 172
    :cond_21a
    const/16 v15, 0x195

    if-ne v11, v15, :cond_243

    .line 175
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "405: Server rejected Http "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " - request will be discarded"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1f5

    .line 176
    :cond_243
    const/16 v15, 0x199

    if-ne v11, v15, :cond_251

    .line 178
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v17, "409: Server has already received this post - request will be discarded"

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1f5

    .line 179
    :cond_251
    const/16 v15, 0x190

    if-lt v11, v15, :cond_29e

    const/16 v15, 0x258

    if-ge v11, v15, :cond_29e

    .line 180
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Could not send ACRA Post responseCode="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " message="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    new-instance v15, Ljava/io/IOException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Host returned error code "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 183
    :cond_29e
    sget-object v15, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v16, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Could not send ACRA Post - request will be discarded. responseCode="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " message="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v14}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v15 .. v17}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1f5
.end method

.method public setConnectionTimeOut(I)V
    .registers 2
    .param p1, "connectionTimeOut"    # I

    .prologue
    .line 70
    iput p1, p0, Lorg/acra/util/HttpRequest;->connectionTimeOut:I

    .line 71
    return-void
.end method

.method public setHeaders(Ljava/util/Map;)V
    .registers 2
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->headers:Ljava/util/Map;

    .line 79
    return-void
.end method

.method public setLogin(Ljava/lang/String;)V
    .registers 2
    .param p1, "login"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 62
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->login:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .registers 2
    .param p1, "password"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 66
    iput-object p1, p0, Lorg/acra/util/HttpRequest;->password:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setSocketTimeOut(I)V
    .registers 2
    .param p1, "socketTimeOut"    # I

    .prologue
    .line 74
    iput p1, p0, Lorg/acra/util/HttpRequest;->socketTimeOut:I

    .line 75
    return-void
.end method
