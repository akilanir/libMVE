.class public Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;
.super Ljava/lang/Object;
.source "DefaultConnectionReuseStrategy.java"

# interfaces
.implements Lcz/msebera/android/httpclient/ConnectionReuseStrategy;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    new-instance v0, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method

.method private canResponseHaveBody(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 4
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 182
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    .line 183
    .local v0, "status":I
    const/16 v1, 0xc8

    if-lt v0, v1, :cond_1a

    const/16 v1, 0xcc

    if-eq v0, v1, :cond_1a

    const/16 v1, 0x130

    if-eq v0, v1, :cond_1a

    const/16 v1, 0xcd

    if-eq v0, v1, :cond_1a

    const/4 v1, 0x1

    :goto_19
    return v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method


# virtual methods
.method protected createTokenIterator(Lcz/msebera/android/httpclient/HeaderIterator;)Lcz/msebera/android/httpclient/TokenIterator;
    .registers 3
    .param p1, "hit"    # Lcz/msebera/android/httpclient/HeaderIterator;

    .prologue
    .line 178
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicTokenIterator;

    invoke-direct {v0, p1}, Lcz/msebera/android/httpclient/message/BasicTokenIterator;-><init>(Lcz/msebera/android/httpclient/HeaderIterator;)V

    return-object v0
.end method

.method public keepAlive(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)Z
    .registers 16
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 75
    const-string v11, "HTTP response"

    invoke-static {p1, v11}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 76
    const-string v11, "HTTP context"

    invoke-static {p2, v11}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lcz/msebera/android/httpclient/StatusLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v10

    .line 81
    .local v10, "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    const-string v11, "Transfer-Encoding"

    invoke-interface {p1, v11}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v7

    .line 82
    .local v7, "teh":Lcz/msebera/android/httpclient/Header;
    if-eqz v7, :cond_28

    .line 83
    const-string v11, "chunked"

    invoke-interface {v7}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_4c

    .line 84
    const/4 v11, 0x0

    .line 164
    :goto_27
    return v11

    .line 87
    :cond_28
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;->canResponseHaveBody(Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v11

    if-eqz v11, :cond_4c

    .line 88
    const-string v11, "Content-Length"

    invoke-interface {p1, v11}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 90
    .local v1, "clhs":[Lcz/msebera/android/httpclient/Header;
    array-length v11, v1

    const/4 v12, 0x1

    if-ne v11, v12, :cond_4a

    .line 91
    const/4 v11, 0x0

    aget-object v0, v1, v11

    .line 93
    .local v0, "clh":Lcz/msebera/android/httpclient/Header;
    :try_start_3b
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_42
    .catch Ljava/lang/NumberFormatException; {:try_start_3b .. :try_end_42} :catch_47

    move-result v2

    .line 94
    .local v2, "contentLen":I
    if-gez v2, :cond_4c

    .line 95
    const/4 v11, 0x0

    goto :goto_27

    .line 97
    .end local v2    # "contentLen":I
    :catch_47
    move-exception v3

    .line 98
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const/4 v11, 0x0

    goto :goto_27

    .line 101
    .end local v0    # "clh":Lcz/msebera/android/httpclient/Header;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    :cond_4a
    const/4 v11, 0x0

    goto :goto_27

    .line 109
    .end local v1    # "clhs":[Lcz/msebera/android/httpclient/Header;
    :cond_4c
    const-string v11, "Connection"

    invoke-interface {p1, v11}, Lcz/msebera/android/httpclient/HttpResponse;->headerIterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v4

    .line 110
    .local v4, "hit":Lcz/msebera/android/httpclient/HeaderIterator;
    invoke-interface {v4}, Lcz/msebera/android/httpclient/HeaderIterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_5e

    .line 111
    const-string v11, "Proxy-Connection"

    invoke-interface {p1, v11}, Lcz/msebera/android/httpclient/HttpResponse;->headerIterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v4

    .line 137
    :cond_5e
    invoke-interface {v4}, Lcz/msebera/android/httpclient/HeaderIterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8e

    .line 139
    :try_start_64
    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/impl/DefaultConnectionReuseStrategy;->createTokenIterator(Lcz/msebera/android/httpclient/HeaderIterator;)Lcz/msebera/android/httpclient/TokenIterator;

    move-result-object v8

    .line 140
    .local v8, "ti":Lcz/msebera/android/httpclient/TokenIterator;
    const/4 v5, 0x0

    .line 141
    .local v5, "keepalive":Z
    :cond_69
    :goto_69
    invoke-interface {v8}, Lcz/msebera/android/httpclient/TokenIterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_87

    .line 142
    invoke-interface {v8}, Lcz/msebera/android/httpclient/TokenIterator;->nextToken()Ljava/lang/String;

    move-result-object v9

    .line 143
    .local v9, "token":Ljava/lang/String;
    const-string v11, "Close"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7d

    .line 144
    const/4 v11, 0x0

    goto :goto_27

    .line 145
    :cond_7d
    const-string v11, "Keep-Alive"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_82
    .catch Lcz/msebera/android/httpclient/ParseException; {:try_start_64 .. :try_end_82} :catch_8b

    move-result v11

    if-eqz v11, :cond_69

    .line 147
    const/4 v5, 0x1

    goto :goto_69

    .line 150
    .end local v9    # "token":Ljava/lang/String;
    :cond_87
    if-eqz v5, :cond_8e

    .line 152
    const/4 v11, 0x1

    goto :goto_27

    .line 156
    .end local v5    # "keepalive":Z
    .end local v8    # "ti":Lcz/msebera/android/httpclient/TokenIterator;
    :catch_8b
    move-exception v6

    .line 159
    .local v6, "px":Lcz/msebera/android/httpclient/ParseException;
    const/4 v11, 0x0

    goto :goto_27

    .line 164
    .end local v6    # "px":Lcz/msebera/android/httpclient/ParseException;
    :cond_8e
    sget-object v11, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/ProtocolVersion;->lessEquals(Lcz/msebera/android/httpclient/ProtocolVersion;)Z

    move-result v11

    if-nez v11, :cond_98

    const/4 v11, 0x1

    goto :goto_27

    :cond_98
    const/4 v11, 0x0

    goto :goto_27
.end method
