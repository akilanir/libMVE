.class public Lorg/apache/http/impl/DefaultConnectionReuseStrategy;
.super Ljava/lang/Object;
.source "DefaultConnectionReuseStrategy.java"

# interfaces
.implements Lorg/apache/http/ConnectionReuseStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    return-void
.end method


# virtual methods
.method protected createTokenIterator(Lorg/apache/http/HeaderIterator;)Lorg/apache/http/TokenIterator;
    .registers 3
    .param p1, "hit"    # Lorg/apache/http/HeaderIterator;

    .prologue
    .line 174
    new-instance v0, Lorg/apache/http/message/BasicTokenIterator;

    invoke-direct {v0, p1}, Lorg/apache/http/message/BasicTokenIterator;-><init>(Lorg/apache/http/HeaderIterator;)V

    return-object v0
.end method

.method public keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 16
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 71
    if-nez p1, :cond_a

    .line 72
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "HTTP response may not be null."

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 75
    :cond_a
    if-nez p2, :cond_14

    .line 76
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "HTTP context may not be null."

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 82
    :cond_14
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v10

    .line 83
    .local v10, "ver":Lorg/apache/http/ProtocolVersion;
    const-string v11, "Transfer-Encoding"

    invoke-interface {p1, v11}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v7

    .line 84
    .local v7, "teh":Lorg/apache/http/Header;
    if-eqz v7, :cond_32

    .line 85
    const-string v11, "chunked"

    invoke-interface {v7}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_52

    .line 86
    const/4 v11, 0x0

    .line 160
    :goto_31
    return v11

    .line 89
    :cond_32
    const-string v11, "Content-Length"

    invoke-interface {p1, v11}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v1

    .line 91
    .local v1, "clhs":[Lorg/apache/http/Header;
    if-eqz v1, :cond_3e

    array-length v11, v1

    const/4 v12, 0x1

    if-eq v11, v12, :cond_40

    .line 92
    :cond_3e
    const/4 v11, 0x0

    goto :goto_31

    .line 94
    :cond_40
    const/4 v11, 0x0

    aget-object v0, v1, v11

    .line 96
    .local v0, "clh":Lorg/apache/http/Header;
    :try_start_43
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_4a
    .catch Ljava/lang/NumberFormatException; {:try_start_43 .. :try_end_4a} :catch_4f

    move-result v2

    .line 97
    .local v2, "contentLen":I
    if-gez v2, :cond_52

    .line 98
    const/4 v11, 0x0

    goto :goto_31

    .line 100
    .end local v2    # "contentLen":I
    :catch_4f
    move-exception v3

    .line 101
    .local v3, "ex":Ljava/lang/NumberFormatException;
    const/4 v11, 0x0

    goto :goto_31

    .line 108
    .end local v0    # "clh":Lorg/apache/http/Header;
    .end local v1    # "clhs":[Lorg/apache/http/Header;
    .end local v3    # "ex":Ljava/lang/NumberFormatException;
    :cond_52
    const-string v11, "Connection"

    invoke-interface {p1, v11}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v4

    .line 109
    .local v4, "hit":Lorg/apache/http/HeaderIterator;
    invoke-interface {v4}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_64

    .line 110
    const-string v11, "Proxy-Connection"

    invoke-interface {p1, v11}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v4

    .line 135
    :cond_64
    invoke-interface {v4}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_94

    .line 137
    :try_start_6a
    invoke-virtual {p0, v4}, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;->createTokenIterator(Lorg/apache/http/HeaderIterator;)Lorg/apache/http/TokenIterator;

    move-result-object v8

    .line 138
    .local v8, "ti":Lorg/apache/http/TokenIterator;
    const/4 v5, 0x0

    .line 139
    .local v5, "keepalive":Z
    :cond_6f
    :goto_6f
    invoke-interface {v8}, Lorg/apache/http/TokenIterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8d

    .line 140
    invoke-interface {v8}, Lorg/apache/http/TokenIterator;->nextToken()Ljava/lang/String;

    move-result-object v9

    .line 141
    .local v9, "token":Ljava/lang/String;
    const-string v11, "Close"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_83

    .line 142
    const/4 v11, 0x0

    goto :goto_31

    .line 143
    :cond_83
    const-string v11, "Keep-Alive"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_88
    .catch Lorg/apache/http/ParseException; {:try_start_6a .. :try_end_88} :catch_91

    move-result v11

    if-eqz v11, :cond_6f

    .line 145
    const/4 v5, 0x1

    goto :goto_6f

    .line 148
    .end local v9    # "token":Ljava/lang/String;
    :cond_8d
    if-eqz v5, :cond_94

    .line 149
    const/4 v11, 0x1

    goto :goto_31

    .line 152
    .end local v5    # "keepalive":Z
    .end local v8    # "ti":Lorg/apache/http/TokenIterator;
    :catch_91
    move-exception v6

    .line 155
    .local v6, "px":Lorg/apache/http/ParseException;
    const/4 v11, 0x0

    goto :goto_31

    .line 160
    .end local v6    # "px":Lorg/apache/http/ParseException;
    :cond_94
    sget-object v11, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v10, v11}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v11

    if-nez v11, :cond_9e

    const/4 v11, 0x1

    goto :goto_31

    :cond_9e
    const/4 v11, 0x0

    goto :goto_31
.end method
