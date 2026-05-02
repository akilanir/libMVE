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
.field private static final GET_ALPN_SELECTED_PROTOCOL:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private static final SET_ALPN_PROTOCOLS:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private static final SET_HOSTNAME:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field private static final SET_USE_SESSION_TICKETS:Lcom/squareup/okhttp/internal/OptionalMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/okhttp/internal/OptionalMethod",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final trafficStatsTagSocket:Ljava/lang/reflect/Method;

.field private final trafficStatsUntagSocket:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 155
    new-instance v0, Lcom/squareup/okhttp/internal/OptionalMethod;

    const-string v1, "setUseSessionTickets"

    new-array v2, v5, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v4

    invoke-direct {v0, v6, v1, v2}, Lcom/squareup/okhttp/internal/OptionalMethod;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    sput-object v0, Lcom/squareup/okhttp/internal/Platform$Android;->SET_USE_SESSION_TICKETS:Lcom/squareup/okhttp/internal/OptionalMethod;

    .line 158
    new-instance v0, Lcom/squareup/okhttp/internal/OptionalMethod;

    const-string v1, "setHostname"

    new-array v2, v5, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-direct {v0, v6, v1, v2}, Lcom/squareup/okhttp/internal/OptionalMethod;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    sput-object v0, Lcom/squareup/okhttp/internal/Platform$Android;->SET_HOSTNAME:Lcom/squareup/okhttp/internal/OptionalMethod;

    .line 161
    new-instance v0, Lcom/squareup/okhttp/internal/OptionalMethod;

    const-class v1, [B

    const-string v2, "getAlpnSelectedProtocol"

    new-array v3, v4, [Ljava/lang/Class;

    invoke-direct {v0, v1, v2, v3}, Lcom/squareup/okhttp/internal/OptionalMethod;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    sput-object v0, Lcom/squareup/okhttp/internal/Platform$Android;->GET_ALPN_SELECTED_PROTOCOL:Lcom/squareup/okhttp/internal/OptionalMethod;

    .line 164
    new-instance v0, Lcom/squareup/okhttp/internal/OptionalMethod;

    const-string v1, "setAlpnProtocols"

    new-array v2, v5, [Ljava/lang/Class;

    const-class v3, [B

    aput-object v3, v2, v4

    invoke-direct {v0, v6, v1, v2}, Lcom/squareup/okhttp/internal/OptionalMethod;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    sput-object v0, Lcom/squareup/okhttp/internal/Platform$Android;->SET_ALPN_PROTOCOLS:Lcom/squareup/okhttp/internal/OptionalMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "trafficStatsTagSocket"    # Ljava/lang/reflect/Method;
    .param p2, "trafficStatsUntagSocket"    # Ljava/lang/reflect/Method;

    .prologue
    .line 171
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/Platform;-><init>()V

    .line 172
    iput-object p1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    .line 173
    iput-object p2, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    .line 174
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/squareup/okhttp/internal/Platform$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/reflect/Method;
    .param p2, "x1"    # Ljava/lang/reflect/Method;
    .param p3, "x2"    # Lcom/squareup/okhttp/internal/Platform$1;

    .prologue
    .line 152
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/Platform$Android;-><init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    return-void
.end method


# virtual methods
.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V
    .registers 11
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
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 192
    if-eqz p2, :cond_1a

    .line 193
    sget-object v2, Lcom/squareup/okhttp/internal/Platform$Android;->SET_USE_SESSION_TICKETS:Lcom/squareup/okhttp/internal/OptionalMethod;

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v2, p1, v3}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeOptionalWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    sget-object v2, Lcom/squareup/okhttp/internal/Platform$Android;->SET_HOSTNAME:Lcom/squareup/okhttp/internal/OptionalMethod;

    new-array v3, v5, [Ljava/lang/Object;

    aput-object p2, v3, v6

    invoke-virtual {v2, p1, v3}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeOptionalWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    :cond_1a
    sget-object v2, Lcom/squareup/okhttp/internal/Platform$Android;->SET_ALPN_PROTOCOLS:Lcom/squareup/okhttp/internal/OptionalMethod;

    invoke-virtual {v2, p1}, Lcom/squareup/okhttp/internal/OptionalMethod;->isSupported(Ljava/lang/Object;)Z

    move-result v0

    .line 199
    .local v0, "alpnSupported":Z
    if-nez v0, :cond_23

    .line 205
    :goto_22
    return-void

    .line 203
    :cond_23
    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {p3}, Lcom/squareup/okhttp/internal/Platform$Android;->concatLengthPrefixed(Ljava/util/List;)[B

    move-result-object v2

    aput-object v2, v1, v6

    .line 204
    .local v1, "parameters":[Ljava/lang/Object;
    sget-object v2, Lcom/squareup/okhttp/internal/Platform$Android;->SET_ALPN_PROTOCOLS:Lcom/squareup/okhttp/internal/OptionalMethod;

    invoke-virtual {v2, p1, v1}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_22
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
    .line 179
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_4

    .line 187
    return-void

    .line 180
    :catch_4
    move-exception v1

    .line 183
    .local v1, "se":Ljava/lang/SecurityException;
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Exception in connect"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 184
    .local v0, "ioException":Ljava/io/IOException;
    invoke-virtual {v0, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 185
    throw v0
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 7
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    const/4 v3, 0x0

    .line 208
    sget-object v2, Lcom/squareup/okhttp/internal/Platform$Android;->GET_ALPN_SELECTED_PROTOCOL:Lcom/squareup/okhttp/internal/OptionalMethod;

    invoke-virtual {v2, p1}, Lcom/squareup/okhttp/internal/OptionalMethod;->isSupported(Ljava/lang/Object;)Z

    move-result v1

    .line 209
    .local v1, "alpnSupported":Z
    if-nez v1, :cond_b

    move-object v2, v3

    .line 218
    :goto_a
    return-object v2

    .line 213
    :cond_b
    sget-object v2, Lcom/squareup/okhttp/internal/Platform$Android;->GET_ALPN_SELECTED_PROTOCOL:Lcom/squareup/okhttp/internal/OptionalMethod;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    .line 214
    invoke-virtual {v2, p1, v4}, Lcom/squareup/okhttp/internal/OptionalMethod;->invokeWithoutCheckedException(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    move-object v0, v2

    check-cast v0, [B

    .line 215
    .local v0, "alpnResult":[B
    if-eqz v0, :cond_23

    .line 216
    new-instance v2, Ljava/lang/String;

    sget-object v3, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_a

    :cond_23
    move-object v2, v3

    .line 218
    goto :goto_a
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
    .line 222
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsTagSocket:Ljava/lang/reflect/Method;

    if-nez v1, :cond_5

    .line 231
    :goto_4
    return-void

    .line 225
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

    .line 226
    :catch_12
    move-exception v0

    .line 227
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 228
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_19
    move-exception v0

    .line 229
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
    .line 234
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$Android;->trafficStatsUntagSocket:Ljava/lang/reflect/Method;

    if-nez v1, :cond_5

    .line 243
    :goto_4
    return-void

    .line 237
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
