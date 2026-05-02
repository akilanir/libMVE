.class public final Lcom/squareup/okhttp/internal/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field public static final EMPTY_BYTE_ARRAY:[B

.field public static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field public static final UTF_8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 44
    new-array v0, v1, [B

    sput-object v0, Lcom/squareup/okhttp/internal/Util;->EMPTY_BYTE_ARRAY:[B

    .line 45
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lcom/squareup/okhttp/internal/Util;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 48
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method public static checkOffsetAndCount(JJJ)V
    .registers 10
    .param p0, "arrayLength"    # J
    .param p2, "offset"    # J
    .param p4, "count"    # J

    .prologue
    .line 54
    or-long v0, p2, p4

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_12

    cmp-long v0, p2, p0

    if-gtz v0, :cond_12

    sub-long v0, p0, p2

    cmp-long v0, v0, p4

    if-gez v0, :cond_18

    .line 55
    :cond_12
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 57
    :cond_18
    return-void
.end method

.method public static closeAll(Ljava/io/Closeable;Ljava/io/Closeable;)V
    .registers 5
    .param p0, "a"    # Ljava/io/Closeable;
    .param p1, "b"    # Ljava/io/Closeable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    const/4 v1, 0x0

    .line 118
    .local v1, "thrown":Ljava/lang/Throwable;
    :try_start_1
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_4} :catch_a

    .line 123
    :goto_4
    :try_start_4
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_7} :catch_d

    .line 127
    :cond_7
    :goto_7
    if-nez v1, :cond_12

    return-void

    .line 119
    :catch_a
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Throwable;
    move-object v1, v0

    goto :goto_4

    .line 124
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_d
    move-exception v0

    .line 125
    .restart local v0    # "e":Ljava/lang/Throwable;
    if-nez v1, :cond_7

    move-object v1, v0

    goto :goto_7

    .line 128
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_12
    instance-of v2, v1, Ljava/io/IOException;

    if-eqz v2, :cond_19

    check-cast v1, Ljava/io/IOException;

    .end local v1    # "thrown":Ljava/lang/Throwable;
    throw v1

    .line 129
    .restart local v1    # "thrown":Ljava/lang/Throwable;
    :cond_19
    instance-of v2, v1, Ljava/lang/RuntimeException;

    if-eqz v2, :cond_20

    check-cast v1, Ljava/lang/RuntimeException;

    .end local v1    # "thrown":Ljava/lang/Throwable;
    throw v1

    .line 130
    .restart local v1    # "thrown":Ljava/lang/Throwable;
    :cond_20
    instance-of v2, v1, Ljava/lang/Error;

    if-eqz v2, :cond_27

    check-cast v1, Ljava/lang/Error;

    .end local v1    # "thrown":Ljava/lang/Throwable;
    throw v1

    .line 131
    .restart local v1    # "thrown":Ljava/lang/Throwable;
    :cond_27
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .registers 3
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 69
    if-eqz p0, :cond_5

    .line 71
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_8

    .line 77
    :cond_5
    :goto_5
    return-void

    .line 72
    :catch_6
    move-exception v0

    .line 73
    .local v0, "rethrown":Ljava/lang/RuntimeException;
    throw v0

    .line 74
    .end local v0    # "rethrown":Ljava/lang/RuntimeException;
    :catch_8
    move-exception v1

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/net/ServerSocket;)V
    .registers 3
    .param p0, "serverSocket"    # Ljava/net/ServerSocket;

    .prologue
    .line 101
    if-eqz p0, :cond_5

    .line 103
    :try_start_2
    invoke-virtual {p0}, Ljava/net/ServerSocket;->close()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_8

    .line 109
    :cond_5
    :goto_5
    return-void

    .line 104
    :catch_6
    move-exception v0

    .line 105
    .local v0, "rethrown":Ljava/lang/RuntimeException;
    throw v0

    .line 106
    .end local v0    # "rethrown":Ljava/lang/RuntimeException;
    :catch_8
    move-exception v1

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/net/Socket;)V
    .registers 4
    .param p0, "socket"    # Ljava/net/Socket;

    .prologue
    .line 84
    if-eqz p0, :cond_5

    .line 86
    :try_start_2
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_5
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_5} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_5} :catch_e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_10

    .line 94
    :cond_5
    :goto_5
    return-void

    .line 87
    :catch_6
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/AssertionError;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z

    move-result v2

    if-nez v2, :cond_5

    throw v0

    .line 89
    .end local v0    # "e":Ljava/lang/AssertionError;
    :catch_e
    move-exception v1

    .line 90
    .local v1, "rethrown":Ljava/lang/RuntimeException;
    throw v1

    .line 91
    .end local v1    # "rethrown":Ljava/lang/RuntimeException;
    :catch_10
    move-exception v2

    goto :goto_5
.end method

