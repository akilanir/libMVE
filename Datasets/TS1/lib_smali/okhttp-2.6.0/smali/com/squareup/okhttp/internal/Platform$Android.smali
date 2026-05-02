.class Lcom/squareup/okhttp/internal/Platform$Android;
.super Lcom/squareup/okhttp/internal/Platform;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Android"
.end annotation


# static fields
.field private static final MAX_LOG_LENGTH:I = 0xfa0


# instance fields
.field private final getAlpnSelectedProtocol:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final setAlpnProtocols:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final setHostname:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final setUseSessionTickets:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private final trafficStatsTagSocket:Ljava/lang/reflect/Method;

.field private final trafficStatsUntagSocket:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/internal/OptionalMethod;Lcom/squareup/okhttp/internal/OptionalMethod;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/squareup/okhttp/internal/OptionalMethod;Lcom/squareup/okhttp/internal/OptionalMethod;)V
    .registers 7
    .param p3, "trafficStatsTagSocket"    # Ljava/lang/reflect/Method;
    .param p4, "trafficStatsUntagSocket"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;",
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;",
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p1, "setUseSessionTickets":Lcom/squareup/okhttp/internal/OptionalMethod;, "Lcom/squareup/okhttp/internal/OptionalMethod<Ljava/net/Socket;>;"
    .local p2, "setHostname":Lcom/squareup/okhttp/internal/OptionalMethod;, "Lcom/squareup/okhttp/internal/OptionalMethod<Ljava/net/Socket;>;"
    .local p5, "getAlpnSelectedProtocol":Lcom/squareup/okhttp/internal/OptionalMethod;, "Lcom/squareup/okhttp/internal/OptionalMethod<Ljava/net/Socket;>;"
    .local p6, "setAlpnProtocols":Lcom/squareup/okhttp/internal/OptionalMethod;, "Lcom/squareup/okhttp/internal/OptionalMethod<Ljava/net/Socket;>;"
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/Platform;-><init>()V

    .line 186
    iput-object p1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setUseSessionTickets:Lcom/squareup/okhttp/internal/OptionalMethod;

    .line 187
    iput-object p2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setHostname:Lcom/squareup/okhttp/internal/OptionalMethod;

    .line 188
    iput-object p3, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    .line 189
    iput-object p4, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    .line 190
    iput-object p5, p0, Lcom/squareup/okhttp/internal/Platform$Android;->getAlpnSelectedProtocol:Lcom/squareup/okhttp/internal/OptionalMethod;

    .line 191
    iput-object p6, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setAlpnProtocols:Lcom/squareup/okhttp/internal/OptionalMethod;

    .line 192
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
            "Lcom/squareup/okhttp/Protocol;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 213
    if-eqz p2, :cond_1a

    .line 214
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setUseSessionTickets:Lcom/squareup/okhttp/internal/OptionalMethod;

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v1, p1, v2}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeOptionalWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setHostname:Lcom/squareup/okhttp/internal/OptionalMethod;

    new-array v2, v4, [Ljava/lang/Object;

    aput-object p2, v2, v5

    invoke-virtual {v1, p1, v2}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeOptionalWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    :cond_1a
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setAlpnProtocols:Lcom/squareup/okhttp/internal/OptionalMethod;

    if-eqz v1, :cond_33

    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setAlpnProtocols:Lcom/squareup/okhttp/internal/OptionalMethod;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/OptionalMethod;->isSupported(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    .line 220
    new-array v0, v4, [Ljava/lang/Object;

    invoke-static {p3}, Lcom/squareup/okhttp/internal/Platform$Android;->concatLengthPrefixed(Ljava/util/List;)[B

    move-result-object v1

    aput-object v1, v0, v5

    .line 221
    .local v0, "parameters":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->setAlpnProtocols:Lcom/squareup/okhttp/internal/OptionalMethod;

    invoke-virtual {v1, p1, v0}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
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
    .line 197
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_3
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_3} :catch_4
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_12

    .line 208
    return-void

    .line 198
    :catch_4
    move-exception v0

    .line 199
    .local v0, "e":Ljava/lang/AssertionError;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z

    move-result v2

    if-eqz v2, :cond_11

    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 200
    :cond_11
    throw v0

    .line 201
    .end local v0    # "e":Ljava/lang/AssertionError;
    :catch_12
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Exception in connect"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 205
    .local v1, "ioException":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 206
    throw v1
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 6
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    const/4 v2, 0x0

    .line 226
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->getAlpnSelectedProtocol:Lcom/squareup/okhttp/internal/OptionalMethod;

    if-nez v1, :cond_6

    .line 230
    :cond_5
    :goto_5
    return-object v2

    .line 227
    :cond_6
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->getAlpnSelectedProtocol:Lcom/squareup/okhttp/internal/OptionalMethod;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/OptionalMethod;->isSupported(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 229
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->getAlpnSelectedProtocol:Lcom/squareup/okhttp/internal/OptionalMethod;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v3}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    move-object v0, v1

    check-cast v0, [B

    .line 230
    .local v0, "alpnResult":[B
    if-eqz v0, :cond_27

    new-instance v1, Ljava/lang/String;

    sget-object v2, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

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
    .line 259
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "length":I
    :goto_5
    if-ge v1, v2, :cond_27

    .line 260
    const/16 v4, 0xa

    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 261
    .local v3, "newline":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_25

    .line 263
    :cond_10
    :goto_10
    add-int/lit16 v4, v1, 0xfa0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 264
    .local v0, "end":I
    const-string v4, "OkHttp"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    move v1, v0

    .line 266
    if-lt v1, v3, :cond_10

    .line 259
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .end local v0    # "end":I
    :cond_25
    move v3, v2

    .line 261
    goto :goto_10

    .line 268
    .end local v3    # "newline":I
    :cond_27
    return-void
.end method

.method public tagSocket(Ljava/net/Socket;)V
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 234
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    if-nez v1, :cond_5

    .line 243
    :goto_4
    return-void

    .line 237
    :cond_5
    :try_start_5
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_11} :catch_12
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_11} :catch_19

    goto :goto_4

    .line 238
    :catch_12
    move-exception v0

    .line 239
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 240
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_19
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public untagSocket(Ljava/net/Socket;)V
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 246
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    if-nez v1, :cond_5

    .line 255
    :goto_4
    return-void

    .line 249
    :cond_5
    :try_start_5
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_11} :catch_12
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_11} :catch_19

    goto :goto_4

    .line 250
    :catch_12
    move-exception v0

    .line 251
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 252
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_19
    move-exception v0

    .line 253
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
