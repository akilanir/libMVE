.class public Lcom/koushikdutta/async/http/HttpUtil;
.super Ljava/lang/Object;
.source "HttpUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static contentLength(Lcom/koushikdutta/async/http/Headers;)I
    .registers 5
    .param p0, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    const/4 v2, -0x1

    .line 136
    const-string v3, "Content-Length"

    invoke-virtual {p0, v3}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "cl":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 143
    :goto_9
    return v2

    .line 140
    :cond_a
    :try_start_a
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_d
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_d} :catch_f

    move-result v2

    goto :goto_9

    .line 142
    :catch_f
    move-exception v1

    .line 143
    .local v1, "e":Ljava/lang/NumberFormatException;
    goto :goto_9
.end method

.method public static getBody(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/callback/CompletedCallback;Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    .registers 11
    .param p0, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p1, "reporter"    # Lcom/koushikdutta/async/callback/CompletedCallback;
    .param p2, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 19
    const-string v7, "Content-Type"

    invoke-virtual {p2, v7}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 20
    .local v1, "contentType":Ljava/lang/String;
    if-eqz v1, :cond_5f

    .line 21
    const-string v7, ";"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 22
    .local v6, "values":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    array-length v7, v6

    if-ge v3, v7, :cond_1d

    .line 23
    aget-object v7, v6, v3

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    .line 22
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 25
    :cond_1d
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_20
    if-ge v4, v5, :cond_5f

    aget-object v2, v0, v4

    .line 26
    .local v2, "ct":Ljava/lang/String;
    const-string v7, "application/x-www-form-urlencoded"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_32

    .line 27
    new-instance v7, Lcom/koushikdutta/async/http/body/UrlEncodedFormBody;

    invoke-direct {v7}, Lcom/koushikdutta/async/http/body/UrlEncodedFormBody;-><init>()V

    .line 41
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "ct":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "values":[Ljava/lang/String;
    :goto_31
    return-object v7

    .line 29
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v2    # "ct":Ljava/lang/String;
    .restart local v3    # "i":I
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    .restart local v6    # "values":[Ljava/lang/String;
    :cond_32
    const-string v7, "application/json"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_40

    .line 30
    new-instance v7, Lcom/koushikdutta/async/http/body/JSONObjectBody;

    invoke-direct {v7}, Lcom/koushikdutta/async/http/body/JSONObjectBody;-><init>()V

    goto :goto_31

    .line 32
    :cond_40
    const-string v7, "text/plain"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4e

    .line 33
    new-instance v7, Lcom/koushikdutta/async/http/body/StringBody;

    invoke-direct {v7}, Lcom/koushikdutta/async/http/body/StringBody;-><init>()V

    goto :goto_31

    .line 35
    :cond_4e
    const-string v7, "multipart/form-data"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 36
    new-instance v7, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;

    invoke-direct {v7, v6}, Lcom/koushikdutta/async/http/body/MultipartFormDataBody;-><init>([Ljava/lang/String;)V

    goto :goto_31

    .line 25
    :cond_5c
    add-int/lit8 v4, v4, 0x1

    goto :goto_20

    .line 41
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "ct":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "values":[Ljava/lang/String;
    :cond_5f
    const/4 v7, 0x0

    goto :goto_31
.end method

.method public static getBodyDecoder(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/http/Protocol;Lcom/koushikdutta/async/http/Headers;Z)Lcom/koushikdutta/async/DataEmitter;
    .registers 17
    .param p0, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p1, "protocol"    # Lcom/koushikdutta/async/http/Protocol;
    .param p2, "headers"    # Lcom/koushikdutta/async/http/Headers;
    .param p3, "server"    # Z

    .prologue
    .line 65
    :try_start_0
    const-string v10, "Content-Length"

    invoke-virtual {p2, v10}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_2b

    move-result-wide v0

    .line 70
    .local v0, "_contentLength":J
    :goto_a
    move-wide v3, v0

    .line 71
    .local v3, "contentLength":J
    const-wide/16 v10, -0x1

    cmp-long v10, v10, v3

    if-eqz v10, :cond_64

    .line 72
    const-wide/16 v10, 0x0

    cmp-long v10, v3, v10

    if-gez v10, :cond_2f

    .line 73
    invoke-interface {p0}, Lcom/koushikdutta/async/DataEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v10

    new-instance v11, Lcom/koushikdutta/async/http/BodyDecoderException;

    const-string v12, "not using chunked encoding, and no content-length found."

    invoke-direct {v11, v12}, Lcom/koushikdutta/async/http/BodyDecoderException;-><init>(Ljava/lang/String;)V

    invoke-static {v10, v11}, Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;->create(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/Exception;)Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;

    move-result-object v6

    .line 74
    .local v6, "ender":Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;
    invoke-virtual {v6, p0}, Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 75
    move-object p0, v6

    .line 116
    .end local v6    # "ender":Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;
    :cond_2a
    :goto_2a
    return-object p0

    .line 67
    .end local v0    # "_contentLength":J
    .end local v3    # "contentLength":J
    :catch_2b
    move-exception v7

    .line 68
    .local v7, "ex":Ljava/lang/Exception;
    const-wide/16 v0, -0x1

    .restart local v0    # "_contentLength":J
    goto :goto_a

    .line 78
    .end local v7    # "ex":Ljava/lang/Exception;
    .restart local v3    # "contentLength":J
    :cond_2f
    const-wide/16 v10, 0x0

    cmp-long v10, v3, v10

    if-nez v10, :cond_43

    .line 79
    invoke-interface {p0}, Lcom/koushikdutta/async/DataEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;->create(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/Exception;)Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;

    move-result-object v6

    .line 80
    .restart local v6    # "ender":Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;
    invoke-virtual {v6, p0}, Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 81
    move-object p0, v6

    .line 82
    goto :goto_2a

    .line 84
    .end local v6    # "ender":Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;
    :cond_43
    new-instance v5, Lcom/koushikdutta/async/http/filter/ContentLengthFilter;

    invoke-direct {v5, v3, v4}, Lcom/koushikdutta/async/http/filter/ContentLengthFilter;-><init>(J)V

    .line 85
    .local v5, "contentLengthWatcher":Lcom/koushikdutta/async/http/filter/ContentLengthFilter;
    invoke-virtual {v5, p0}, Lcom/koushikdutta/async/http/filter/ContentLengthFilter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 86
    move-object p0, v5

    .line 103
    .end local v5    # "contentLengthWatcher":Lcom/koushikdutta/async/http/filter/ContentLengthFilter;
    :cond_4c
    :goto_4c
    const-string v10, "gzip"

    const-string v11, "Content-Encoding"

    invoke-virtual {p2, v11}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9e

    .line 104
    new-instance v8, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    invoke-direct {v8}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;-><init>()V

    .line 105
    .local v8, "gunzipper":Lcom/koushikdutta/async/http/filter/GZIPInputFilter;
    invoke-virtual {v8, p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 106
    move-object p0, v8

    .line 107
    goto :goto_2a

    .line 88
    .end local v8    # "gunzipper":Lcom/koushikdutta/async/http/filter/GZIPInputFilter;
    :cond_64
    const-string v10, "chunked"

    const-string v11, "Transfer-Encoding"

    invoke-virtual {p2, v11}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7c

    .line 89
    new-instance v2, Lcom/koushikdutta/async/http/filter/ChunkedInputFilter;

    invoke-direct {v2}, Lcom/koushikdutta/async/http/filter/ChunkedInputFilter;-><init>()V

    .line 90
    .local v2, "chunker":Lcom/koushikdutta/async/http/filter/ChunkedInputFilter;
    invoke-virtual {v2, p0}, Lcom/koushikdutta/async/http/filter/ChunkedInputFilter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 91
    move-object p0, v2

    .line 92
    goto :goto_4c

    .line 94
    .end local v2    # "chunker":Lcom/koushikdutta/async/http/filter/ChunkedInputFilter;
    :cond_7c
    if-nez p3, :cond_82

    sget-object v10, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    if-ne p1, v10, :cond_4c

    :cond_82
    const-string v10, "close"

    const-string v11, "Connection"

    invoke-virtual {p2, v11}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_4c

    .line 96
    invoke-interface {p0}, Lcom/koushikdutta/async/DataEmitter;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {v10, v11}, Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;->create(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/Exception;)Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;

    move-result-object v6

    .line 97
    .restart local v6    # "ender":Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;
    invoke-virtual {v6, p0}, Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 98
    move-object p0, v6

    .line 99
    goto :goto_2a

    .line 108
    .end local v6    # "ender":Lcom/koushikdutta/async/http/HttpUtil$EndEmitter;
    :cond_9e
    const-string v10, "deflate"

    const-string v11, "Content-Encoding"

    invoke-virtual {p2, v11}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2a

    .line 109
    new-instance v9, Lcom/koushikdutta/async/http/filter/InflaterInputFilter;

    invoke-direct {v9}, Lcom/koushikdutta/async/http/filter/InflaterInputFilter;-><init>()V

    .line 110
    .local v9, "inflater":Lcom/koushikdutta/async/http/filter/InflaterInputFilter;
    invoke-virtual {v9, p0}, Lcom/koushikdutta/async/http/filter/InflaterInputFilter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    .line 111
    move-object p0, v9

    goto/16 :goto_2a
.end method

.method public static isKeepAlive(Lcom/koushikdutta/async/http/Protocol;Lcom/koushikdutta/async/http/Headers;)Z
    .registers 4
    .param p0, "protocol"    # Lcom/koushikdutta/async/http/Protocol;
    .param p1, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 121
    const-string v1, "Connection"

    invoke-virtual {p1, v1}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "connection":Ljava/lang/String;
    if-nez v0, :cond_10

    .line 123
    sget-object v1, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    if-ne p0, v1, :cond_e

    const/4 v1, 0x1

    .line 124
    :goto_d
    return v1

    .line 123
    :cond_e
    const/4 v1, 0x0

    goto :goto_d

    .line 124
    :cond_10
    const-string v1, "keep-alive"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_d
.end method

.method public static isKeepAlive(Ljava/lang/String;Lcom/koushikdutta/async/http/Headers;)Z
    .registers 5
    .param p0, "protocol"    # Ljava/lang/String;
    .param p1, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 129
    const-string v1, "Connection"

    invoke-virtual {p1, v1}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "connection":Ljava/lang/String;
    if-nez v0, :cond_14

    .line 131
    invoke-static {p0}, Lcom/koushikdutta/async/http/Protocol;->get(Ljava/lang/String;)Lcom/koushikdutta/async/http/Protocol;

    move-result-object v1

    sget-object v2, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    if-ne v1, v2, :cond_12

    const/4 v1, 0x1

    .line 132
    :goto_11
    return v1

    .line 131
    :cond_12
    const/4 v1, 0x0

    goto :goto_11

    .line 132
    :cond_14
    const-string v1, "keep-alive"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_11
.end method
