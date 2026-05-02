.class public Lcom/loopj/android/http/MySSLSocketFactory;
.super Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;
.source "MySSLSocketFactory.java"


# instance fields
.field final sslContext:Ljavax/net/ssl/SSLContext;


# direct methods
.method public constructor <init>(Ljava/security/KeyStore;)V
    .registers 7
    .param p1, "truststore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;,
            Ljava/security/KeyStoreException;,
            Ljava/security/UnrecoverableKeyException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 71
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 59
    const-string v1, "TLS"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    iput-object v1, p0, Lcom/loopj/android/http/MySSLSocketFactory;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 73
    new-instance v0, Lcom/loopj/android/http/MySSLSocketFactory$1;

    invoke-direct {v0, p0}, Lcom/loopj/android/http/MySSLSocketFactory$1;-><init>(Lcom/loopj/android/http/MySSLSocketFactory;)V

    .line 85
    .local v0, "tm":Ljavax/net/ssl/X509TrustManager;
    iget-object v1, p0, Lcom/loopj/android/http/MySSLSocketFactory;->sslContext:Ljavax/net/ssl/SSLContext;

    const/4 v2, 0x1

    new-array v2, v2, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v4, v2, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 86
    return-void
.end method

.method public static getFixedSocketFactory()Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;
    .registers 3

    .prologue
    .line 152
    :try_start_0
    new-instance v0, Lcom/loopj/android/http/MySSLSocketFactory;

    invoke-static {}, Lcom/loopj/android/http/MySSLSocketFactory;->getKeystore()Ljava/security/KeyStore;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/loopj/android/http/MySSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 153
    .local v0, "socketFactory":Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;
    sget-object v2, Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v0, v2}, Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lcz/msebera/android/httpclient/conn/ssl/X509HostnameVerifier;)V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_e} :catch_f

    .line 158
    :goto_e
    return-object v0

    .line 154
    :catch_f
    move-exception v1

    .line 155
    .local v1, "t":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 156
    invoke-static {}, Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;->getSocketFactory()Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;

    move-result-object v0

    goto :goto_e
.end method

.method public static getKeystore()Ljava/security/KeyStore;
    .registers 4

    .prologue
    .line 134
    const/4 v1, 0x0

    .line 136
    .local v1, "trustStore":Ljava/security/KeyStore;
    :try_start_1
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v1

    .line 137
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_e} :catch_f

    .line 141
    :goto_e
    return-object v1

    .line 138
    :catch_f
    move-exception v0

    .line 139
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_e
.end method

.method public static getKeystoreOfCA(Ljava/io/InputStream;)Ljava/security/KeyStore;
    .registers 11
    .param p0, "cert"    # Ljava/io/InputStream;

    .prologue
    .line 97
    const/4 v1, 0x0

    .line 98
    .local v1, "caInput":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 100
    .local v0, "ca":Ljava/security/cert/Certificate;
    :try_start_2
    const-string v8, "X.509"

    invoke-static {v8}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v3

    .line 101
    .local v3, "cf":Ljava/security/cert/CertificateFactory;
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_d
    .catch Ljava/security/cert/CertificateException; {:try_start_2 .. :try_end_d} :catch_31
    .catchall {:try_start_2 .. :try_end_d} :catchall_40

    .line 102
    .end local v1    # "caInput":Ljava/io/InputStream;
    .local v2, "caInput":Ljava/io/InputStream;
    :try_start_d
    invoke-virtual {v3, v2}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    :try_end_10
    .catch Ljava/security/cert/CertificateException; {:try_start_d .. :try_end_10} :catch_54
    .catchall {:try_start_d .. :try_end_10} :catchall_51

    move-result-object v0

    .line 107
    if-eqz v2, :cond_16

    .line 108
    :try_start_13
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_16} :catch_2b

    :cond_16
    move-object v1, v2

    .line 116
    .end local v2    # "caInput":Ljava/io/InputStream;
    .end local v3    # "cf":Ljava/security/cert/CertificateFactory;
    .restart local v1    # "caInput":Ljava/io/InputStream;
    :cond_17
    :goto_17
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v7

    .line 117
    .local v7, "keyStoreType":Ljava/lang/String;
    const/4 v6, 0x0

    .line 119
    .local v6, "keyStore":Ljava/security/KeyStore;
    :try_start_1c
    invoke-static {v7}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v6

    .line 120
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 121
    const-string v8, "ca"

    invoke-virtual {v6, v8, v0}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_2a} :catch_4c

    .line 125
    :goto_2a
    return-object v6

    .line 110
    .end local v1    # "caInput":Ljava/io/InputStream;
    .end local v6    # "keyStore":Ljava/security/KeyStore;
    .end local v7    # "keyStoreType":Ljava/lang/String;
    .restart local v2    # "caInput":Ljava/io/InputStream;
    .restart local v3    # "cf":Ljava/security/cert/CertificateFactory;
    :catch_2b
    move-exception v4

    .line 111
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    move-object v1, v2

    .line 113
    .end local v2    # "caInput":Ljava/io/InputStream;
    .restart local v1    # "caInput":Ljava/io/InputStream;
    goto :goto_17

    .line 103
    .end local v3    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v4    # "e":Ljava/io/IOException;
    :catch_31
    move-exception v5

    .line 104
    .local v5, "e1":Ljava/security/cert/CertificateException;
    :goto_32
    :try_start_32
    invoke-virtual {v5}, Ljava/security/cert/CertificateException;->printStackTrace()V
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_40

    .line 107
    if-eqz v1, :cond_17

    .line 108
    :try_start_37
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3a} :catch_3b

    goto :goto_17

    .line 110
    :catch_3b
    move-exception v4

    .line 111
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_17

    .line 106
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "e1":Ljava/security/cert/CertificateException;
    :catchall_40
    move-exception v8

    .line 107
    :goto_41
    if-eqz v1, :cond_46

    .line 108
    :try_start_43
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_46} :catch_47

    .line 112
    :cond_46
    :goto_46
    throw v8

    .line 110
    :catch_47
    move-exception v4

    .line 111
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_46

    .line 122
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v6    # "keyStore":Ljava/security/KeyStore;
    .restart local v7    # "keyStoreType":Ljava/lang/String;
    :catch_4c
    move-exception v4

    .line 123
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2a

    .line 106
    .end local v1    # "caInput":Ljava/io/InputStream;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v6    # "keyStore":Ljava/security/KeyStore;
    .end local v7    # "keyStoreType":Ljava/lang/String;
    .restart local v2    # "caInput":Ljava/io/InputStream;
    .restart local v3    # "cf":Ljava/security/cert/CertificateFactory;
    :catchall_51
    move-exception v8

    move-object v1, v2

    .end local v2    # "caInput":Ljava/io/InputStream;
    .restart local v1    # "caInput":Ljava/io/InputStream;
    goto :goto_41

    .line 103
    .end local v1    # "caInput":Ljava/io/InputStream;
    .restart local v2    # "caInput":Ljava/io/InputStream;
    :catch_54
    move-exception v5

    move-object v1, v2

    .end local v2    # "caInput":Ljava/io/InputStream;
    .restart local v1    # "caInput":Ljava/io/InputStream;
    goto :goto_32
