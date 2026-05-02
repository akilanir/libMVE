.class public Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;
.super Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;
.source "SpdyMiddleware.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$NoSpdyException;,
        Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    }
.end annotation


# static fields
.field private static final NO_SPDY:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$NoSpdyException;


# instance fields
.field alpnProtocols:Ljava/lang/reflect/Field;

.field connections:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;",
            ">;"
        }
    .end annotation
.end field

.field initialized:Z

.field nativeGetAlpnNegotiatedProtocol:Ljava/lang/reflect/Method;

.field nativeGetNpnNegotiatedProtocol:Ljava/lang/reflect/Method;

.field npnProtocols:Ljava/lang/reflect/Field;

.field peerHost:Ljava/lang/reflect/Field;

.field peerPort:Ljava/lang/reflect/Field;

.field spdyEnabled:Z

.field sslNativePointer:Ljava/lang/reflect/Field;

.field sslParameters:Ljava/lang/reflect/Field;

.field useSni:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 169
    new-instance v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$NoSpdyException;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$NoSpdyException;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$1;)V

    sput-object v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->NO_SPDY:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$NoSpdyException;

    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/async/http/AsyncHttpClient;)V
    .registers 3
    .param p1, "client"    # Lcom/koushikdutta/async/http/AsyncHttpClient;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;-><init>(Lcom/koushikdutta/async/http/AsyncHttpClient;)V

    .line 123
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    .line 42
    new-instance v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$1;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;)V

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->addEngineConfigurator(Lcom/koushikdutta/async/http/AsyncSSLEngineConfigurator;)V

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V
    .registers 5
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;
    .param p1, "x1"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "x2"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->configure(Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    .registers 5
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/koushikdutta/async/callback/ConnectCallback;
    .param p3, "x3"    # Ljava/lang/Exception;
    .param p4, "x4"    # Lcom/koushikdutta/async/AsyncSSLSocket;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->invokeConnect(Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V

    return-void
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->noSpdy(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;Lcom/koushikdutta/async/callback/ConnectCallback;)V
    .registers 4
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p2, "x2"    # Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;
    .param p3, "x3"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->newSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;Lcom/koushikdutta/async/callback/ConnectCallback;)V

    return-void
.end method

