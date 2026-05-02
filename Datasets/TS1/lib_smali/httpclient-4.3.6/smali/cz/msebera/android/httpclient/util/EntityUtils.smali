.class public final Lcz/msebera/android/httpclient/util/EntityUtils;
.super Ljava/lang/Object;
.source "EntityUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    return-void
.end method

.method public static consume(Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 3
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    if-nez p0, :cond_3

    .line 91
    :cond_2
    :goto_2
    return-void

    .line 85
    :cond_3
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->isStreaming()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 86
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 87
    .local v0, "instream":Ljava/io/InputStream;
    if-eqz v0, :cond_2

    .line 88
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_2
.end method

.method public static consumeQuietly(Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 2
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;

    .prologue
    .line 67
    :try_start_0
    invoke-static {p0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 70
    :goto_3
    return-void

    .line 68
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static getContentCharSet(Lcz/msebera/android/httpclient/HttpEntity;)Ljava/lang/String;
    .registers 6
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 157
    const-string v3, "Entity"

    invoke-static {p0, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 158
    const/4 v0, 0x0

    .line 159
    .local v0, "charset":Ljava/lang/String;
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentType()Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    if-eqz v3, :cond_26

    .line 160
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentType()Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v2

    .line 161
    .local v2, "values":[Lcz/msebera/android/httpclient/HeaderElement;
    array-length v3, v2

    if-lez v3, :cond_26

    .line 162
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v4, "charset"

    invoke-interface {v3, v4}, Lcz/msebera/android/httpclient/HeaderElement;->getParameterByName(Ljava/lang/String;)Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v1

    .line 163
    .local v1, "param":Lcz/msebera/android/httpclient/NameValuePair;
    if-eqz v1, :cond_26

    .line 164
    invoke-interface {v1}, Lcz/msebera/android/httpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 168
    .end local v1    # "param":Lcz/msebera/android/httpclient/NameValuePair;
    .end local v2    # "values":[Lcz/msebera/android/httpclient/HeaderElement;
    :cond_26
    return-object v0
.end method

.method public static getContentMimeType(Lcz/msebera/android/httpclient/HttpEntity;)Ljava/lang/String;
    .registers 4
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 185
    const-string v2, "Entity"

    invoke-static {p0, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 186
    const/4 v0, 0x0

    .line 187
    .local v0, "mimeType":Ljava/lang/String;
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentType()Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    if-eqz v2, :cond_1e

    .line 188
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentType()Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v1

    .line 189
    .local v1, "values":[Lcz/msebera/android/httpclient/HeaderElement;
    array-length v2, v1

    if-lez v2, :cond_1e

    .line 190
    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 193
    .end local v1    # "values":[Lcz/msebera/android/httpclient/HeaderElement;
    :cond_1e
    return-object v0
.end method

.method public static toByteArray(Lcz/msebera/android/httpclient/HttpEntity;)[B
    .registers 11
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 121
    const-string v6, "Entity"

    invoke-static {p0, v6}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 122
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    .line 123
    .local v2, "instream":Ljava/io/InputStream;
    if-nez v2, :cond_e

    .line 124
    const/4 v5, 0x0

    .line 141
    :goto_d
    return-object v5

    .line 127
    :cond_e
    :try_start_e
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v6

    const-wide/32 v8, 0x7fffffff

    cmp-long v6, v6, v8

    if-gtz v6, :cond_1a

    const/4 v5, 0x1

    :cond_1a
    const-string v6, "HTTP entity too large to be buffered in memory"

    invoke-static {v5, v6}, Lcz/msebera/android/httpclient/util/Args;->check(ZLjava/lang/String;)V

    .line 129
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v5

    long-to-int v1, v5

    .line 130
    .local v1, "i":I
    if-gez v1, :cond_28

    .line 131
    const/16 v1, 0x1000

    .line 133
    :cond_28
    new-instance v0, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;-><init>(I)V

    .line 134
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/ByteArrayBuffer;
    const/16 v5, 0x1000

    new-array v4, v5, [B

    .line 136
    .local v4, "tmp":[B
    :goto_31
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "l":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_42

    .line 137
    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5, v3}, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;->append([BII)V
    :try_end_3c
    .catchall {:try_start_e .. :try_end_3c} :catchall_3d

    goto :goto_31

    .line 141
    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/ByteArrayBuffer;
    .end local v1    # "i":I
    .end local v3    # "l":I
    .end local v4    # "tmp":[B
    :catchall_3d
    move-exception v5

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v5

    .line 139
    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/ByteArrayBuffer;
    .restart local v1    # "i":I
    .restart local v3    # "l":I
    .restart local v4    # "tmp":[B
    :cond_42
    :try_start_42
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/ByteArrayBuffer;->toByteArray()[B
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_3d

    move-result-object v5

    .line 141
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    goto :goto_d
.end method

.method public static toString(Lcz/msebera/android/httpclient/HttpEntity;)Ljava/lang/String;
    .registers 2
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .prologue
    .line 288
    const/4 v0, 0x0

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->toString(Lcz/msebera/android/httpclient/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Lcz/msebera/android/httpclient/HttpEntity;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .param p1, "defaultCharset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .prologue
    .line 270
    if-eqz p1, :cond_b

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_6
    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->toString(Lcz/msebera/android/httpclient/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static toString(Lcz/msebera/android/httpclient/HttpEntity;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 16
    .param p0, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .param p1, "defaultCharset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/ParseException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 213
    const-string v10, "Entity"

    invoke-static {p0, v10}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 214
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 215
    .local v5, "instream":Ljava/io/InputStream;
    if-nez v5, :cond_e

    .line 216
    const/4 v9, 0x0

    .line 249
    :goto_d
    return-object v9

    .line 219
    :cond_e
    :try_start_e
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v10

    const-wide/32 v12, 0x7fffffff

    cmp-long v10, v10, v12

    if-gtz v10, :cond_1a

    const/4 v9, 0x1

    :cond_1a
    const-string v10, "HTTP entity too large to be buffered in memory"

    invoke-static {v9, v10}, Lcz/msebera/android/httpclient/util/Args;->check(ZLjava/lang/String;)V

    .line 221
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J
    :try_end_22
    .catchall {:try_start_e .. :try_end_22} :catchall_54

    move-result-wide v9

    long-to-int v4, v9

    .line 222
    .local v4, "i":I
    if-gez v4, :cond_28

    .line 223
    const/16 v4, 0x1000

    .line 225
    :cond_28
    const/4 v1, 0x0

    .line 227
    .local v1, "charset":Ljava/nio/charset/Charset;
    :try_start_29
    invoke-static {p0}, Lcz/msebera/android/httpclient/entity/ContentType;->get(Lcz/msebera/android/httpclient/HttpEntity;)Lcz/msebera/android/httpclient/entity/ContentType;

    move-result-object v2

    .line 228
    .local v2, "contentType":Lcz/msebera/android/httpclient/entity/ContentType;
    if-eqz v2, :cond_33

    .line 229
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;
    :try_end_32
    .catch Ljava/nio/charset/UnsupportedCharsetException; {:try_start_29 .. :try_end_32} :catch_59
    .catchall {:try_start_29 .. :try_end_32} :catchall_54

    move-result-object v1

    .line 234
    :cond_33
    if-nez v1, :cond_36

    .line 235
    move-object v1, p1

    .line 237
    :cond_36
    if-nez v1, :cond_3a

    .line 238
    :try_start_38
    sget-object v1, Lcz/msebera/android/httpclient/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    .line 240
    :cond_3a
    new-instance v7, Ljava/io/InputStreamReader;

    invoke-direct {v7, v5, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 241
    .local v7, "reader":Ljava/io/Reader;
    new-instance v0, Lcz/msebera/android/httpclient/util/CharArrayBuffer;

    invoke-direct {v0, v4}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;-><init>(I)V

    .line 242
    .local v0, "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    const/16 v9, 0x400

    new-array v8, v9, [C

    .line 244
    .local v8, "tmp":[C
    :goto_48
    invoke-virtual {v7, v8}, Ljava/io/Reader;->read([C)I

    move-result v6

    .local v6, "l":I
    const/4 v9, -0x1

    if-eq v6, v9, :cond_64

    .line 245
    const/4 v9, 0x0

    invoke-virtual {v0, v8, v9, v6}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->append([CII)V
    :try_end_53
    .catchall {:try_start_38 .. :try_end_53} :catchall_54

    goto :goto_48

    .line 249
    .end local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .end local v1    # "charset":Ljava/nio/charset/Charset;
    .end local v2    # "contentType":Lcz/msebera/android/httpclient/entity/ContentType;
    .end local v4    # "i":I
    .end local v6    # "l":I
    .end local v7    # "reader":Ljava/io/Reader;
    .end local v8    # "tmp":[C
    :catchall_54
    move-exception v9

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    throw v9

    .line 231
    .restart local v1    # "charset":Ljava/nio/charset/Charset;
    .restart local v4    # "i":I
    :catch_59
    move-exception v3

    .line 232
    .local v3, "ex":Ljava/nio/charset/UnsupportedCharsetException;
    :try_start_5a
    new-instance v9, Ljava/io/UnsupportedEncodingException;

    invoke-virtual {v3}, Ljava/nio/charset/UnsupportedCharsetException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 247
    .end local v3    # "ex":Ljava/nio/charset/UnsupportedCharsetException;
    .restart local v0    # "buffer":Lcz/msebera/android/httpclient/util/CharArrayBuffer;
    .restart local v2    # "contentType":Lcz/msebera/android/httpclient/entity/ContentType;
    .restart local v6    # "l":I
    .restart local v7    # "reader":Ljava/io/Reader;
    .restart local v8    # "tmp":[C
    :cond_64
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/util/CharArrayBuffer;->toString()Ljava/lang/String;
    :try_end_67
    .catchall {:try_start_5a .. :try_end_67} :catchall_54

    move-result-object v9

    .line 249
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    goto :goto_d
.end method

.method public static updateEntity(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 3
    .param p0, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p1, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    const-string v0, "Response"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 107
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 108
    invoke-interface {p0, p1}, Lcz/msebera/android/httpclient/HttpResponse;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 109
    return-void
.end method