.method public static discard(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z
    .registers 5
    .param p0, "source"    # Lokio/Source;
    .param p1, "timeout"    # I
    .param p2, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 141
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/squareup/okhttp/internal/Util;->skipAll(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result v1

    .line 143
    :goto_4
    return v1

    .line 142
    :catch_5
    move-exception v0

    .line 143
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public static equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 61
    if-eq p0, p1, :cond_a

    if-eqz p0, :cond_c

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static hostHeader(Lcom/squareup/okhttp/HttpUrl;)Ljava/lang/String;
    .registers 3
    .param p0, "url"    # Lcom/squareup/okhttp/HttpUrl;

    .prologue
    .line 261
    invoke-virtual {p0}, Lcom/squareup/okhttp/HttpUrl;->port()I

    move-result v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_2e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 262
    invoke-virtual {p0}, Lcom/squareup/okhttp/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/HttpUrl;->port()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 263
    :goto_2d
    return-object v0

    :cond_2e
    invoke-virtual {p0}, Lcom/squareup/okhttp/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    goto :goto_2d
.end method

.method public static immutableList(Ljava/util/List;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 209
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static varargs immutableList([Ljava/lang/Object;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 214
    .local p0, "elements":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static immutableMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;TV;>;)",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static intersect([Ljava/lang/Object;[Ljava/lang/Object;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;[TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "first":[Ljava/lang/Object;, "[TT;"
    .local p1, "second":[Ljava/lang/Object;, "[TT;"
    const/4 v4, 0x0

    .line 247
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 248
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    array-length v6, p0

    move v5, v4

    :goto_8
    if-ge v5, v6, :cond_22

    aget-object v0, p0, v5

    .line 249
    .local v0, "a":Ljava/lang/Object;, "TT;"
    array-length v7, p1

    move v3, v4

    :goto_e
    if-ge v3, v7, :cond_1b

    aget-object v1, p1, v3

    .line 250
    .local v1, "b":Ljava/lang/Object;, "TT;"
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1f

    .line 251
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    .end local v1    # "b":Ljava/lang/Object;, "TT;"
    :cond_1b
    add-int/lit8 v3, v5, 0x1

    move v5, v3

    goto :goto_8

    .line 249
    .restart local v1    # "b":Ljava/lang/Object;, "TT;"
    :cond_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 256
    .end local v0    # "a":Ljava/lang/Object;, "TT;"
    .end local v1    # "b":Ljava/lang/Object;, "TT;"
    :cond_22
    return-object v2
.end method

.method public static intersect(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[TT;[TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 238
    .local p0, "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "first":[Ljava/lang/Object;, "[TT;"
    .local p2, "second":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1, p2}, Lcom/squareup/okhttp/internal/Util;->intersect([Ljava/lang/Object;[Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 239
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {p0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z
    .registers 3
    .param p0, "e"    # Ljava/lang/AssertionError;

    .prologue
    .line 288
    invoke-virtual {p0}, Ljava/lang/AssertionError;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Ljava/lang/AssertionError;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 289
    invoke-virtual {p0}, Ljava/lang/AssertionError;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getsockname failed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public static md5Hex(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 177
    :try_start_0
    const-string v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 178
    .local v2, "messageDigest":Ljava/security/MessageDigest;
    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 179
    .local v1, "md5bytes":[B
    invoke-static {v1}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lokio/ByteString;->hex()Ljava/lang/String;
    :try_end_17
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_17} :catch_19
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v3

    return-object v3

    .line 180
    .end local v1    # "md5bytes":[B
    .end local v2    # "messageDigest":Ljava/security/MessageDigest;
    :catch_19
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public static sha1(Lokio/ByteString;)Lokio/ByteString;
    .registers 5
    .param p0, "s"    # Lokio/ByteString;

    .prologue
    .line 199
    :try_start_0
    const-string v3, "SHA-1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 200
    .local v1, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Lokio/ByteString;->toByteArray()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    .line 201
    .local v2, "sha1Bytes":[B
    invoke-static {v2}, Lokio/ByteString;->of([B)Lokio/ByteString;
    :try_end_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_11} :catch_13

    move-result-object v3

    return-object v3

    .line 202
    .end local v1    # "messageDigest":Ljava/security/MessageDigest;
    .end local v2    # "sha1Bytes":[B
    :catch_13
    move-exception v0

    .line 203
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public static shaBase64(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 188
    :try_start_0
    const-string v3, "SHA-1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 189
    .local v1, "messageDigest":Ljava/security/MessageDigest;
    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    .line 190
    .local v2, "sha1Bytes":[B
    invoke-static {v2}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lokio/ByteString;->base64()Ljava/lang/String;
    :try_end_17
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_17} :catch_19
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v3

    return-object v3

    .line 191
    .end local v1    # "messageDigest":Ljava/security/MessageDigest;
    .end local v2    # "sha1Bytes":[B
    :catch_19
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public static skipAll(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z
    .registers 15
    .param p0, "source"    # Lokio/Source;
    .param p1, "duration"    # I
    .param p2, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide v6, 0x7fffffffffffffffL

    .line 152
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 153
    .local v1, "now":J
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v8

    invoke-virtual {v8}, Lokio/Timeout;->hasDeadline()Z

    move-result v8

    if-eqz v8, :cond_52

    .line 154
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v8

    invoke-virtual {v8}, Lokio/Timeout;->deadlineNanoTime()J

    move-result-wide v8

    sub-long v3, v8, v1

    .line 156
    .local v3, "originalDuration":J
    :goto_1d
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v8

    int-to-long v9, p1

    invoke-virtual {p2, v9, v10}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v9

    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    add-long/2addr v9, v1

    invoke-virtual {v8, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    .line 158
    :try_start_2e
    new-instance v5, Lokio/Buffer;

    invoke-direct {v5}, Lokio/Buffer;-><init>()V

    .line 159
    .local v5, "skipBuffer":Lokio/Buffer;
    :goto_33
    const-wide/16 v8, 0x800

    invoke-interface {p0, v5, v8, v9}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v8

    const-wide/16 v10, -0x1

    cmp-long v8, v8, v10

    if-eqz v8, :cond_54

    .line 160
    invoke-virtual {v5}, Lokio/Buffer;->clear()V
    :try_end_42
    .catch Ljava/io/InterruptedIOException; {:try_start_2e .. :try_end_42} :catch_43
    .catchall {:try_start_2e .. :try_end_42} :catchall_76

    goto :goto_33

    .line 163
    .end local v5    # "skipBuffer":Lokio/Buffer;
    :catch_43
    move-exception v0

    .line 164
    .local v0, "e":Ljava/io/InterruptedIOException;
    const/4 v8, 0x0

    .line 166
    cmp-long v6, v3, v6

    if-nez v6, :cond_6c

    .line 167
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    invoke-virtual {v6}, Lokio/Timeout;->clearDeadline()Lokio/Timeout;

    :goto_50
    move v6, v8

    .line 169
    .end local v0    # "e":Ljava/io/InterruptedIOException;
    :goto_51
    return v6

    .end local v3    # "originalDuration":J
    :cond_52
    move-wide v3, v6

    .line 154
    goto :goto_1d

    .line 162
    .restart local v3    # "originalDuration":J
    .restart local v5    # "skipBuffer":Lokio/Buffer;
    :cond_54
    const/4 v8, 0x1

    .line 166
    cmp-long v6, v3, v6

    if-nez v6, :cond_62

    .line 167
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    invoke-virtual {v6}, Lokio/Timeout;->clearDeadline()Lokio/Timeout;

    :goto_60
    move v6, v8

    .line 169
    goto :goto_51

    :cond_62
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    add-long v9, v1, v3

    invoke-virtual {v6, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    goto :goto_60

    .end local v5    # "skipBuffer":Lokio/Buffer;
    .restart local v0    # "e":Ljava/io/InterruptedIOException;
    :cond_6c
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    add-long v9, v1, v3

    invoke-virtual {v6, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    goto :goto_50

    .line 166
    .end local v0    # "e":Ljava/io/InterruptedIOException;
    :catchall_76
    move-exception v8

    cmp-long v6, v3, v6

    if-nez v6, :cond_83

    .line 167
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    invoke-virtual {v6}, Lokio/Timeout;->clearDeadline()Lokio/Timeout;

    .line 169
    :goto_82
    throw v8

    :cond_83
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    add-long v9, v1, v3

    invoke-virtual {v6, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    goto :goto_82
.end method

.method public static threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "daemon"    # Z

    .prologue
    .line 223
    new-instance v0, Lcom/squareup/okhttp/internal/Util$1;

    invoke-direct {v0, p0, p1}, Lcom/squareup/okhttp/internal/Util$1;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method public static toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x7f

    const/16 v6, 0x1f

    .line 268
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .local v4, "length":I
    :goto_9
    if-ge v2, v4, :cond_3e

    .line 269
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 270
    .local v1, "c":I
    if-le v1, v6, :cond_19

    if-ge v1, v7, :cond_19

    .line 268
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    goto :goto_9

    .line 272
    :cond_19
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 273
    .local v0, "buffer":Lokio/Buffer;
    const/4 v5, 0x0

    invoke-virtual {v0, p0, v5, v2}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    .line 274
    move v3, v2

    .local v3, "j":I
    :goto_23
    if-ge v3, v4, :cond_3a

    .line 275
    invoke-virtual {p0, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 276
    if-le v1, v6, :cond_37

    if-ge v1, v7, :cond_37

    move v5, v1

    :goto_2e
    invoke-virtual {v0, v5}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    .line 274
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v3, v5

    goto :goto_23

    .line 276
    :cond_37
    const/16 v5, 0x3f

    goto :goto_2e

    .line 278
    :cond_3a
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    .line 280
    .end local v0    # "buffer":Lokio/Buffer;
    .end local v1    # "c":I
    .end local v3    # "j":I
    .end local p0    # "s":Ljava/lang/String;
    :cond_3e
    return-object p0
.end method