.method static synthetic access$601(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 3
    .param p0, "x0"    # Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;
    .param p1, "x1"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    .prologue
    .line 39
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncSocketMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v0

    return-object v0
.end method

.method private canSpdyRequest(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Z
    .registers 3
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    .prologue
    .line 295
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method static varargs concatLengthPrefixed([Lcom/koushikdutta/async/http/Protocol;)[B
    .registers 10
    .param p0, "protocols"    # [Lcom/koushikdutta/async/http/Protocol;

    .prologue
    .line 145
    const/16 v6, 0x2000

    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 146
    .local v4, "result":Ljava/nio/ByteBuffer;
    move-object v0, p0

    .local v0, "arr$":[Lcom/koushikdutta/async/http/Protocol;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_9
    if-ge v1, v2, :cond_2e

    aget-object v3, v0, v1

    .line 147
    .local v3, "protocol":Lcom/koushikdutta/async/http/Protocol;
    sget-object v6, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_0:Lcom/koushikdutta/async/http/Protocol;

    if-ne v3, v6, :cond_14

    .line 146
    :goto_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 148
    :cond_14
    invoke-virtual {v3}, Lcom/koushikdutta/async/http/Protocol;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-byte v6, v6

    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 149
    invoke-virtual {v3}, Lcom/koushikdutta/async/http/Protocol;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/koushikdutta/async/util/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_11

    .line 151
    .end local v3    # "protocol":Lcom/koushikdutta/async/http/Protocol;
    :cond_2e
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 152
    new-instance v6, Lcom/koushikdutta/async/ByteBufferList;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/nio/ByteBuffer;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    invoke-direct {v6, v7}, Lcom/koushikdutta/async/ByteBufferList;-><init>([Ljava/nio/ByteBuffer;)V

    invoke-virtual {v6}, Lcom/koushikdutta/async/ByteBufferList;->getAllByteArray()[B

    move-result-object v5

    .line 153
    .local v5, "ret":[B
    return-object v5
.end method

.method private configure(Ljavax/net/ssl/SSLEngine;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;I)V
    .registers 15
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I

    .prologue
    const/4 v9, 0x0

    const/4 v5, 0x1

    .line 51
    iget-boolean v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->initialized:Z

    if-nez v4, :cond_103

    iget-boolean v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->spdyEnabled:Z

    if-eqz v4, :cond_103

    .line 52
    iput-boolean v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->initialized:Z

    .line 54
    :try_start_c
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "peerHost"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->peerHost:Ljava/lang/reflect/Field;

    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "peerPort"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->peerPort:Ljava/lang/reflect/Field;

    .line 56
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "sslParameters"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    .line 57
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "npnProtocols"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->npnProtocols:Ljava/lang/reflect/Field;

    .line 58
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "alpnProtocols"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->alpnProtocols:Ljava/lang/reflect/Field;

    .line 59
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "useSni"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->useSni:Ljava/lang/reflect/Field;

    .line 60
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "sslNativePointer"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslNativePointer:Ljava/lang/reflect/Field;

    .line 61
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".NativeCrypto"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 62
    .local v1, "nativeCryptoName":Ljava/lang/String;
    const/4 v4, 0x1

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-static {v1, v4, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "SSL_get_npn_negotiated_protocol"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    .line 63
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetNpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    .line 64
    const/4 v4, 0x1

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-static {v1, v4, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "SSL_get0_alpn_selected"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    .line 65
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    iput-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetAlpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    .line 67
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->peerHost:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 68
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->peerPort:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 69
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 70
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->npnProtocols:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 71
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->alpnProtocols:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 72
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->useSni:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 73
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslNativePointer:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 74
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetNpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 75
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetAlpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_103
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_103} :catch_10a

    .line 91
    .end local v1    # "nativeCryptoName":Ljava/lang/String;
    :cond_103
    :goto_103
    invoke-direct {p0, p2}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->canSpdyRequest(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Z

    move-result v4

    if-nez v4, :cond_11a

    .line 111
    :cond_109
    :goto_109
    return-void

    .line 77
    :catch_10a
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    iput-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    .line 79
    iput-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->npnProtocols:Ljava/lang/reflect/Field;

    .line 80
    iput-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->alpnProtocols:Ljava/lang/reflect/Field;

    .line 81
    iput-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->useSni:Ljava/lang/reflect/Field;

    .line 82
    iput-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslNativePointer:Ljava/lang/reflect/Field;

    .line 83
    iput-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetNpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    .line 84
    iput-object v9, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->nativeGetAlpnNegotiatedProtocol:Ljava/lang/reflect/Method;

    goto :goto_103

    .line 94
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_11a
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    if-eqz v4, :cond_109

    .line 96
    const/4 v4, 0x1

    :try_start_11f
    new-array v4, v4, [Lcom/koushikdutta/async/http/Protocol;

    const/4 v5, 0x0

    sget-object v6, Lcom/koushikdutta/async/http/Protocol;->SPDY_3:Lcom/koushikdutta/async/http/Protocol;

    aput-object v6, v4, v5

    invoke-static {v4}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->concatLengthPrefixed([Lcom/koushikdutta/async/http/Protocol;)[B

    move-result-object v2

    .line 100
    .local v2, "protocols":[B
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->peerHost:Ljava/lang/reflect/Field;

    invoke-virtual {v4, p1, p3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 101
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->peerPort:Ljava/lang/reflect/Field;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, p1, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->sslParameters:Ljava/lang/reflect/Field;

    invoke-virtual {v4, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 104
    .local v3, "sslp":Ljava/lang/Object;
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->alpnProtocols:Ljava/lang/reflect/Field;

    invoke-virtual {v4, v3, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 105
    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->useSni:Ljava/lang/reflect/Field;

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_14d
    .catch Ljava/lang/Exception; {:try_start_11f .. :try_end_14d} :catch_14e

    goto :goto_109

    .line 107
    .end local v2    # "protocols":[B
    .end local v3    # "sslp":Ljava/lang/Object;
    :catch_14e
    move-exception v0

    .line 108
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_109
.end method

.method private invokeConnect(Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSSLSocket;)V
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;
    .param p3, "e"    # Ljava/lang/Exception;
    .param p4, "socket"    # Lcom/koushikdutta/async/AsyncSSLSocket;

    .prologue
    .line 178
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;

    .line 179
    .local v0, "waiter":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    if-eqz v0, :cond_12

    iget-object v1, v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->originalCancellable:Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-virtual {v1}, Lcom/koushikdutta/async/future/SimpleCancellable;->setComplete()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 180
    :cond_12
    invoke-interface {p2, p3, p4}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    .line 181
    :cond_15
    return-void
.end method

.method private newSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;Lcom/koushikdutta/async/callback/ConnectCallback;)V
    .registers 18
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p2, "connection"    # Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;
    .param p3, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 249
    iget-object v7, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .line 251
    .local v7, "request":Lcom/koushikdutta/async/http/AsyncHttpRequest;
    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->protocol:Lcom/koushikdutta/async/http/Protocol;

    invoke-virtual {v11}, Lcom/koushikdutta/async/http/Protocol;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->protocol:Ljava/lang/String;

    .line 253
    iget-object v11, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v11}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v8

    .line 263
    .local v8, "requestBody":Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 264
    .local v1, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/http/spdy/Header;>;"
    new-instance v11, Lcom/koushikdutta/async/http/spdy/Header;

    sget-object v12, Lcom/koushikdutta/async/http/spdy/Header;->TARGET_METHOD:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getMethod()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lcom/koushikdutta/async/http/spdy/Header;-><init>(Lcom/koushikdutta/async/http/spdy/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    new-instance v11, Lcom/koushikdutta/async/http/spdy/Header;

    sget-object v12, Lcom/koushikdutta/async/http/spdy/Header;->TARGET_PATH:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v13

    invoke-static {v13}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->requestPath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lcom/koushikdutta/async/http/spdy/Header;-><init>(Lcom/koushikdutta/async/http/spdy/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 266
    invoke-virtual {v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v11

    const-string v12, "Host"

    invoke-virtual {v11, v12}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 267
    .local v2, "host":Ljava/lang/String;
    sget-object v11, Lcom/koushikdutta/async/http/Protocol;->SPDY_3:Lcom/koushikdutta/async/http/Protocol;

    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->protocol:Lcom/koushikdutta/async/http/Protocol;

    if-ne v11, v12, :cond_ba

    .line 268
    new-instance v11, Lcom/koushikdutta/async/http/spdy/Header;

    sget-object v12, Lcom/koushikdutta/async/http/spdy/Header;->VERSION:Lcom/koushikdutta/async/http/spdy/ByteString;

    const-string v13, "HTTP/1.1"

    invoke-direct {v11, v12, v13}, Lcom/koushikdutta/async/http/spdy/Header;-><init>(Lcom/koushikdutta/async/http/spdy/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    new-instance v11, Lcom/koushikdutta/async/http/spdy/Header;

    sget-object v12, Lcom/koushikdutta/async/http/spdy/Header;->TARGET_HOST:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-direct {v11, v12, v2}, Lcom/koushikdutta/async/http/spdy/Header;-><init>(Lcom/koushikdutta/async/http/spdy/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 275
    :goto_5f
    new-instance v11, Lcom/koushikdutta/async/http/spdy/Header;

    sget-object v12, Lcom/koushikdutta/async/http/spdy/Header;->TARGET_SCHEME:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v13

    invoke-virtual {v13}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lcom/koushikdutta/async/http/spdy/Header;-><init>(Lcom/koushikdutta/async/http/spdy/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 277
    invoke-virtual {v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v11

    invoke-virtual {v11}, Lcom/koushikdutta/async/http/Headers;->getMultiMap()Lcom/koushikdutta/async/http/Multimap;

    move-result-object v6

    .line 278
    .local v6, "mm":Lcom/koushikdutta/async/http/Multimap;
    invoke-virtual {v6}, Lcom/koushikdutta/async/http/Multimap;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_81
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_d3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 279
    .local v5, "key":Ljava/lang/String;
    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->protocol:Lcom/koushikdutta/async/http/Protocol;

    invoke-static {v11, v5}, Lcom/koushikdutta/async/http/spdy/SpdyTransport;->isProhibitedHeader(Lcom/koushikdutta/async/http/Protocol;Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_81

    .line 281
    invoke-virtual {v6, v5}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_a1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_81

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 282
    .local v10, "value":Ljava/lang/String;
    new-instance v11, Lcom/koushikdutta/async/http/spdy/Header;

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12, v10}, Lcom/koushikdutta/async/http/spdy/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a1

    .line 270
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "mm":Lcom/koushikdutta/async/http/Multimap;
    .end local v10    # "value":Ljava/lang/String;
    :cond_ba
    sget-object v11, Lcom/koushikdutta/async/http/Protocol;->HTTP_2:Lcom/koushikdutta/async/http/Protocol;

    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->protocol:Lcom/koushikdutta/async/http/Protocol;

    if-ne v11, v12, :cond_cd

    .line 271
    new-instance v11, Lcom/koushikdutta/async/http/spdy/Header;

    sget-object v12, Lcom/koushikdutta/async/http/spdy/Header;->TARGET_AUTHORITY:Lcom/koushikdutta/async/http/spdy/ByteString;

    invoke-direct {v11, v12, v2}, Lcom/koushikdutta/async/http/spdy/Header;-><init>(Lcom/koushikdutta/async/http/spdy/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5f

    .line 273
    :cond_cd
    new-instance v11, Ljava/lang/AssertionError;

    invoke-direct {v11}, Ljava/lang/AssertionError;-><init>()V

    throw v11

    .line 286
    .restart local v6    # "mm":Lcom/koushikdutta/async/http/Multimap;
    :cond_d3
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 287
    if-eqz v8, :cond_fa

    const/4 v11, 0x1

    :goto_ec
    const/4 v12, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v1, v11, v12}, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->newStream(Ljava/util/List;ZZ)Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;

    move-result-object v9

    .line 288
    .local v9, "spdy":Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;
    const/4 v11, 0x0

    move-object/from16 v0, p3

    invoke-interface {v0, v11, v9}, Lcom/koushikdutta/async/callback/ConnectCallback;->onConnectCompleted(Ljava/lang/Exception;Lcom/koushikdutta/async/AsyncSocket;)V

    .line 289
    return-void

    .line 287
    .end local v9    # "spdy":Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;
    :cond_fa
    const/4 v11, 0x0

    goto :goto_ec
.end method

.method private noSpdy(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 172
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;

    .line 173
    .local v0, "conn":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    if-eqz v0, :cond_f

    .line 174
    sget-object v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->NO_SPDY:Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$NoSpdyException;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->setComplete(Ljava/lang/Exception;)Z

    .line 175
    :cond_f
    return-void
.end method

.method private static requestPath(Landroid/net/Uri;)Ljava/lang/String;
    .registers 4
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 157
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "pathAndQuery":Ljava/lang/String;
    if-nez v0, :cond_2e

    .line 159
    const-string v0, "/"

    .line 162
    :cond_8
    :goto_8
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2d

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 164
    :cond_2d
    return-object v0

    .line 160
    :cond_2e
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 161
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method


# virtual methods
.method protected createHandshakeCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;
    .registers 6
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p2, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 185
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v2, "spdykey"

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 186
    .local v0, "key":Ljava/lang/String;
    if-nez v0, :cond_11

    .line 187
    invoke-super {p0, p1, p2}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->createHandshakeCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/AsyncSSLSocketWrapper$HandshakeCallback;

    move-result-object v1

    .line 189
    :goto_10
    return-object v1

    :cond_11
    new-instance v1, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;

    invoke-direct {v1, p0, p1, v0, p2}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$2;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;)V

    goto :goto_10
.end method

.method public exchangeHeaders(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)Z
    .registers 6
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;

    .prologue
    .line 391
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    instance-of v2, v2, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;

    if-nez v2, :cond_b

    .line 392
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->exchangeHeaders(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)Z

    move-result v2

    .line 431
    :goto_a
    return v2

    .line 394
    :cond_b
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v0

    .line 395
    .local v0, "requestBody":Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    if-eqz v0, :cond_1a

    .line 396
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    iget-object v3, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v2, v3}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink(Lcom/koushikdutta/async/DataSink;)Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    .line 400
    :cond_1a
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->sendHeadersCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    .line 402
    iget-object v1, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    check-cast v1, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;

    .line 403
    .local v1, "spdySocket":Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;
    invoke-virtual {v1}, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;->headers()Lcom/koushikdutta/async/future/SimpleFuture;

    move-result-object v2

    new-instance v3, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;

    invoke-direct {v3, p0, p1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;)V

    .line 404
    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/future/SimpleFuture;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;

    new-instance v3, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$5;

    invoke-direct {v3, p0, p1, v1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$5;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData;Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;)V

    .line 423
    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$6;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/SimpleFuture;

    .line 431
    const/4 v2, 0x1

    goto :goto_a
.end method

.method public getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 10
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    .prologue
    const/4 v6, 0x0

    .line 323
    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 324
    .local v4, "uri":Landroid/net/Uri;
    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v5}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->getSchemePort(Landroid/net/Uri;)I

    move-result v2

    .line 325
    .local v2, "port":I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_16

    move-object v3, v6

    .line 386
    :cond_15
    :goto_15
    return-object v3

    .line 329
    :cond_16
    iget-boolean v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->spdyEnabled:Z

    if-nez v5, :cond_1f

    .line 330
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v3

    goto :goto_15

    .line 335
    :cond_1f
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->canSpdyRequest(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Z

    move-result v5

    if-nez v5, :cond_2a

    .line 336
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v3

    goto :goto_15

    .line 339
    :cond_2a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 340
    .local v1, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    invoke-virtual {v5, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;

    .line 341
    .local v0, "conn":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    if-eqz v0, :cond_70

    .line 342
    invoke-virtual {v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->tryGetException()Ljava/lang/Exception;

    move-result-object v5

    instance-of v5, v5, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$NoSpdyException;

    if-eqz v5, :cond_56

    .line 343
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v3

    goto :goto_15

    .line 346
    :cond_56
    invoke-virtual {v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->tryGet()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_70

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->tryGet()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;

    iget-object v5, v5, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection;->socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v5}, Lcom/koushikdutta/async/AsyncSocket;->isOpen()Z

    move-result v5

    if-nez v5, :cond_70

    .line 348
    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    invoke-virtual {v5, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    const/4 v0, 0x0

    .line 353
    :cond_70
    if-nez v0, :cond_96

    .line 355
    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v7, "spdykey"

    invoke-virtual {v5, v7, v1}, Lcom/koushikdutta/async/util/UntypedHashtable;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 357
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v3

    .line 358
    .local v3, "ret":Lcom/koushikdutta/async/future/Cancellable;
    invoke-interface {v3}, Lcom/koushikdutta/async/future/Cancellable;->isDone()Z

    move-result v5

    if-nez v5, :cond_15

    invoke-interface {v3}, Lcom/koushikdutta/async/future/Cancellable;->isCancelled()Z

    move-result v5

    if-nez v5, :cond_15

    .line 360
    new-instance v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;

    .end local v0    # "conn":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    invoke-direct {v0, v6}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$1;)V

    .line 361
    .restart local v0    # "conn":Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;
    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->connections:Ljava/util/Hashtable;

    invoke-virtual {v5, v1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    iget-object v3, v0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->originalCancellable:Lcom/koushikdutta/async/future/SimpleCancellable;

    goto :goto_15

    .line 365
    .end local v3    # "ret":Lcom/koushikdutta/async/future/Cancellable;
    :cond_96
    iget-object v5, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "waiting for potential spdy connection for host: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->logv(Ljava/lang/String;)V

    .line 366
    new-instance v3, Lcom/koushikdutta/async/future/SimpleCancellable;

    invoke-direct {v3}, Lcom/koushikdutta/async/future/SimpleCancellable;-><init>()V

    .line 367
    .local v3, "ret":Lcom/koushikdutta/async/future/SimpleCancellable;
    new-instance v5, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$4;

    invoke-direct {v5, p0, p1, v3}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$4;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Lcom/koushikdutta/async/future/SimpleCancellable;)V

    invoke-virtual {v0, v5}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$SpdyConnectionWaiter;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/MultiFuture;

    goto/16 :goto_15
.end method

.method public getSpdyEnabled()Z
    .registers 2

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->spdyEnabled:Z

    return v0
.end method

.method public onRequestSent(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;)V
    .registers 3
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;

    .prologue
    .line 436
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;->socket:Lcom/koushikdutta/async/AsyncSocket;

    instance-of v0, v0, Lcom/koushikdutta/async/http/spdy/AsyncSpdyConnection$SpdySocket;

    if-nez v0, :cond_7

    .line 441
    :cond_6
    :goto_6
    return-void

    .line 439
    :cond_7
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;->request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 440
    iget-object v0, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData;->response:Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;

    invoke-interface {v0}, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead;->sink()Lcom/koushikdutta/async/DataSink;

    move-result-object v0

    invoke-interface {v0}, Lcom/koushikdutta/async/DataSink;->end()V

    goto :goto_6
.end method

.method public setSSLContext(Ljavax/net/ssl/SSLContext;)V
    .registers 3
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 140
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->setSSLContext(Ljavax/net/ssl/SSLContext;)V

    .line 141
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->initialized:Z

    .line 142
    return-void
.end method

.method public setSpdyEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 135
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;->spdyEnabled:Z

    .line 136
    return-void
.end method

.method protected wrapCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;IZLcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/callback/ConnectCallback;
    .registers 10
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "port"    # I
    .param p4, "proxied"    # Z
    .param p5, "callback"    # Lcom/koushikdutta/async/callback/ConnectCallback;

    .prologue
    .line 300
    invoke-super/range {p0 .. p5}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->wrapCallback(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;Landroid/net/Uri;IZLcom/koushikdutta/async/callback/ConnectCallback;)Lcom/koushikdutta/async/callback/ConnectCallback;

    move-result-object v1

    .line 301
    .local v1, "superCallback":Lcom/koushikdutta/async/callback/ConnectCallback;
    iget-object v2, p1, Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;->state:Lcom/koushikdutta/async/util/UntypedHashtable;

    const-string v3, "spdykey"

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/util/UntypedHashtable;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 302
    .local v0, "key":Ljava/lang/String;
    if-nez v0, :cond_11

    .line 306
    .end local v1    # "superCallback":Lcom/koushikdutta/async/callback/ConnectCallback;
    :goto_10
    return-object v1

    .restart local v1    # "superCallback":Lcom/koushikdutta/async/callback/ConnectCallback;
    :cond_11
    new-instance v2, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;

    invoke-direct {v2, p0, v0, v1}, Lcom/koushikdutta/async/http/spdy/SpdyMiddleware$3;-><init>(Lcom/koushikdutta/async/http/spdy/SpdyMiddleware;Ljava/lang/String;Lcom/koushikdutta/async/callback/ConnectCallback;)V

    move-object v1, v2

    goto :goto_10
.end method
