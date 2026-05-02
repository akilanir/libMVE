.class public final Lorg/apache/http/util/EntityUtils;
.super Ljava/lang/Object;
.source "EntityUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method public static consume(Lorg/apache/http/HttpEntity;)V
    .registers 3
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    if-nez p0, :cond_3

    .line 88
    :cond_2
    :goto_2
    return-void

    .line 82
    :cond_3
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 83
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 84
    .local v0, "instream":Ljava/io/InputStream;
    if-eqz v0, :cond_2

    .line 85
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_2
.end method

.method public static consumeQuietly(Lorg/apache/http/HttpEntity;)V
    .registers 2
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 64
    :try_start_0
    invoke-static {p0}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 67
    :goto_3
    return-void

    .line 65
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static getContentCharSet(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    .registers 6
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 139
    if-nez p0, :cond_a

    .line 140
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "HTTP entity may not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 142
    :cond_a
    const/4 v0, 0x0

    .line 143
    .local v0, "charset":Ljava/lang/String;
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v3

    if-eqz v3, :cond_2b

    .line 144
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v2

    .line 145
    .local v2, "values":[Lorg/apache/http/HeaderElement;
    array-length v3, v2

    if-lez v3, :cond_2b

    .line 146
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v4, "charset"

    invoke-interface {v3, v4}, Lorg/apache/http/HeaderElement;->getParameterByName(Ljava/lang/String;)Lorg/apache/http/NameValuePair;

    move-result-object v1

    .line 147
    .local v1, "param":Lorg/apache/http/NameValuePair;
    if-eqz v1, :cond_2b

    .line 148
    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 152
    .end local v1    # "param":Lorg/apache/http/NameValuePair;
    .end local v2    # "values":[Lorg/apache/http/HeaderElement;
    :cond_2b
    return-object v0
.end method

.method public static getContentMimeType(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    .registers 5
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 169
    if-nez p0, :cond_a

    .line 170
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "HTTP entity may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 172
    :cond_a
    const/4 v0, 0x0

    .line 173
    .local v0, "mimeType":Ljava/lang/String;
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v2

    if-eqz v2, :cond_23

    .line 174
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .line 175
    .local v1, "values":[Lorg/apache/http/HeaderElement;
    array-length v2, v1

    if-lez v2, :cond_23

    .line 176
    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 179
    .end local v1    # "values":[Lorg/apache/http/HeaderElement;
    :cond_23
    return-object v0
.end method

.method public static toByteArray(Lorg/apache/http/HttpEntity;)[B
    .registers 10
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    if-nez p0, :cond_a

    .line 101
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "HTTP entity may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 103
    :cond_a
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    .line 104
    .local v2, "instream":Ljava/io/InputStream;
    if-nez v2, :cond_12

    .line 105
    const/4 v5, 0x0

    .line 123
    :goto_11
    return-object v5

    .line 108
    :cond_12
    :try_start_12
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v5

    const-wide/32 v7, 0x7fffffff

    cmp-long v5, v5, v7

    if-lez v5, :cond_2a

    .line 109
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "HTTP entity too large to be buffered in memory"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_25
    .catchall {:try_start_12 .. :try_end_25} :catchall_25

    .line 123
    :catchall_25
    move-exception v5

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v5

    .line 111
    :cond_2a
    :try_start_2a
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v5

    long-to-int v1, v5

    .line 112
    .local v1, "i":I
    if-gez v1, :cond_33

    .line 113
    const/16 v1, 0x1000

    .line 115
    :cond_33
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    invoke-direct {v0, v1}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 116
    .local v0, "buffer":Lorg/apache/http/util/ByteArrayBuffer;
    const/16 v5, 0x1000

    new-array v4, v5, [B

    .line 118
    .local v4, "tmp":[B
    :goto_3c
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "l":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_48

    .line 119
    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5, v3}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    goto :goto_3c

    .line 121
    :cond_48
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B
    :try_end_4b
    .catchall {:try_start_2a .. :try_end_4b} :catchall_25

    move-result-object v5

    .line 123
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    goto :goto_11
.end method

.method public static toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    .registers 2
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 264
    const/4 v0, 0x0

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-static {p0, v0}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .param p1, "defaultCharset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 248
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Lorg/apache/http/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 14
    .param p0, "entity"    # Lorg/apache/http/HttpEntity;
    .param p1, "defaultCharset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 197
    if-nez p0, :cond_a

    .line 198
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "HTTP entity may not be null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 200
    :cond_a
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    .line 201
    .local v4, "instream":Ljava/io/InputStream;
    if-nez v4, :cond_12

    .line 202
    const/4 v8, 0x0

    .line 229
    :goto_11
    return-object v8

    .line 205
    :cond_12
    :try_start_12
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v8

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_2a

    .line 206
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "HTTP entity too large to be buffered in memory"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_25
    .catchall {:try_start_12 .. :try_end_25} :catchall_25

    .line 229
    :catchall_25
    move-exception v8

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    throw v8

    .line 208
    :cond_2a
    :try_start_2a
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v8

    long-to-int v3, v8

    .line 209
    .local v3, "i":I
    if-gez v3, :cond_33

    .line 210
    const/16 v3, 0x1000

    .line 212
    :cond_33
    invoke-static {p0}, Lorg/apache/http/entity/ContentType;->getOrDefault(Lorg/apache/http/HttpEntity;)Lorg/apache/http/entity/ContentType;

    move-result-object v2

    .line 213
    .local v2, "contentType":Lorg/apache/http/entity/ContentType;
    invoke-virtual {v2}, Lorg/apache/http/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    .line 214
    .local v1, "charset":Ljava/nio/charset/Charset;
    if-nez v1, :cond_3e

    .line 215
    move-object v1, p1

    .line 217
    :cond_3e
    if-nez v1, :cond_42

    .line 218
    sget-object v1, Lorg/apache/http/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    .line 220
    :cond_42
    new-instance v6, Ljava/io/InputStreamReader;

    invoke-direct {v6, v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 221
    .local v6, "reader":Ljava/io/Reader;
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    invoke-direct {v0, v3}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 222
    .local v0, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    const/16 v8, 0x400

    new-array v7, v8, [C

    .line 224
    .local v7, "tmp":[C
    :goto_50
    invoke-virtual {v6, v7}, Ljava/io/Reader;->read([C)I

    move-result v5

    .local v5, "l":I
    const/4 v8, -0x1

    if-eq v5, v8, :cond_5c

    .line 225
    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8, v5}, Lorg/apache/http/util/CharArrayBuffer;->append([CII)V

    goto :goto_50

    .line 227
    :cond_5c
    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;
    :try_end_5f
    .catchall {:try_start_2a .. :try_end_5f} :catchall_25

    move-result-object v8

    .line 229
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    goto :goto_11
.end method
