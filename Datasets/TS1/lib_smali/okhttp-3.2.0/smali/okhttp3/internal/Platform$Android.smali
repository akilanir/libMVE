.class Lokhttp3/internal/Platform$Android;
.super Lokhttp3/internal/Platform;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Android"
.end annotation


# static fields
.field private static final MAX_LOG_LENGTH:I = 0xfa0


# instance fields
.field private final getAlpnSelectedProtocol:Lokhttp3/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final setAlpnProtocols:Lokhttp3/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final setHostname:Lokhttp3/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final setUseSessionTickets:Lokhttp3/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final sslParametersClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lokhttp3/internal/OptionalMethod;Lokhttp3/internal/OptionalMethod;Lokhttp3/internal/OptionalMethod;Lokhttp3/internal/OptionalMethod;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;",
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;",
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;",
            "Lokhttp3/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 200
    .local p1, "sslParametersClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "setUseSessionTickets":Lokhttp3/internal/OptionalMethod;, "Lokhttp3/internal/OptionalMethod<Ljava/net/Socket;>;"
    .local p3, "setHostname":Lokhttp3/internal/OptionalMethod;, "Lokhttp3/internal/OptionalMethod<Ljava/net/Socket;>;"
    .local p4, "getAlpnSelectedProtocol":Lokhttp3/internal/OptionalMethod;, "Lokhttp3/internal/OptionalMethod<Ljava/net/Socket;>;"
    .local p5, "setAlpnProtocols":Lokhttp3/internal/OptionalMethod;, "Lokhttp3/internal/OptionalMethod<Ljava/net/Socket;>;"
    invoke-direct {p0}, Lokhttp3/internal/Platform;-><init>()V

    .line 201
    iput-object p1, p0, Lokhttp3/internal/Platform$Android;->sslParametersClass:Ljava/lang/Class;

    .line 202
    iput-object p2, p0, Lokhttp3/internal/Platform$Android;->setUseSessionTickets:Lokhttp3/internal/OptionalMethod;

    .line 203
    iput-object p3, p0, Lokhttp3/internal/Platform$Android;->setHostname:Lokhttp3/internal/OptionalMethod;

    .line 204
    iput-object p4, p0, Lokhttp3/internal/Platform$Android;->getAlpnSelectedProtocol:Lokhttp3/internal/OptionalMethod;

    .line 205
    iput-object p5, p0, Lokhttp3/internal/Platform$Android;->setAlpnProtocols:Lokhttp3/internal/OptionalMethod;

    .line 206
    return-void
.end method