.end method

.method public static getNewHttpClient(Ljava/security/KeyStore;)Lcz/msebera/android/httpclient/impl/client/DefaultHttpClient;
    .registers 10
    .param p0, "keyStore"    # Ljava/security/KeyStore;

    .prologue
    .line 170
    :try_start_0
    new-instance v4, Lcom/loopj/android/http/MySSLSocketFactory;

    invoke-direct {v4, p0}, Lcom/loopj/android/http/MySSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 171
    .local v4, "sf":Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;
    new-instance v3, Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;

    invoke-direct {v3}, Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;-><init>()V

    .line 172
    .local v3, "registry":Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;
    new-instance v5, Lcz/msebera/android/httpclient/conn/scheme/Scheme;

    const-string v6, "http"

    invoke-static {}, Lcz/msebera/android/httpclient/conn/scheme/PlainSocketFactory;->getSocketFactory()Lcz/msebera/android/httpclient/conn/scheme/PlainSocketFactory;

    move-result-object v7

    const/16 v8, 0x50

    invoke-direct {v5, v6, v7, v8}, Lcz/msebera/android/httpclient/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lcz/msebera/android/httpclient/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v5}, Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;->register(Lcz/msebera/android/httpclient/conn/scheme/Scheme;)Lcz/msebera/android/httpclient/conn/scheme/Scheme;

    .line 173
    new-instance v5, Lcz/msebera/android/httpclient/conn/scheme/Scheme;

    const-string v6, "https"

    const/16 v7, 0x1bb

    invoke-direct {v5, v6, v4, v7}, Lcz/msebera/android/httpclient/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lcz/msebera/android/httpclient/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v5}, Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;->register(Lcz/msebera/android/httpclient/conn/scheme/Scheme;)Lcz/msebera/android/httpclient/conn/scheme/Scheme;

    .line 175
    new-instance v2, Lcz/msebera/android/httpclient/params/BasicHttpParams;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/params/BasicHttpParams;-><init>()V

    .line 176
    .local v2, "params":Lcz/msebera/android/httpclient/params/HttpParams;
    sget-object v5, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-static {v2, v5}, Lcz/msebera/android/httpclient/params/HttpProtocolParams;->setVersion(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/ProtocolVersion;)V

    .line 177
    const-string v5, "UTF-8"

    invoke-static {v2, v5}, Lcz/msebera/android/httpclient/params/HttpProtocolParams;->setContentCharset(Lcz/msebera/android/httpclient/params/HttpParams;Ljava/lang/String;)V

    .line 179
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v2, v3}, Lcz/msebera/android/httpclient/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;)V

    .line 181
    .local v0, "ccm":Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    new-instance v5, Lcz/msebera/android/httpclient/impl/client/DefaultHttpClient;

    invoke-direct {v5, v0, v2}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpClient;-><init>(Lcz/msebera/android/httpclient/conn/ClientConnectionManager;Lcz/msebera/android/httpclient/params/HttpParams;)V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3f} :catch_40

    .line 183
    .end local v0    # "ccm":Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
    .end local v2    # "params":Lcz/msebera/android/httpclient/params/HttpParams;
    .end local v3    # "registry":Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;
    .end local v4    # "sf":Lcz/msebera/android/httpclient/conn/ssl/SSLSocketFactory;
    :goto_3f
    return-object v5

    .line 182
    :catch_40
    move-exception v1

    .line 183
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lcz/msebera/android/httpclient/impl/client/DefaultHttpClient;

    invoke-direct {v5}, Lcz/msebera/android/httpclient/impl/client/DefaultHttpClient;-><init>()V

    goto :goto_3f
.end method


# virtual methods
.method public createSocket()Ljava/net/Socket;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    iget-object v0, p0, Lcom/loopj/android/http/MySSLSocketFactory;->sslContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    iget-object v0, p0, Lcom/loopj/android/http/MySSLSocketFactory;->sslContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public fixHttpsURLConnection()V
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/loopj/android/http/MySSLSocketFactory;->sslContext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-static {v0}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 202
    return-void
.end method
