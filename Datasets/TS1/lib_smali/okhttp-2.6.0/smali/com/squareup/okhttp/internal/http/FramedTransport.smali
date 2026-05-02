.class public final Lcom/squareup/okhttp/internal/http/FramedTransport;
.super Ljava/lang/Object;
.source "FramedTransport.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/http/Transport;


# static fields
.field private static final CONNECTION:Lokio/ByteString;

.field private static final ENCODING:Lokio/ByteString;

.field private static final HOST:Lokio/ByteString;

.field private static final HTTP_2_SKIPPED_REQUEST_HEADERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field private static final HTTP_2_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field private static final KEEP_ALIVE:Lokio/ByteString;

.field private static final PROXY_CONNECTION:Lokio/ByteString;

.field private static final SPDY_3_SKIPPED_REQUEST_HEADERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field private static final SPDY_3_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lokio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field private static final TE:Lokio/ByteString;

.field private static final TRANSFER_ENCODING:Lokio/ByteString;

.field private static final UPGRADE:Lokio/ByteString;


# instance fields
.field private final framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

.field private final httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field private stream:Lcom/squareup/okhttp/internal/framed/FramedStream;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 50
    const-string v0, "connection"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->CONNECTION:Lokio/ByteString;

    .line 51
    const-string v0, "host"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->HOST:Lokio/ByteString;

    .line 52
    const-string v0, "keep-alive"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->KEEP_ALIVE:Lokio/ByteString;

    .line 53
    const-string v0, "proxy-connection"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->PROXY_CONNECTION:Lokio/ByteString;

    .line 54
    const-string v0, "transfer-encoding"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->TRANSFER_ENCODING:Lokio/ByteString;

    .line 55
    const-string v0, "te"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->TE:Lokio/ByteString;

    .line 56
    const-string v0, "encoding"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->ENCODING:Lokio/ByteString;

    .line 57
    const-string v0, "upgrade"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->UPGRADE:Lokio/ByteString;

    .line 60
    const/16 v0, 0xb

    new-array v0, v0, [Lokio/ByteString;

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v3

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->HOST:Lokio/ByteString;

    aput-object v1, v0, v4

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->KEEP_ALIVE:Lokio/ByteString;

    aput-object v1, v0, v5

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->PROXY_CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v6

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->TRANSFER_ENCODING:Lokio/ByteString;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_METHOD:Lokio/ByteString;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_PATH:Lokio/ByteString;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_SCHEME:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_AUTHORITY:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_HOST:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->VERSION:Lokio/ByteString;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->SPDY_3_SKIPPED_REQUEST_HEADERS:Ljava/util/List;

    .line 72
    const/4 v0, 0x5

    new-array v0, v0, [Lokio/ByteString;

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v3

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->HOST:Lokio/ByteString;

    aput-object v1, v0, v4

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->KEEP_ALIVE:Lokio/ByteString;

    aput-object v1, v0, v5

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->PROXY_CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v6

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->TRANSFER_ENCODING:Lokio/ByteString;

    aput-object v1, v0, v7

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->SPDY_3_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;

    .line 80
    const/16 v0, 0xe

    new-array v0, v0, [Lokio/ByteString;

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v3

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->HOST:Lokio/ByteString;

    aput-object v1, v0, v4

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->KEEP_ALIVE:Lokio/ByteString;

    aput-object v1, v0, v5

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->PROXY_CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v6

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->TE:Lokio/ByteString;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/squareup/okhttp/internal/http/FramedTransport;->TRANSFER_ENCODING:Lokio/ByteString;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/squareup/okhttp/internal/http/FramedTransport;->ENCODING:Lokio/ByteString;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/squareup/okhttp/internal/http/FramedTransport;->UPGRADE:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_METHOD:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_PATH:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_SCHEME:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_AUTHORITY:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_HOST:Lokio/ByteString;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/squareup/okhttp/internal/framed/Header;->VERSION:Lokio/ByteString;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->HTTP_2_SKIPPED_REQUEST_HEADERS:Ljava/util/List;

    .line 95
    const/16 v0, 0x8

    new-array v0, v0, [Lokio/ByteString;

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v3

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->HOST:Lokio/ByteString;

    aput-object v1, v0, v4

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->KEEP_ALIVE:Lokio/ByteString;

    aput-object v1, v0, v5

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->PROXY_CONNECTION:Lokio/ByteString;

    aput-object v1, v0, v6

    sget-object v1, Lcom/squareup/okhttp/internal/http/FramedTransport;->TE:Lokio/ByteString;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/squareup/okhttp/internal/http/FramedTransport;->TRANSFER_ENCODING:Lokio/ByteString;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/squareup/okhttp/internal/http/FramedTransport;->ENCODING:Lokio/ByteString;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/squareup/okhttp/internal/http/FramedTransport;->UPGRADE:Lokio/ByteString;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/http/FramedTransport;->HTTP_2_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/internal/framed/FramedConnection;)V
    .registers 3
    .param p1, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .param p2, "framedConnection"    # Lcom/squareup/okhttp/internal/framed/FramedConnection;

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 111
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    .line 112
    return-void
.end method

.method public static http2HeadersList(Lcom/squareup/okhttp/Request;)Ljava/util/List;
    .registers 9
    .param p0, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/okhttp/Request;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation

    .prologue
    .line 191
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    .line 192
    .local v0, "headers":Lcom/squareup/okhttp/Headers;
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v5

    add-int/lit8 v5, v5, 0x4

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 193
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    new-instance v5, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v6, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_METHOD:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v5, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v6, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_PATH:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v7

    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/RequestLine;->requestPath(Lcom/squareup/okhttp/HttpUrl;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    new-instance v5, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v6, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_AUTHORITY:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v7

    invoke-static {v7}, Lcom/squareup/okhttp/internal/Util;->hostHeader(Lcom/squareup/okhttp/HttpUrl;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    new-instance v5, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v6, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_SCHEME:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v4

    .local v4, "size":I
    :goto_58
    if-ge v1, v4, :cond_7f

    .line 200
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v2

    .line 201
    .local v2, "name":Lokio/ByteString;
    sget-object v5, Lcom/squareup/okhttp/internal/http/FramedTransport;->HTTP_2_SKIPPED_REQUEST_HEADERS:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7c

    .line 202
    new-instance v5, Lcom/squareup/okhttp/internal/framed/Header;

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v2, v6}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    :cond_7c
    add-int/lit8 v1, v1, 0x1

    goto :goto_58

    .line 205
    .end local v2    # "name":Lokio/ByteString;
    :cond_7f
    return-object v3
.end method

.method private static joinOnNull(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "first"    # Ljava/lang/String;
    .param p1, "second"    # Ljava/lang/String;

    .prologue
    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static readHttp2HeadersList(Ljava/util/List;)Lcom/squareup/okhttp/Response$Builder;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/framed/Header;",
            ">;)",
            "Lcom/squareup/okhttp/Response$Builder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    .local p0, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    const/4 v4, 0x0

    .line 248
    .local v4, "status":Ljava/lang/String;
    new-instance v0, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 249
    .local v0, "headersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    sget-object v7, Lcom/squareup/okhttp/internal/http/OkHeaders;->SELECTED_PROTOCOL:Ljava/lang/String;

    sget-object v8, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    invoke-virtual {v8}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 250
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    :goto_16
    if-ge v1, v3, :cond_48

    .line 251
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/squareup/okhttp/internal/framed/Header;

    iget-object v2, v7, Lcom/squareup/okhttp/internal/framed/Header;->name:Lokio/ByteString;

    .line 253
    .local v2, "name":Lokio/ByteString;
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/squareup/okhttp/internal/framed/Header;

    iget-object v7, v7, Lcom/squareup/okhttp/internal/framed/Header;->value:Lokio/ByteString;

    invoke-virtual {v7}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v6

    .line 254
    .local v6, "value":Ljava/lang/String;
    sget-object v7, Lcom/squareup/okhttp/internal/framed/Header;->RESPONSE_STATUS:Lokio/ByteString;

    invoke-virtual {v2, v7}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_38

    .line 255
    move-object v4, v6

    .line 250
    :cond_35
    :goto_35
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 256
    :cond_38
    sget-object v7, Lcom/squareup/okhttp/internal/http/FramedTransport;->HTTP_2_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_35

    .line 257
    invoke-virtual {v2}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7, v6}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_35

    .line 260
    .end local v2    # "name":Lokio/ByteString;
    .end local v6    # "value":Ljava/lang/String;
    :cond_48
    if-nez v4, :cond_52

    new-instance v7, Ljava/net/ProtocolException;

    const-string v8, "Expected \':status\' header not present"

    invoke-direct {v7, v8}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 262
    :cond_52
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "HTTP/1.1 "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/StatusLine;->parse(Ljava/lang/String;)Lcom/squareup/okhttp/internal/http/StatusLine;

    move-result-object v5

    .line 263
    .local v5, "statusLine":Lcom/squareup/okhttp/internal/http/StatusLine;
    new-instance v7, Lcom/squareup/okhttp/Response$Builder;

    invoke-direct {v7}, Lcom/squareup/okhttp/Response$Builder;-><init>()V

    sget-object v8, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    .line 264
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget v8, v5, Lcom/squareup/okhttp/internal/http/StatusLine;->code:I

    .line 265
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->code(I)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, v5, Lcom/squareup/okhttp/internal/http/StatusLine;->message:Ljava/lang/String;

    .line 266
    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->message(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    .line 267
    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    return-object v7
.end method

.method public static readSpdy3HeadersList(Ljava/util/List;)Lcom/squareup/okhttp/Response$Builder;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/framed/Header;",
            ">;)",
            "Lcom/squareup/okhttp/Response$Builder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    .local p0, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    const/4 v6, 0x0

    .line 211
    .local v6, "status":Ljava/lang/String;
    const-string v10, "HTTP/1.1"

    .line 212
    .local v10, "version":Ljava/lang/String;
    new-instance v1, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v1}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 213
    .local v1, "headersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    sget-object v11, Lcom/squareup/okhttp/internal/http/OkHeaders;->SELECTED_PROTOCOL:Ljava/lang/String;

    sget-object v12, Lcom/squareup/okhttp/Protocol;->SPDY_3:Lcom/squareup/okhttp/Protocol;

    invoke-virtual {v12}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v11, v12}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 214
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "size":I
    :goto_18
    if-ge v2, v4, :cond_6e

    .line 215
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/squareup/okhttp/internal/framed/Header;

    iget-object v3, v11, Lcom/squareup/okhttp/internal/framed/Header;->name:Lokio/ByteString;

    .line 217
    .local v3, "name":Lokio/ByteString;
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/squareup/okhttp/internal/framed/Header;

    iget-object v11, v11, Lcom/squareup/okhttp/internal/framed/Header;->value:Lokio/ByteString;

    invoke-virtual {v11}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v9

    .line 218
    .local v9, "values":Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "start":I
    :goto_2f
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v5, v11, :cond_6b

    .line 219
    const/4 v11, 0x0

    invoke-virtual {v9, v11, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 220
    .local v0, "end":I
    const/4 v11, -0x1

    if-ne v0, v11, :cond_41

    .line 221
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v0

    .line 223
    :cond_41
    invoke-virtual {v9, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 224
    .local v8, "value":Ljava/lang/String;
    sget-object v11, Lcom/squareup/okhttp/internal/framed/Header;->RESPONSE_STATUS:Lokio/ByteString;

    invoke-virtual {v3, v11}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_51

    .line 225
    move-object v6, v8

    .line 231
    :cond_4e
    :goto_4e
    add-int/lit8 v5, v0, 0x1

    .line 232
    goto :goto_2f

    .line 226
    :cond_51
    sget-object v11, Lcom/squareup/okhttp/internal/framed/Header;->VERSION:Lokio/ByteString;

    invoke-virtual {v3, v11}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5b

    .line 227
    move-object v10, v8

    goto :goto_4e

    .line 228
    :cond_5b
    sget-object v11, Lcom/squareup/okhttp/internal/http/FramedTransport;->SPDY_3_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;

    invoke-interface {v11, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_4e

    .line 229
    invoke-virtual {v3}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v11, v8}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_4e

    .line 214
    .end local v0    # "end":I
    .end local v8    # "value":Ljava/lang/String;
    :cond_6b
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 234
    .end local v3    # "name":Lokio/ByteString;
    .end local v5    # "start":I
    .end local v9    # "values":Ljava/lang/String;
    :cond_6e
    if-nez v6, :cond_78

    new-instance v11, Ljava/net/ProtocolException;

    const-string v12, "Expected \':status\' header not present"

    invoke-direct {v11, v12}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 236
    :cond_78
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/squareup/okhttp/internal/http/StatusLine;->parse(Ljava/lang/String;)Lcom/squareup/okhttp/internal/http/StatusLine;

    move-result-object v7

    .line 237
    .local v7, "statusLine":Lcom/squareup/okhttp/internal/http/StatusLine;
    new-instance v11, Lcom/squareup/okhttp/Response$Builder;

    invoke-direct {v11}, Lcom/squareup/okhttp/Response$Builder;-><init>()V

    sget-object v12, Lcom/squareup/okhttp/Protocol;->SPDY_3:Lcom/squareup/okhttp/Protocol;

    .line 238
    invoke-virtual {v11, v12}, Lcom/squareup/okhttp/Response$Builder;->protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v11

    iget v12, v7, Lcom/squareup/okhttp/internal/http/StatusLine;->code:I

    .line 239
    invoke-virtual {v11, v12}, Lcom/squareup/okhttp/Response$Builder;->code(I)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v11

    iget-object v12, v7, Lcom/squareup/okhttp/internal/http/StatusLine;->message:Ljava/lang/String;

    .line 240
    invoke-virtual {v11, v12}, Lcom/squareup/okhttp/Response$Builder;->message(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v11

    .line 241
    invoke-virtual {v1}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/squareup/okhttp/Response$Builder;->headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v11

    return-object v11
.end method

.method public static spdy3HeadersList(Lcom/squareup/okhttp/Request;)Ljava/util/List;
    .registers 13
    .param p0, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/okhttp/Request;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/framed/Header;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    .line 152
    .local v1, "headers":Lcom/squareup/okhttp/Headers;
    new-instance v6, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v9

    add-int/lit8 v9, v9, 0x5

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 153
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    new-instance v9, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v10, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_METHOD:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    new-instance v9, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v10, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_PATH:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v11

    invoke-static {v11}, Lcom/squareup/okhttp/internal/http/RequestLine;->requestPath(Lcom/squareup/okhttp/HttpUrl;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    new-instance v9, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v10, Lcom/squareup/okhttp/internal/framed/Header;->VERSION:Lokio/ByteString;

    const-string v11, "HTTP/1.1"

    invoke-direct {v9, v10, v11}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    new-instance v9, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v10, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_HOST:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v11

    invoke-static {v11}, Lcom/squareup/okhttp/internal/Util;->hostHeader(Lcom/squareup/okhttp/HttpUrl;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v9, Lcom/squareup/okhttp/internal/framed/Header;

    sget-object v10, Lcom/squareup/okhttp/internal/framed/Header;->TARGET_SCHEME:Lokio/ByteString;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->httpUrl()Lcom/squareup/okhttp/HttpUrl;

    move-result-object v11

    invoke-virtual {v11}, Lcom/squareup/okhttp/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    .line 160
    .local v5, "names":Ljava/util/Set;, "Ljava/util/Set<Lokio/ByteString;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {v1}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v7

    .local v7, "size":I
    :goto_69
    if-ge v2, v7, :cond_c8

    .line 162
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v4

    .line 165
    .local v4, "name":Lokio/ByteString;
    sget-object v9, Lcom/squareup/okhttp/internal/http/FramedTransport;->SPDY_3_SKIPPED_REQUEST_HEADERS:Ljava/util/List;

    invoke-interface {v9, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_84

    .line 160
    :cond_81
    :goto_81
    add-int/lit8 v2, v2, 0x1

    goto :goto_69

    .line 168
    :cond_84
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v8

    .line 169
    .local v8, "value":Ljava/lang/String;
    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_97

    .line 170
    new-instance v9, Lcom/squareup/okhttp/internal/framed/Header;

    invoke-direct {v9, v4, v8}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_81

    .line 175
    :cond_97
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_98
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    if-ge v3, v9, :cond_81

    .line 176
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/squareup/okhttp/internal/framed/Header;

    iget-object v9, v9, Lcom/squareup/okhttp/internal/framed/Header;->name:Lokio/ByteString;

    invoke-virtual {v9, v4}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c5

    .line 177
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/squareup/okhttp/internal/framed/Header;

    iget-object v9, v9, Lcom/squareup/okhttp/internal/framed/Header;->value:Lokio/ByteString;

    invoke-virtual {v9}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v8}, Lcom/squareup/okhttp/internal/http/FramedTransport;->joinOnNull(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, "concatenated":Ljava/lang/String;
    new-instance v9, Lcom/squareup/okhttp/internal/framed/Header;

    invoke-direct {v9, v4, v0}, Lcom/squareup/okhttp/internal/framed/Header;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    invoke-interface {v6, v3, v9}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_81

    .line 175
    .end local v0    # "concatenated":Ljava/lang/String;
    :cond_c5
    add-int/lit8 v3, v3, 0x1

    goto :goto_98

    .line 183
    .end local v3    # "j":I
    .end local v4    # "name":Lokio/ByteString;
    .end local v8    # "value":Ljava/lang/String;
    :cond_c8
    return-object v6
.end method


# virtual methods
.method public canReuseConnection()Z
    .registers 2

    .prologue
    .line 282
    const/4 v0, 0x1

    return v0
.end method

.method public createRequestBody(Lcom/squareup/okhttp/Request;J)Lokio/Sink;
    .registers 5
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .param p2, "contentLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getSink()Lokio/Sink;

    move-result-object v0

    return-object v0
.end method

.method public disconnect(Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 4
    .param p1, "engine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    sget-object v1, Lcom/squareup/okhttp/internal/framed/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/framed/ErrorCode;

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/framed/FramedStream;->close(Lcom/squareup/okhttp/internal/framed/ErrorCode;)V

    .line 279
    :cond_b
    return-void
.end method

.method public finishRequest()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getSink()Lokio/Sink;

    move-result-object v0

    invoke-interface {v0}, Lokio/Sink;->close()V

    .line 137
    return-void
.end method

.method public openResponseBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/ResponseBody;
    .registers 5
    .param p1, "response"    # Lcom/squareup/okhttp/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 271
    new-instance v0, Lcom/squareup/okhttp/internal/http/RealResponseBody;

    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getSource()Lokio/Source;

    move-result-object v2

    invoke-static {v2}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/squareup/okhttp/internal/http/RealResponseBody;-><init>(Lcom/squareup/okhttp/Headers;Lokio/BufferedSource;)V

    return-object v0
.end method

.method public readResponseHeaders()Lcom/squareup/okhttp/Response$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getProtocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v0

    sget-object v1, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    if-ne v0, v1, :cond_15

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    .line 141
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getResponseHeaders()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/FramedTransport;->readHttp2HeadersList(Ljava/util/List;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    .line 142
    :goto_14
    return-object v0

    .line 141
    :cond_15
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    .line 142
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getResponseHeaders()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/FramedTransport;->readSpdy3HeadersList(Ljava/util/List;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    goto :goto_14
.end method

.method public releaseConnectionOnIdle()V
    .registers 1

    .prologue
    .line 275
    return-void
.end method

.method public writeRequestBody(Lcom/squareup/okhttp/internal/http/RetryableSink;)V
    .registers 3
    .param p1, "requestBody"    # Lcom/squareup/okhttp/internal/http/RetryableSink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/framed/FramedStream;->getSink()Lokio/Sink;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/http/RetryableSink;->writeToSocket(Lokio/Sink;)V

    .line 133
    return-void
.end method

.method public writeRequestHeaders(Lcom/squareup/okhttp/Request;)V
    .registers 9
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    if-eqz v3, :cond_5

    .line 129
    :goto_4
    return-void

    .line 121
    :cond_5
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->writingRequestHeaders()V

    .line 122
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v3, p1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->permitsRequestBody(Lcom/squareup/okhttp/Request;)Z

    move-result v1

    .line 123
    .local v1, "permitsRequestBody":Z
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->getProtocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v3

    sget-object v4, Lcom/squareup/okhttp/Protocol;->HTTP_2:Lcom/squareup/okhttp/Protocol;

    if-ne v3, v4, :cond_3c

    .line 124
    invoke-static {p1}, Lcom/squareup/okhttp/internal/http/FramedTransport;->http2HeadersList(Lcom/squareup/okhttp/Request;)Ljava/util/List;

    move-result-object v2

    .line 126
    .local v2, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    :goto_1e
    const/4 v0, 0x1

    .line 127
    .local v0, "hasResponseBody":Z
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->framedConnection:Lcom/squareup/okhttp/internal/framed/FramedConnection;

    invoke-virtual {v3, v2, v1, v0}, Lcom/squareup/okhttp/internal/framed/FramedConnection;->newStream(Ljava/util/List;ZZ)Lcom/squareup/okhttp/internal/framed/FramedStream;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    .line 128
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->stream:Lcom/squareup/okhttp/internal/framed/FramedStream;

    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/framed/FramedStream;->readTimeout()Lokio/Timeout;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/FramedTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v4, v4, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v4}, Lcom/squareup/okhttp/OkHttpClient;->getReadTimeout()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    goto :goto_4

    .line 125
    .end local v0    # "hasResponseBody":Z
    .end local v2    # "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/framed/Header;>;"
    :cond_3c
    invoke-static {p1}, Lcom/squareup/okhttp/internal/http/FramedTransport;->spdy3HeadersList(Lcom/squareup/okhttp/Request;)Ljava/util/List;

    move-result-object v2

    goto :goto_1e
.end method