# virtual methods
.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V
    .registers 10
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLSocket;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lokhttp3/Protocol;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "protocols":Ljava/util/List;, "Ljava/util/List<Lokhttp3/Protocol;>;"
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 255
    if-eqz p2, :cond_1a

    .line 256
    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->setUseSessionTickets:Lokhttp3/internal/OptionalMethod;

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v1, p1, v2}, Lokhttp3/internal/OptionalMethod;->invokeOptionalWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->setHostname:Lokhttp3/internal/OptionalMethod;

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p2, v2, v5

    invoke-virtual {v1, p1, v2}, Lokhttp3/internal/OptionalMethod;->invokeOptionalWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    :cond_1a
    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->setAlpnProtocols:Lokhttp3/internal/OptionalMethod;

    if-eqz v1, :cond_33

    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->setAlpnProtocols:Lokhttp3/internal/OptionalMethod;

    invoke-virtual {v1, p1}, Lokhttp3/internal/OptionalMethod;->isSupported(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    .line 262
    new-array v0, v4, [Ljava/lang/Object;

    invoke-static {p3}, Lokhttp3/internal/Platform$Android;->concatLengthPrefixed(Ljava/util/List;)[B

    move-result-object v1

    aput-object v1, v0, v5

    .line 263
    .local v0, "parameters":[Ljava/lang/Object;
    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->setAlpnProtocols:Lokhttp3/internal/OptionalMethod;

    invoke-virtual {v1, p1, v0}, Lokhttp3/internal/OptionalMethod;->invokeWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .end local v0    # "parameters":[Ljava/lang/Object;
    :cond_33
    return-void
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "address"    # Ljava/net/InetSocketAddress;
    .param p3, "connectTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_3
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_3} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_12

    .line 222
    return-void

    .line 212
    :catch_4
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/AssertionError;
    invoke-static {v0}, Lokhttp3/internal/Util;->isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z

    move-result v2

    if-eqz v2, :cond_11

    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 214
    :cond_11
    throw v0

    .line 215
    .end local v0    # "e":Ljava/lang/AssertionError;
    :catch_12
    move-exception v0

    .line 218
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Exception in connect"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 219
    .local v1, "ioException":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 220
    throw v1
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 6
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    const/4 v2, 0x0

    .line 268
    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->getAlpnSelectedProtocol:Lokhttp3/internal/OptionalMethod;

    if-nez v1, :cond_6

    .line 272
    :cond_5
    :goto_5
    return-object v2

    .line 269
    :cond_6
    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->getAlpnSelectedProtocol:Lokhttp3/internal/OptionalMethod;

    invoke-virtual {v1, p1}, Lokhttp3/internal/OptionalMethod;->isSupported(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 271
    iget-object v1, p0, Lokhttp3/internal/Platform$Android;->getAlpnSelectedProtocol:Lokhttp3/internal/OptionalMethod;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v3}, Lokhttp3/internal/OptionalMethod;->invokeWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    move-object v0, v1

    check-cast v0, [B

    .line 272
    .local v0, "alpnResult":[B
    if-eqz v0, :cond_27

    new-instance v1, Ljava/lang/String;

    sget-object v2, Lokhttp3/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    :goto_25
    move-object v2, v1

    goto :goto_5

    :cond_27
    move-object v1, v2

    goto :goto_25
.end method

.method public log(Ljava/lang/String;)V
    .registers 8
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 277
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "length":I
    :goto_5
    if-ge v1, v2, :cond_27

    .line 278
    const/16 v4, 0xa

    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 279
    .local v3, "newline":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_25

    .line 281
    :cond_10
    :goto_10
    add-int/lit16 v4, v1, 0xfa0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 282
    .local v0, "end":I
    const-string v4, "OkHttp"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    move v1, v0

    .line 284
    if-lt v1, v3, :cond_10

    .line 277
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .end local v0    # "end":I
    :cond_25
    move v3, v2

    .line 279
    goto :goto_10

    .line 286
    .end local v3    # "newline":I
    :cond_27
    return-void
.end method

.method public trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;
    .registers 9
    .param p1, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;

    .prologue
    .line 225
    iget-object v4, p0, Lokhttp3/internal/Platform$Android;->sslParametersClass:Ljava/lang/Class;

    const-string v5, "sslParameters"

    invoke-static {p1, v4, v5}, Lokhttp3/internal/Platform$Android;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 226
    .local v0, "context":Ljava/lang/Object;
    if-nez v0, :cond_1f

    .line 230
    :try_start_a
    const-string v4, "com.google.android.gms.org.conscrypt.SSLParametersImpl"

    const/4 v5, 0x0

    .line 232
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    .line 230
    invoke-static {v4, v5, v6}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    .line 233
    .local v2, "gmsSslParametersClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "sslParameters"

    invoke-static {p1, v2, v4}, Lokhttp3/internal/Platform$Android;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a .. :try_end_1e} :catch_2c

    move-result-object v0

    .line 239
    .end local v2    # "gmsSslParametersClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1f
    const-class v4, Ljavax/net/ssl/X509TrustManager;

    const-string v5, "x509TrustManager"

    invoke-static {v0, v4, v5}, Lokhttp3/internal/Platform$Android;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/net/ssl/X509TrustManager;

    .line 241
    .local v3, "x509TrustManager":Ljavax/net/ssl/X509TrustManager;
    if-eqz v3, :cond_32

    .line 243
    .end local v3    # "x509TrustManager":Ljavax/net/ssl/X509TrustManager;
    :goto_2b
    return-object v3

    .line 234
    :catch_2c
    move-exception v1

    .line 235
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    invoke-super {p0, p1}, Lokhttp3/internal/Platform;->trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;

    move-result-object v3

    goto :goto_2b

    .line 243
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v3    # "x509TrustManager":Ljavax/net/ssl/X509TrustManager;
    :cond_32
    const-class v4, Ljavax/net/ssl/X509TrustManager;

    const-string v5, "trustManager"

    invoke-static {v0, v4, v5}, Lokhttp3/internal/Platform$Android;->readFieldOrNull(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/net/ssl/X509TrustManager;

    move-object v3, v4

    goto :goto_2b
.end method

.method public trustRootIndex(Ljavax/net/ssl/X509TrustManager;)Lokhttp3/internal/tls/TrustRootIndex;
    .registers 3
    .param p1, "trustManager"    # Ljavax/net/ssl/X509TrustManager;

    .prologue
    .line 247
    invoke-static {p1}, Lokhttp3/internal/tls/AndroidTrustRootIndex;->get(Ljavax/net/ssl/X509TrustManager;)Lokhttp3/internal/tls/TrustRootIndex;

    move-result-object v0

    .line 248
    .local v0, "result":Lokhttp3/internal/tls/TrustRootIndex;
    if-eqz v0, :cond_7

    .line 249
    .end local v0    # "result":Lokhttp3/internal/tls/TrustRootIndex;
    :goto_6
    return-object v0

    .restart local v0    # "result":Lokhttp3/internal/tls/TrustRootIndex;
    :cond_7
    invoke-super {p0, p1}, Lokhttp3/internal/Platform;->trustRootIndex(Ljavax/net/ssl/X509TrustManager;)Lokhttp3/internal/tls/TrustRootIndex;

    move-result-object v0

    goto :goto_6
.end method
